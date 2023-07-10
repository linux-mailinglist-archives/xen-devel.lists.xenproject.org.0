Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BE174CDCB
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 09:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560947.877134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIksQ-000473-3O; Mon, 10 Jul 2023 07:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560947.877134; Mon, 10 Jul 2023 07:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIksP-00043i-Vj; Mon, 10 Jul 2023 07:00:05 +0000
Received: by outflank-mailman (input) for mailman id 560947;
 Mon, 10 Jul 2023 07:00:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xcmr=C4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qIksO-0002bQ-EP
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 07:00:04 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63d8a21d-1eef-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 09:00:02 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7DC571F88C;
 Mon, 10 Jul 2023 07:00:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 492EA1361C;
 Mon, 10 Jul 2023 07:00:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YueMEHGsq2R7YgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 10 Jul 2023 07:00:01 +0000
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
X-Inumbo-ID: 63d8a21d-1eef-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688972401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KFmpVFU+h7qc5u0FKx+I037y6Jj0Yy07AlxSMLRNjII=;
	b=Xec4XyY7Y5NLn+3prjqMdyguvB+VbJS9VgiQScRNIzCfvTlYviSQlYaxQ6pWRzxS8eR6zP
	pSIczuesx+RXE5BtbrCT5rpo0y9el8YRKLpzTalQIlNIZNYmUPoGfx8DIBjPZ2TGLNnUtL
	gj4aSpsLQjLBFoxOOAr5ercDoudU9E4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 02/18] tools/xenstore: replace key in struct node with data base name
Date: Mon, 10 Jul 2023 08:59:31 +0200
Message-Id: <20230710065947.4201-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230710065947.4201-1-jgross@suse.com>
References: <20230710065947.4201-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of storing the TDB key in struct node, only store the name of
the node used to access it in the data base.

Associated with that change replace the key parameter of access_node()
with the equivalent db_name.

This is in preparation to replace TDB with a more simple data storage.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_core.c        | 19 +++++++++++++------
 tools/xenstore/xenstored_core.h        |  4 ++--
 tools/xenstore/xenstored_transaction.c | 10 +++++-----
 tools/xenstore/xenstored_transaction.h |  2 +-
 4 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 71a8a899db..521ce1a70e 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -821,18 +821,20 @@ int write_node_raw(struct connection *conn, TDB_DATA *key, struct node *node,
 }
 
 /*
- * Write the node. If the node is written, caller can find the key used in
- * node->key. This can later be used if the change needs to be reverted.
+ * Write the node. If the node is written, caller can find the DB name used in
+ * node->db_name. This can later be used if the change needs to be reverted.
  */
 static int write_node(struct connection *conn, struct node *node,
 		      enum write_node_mode mode, bool no_quota_check)
 {
 	int ret;
+	TDB_DATA key;
 
-	if (access_node(conn, node, NODE_ACCESS_WRITE, &node->key))
+	if (access_node(conn, node, NODE_ACCESS_WRITE, &node->db_name))
 		return errno;
 
-	ret = write_node_raw(conn, &node->key, node, mode, no_quota_check);
+	set_tdb_key(node->db_name, &key);
+	ret = write_node_raw(conn, &key, node, mode, no_quota_check);
 	if (ret && conn && conn->transaction) {
 		/*
 		 * Reverting access_node() is hard, so just fail the
@@ -1446,10 +1448,13 @@ nomem:
 
 static void destroy_node_rm(struct connection *conn, struct node *node)
 {
+	TDB_DATA key;
+
 	if (streq(node->name, "/"))
 		corrupt(NULL, "Destroying root node!");
 
-	do_tdb_delete(conn, &node->key, &node->acc);
+	set_tdb_key(node->db_name, &key);
+	do_tdb_delete(conn, &key, &node->acc);
 }
 
 static int destroy_node(struct connection *conn, struct node *node)
@@ -1639,10 +1644,11 @@ static int delnode_sub(const void *ctx, struct connection *conn,
 	const char *root = arg;
 	bool watch_exact;
 	int ret;
+	const char *db_name;
 	TDB_DATA key;
 
 	/* Any error here will probably be repeated for all following calls. */
-	ret = access_node(conn, node, NODE_ACCESS_DELETE, &key);
+	ret = access_node(conn, node, NODE_ACCESS_DELETE, &db_name);
 	if (ret > 0)
 		return WALK_TREE_SUCCESS_STOP;
 
@@ -1650,6 +1656,7 @@ static int delnode_sub(const void *ctx, struct connection *conn,
 		return WALK_TREE_ERROR_STOP;
 
 	/* In case of error stop the walk. */
+	set_tdb_key(db_name, &key);
 	if (!ret && do_tdb_delete(conn, &key, &node->acc))
 		return WALK_TREE_ERROR_STOP;
 
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 8130993184..2cfc01f200 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -181,8 +181,8 @@ struct node_account_data {
 
 struct node {
 	const char *name;
-	/* Key used to update TDB */
-	TDB_DATA key;
+	/* Name used to access data base. */
+	const char *db_name;
 
 	/* Parent (optional) */
 	struct node *parent;
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index 0655073de7..9dab0cd165 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -227,7 +227,7 @@ void transaction_prepend(struct connection *conn, const char *name,
  * to be accessed in the data base.
  */
 int access_node(struct connection *conn, struct node *node,
-		enum node_access_type type, TDB_DATA *key)
+		enum node_access_type type, const char **db_name)
 {
 	struct accessed_node *i = NULL;
 	struct transaction *trans;
@@ -243,8 +243,8 @@ int access_node(struct connection *conn, struct node *node,
 
 	if (!conn || !conn->transaction) {
 		/* They're changing the global database. */
-		if (key)
-			set_tdb_key(node->name, key);
+		if (db_name)
+			*db_name = node->name;
 		return 0;
 	}
 
@@ -308,8 +308,8 @@ int access_node(struct connection *conn, struct node *node,
 		/* Nothing to delete. */
 		return -1;
 
-	if (key) {
-		set_tdb_key(i->trans_name, key);
+	if (db_name) {
+		*db_name = i->trans_name;
 		if (type == NODE_ACCESS_WRITE)
 			i->ta_node = true;
 		if (type == NODE_ACCESS_DELETE)
diff --git a/tools/xenstore/xenstored_transaction.h b/tools/xenstore/xenstored_transaction.h
index 883145163f..f6a2e2f7f5 100644
--- a/tools/xenstore/xenstored_transaction.h
+++ b/tools/xenstore/xenstored_transaction.h
@@ -41,7 +41,7 @@ void ta_node_created(struct transaction *trans);
 
 /* This node was accessed. */
 int __must_check access_node(struct connection *conn, struct node *node,
-                             enum node_access_type type, TDB_DATA *key);
+                             enum node_access_type type, const char **db_name);
 
 /* Queue watches for a modified node. */
 void queue_watches(struct connection *conn, const char *name, bool watch_exact);
-- 
2.35.3


