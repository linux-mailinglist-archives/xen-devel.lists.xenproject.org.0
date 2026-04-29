Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DpNA2n08WmElwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 14:07:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F8A493DCB
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 14:07:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297290.1573387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI3gt-0007s5-KW; Wed, 29 Apr 2026 12:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297290.1573387; Wed, 29 Apr 2026 12:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI3gt-0007qN-H5; Wed, 29 Apr 2026 12:06:55 +0000
Received: by outflank-mailman (input) for mailman id 1297290;
 Wed, 29 Apr 2026 12:06:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wI3gr-0007jq-Ey
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 12:06:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI3gq-00CWTK-R9
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 14:06:52 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69f1f44e-e002-0a2a0a5209dd-0a2a450789ca-48
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 14:06:52 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69f1f45c-229c-0a2a45070019-c387df82dc42-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 14:06:52 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E39B46A882;
 Wed, 29 Apr 2026 12:06:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BB4D3593B1;
 Wed, 29 Apr 2026 12:06:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 5ECsLFP08WlnVgAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 29 Apr 2026 12:06:43 +0000
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
	t=1777464408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=neoM0rxwlNWkYjpN6UzzXgAR6Uz/BSePabcIeLnOQEY=;
	b=crpuUwj03HTzALbP6aMvKtI+UrUDFjtrcMk488Web7k5nVA8/2VDsL/z/P6OpabobA4QRD
	9gf5kaoxLSLiLKLLb11KVjiKArOcPG2ATT228i8V9AfxxBRmSRjWzbi2oB5Qr1izR1MAu9
	eny0KlFe305xNPGnkcSGWzoXJf6GMx4=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1777464403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=neoM0rxwlNWkYjpN6UzzXgAR6Uz/BSePabcIeLnOQEY=;
	b=ZSpWGLqasrDc/j1ptizTy2a1M7sNMVRN5jKpUou289QW+BCKG9frcmynpM4OURxI3sdoIP
	Nj8UCc7h+hImONRLCNvmNexl7f1LRFpzZdB8XuEGIvDB3sSM9N1Sbnj5PlHFcQQphdZd4A
	83Nk5f5igr8ymuTC2pqRmrDgGzF+rtQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 4/4] tools/xenstored: remove permissions related to dead domain
Date: Wed, 29 Apr 2026 14:06:19 +0200
Message-ID: <20260429120619.1013440-5-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429120619.1013440-1-jgross@suse.com>
References: <20260429120619.1013440-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-purgate-ID: tlsNG-ef75cf/1777464412-14E57C48-7515360F/0/0
X-purgate-type: clean
X-purgate-size: 3796
X-Rspamd-Queue-Id: 86F8A493DCB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:julien@xen.org,m:anthony.perard@vates.tech,m:jason.andryuk@amd.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.978];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]

Wit unprivileged domains now capable to use the @releaseDomain watch,
there is no reason not to remove any node permissions which relate to
a domain which has been removed.

This resolves a complex scenario where a new domain could inherit the
permissions of an old one with the same domid.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
V2: use priv_domid instead of literal 0 in message (Jason Andryuk)
---
 tools/xenstored/domain.c | 62 ++++++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 25 deletions(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 7074abd197..2db452144d 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -569,24 +569,10 @@ static int domain_tree_remove_sub(const void *ctx, struct connection *conn,
 				  struct node *node, void *arg)
 {
 	struct domain *domain = arg;
-	int ret = WALK_TREE_OK;
-
-	if (node->perms[0].id != domain->domid)
-		return WALK_TREE_OK;
+	bool node_changed = false;
+	unsigned int i;
 
-	if (keep_orphans) {
-		domain_nbentry_dec(NULL, domain->domid);
-		node->perms[0].id = priv_domid;
-		node->acc.memory = 0;
-		domain_nbentry_inc(NULL, priv_domid);
-		if (write_node_raw(NULL, node->name, node, NODE_MODIFY, true)) {
-			/* That's unfortunate. We only can try to continue. */
-			syslog(LOG_ERR,
-			       "error when moving orphaned node %s to dom0\n",
-			       node->name);
-		} else
-			trace("orphaned node %s moved to dom0\n", node->name);
-	} else {
+	if (node->perms[0].id == domain->domid && !keep_orphans) {
 		if (rm_node(NULL, ctx, node->name)) {
 			/* That's unfortunate. We only can try to continue. */
 			syslog(LOG_ERR,
@@ -596,10 +582,39 @@ static int domain_tree_remove_sub(const void *ctx, struct connection *conn,
 			trace("orphaned node %s deleted\n", node->name);
 
 		/* Skip children in all cases in order to avoid more errors. */
-		ret = WALK_TREE_SKIP_CHILDREN;
+		return WALK_TREE_SKIP_CHILDREN;
 	}
 
-	return domain->acc_val[ACC_NODES] ? ret : WALK_TREE_SUCCESS_STOP;
+	if (node->perms[0].id == domain->domid) {
+		domain_nbentry_dec(NULL, domain->domid);
+		node->perms[0].id = priv_domid;
+		node->acc.memory = 0;
+		domain_nbentry_inc(NULL, priv_domid);
+		trace("moving orphaned node %s to dom%d\n", node->name,
+		      priv_domid);
+		node_changed = true;
+	}
+
+	for (i = 1; i < node->hdr.num_perms; i++) {
+		if (node->perms[i].id != domain->domid)
+			continue;
+		memmove(node->perms + i, node->perms + i + 1,
+			sizeof(*node->perms) * (node->hdr.num_perms - i - 1));
+		node->hdr.num_perms--;
+		i--;
+		node_changed = true;
+	}
+
+	if (node_changed) {
+		if (write_node_raw(NULL, node->name, node, NODE_MODIFY, true)) {
+			/* That's unfortunate. We only can try to continue. */
+			syslog(LOG_ERR,
+			       "error when writing modified node %s\n",
+			       node->name);
+		}
+	}
+
+	return WALK_TREE_OK;
 }
 
 static void domain_tree_remove(struct domain *domain)
@@ -607,12 +622,9 @@ static void domain_tree_remove(struct domain *domain)
 	int ret;
 	struct walk_funcs walkfuncs = { .enter = domain_tree_remove_sub };
 
-	if (domain->acc_val[ACC_NODES]) {
-		ret = walk_node_tree(domain, NULL, "/", &walkfuncs, domain);
-		if (ret == WALK_TREE_ERROR_STOP)
-			syslog(LOG_ERR,
-			       "error when looking for orphaned nodes\n");
-	}
+	ret = walk_node_tree(domain, NULL, "/", &walkfuncs, domain);
+	if (ret == WALK_TREE_ERROR_STOP)
+		syslog(LOG_ERR, "error when looking for orphaned nodes\n");
 
 	walk_node_tree(domain, NULL, "@releaseDomain", &walkfuncs, domain);
 	walk_node_tree(domain, NULL, "@introduceDomain", &walkfuncs, domain);
-- 
2.53.0


