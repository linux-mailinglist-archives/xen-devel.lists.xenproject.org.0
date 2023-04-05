Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1646D74F4
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 09:04:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518232.804560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjxBl-0003EY-2c; Wed, 05 Apr 2023 07:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518232.804560; Wed, 05 Apr 2023 07:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjxBk-0003By-Vc; Wed, 05 Apr 2023 07:04:12 +0000
Received: by outflank-mailman (input) for mailman id 518232;
 Wed, 05 Apr 2023 07:04:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wAG=74=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pjxBi-0002Et-Ga
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 07:04:10 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f586cb1-d380-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 09:04:08 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 67D92229E5;
 Wed,  5 Apr 2023 07:04:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3834213A31;
 Wed,  5 Apr 2023 07:04:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NaRUDGgdLWSUEwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 05 Apr 2023 07:04:08 +0000
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
X-Inumbo-ID: 0f586cb1-d380-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680678248; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XGeyzFUz5tXMQxwcHUnMlsPDW6IPPfsMHnMCy5JL5Tc=;
	b=hz+PU6USwBStzOH8qIlujgCh7UZln1zWU3HxdKKBJcFUaj1pIdwd6spHFZdSJpaFSJqT5R
	wikn4kZb07OYCFVKm2y78r1ZqeS1PweDdHmGtfO1ZKjw0Q2jYT3LkErSnWa52fsf7XAqYc
	GQ/ohUuVYPPMu6oEmN4BIBfLILN8bbY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 03/13] tools/xenstore: introduce accounting data array for per-domain values
Date: Wed,  5 Apr 2023 09:03:39 +0200
Message-Id: <20230405070349.25293-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230405070349.25293-1-jgross@suse.com>
References: <20230405070349.25293-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the scheme of an accounting data array for per-domain
accounting data and use it initially for the number of nodes owned by
a domain.

Make the accounting data type to be unsigned int, as no data is allowed
to be negative at any time.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- remove domid parameter from domain_acc_add_chk() (Julien Grall)
- rename domain_acc_add_chk() (Julien Grall)
- modify overflow check (Julien Grall)
V4:
- fix overflow check
---
 tools/xenstore/xenstored_domain.c | 70 ++++++++++++++++++-------------
 tools/xenstore/xenstored_domain.h |  3 +-
 2 files changed, 43 insertions(+), 30 deletions(-)

diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 609a9a13ab..30fb9acec6 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -69,8 +69,8 @@ struct domain
 	/* Has domain been officially introduced? */
 	bool introduced;
 
-	/* number of entry from this domain in the store */
-	int nbentry;
+	/* Accounting data for this domain. */
+	unsigned int acc[ACC_N];
 
 	/* Amount of memory allocated for this domain. */
 	int memory;
@@ -246,7 +246,7 @@ static int domain_tree_remove_sub(const void *ctx, struct connection *conn,
 
 	if (keep_orphans) {
 		set_tdb_key(node->name, &key);
-		domain->nbentry--;
+		domain_nbentry_dec(NULL, domain->domid);
 		node->perms.p[0].id = priv_domid;
 		node->acc.memory = 0;
 		domain_nbentry_inc(NULL, priv_domid);
@@ -270,7 +270,7 @@ static int domain_tree_remove_sub(const void *ctx, struct connection *conn,
 		ret = WALK_TREE_SKIP_CHILDREN;
 	}
 
-	return domain->nbentry > 0 ? ret : WALK_TREE_SUCCESS_STOP;
+	return domain->acc[ACC_NODES] ? ret : WALK_TREE_SUCCESS_STOP;
 }
 
 static void domain_tree_remove(struct domain *domain)
@@ -278,7 +278,7 @@ static void domain_tree_remove(struct domain *domain)
 	int ret;
 	struct walk_funcs walkfuncs = { .enter = domain_tree_remove_sub };
 
-	if (domain->nbentry > 0) {
+	if (domain->acc[ACC_NODES]) {
 		ret = walk_node_tree(domain, NULL, "/", &walkfuncs, domain);
 		if (ret == WALK_TREE_ERROR_STOP)
 			syslog(LOG_ERR,
@@ -437,7 +437,7 @@ int domain_get_quota(const void *ctx, struct connection *conn,
 	resp = talloc_asprintf_append(resp, "%-16s: %8d\n", #t, e); \
 	if (!resp) return ENOMEM
 
-	ent(nodes, d->nbentry);
+	ent(nodes, d->acc[ACC_NODES]);
 	ent(watches, d->nbwatch);
 	ent(transactions, ta);
 	ent(outstanding, d->nboutstanding);
@@ -1047,8 +1047,27 @@ int domain_adjust_node_perms(struct node *node)
 	return 0;
 }
 
-static int domain_nbentry_add(struct connection *conn, unsigned int domid,
-			      int add, bool no_dom_alloc)
+static int domain_acc_add_valid(struct domain *d, enum accitem what, int add)
+{
+	assert(what < ARRAY_SIZE(d->acc));
+
+	if ((add < 0 && -add > d->acc[what]) ||
+	    (add > 0 && (INT_MAX - d->acc[what]) < add)) {
+		/*
+		 * In a transaction when a node is being added/removed AND the
+		 * same node has been added/removed outside the transaction in
+		 * parallel, the resulting value will be wrong. This is no
+		 * problem, as the transaction will fail due to the resulting
+		 * conflict.
+		 */
+		return (add < 0) ? 0 : INT_MAX;
+	}
+
+	return d->acc[what] + add;
+}
+
+static int domain_acc_add(struct connection *conn, unsigned int domid,
+			  enum accitem what, int add, bool no_dom_alloc)
 {
 	struct domain *d;
 	struct list_head *head;
@@ -1071,56 +1090,49 @@ static int domain_nbentry_add(struct connection *conn, unsigned int domid,
 		}
 	}
 
-	if (conn && conn->transaction) {
+	if (conn && conn->transaction && what < ACC_TR_N) {
 		head = transaction_get_changed_domains(conn->transaction);
-		ret = acc_add_changed_dom(conn->transaction, head, ACC_NODES,
+		ret = acc_add_changed_dom(conn->transaction, head, what,
 					  add, domid);
 		if (errno) {
 			fail_transaction(conn->transaction);
 			return -1;
 		}
-		/*
-		 * In a transaction when a node is being added/removed AND the
-		 * same node has been added/removed outside the transaction in
-		 * parallel, the resulting number of nodes will be wrong. This
-		 * is no problem, as the transaction will fail due to the
-		 * resulting conflict.
-		 * In the node remove case the resulting number can be even
-		 * negative, which should be avoided.
-		 */
-		return max(d->nbentry + ret, 0);
+		return domain_acc_add_valid(d, what, ret);
 	}
 
-	d->nbentry += add;
+	d->acc[what] = domain_acc_add_valid(d, what, add);
 
-	return d->nbentry;
+	return d->acc[what];
 }
 
 int domain_nbentry_inc(struct connection *conn, unsigned int domid)
 {
-	return (domain_nbentry_add(conn, domid, 1, false) < 0) ? errno : 0;
+	return (domain_acc_add(conn, domid, ACC_NODES, 1, false) < 0)
+	       ? errno : 0;
 }
 
 int domain_nbentry_dec(struct connection *conn, unsigned int domid)
 {
-	return (domain_nbentry_add(conn, domid, -1, true) < 0) ? errno : 0;
+	return (domain_acc_add(conn, domid, ACC_NODES, -1, true) < 0)
+	       ? errno : 0;
 }
 
 int domain_nbentry_fix(unsigned int domid, int num, bool update)
 {
 	int ret;
 
-	ret = domain_nbentry_add(NULL, domid, update ? num : 0, update);
+	ret = domain_acc_add(NULL, domid, ACC_NODES, update ? num : 0, update);
 	if (ret < 0 || update)
 		return ret;
 
 	return domid_is_unprivileged(domid) ? ret + num : 0;
 }
 
-int domain_nbentry(struct connection *conn)
+unsigned int domain_nbentry(struct connection *conn)
 {
 	return domain_is_unprivileged(conn)
-	       ? domain_nbentry_add(conn, conn->id, 0, true) : 0;
+	       ? domain_acc_add(conn, conn->id, ACC_NODES, 0, true) : 0;
 }
 
 static bool domain_chk_quota(struct domain *domain, int mem)
@@ -1597,7 +1609,7 @@ static int domain_check_acc_init_sub(const void *k, void *v, void *arg)
 	 * If everything is correct incrementing the value for each node will
 	 * result in dom->nodes being 0 at the end.
 	 */
-	dom->nodes = -d->nbentry;
+	dom->nodes = -d->acc[ACC_NODES];
 
 	if (!hashtable_insert(domains, &dom->domid, dom)) {
 		talloc_free(dom);
@@ -1652,7 +1664,7 @@ static int domain_check_acc_cb(const void *k, void *v, void *arg)
 	if (!d)
 		return 0;
 
-	d->nbentry += dom->nodes;
+	d->acc[ACC_NODES] += dom->nodes;
 
 	return 0;
 }
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index 40803574f6..9d05eb01da 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -27,6 +27,7 @@
 enum accitem {
 	ACC_NODES,
 	ACC_TR_N,		/* Number of elements per transaction. */
+	ACC_N = ACC_TR_N,	/* Number of elements per domain. */
 };
 
 void handle_event(void);
@@ -77,7 +78,7 @@ int domain_alloc_permrefs(struct node_perms *perms);
 int domain_nbentry_inc(struct connection *conn, unsigned int domid);
 int domain_nbentry_dec(struct connection *conn, unsigned int domid);
 int domain_nbentry_fix(unsigned int domid, int num, bool update);
-int domain_nbentry(struct connection *conn);
+unsigned int domain_nbentry(struct connection *conn);
 int domain_memory_add(unsigned int domid, int mem, bool no_quota_check);
 
 /*
-- 
2.35.3


