Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8571DA09F
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 21:10:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb7cq-0006PT-QM; Tue, 19 May 2020 19:10:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+xc8=7B=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jb7cp-0006FG-IF
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 19:10:03 +0000
X-Inumbo-ID: 46d66bc4-9a04-11ea-b9cf-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46d66bc4-9a04-11ea-b9cf-bc764e2007e4;
 Tue, 19 May 2020 19:09:35 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jb7Vj-0001da-Fu; Tue, 19 May 2020 20:02:43 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 30/38] overlay-initrd-buster/sbin/reopen-console: Copy
 from Debian
Date: Tue, 19 May 2020 20:02:22 +0100
Message-Id: <20200519190230.29519-31-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
References: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

We are going to patch this file to work around a bug, using the new
overlay mechanism.

The first step is to include the file in our overlay so we overwrite
it.  Currently, this is a no-op, so no functional change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 overlay-initrd-buster/sbin/reopen-console | 94 +++++++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100755 overlay-initrd-buster/sbin/reopen-console

diff --git a/overlay-initrd-buster/sbin/reopen-console b/overlay-initrd-buster/sbin/reopen-console
new file mode 100755
index 00000000..dd354deb
--- /dev/null
+++ b/overlay-initrd-buster/sbin/reopen-console
@@ -0,0 +1,94 @@
+#!/bin/sh
+
+# First find the enabled consoles from the kernel, noting if one is 'preferred'
+# Record these.
+# Run the startup scripts on the preferred console
+
+# In order to have D-I appear on all consoles, modify the inittab to
+# add one entry for each console, running debian-installer.
+# Finally HUP init so that it runs those installers
+# (but doesn't rerun the sysinit startup stuff, including this script)
+
+
+NL="
+"
+
+LOGGER_UP=0
+LOG_FILE=/var/log/reopen-console
+
+log() {
+	# In very early startup we don't have syslog. Log to file that
+	# we can flush out later so we can at least see what happened
+	# at early startup
+	if [ $LOGGER_UP -eq 1 ]; then
+	        logger -t reopen-console "$@"
+	else
+		echo "$@" >> $LOG_FILE
+	fi
+}
+
+flush_logger () {
+	cat $LOG_FILE | logger -t reopen-console
+	rm $LOG_FILE
+}
+
+consoles=
+preferred=
+# Retrieve all enabled consoles from kernel; ignore those
+# for which no device file exists
+
+kernelconsoles="$(cat /proc/consoles)"
+for cons in $(echo "$kernelconsoles" | sed -n -r -e 's/(^.*)  .*\((.*)\).*$/\1/p' )
+do
+	log "Looking at console $cons from /proc/consoles"
+	status=$(echo "$kernelconsoles" | grep $cons | sed -n -r -e 's/(^.*) *.*\((.*)\).*$/\2/p' )
+	if [ -e "/dev/$cons" ] && [ $(echo "$status" | grep -o 'E') ]; then
+		consoles="${consoles:+$consoles$NL}$cons"
+		log "   Adding $cons to consoles list"
+	fi
+	# 'C' console is 'most prefered'.
+	if [ $(echo "$status" | grep -o 'C') ]; then
+		preferred="$cons"
+		log "   $cons is preferred"
+	fi
+done
+
+if [ -z "$consoles" ]; then
+	# Nothing found? Default to /dev/console.
+	log "Found no consoles! Defaulting to /dev/console"
+	consoles=console
+fi
+if [ -z "$preferred" ]; then
+	#None marked preferred? Use the first one
+	preferred=$(echo "$consoles" | head -n 1)
+	log "Found no preferred console. Picking $preferred"
+fi
+
+for cons in $consoles
+do
+	echo "/dev/$cons " >> /var/run/console-devices
+done
+echo "/dev/$preferred " > /var/run/console-preferred
+
+
+# Add debian-installer lines into inittab - one per console
+for cons in $consoles
+do
+	log "Adding inittab entry for $cons"
+	echo "$cons::respawn:/sbin/debian-installer" >> /etc/inittab
+done
+
+# Run the startup scripts once, using the preferred console
+cons=$(cat /var/run/console-preferred)
+# Some other session may have that console as ctty. Steal it from them
+/sbin/steal-ctty $cons "$@"
+
+# Now we should have syslog running, so flush our log entries
+LOGGER_UP=1
+flush_logger
+
+# Finally restart init to run debian-installer on discovered consoles
+log "Restarting init to start d-i on the consoles we found"
+kill -HUP 1
+
+exit 0
-- 
2.20.1


