Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 958E939EE75
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 07:59:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138273.256030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqUlL-0002Ap-Eg; Tue, 08 Jun 2021 05:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138273.256030; Tue, 08 Jun 2021 05:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqUlL-00027L-B7; Tue, 08 Jun 2021 05:58:55 +0000
Received: by outflank-mailman (input) for mailman id 138273;
 Tue, 08 Jun 2021 05:58:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q7uu=LC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lqUlK-0001Yg-2p
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 05:58:54 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab4b8d68-4dbf-4443-ae63-7e5e7247d28f;
 Tue, 08 Jun 2021 05:58:48 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5D71F1FD51;
 Tue,  8 Jun 2021 05:58:47 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 307B5118DD;
 Tue,  8 Jun 2021 05:58:47 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id AMWyChcHv2AQbAAALh3uQQ
 (envelope-from <jgross@suse.com>); Tue, 08 Jun 2021 05:58:47 +0000
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
X-Inumbo-ID: ab4b8d68-4dbf-4443-ae63-7e5e7247d28f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623131927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yUf0kgQYfvnmKxevqLhHiJSctn5eVI9NLzOeej8C5tg=;
	b=JKQDlEuS9yvNBnHdV89lkxA+VM4Er1ZUn6rc79KzTdyfBNRTAudmIwkCb9qz73GYaZ1VN2
	RxiYH4Fe9D0fPb+5C2SFjOR3nJf53T9izV87DbSCTzYPtZ+tGNdajcdBNUlcPkpzK2Tva7
	7av2EmdgFA/WVAvTy1ejrR+4h0gu1cY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623131927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yUf0kgQYfvnmKxevqLhHiJSctn5eVI9NLzOeej8C5tg=;
	b=JKQDlEuS9yvNBnHdV89lkxA+VM4Er1ZUn6rc79KzTdyfBNRTAudmIwkCb9qz73GYaZ1VN2
	RxiYH4Fe9D0fPb+5C2SFjOR3nJf53T9izV87DbSCTzYPtZ+tGNdajcdBNUlcPkpzK2Tva7
	7av2EmdgFA/WVAvTy1ejrR+4h0gu1cY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/2] tools/xenstore: set open file descriptor limit for xenstored
Date: Tue,  8 Jun 2021 07:58:39 +0200
Message-Id: <20210608055839.10313-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210608055839.10313-1-jgross@suse.com>
References: <20210608055839.10313-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a configuration item for the maximum number of domains xenstored
should support and set the limit of open file descriptors accordingly.

For HVM domains there are up to 5 socket connections per domain (2 by
the xl daemon process, and 3 by qemu). So set the ulimit for xenstored
to 5 * XENSTORED_MAX_DOMAINS + 100 (the "+ 100" is for some headroom,
like logging, event channel device, etc.).

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- set ulimit form launch script (Julien Grall)
- split off from original patch (Julien Grall)
---
 tools/hotplug/Linux/init.d/sysconfig.xencommons.in | 7 +++++++
 tools/hotplug/Linux/launch-xenstore.in             | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
index 00cf7f91d4..516cd97092 100644
--- a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
+++ b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
@@ -32,6 +32,13 @@
 # Changing this requires a reboot to take effect.
 #XENSTORED=@XENSTORED@
 
+## Type: integer
+## Default: 32768
+#
+# Select maximum number of domains supported by xenstored.
+# Only evaluated if XENSTORETYPE is "daemon".
+#XENSTORED_MAX_N_DOMAINS=32768
+
 ## Type: string
 ## Default: ""
 #
diff --git a/tools/hotplug/Linux/launch-xenstore.in b/tools/hotplug/Linux/launch-xenstore.in
index 3ad71e3d08..89149f98ee 100644
--- a/tools/hotplug/Linux/launch-xenstore.in
+++ b/tools/hotplug/Linux/launch-xenstore.in
@@ -54,12 +54,14 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
 
 [ "$XENSTORETYPE" = "daemon" ] && {
 	[ -z "$XENSTORED_TRACE" ] || XENSTORED_ARGS="$XENSTORED_ARGS -T @XEN_LOG_DIR@/xenstored-trace.log"
+	[ -z "$XENSTORED_MAX_N_DOMAINS" ] && XENSTORED_MAX_N_DOMAINS=32768
 	[ -z "$XENSTORED" ] && XENSTORED=@XENSTORED@
 	[ -x "$XENSTORED" ] || {
 		echo "No xenstored found"
 		exit 1
 	}
 	rm -f @XEN_RUN_DIR@/xenstored.pid
+	N_FILES=$(($XENSTORED_MAX_N_DOMAINS * 5 + 100))
 
 	echo -n Starting $XENSTORED...
 	$XENSTORED --pid-file @XEN_RUN_DIR@/xenstored.pid $XENSTORED_ARGS
@@ -67,6 +69,7 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
 	systemd-notify --booted 2>/dev/null || timeout_xenstore $XENSTORED || exit 1
 	XS_PID=`cat @XEN_RUN_DIR@/xenstored.pid`
 	echo -500 >/proc/$XS_PID/oom_score_adj
+	prlimit --pid $XS_PID --nofile=$N_FILES
 
 	exit 0
 }
-- 
2.26.2


