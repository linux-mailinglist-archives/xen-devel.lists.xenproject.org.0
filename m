Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A4574CDCD
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 09:00:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560945.877123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIksI-00031M-PG; Mon, 10 Jul 2023 06:59:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560945.877123; Mon, 10 Jul 2023 06:59:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIksI-0002ym-MI; Mon, 10 Jul 2023 06:59:58 +0000
Received: by outflank-mailman (input) for mailman id 560945;
 Mon, 10 Jul 2023 06:59:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xcmr=C4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qIksH-0002xd-6F
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 06:59:57 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 607964b0-1eef-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 08:59:56 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DDBA021E97;
 Mon, 10 Jul 2023 06:59:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AB8E01361C;
 Mon, 10 Jul 2023 06:59:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hH1xKGusq2RmYgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 10 Jul 2023 06:59:55 +0000
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
X-Inumbo-ID: 607964b0-1eef-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688972395; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RHidA/DT+UzUPB1UMUSx12c63/zw1jPxU6Hc1TI8NHE=;
	b=sOc8dJ7YeDIG6wYvixIVMq5a9LyD8ATvLQm0JWcdufmdoZ9rExKz1/2QoR/1cam1NUEcbm
	UsGvUWBjcPPTEj+tDZcI39vyExUEHVYlSloU5Z1UZupMzTJfyHJyHAIjXEfHZH80YEjXs7
	vxdk4Zx+OZq/wrhyEbBvHHwVyF2Ic0U=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 01/18] tools/xenstore: explicitly specify create or modify for tdb_store()
Date: Mon, 10 Jul 2023 08:59:30 +0200
Message-Id: <20230710065947.4201-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230710065947.4201-1-jgross@suse.com>
References: <20230710065947.4201-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using TDB_REPLACE for either creating or modifying a TDB
entry, use either TDB_INSERT or TDB_MODIFY when calling tdb_store().

At higher function levels use the abstract flag values NODE_CREATE
and NODE_MODIFY.

This is for preparing to get rid of TDB, even if it is beneficial
while using TDB, too.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- use an enum for the new "flag" parameter of do_tdb_write()
  (Julien Grall)
- add comment to read_state_node() (Julien Grall)
---
 tools/xenstore/xenstored_core.c        | 32 +++++++++++++++-----------
 tools/xenstore/xenstored_core.h        | 10 ++++++--
 tools/xenstore/xenstored_domain.c      |  2 +-
 tools/xenstore/xenstored_transaction.c |  8 +++++--
 4 files changed, 34 insertions(+), 18 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 31a862b715..71a8a899db 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -601,7 +601,8 @@ static unsigned int get_acc_domid(struct connection *conn, TDB_DATA *key,
 }
 
 int do_tdb_write(struct connection *conn, TDB_DATA *key, TDB_DATA *data,
-		 struct node_account_data *acc, bool no_quota_check)
+		 struct node_account_data *acc, enum write_node_mode mode,
+		 bool no_quota_check)
 {
 	struct xs_tdb_record_hdr *hdr = (void *)data->dptr;
 	struct node_account_data old_acc = {};
@@ -635,7 +636,8 @@ int do_tdb_write(struct connection *conn, TDB_DATA *key, TDB_DATA *data,
 	}
 
 	/* TDB should set errno, but doesn't even set ecode AFAICT. */
-	if (tdb_store(tdb_ctx, *key, *data, TDB_REPLACE) != 0) {
+	if (tdb_store(tdb_ctx, *key, *data,
+		      (mode == NODE_CREATE) ? TDB_INSERT : TDB_MODIFY) != 0) {
 		domain_memory_add_nochk(conn, new_domid,
 					-data->dsize - key->dsize);
 		/* Error path, so no quota check. */
@@ -774,7 +776,7 @@ static bool read_node_can_propagate_errno(void)
 }
 
 int write_node_raw(struct connection *conn, TDB_DATA *key, struct node *node,
-		   bool no_quota_check)
+		   enum write_node_mode mode, bool no_quota_check)
 {
 	TDB_DATA data;
 	void *p;
@@ -812,7 +814,7 @@ int write_node_raw(struct connection *conn, TDB_DATA *key, struct node *node,
 	p += node->datalen;
 	memcpy(p, node->children, node->childlen);
 
-	if (do_tdb_write(conn, key, &data, &node->acc, no_quota_check))
+	if (do_tdb_write(conn, key, &data, &node->acc, mode, no_quota_check))
 		return EIO;
 
 	return 0;
@@ -823,14 +825,14 @@ int write_node_raw(struct connection *conn, TDB_DATA *key, struct node *node,
  * node->key. This can later be used if the change needs to be reverted.
  */
 static int write_node(struct connection *conn, struct node *node,
-		      bool no_quota_check)
+		      enum write_node_mode mode, bool no_quota_check)
 {
 	int ret;
 
 	if (access_node(conn, node, NODE_ACCESS_WRITE, &node->key))
 		return errno;
 
-	ret = write_node_raw(conn, &node->key, node, no_quota_check);
+	ret = write_node_raw(conn, &node->key, node, mode, no_quota_check);
 	if (ret && conn && conn->transaction) {
 		/*
 		 * Reverting access_node() is hard, so just fail the
@@ -1496,7 +1498,8 @@ static struct node *create_node(struct connection *conn, const void *ctx,
 			goto err;
 		}
 
-		ret = write_node(conn, i, false);
+		ret = write_node(conn, i, i->parent ? NODE_CREATE : NODE_MODIFY,
+				 false);
 		if (ret)
 			goto err;
 
@@ -1560,7 +1563,7 @@ static int do_write(const void *ctx, struct connection *conn,
 	} else {
 		node->data = in->buffer + offset;
 		node->datalen = datalen;
-		if (write_node(conn, node, false))
+		if (write_node(conn, node, NODE_MODIFY, false))
 			return errno;
 	}
 
@@ -1610,7 +1613,7 @@ static int remove_child_entry(struct connection *conn, struct node *node,
 	memdel(node->children, offset, childlen + 1, node->childlen);
 	node->childlen -= childlen + 1;
 
-	return write_node(conn, node, true);
+	return write_node(conn, node, NODE_MODIFY, true);
 }
 
 static int delete_child(struct connection *conn,
@@ -1807,7 +1810,7 @@ static int do_set_perms(const void *ctx, struct connection *conn,
 	if (domain_nbentry_inc(conn, get_node_owner(node)))
 		return ENOMEM;
 
-	if (write_node(conn, node, false))
+	if (write_node(conn, node, NODE_MODIFY, false))
 		return errno;
 
 	fire_watches(conn, ctx, name, node, false, &old_perms);
@@ -2321,7 +2324,7 @@ static void manual_node(const char *name, const char *child)
 	if (child)
 		node->childlen = strlen(child) + 1;
 
-	if (write_node(NULL, node, false))
+	if (write_node(NULL, node, NODE_CREATE, false))
 		barf_perror("Could not create initial node %s", name);
 	talloc_free(node);
 }
@@ -3469,12 +3472,15 @@ void read_state_node(const void *ctx, const void *state)
 			barf("allocation error restoring node");
 
 		set_tdb_key(parentname, &key);
-		if (write_node_raw(NULL, &key, parent, true))
+		if (write_node_raw(NULL, &key, parent, NODE_MODIFY, true))
 			barf("write parent error restoring node");
 	}
 
 	set_tdb_key(name, &key);
-	if (write_node_raw(NULL, &key, node, true))
+
+	/* The "/" node is already existing, so it can only be modified here. */
+	if (write_node_raw(NULL, &key, node,
+			   strcmp(name, "/") ? NODE_CREATE : NODE_MODIFY, true))
 		barf("write node error restoring node");
 
 	if (domain_nbentry_inc(&conn, get_node_owner(node)))
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 84a611cbb5..8130993184 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -237,8 +237,13 @@ static inline unsigned int get_node_owner(const struct node *node)
 }
 
 /* Write a node to the tdb data base. */
+enum write_node_mode {
+	NODE_CREATE,
+	NODE_MODIFY
+};
+
 int write_node_raw(struct connection *conn, TDB_DATA *key, struct node *node,
-		   bool no_quota_check);
+		   enum write_node_mode mode, bool no_quota_check);
 
 /* Get a node from the tdb data base. */
 struct node *read_node(struct connection *conn, const void *ctx,
@@ -358,7 +363,8 @@ int remember_string(struct hashtable *hash, const char *str);
 
 void set_tdb_key(const char *name, TDB_DATA *key);
 int do_tdb_write(struct connection *conn, TDB_DATA *key, TDB_DATA *data,
-		 struct node_account_data *acc, bool no_quota_check);
+		 struct node_account_data *acc, enum write_node_mode mode,
+		 bool no_quota_check);
 int do_tdb_delete(struct connection *conn, TDB_DATA *key,
 		  struct node_account_data *acc);
 
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 632ddb5efc..ac0e109654 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -523,7 +523,7 @@ static int domain_tree_remove_sub(const void *ctx, struct connection *conn,
 		node->perms.p[0].id = priv_domid;
 		node->acc.memory = 0;
 		domain_nbentry_inc(NULL, priv_domid);
-		if (write_node_raw(NULL, &key, node, true)) {
+		if (write_node_raw(NULL, &key, node, NODE_MODIFY, true)) {
 			/* That's unfortunate. We only can try to continue. */
 			syslog(LOG_ERR,
 			       "error when moving orphaned node %s to dom0\n",
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index 334f1609f1..0655073de7 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -290,7 +290,8 @@ int access_node(struct connection *conn, struct node *node,
 			i->check_gen = true;
 			if (node->generation != NO_GENERATION) {
 				set_tdb_key(i->trans_name, &local_key);
-				ret = write_node_raw(conn, &local_key, node, true);
+				ret = write_node_raw(conn, &local_key, node,
+						     NODE_CREATE, true);
 				if (ret)
 					goto err;
 				i->ta_node = true;
@@ -363,6 +364,7 @@ static int finalize_transaction(struct connection *conn,
 	TDB_DATA key, ta_key, data;
 	struct xs_tdb_record_hdr *hdr;
 	uint64_t gen;
+	int flag;
 
 	list_for_each_entry_safe(i, n, &trans->accessed, list) {
 		if (i->check_gen) {
@@ -405,8 +407,10 @@ static int finalize_transaction(struct connection *conn,
 					  ta_key.dsize + data.dsize);
 				hdr = (void *)data.dptr;
 				hdr->generation = ++generation;
+				flag = (i->generation == NO_GENERATION)
+				       ? NODE_CREATE : NODE_MODIFY;
 				*is_corrupt |= do_tdb_write(conn, &key, &data,
-							    NULL, true);
+							    NULL, flag, true);
 				talloc_free(data.dptr);
 				if (do_tdb_delete(conn, &ta_key, NULL))
 					*is_corrupt = true;
-- 
2.35.3


