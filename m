Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B29EC2F3801
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 19:13:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65826.116634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOAP-0003cH-Nl; Tue, 12 Jan 2021 18:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65826.116634; Tue, 12 Jan 2021 18:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOAP-0003bf-K6; Tue, 12 Jan 2021 18:13:17 +0000
Received: by outflank-mailman (input) for mailman id 65826;
 Tue, 12 Jan 2021 18:13:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gu5a=GP=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1kzOAN-0003Yo-S8
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 18:13:15 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5fb41780-d435-4ccb-9116-d9b55bb4a373;
 Tue, 12 Jan 2021 18:13:10 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10CID92A004427;
 Tue, 12 Jan 2021 19:13:09 +0100 (CET)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10CID8Of017662;
 Tue, 12 Jan 2021 19:13:08 +0100 (MET)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 5E0647218; Tue, 12 Jan 2021 19:13:08 +0100 (MET)
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
X-Inumbo-ID: 5fb41780-d435-4ccb-9116-d9b55bb4a373
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: [PATCH] NetBSD hotplug: Introduce locking functions
Date: Tue, 12 Jan 2021 19:12:23 +0100
Message-Id: <20210112181242.1570-3-bouyer@antioche.eu.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112181242.1570-1-bouyer@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 12 Jan 2021 19:13:09 +0100 (CET)
X-Spam-Score: 3.083 (***) BAYES_00,HEADER_FROM_DIFFERENT_DOMAINS,MEDICAL,SPF_HELO_SOFTFAIL,SPF_NONE
X-Spam-Status: Yes, hits=3.083 required=3
X-Spam-Report: Content analysis details:   (3.1 points, 3.0 required)
                pts rule name              description
               --- ---------              -----------
               -1.9 BAYES_00               BODY: Bayes spam probability is 0 to 1%
                                           [score: 0.0000]
                0.0 SPF_NONE               SPF: sender does not publish an SPF Record
                0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
                                           mail domains are different
                0.7 SPF_HELO_SOFTFAIL      SPF: HELO does not match SPF record (softfail)
                4.0 MEDICAL                Medical or commercial database
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

From: Manuel Bouyer <bouyer@netbsd.org>

On NetBSD, some block device configuration requires serialisation.
Introcuce locking functions, and use them in the block script where
appropriate.

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
---
 tools/hotplug/NetBSD/Makefile   |  1 +
 tools/hotplug/NetBSD/block      |  5 ++-
 tools/hotplug/NetBSD/locking.sh | 72 +++++++++++++++++++++++++++++++++
 3 files changed, 77 insertions(+), 1 deletion(-)
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
index 32c20b6c89..23c8e38ebf 100644
--- a/tools/hotplug/NetBSD/block
+++ b/tools/hotplug/NetBSD/block
@@ -6,6 +6,7 @@
 
 DIR=$(dirname "$0")
 . "${DIR}/hotplugpath.sh"
+. "${DIR}/locking.sh"
 
 PATH=${bindir}:${sbindir}:${LIBEXEC_BIN}:/bin:/usr/bin:/sbin:/usr/sbin
 export PATH
@@ -62,6 +63,7 @@ case $xstatus in
 			available_disks="$available_disks $disk"
 			eval $disk=free
 		done
+		claim_lock block
 		# Mark the used vnd(4) devices as ``used''.
 		for disk in `sysctl hw.disknames`; do
 			case $disk in
@@ -77,6 +79,7 @@ case $xstatus in
 				break	
 			fi
 		done
+		release_lock block
 		if [ x$device = x ] ; then
 			error "no available vnd device"
 		fi
@@ -86,7 +89,7 @@ case $xstatus in
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
index 0000000000..88257f62b7
--- /dev/null
+++ b/tools/hotplug/NetBSD/locking.sh
@@ -0,0 +1,72 @@
+#!/bin/sh
+#
+# Copyright (c) 2016, Christoph Badura.  All rights reserved.
+#
+# Redistribution and use in source and binary forms, with or without
+# modification, are permitted provided that the following conditions
+# are met:
+# 1. Redistributions of source code must retain the above copyright
+#    notice, this list of conditions and the following disclaimer.
+# 2. Redistributions in binary form must reproduce the above copyright
+#    notice, this list of conditions and the following disclaimer in the
+#    documentation and/or other materials provided with the distribution.
+#
+# THIS SOFTWARE IS PROVIDED BY THE AUTHOR(S) ``AS IS'' AND ANY EXPRESS
+# OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+# DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR(S) BE LIABLE FOR ANY DIRECT,
+# INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
+# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
+# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
+# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
+# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
+# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+# SUCH DAMAGE.
+#
+
+LOCK_BASEDIR="$XEN_LOCK_DIR/xen-hotplug"
+
+_lockfd=9
+_have_lock=0	# lock not taken yet.
+
+SHLOCK="shlock ${_shlock_debug-}"
+
+_lock_set_vars() {
+	_lockfile="$LOCK_BASEDIR/$1.lock"
+	_lockfifo="$LOCK_BASEDIR/$1.fifo"
+}
+
+_lock_init() {
+	mkdir -p "$LOCK_BASEDIR" 2>/dev/null || true
+	mkfifo $_lockfifo 2>/dev/null || true
+}
+
+#
+# use a named pipe as condition variable
+# opening for read-only blocks when there's no writer.
+# opening for read-write never blocks but unblocks any waiting readers.
+# 
+_lock_wait_cv() {
+	eval "exec $_lockfd<  $_lockfifo ; exec $_lockfd<&-"
+}
+_lock_signal_cv() {
+	eval "exec $_lockfd<> $_lockfifo ; exec $_lockfd<&-"
+}
+
+claim_lock() {
+	_lock_set_vars $1
+	_lock_init
+	until $SHLOCK -f $_lockfile -p $$; do
+		_lock_wait_cv
+	done
+	_have_lock=1
+	# be sure to release the lock when the shell exits
+	trap "release_lock $1" 0 1 2 15
+}
+
+release_lock() {
+	_lock_set_vars $1
+	[ "$_have_lock" != 0 -a -f $_lockfile ] && rm $_lockfile
+	_have_lock=0
+	_lock_signal_cv;
+}
-- 
2.29.2


