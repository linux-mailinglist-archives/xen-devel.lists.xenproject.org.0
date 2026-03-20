Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bCmREXJhvWlF9gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 16:02:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3E62DC356
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 16:02:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1258105.1552304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3bMM-0003CO-0C; Fri, 20 Mar 2026 15:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1258105.1552304; Fri, 20 Mar 2026 15:01:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3bML-0003Af-TM; Fri, 20 Mar 2026 15:01:57 +0000
Received: by outflank-mailman (input) for mailman id 1258105;
 Fri, 20 Mar 2026 15:01:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0BFG=BU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w3bMK-0001Ve-Sz
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 15:01:56 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcaca997-246d-11f1-b164-2bf370ae4941;
 Fri, 20 Mar 2026 16:01:56 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B637D4D27B;
 Fri, 20 Mar 2026 15:01:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 948E942866;
 Fri, 20 Mar 2026 15:01:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8GkuI2JhvWnZXAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 20 Mar 2026 15:01:54 +0000
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
X-Inumbo-ID: bcaca997-246d-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774018915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JqiRC8vY/BabN/ScKXSBNzHtV8BG2Sr2nwnaVeRBWB4=;
	b=E1bB3zzQ9LYXvcwwL0yv+0OWTBTjjskmRHpH6qF5xj5O5qhY/gb4Q2tcMsWo9j1nuyBDi7
	eNHLAnucRw6g7JGjPdY4UKH8OkVF5KhzpMwrxQiacPIGifBOgLCwEg/2y1QQNKRRnlUb/r
	/2HkFi1LzV0RO49bRHNiKF1hJmg7Jj0=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=KM6joA7O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774018914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JqiRC8vY/BabN/ScKXSBNzHtV8BG2Sr2nwnaVeRBWB4=;
	b=KM6joA7OitlDGMXG+C0o6AK8mDsKWfk11xwGvlgM06RWH2LQPnNPKROxxOXc48wgvngYYL
	zo5aHOUYFOjX6pq/iaYDjtOYQZmBqo8piUcz3nocJHpEMHcFLR0KOvpB8IhM+o/HAnf7cy
	UMKop0m7iI4zoeztaaHUOzo1Qh09MWA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 06/12] tools/xenstored: split acc[] array in struct domain
Date: Fri, 20 Mar 2026 16:01:14 +0100
Message-ID: <20260320150120.874878-7-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320150120.874878-1-jgross@suse.com>
References: <20260320150120.874878-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[vates.tech:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid,vates.tech:email]
X-Rspamd-Queue-Id: 4A3E62DC356
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Prepare using per-domain quota by splitting the acc[] array in struct
domain into an array with the current accounting data, and an array
of type struct quota for the per-domain quota and the seen max value
of the domain.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
 tools/xenstored/domain.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index cfc8fd0cb4..b82f2d5167 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -143,10 +143,8 @@ struct domain
 	bool introduced;
 
 	/* Accounting data for this domain. */
-	struct acc {
-		unsigned int val;
-		unsigned int max;
-	} acc[ACC_N];
+	unsigned int acc_val[ACC_N];
+	struct quota acc[ACC_N];
 
 	/* Memory quota data for this domain. */
 	bool soft_quota_reported;
@@ -413,7 +411,7 @@ bool domain_quota_add_exceeds(struct domain *d, enum accitem what, int add)
 	if (add < 0 || !d)
 		return false;
 
-	return domain_quota_val_exceeds(d, what, d->acc[what].val + add);
+	return domain_quota_val_exceeds(d, what, d->acc_val[what] + add);
 }
 
 static bool check_indexes(XENSTORE_RING_IDX cons, XENSTORE_RING_IDX prod)
@@ -585,7 +583,7 @@ static int domain_tree_remove_sub(const void *ctx, struct connection *conn,
 		ret = WALK_TREE_SKIP_CHILDREN;
 	}
 
-	return domain->acc[ACC_NODES].val ? ret : WALK_TREE_SUCCESS_STOP;
+	return domain->acc_val[ACC_NODES] ? ret : WALK_TREE_SUCCESS_STOP;
 }
 
 static void domain_tree_remove(struct domain *domain)
@@ -593,7 +591,7 @@ static void domain_tree_remove(struct domain *domain)
 	int ret;
 	struct walk_funcs walkfuncs = { .enter = domain_tree_remove_sub };
 
-	if (domain->acc[ACC_NODES].val) {
+	if (domain->acc_val[ACC_NODES]) {
 		ret = walk_node_tree(domain, NULL, "/", &walkfuncs, domain);
 		if (ret == WALK_TREE_ERROR_STOP)
 			syslog(LOG_ERR,
@@ -789,7 +787,7 @@ int domain_get_quota(const void *ctx, struct connection *conn,
 			continue;
 		resp = talloc_asprintf_append(resp, "%-17s: %8u (max %8u)\n",
 					      quota_adm[i].name,
-					      d->acc[i].val, d->acc[i].max);
+					      d->acc_val[i], d->acc[i].max);
 		if (!resp)
 			return ENOMEM;
 	}
@@ -1673,10 +1671,10 @@ static int domain_acc_add_valid(struct domain *d, enum accitem what, int add)
 {
 	unsigned int val;
 
-	assert(what < ARRAY_SIZE(d->acc));
+	assert(what < ARRAY_SIZE(d->acc_val));
 
-	if ((add < 0 && -add > d->acc[what].val) ||
-	    (add > 0 && (INT_MAX - d->acc[what].val) < add)) {
+	if ((add < 0 && -add > d->acc_val[what]) ||
+	    (add > 0 && (INT_MAX - d->acc_val[what]) < add)) {
 		/*
 		 * In a transaction when a node is being added/removed AND the
 		 * same node has been added/removed outside the transaction in
@@ -1687,7 +1685,7 @@ static int domain_acc_add_valid(struct domain *d, enum accitem what, int add)
 		return (add < 0) ? 0 : INT_MAX;
 	}
 
-	val = d->acc[what].val + add;
+	val = d->acc_val[what] + add;
 	domain_acc_valid_max(d, what, val);
 
 	return val;
@@ -1746,10 +1744,10 @@ static int domain_acc_add(struct connection *conn, unsigned int domid,
 	}
 
 	trace_acc("global change domid %u: what=%u %u add %d\n", domid, what,
-		  d->acc[what].val, add);
-	d->acc[what].val = domain_acc_add_valid(d, what, add);
+		  d->acc_val[what], add);
+	d->acc_val[what] = domain_acc_add_valid(d, what, add);
 
-	return d->acc[what].val;
+	return d->acc_val[what];
 }
 
 void acc_drop(struct connection *conn)
@@ -1793,7 +1791,7 @@ static int domain_reset_global_acc_sub(const void *k, void *v, void *arg)
 	unsigned int i;
 
 	for (i = 0; i < ACC_N; i++)
-		d->acc[i].max = d->acc[i].val;
+		d->acc[i].max = d->acc_val[i];
 
 	return 0;
 }
@@ -2233,7 +2231,7 @@ static int domain_check_acc_init_sub(const void *k, void *v, void *arg)
 	 * If everything is correct incrementing the value for each node will
 	 * result in dom->nodes being 0 at the end.
 	 */
-	dom->nodes = -d->acc[ACC_NODES].val;
+	dom->nodes = -d->acc_val[ACC_NODES];
 
 	if (hashtable_add(domains, &dom->domid, dom)) {
 		talloc_free(dom);
@@ -2288,7 +2286,7 @@ static int domain_check_acc_cb(const void *k, void *v, void *arg)
 	if (!d)
 		return 0;
 
-	d->acc[ACC_NODES].val += dom->nodes;
+	d->acc_val[ACC_NODES] += dom->nodes;
 
 	return 0;
 }
-- 
2.53.0


