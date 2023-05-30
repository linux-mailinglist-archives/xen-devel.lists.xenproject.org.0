Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 852B07159A9
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 11:14:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540965.843193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vQX-0008UP-Qb; Tue, 30 May 2023 09:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540965.843193; Tue, 30 May 2023 09:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vQX-0008Qt-Mh; Tue, 30 May 2023 09:14:01 +0000
Received: by outflank-mailman (input) for mailman id 540965;
 Tue, 30 May 2023 09:14:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2tj/=BT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q3vQW-0006QB-9G
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 09:14:00 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f390beb-feca-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 11:13:58 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 55F191FD68;
 Tue, 30 May 2023 09:13:58 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 28F691341B;
 Tue, 30 May 2023 09:13:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id PqSlCFa+dWTpIgAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 30 May 2023 09:13:58 +0000
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
X-Inumbo-ID: 4f390beb-feca-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685438038; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ddci7abEBVlfL/pNul+H+iyRqLJOJhYkViCfX8p+eww=;
	b=pxxH4+oyCrMS287AX/MDVfgu7yb8HwHOOmqajtEaY9ZQ9NCdWbawDaEh7XoQs8uKm3bb+T
	sfmNjQepUoqnNKpoTkUe0Dx8hBcSj7A+nl/414isPNxY4m6koGqVAGVSN6Os6bhoy/+8+4
	ijJI79LQ3j/DFAaJKlulCT30M2Sx/3U=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 04/11] tools/xenstore: rename do_tdb_delete() and change parameter type
Date: Tue, 30 May 2023 11:13:26 +0200
Message-Id: <20230530091333.7678-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230530091333.7678-1-jgross@suse.com>
References: <20230530091333.7678-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename do_tdb_delete() to db_delete() and replace the key parameter
with db_name specifying the name of the node in the data base.

This is in preparation to replace TDB with a more simple data storage.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c        | 31 ++++++++++++--------------
 tools/xenstore/xenstored_core.h        |  5 +++--
 tools/xenstore/xenstored_transaction.c | 18 ++++++---------
 3 files changed, 24 insertions(+), 30 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 239f8c6bc4..a2454ad24d 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -657,28 +657,31 @@ int do_tdb_write(struct connection *conn, TDB_DATA *key, TDB_DATA *data,
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
@@ -1449,13 +1452,10 @@ nomem:
 
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
@@ -1646,7 +1646,6 @@ static int delnode_sub(const void *ctx, struct connection *conn,
 	bool watch_exact;
 	int ret;
 	const char *db_name;
-	TDB_DATA key;
 
 	/* Any error here will probably be repeated for all following calls. */
 	ret = access_node(conn, node, NODE_ACCESS_DELETE, &db_name);
@@ -1657,8 +1656,7 @@ static int delnode_sub(const void *ctx, struct connection *conn,
 		return WALK_TREE_ERROR_STOP;
 
 	/* In case of error stop the walk. */
-	set_tdb_key(db_name, &key);
-	if (!ret && do_tdb_delete(conn, &key, &node->acc))
+	if (!ret && db_delete(conn, db_name, &node->acc))
 		return WALK_TREE_ERROR_STOP;
 
 	/*
@@ -2483,9 +2481,8 @@ static int clean_store_(TDB_CONTEXT *tdb, TDB_DATA key, TDB_DATA val,
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
index f7cb035f26..7fc6d73e5a 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -358,11 +358,12 @@ extern xengnttab_handle **xgt_handle;
 
 int remember_string(struct hashtable *hash, const char *str);
 
+/* Data base access functions. */
 void set_tdb_key(const char *name, TDB_DATA *key);
 int do_tdb_write(struct connection *conn, TDB_DATA *key, TDB_DATA *data,
 		 struct node_account_data *acc, int flag, bool no_quota_check);
-int do_tdb_delete(struct connection *conn, TDB_DATA *key,
-		  struct node_account_data *acc);
+int db_delete(struct connection *conn, const char *name,
+	      struct node_account_data *acc);
 
 void conn_free_buffered_data(struct connection *conn);
 
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index 1646c07040..bf173f3d1d 100644
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
@@ -395,21 +394,21 @@ static int finalize_transaction(struct connection *conn,
 	}
 
 	while ((i = list_top(&trans->accessed, struct accessed_node, list))) {
-		set_tdb_key(i->node, &key);
 		if (i->ta_node) {
 			set_tdb_key(i->trans_name, &ta_key);
 			data = tdb_fetch(tdb_ctx, ta_key);
 			if (data.dptr) {
-				trace_tdb("read %s size %zu\n", ta_key.dptr,
+				trace_tdb("read %s size %zu\n", i->trans_name,
 					  ta_key.dsize + data.dsize);
 				hdr = (void *)data.dptr;
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


