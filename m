Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INxpMLfT6WmmlAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 10:09:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C6144E5A4
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 10:09:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1291716.1570585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFp7V-0006g5-AH; Thu, 23 Apr 2026 08:09:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291716.1570585; Thu, 23 Apr 2026 08:09:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFp7V-0006e0-5g; Thu, 23 Apr 2026 08:09:09 +0000
Received: by outflank-mailman (input) for mailman id 1291716;
 Thu, 23 Apr 2026 08:09:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wFp7T-0006Ny-Ol
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 08:09:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFp7T-009pmL-5G
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 10:09:07 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69e9d39e-2eae-0a2a0a5409dd-0a2a4509aeac-16
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 10:09:07 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69e9d3a2-2497-0a2a45090019-c387df82c062-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 10:09:07 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9617E6A81E;
 Thu, 23 Apr 2026 08:09:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6EF76593A3;
 Thu, 23 Apr 2026 08:09:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id r7kHGpzT6WkEXgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 23 Apr 2026 08:09:00 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1776931741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mye3eCQVSlEbkJEnkWGbsqAfuNKV6b0HpEvbptC1tVQ=;
	b=sPZf6KqqJRs24isDTQ3Kms4qAjjRhGoIKm66ukA1cIV1y945/3NRA2RegytzyEVa9AQLuD
	FP0D0BomlwISbMcjxjjIXLVllHLi3lcs3GIFIeyIzdeerDPIR+46fB8fWFlU3ciME2ASqt
	AuzhPVG3swBKXn6zCZFHFdUpe05mjE0=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=AgfXxE44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1776931740; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mye3eCQVSlEbkJEnkWGbsqAfuNKV6b0HpEvbptC1tVQ=;
	b=AgfXxE44EPVmap4ZnIVWJtN9LpKEhQY9msq5nMBi1S9lBSMXtQBiigKT45Y5QpJDKvQFhM
	tKI0BRllurFsX1ml8neyfELHMKsl+9wJk9GM56MwN0LIklNoQhTa4WdpfUXgy8qMN8RwZL
	P2Uxz4krBpnib2eAupPqs2A36OL7wjc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: dmukhin@ford.com,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 3/4] tools/xenstored: allow @releaseDomain watch for all domains
Date: Thu, 23 Apr 2026 10:08:39 +0200
Message-ID: <20260423080840.530547-4-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423080840.530547-1-jgross@suse.com>
References: <20260423080840.530547-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-purgate-ID: tlsNG-bad1c0/1776931747-492B2A53-5C4844DD/0/0
X-purgate-type: clean
X-purgate-size: 2636
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmukhin@ford.com,m:jgross@suse.com,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 76C6144E5A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently the @releaseDomain watch is allowed for dom0 only. This is
problematic for guests which want to give other domains access to
Xenstore entries, as they have no simple way to tell when such a
domain is stopped.

Allow @releaseDomain to be usable by all domains as the default.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/core.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 5a621f53ba..421f227ff1 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2279,19 +2279,19 @@ struct connection *get_connection_by_id(unsigned int conn_id)
 }
 
 /* We create initial nodes manually. */
-static void manual_node(const char *name, const char *child)
+static void manual_node_perms(const char *name, const char *child,
+			      struct xs_permissions *perms,
+			      unsigned int n_perms)
 {
 	struct node *node;
-	struct xs_permissions perms = { .id = priv_domid,
-					.perms = XS_PERM_NONE };
 
 	node = talloc_zero(NULL, struct node);
 	if (!node)
 		barf_perror("Could not allocate initial node %s", name);
 
 	node->name = name;
-	node->perms = &perms;
-	node->hdr.num_perms = 1;
+	node->perms = perms;
+	node->hdr.num_perms = n_perms;
 	node->children = (char *)child;
 	if (child)
 		node->hdr.childlen = strlen(child) + 1;
@@ -2301,6 +2301,14 @@ static void manual_node(const char *name, const char *child)
 	talloc_free(node);
 }
 
+static void manual_node(const char *name, const char *child)
+{
+	struct xs_permissions perms = { .id = priv_domid,
+					.perms = XS_PERM_NONE };
+
+	manual_node_perms(name, child, &perms, 1);
+}
+
 static unsigned int hash_from_key_fn(const void *k)
 {
 	const char *str = k;
@@ -2320,6 +2328,11 @@ static int keys_equal_fn(const void *key1, const void *key2)
 
 void setup_structure(bool live_update)
 {
+	struct xs_permissions perms[] = {
+		{ .id = priv_domid,	.perms = XS_PERM_NONE },
+		{ .id = DOMID_ANY,	.perms = XS_PERM_READ },
+	};
+
 	nodes = create_hashtable(NULL, "nodes", hash_from_key_fn, keys_equal_fn,
 				 HASHTABLE_FREE_KEY | HASHTABLE_FREE_VALUE);
 	if (!nodes)
@@ -2331,7 +2344,8 @@ void setup_structure(bool live_update)
 		manual_node("/", "tool");
 		manual_node("/tool", "xenstored");
 		manual_node("/tool/xenstored", NULL);
-		manual_node("@releaseDomain", NULL);
+		manual_node_perms("@releaseDomain", NULL,
+				  perms, ARRAY_SIZE(perms));
 		manual_node("@introduceDomain", NULL);
 		domain_nbentry_fix(priv_domid, 5);
 	}
-- 
2.53.0


