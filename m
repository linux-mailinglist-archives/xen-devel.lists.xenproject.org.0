Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 713551E7C00
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:34:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedHe-0002XQ-QW; Fri, 29 May 2020 11:34:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jedHd-0002WP-RE
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:34:41 +0000
X-Inumbo-ID: 4687f11c-a1a0-11ea-9dbe-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4687f11c-a1a0-11ea-9dbe-bc764e2007e4;
 Fri, 29 May 2020 11:33:54 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3U-0003xZ-MT; Fri, 29 May 2020 12:20:04 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 31/49] overlay-initrd-buster/sbin/reopen-console: Fix
 #932416
Date: Fri, 29 May 2020 12:19:27 +0100
Message-Id: <20200529111945.21394-32-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
References: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
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

This bug affects us.  Cherry pick the changes to the relevant file
from the commit in the upstream debian-installer repo:

  https://salsa.debian.org/installer-team/rootskel/commit/0ee43d05b83f8ef5a856f3282e002a111809cef9

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 overlay-initrd-buster/sbin/reopen-console | 36 +++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/overlay-initrd-buster/sbin/reopen-console b/overlay-initrd-buster/sbin/reopen-console
index dd354deb..13b15a33 100755
--- a/overlay-initrd-buster/sbin/reopen-console
+++ b/overlay-initrd-buster/sbin/reopen-console
@@ -16,6 +16,17 @@ NL="
 LOGGER_UP=0
 LOG_FILE=/var/log/reopen-console
 
+# If we're running with preseeding, we have a problem with running d-i
+# on multiple consoles. We'll end up running each of those d-i
+# instances in parallel with all kinds of hilarious undefined
+# behaviour as they trip over each other! If we detect that we're
+# preseeding (via any of the possible preseed methods), DO NOT run d-i
+# multiple times. Instead, fall back to the older, more simple
+# behaviour and run it once. If the user wants to see or interact with
+# their preseed on a specific console, they get to tell us which one
+# they want to use.
+PRESEEDING=0
+
 log() {
 	# In very early startup we don't have syslog. Log to file that
 	# we can flush out later so we can at least see what happened
@@ -32,6 +43,20 @@ flush_logger () {
 	rm $LOG_FILE
 }
 
+# If we have a preseed.cfg in the initramfs
+if [ -e /preseed.cfg ]; then
+    log "Found /preseed.cfg; falling back to simple mode for preseeding"
+    PRESEEDING=1
+fi
+
+# Have we been told to do preseeding stuff on the boot command line?
+for WORD in auto url; do
+    if (grep -qw "$WORD" /proc/cmdline); then
+	log "Found \"$WORD\" in the command line; falling back to simple mode for preseeding"
+	PRESEEDING=1
+    fi
+done
+
 consoles=
 preferred=
 # Retrieve all enabled consoles from kernel; ignore those
@@ -44,7 +69,7 @@ do
 	status=$(echo "$kernelconsoles" | grep $cons | sed -n -r -e 's/(^.*) *.*\((.*)\).*$/\2/p' )
 	if [ -e "/dev/$cons" ] && [ $(echo "$status" | grep -o 'E') ]; then
 		consoles="${consoles:+$consoles$NL}$cons"
-		log "   Adding $cons to consoles list"
+		log "   Adding $cons to possible consoles list"
 	fi
 	# 'C' console is 'most prefered'.
 	if [ $(echo "$status" | grep -o 'C') ]; then
@@ -64,6 +89,13 @@ if [ -z "$preferred" ]; then
 	log "Found no preferred console. Picking $preferred"
 fi
 
+# If we're preseeding, do simple stuff here (see above). We just
+# want one console. Let's pick the preferred one ONLY
+if [ $PRESEEDING = 1 ]; then
+    log "Running with preseeding. Picking preferred $preferred ONLY"
+    consoles=$preferred
+fi
+
 for cons in $consoles
 do
 	echo "/dev/$cons " >> /var/run/console-devices
@@ -88,7 +120,7 @@ LOGGER_UP=1
 flush_logger
 
 # Finally restart init to run debian-installer on discovered consoles
-log "Restarting init to start d-i on the consoles we found"
+log "Restarting init to start d-i on the console(s) we found"
 kill -HUP 1
 
 exit 0
-- 
2.20.1


