Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FAA41AB98
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 11:15:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197844.351121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV9D5-0002ZE-6B; Tue, 28 Sep 2021 09:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197844.351121; Tue, 28 Sep 2021 09:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV9D5-0002WQ-1Z; Tue, 28 Sep 2021 09:15:35 +0000
Received: by outflank-mailman (input) for mailman id 197844;
 Tue, 28 Sep 2021 09:15:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TiGH=OS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mV9D3-0002Eh-I4
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 09:15:33 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e8c53aa-203c-11ec-bc75-12813bfff9fa;
 Tue, 28 Sep 2021 09:15:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EA7801FD74;
 Tue, 28 Sep 2021 09:15:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C64DA13BAD;
 Tue, 28 Sep 2021 09:15:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yAH9Li7dUmESHQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 28 Sep 2021 09:15:26 +0000
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
X-Inumbo-ID: 9e8c53aa-203c-11ec-bc75-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632820526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q5L7RANFuY0lTjcILncAay9zDfSZ+zR/cGF7re2yY04=;
	b=C/YCNWfRaUUc5abiQF2BRob/tNIIM9tcO6Qj/ARQt7w8L6nmLhsuQitPnKbQUpbEd8xLaf
	LR6tL5sOHKvf3VzI4YdgZWTGLtUmBPzjWrHMfG9Px5jXguyeX1U1A6oqDkZz2ng2a97g7I
	AwEj5b6h2gTaBEXCLhIJOeUmGdlRWY4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 1/2] tools/xenstore: set oom score for xenstore daemon on Linux
Date: Tue, 28 Sep 2021 11:15:16 +0200
Message-Id: <20210928091517.9761-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210928091517.9761-1-jgross@suse.com>
References: <20210928091517.9761-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xenstored is absolutely mandatory for a Xen host and it can't be
restarted, so being killed by OOM-killer in case of memory shortage is
to be avoided.

Set /proc/$pid/oom_score_adj (if available) per default to -500 (this
translates to 50% of dom0 memory size) in order to allow xenstored to
use large amounts of memory without being killed.

The percentage of dom0 memory above which the oom killer is allowed to
kill xenstored can be set via XENSTORED_OOM_MEM_THRESHOLD in
xencommons.

Make sure the pid file isn't a left-over from a previous run delete it
before starting xenstored.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Ian Jackson <iwj@xenproject.org>
---
V2:
- set oom score from launch script (Julien Grall)
- split off open file descriptor limit setting (Julien Grall)
V3:
- make oom killer threshold configurable (Julien Grall)
V4:
- extend comment (Ian Jackson)
---
 tools/hotplug/Linux/init.d/sysconfig.xencommons.in | 9 +++++++++
 tools/hotplug/Linux/launch-xenstore.in             | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
index 00cf7f91d4..b83101ab7e 100644
--- a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
+++ b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
@@ -48,6 +48,15 @@ XENSTORED_ARGS=
 # Only evaluated if XENSTORETYPE is "daemon".
 #XENSTORED_TRACE=[yes|on|1]
 
+## Type: integer
+## Default: 50
+#
+# Percentage of dom0 memory size the xenstore daemon can use before the
+# OOM killer is allowed to kill it.
+# The specified value is multiplied by -10 and echoed to
+# /proc/PID/oom_score_adj.
+#XENSTORED_OOM_MEM_THRESHOLD=50
+
 ## Type: string
 ## Default: @LIBEXEC@/boot/xenstore-stubdom.gz
 #
diff --git a/tools/hotplug/Linux/launch-xenstore.in b/tools/hotplug/Linux/launch-xenstore.in
index 019f9d6f4d..1747c96065 100644
--- a/tools/hotplug/Linux/launch-xenstore.in
+++ b/tools/hotplug/Linux/launch-xenstore.in
@@ -59,11 +59,17 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
 		echo "No xenstored found"
 		exit 1
 	}
+	[ -z "$XENSTORED_OOM_MEM_THRESHOLD" ] || XENSTORED_OOM_MEM_THRESHOLD=50
+	XS_OOM_SCORE=-$(($XENSTORED_OOM_MEM_THRESHOLD * 10))
+
+	rm -f @XEN_RUN_DIR@/xenstored.pid
 
 	echo -n Starting $XENSTORED...
 	$XENSTORED --pid-file @XEN_RUN_DIR@/xenstored.pid $XENSTORED_ARGS
 
 	systemd-notify --booted 2>/dev/null || timeout_xenstore $XENSTORED || exit 1
+	XS_PID=`cat @XEN_RUN_DIR@/xenstored.pid`
+	echo $XS_OOM_SCORE >/proc/$XS_PID/oom_score_adj
 
 	exit 0
 }
-- 
2.26.2


