#! /bin/bash
# Launch XBMC in windowed mode, then use wmctrl to remove the titlebar

# Select display 1
DISPLAY=:0.0

# Start XBMC without blocking this script
xbmc &

# Wait for the XBMC window to appear
status=0
while [ $status -eq 0 ]
do
	sleep 1
	status=`wmctrl -x -l | grep "XBMC Media Center" | wc -l | awk '{print $1}'`
done

# Force XBMC window to fullscreen
wmctrl -x -r XBMC Media Center.XBMC Media Center -b toggle,fullscreen
