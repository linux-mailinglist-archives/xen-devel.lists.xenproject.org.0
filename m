Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7999F6FAF72
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 13:57:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531441.827135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvzUv-00034u-Dl; Mon, 08 May 2023 11:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531441.827135; Mon, 08 May 2023 11:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvzUv-0002ui-6X; Mon, 08 May 2023 11:57:45 +0000
Received: by outflank-mailman (input) for mailman id 531441;
 Mon, 08 May 2023 11:57:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SOTd=A5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pvzMc-0004FA-L0
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 11:49:10 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 583cc118-ed96-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 13:49:10 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D0FD921FBD;
 Mon,  8 May 2023 11:49:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A49951346B;
 Mon,  8 May 2023 11:49:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id G+OqJrXhWGSUNwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 08 May 2023 11:49:09 +0000
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
X-Inumbo-ID: 583cc118-ed96-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683546549; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/kKszQ9GbTiBVpwvUDCT+QKEBlgA1iwA78V+6Rsue9o=;
	b=Em0i6C0a8i6U1/nWs5J9ugR/q0r/fa7JqrQ5wQ3y7DNWAwJXeJhqSVhWQ2U0HAX3wLvGus
	ZIaD2Yf3zxLnHmMiZBhflv6MPzYaZXVhWISdDyu6sl//n9FqMvqz8kOYueOPd9H5CtVcK/
	08qnxiY9NM7rXbwhFD79fE2SeKszQv0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v5 13/14] tools/xenstore: switch get_optval_int() to get_optval_uint()
Date: Mon,  8 May 2023 13:47:53 +0200
Message-Id: <20230508114754.31514-14-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230508114754.31514-1-jgross@suse.com>
References: <20230508114754.31514-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let get_optval_int() return an unsigned value and rename it
accordingly.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V5:
- new patch, carved out from next patch in series (Julien Grall)
---
 tools/xenstore/xenstored_core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index fce73b883e..86ec7ab446 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2700,13 +2700,13 @@ int dom0_domid = 0;
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
@@ -2726,7 +2726,7 @@ static void set_timeout(const char *arg)
 
 	if (!eq)
 		barf("quotas must be specified via <what>=<seconds>\n");
-	val = get_optval_int(eq + 1);
+	val = get_optval_uint(eq + 1);
 	if (what_matches(arg, "watch-event"))
 		timeout_watch_event_msec = val * 1000;
 	else
@@ -2740,7 +2740,7 @@ static void set_quota(const char *arg, bool soft)
 
 	if (!eq)
 		barf("quotas must be specified via <what>=<nb>\n");
-	val = get_optval_int(eq + 1);
+	val = get_optval_uint(eq + 1);
 	if (what_matches(arg, "outstanding") && !soft)
 		quota_req_outstanding = val;
 	else if (what_matches(arg, "transaction-nodes") && !soft)
-- 
2.35.3


