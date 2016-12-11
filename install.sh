#!/bin/bash

# Welcome message
echo -e "Installing \"check\" by v14r\n"

# Check platform
if [[ ! `grep "Red Hat Enterprise Linux Server" /etc/redhat-release` ]]; then
	echo "[ERR] This tool is incompatible with non-RHEL systems. Exiting."
	exit 2
else
	echo "[INF] Compatible platform detected. Good!"
fi

# Check previous installations
if [[ -f "/usr/bin/check" ]]; then
	echo "[WRN] Previous version detected (/usr/bin/check)."
	read -p "Would you like to continue? [y/N]" -n 1 -r
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		echo -e "\nAborting. Goodbye!"
		exit 1
	else
		echo -e "\n[INF] Proceeding"
	fi
else
	echo "[INF] No previous version detected. Good!"
fi

# Dependencies
echo "[INF] Installing PyYAML"
yum -y install python-yaml

# Installation
echo "[INF] Copying files"
cp check /usr/bin/check
chmod 755 /usr/bin/check

# Finalizing
echo "[INF] Done!"
exit 0
