Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB923DB898
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jul 2021 14:27:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162517.298029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9RbT-0004i9-P4; Fri, 30 Jul 2021 12:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162517.298029; Fri, 30 Jul 2021 12:27:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9RbT-0004fu-Lo; Fri, 30 Jul 2021 12:27:03 +0000
Received: by outflank-mailman (input) for mailman id 162517;
 Fri, 30 Jul 2021 12:27:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MkAV=MW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1m9RbR-0004PY-C1
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 12:27:01 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f6e3d8e-f131-11eb-98a9-12813bfff9fa;
 Fri, 30 Jul 2021 12:26:59 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CC4512233F;
 Fri, 30 Jul 2021 12:26:58 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id A45B4137F9;
 Fri, 30 Jul 2021 12:26:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id kDLaJhLwA2FOVgAAGKfGzw
 (envelope-from <jgross@suse.com>); Fri, 30 Jul 2021 12:26:58 +0000
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
X-Inumbo-ID: 6f6e3d8e-f131-11eb-98a9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1627648018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aVgd7I4DSuetcgd/27P69oOnpKyUEJbbUJKDnpuahN4=;
	b=i6Je2YxDCN0NlWmH4d5F/fOp5+FORTrNZWQMvEhT+aUPXWHYIKZlvYaLQMFfYKWKrWh1UI
	e/ZCDiVBuPF9GgO78bnrLroXVXM3g1N5lgjTUaDGqPO/soc0y93/uCSWaJR5jRFs1OmmKq
	ojE83M/GRr85xO4Q8AcVsmHXD4xU9Xc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/2] tools/xenstore: set open file descriptor limit for xenstored
Date: Fri, 30 Jul 2021 14:26:43 +0200
Message-Id: <20210730122643.2043-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210730122643.2043-1-jgross@suse.com>
References: <20210730122643.2043-1-jgross@suse.com>
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
index 5ad4fe0818..2b682415f4 100644
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
index 1747c96065..3f8b33dd32 100644
--- a/tools/hotplug/Linux/launch-xenstore.in
+++ b/tools/hotplug/Linux/launch-xenstore.in
@@ -54,6 +54,7 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
 
 [ "$XENSTORETYPE" = "daemon" ] && {
 	[ -z "$XENSTORED_TRACE" ] || XENSTORED_ARGS="$XENSTORED_ARGS -T @XEN_LOG_DIR@/xenstored-trace.log"
+	[ -z "$XENSTORED_MAX_N_DOMAINS" ] && XENSTORED_MAX_N_DOMAINS=32768
 	[ -z "$XENSTORED" ] && XENSTORED=@XENSTORED@
 	[ -x "$XENSTORED" ] || {
 		echo "No xenstored found"
@@ -63,6 +64,7 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
 	XS_OOM_SCORE=-$(($XENSTORED_OOM_MEM_THRESHOLD * 10))
 
 	rm -f @XEN_RUN_DIR@/xenstored.pid
+	N_FILES=$(($XENSTORED_MAX_N_DOMAINS * 5 + 100))
 
 	echo -n Starting $XENSTORED...
 	$XENSTORED --pid-file @XEN_RUN_DIR@/xenstored.pid $XENSTORED_ARGS
@@ -70,6 +72,7 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
 	systemd-notify --booted 2>/dev/null || timeout_xenstore $XENSTORED || exit 1
 	XS_PID=`cat @XEN_RUN_DIR@/xenstored.pid`
 	echo $XS_OOM_SCORE >/proc/$XS_PID/oom_score_adj
+	prlimit --pid $XS_PID --nofile=$N_FILES
 
 	exit 0
 }
-- 
2.26.2


