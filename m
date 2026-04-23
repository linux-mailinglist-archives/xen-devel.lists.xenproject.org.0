Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJEbJrfT6WmmlAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 10:09:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B94B744E5A2
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 10:09:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1291715.1570575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFp7U-0006PQ-0F; Thu, 23 Apr 2026 08:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291715.1570575; Thu, 23 Apr 2026 08:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFp7T-0006O3-Sz; Thu, 23 Apr 2026 08:09:07 +0000
Received: by outflank-mailman (input) for mailman id 1291715;
 Thu, 23 Apr 2026 08:09:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wFp7T-0006NT-8D
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 08:09:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFp7S-000vQl-KM
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 10:09:06 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69e9d39c-e002-0a2a0a5209dd-0a2a450688f4-28
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 10:09:06 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69e9d3a2-7371-0a2a45060019-c387df83b19c-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 10:09:06 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0B3A95BCFD;
 Thu, 23 Apr 2026 08:09:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DC22C593B0;
 Thu, 23 Apr 2026 08:09:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BK6qNKHT6WkJXgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 23 Apr 2026 08:09:05 +0000
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
	t=1776931746; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UsqG9+X/SlnL7BdCX9NqfxTSD27zTpZHRZjBmI+WZ58=;
	b=sOcM2DmO3hCcSkkSOQqMDHZYE7hbZLXGjCFTeAxkZHtd2fSEBs7jJH1udglCJDU4Xc1oEf
	bRFKKGOf8H7wUjbiLqbNGg2lyNFRyMFDwZTfpc7g+EEmdsP+y0Hf2gbpJy8OYnFhhxOT+Z
	VLReKxDQvom9d3+23Tx3fShk69h33+o=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1776931746; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UsqG9+X/SlnL7BdCX9NqfxTSD27zTpZHRZjBmI+WZ58=;
	b=sOcM2DmO3hCcSkkSOQqMDHZYE7hbZLXGjCFTeAxkZHtd2fSEBs7jJH1udglCJDU4Xc1oEf
	bRFKKGOf8H7wUjbiLqbNGg2lyNFRyMFDwZTfpc7g+EEmdsP+y0Hf2gbpJy8OYnFhhxOT+Z
	VLReKxDQvom9d3+23Tx3fShk69h33+o=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: dmukhin@ford.com,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 4/4] tools/xenstored: remove permissions related to dead domain
Date: Thu, 23 Apr 2026 10:08:40 +0200
Message-ID: <20260423080840.530547-5-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423080840.530547-1-jgross@suse.com>
References: <20260423080840.530547-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-purgate-ID: tlsNG-16d1c6/1776931746-50767D75-5A35755B/0/0
X-purgate-type: clean
X-purgate-size: 3648
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: B94B744E5A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Wit unprivileged domains now capable to use the @releaseDomain watch,
there is no reason not to remove any node permissions which relate to
a domain which has been removed.

This resolves a complex scenario where a new domain could inherit the
permissions of an old one with the same domid.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/domain.c | 61 ++++++++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 25 deletions(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 0bd2a1891a..6fbb5c061a 100644
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
@@ -596,10 +582,38 @@ static int domain_tree_remove_sub(const void *ctx, struct connection *conn,
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
+		trace("moving orphaned node %s to dom0\n", node->name);
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
@@ -607,12 +621,9 @@ static void domain_tree_remove(struct domain *domain)
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


