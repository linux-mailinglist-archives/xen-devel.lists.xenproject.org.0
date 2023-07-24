Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4A075F432
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 13:03:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568744.888636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtLj-0003Z2-Kd; Mon, 24 Jul 2023 11:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568744.888636; Mon, 24 Jul 2023 11:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtLj-0003Wh-ET; Mon, 24 Jul 2023 11:03:35 +0000
Received: by outflank-mailman (input) for mailman id 568744;
 Mon, 24 Jul 2023 11:03:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVkC=DK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qNtLh-0008WC-HP
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 11:03:33 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8bb4c32-2a11-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 13:03:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9CCD620695;
 Mon, 24 Jul 2023 11:03:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F91F13476;
 Mon, 24 Jul 2023 11:03:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cxT0FYFavmSPYQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 24 Jul 2023 11:03:29 +0000
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
X-Inumbo-ID: b8bb4c32-2a11-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690196609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r7Ym4LUS2VI66FFn3rEX1b9dLO2vvX5eqYIpBnAurpE=;
	b=YoqMEZGwt6iKt5rvlm+FBPXB3LTOxVbCCNH3l1dvNBjNHt96loBzBkPpqlhVf6FuWAHkoz
	9P1BdvIcF+QC+2f5kB4sjVgtE1OK9QS6idc0UYBLL4+FdUN52ziSsxLav2OjMXgRzpHYuP
	jhYuATWr79WO0vjMwexd043/TYUG8T0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 07/25] tools/xenstore: add wrapper for tdb_fetch()
Date: Mon, 24 Jul 2023 13:02:29 +0200
Message-Id: <20230724110247.10520-8-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230724110247.10520-1-jgross@suse.com>
References: <20230724110247.10520-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a wrapper function for tdb_fetch taking the name of the node in
the data base as a parameter. Let it return a data pointer and the
length of the data via a length pointer provided as additional
parameter.

Move logging of the TDB access from the callers into the wrapper.

This enables to make set_tdb_key() and tdb_ctx static.

This is in preparation to replace TDB with a more simple data storage.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V2:
- always set *size in db_fetch() (Julien Grall)
- change db_fetch() return type (Julien Grall)
- move logging
---
 tools/xenstore/xenstored_core.c        | 55 +++++++++++++++-----------
 tools/xenstore/xenstored_core.h        |  3 +-
 tools/xenstore/xenstored_transaction.c | 31 ++++++---------
 3 files changed, 44 insertions(+), 45 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index dab09b5236..a12ede147c 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -85,7 +85,7 @@ bool keep_orphans = false;
 static int reopen_log_pipe[2];
 static int reopen_log_pipe0_pollfd_idx = -1;
 char *tracefile = NULL;
-TDB_CONTEXT *tdb_ctx = NULL;
+static TDB_CONTEXT *tdb_ctx = NULL;
 unsigned int trace_flags = TRACE_OBJ | TRACE_IO;
 
 static const char *sockmsg_string(enum xsd_sockmsg_type type);
@@ -556,7 +556,7 @@ static void initialize_fds(int *p_sock_pollfd_idx, int *ptimeout)
 	}
 }
 
-void set_tdb_key(const char *name, TDB_DATA *key)
+static void set_tdb_key(const char *name, TDB_DATA *key)
 {
 	/*
 	 * Dropping const is fine here, as the key will never be modified
@@ -566,25 +566,39 @@ void set_tdb_key(const char *name, TDB_DATA *key)
 	key->dsize = strlen(name);
 }
 
+struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size)
+{
+	TDB_DATA key, data;
+
+	set_tdb_key(db_name, &key);
+	data = tdb_fetch(tdb_ctx, key);
+	if (!data.dptr) {
+		errno = (tdb_error(tdb_ctx) == TDB_ERR_NOEXIST) ? ENOENT : EIO;
+		*size = 0;
+	} else {
+		*size = data.dsize;
+		trace_tdb("read %s size %zu\n", db_name,
+			  *size + strlen(db_name));
+	}
+
+	return (struct xs_tdb_record_hdr *)data.dptr;
+}
+
 static void get_acc_data(const char *name, struct node_account_data *acc)
 {
-	TDB_DATA key, old_data;
+	size_t size;
 	struct xs_tdb_record_hdr *hdr;
 
 	if (acc->memory < 0) {
-		set_tdb_key(name, &key);
-		old_data = tdb_fetch(tdb_ctx, key);
+		hdr = db_fetch(name, &size);
 		/* No check for error, as the node might not exist. */
-		if (old_data.dptr == NULL) {
+		if (hdr == NULL) {
 			acc->memory = 0;
 		} else {
-			trace_tdb("read %s size %zu\n", name,
-				  old_data.dsize + key.dsize);
-			hdr = (void *)old_data.dptr;
-			acc->memory = old_data.dsize;
+			acc->memory = size;
 			acc->domid = hdr->perms[0].id;
 		}
-		talloc_free(old_data.dptr);
+		talloc_free(hdr);
 	}
 }
 
@@ -698,7 +712,7 @@ int db_delete(struct connection *conn, const char *name,
 struct node *read_node(struct connection *conn, const void *ctx,
 		       const char *name)
 {
-	TDB_DATA key, data;
+	size_t size;
 	struct xs_tdb_record_hdr *hdr;
 	struct node *node;
 	const char *db_name;
@@ -717,29 +731,24 @@ struct node *read_node(struct connection *conn, const void *ctx,
 	}
 
 	db_name = transaction_prepend(conn, name);
-	set_tdb_key(db_name, &key);
+	hdr = db_fetch(db_name, &size);
 
-	data = tdb_fetch(tdb_ctx, key);
-
-	if (data.dptr == NULL) {
-		if (tdb_error(tdb_ctx) == TDB_ERR_NOEXIST) {
+	if (hdr == NULL) {
+		if (errno == ENOENT) {
 			node->generation = NO_GENERATION;
 			err = access_node(conn, node, NODE_ACCESS_READ, NULL);
 			errno = err ? : ENOENT;
 		} else {
-			log("TDB error on read: %s", tdb_errorstr(tdb_ctx));
+			log("DB error on read: %s", strerror(errno));
 			errno = EIO;
 		}
 		goto error;
 	}
 
-	trace_tdb("read %s size %zu\n", key.dptr, data.dsize + key.dsize);
-
 	node->parent = NULL;
-	talloc_steal(node, data.dptr);
+	talloc_steal(node, hdr);
 
 	/* Datalen, childlen, number of permissions */
-	hdr = (void *)data.dptr;
 	node->generation = hdr->generation;
 	node->perms.num = hdr->num_perms;
 	node->datalen = hdr->datalen;
@@ -748,7 +757,7 @@ struct node *read_node(struct connection *conn, const void *ctx,
 	/* Permissions are struct xs_permissions. */
 	node->perms.p = hdr->perms;
 	node->acc.domid = get_node_owner(node);
-	node->acc.memory = data.dsize;
+	node->acc.memory = size;
 	if (domain_adjust_node_perms(node))
 		goto error;
 
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 875ee5192b..f5aa8d51a0 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -315,7 +315,6 @@ do {						\
 		trace("tdb: " __VA_ARGS__);	\
 } while (0)
 
-extern TDB_CONTEXT *tdb_ctx;
 extern int dom0_domid;
 extern int dom0_event;
 extern int priv_domid;
@@ -364,7 +363,7 @@ extern xengnttab_handle **xgt_handle;
 int remember_string(struct hashtable *hash, const char *str);
 
 /* Data base access functions. */
-void set_tdb_key(const char *name, TDB_DATA *key);
+struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size);
 int db_write(struct connection *conn, const char *db_name, void *data,
 	     size_t size, struct node_account_data *acc,
 	     enum write_node_mode mode, bool no_quota_check);
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index 1961aef0d7..1981d1d55d 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -356,25 +356,21 @@ static int finalize_transaction(struct connection *conn,
 				struct transaction *trans, bool *is_corrupt)
 {
 	struct accessed_node *i, *n;
-	TDB_DATA key, ta_key, data;
+	size_t size;
 	struct xs_tdb_record_hdr *hdr;
 	uint64_t gen;
 
 	list_for_each_entry_safe(i, n, &trans->accessed, list) {
 		if (i->check_gen) {
-			set_tdb_key(i->node, &key);
-			data = tdb_fetch(tdb_ctx, key);
-			hdr = (void *)data.dptr;
-			if (!data.dptr) {
-				if (tdb_error(tdb_ctx) != TDB_ERR_NOEXIST)
-					return EIO;
+			hdr = db_fetch(i->node, &size);
+			if (!hdr) {
+				if (errno != ENOENT)
+					return errno;
 				gen = NO_GENERATION;
 			} else {
-				trace_tdb("read %s size %zu\n", key.dptr,
-					  key.dsize + data.dsize);
 				gen = hdr->generation;
 			}
-			talloc_free(data.dptr);
+			talloc_free(hdr);
 			if (i->generation != gen)
 				return EAGAIN;
 		}
@@ -392,21 +388,16 @@ static int finalize_transaction(struct connection *conn,
 
 	while ((i = list_top(&trans->accessed, struct accessed_node, list))) {
 		if (i->ta_node) {
-			set_tdb_key(i->trans_name, &ta_key);
-			data = tdb_fetch(tdb_ctx, ta_key);
-			if (data.dptr) {
+			hdr = db_fetch(i->trans_name, &size);
+			if (hdr) {
 				enum write_node_mode mode;
 
-				trace_tdb("read %s size %zu\n", ta_key.dptr,
-					  ta_key.dsize + data.dsize);
-				hdr = (void *)data.dptr;
 				hdr->generation = ++generation;
 				mode = (i->generation == NO_GENERATION)
 				       ? NODE_CREATE : NODE_MODIFY;
-				*is_corrupt |= db_write(conn, i->node,
-							data.dptr, data.dsize,
-							NULL, mode, true);
-				talloc_free(data.dptr);
+				*is_corrupt |= db_write(conn, i->node, hdr,
+							size, NULL, mode, true);
+				talloc_free(hdr);
 				if (db_delete(conn, i->trans_name, NULL))
 					*is_corrupt = true;
 			} else {
-- 
2.35.3


