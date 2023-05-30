Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D047159AB
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 11:14:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540970.843204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vQd-0000cf-4i; Tue, 30 May 2023 09:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540970.843204; Tue, 30 May 2023 09:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vQd-0000Xh-11; Tue, 30 May 2023 09:14:07 +0000
Received: by outflank-mailman (input) for mailman id 540970;
 Tue, 30 May 2023 09:14:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2tj/=BT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q3vQb-0006nv-3u
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 09:14:05 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52899e5e-feca-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 11:14:04 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E51281FD68;
 Tue, 30 May 2023 09:14:03 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id B80581341B;
 Tue, 30 May 2023 09:14:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id hqiBK1u+dWTvIgAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 30 May 2023 09:14:03 +0000
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
X-Inumbo-ID: 52899e5e-feca-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685438043; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yvze7UvbZmnFIXQucfaUCARD9SmDS6V0ehB8xJuM3Kk=;
	b=HEzaLiVLJ8hT9VjON0PqE8qdC8Q5droOX0FZbiLslhJ6HUpFhx70Tof9dSsnwQ681W4R7v
	U/F4O7E/F/5C/1JEV6mDdYKtoM+s70O6l0h12hmr21lP4/nGzRf3KWPC+1J+gF1zHrzy2G
	u6NCMehIlXWxRe8jdsEX8uMe4zvROGs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 05/11] tools/xenstore: rename do_tdb_write() and change parameter type
Date: Tue, 30 May 2023 11:13:27 +0200
Message-Id: <20230530091333.7678-6-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230530091333.7678-1-jgross@suse.com>
References: <20230530091333.7678-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename do_tdb_write() to db_write() and replace the key parameter with
db_name specifying the name of the node in the data base, and the data
parameter with a data pointer and a length.

Do the same key parameter type change for write_node_raw(), too.

This is in preparation to replace TDB with a more simple data storage.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c        | 67 +++++++++++++-------------
 tools/xenstore/xenstored_core.h        |  9 ++--
 tools/xenstore/xenstored_domain.c      |  4 +-
 tools/xenstore/xenstored_transaction.c | 20 ++++----
 4 files changed, 49 insertions(+), 51 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index a2454ad24d..8fbf686331 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -600,22 +600,27 @@ static unsigned int get_acc_domid(struct connection *conn, TDB_DATA *key,
 	       ? domid : conn->id;
 }
 
-int do_tdb_write(struct connection *conn, TDB_DATA *key, TDB_DATA *data,
-		 struct node_account_data *acc, int flag, bool no_quota_check)
+int db_write(struct connection *conn, const char *db_name, void *data,
+	     size_t size, struct node_account_data *acc, int flag,
+	     bool no_quota_check)
 {
-	struct xs_tdb_record_hdr *hdr = (void *)data->dptr;
+	struct xs_tdb_record_hdr *hdr = data;
 	struct node_account_data old_acc = {};
 	unsigned int old_domid, new_domid;
 	int ret;
+	TDB_DATA key, dat;
 
+	set_tdb_key(db_name, &key);
+	dat.dptr = data;
+	dat.dsize = size;
 	if (!acc)
 		old_acc.memory = -1;
 	else
 		old_acc = *acc;
 
-	get_acc_data(key, &old_acc);
-	old_domid = get_acc_domid(conn, key, old_acc.domid);
-	new_domid = get_acc_domid(conn, key, hdr->perms[0].id);
+	get_acc_data(&key, &old_acc);
+	old_domid = get_acc_domid(conn, &key, old_acc.domid);
+	new_domid = get_acc_domid(conn, &key, hdr->perms[0].id);
 
 	/*
 	 * Don't check for ENOENT, as we want to be able to switch orphaned
@@ -623,35 +628,34 @@ int do_tdb_write(struct connection *conn, TDB_DATA *key, TDB_DATA *data,
 	 */
 	if (old_acc.memory)
 		domain_memory_add_nochk(conn, old_domid,
-					-old_acc.memory - key->dsize);
-	ret = domain_memory_add(conn, new_domid,
-				data->dsize + key->dsize, no_quota_check);
+					-old_acc.memory - key.dsize);
+	ret = domain_memory_add(conn, new_domid, size + key.dsize,
+				no_quota_check);
 	if (ret) {
 		/* Error path, so no quota check. */
 		if (old_acc.memory)
 			domain_memory_add_nochk(conn, old_domid,
-						old_acc.memory + key->dsize);
+						old_acc.memory + key.dsize);
 		return ret;
 	}
 
 	/* TDB should set errno, but doesn't even set ecode AFAICT. */
-	if (tdb_store(tdb_ctx, *key, *data,
+	if (tdb_store(tdb_ctx, key, dat,
 		      (flag == NODE_CREATE) ? TDB_INSERT : TDB_MODIFY) != 0) {
-		domain_memory_add_nochk(conn, new_domid,
-					-data->dsize - key->dsize);
+		domain_memory_add_nochk(conn, new_domid, -size - key.dsize);
 		/* Error path, so no quota check. */
 		if (old_acc.memory)
 			domain_memory_add_nochk(conn, old_domid,
-						old_acc.memory + key->dsize);
+						old_acc.memory + key.dsize);
 		errno = EIO;
 		return errno;
 	}
-	trace_tdb("store %s size %zu\n", key->dptr, data->dsize + key->dsize);
+	trace_tdb("store %s size %zu\n", db_name, size + key.dsize);
 
 	if (acc) {
 		/* Don't use new_domid, as it might be a transaction node. */
 		acc->domid = hdr->perms[0].id;
-		acc->memory = data->dsize;
+		acc->memory = size;
 	}
 
 	return 0;
@@ -779,33 +783,34 @@ static bool read_node_can_propagate_errno(void)
 	return errno == ENOMEM || errno == ENOSPC;
 }
 
-int write_node_raw(struct connection *conn, TDB_DATA *key, struct node *node,
-		   int flag, bool no_quota_check)
+int write_node_raw(struct connection *conn, const char *db_name,
+		   struct node *node, int flag, bool no_quota_check)
 {
-	TDB_DATA data;
+	void *data;
+	size_t size;
 	void *p;
 	struct xs_tdb_record_hdr *hdr;
 
 	if (domain_adjust_node_perms(node))
 		return errno;
 
-	data.dsize = sizeof(*hdr)
+	size = sizeof(*hdr)
 		+ node->perms.num * sizeof(node->perms.p[0])
 		+ node->datalen + node->childlen;
 
 	/* Call domain_max_chk() in any case in order to record max values. */
-	if (domain_max_chk(conn, ACC_NODESZ, data.dsize) && !no_quota_check) {
+	if (domain_max_chk(conn, ACC_NODESZ, size) && !no_quota_check) {
 		errno = ENOSPC;
 		return errno;
 	}
 
-	data.dptr = talloc_size(node, data.dsize);
-	if (!data.dptr) {
+	data = talloc_size(node, size);
+	if (!data) {
 		errno = ENOMEM;
 		return errno;
 	}
 
-	hdr = (void *)data.dptr;
+	hdr = data;
 	hdr->generation = node->generation;
 	hdr->num_perms = node->perms.num;
 	hdr->datalen = node->datalen;
@@ -818,7 +823,8 @@ int write_node_raw(struct connection *conn, TDB_DATA *key, struct node *node,
 	p += node->datalen;
 	memcpy(p, node->children, node->childlen);
 
-	if (do_tdb_write(conn, key, &data, &node->acc, flag, no_quota_check))
+	if (db_write(conn, db_name, data, size, &node->acc, flag,
+		     no_quota_check))
 		return EIO;
 
 	return 0;
@@ -832,13 +838,11 @@ static int write_node(struct connection *conn, struct node *node,
 		      int flag, bool no_quota_check)
 {
 	int ret;
-	TDB_DATA key;
 
 	if (access_node(conn, node, NODE_ACCESS_WRITE, &node->db_name))
 		return errno;
 
-	set_tdb_key(node->db_name, &key);
-	ret = write_node_raw(conn, &key, node, flag, no_quota_check);
+	ret = write_node_raw(conn, node->db_name, node, flag, no_quota_check);
 	if (ret && conn && conn->transaction) {
 		/*
 		 * Reverting access_node() is hard, so just fail the
@@ -3423,7 +3427,6 @@ void read_state_node(const void *ctx, const void *state)
 {
 	const struct xs_state_node *sn = state;
 	struct node *node, *parent;
-	TDB_DATA key;
 	char *name, *parentname;
 	unsigned int i;
 	struct connection conn = { .id = priv_domid };
@@ -3476,13 +3479,11 @@ void read_state_node(const void *ctx, const void *state)
 		if (add_child(node, parent, name))
 			barf("allocation error restoring node");
 
-		set_tdb_key(parentname, &key);
-		if (write_node_raw(NULL, &key, parent, NODE_MODIFY, true))
+		if (write_node_raw(NULL, parentname, parent, NODE_MODIFY, true))
 			barf("write parent error restoring node");
 	}
 
-	set_tdb_key(name, &key);
-	if (write_node_raw(NULL, &key, node,
+	if (write_node_raw(NULL, name, node,
 			   strcmp(name, "/") ? NODE_CREATE : NODE_MODIFY, true))
 		barf("write node error restoring node");
 
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 7fc6d73e5a..c4a995f745 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -237,8 +237,8 @@ static inline unsigned int get_node_owner(const struct node *node)
 }
 
 /* Write a node to the tdb data base. */
-int write_node_raw(struct connection *conn, TDB_DATA *key, struct node *node,
-		   int flag, bool no_quota_check);
+int write_node_raw(struct connection *conn, const char *db_name,
+		   struct node *node, int flag, bool no_quota_check);
 #define NODE_CREATE 0
 #define NODE_MODIFY 1
 
@@ -360,8 +360,9 @@ int remember_string(struct hashtable *hash, const char *str);
 
 /* Data base access functions. */
 void set_tdb_key(const char *name, TDB_DATA *key);
-int do_tdb_write(struct connection *conn, TDB_DATA *key, TDB_DATA *data,
-		 struct node_account_data *acc, int flag, bool no_quota_check);
+int db_write(struct connection *conn, const char *db_name, void *data,
+	     size_t size, struct node_account_data *acc, int flag,
+	     bool no_quota_check);
 int db_delete(struct connection *conn, const char *name,
 	      struct node_account_data *acc);
 
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 7bc49ec97c..e405ee31d3 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -511,19 +511,17 @@ static int domain_tree_remove_sub(const void *ctx, struct connection *conn,
 				  struct node *node, void *arg)
 {
 	struct domain *domain = arg;
-	TDB_DATA key;
 	int ret = WALK_TREE_OK;
 
 	if (node->perms.p[0].id != domain->domid)
 		return WALK_TREE_OK;
 
 	if (keep_orphans) {
-		set_tdb_key(node->name, &key);
 		domain_nbentry_dec(NULL, domain->domid);
 		node->perms.p[0].id = priv_domid;
 		node->acc.memory = 0;
 		domain_nbentry_inc(NULL, priv_domid);
-		if (write_node_raw(NULL, &key, node, NODE_MODIFY, true)) {
+		if (write_node_raw(NULL, node->name, node, NODE_MODIFY, true)) {
 			/* That's unfortunate. We only can try to continue. */
 			syslog(LOG_ERR,
 			       "error when moving orphaned node %s to dom0\n",
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index bf173f3d1d..029819e90c 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -228,7 +228,6 @@ int access_node(struct connection *conn, struct node *node,
 {
 	struct accessed_node *i = NULL;
 	struct transaction *trans;
-	TDB_DATA local_key;
 	int ret;
 	bool introduce = false;
 
@@ -286,8 +285,7 @@ int access_node(struct connection *conn, struct node *node,
 			i->generation = node->generation;
 			i->check_gen = true;
 			if (node->generation != NO_GENERATION) {
-				set_tdb_key(i->trans_name, &local_key);
-				ret = write_node_raw(conn, &local_key, node,
+				ret = write_node_raw(conn, i->trans_name, node,
 						     NODE_CREATE, true);
 				if (ret)
 					goto err;
@@ -358,7 +356,7 @@ static int finalize_transaction(struct connection *conn,
 				struct transaction *trans, bool *is_corrupt)
 {
 	struct accessed_node *i, *n;
-	TDB_DATA key, ta_key, data;
+	TDB_DATA key, data;
 	struct xs_tdb_record_hdr *hdr;
 	uint64_t gen;
 	int flag;
@@ -373,7 +371,7 @@ static int finalize_transaction(struct connection *conn,
 					return EIO;
 				gen = NO_GENERATION;
 			} else {
-				trace_tdb("read %s size %zu\n", key.dptr,
+				trace_tdb("read %s size %zu\n", i->node,
 					  key.dsize + data.dsize);
 				gen = hdr->generation;
 			}
@@ -395,18 +393,18 @@ static int finalize_transaction(struct connection *conn,
 
 	while ((i = list_top(&trans->accessed, struct accessed_node, list))) {
 		if (i->ta_node) {
-			set_tdb_key(i->trans_name, &ta_key);
-			data = tdb_fetch(tdb_ctx, ta_key);
+			set_tdb_key(i->trans_name, &key);
+			data = tdb_fetch(tdb_ctx, key);
 			if (data.dptr) {
 				trace_tdb("read %s size %zu\n", i->trans_name,
-					  ta_key.dsize + data.dsize);
+					  key.dsize + data.dsize);
 				hdr = (void *)data.dptr;
 				hdr->generation = ++generation;
 				flag = (i->generation == NO_GENERATION)
 				       ? NODE_CREATE : NODE_MODIFY;
-				set_tdb_key(i->node, &key);
-				*is_corrupt |= do_tdb_write(conn, &key, &data,
-							    NULL, flag, true);
+				*is_corrupt |= db_write(conn, i->node,
+							data.dptr, data.dsize,
+							NULL, flag, true);
 				talloc_free(data.dptr);
 				if (db_delete(conn, i->trans_name, NULL))
 					*is_corrupt = true;
-- 
2.35.3


