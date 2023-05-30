Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA18D71587C
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 10:27:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540821.842879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3uhg-0002hM-IK; Tue, 30 May 2023 08:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540821.842879; Tue, 30 May 2023 08:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3uhg-0002ae-CI; Tue, 30 May 2023 08:27:40 +0000
Received: by outflank-mailman (input) for mailman id 540821;
 Tue, 30 May 2023 08:27:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2tj/=BT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q3ufl-0003jy-EJ
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 08:25:41 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f145bb4-fec3-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 10:25:39 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 94E5621A59;
 Tue, 30 May 2023 08:25:39 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 669251342F;
 Tue, 30 May 2023 08:25:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id Wv2vFwOzdWSLEAAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 30 May 2023 08:25:39 +0000
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
X-Inumbo-ID: 8f145bb4-fec3-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685435139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=REpVrQ+Mytzbnn74qnGvj4ZQIpyZ9Gk/rmciaMx2IaE=;
	b=fz+FiJi+4hKrrcmBY8TuKMwvh+b6y7xL5GKaxpCAshU8cVJCe0uO2SV3ngjRmUbBiRXHsA
	E6ncrbRx/qNjJSSgz3p/LPW+nfnAmvP2wFXLtqJNrQ2WJmcE2Il0kCf4+3Lrj5jAGM0YR3
	dqdzDX+vxN0KH6oZKOZ06adaJ4HqH4k=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v6 13/14] tools/xenstore: switch get_optval_int() to get_optval_uint()
Date: Tue, 30 May 2023 10:24:23 +0200
Message-Id: <20230530082424.32126-14-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230530082424.32126-1-jgross@suse.com>
References: <20230530082424.32126-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let get_optval_int() return an unsigned value and rename it
accordingly.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V5:
- new patch, carved out from next patch in series (Julien Grall)
---
 tools/xenstore/xenstored_core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index dd00f74cb6..0a350dd6f8 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2706,13 +2706,13 @@ int dom0_domid = 0;
 int dom0_event = 0;
 int priv_domid = 0;
 
-static int get_optval_int(const char *arg)
+static unsigned int get_optval_uint(const char *arg)
 {
 	char *end;
-	long val;
+	unsigned long val;
 
-	val = strtol(arg, &end, 10);
-	if (!*arg || *end || val < 0 || val > INT_MAX)
+	val = strtoul(arg, &end, 10);
+	if (!*arg || *end || val > INT_MAX)
 		barf("invalid parameter value \"%s\"\n", arg);
 
 	return val;
@@ -2732,7 +2732,7 @@ static void set_timeout(const char *arg)
 
 	if (!eq)
 		barf("quotas must be specified via <what>=<seconds>\n");
-	val = get_optval_int(eq + 1);
+	val = get_optval_uint(eq + 1);
 	if (what_matches(arg, "watch-event"))
 		timeout_watch_event_msec = val * 1000;
 	else
@@ -2746,7 +2746,7 @@ static void set_quota(const char *arg, bool soft)
 
 	if (!eq)
 		barf("quotas must be specified via <what>=<nb>\n");
-	val = get_optval_int(eq + 1);
+	val = get_optval_uint(eq + 1);
 	if (what_matches(arg, "outstanding") && !soft)
 		quota_req_outstanding = val;
 	else if (what_matches(arg, "transaction-nodes") && !soft)
-- 
2.35.3


