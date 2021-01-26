Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CA3304C8C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 23:48:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75596.136112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4X8X-0001RE-Cp; Tue, 26 Jan 2021 22:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75596.136112; Tue, 26 Jan 2021 22:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4X8X-0001Qn-9F; Tue, 26 Jan 2021 22:48:37 +0000
Received: by outflank-mailman (input) for mailman id 75596;
 Tue, 26 Jan 2021 22:48:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3HxG=G5=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1l4X8V-0001QY-Of
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 22:48:35 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b2cc996-6cd5-4dea-b437-9f0bda14d2a6;
 Tue, 26 Jan 2021 22:48:34 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10QMmWQ4012495;
 Tue, 26 Jan 2021 23:48:32 +0100 (CET)
Received: from borneo.soc.lip6.fr (borneo [132.227.103.47])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10QMmWjc017842;
 Tue, 26 Jan 2021 23:48:32 +0100 (MET)
Received: by borneo.soc.lip6.fr (Postfix, from userid 373)
 id 9FA17AA8C1; Tue, 26 Jan 2021 23:48:32 +0100 (MET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 1b2cc996-6cd5-4dea-b437-9f0bda14d2a6
From: Manuel Bouyer <bouyer@netbsd.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: [PATCH v2] NetBSD hotplug: Introduce locking functions
Date: Tue, 26 Jan 2021 23:47:48 +0100
Message-Id: <20210126224800.1246-2-bouyer@netbsd.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210126224800.1246-1-bouyer@netbsd.org>
References: <20210126224800.1246-1-bouyer@netbsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 26 Jan 2021 23:48:32 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

On NetBSD, some block device configuration requires serialisation.
Introcuce locking functions (derived from the Linux version), and use them
in the block script where appropriate.

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
---
 tools/hotplug/NetBSD/Makefile   |   1 +
 tools/hotplug/NetBSD/block      |   5 +-
 tools/hotplug/NetBSD/locking.sh | 121 ++++++++++++++++++++++++++++++++
 3 files changed, 126 insertions(+), 1 deletion(-)
 create mode 100644 tools/hotplug/NetBSD/locking.sh

diff --git a/tools/hotplug/NetBSD/Makefile b/tools/hotplug/NetBSD/Makefile
index 6926885ab8..114b223207 100644
--- a/tools/hotplug/NetBSD/Makefile
+++ b/tools/hotplug/NetBSD/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 # Xen script dir and scripts to go there.
 XEN_SCRIPTS =
+XEN_SCRIPTS += locking.sh
 XEN_SCRIPTS += block
 XEN_SCRIPTS += vif-bridge
 XEN_SCRIPTS += vif-ip
diff --git a/tools/hotplug/NetBSD/block b/tools/hotplug/NetBSD/block
index c8b31a7b2b..eb5e80d640 100644
--- a/tools/hotplug/NetBSD/block
+++ b/tools/hotplug/NetBSD/block
@@ -5,6 +5,7 @@
 
 DIR=$(dirname "$0")
 . "${DIR}/hotplugpath.sh"
+. "${DIR}/locking.sh"
 
 PATH=${bindir}:${sbindir}:${LIBEXEC_BIN}:/bin:/usr/bin:/sbin:/usr/sbin
 export PATH
@@ -52,6 +53,7 @@ case $xstatus in
 			available_disks="$available_disks $disk"
 			eval $disk=free
 		done
+		claim_lock block
 		# Mark the used vnd(4) devices as ``used''.
 		for disk in `sysctl hw.disknames`; do
 			case $disk in
@@ -67,6 +69,7 @@ case $xstatus in
 				break	
 			fi
 		done
+		release_lock block
 		if [ x$device = x ] ; then
 			error "no available vnd device"
 		fi
@@ -76,7 +79,7 @@ case $xstatus in
 		device=$xparams
 		;;
 	esac
-	physical_device=$(stat -f '%r' "$device")
+	physical_device=$(stat -L -f '%r' "$device")
 	xenstore-write $xpath/physical-device $physical_device
 	xenstore-write $xpath/hotplug-status connected
 	exit 0
diff --git a/tools/hotplug/NetBSD/locking.sh b/tools/hotplug/NetBSD/locking.sh
new file mode 100644
index 0000000000..2098d0e3ab
--- /dev/null
+++ b/tools/hotplug/NetBSD/locking.sh
@@ -0,0 +1,121 @@
+#
+# Copyright (c) 2005 XenSource Ltd.
+# Copyright (c) 2007 Red Hat
+#
+# This library is free software; you can redistribute it and/or
+# modify it under the terms of version 2.1 of the GNU Lesser General Public
+# License as published by the Free Software Foundation.
+#
+# This library is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# Lesser General Public License for more details.
+#
+# You should have received a copy of the GNU Lesser General Public
+# License along with this library; If not, see <http://www.gnu.org/licenses/>.
+#
+
+#
+# Serialisation
+#
+
+LOCK_BASEDIR=$XEN_LOCK_DIR/xen-hotplug
+
+_setlockfd()
+{
+    _lockfd=9
+    _lockfile="$LOCK_BASEDIR/$1"
+}
+
+
+claim_lock()
+{
+    mkdir -p "$LOCK_BASEDIR"
+    _setlockfd $1
+    # The locking strategy is identical to that from with-lock-ex(1)
+    # from chiark-utils, except using flock.  It has the benefit of
+    # it being possible to safely remove the lockfile when done.
+    # See below for a correctness proof.
+    local stat
+    while true; do
+        eval "exec $_lockfd<> $_lockfile"
+	# we can't flock $_lockfd here, as the shell closes it on exec.
+	# Workaround by redirecting to 0 for the command, and flock 0 instead.
+        flock -v -x 0  0<& $_lockfd|| exit 1
+        local file_stat
+        local fd_stat
+        if fd_stat=$(stat -f '%d.%i' 0<&$_lockfd 2>/dev/null) && file_stat=$(stat -f '%d.%i' $_lockfile 2>/dev/null )
+        then
+            if [ "$fd_stat" = "$file_stat" ] ; then break; fi
+        fi
+        # Some versions of bash appear to be buggy if the same
+        # $_lockfile is opened repeatedly. Close the current fd here.
+        eval "exec $_lockfd<&-"
+    done
+}
+
+
+release_lock()
+{
+    _setlockfd $1
+    rm "$_lockfile"
+}
+
+# Protocol and correctness proof:
+#
+# * The lock is owned not by a process but by an open-file (informally
+#   an fd).  Any process with an fd onto this open-file is a
+#   lockholder and may perform the various operations; such a process
+#   should only do so when its co-lockholder processes expect.  Ie, we
+#   will treat all processes holding fds onto the open-file as acting
+#   in concert and not distinguish between them.
+#
+# * You are a lockholder if
+#     - You have an fd onto an open-file which
+#       currently holds an exclusive flock lock on its inum
+#     - and that inum is currently linked at the lockfile path
+#
+# * The rules are:
+#     - No-one but a lockholder may unlink the lockfile path
+#       (or otherwise cause it to stop referring to a file it
+#       refers to).
+#     - Anyone may open the lockfile with O_CREAT
+#
+# * The protocol for locking is:
+#     - Open the file (O_CREAT)
+#     - flock it
+#     - fstat the fd you have open
+#     - stat the lockfile path
+#     - if both are equal you have the lock, otherwise try again.
+#
+# * Informal proof of exclusivity:
+#     - No two open-files can hold an fcntl lock onto the same file
+#       at the same time
+#     - No two files can have the same name at the same time
+#
+# * Informal proof of correctness of locking protocol:
+#     - After you call flock successfully no-one other than you
+#       (someone with the same open-file) can stop you having
+#       that flock lock.
+#     - Obviously the inum you get from the fstat is fixed
+#     - At the point where you call stat there are two
+#       possibilities:
+#         (i) the lockfile path referred to some other inum
+#             in which case you have failed
+#         (ii) the lockfile path referred to the same file
+#             in which case at that point you were the
+#             lockholder (by definition).
+#
+# * Informal proof that no-one else can steal the lock:
+#     - After you call flock successfully no-one other than you
+#       can stop you having that flock lock
+#     - No-one other than the lockholder is permitted to stop
+#       the path referring to a particular inum.  So if you
+#       hold the lock then only you are allowed to stop the
+#       path referring to the file whose flock you hold; so
+#       it will continue to refer to that file.
+#   That's both the conditions for being the lockholder.
+#
+#   Thus once you hold the lock at any instant, you will
+#   continue to do so until you voluntarily stop doing so
+#   (eg by unlinking the lockfile or closing the fd).
-- 
2.29.2


