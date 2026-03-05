Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICYuMa6KqWl3/AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:52:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A366B212CDE
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:52:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246681.1545820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy984-0001ct-PB; Thu, 05 Mar 2026 13:52:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246681.1545820; Thu, 05 Mar 2026 13:52:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy984-0001ZW-LY; Thu, 05 Mar 2026 13:52:40 +0000
Received: by outflank-mailman (input) for mailman id 1246681;
 Thu, 05 Mar 2026 13:52:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y0Pc=BF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vy983-00008m-Dt
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 13:52:39 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91e25457-189a-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Mar 2026 14:52:37 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 958FC3ED7C;
 Thu,  5 Mar 2026 13:52:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 756F13EA68;
 Thu,  5 Mar 2026 13:52:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id TT6VG6WKqWmETgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 05 Mar 2026 13:52:37 +0000
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
X-Inumbo-ID: 91e25457-189a-11f1-9ccf-f158ae23cfc8
Authentication-Results: smtp-out1.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 05/11] tools/xenstored: split acc[] array in struct domain
Date: Thu,  5 Mar 2026 14:52:02 +0100
Message-ID: <20260305135208.2208663-6-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305135208.2208663-1-jgross@suse.com>
References: <20260305135208.2208663-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: A366B212CDE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.51 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[suse.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email]
X-Rspamd-Action: no action

Prepare using per-domain quota by splitting the acc[] array in struct
domain into an array with the current accounting data, and an array
of type struct quota for the per-domain quota and the seen max value
of the domain.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/domain.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 694ae58973..9bd3ac7aca 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -140,10 +140,8 @@ struct domain
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
@@ -410,7 +408,7 @@ bool domain_check_quota_add(struct domain *d, enum accitem what, int add)
 	if (add < 0 || !d)
 		return false;
 
-	return domain_check_quota_val(d, what, d->acc[what].val + add);
+	return domain_check_quota_val(d, what, d->acc_val[what] + add);
 }
 
 static bool check_indexes(XENSTORE_RING_IDX cons, XENSTORE_RING_IDX prod)
@@ -582,7 +580,7 @@ static int domain_tree_remove_sub(const void *ctx, struct connection *conn,
 		ret = WALK_TREE_SKIP_CHILDREN;
 	}
 
-	return domain->acc[ACC_NODES].val ? ret : WALK_TREE_SUCCESS_STOP;
+	return domain->acc_val[ACC_NODES] ? ret : WALK_TREE_SUCCESS_STOP;
 }
 
 static void domain_tree_remove(struct domain *domain)
@@ -590,7 +588,7 @@ static void domain_tree_remove(struct domain *domain)
 	int ret;
 	struct walk_funcs walkfuncs = { .enter = domain_tree_remove_sub };
 
-	if (domain->acc[ACC_NODES].val) {
+	if (domain->acc_val[ACC_NODES]) {
 		ret = walk_node_tree(domain, NULL, "/", &walkfuncs, domain);
 		if (ret == WALK_TREE_ERROR_STOP)
 			syslog(LOG_ERR,
@@ -774,7 +772,7 @@ int domain_get_quota(const void *ctx, struct connection *conn,
 			continue;
 		resp = talloc_asprintf_append(resp, "%-17s: %8u (max %8u)\n",
 					      quota_adm[i].name,
-					      d->acc[i].val, d->acc[i].max);
+					      d->acc_val[i], d->acc[i].max);
 		if (!resp)
 			return ENOMEM;
 	}
@@ -1637,10 +1635,10 @@ static int domain_acc_add_valid(struct domain *d, enum accitem what, int add)
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
@@ -1651,7 +1649,7 @@ static int domain_acc_add_valid(struct domain *d, enum accitem what, int add)
 		return (add < 0) ? 0 : INT_MAX;
 	}
 
-	val = d->acc[what].val + add;
+	val = d->acc_val[what] + add;
 	domain_acc_valid_max(d, what, val);
 
 	return val;
@@ -1710,10 +1708,10 @@ static int domain_acc_add(struct connection *conn, unsigned int domid,
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
@@ -1757,7 +1755,7 @@ static int domain_reset_global_acc_sub(const void *k, void *v, void *arg)
 	unsigned int i;
 
 	for (i = 0; i < ACC_N; i++)
-		d->acc[i].max = d->acc[i].val;
+		d->acc[i].max = d->acc_val[i];
 
 	return 0;
 }
@@ -2193,7 +2191,7 @@ static int domain_check_acc_init_sub(const void *k, void *v, void *arg)
 	 * If everything is correct incrementing the value for each node will
 	 * result in dom->nodes being 0 at the end.
 	 */
-	dom->nodes = -d->acc[ACC_NODES].val;
+	dom->nodes = -d->acc_val[ACC_NODES];
 
 	if (hashtable_add(domains, &dom->domid, dom)) {
 		talloc_free(dom);
@@ -2248,7 +2246,7 @@ static int domain_check_acc_cb(const void *k, void *v, void *arg)
 	if (!d)
 		return 0;
 
-	d->acc[ACC_NODES].val += dom->nodes;
+	d->acc_val[ACC_NODES] += dom->nodes;
 
 	return 0;
 }
-- 
2.53.0


