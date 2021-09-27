Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2258419277
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 12:48:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196701.349655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUoBH-0003PH-HU; Mon, 27 Sep 2021 10:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196701.349655; Mon, 27 Sep 2021 10:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUoBH-0003Jh-BT; Mon, 27 Sep 2021 10:48:19 +0000
Received: by outflank-mailman (input) for mailman id 196701;
 Mon, 27 Sep 2021 10:48:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eI72=OR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mUoBF-0003HF-Nf
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 10:48:17 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b8e251c-1f80-11ec-bc44-12813bfff9fa;
 Mon, 27 Sep 2021 10:48:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 148E22209B;
 Mon, 27 Sep 2021 10:48:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E5D0013F4B;
 Mon, 27 Sep 2021 10:48:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MBL/Nm+hUWHBKgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 27 Sep 2021 10:48:15 +0000
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
X-Inumbo-ID: 6b8e251c-1f80-11ec-bc44-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632739696; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0bTrNbQ0miBKyNabZ7OBv568TXSZHmfPJwYLlLSwrss=;
	b=Pl/LD+1gSxuMVta+tt/eO4ZEzBzgRAh0YlzD8rfBG3ybn9WUnHRuV3h1n4vB6BUPDAaSZk
	CGlvtWQxwq+0Ata56n89R9ybSNeVv45CwdRIN0EcYkL0piIPBNEHV363QHagqSrrkaH3YR
	4GJa+Qx4t7+iXWBRHSP5Jrfls7TgDjw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 2/2] tools/xenstore: set open file descriptor limit for xenstored
Date: Mon, 27 Sep 2021 12:48:13 +0200
Message-Id: <20210927104813.19772-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210927104813.19772-1-jgross@suse.com>
References: <20210927104813.19772-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a configuration item for the maximum number of open file
descriptors xenstored should be allowed to have.

The default should be "unlimited" in order not to restrict xenstored
in the number of domains it can support, but unfortunately the prlimit
command requires specification of a real value for the number of files,
so use 262144 as the default value. As an aid for the admin configuring
the value add a comment specifying the common needs of xenstored for
the different domain types.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- set ulimit form launch script (Julien Grall)
- split off from original patch (Julien Grall)
V4:
- switch to directly configuring the limit of file descriptors instead
  of domains (Ian Jackson)
---
 tools/hotplug/Linux/init.d/sysconfig.xencommons.in | 13 +++++++++++++
 tools/hotplug/Linux/launch-xenstore.in             |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
index b83101ab7e..ad020b7a50 100644
--- a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
+++ b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
@@ -32,6 +32,19 @@
 # Changing this requires a reboot to take effect.
 #XENSTORED=@XENSTORED@
 
+## Type: integer
+## Default: 262144
+#
+# Select maximum number of file descriptors xenstored is allowed to have
+# opened at one time.
+# For each HVM domain xenstored might need up to 5 open file descriptors,
+# PVH and PV domains will require up to 3 open file descriptors. Additionally
+# 20-30 file descriptors will be opened for internal uses. The default of
+# 262144 allows for about 8 open files for the theoretical maximum of 32752
+# domains.
+# Only evaluated if XENSTORETYPE is "daemon".
+#XENSTORED_MAX_OPEN_FDS=262144
+
 ## Type: string
 ## Default: ""
 #
diff --git a/tools/hotplug/Linux/launch-xenstore.in b/tools/hotplug/Linux/launch-xenstore.in
index 1747c96065..2bc41bb4f0 100644
--- a/tools/hotplug/Linux/launch-xenstore.in
+++ b/tools/hotplug/Linux/launch-xenstore.in
@@ -54,6 +54,7 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
 
 [ "$XENSTORETYPE" = "daemon" ] && {
 	[ -z "$XENSTORED_TRACE" ] || XENSTORED_ARGS="$XENSTORED_ARGS -T @XEN_LOG_DIR@/xenstored-trace.log"
+	[ -z "$XENSTORED_MAX_OPEN_FDS" ] && XENSTORED_MAX_OPEN_FDS=262144
 	[ -z "$XENSTORED" ] && XENSTORED=@XENSTORED@
 	[ -x "$XENSTORED" ] || {
 		echo "No xenstored found"
@@ -70,6 +71,7 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
 	systemd-notify --booted 2>/dev/null || timeout_xenstore $XENSTORED || exit 1
 	XS_PID=`cat @XEN_RUN_DIR@/xenstored.pid`
 	echo $XS_OOM_SCORE >/proc/$XS_PID/oom_score_adj
+	prlimit --pid $XS_PID --nofile=$XENSTORED_MAX_OPEN_FDS
 
 	exit 0
 }
-- 
2.26.2


