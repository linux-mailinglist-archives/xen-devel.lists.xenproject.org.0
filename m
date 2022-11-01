Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EB7614E8F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 16:43:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.434985.687989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optQY-00059G-BY; Tue, 01 Nov 2022 15:43:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 434985.687989; Tue, 01 Nov 2022 15:43:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optQY-0004xE-4t; Tue, 01 Nov 2022 15:43:46 +0000
Received: by outflank-mailman (input) for mailman id 434985;
 Tue, 01 Nov 2022 15:43:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optD2-0007Tl-Jm
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 15:29:48 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04d736a9-59fa-11ed-91b5-6bf2151ebd3b;
 Tue, 01 Nov 2022 16:29:47 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8B9013385D;
 Tue,  1 Nov 2022 15:29:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5DC971346F;
 Tue,  1 Nov 2022 15:29:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tUCKFWs7YWP5YAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 15:29:47 +0000
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
X-Inumbo-ID: 04d736a9-59fa-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667316587; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YEuNMFZScrBO9VppDIj+NvcWUmoCWDv+0NHEQClkkiM=;
	b=KtJt4+Wu1b0GgfxVWcgP6BYrWFjgfvpI6FE79lMDZjQWT4zRpDGJvbk0Igj6yCZZekx51h
	U/+p2cUN+TIp+V+4e3yCfIgIppE4PNpXfHvuFR1EQvGSVisJJ5nrNM/SbFc07gVhE+0BSn
	uwh8V3w+HA7OgA34dk+5L3f6LXykKnk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 11/20] tools/xenstore: move changed domain handling
Date: Tue,  1 Nov 2022 16:28:33 +0100
Message-Id: <20221101152842.4257-12-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221101152842.4257-1-jgross@suse.com>
References: <20221101152842.4257-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move all code related to struct changed_domain from
xenstored_transaction.c to xenstored_domain.c.

This will be needed later in order to simplify the accounting data
updates in cases of errors during a request.

Split the code to have a more generic base framework.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_domain.c      | 85 +++++++++++++++++++++++++-
 tools/xenstore/xenstored_domain.h      |  3 +
 tools/xenstore/xenstored_transaction.c | 64 ++-----------------
 3 files changed, 90 insertions(+), 62 deletions(-)

diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 5756010944..14fd84c288 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -91,6 +91,18 @@ struct domain
 	bool wrl_delay_logged;
 };
 
+struct changed_domain
+{
+	/* List of all changed domains. */
+	struct list_head list;
+
+	/* Identifier of the changed domain. */
+	unsigned int domid;
+
+	/* Amount by which this domain's nbentry field has changed. */
+	int nbentry;
+};
+
 static struct hashtable *domhash;
 
 static bool check_indexes(XENSTORE_RING_IDX cons, XENSTORE_RING_IDX prod)
@@ -492,8 +504,12 @@ static struct domain *find_or_alloc_existing_domain(unsigned int domid)
 	xc_dominfo_t dominfo;
 
 	domain = find_domain_struct(domid);
-	if (!domain && get_domain_info(domid, &dominfo))
-		domain = alloc_domain(NULL, domid);
+	if (!domain) {
+		if (!get_domain_info(domid, &dominfo))
+			errno = ENOENT;
+		else
+			domain = alloc_domain(NULL, domid);
+	}
 
 	return domain;
 }
@@ -547,6 +563,71 @@ static struct domain *find_domain_by_domid(unsigned int domid)
 	return (d && d->introduced) ? d : NULL;
 }
 
+int acc_fix_domains(struct list_head *head, bool update)
+{
+	struct changed_domain *cd;
+	int cnt;
+
+	list_for_each_entry(cd, head, list) {
+		cnt = domain_entry_fix(cd->domid, cd->nbentry, update);
+		if (!update) {
+			if (cnt >= quota_nb_entry_per_domain)
+				return ENOSPC;
+			if (cnt < 0)
+				return ENOMEM;
+		}
+	}
+
+	return 0;
+}
+
+static struct changed_domain *acc_find_changed_domain(struct list_head *head,
+						      unsigned int domid)
+{
+	struct changed_domain *cd;
+
+	list_for_each_entry(cd, head, list) {
+		if (cd->domid == domid)
+			return cd;
+	}
+
+	return NULL;
+}
+
+static struct changed_domain *acc_get_changed_domain(const void *ctx,
+						     struct list_head *head,
+						     unsigned int domid)
+{
+	struct changed_domain *cd;
+
+	cd = acc_find_changed_domain(head, domid);
+	if (cd)
+		return cd;
+
+	cd = talloc_zero(ctx, struct changed_domain);
+	if (!cd)
+		return NULL;
+
+	cd->domid = domid;
+	list_add_tail(&cd->list, head);
+
+	return cd;
+}
+
+int acc_add_dom_nbentry(const void *ctx, struct list_head *head, int val,
+			unsigned int domid)
+{
+	struct changed_domain *cd;
+
+	cd = acc_get_changed_domain(ctx, head, domid);
+	if (!cd)
+		return errno;
+
+	cd->nbentry += val;
+
+	return 0;
+}
+
 static void domain_conn_reset(struct domain *domain)
 {
 	struct connection *conn = domain->conn;
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index 630641d620..9e20d2b17d 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -98,6 +98,9 @@ void domain_outstanding_dec(struct connection *conn);
 void domain_outstanding_domid_dec(unsigned int domid);
 int domain_get_quota(const void *ctx, struct connection *conn,
 		     unsigned int domid);
+int acc_fix_domains(struct list_head *head, bool update);
+int acc_add_dom_nbentry(const void *ctx, struct list_head *head, int val,
+			unsigned int domid);
 
 /* Write rate limiting */
 
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index ac854197ca..89b92f0baf 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -137,18 +137,6 @@ struct accessed_node
 	bool watch_exact;
 };
 
-struct changed_domain
-{
-	/* List of all changed domains in the context of this transaction. */
-	struct list_head list;
-
-	/* Identifier of the changed domain. */
-	unsigned int domid;
-
-	/* Amount by which this domain's nbentry field has changed. */
-	int nbentry;
-};
-
 struct transaction
 {
 	/* List of all transactions active on this connection. */
@@ -514,24 +502,6 @@ int do_transaction_start(const void *ctx, struct connection *conn,
 	return 0;
 }
 
-static int transaction_fix_domains(struct transaction *trans, bool update)
-{
-	struct changed_domain *d;
-	int cnt;
-
-	list_for_each_entry(d, &trans->changed_domains, list) {
-		cnt = domain_entry_fix(d->domid, d->nbentry, update);
-		if (!update) {
-			if (cnt >= quota_nb_entry_per_domain)
-				return ENOSPC;
-			if (cnt < 0)
-				return ENOMEM;
-		}
-	}
-
-	return 0;
-}
-
 int do_transaction_end(const void *ctx, struct connection *conn,
 		       struct buffered_data *in)
 {
@@ -558,7 +528,7 @@ int do_transaction_end(const void *ctx, struct connection *conn,
 	if (streq(arg, "T")) {
 		if (trans->fail)
 			return ENOMEM;
-		ret = transaction_fix_domains(trans, false);
+		ret = acc_fix_domains(&trans->changed_domains, false);
 		if (ret)
 			return ret;
 		ret = finalize_transaction(conn, trans, &is_corrupt);
@@ -568,7 +538,7 @@ int do_transaction_end(const void *ctx, struct connection *conn,
 		wrl_apply_debit_trans_commit(conn);
 
 		/* fix domain entry for each changed domain */
-		transaction_fix_domains(trans, true);
+		acc_fix_domains(&trans->changed_domains, true);
 
 		if (is_corrupt)
 			corrupt(conn, "transaction inconsistency");
@@ -580,44 +550,18 @@ int do_transaction_end(const void *ctx, struct connection *conn,
 
 void transaction_entry_inc(struct transaction *trans, unsigned int domid)
 {
-	struct changed_domain *d;
-
-	list_for_each_entry(d, &trans->changed_domains, list)
-		if (d->domid == domid) {
-			d->nbentry++;
-			return;
-		}
-
-	d = talloc(trans, struct changed_domain);
-	if (!d) {
+	if (acc_add_dom_nbentry(trans, &trans->changed_domains, 1, domid)) {
 		/* Let the transaction fail. */
 		trans->fail = true;
-		return;
 	}
-	d->domid = domid;
-	d->nbentry = 1;
-	list_add_tail(&d->list, &trans->changed_domains);
 }
 
 void transaction_entry_dec(struct transaction *trans, unsigned int domid)
 {
-	struct changed_domain *d;
-
-	list_for_each_entry(d, &trans->changed_domains, list)
-		if (d->domid == domid) {
-			d->nbentry--;
-			return;
-		}
-
-	d = talloc(trans, struct changed_domain);
-	if (!d) {
+	if (acc_add_dom_nbentry(trans, &trans->changed_domains, -1, domid)) {
 		/* Let the transaction fail. */
 		trans->fail = true;
-		return;
 	}
-	d->domid = domid;
-	d->nbentry = -1;
-	list_add_tail(&d->list, &trans->changed_domains);
 }
 
 void fail_transaction(struct transaction *trans)
-- 
2.35.3


