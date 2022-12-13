Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D881A64B93C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 17:05:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460791.718861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p57mU-0000gP-HQ; Tue, 13 Dec 2022 16:05:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460791.718861; Tue, 13 Dec 2022 16:05:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p57mU-0000bN-AK; Tue, 13 Dec 2022 16:05:22 +0000
Received: by outflank-mailman (input) for mailman id 460791;
 Tue, 13 Dec 2022 16:05:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Djt=4L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p57iz-0001ta-6Y
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 16:01:45 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7054a234-7aff-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 17:01:44 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B538A1FDAE;
 Tue, 13 Dec 2022 16:01:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 78A82138EE;
 Tue, 13 Dec 2022 16:01:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id w/cvHOehmGPkKQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 13 Dec 2022 16:01:43 +0000
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
X-Inumbo-ID: 7054a234-7aff-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670947303; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N3zvSnCKpj0DzBEC+Ai7Jx1wER0H/t3euAgTSYa4VlU=;
	b=u4Up9iggY3sAGAraxkrwGvZ1RwaVSi/Z+yA4ycNXxJULUpCPZ9IpAdBIVezAGb3HZeqN9/
	+jfXlgFi9uOKc2c0Phqh4obWTx8idbGbRko9UrJVYExcjuypc+NQ/O3yO29u5eQ+uAmqDJ
	0TnpgPBwsQvYj7QdBfuEqG8y3Yx1M5U=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 10/19] tools/xenstore: change per-domain node accounting interface
Date: Tue, 13 Dec 2022 17:00:36 +0100
Message-Id: <20221213160045.28170-11-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221213160045.28170-1-jgross@suse.com>
References: <20221213160045.28170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework the interface and the internals of the per-domain node
accounting:

- rename the functions to domain_nbentry_*() in order to better match
  the related counter name

- switch from node pointer to domid as interface, as all nodes have the
  owner filled in

- use a common internal function for adding a value to the counter

For the transaction case add a helper function to get the list head
of the per-transaction changed domains, enabling to eliminate the
transaction_entry_*() functions.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c        |  22 ++---
 tools/xenstore/xenstored_domain.c      | 122 +++++++++++--------------
 tools/xenstore/xenstored_domain.h      |  10 +-
 tools/xenstore/xenstored_transaction.c |  15 +--
 tools/xenstore/xenstored_transaction.h |   7 +-
 5 files changed, 72 insertions(+), 104 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index f96714e1b8..61569cecbb 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1459,7 +1459,7 @@ static void destroy_node_rm(struct connection *conn, struct node *node)
 static int destroy_node(struct connection *conn, struct node *node)
 {
 	destroy_node_rm(conn, node);
-	domain_entry_dec(conn, node);
+	domain_nbentry_dec(conn, node->perms.p[0].id);
 
 	/*
 	 * It is not possible to easily revert the changes in a transaction.
@@ -1498,7 +1498,7 @@ static struct node *create_node(struct connection *conn, const void *ctx,
 	for (i = node; i; i = i->parent) {
 		/* i->parent is set for each new node, so check quota. */
 		if (i->parent &&
-		    domain_entry(conn) >= quota_nb_entry_per_domain) {
+		    domain_nbentry(conn) >= quota_nb_entry_per_domain) {
 			ret = ENOSPC;
 			goto err;
 		}
@@ -1509,7 +1509,7 @@ static struct node *create_node(struct connection *conn, const void *ctx,
 
 		/* Account for new node */
 		if (i->parent) {
-			if (domain_entry_inc(conn, i)) {
+			if (domain_nbentry_inc(conn, i->perms.p[0].id)) {
 				destroy_node_rm(conn, i);
 				return NULL;
 			}
@@ -1662,7 +1662,7 @@ static int delnode_sub(const void *ctx, struct connection *conn,
 	watch_exact = strcmp(root, node->name);
 	fire_watches(conn, ctx, node->name, node, watch_exact, NULL);
 
-	domain_entry_dec(conn, node);
+	domain_nbentry_dec(conn, node->perms.p[0].id);
 
 	return WALK_TREE_RM_CHILDENTRY;
 }
@@ -1802,25 +1802,25 @@ static int do_set_perms(const void *ctx, struct connection *conn,
 		return EPERM;
 
 	old_perms = node->perms;
-	domain_entry_dec(conn, node);
+	domain_nbentry_dec(conn, node->perms.p[0].id);
 	node->perms = perms;
-	if (domain_entry_inc(conn, node)) {
+	if (domain_nbentry_inc(conn, node->perms.p[0].id)) {
 		node->perms = old_perms;
 		/*
 		 * This should never fail because we had a reference on the
 		 * domain before and Xenstored is single-threaded.
 		 */
-		domain_entry_inc(conn, node);
+		domain_nbentry_inc(conn, node->perms.p[0].id);
 		return ENOMEM;
 	}
 
 	if (write_node(conn, node, false)) {
 		int saved_errno = errno;
 
-		domain_entry_dec(conn, node);
+		domain_nbentry_dec(conn, node->perms.p[0].id);
 		node->perms = old_perms;
 		/* No failure possible as above. */
-		domain_entry_inc(conn, node);
+		domain_nbentry_inc(conn, node->perms.p[0].id);
 
 		errno = saved_errno;
 		return errno;
@@ -2392,7 +2392,7 @@ void setup_structure(bool live_update)
 		manual_node("/tool/xenstored", NULL);
 		manual_node("@releaseDomain", NULL);
 		manual_node("@introduceDomain", NULL);
-		domain_entry_fix(dom0_domid, 5, true);
+		domain_nbentry_fix(dom0_domid, 5, true);
 	}
 
 	check_store();
@@ -3400,7 +3400,7 @@ void read_state_node(const void *ctx, const void *state)
 	if (write_node_raw(NULL, &key, node, true))
 		barf("write node error restoring node");
 
-	if (domain_entry_inc(&conn, node))
+	if (domain_nbentry_inc(&conn, node->perms.p[0].id))
 		barf("node accounting error restoring node");
 
 	talloc_free(node);
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 3216119e83..40b24056c5 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -249,7 +249,7 @@ static int domain_tree_remove_sub(const void *ctx, struct connection *conn,
 		domain->nbentry--;
 		node->perms.p[0].id = priv_domid;
 		node->acc.memory = 0;
-		domain_entry_inc(NULL, node);
+		domain_nbentry_inc(NULL, priv_domid);
 		if (write_node_raw(NULL, &key, node, true)) {
 			/* That's unfortunate. We only can try to continue. */
 			syslog(LOG_ERR,
@@ -559,7 +559,7 @@ int acc_fix_domains(struct list_head *head, bool update)
 	int cnt;
 
 	list_for_each_entry(cd, head, list) {
-		cnt = domain_entry_fix(cd->domid, cd->nbentry, update);
+		cnt = domain_nbentry_fix(cd->domid, cd->nbentry, update);
 		if (!update) {
 			if (cnt >= quota_nb_entry_per_domain)
 				return ENOSPC;
@@ -604,18 +604,19 @@ static struct changed_domain *acc_get_changed_domain(const void *ctx,
 	return cd;
 }
 
-int acc_add_dom_nbentry(const void *ctx, struct list_head *head, int val,
-			unsigned int domid)
+static int acc_add_dom_nbentry(const void *ctx, struct list_head *head, int val,
+			       unsigned int domid)
 {
 	struct changed_domain *cd;
 
 	cd = acc_get_changed_domain(ctx, head, domid);
 	if (!cd)
-		return errno;
+		return 0;
 
+	errno = 0;
 	cd->nbentry += val;
 
-	return 0;
+	return cd->nbentry;
 }
 
 static void domain_conn_reset(struct domain *domain)
@@ -988,30 +989,6 @@ void domain_deinit(void)
 		xenevtchn_unbind(xce_handle, virq_port);
 }
 
-int domain_entry_inc(struct connection *conn, struct node *node)
-{
-	struct domain *d;
-	unsigned int domid;
-
-	if (!node->perms.p)
-		return 0;
-
-	domid = node->perms.p[0].id;
-
-	if (conn && conn->transaction) {
-		transaction_entry_inc(conn->transaction, domid);
-	} else {
-		d = (conn && domid == conn->id && conn->domain) ? conn->domain
-		    : find_or_alloc_existing_domain(domid);
-		if (d)
-			d->nbentry++;
-		else
-			return ENOMEM;
-	}
-
-	return 0;
-}
-
 /*
  * Check whether a domain was created before or after a specific generation
  * count (used for testing whether a node permission is older than a domain).
@@ -1079,62 +1056,67 @@ int domain_adjust_node_perms(struct node *node)
 	return 0;
 }
 
-void domain_entry_dec(struct connection *conn, struct node *node)
+static int domain_nbentry_add(struct connection *conn, unsigned int domid,
+			      int add, bool dom_exists)
 {
 	struct domain *d;
-	unsigned int domid;
-
-	if (!node->perms.p)
-		return;
+	struct list_head *head;
+	int ret;
 
-	domid = node->perms.p ? node->perms.p[0].id : conn->id;
+	if (conn && domid == conn->id && conn->domain)
+		d = conn->domain;
+	else if (dom_exists) {
+		d = find_domain_struct(domid);
+		if (!d) {
+			errno = ENOENT;
+			corrupt(conn, "Missing domain %u\n", domid);
+			return -1;
+		}
+	} else {
+		d = find_or_alloc_existing_domain(domid);
+		if (!d) {
+			errno = ENOMEM;
+			return -1;
+		}
+	}
 
 	if (conn && conn->transaction) {
-		transaction_entry_dec(conn->transaction, domid);
-	} else {
-		d = (conn && domid == conn->id && conn->domain) ? conn->domain
-		    : find_domain_struct(domid);
-		if (d) {
-			d->nbentry--;
-		} else {
-			errno = ENOENT;
-			corrupt(conn,
-				"Node \"%s\" owned by non-existing domain %u\n",
-				node->name, domid);
+		head = transaction_get_changed_domains(conn->transaction);
+		ret = acc_add_dom_nbentry(conn->transaction, head, add, domid);
+		if (errno) {
+			fail_transaction(conn->transaction);
+			return -1;
 		}
+		return d->nbentry + ret;
 	}
+
+	d->nbentry += add;
+
+	return d->nbentry;
 }
 
-int domain_entry_fix(unsigned int domid, int num, bool update)
+int domain_nbentry_inc(struct connection *conn, unsigned int domid)
 {
-	struct domain *d;
-	int cnt;
+	return (domain_nbentry_add(conn, domid, 1, false) < 0) ? errno : 0;
+}
 
-	if (update) {
-		d = find_domain_struct(domid);
-		assert(d);
-	} else {
-		/*
-		 * We are called first with update == false in order to catch
-		 * any error. So do a possible allocation and check for error
-		 * only in this case, as in the case of update == true nothing
-		 * can go wrong anymore as the allocation already happened.
-		 */
-		d = find_or_alloc_existing_domain(domid);
-		if (!d)
-			return -1;
-	}
+int domain_nbentry_dec(struct connection *conn, unsigned int domid)
+{
+	return (domain_nbentry_add(conn, domid, -1, true) < 0) ? errno : 0;
+}
 
-	cnt = d->nbentry + num;
-	assert(cnt >= 0);
+int domain_nbentry_fix(unsigned int domid, int num, bool update)
+{
+	int ret;
 
-	if (update)
-		d->nbentry = cnt;
+	ret = domain_nbentry_add(NULL, domid, update ? num : 0, update);
+	if (ret < 0 || update)
+		return ret;
 
-	return domid_is_unprivileged(domid) ? cnt : 0;
+	return domid_is_unprivileged(domid) ? ret + num : 0;
 }
 
-int domain_entry(struct connection *conn)
+int domain_nbentry(struct connection *conn)
 {
 	return (domain_is_unprivileged(conn))
 		? conn->domain->nbentry
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index 9e20d2b17d..1e402f2609 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -66,10 +66,10 @@ int domain_adjust_node_perms(struct node *node);
 int domain_alloc_permrefs(struct node_perms *perms);
 
 /* Quota manipulation */
-int domain_entry_inc(struct connection *conn, struct node *);
-void domain_entry_dec(struct connection *conn, struct node *);
-int domain_entry_fix(unsigned int domid, int num, bool update);
-int domain_entry(struct connection *conn);
+int domain_nbentry_inc(struct connection *conn, unsigned int domid);
+int domain_nbentry_dec(struct connection *conn, unsigned int domid);
+int domain_nbentry_fix(unsigned int domid, int num, bool update);
+int domain_nbentry(struct connection *conn);
 int domain_memory_add(unsigned int domid, int mem, bool no_quota_check);
 
 /*
@@ -99,8 +99,6 @@ void domain_outstanding_domid_dec(unsigned int domid);
 int domain_get_quota(const void *ctx, struct connection *conn,
 		     unsigned int domid);
 int acc_fix_domains(struct list_head *head, bool update);
-int acc_add_dom_nbentry(const void *ctx, struct list_head *head, int val,
-			unsigned int domid);
 
 /* Write rate limiting */
 
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index 89b92f0baf..82e5e66c18 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -548,20 +548,9 @@ int do_transaction_end(const void *ctx, struct connection *conn,
 	return 0;
 }
 
-void transaction_entry_inc(struct transaction *trans, unsigned int domid)
+struct list_head *transaction_get_changed_domains(struct transaction *trans)
 {
-	if (acc_add_dom_nbentry(trans, &trans->changed_domains, 1, domid)) {
-		/* Let the transaction fail. */
-		trans->fail = true;
-	}
-}
-
-void transaction_entry_dec(struct transaction *trans, unsigned int domid)
-{
-	if (acc_add_dom_nbentry(trans, &trans->changed_domains, -1, domid)) {
-		/* Let the transaction fail. */
-		trans->fail = true;
-	}
+	return &trans->changed_domains;
 }
 
 void fail_transaction(struct transaction *trans)
diff --git a/tools/xenstore/xenstored_transaction.h b/tools/xenstore/xenstored_transaction.h
index 3417303f94..b6f8cb7d0a 100644
--- a/tools/xenstore/xenstored_transaction.h
+++ b/tools/xenstore/xenstored_transaction.h
@@ -36,10 +36,6 @@ int do_transaction_end(const void *ctx, struct connection *conn,
 
 struct transaction *transaction_lookup(struct connection *conn, uint32_t id);
 
-/* inc/dec entry number local to trans while changing a node */
-void transaction_entry_inc(struct transaction *trans, unsigned int domid);
-void transaction_entry_dec(struct transaction *trans, unsigned int domid);
-
 /* This node was accessed. */
 int __must_check access_node(struct connection *conn, struct node *node,
                              enum node_access_type type, TDB_DATA *key);
@@ -54,6 +50,9 @@ void transaction_prepend(struct connection *conn, const char *name,
 /* Mark the transaction as failed. This will prevent it to be committed. */
 void fail_transaction(struct transaction *trans);
 
+/* Get the list head of the changed domains. */
+struct list_head *transaction_get_changed_domains(struct transaction *trans);
+
 void conn_delete_all_transactions(struct connection *conn);
 int check_transactions(struct hashtable *hash);
 
-- 
2.35.3


