Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD0C39EE74
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 07:59:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138271.256007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqUlH-0001aj-08; Tue, 08 Jun 2021 05:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138271.256007; Tue, 08 Jun 2021 05:58:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqUlG-0001Yr-Qs; Tue, 08 Jun 2021 05:58:50 +0000
Received: by outflank-mailman (input) for mailman id 138271;
 Tue, 08 Jun 2021 05:58:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q7uu=LC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lqUlF-0001Yf-4T
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 05:58:49 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35bf5c20-3fea-4264-85fe-236ddbfd58f0;
 Tue, 08 Jun 2021 05:58:47 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2A0BE1FD50;
 Tue,  8 Jun 2021 05:58:47 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id F27D6118DD;
 Tue,  8 Jun 2021 05:58:46 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id OBsOOhYHv2AQbAAALh3uQQ
 (envelope-from <jgross@suse.com>); Tue, 08 Jun 2021 05:58:46 +0000
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
X-Inumbo-ID: 35bf5c20-3fea-4264-85fe-236ddbfd58f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623131927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i2oAt0R0s4NoNFYvZ9Mbyh4IYQkZZ3RW7YMkBQwQXlQ=;
	b=UT64tIpTEgxopaXUTiBBPwXIcr65Zj2CYspcux64iBAXY0DjPoW02shBGW6+9SLPTz8KTn
	fwLooxuo3KfUqEhqwBY0DjZu6YRk7QGDLvX4DpI2PIjOec2A7qe08xqY3j9apXDc+hXSgi
	/5KB8sGFhaT2orkadCZF7j8zvKNvVj0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623131927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i2oAt0R0s4NoNFYvZ9Mbyh4IYQkZZ3RW7YMkBQwQXlQ=;
	b=UT64tIpTEgxopaXUTiBBPwXIcr65Zj2CYspcux64iBAXY0DjPoW02shBGW6+9SLPTz8KTn
	fwLooxuo3KfUqEhqwBY0DjZu6YRk7QGDLvX4DpI2PIjOec2A7qe08xqY3j9apXDc+hXSgi
	/5KB8sGFhaT2orkadCZF7j8zvKNvVj0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/2] tools/xenstore: set oom score for xenstore daemon on Linux
Date: Tue,  8 Jun 2021 07:58:38 +0200
Message-Id: <20210608055839.10313-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210608055839.10313-1-jgross@suse.com>
References: <20210608055839.10313-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xenstored is absolutely mandatory for a Xen host and it can't be
restarted, so being killed by OOM-killer in case of memory shortage is
to be avoided.

Set /proc/$pid/oom_score_adj (if available) to -500 in order to allow
xenstored to use large amounts of memory without being killed.

Make sure the pid file isn't a left-over from a previous run delete it
before starting xenstored.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- set oom score from launch script (Julien Grall)
- split off open file descriptor limit setting (Julien Grall)
---
 tools/hotplug/Linux/launch-xenstore.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/hotplug/Linux/launch-xenstore.in b/tools/hotplug/Linux/launch-xenstore.in
index 019f9d6f4d..3ad71e3d08 100644
--- a/tools/hotplug/Linux/launch-xenstore.in
+++ b/tools/hotplug/Linux/launch-xenstore.in
@@ -59,11 +59,14 @@ test -f @CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons && . @CONFIG_DIR@/@CONFIG_LEAF
 		echo "No xenstored found"
 		exit 1
 	}
+	rm -f @XEN_RUN_DIR@/xenstored.pid
 
 	echo -n Starting $XENSTORED...
 	$XENSTORED --pid-file @XEN_RUN_DIR@/xenstored.pid $XENSTORED_ARGS
 
 	systemd-notify --booted 2>/dev/null || timeout_xenstore $XENSTORED || exit 1
+	XS_PID=`cat @XEN_RUN_DIR@/xenstored.pid`
+	echo -500 >/proc/$XS_PID/oom_score_adj
 
 	exit 0
 }
-- 
2.26.2


