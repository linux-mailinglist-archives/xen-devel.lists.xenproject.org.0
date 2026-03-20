Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NbrDnJhvWl09QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 16:02:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA11F2DC345
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 16:01:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1258099.1552278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3bME-0002NM-62; Fri, 20 Mar 2026 15:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1258099.1552278; Fri, 20 Mar 2026 15:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3bME-0002LL-1z; Fri, 20 Mar 2026 15:01:50 +0000
Received: by outflank-mailman (input) for mailman id 1258099;
 Fri, 20 Mar 2026 15:01:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0BFG=BU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w3bMC-0001Ve-Mg
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 15:01:48 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7b941d6-246d-11f1-b164-2bf370ae4941;
 Fri, 20 Mar 2026 16:01:47 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6C9315BDF1;
 Fri, 20 Mar 2026 15:01:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4BD3842866;
 Fri, 20 Mar 2026 15:01:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Y4FYEVJhvWk/XAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 20 Mar 2026 15:01:38 +0000
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
X-Inumbo-ID: b7b941d6-246d-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774018903; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/PcS/7XQ557sIjqSKbSX5CF48BnA+Ztcs9ICymueV/w=;
	b=gy+MTAPWgRFjoGgXB1ttiyIPkAjxMVtyZdEUOgaB3d2DlHxd0WrsqKlHqnifDzVlzQSMDL
	6sGO1hBya4UEn3XDGDbaUbmfK3HZYt+HZxO3S5Mt8610sRM4QxqlvB0u9ephMD4LqU+Izg
	YbLcgsyYyorCh0BE7I3phFBg8fO1Wyc=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=mo9MZ39Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774018898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/PcS/7XQ557sIjqSKbSX5CF48BnA+Ztcs9ICymueV/w=;
	b=mo9MZ39Y5662BNkZptfC09SxsSkiAc69252f8BV5wnxo7KdUdqaT7Rt06zYTdPb4uQhgR1
	xNrFkjaSWYmqtnhcWG7ZEFbOYGqC6RnaVprSLd4TDAXDE6/bmVG0TXCJS8QdOsPAN4lY0R
	JjtXTzMIq0GNwetNUMU6Idh10eq9L3M=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 03/12] tools/xenstored: add central quota check functions
Date: Fri, 20 Mar 2026 16:01:11 +0100
Message-ID: <20260320150120.874878-4-jgross@suse.com>
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
	RCVD_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	RSPAMD_URIBL_FAIL(0.00)[vates.tech:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid,vates.tech:email]
X-Rspamd-Queue-Id: BA11F2DC345
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add central functions for checking a value (either an absolute one or
the current domain value plus an offset) against a specific quota.

This is in preparation of introducing per-domain quota.

The required changes allow to drop the "update" parameter from
domain_nbentry_fix().

While at it, make the returned error for exceeded quota consistent by
changing one instance from "E2BIG" to "ENOSPC".

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
V2:
- expand commit message (Anthony Perard)
- rename domain_check_quota_*() to domain_quota_*_exceeds()
  (Jason Andryuk)
---
 tools/xenstored/core.c        |  4 +-
 tools/xenstored/domain.c      | 74 +++++++++++++++++------------------
 tools/xenstored/domain.h      |  6 +--
 tools/xenstored/transaction.c |  2 +-
 tools/xenstored/watch.c       |  4 +-
 5 files changed, 42 insertions(+), 48 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index e4d2fd4876..e86d947be4 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -1539,7 +1539,7 @@ static struct node *create_node(struct connection *conn, const void *ctx,
 	for (i = node; i; i = i->parent) {
 		/* i->parent is set for each new node, so check quota. */
 		if (i->parent &&
-		    domain_nbentry(conn) >= hard_quotas[ACC_NODES].val) {
+		    domain_quota_add_exceeds(conn->domain, ACC_NODES, 1)) {
 			ret = ENOSPC;
 			goto err;
 		}
@@ -2321,7 +2321,7 @@ void setup_structure(bool live_update)
 		manual_node("/tool/xenstored", NULL);
 		manual_node("@releaseDomain", NULL);
 		manual_node("@introduceDomain", NULL);
-		domain_nbentry_fix(priv_domid, 5, true);
+		domain_nbentry_fix(priv_domid, 5);
 	}
 }
 
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index a70acddf94..21f6f13f83 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -389,6 +389,25 @@ void wrl_apply_debit_trans_commit(struct connection *conn)
 	wrl_apply_debit_actual(conn->domain);
 }
 
+static bool domain_quota_val_exceeds(struct domain *d, enum accitem what,
+				     unsigned int val)
+{
+	unsigned int quota = hard_quotas[what].val;
+
+	if (!quota || !domid_is_unprivileged(d->domid))
+		return false;
+
+	return val >= quota;
+}
+
+bool domain_quota_add_exceeds(struct domain *d, enum accitem what, int add)
+{
+	if (add < 0 || !d)
+		return false;
+
+	return domain_quota_val_exceeds(d, what, d->acc[what].val + add);
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
+		if (domain_quota_add_exceeds(domain, ACC_OUTST, 0))
 			return false;
-		if (domain->acc[ACC_MEM].val >= hard_quotas[ACC_MEM].val &&
-		    hard_quotas[ACC_MEM].val)
+		if (domain_quota_add_exceeds(domain, ACC_MEM, 0))
 			return false;
 	}
 
@@ -916,16 +934,20 @@ do {						\
 
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
+			if (domain_quota_add_exceeds(d, ACC_NODES,
+						     cd->acc[ACC_NODES]))
+				return ENOSPC;
 		}
 	}
 
@@ -1763,7 +1785,7 @@ bool domain_max_chk(const struct connection *conn, enum accitem what,
 	if (!conn || !conn->domain)
 		return false;
 
-	if (domain_is_unprivileged(conn) && val > hard_quotas[what].val)
+	if (domain_quota_val_exceeds(conn->domain, what, val))
 		return true;
 
 	domain_acc_valid_max(conn->domain, what, val);
@@ -1783,21 +1805,9 @@ int domain_nbentry_dec(struct connection *conn, unsigned int domid)
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
@@ -1812,7 +1822,7 @@ static bool domain_chk_quota(struct connection *conn, unsigned int mem)
 	domain = conn->domain;
 	now = time(NULL);
 
-	if (mem >= hard_quotas[ACC_MEM].val && hard_quotas[ACC_MEM].val) {
+	if (domain_quota_val_exceeds(domain, ACC_MEM, mem)) {
 		if (domain->hard_quota_reported)
 			return true;
 		syslog(LOG_ERR, "Domain %u exceeds hard memory quota, Xenstore interface to domain stalled\n",
@@ -1888,13 +1898,6 @@ void domain_watch_dec(struct connection *conn)
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
@@ -1915,13 +1918,6 @@ void domain_transaction_dec(struct connection *conn)
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
index 28186ccac0..29b91fc783 100644
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
 
@@ -161,6 +158,7 @@ int domain_max_global_acc(const void *ctx, struct connection *conn);
 void domain_reset_global_acc(void);
 bool domain_max_chk(const struct connection *conn, enum accitem what,
 		    unsigned int val);
+bool domain_quota_add_exceeds(struct domain *d, enum accitem what, int add);
 
 extern long wrl_ntransactions;
 
diff --git a/tools/xenstored/transaction.c b/tools/xenstored/transaction.c
index 167cd597fd..47cd6ecd3c 100644
--- a/tools/xenstored/transaction.c
+++ b/tools/xenstored/transaction.c
@@ -470,7 +470,7 @@ int do_transaction_start(const void *ctx, struct connection *conn,
 	if (conn->transaction)
 		return EBUSY;
 
-	if (domain_transaction_get(conn) > hard_quotas[ACC_TRANS].val)
+	if (domain_quota_add_exceeds(conn->domain, ACC_TRANS, 1))
 		return ENOSPC;
 
 	/* Attach transaction to ctx for autofree until it's complete */
diff --git a/tools/xenstored/watch.c b/tools/xenstored/watch.c
index b66a9f1a39..becb9c339d 100644
--- a/tools/xenstored/watch.c
+++ b/tools/xenstored/watch.c
@@ -220,8 +220,8 @@ int do_watch(const void *ctx, struct connection *conn, struct buffered_data *in)
 			return EEXIST;
 	}
 
-	if (domain_watch(conn) > hard_quotas[ACC_WATCH].val)
-		return E2BIG;
+	if (domain_quota_add_exceeds(conn->domain, ACC_WATCH, 1))
+		return ENOSPC;
 
 	watch = add_watch(conn, vec[0], vec[1], relative, false);
 	if (!watch)
-- 
2.53.0


