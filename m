Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0B464B93A
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 17:05:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460792.718869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p57mV-0000xw-Ni; Tue, 13 Dec 2022 16:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460792.718869; Tue, 13 Dec 2022 16:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p57mV-0000kz-Cw; Tue, 13 Dec 2022 16:05:23 +0000
Received: by outflank-mailman (input) for mailman id 460792;
 Tue, 13 Dec 2022 16:05:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Djt=4L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p57jh-0001dt-Ih
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 16:02:29 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8af65a3f-7aff-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 17:02:28 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 704E722A33;
 Tue, 13 Dec 2022 16:02:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4876C138EE;
 Tue, 13 Dec 2022 16:02:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id P2SBEBSimGNdKgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 13 Dec 2022 16:02:28 +0000
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
X-Inumbo-ID: 8af65a3f-7aff-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670947348; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PvzsvEbcVzcoeZVoNOvl1etWZmPnuBYu2/dBIMStau0=;
	b=pOXL5ZhS4sQ61TeLD8IWQXcn8rZlbAfbqTUTZKqpSW+pTrCUNAwN0C59SILBKS/xDpho3V
	9R5KxBnt+QY+8P5ucIVwPWjMKUQ03fLNvPPZglXEU/knKbj3bMNr49PwxxHfdUSAdLWmVC
	OPVtNaXfWa9Fhz37GxMe1cYwI+pKzDw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 18/19] tools/xenstore: let check_store() check the accounting data
Date: Tue, 13 Dec 2022 17:00:44 +0100
Message-Id: <20221213160045.28170-19-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221213160045.28170-1-jgross@suse.com>
References: <20221213160045.28170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today check_store() is only testing the correctness of the node tree.

Add verification of the accounting data (number of nodes)  and correct
the data if it is wrong.

Do the initial check_store() call only after Xenstore entries of a
live update have been read.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c   | 62 ++++++++++++++++------
 tools/xenstore/xenstored_domain.c | 86 +++++++++++++++++++++++++++++++
 tools/xenstore/xenstored_domain.h |  4 ++
 3 files changed, 137 insertions(+), 15 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 0d5b5a0d82..8fac7c9477 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2384,8 +2384,6 @@ void setup_structure(bool live_update)
 		manual_node("@introduceDomain", NULL);
 		domain_nbentry_fix(dom0_domid, 5, true);
 	}
-
-	check_store();
 }
 
 static unsigned int hash_from_key_fn(void *k)
@@ -2428,20 +2426,28 @@ int remember_string(struct hashtable *hash, const char *str)
  * As we go, we record each node in the given reachable hashtable.  These
  * entries will be used later in clean_store.
  */
+
+struct check_store_data {
+	struct hashtable *reachable;
+	struct hashtable *domains;
+};
+
 static int check_store_step(const void *ctx, struct connection *conn,
 			    struct node *node, void *arg)
 {
-	struct hashtable *reachable = arg;
+	struct check_store_data *data = arg;
 
-	if (hashtable_search(reachable, (void *)node->name)) {
+	if (hashtable_search(data->reachable, (void *)node->name)) {
 		log("check_store: '%s' is duplicated!", node->name);
 		return recovery ? WALK_TREE_RM_CHILDENTRY
 				: WALK_TREE_SKIP_CHILDREN;
 	}
 
-	if (!remember_string(reachable, node->name))
+	if (!remember_string(data->reachable, node->name))
 		return WALK_TREE_ERROR_STOP;
 
+	domain_check_acc_add(node, data->domains);
+
 	return WALK_TREE_OK;
 }
 
@@ -2491,37 +2497,61 @@ static int clean_store_(TDB_CONTEXT *tdb, TDB_DATA key, TDB_DATA val,
  * Given the list of reachable nodes, iterate over the whole store, and
  * remove any that were not reached.
  */
-static void clean_store(struct hashtable *reachable)
+static void clean_store(struct check_store_data *data)
 {
-	tdb_traverse(tdb_ctx, &clean_store_, reachable);
+	tdb_traverse(tdb_ctx, &clean_store_, data->reachable);
+	domain_check_acc(data->domains);
 }
 
+int check_store_path(const char *name, struct check_store_data *data)
+{
+	struct node *node;
+
+	node = read_node(NULL, NULL, name);
+	if (!node) {
+		log("check_store: error %d reading special node '%s'", errno,
+		    name);
+		return errno;
+	}
+
+	return check_store_step(NULL, NULL, node, data);
+}
 
 void check_store(void)
 {
-	struct hashtable *reachable;
 	struct walk_funcs walkfuncs = {
 		.enter = check_store_step,
 		.enoent = check_store_enoent,
 	};
+	struct check_store_data data;
 
 	/* Don't free values (they are all void *1) */
-	reachable = create_hashtable(NULL, 16, hash_from_key_fn, keys_equal_fn,
-				     HASHTABLE_FREE_KEY);
-	if (!reachable) {
+	data.reachable = create_hashtable(NULL, 16, hash_from_key_fn,
+					  keys_equal_fn, HASHTABLE_FREE_KEY);
+	if (!data.reachable) {
 		log("check_store: ENOMEM");
 		return;
 	}
 
+	data.domains = domain_check_acc_init();
+	if (!data.domains) {
+		log("check_store: ENOMEM");
+		goto out_hash;
+	}
+
 	log("Checking store ...");
-	if (walk_node_tree(NULL, NULL, "/", &walkfuncs, reachable)) {
+	if (walk_node_tree(NULL, NULL, "/", &walkfuncs, &data)) {
 		if (errno == ENOMEM)
 			log("check_store: ENOMEM");
-	} else if (!check_transactions(reachable))
-		clean_store(reachable);
+	} else if (!check_store_path("@introduceDomain", &data) &&
+		   !check_store_path("@releaseDomain", &data) &&
+		   !check_transactions(data.reachable))
+		clean_store(&data);
 	log("Checking store complete.");
 
-	hashtable_destroy(reachable);
+	hashtable_destroy(data.domains);
+ out_hash:
+	hashtable_destroy(data.reachable);
 }
 
 
@@ -2920,6 +2950,8 @@ int main(int argc, char *argv[])
 		lu_read_state();
 #endif
 
+	check_store();
+
 	/* Get ready to listen to the tools. */
 	initialize_fds(&sock_pollfd_idx, &timeout);
 
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 28c58b5c6d..9162cabe48 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -1562,6 +1562,92 @@ void read_state_connection(const void *ctx, const void *state)
 	read_state_buffered_data(ctx, conn, sc);
 }
 
+struct domain_acc {
+	unsigned int domid;
+	int nodes;
+};
+
+static int domain_check_acc_init_sub(const void *k, void *v, void *arg)
+{
+	struct hashtable *domains = arg;
+	struct domain *d = v;
+	struct domain_acc *dom;
+
+	dom = talloc_zero(NULL, struct domain_acc);
+	if (!dom)
+		return -1;
+
+	dom->domid = d->domid;
+	/*
+	 * Set the initial value to the negative one of the current domain.
+	 * If everything is correct incrementing the value for each node will
+	 * result in dom->nodes being 0 at the end.
+	 */
+	dom->nodes = -d->nbentry;
+
+	if (!hashtable_insert(domains, &dom->domid, dom)) {
+		talloc_free(dom);
+		return -1;
+	}
+
+	return 0;
+}
+
+struct hashtable *domain_check_acc_init(void)
+{
+	struct hashtable *domains;
+
+	domains = create_hashtable(NULL, 8, domhash_fn, domeq_fn,
+				   HASHTABLE_FREE_VALUE);
+	if (!domains)
+		return NULL;
+
+	if (hashtable_iterate(domhash, domain_check_acc_init_sub, domains)) {
+		hashtable_destroy(domains);
+		return NULL;
+	}
+
+	return domains;
+}
+
+void domain_check_acc_add(const struct node *node, struct hashtable *domains)
+{
+	struct domain_acc *dom;
+	unsigned int domid;
+
+	domid = node->perms.p[0].id;
+	dom = hashtable_search(domains, &domid);
+	if (!dom)
+		log("Node %s owned by unknown domain %u", node->name, domid);
+	else
+		dom->nodes++;
+}
+
+static int domain_check_acc_sub(const void *k, void *v, void *arg)
+{
+	struct domain_acc *dom = v;
+	struct domain *d;
+
+	if (!dom->nodes)
+		return 0;
+
+	log("Correct accounting data for domain %u: nodes are %d off",
+	    dom->domid, dom->nodes);
+
+	d = find_domain_struct(dom->domid);
+	if (!d)
+		return 0;
+
+	d->nbentry += dom->nodes;
+
+	return 0;
+}
+
+void domain_check_acc(struct hashtable *domains)
+{
+	hashtable_iterate(domains, domain_check_acc_sub, NULL);
+}
+
 /*
  * Local variables:
  *  mode: C
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index 22996e2576..dc4660861e 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -129,4 +129,8 @@ const char *dump_state_connections(FILE *fp);
 
 void read_state_connection(const void *ctx, const void *state);
 
+struct hashtable *domain_check_acc_init(void);
+void domain_check_acc_add(const struct node *node, struct hashtable *domains);
+void domain_check_acc(struct hashtable *domains);
+
 #endif /* _XENSTORED_DOMAIN_H */
-- 
2.35.3


