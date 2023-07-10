Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E84F374CDCC
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 09:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560949.877154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIksZ-0004y1-K0; Mon, 10 Jul 2023 07:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560949.877154; Mon, 10 Jul 2023 07:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIksZ-0004v4-F1; Mon, 10 Jul 2023 07:00:15 +0000
Received: by outflank-mailman (input) for mailman id 560949;
 Mon, 10 Jul 2023 07:00:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xcmr=C4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qIksY-0002xd-1Z
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 07:00:14 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ac82313-1eef-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 09:00:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3471E1F88C;
 Mon, 10 Jul 2023 07:00:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0550B1361C;
 Mon, 10 Jul 2023 07:00:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nq9lO3ysq2S+YgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 10 Jul 2023 07:00:12 +0000
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
X-Inumbo-ID: 6ac82313-1eef-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688972413; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xsZdRFZMlmJYeC+b7NSvfoHA0euYyIWBUyMoe8hvlNs=;
	b=ZQSfrQxPzu/T/Z7GKVK63Kdow34xvGdxXu8rbjOxQmAocIztptxeCAc2QV34vMBkiEuw8N
	qucIICs3OqcVA8HzhfMxxwPC92ehoi1cZzQvexj3QUtw0UTYMY5HvRiveVvaxxzT79fdF5
	yo2T2qusOoucVUJvRfqwVN+hXNp6Xuo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 04/18] tools/xenstore: rename do_tdb_delete() and change parameter type
Date: Mon, 10 Jul 2023 08:59:33 +0200
Message-Id: <20230710065947.4201-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230710065947.4201-1-jgross@suse.com>
References: <20230710065947.4201-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename do_tdb_delete() to db_delete() and replace the key parameter
with db_name specifying the name of the node in the data base.

This is in preparation to replace TDB with a more simple data storage.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- remove unrelated change (Julien Grall)
---
 tools/xenstore/xenstored_core.c        | 31 ++++++++++++--------------
 tools/xenstore/xenstored_core.h        |  5 +++--
 tools/xenstore/xenstored_transaction.c | 16 +++++--------
 3 files changed, 23 insertions(+), 29 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 6d7f002b54..5e83c412ad 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -658,28 +658,31 @@ int do_tdb_write(struct connection *conn, TDB_DATA *key, TDB_DATA *data,
 	return 0;
 }
 
-int do_tdb_delete(struct connection *conn, TDB_DATA *key,
-		  struct node_account_data *acc)
+int db_delete(struct connection *conn, const char *name,
+	      struct node_account_data *acc)
 {
 	struct node_account_data tmp_acc;
 	unsigned int domid;
+	TDB_DATA key;
+
+	set_tdb_key(name, &key);
 
 	if (!acc) {
 		acc = &tmp_acc;
 		acc->memory = -1;
 	}
 
-	get_acc_data(key, acc);
+	get_acc_data(&key, acc);
 
-	if (tdb_delete(tdb_ctx, *key)) {
+	if (tdb_delete(tdb_ctx, key)) {
 		errno = EIO;
 		return errno;
 	}
-	trace_tdb("delete %s\n", key->dptr);
+	trace_tdb("delete %s\n", name);
 
 	if (acc->memory) {
-		domid = get_acc_domid(conn, key, acc->domid);
-		domain_memory_add_nochk(conn, domid, -acc->memory - key->dsize);
+		domid = get_acc_domid(conn, &key, acc->domid);
+		domain_memory_add_nochk(conn, domid, -acc->memory - key.dsize);
 	}
 
 	return 0;
@@ -1450,13 +1453,10 @@ nomem:
 
 static void destroy_node_rm(struct connection *conn, struct node *node)
 {
-	TDB_DATA key;
-
 	if (streq(node->name, "/"))
 		corrupt(NULL, "Destroying root node!");
 
-	set_tdb_key(node->db_name, &key);
-	do_tdb_delete(conn, &key, &node->acc);
+	db_delete(conn, node->db_name, &node->acc);
 }
 
 static int destroy_node(struct connection *conn, struct node *node)
@@ -1647,7 +1647,6 @@ static int delnode_sub(const void *ctx, struct connection *conn,
 	bool watch_exact;
 	int ret;
 	const char *db_name;
-	TDB_DATA key;
 
 	/* Any error here will probably be repeated for all following calls. */
 	ret = access_node(conn, node, NODE_ACCESS_DELETE, &db_name);
@@ -1658,8 +1657,7 @@ static int delnode_sub(const void *ctx, struct connection *conn,
 		return WALK_TREE_ERROR_STOP;
 
 	/* In case of error stop the walk. */
-	set_tdb_key(db_name, &key);
-	if (!ret && do_tdb_delete(conn, &key, &node->acc))
+	if (!ret && db_delete(conn, db_name, &node->acc))
 		return WALK_TREE_ERROR_STOP;
 
 	/*
@@ -2484,9 +2482,8 @@ static int clean_store_(TDB_CONTEXT *tdb, TDB_DATA key, TDB_DATA val,
 	}
 	if (!hashtable_search(reachable, name)) {
 		log("clean_store: '%s' is orphaned!", name);
-		if (recovery) {
-			do_tdb_delete(NULL, &key, NULL);
-		}
+		if (recovery)
+			db_delete(NULL, name, NULL);
 	}
 
 	talloc_free(name);
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 2cfc01f200..7bc1f68532 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -361,12 +361,13 @@ extern xengnttab_handle **xgt_handle;
 
 int remember_string(struct hashtable *hash, const char *str);
 
+/* Data base access functions. */
 void set_tdb_key(const char *name, TDB_DATA *key);
 int do_tdb_write(struct connection *conn, TDB_DATA *key, TDB_DATA *data,
 		 struct node_account_data *acc, enum write_node_mode mode,
 		 bool no_quota_check);
-int do_tdb_delete(struct connection *conn, TDB_DATA *key,
-		  struct node_account_data *acc);
+int db_delete(struct connection *conn, const char *name,
+	      struct node_account_data *acc);
 
 void conn_free_buffered_data(struct connection *conn);
 
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index 1646c07040..a4f9d40e9a 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -385,8 +385,7 @@ static int finalize_transaction(struct connection *conn,
 		/* Entries for unmodified nodes can be removed early. */
 		if (!i->modified) {
 			if (i->ta_node) {
-				set_tdb_key(i->trans_name, &ta_key);
-				if (do_tdb_delete(conn, &ta_key, NULL))
+				if (db_delete(conn, i->trans_name, NULL))
 					return EIO;
 			}
 			list_del(&i->list);
@@ -395,7 +394,6 @@ static int finalize_transaction(struct connection *conn,
 	}
 
 	while ((i = list_top(&trans->accessed, struct accessed_node, list))) {
-		set_tdb_key(i->node, &key);
 		if (i->ta_node) {
 			set_tdb_key(i->trans_name, &ta_key);
 			data = tdb_fetch(tdb_ctx, ta_key);
@@ -406,10 +404,11 @@ static int finalize_transaction(struct connection *conn,
 				hdr->generation = ++generation;
 				flag = (i->generation == NO_GENERATION)
 				       ? NODE_CREATE : NODE_MODIFY;
+				set_tdb_key(i->node, &key);
 				*is_corrupt |= do_tdb_write(conn, &key, &data,
 							    NULL, flag, true);
 				talloc_free(data.dptr);
-				if (do_tdb_delete(conn, &ta_key, NULL))
+				if (db_delete(conn, i->trans_name, NULL))
 					*is_corrupt = true;
 			} else {
 				*is_corrupt = true;
@@ -422,7 +421,7 @@ static int finalize_transaction(struct connection *conn,
 			 */
 			*is_corrupt |= (i->generation == NO_GENERATION)
 				       ? false
-				       : do_tdb_delete(conn, &key, NULL);
+				       : db_delete(conn, i->node, NULL);
 		}
 		if (i->fire_watch)
 			fire_watches(conn, trans, i->node, NULL, i->watch_exact,
@@ -439,15 +438,12 @@ static int destroy_transaction(void *_transaction)
 {
 	struct transaction *trans = _transaction;
 	struct accessed_node *i;
-	TDB_DATA key;
 
 	wrl_ntransactions--;
 	trace_destroy(trans, "transaction");
 	while ((i = list_top(&trans->accessed, struct accessed_node, list))) {
-		if (i->ta_node) {
-			set_tdb_key(i->trans_name, &key);
-			do_tdb_delete(trans->conn, &key, NULL);
-		}
+		if (i->ta_node)
+			db_delete(trans->conn, i->trans_name, NULL);
 		list_del(&i->list);
 		talloc_free(i);
 	}
-- 
2.35.3


