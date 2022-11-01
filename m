Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5E4614EC2
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 17:05:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435038.688034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optkk-0003u3-G8; Tue, 01 Nov 2022 16:04:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435038.688034; Tue, 01 Nov 2022 16:04:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1optkk-0003rA-D5; Tue, 01 Nov 2022 16:04:38 +0000
Received: by outflank-mailman (input) for mailman id 435038;
 Tue, 01 Nov 2022 16:04:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optkj-0003qE-Np
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 16:04:37 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1e10eb0-59fe-11ed-8fd0-01056ac49cbb;
 Tue, 01 Nov 2022 17:04:36 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 608D722537;
 Tue,  1 Nov 2022 16:04:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3284A1346F;
 Tue,  1 Nov 2022 16:04:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FaD6CpRDYWMycgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 16:04:36 +0000
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
X-Inumbo-ID: e1e10eb0-59fe-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667318676; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uACmj/0xjTQgTK11Nj7tD8GLil4Q1EMyFQ4FTisl410=;
	b=uj9PoVHih8X6+Qj6VH/DwWL2AaF+jbV6F7rDsIC7Wrng93xyqd1PKALhdxtngFvQjBs2f/
	CO5e2/D1/HR+nmExURebiOErvwazI8xu0mVvczMlySOixcYn4zeIZRy2fR3xqH9j0lVUtY
	SlfuZUueJSi9PG3PgmQ/HdohGNjAxOA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 02/12] tools/xenstore: introduce accounting data array for per-domain values
Date: Tue,  1 Nov 2022 17:04:12 +0100
Message-Id: <20221101160422.7212-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221101160422.7212-1-jgross@suse.com>
References: <20221101160422.7212-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the scheme of an accounting data array for per-domain
accounting data and use it initially for the number of nodes owned by
a domain.

Make the accounting data type to be unsigned int, as no data is allowed
to be negative at any time.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_domain.c | 55 ++++++++++++++++++++-----------
 tools/xenstore/xenstored_domain.h |  5 +--
 2 files changed, 38 insertions(+), 22 deletions(-)

diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 399fc920bb..9591a19189 100644
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
@@ -441,7 +441,7 @@ int domain_get_quota(const void *ctx, struct connection *conn,
 	resp = talloc_asprintf_append(resp, "%-16s: %8d\n", #t, e); \
 	if (!resp) return ENOMEM
 
-	ent(nodes, d->nbentry);
+	ent(nodes, d->acc[ACC_NODES]);
 	ent(watches, d->nbwatch);
 	ent(transactions, ta);
 	ent(outstanding, d->nboutstanding);
@@ -1050,8 +1050,21 @@ int domain_adjust_node_perms(struct node *node)
 	return 0;
 }
 
-static int domain_nbentry_add(struct connection *conn, unsigned int domid,
-			      int add, bool dom_exists)
+static int domain_acc_add_chk(struct domain *d, unsigned int what, int add,
+			      unsigned int domid)
+{
+	if ((add < 0 && -add > d->acc[what]) ||
+	    (d->acc[what] + add) > INT_MAX) {
+		syslog(LOG_ERR, "Accounting error: domain %u type %u val %u\n",
+		       domid, what, d->acc[what] + add);
+		return (add < 0) ? 0 : INT_MAX;
+	}
+
+	return d->acc[what] + add;
+}
+
+static int domain_acc_add(struct connection *conn, unsigned int domid,
+			  unsigned int what, int add, bool dom_exists)
 {
 	struct domain *d;
 	struct list_head *head;
@@ -1074,47 +1087,49 @@ static int domain_nbentry_add(struct connection *conn, unsigned int domid,
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
-		return d->nbentry + ret;
+		return domain_acc_add_chk(d, what, ret, domid);
 	}
 
-	d->nbentry += add;
+	d->acc[what] = domain_acc_add_chk(d, what, add, domid);
 
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
@@ -1591,7 +1606,7 @@ static int domain_check_acc_init_sub(void *k, void *v, void *arg)
 	 * If everything is correct incrementing the value for each node will
 	 * result in dom->nodes being 0 at the end.
 	 */
-	dom->nodes = -d->nbentry;
+	dom->nodes = -d->acc[ACC_NODES];
 
 	if (!hashtable_insert(domains, &dom->domid, dom)) {
 		talloc_free(dom);
@@ -1646,7 +1661,7 @@ static int domain_check_acc_sub(void *k, void *v, void *arg)
 	if (!d)
 		return 0;
 
-	d->nbentry += dom->nodes;
+	d->acc[ACC_NODES] += dom->nodes;
 
 	return 0;
 }
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index 124b9e1b1e..d2563d33e7 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -21,7 +21,8 @@
 
 enum {
 	ACC_NODES,
-	ACC_TR_N	/* Number of elements per transaction and domain. */
+	ACC_TR_N,        /* Number of elements per transaction and domain. */
+	ACC_N = ACC_TR_N /* Number of elements per domain. */
 };
 
 void handle_event(void);
@@ -72,7 +73,7 @@ int domain_alloc_permrefs(struct node_perms *perms);
 int domain_nbentry_inc(struct connection *conn, unsigned int domid);
 int domain_nbentry_dec(struct connection *conn, unsigned int domid);
 int domain_nbentry_fix(unsigned int domid, int num, bool update);
-int domain_nbentry(struct connection *conn);
+unsigned int domain_nbentry(struct connection *conn);
 int domain_memory_add(unsigned int domid, int mem, bool no_quota_check);
 
 /*
-- 
2.35.3


