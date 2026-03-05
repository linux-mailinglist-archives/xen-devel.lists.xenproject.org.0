Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id PjgfKKGKqWl3/AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:52:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA4F212C78
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:52:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246666.1545791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy97o-0000Tb-UO; Thu, 05 Mar 2026 13:52:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246666.1545791; Thu, 05 Mar 2026 13:52:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy97o-0000RL-Qi; Thu, 05 Mar 2026 13:52:24 +0000
Received: by outflank-mailman (input) for mailman id 1246666;
 Thu, 05 Mar 2026 13:52:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y0Pc=BF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vy97n-00008m-IK
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 13:52:23 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8833b762-189a-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Mar 2026 14:52:21 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 48E335BD8E;
 Thu,  5 Mar 2026 13:52:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 25A873EA68;
 Thu,  5 Mar 2026 13:52:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qiwdCJWKqWlYTgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 05 Mar 2026 13:52:21 +0000
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
X-Inumbo-ID: 8833b762-189a-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772718741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g9IGAHWgEG6DCdCIzvkRdi4JDcDDT2+/4tidv+QAPpw=;
	b=GXk2ra0R2l0UyNGcqR1QsOjJOSvLHndSoaFtUNeNGDQVuPbluI6ANqX3N3c9hQzNG5kzxq
	LIn/mbbxy4VQlEJmnG49TBOry1E5/gw8tSYRUugBK4J9I1hi5Lwj2y8oubOzQ9JsIkFWsx
	OB0k8MKFzhWhcFoOGsmDu1HRbxcmqyg=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772718741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g9IGAHWgEG6DCdCIzvkRdi4JDcDDT2+/4tidv+QAPpw=;
	b=GXk2ra0R2l0UyNGcqR1QsOjJOSvLHndSoaFtUNeNGDQVuPbluI6ANqX3N3c9hQzNG5kzxq
	LIn/mbbxy4VQlEJmnG49TBOry1E5/gw8tSYRUugBK4J9I1hi5Lwj2y8oubOzQ9JsIkFWsx
	OB0k8MKFzhWhcFoOGsmDu1HRbxcmqyg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 02/11] tools/xenstored: add central quota check functions
Date: Thu,  5 Mar 2026 14:51:59 +0100
Message-ID: <20260305135208.2208663-3-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305135208.2208663-1-jgross@suse.com>
References: <20260305135208.2208663-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.79
X-Spam-Level: 
X-Rspamd-Queue-Id: DCA4F212C78
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Add central functions for checking a value (either an absolute one or
the current domain value plus an offset) against a specific quota.

This is in preparation of introducing per-domain quota.

The required changes allow to drop the "update" parameter from
domain_nbentry_fix().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/core.c        |  4 +-
 tools/xenstored/domain.c      | 74 +++++++++++++++++------------------
 tools/xenstored/domain.h      |  7 ++--
 tools/xenstored/transaction.c |  2 +-
 tools/xenstored/watch.c       |  4 +-
 5 files changed, 43 insertions(+), 48 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index d509736c32..5a4bf3e302 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -1538,7 +1538,7 @@ static struct node *create_node(struct connection *conn, const void *ctx,
 	for (i = node; i; i = i->parent) {
 		/* i->parent is set for each new node, so check quota. */
 		if (i->parent &&
-		    domain_nbentry(conn) >= hard_quotas[ACC_NODES].val) {
+		    domain_check_quota_add(conn->domain, ACC_NODES, 1)) {
 			ret = ENOSPC;
 			goto err;
 		}
@@ -2320,7 +2320,7 @@ void setup_structure(bool live_update)
 		manual_node("/tool/xenstored", NULL);
 		manual_node("@releaseDomain", NULL);
 		manual_node("@introduceDomain", NULL);
-		domain_nbentry_fix(priv_domid, 5, true);
+		domain_nbentry_fix(priv_domid, 5);
 	}
 }
 
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index e453b3061f..1df9265ad5 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -389,6 +389,25 @@ void wrl_apply_debit_trans_commit(struct connection *conn)
 	wrl_apply_debit_actual(conn->domain);
 }
 
+static bool domain_check_quota_val(struct domain *d, enum accitem what,
+				   unsigned int val)
+{
+	unsigned int quota = hard_quotas[what].val;
+
+	if (!quota || !domid_is_unprivileged(d->domid))
+		return false;
+
+	return val >= quota;
+}
+
+bool domain_check_quota_add(struct domain *d, enum accitem what, int add)
+{
+	if (add < 0 || !d)
+		return false;
+
+	return domain_check_quota_val(d, what, d->acc[what].val + add);
+}
+
 static bool check_indexes(XENSTORE_RING_IDX cons, XENSTORE_RING_IDX prod)
 {
 	return ((prod - cons) <= XENSTORE_RING_SIZE);
@@ -490,10 +509,9 @@ static bool domain_can_read(struct connection *conn)
 	if (domain_is_unprivileged(conn)) {
 		if (domain->wrl_credit < 0)
 			return false;
-		if (domain->acc[ACC_OUTST].val >= hard_quotas[ACC_OUTST].val)
+		if (domain_check_quota_add(domain, ACC_OUTST, 0))
 			return false;
-		if (domain->acc[ACC_MEM].val >= hard_quotas[ACC_MEM].val &&
-		    hard_quotas[ACC_MEM].val)
+		if (domain_check_quota_add(domain, ACC_MEM, 0))
 			return false;
 	}
 
@@ -904,16 +922,20 @@ do {						\
 
 int acc_fix_domains(struct list_head *head, bool chk_quota, bool update)
 {
+	struct domain *d;
 	struct changed_domain *cd;
-	int cnt;
 
 	list_for_each_entry(cd, head, list) {
-		cnt = domain_nbentry_fix(cd->domid, cd->acc[ACC_NODES], update);
-		if (!update) {
-			if (chk_quota && cnt >= hard_quotas[ACC_NODES].val)
-				return ENOSPC;
-			if (cnt < 0)
+		if (update) {
+			domain_nbentry_fix(cd->domid, cd->acc[ACC_NODES]);
+		} else if (chk_quota) {
+			d = find_or_alloc_existing_domain(cd->domid);
+
+			if (!d)
 				return ENOMEM;
+			if (domain_check_quota_add(d, ACC_NODES,
+						   cd->acc[ACC_NODES]))
+				return ENOSPC;
 		}
 	}
 
@@ -1732,7 +1754,7 @@ bool domain_max_chk(const struct connection *conn, enum accitem what,
 	if (!conn || !conn->domain)
 		return false;
 
-	if (domain_is_unprivileged(conn) && val > hard_quotas[what].val)
+	if (domain_check_quota_val(conn->domain, what, val))
 		return true;
 
 	domain_acc_valid_max(conn->domain, what, val);
@@ -1752,21 +1774,9 @@ int domain_nbentry_dec(struct connection *conn, unsigned int domid)
 	       ? errno : 0;
 }
 
-int domain_nbentry_fix(unsigned int domid, int num, bool update)
-{
-	int ret;
-
-	ret = domain_acc_add(NULL, domid, ACC_NODES, update ? num : 0, update);
-	if (ret < 0 || update)
-		return ret;
-
-	return domid_is_unprivileged(domid) ? ret + num : 0;
-}
-
-unsigned int domain_nbentry(struct connection *conn)
+int domain_nbentry_fix(unsigned int domid, int num)
 {
-	return domain_is_unprivileged(conn)
-	       ? domain_acc_add(conn, conn->id, ACC_NODES, 0, true) : 0;
+	return domain_acc_add(NULL, domid, ACC_NODES, num, true);
 }
 
 static bool domain_chk_quota(struct connection *conn, unsigned int mem)
@@ -1781,7 +1791,7 @@ static bool domain_chk_quota(struct connection *conn, unsigned int mem)
 	domain = conn->domain;
 	now = time(NULL);
 
-	if (mem >= hard_quotas[ACC_MEM].val && hard_quotas[ACC_MEM].val) {
+	if (domain_check_quota_val(domain, ACC_MEM, mem)) {
 		if (domain->hard_quota_reported)
 			return true;
 		syslog(LOG_ERR, "Domain %u exceeds hard memory quota, Xenstore interface to domain stalled\n",
@@ -1857,13 +1867,6 @@ void domain_watch_dec(struct connection *conn)
 	domain_acc_add(conn, conn->id, ACC_WATCH, -1, true);
 }
 
-int domain_watch(struct connection *conn)
-{
-	return (domain_is_unprivileged(conn))
-		? domain_acc_add(conn, conn->id, ACC_WATCH, 0, true)
-		: 0;
-}
-
 void domain_outstanding_inc(struct connection *conn)
 {
 	domain_acc_add(conn, conn->id, ACC_OUTST, 1, true);
@@ -1884,13 +1887,6 @@ void domain_transaction_dec(struct connection *conn)
 	domain_acc_add(conn, conn->id, ACC_TRANS, -1, true);
 }
 
-unsigned int domain_transaction_get(struct connection *conn)
-{
-	return (domain_is_unprivileged(conn))
-		? domain_acc_add(conn, conn->id, ACC_TRANS, 0, true)
-		: 0;
-}
-
 const char *dump_state_connections(FILE *fp)
 {
 	const char *ret = NULL;
diff --git a/tools/xenstored/domain.h b/tools/xenstored/domain.h
index 28186ccac0..b229f6f4e0 100644
--- a/tools/xenstored/domain.h
+++ b/tools/xenstored/domain.h
@@ -113,8 +113,7 @@ int domain_alloc_permrefs(struct node_perms *perms);
 /* Quota manipulation */
 int domain_nbentry_inc(struct connection *conn, unsigned int domid);
 int domain_nbentry_dec(struct connection *conn, unsigned int domid);
-int domain_nbentry_fix(unsigned int domid, int num, bool update);
-unsigned int domain_nbentry(struct connection *conn);
+int domain_nbentry_fix(unsigned int domid, int num);
 int domain_memory_add(struct connection *conn, unsigned int domid, int mem,
 		      bool no_quota_check);
 
@@ -141,12 +140,10 @@ static inline void domain_memory_add_nochk(struct connection *conn,
 }
 void domain_watch_inc(struct connection *conn);
 void domain_watch_dec(struct connection *conn);
-int domain_watch(struct connection *conn);
 void domain_outstanding_inc(struct connection *conn);
 void domain_outstanding_dec(struct connection *conn, unsigned int domid);
 void domain_transaction_inc(struct connection *conn);
 void domain_transaction_dec(struct connection *conn);
-unsigned int domain_transaction_get(struct connection *conn);
 int domain_get_quota(const void *ctx, struct connection *conn,
 		     unsigned int domid);
 
@@ -161,6 +158,8 @@ int domain_max_global_acc(const void *ctx, struct connection *conn);
 void domain_reset_global_acc(void);
 bool domain_max_chk(const struct connection *conn, enum accitem what,
 		    unsigned int val);
+bool domain_check_quota_add(struct domain *d, enum accitem what,
+			    int add);
 
 extern long wrl_ntransactions;
 
diff --git a/tools/xenstored/transaction.c b/tools/xenstored/transaction.c
index 167cd597fd..ccf93a1132 100644
--- a/tools/xenstored/transaction.c
+++ b/tools/xenstored/transaction.c
@@ -470,7 +470,7 @@ int do_transaction_start(const void *ctx, struct connection *conn,
 	if (conn->transaction)
 		return EBUSY;
 
-	if (domain_transaction_get(conn) > hard_quotas[ACC_TRANS].val)
+	if (domain_check_quota_add(conn->domain, ACC_TRANS, 1))
 		return ENOSPC;
 
 	/* Attach transaction to ctx for autofree until it's complete */
diff --git a/tools/xenstored/watch.c b/tools/xenstored/watch.c
index b66a9f1a39..36e4d33f22 100644
--- a/tools/xenstored/watch.c
+++ b/tools/xenstored/watch.c
@@ -220,8 +220,8 @@ int do_watch(const void *ctx, struct connection *conn, struct buffered_data *in)
 			return EEXIST;
 	}
 
-	if (domain_watch(conn) > hard_quotas[ACC_WATCH].val)
-		return E2BIG;
+	if (domain_check_quota_add(conn->domain, ACC_WATCH, 1))
+		return ENOSPC;
 
 	watch = add_watch(conn, vec[0], vec[1], relative, false);
 	if (!watch)
-- 
2.53.0


