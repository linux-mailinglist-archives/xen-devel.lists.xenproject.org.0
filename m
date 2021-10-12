Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C0242A620
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 15:42:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207221.363002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maI2Z-0002Jd-8k; Tue, 12 Oct 2021 13:41:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207221.363002; Tue, 12 Oct 2021 13:41:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maI2Z-0002HG-3j; Tue, 12 Oct 2021 13:41:59 +0000
Received: by outflank-mailman (input) for mailman id 207221;
 Tue, 12 Oct 2021 13:41:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xSmm=PA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1maI2X-0001i7-N1
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 13:41:57 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27ae2b7f-2b62-11ec-8129-12813bfff9fa;
 Tue, 12 Oct 2021 13:41:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 51D2F200AD;
 Tue, 12 Oct 2021 13:41:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2774F13BC9;
 Tue, 12 Oct 2021 13:41:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aLQ6CJ+QZWGabgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 12 Oct 2021 13:41:51 +0000
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
X-Inumbo-ID: 27ae2b7f-2b62-11ec-8129-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634046111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SEIm+LDplzdzplbZtDj1JKs78X3CX933Us/EMZK8kUQ=;
	b=DeH1SPQanWNTalBCfT28ybemBt/DXolwcq5aIAsmOeLi69vKGr6llMAujDPpxgEj7UaG9I
	WrgWUnDVeIJfO6pbffBCNn8fwYAE8OeO2Y9nhLhVzUQ8PWtUDKcCWq5uRcepdOi9FOyhbw
	YifqJlTD/O76cBP2JIhEzv4Zw8SllxI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 2/2] tools/xenstore: set open file descriptor limit for xenstored
Date: Tue, 12 Oct 2021 15:41:48 +0200
Message-Id: <20211012134148.6280-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211012134148.6280-1-jgross@suse.com>
References: <20211012134148.6280-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a configuration item for the maximum number of open file
descriptors xenstored should be allowed to have.

The default should be "unlimited" in order not to restrict xenstored
in the number of domains it can support, but unfortunately the kernel
is normally limiting the maximum value via /proc/sys/fs/nr_open [1],
[2]. So check that file to exist and if it does, limit the maximum
value to the one specified by /proc/sys/fs/nr_open.

As an aid for the admin configuring the value add a comment specifying
the common needs of xenstored for the different domain types.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=60fd760fb9ff7034360bab7137c917c0330628c2
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0c2d64fb6cae9aae480f6a46cfe79f8d7d48b59f

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- set ulimit form launch script (Julien Grall)
- split off from original patch (Julien Grall)
V4:
- switch to directly configuring the limit of file descriptors instead
  of domains (Ian Jackson)
V5:
- use /proc/sys/fs/nr_open (Ian Jackson)
V6:
- start daemon directly via prlimit
---
 .../Linux/init.d/sysconfig.xencommons.in      | 13 ++++++++++++
 tools/hotplug/Linux/launch-xenstore.in        | 21 ++++++++++++++++++-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
index b83101ab7e..433e4849af 100644
--- a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
+++ b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
@@ -32,6 +32,19 @@
 # Changing this requires a reboot to take effect.
 #XENSTORED=@XENSTORED@
 
+## Type: string
+## Default: unlimited
+#
+# Select maximum number of file descriptors xenstored is allowed to have
+# opened at one time.
+# For each HVM domain xenstored might need up to 5 open file descriptors,
+# PVH and PV domains will require up to 3 open file descriptors. Additionally
+# 20-30 file descriptors will be opened for internal uses.
+# The specified value (including "unlimited") will be capped by the contents
+# of /proc/sys/fs/nr_open if existing.
+# Only evaluated if XENSTORETYPE is "daemon".
+#XENSTORED_MAX_OPEN_FDS=unlimited
+
 ## Type: string
 ## Default: ""
 #
diff --git a/tools/hotplug/Linux/launch-xenstore.in b/tools/hotplug/Linux/launch-xenstore.in
index 1747c96065..8438af9977 100644
--- a/tools/hotplug/Linux/launch-xenstore.in
+++ b/tools/hotplug/Linux/launch-xenstore.in
@@ -54,6 +54,7 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
 
 [ "$XENSTORETYPE" = "daemon" ] && {
 	[ -z "$XENSTORED_TRACE" ] || XENSTORED_ARGS="$XENSTORED_ARGS -T @XEN_LOG_DIR@/xenstored-trace.log"
+	[ -z "$XENSTORED_MAX_OPEN_FDS" ] && XENSTORED_MAX_OPEN_FDS=unlimited
 	[ -z "$XENSTORED" ] && XENSTORED=@XENSTORED@
 	[ -x "$XENSTORED" ] || {
 		echo "No xenstored found"
@@ -62,10 +63,28 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
 	[ -z "$XENSTORED_OOM_MEM_THRESHOLD" ] || XENSTORED_OOM_MEM_THRESHOLD=50
 	XS_OOM_SCORE=-$(($XENSTORED_OOM_MEM_THRESHOLD * 10))
 
+	[ "$XENSTORED_MAX_OPEN_FDS" = "unlimited" ] || {
+		[ -z "${XENSTORED_MAX_OPEN_FDS//[0-9]}" ] &&
+		[ -n "$XENSTORED_MAX_OPEN_FDS" ] || {
+			echo "XENSTORED_MAX_OPEN_FDS=$XENSTORED_MAX_OPEN_FDS invalid"
+			echo "Setting to default \"unlimited\"."
+			XENSTORED_MAX_OPEN_FDS=unlimited
+		}
+	}
+	[ -r /proc/sys/fs/nr_open ] && {
+		MAX_FDS=`cat /proc/sys/fs/nr_open`
+		[ "$XENSTORED_MAX_OPEN_FDS" = "unlimited" ] && XENSTORED_MAX_OPEN_FDS=$MAX_FDS
+		[ $XENSTORED_MAX_OPEN_FDS -gt $MAX_FDS ] && {
+			echo "XENSTORED_MAX_OPEN_FDS exceeds system limit."
+			echo "Setting to \"$MAX_FDS\"."
+			XENSTORED_MAX_OPEN_FDS=$MAX_FDS
+		}
+	}
+
 	rm -f @XEN_RUN_DIR@/xenstored.pid
 
 	echo -n Starting $XENSTORED...
-	$XENSTORED --pid-file @XEN_RUN_DIR@/xenstored.pid $XENSTORED_ARGS
+	prlimit --nofile=$XENSTORED_MAX_OPEN_FDS $XENSTORED --pid-file @XEN_RUN_DIR@/xenstored.pid $XENSTORED_ARGS
 
 	systemd-notify --booted 2>/dev/null || timeout_xenstore $XENSTORED || exit 1
 	XS_PID=`cat @XEN_RUN_DIR@/xenstored.pid`
-- 
2.26.2


