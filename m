Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DA37159B5
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 11:17:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540994.843243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vUA-0003jQ-Iw; Tue, 30 May 2023 09:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540994.843243; Tue, 30 May 2023 09:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vUA-0003hj-G0; Tue, 30 May 2023 09:17:46 +0000
Received: by outflank-mailman (input) for mailman id 540994;
 Tue, 30 May 2023 09:17:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2tj/=BT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q3vQn-0006QB-8W
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 09:14:17 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 593d96f0-feca-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 11:14:15 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 27F531FD85;
 Tue, 30 May 2023 09:14:15 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id EF9EE1341B;
 Tue, 30 May 2023 09:14:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id qDIuOWa+dWQKIwAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 30 May 2023 09:14:14 +0000
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
X-Inumbo-ID: 593d96f0-feca-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685438055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vR1hVHAjF1Inn8SNEDI2a5KzsJccXEFhtgtfIPwvc80=;
	b=CU+qGmFXQnb8N863IkBKFvZ/j9B3dsYmV6uk3b3CPw0QaolDHtrl9wCL74Xc1xEFKDMm96
	UKwlgdtwqBjZVtXL9cOyfe0lXHGz9C4LotYyt/ewG0QwHHZUURKV2INkGpc4ecFnQORhCP
	cOCNGOLEUOp5d0dbU0Pr4lq8NtT64Dc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 07/11] tools/xenstore: add wrapper for tdb_fetch()
Date: Tue, 30 May 2023 11:13:29 +0200
Message-Id: <20230530091333.7678-8-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230530091333.7678-1-jgross@suse.com>
References: <20230530091333.7678-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a wrapper function for tdb_fetch taking the name of the node in
the data base as a parameter. Let it return a data pointer and the
length of the data via a length pointer provided as additional
parameter.

This enables to make set_tdb_key() static again.

This is in preparation to replace TDB with a more simple data storage.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c        | 55 ++++++++++++++++----------
 tools/xenstore/xenstored_core.h        |  3 +-
 tools/xenstore/xenstored_transaction.c | 34 ++++++++--------
 3 files changed, 51 insertions(+), 41 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 522b2bbf5f..12c584f09b 100644
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
 
+void *db_fetch(const char *db_name, size_t *size)
+{
+	TDB_DATA key, data;
+
+	set_tdb_key(db_name, &key);
+	data = tdb_fetch(tdb_ctx, key);
+	if (!data.dptr)
+		errno = (tdb_error(tdb_ctx) == TDB_ERR_NOEXIST) ? ENOENT : EIO;
+	else
+		*size = data.dsize;
+
+	return data.dptr;
+}
+
 static void get_acc_data(const char *name, struct node_account_data *acc)
 {
-	TDB_DATA key, old_data;
+	void *old_data;
+	size_t size;
 	struct xs_tdb_record_hdr *hdr;
 
 	if (acc->memory < 0) {
-		set_tdb_key(name, &key);
-		old_data = tdb_fetch(tdb_ctx, key);
+		old_data = db_fetch(name, &size);
 		/* No check for error, as the node might not exist. */
-		if (old_data.dptr == NULL) {
+		if (old_data == NULL) {
 			acc->memory = 0;
 		} else {
 			trace_tdb("read %s size %zu\n", name,
-				  old_data.dsize + key.dsize);
-			hdr = (void *)old_data.dptr;
-			acc->memory = old_data.dsize;
+				  size + strlen(name));
+			hdr = old_data;
+			acc->memory = size;
 			acc->domid = hdr->perms[0].id;
 		}
-		talloc_free(old_data.dptr);
+		talloc_free(old_data);
 	}
 }
 
@@ -698,7 +712,8 @@ int db_delete(struct connection *conn, const char *name,
 struct node *read_node(struct connection *conn, const void *ctx,
 		       const char *name)
 {
-	TDB_DATA key, data;
+	void *data;
+	size_t size;
 	struct xs_tdb_record_hdr *hdr;
 	struct node *node;
 	const char *db_name;
@@ -717,29 +732,27 @@ struct node *read_node(struct connection *conn, const void *ctx,
 	}
 
 	db_name = transaction_prepend(conn, name);
-	set_tdb_key(db_name, &key);
+	data = db_fetch(db_name, &size);
 
-	data = tdb_fetch(tdb_ctx, key);
-
-	if (data.dptr == NULL) {
-		if (tdb_error(tdb_ctx) == TDB_ERR_NOEXIST) {
+	if (data == NULL) {
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
+	trace_tdb("read %s size %zu\n", db_name, size + strlen(db_name));
 
 	node->parent = NULL;
-	talloc_steal(node, data.dptr);
+	talloc_steal(node, data);
 
 	/* Datalen, childlen, number of permissions */
-	hdr = (void *)data.dptr;
+	hdr = data;
 	node->generation = hdr->generation;
 	node->perms.num = hdr->num_perms;
 	node->datalen = hdr->datalen;
@@ -748,7 +761,7 @@ struct node *read_node(struct connection *conn, const void *ctx,
 	/* Permissions are struct xs_permissions. */
 	node->perms.p = hdr->perms;
 	node->acc.domid = get_node_owner(node);
-	node->acc.memory = data.dsize;
+	node->acc.memory = size;
 	if (domain_adjust_node_perms(node))
 		goto error;
 
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index c4a995f745..e922dce775 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -310,7 +310,6 @@ do {						\
 		trace("tdb: " __VA_ARGS__);	\
 } while (0)
 
-extern TDB_CONTEXT *tdb_ctx;
 extern int dom0_domid;
 extern int dom0_event;
 extern int priv_domid;
@@ -359,7 +358,7 @@ extern xengnttab_handle **xgt_handle;
 int remember_string(struct hashtable *hash, const char *str);
 
 /* Data base access functions. */
-void set_tdb_key(const char *name, TDB_DATA *key);
+void *db_fetch(const char *db_name, size_t *size);
 int db_write(struct connection *conn, const char *db_name, void *data,
 	     size_t size, struct node_account_data *acc, int flag,
 	     bool no_quota_check);
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index 029819e90c..c51edf432f 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -356,26 +356,26 @@ static int finalize_transaction(struct connection *conn,
 				struct transaction *trans, bool *is_corrupt)
 {
 	struct accessed_node *i, *n;
-	TDB_DATA key, data;
+	void *data;
+	size_t size;
 	struct xs_tdb_record_hdr *hdr;
 	uint64_t gen;
 	int flag;
 
 	list_for_each_entry_safe(i, n, &trans->accessed, list) {
 		if (i->check_gen) {
-			set_tdb_key(i->node, &key);
-			data = tdb_fetch(tdb_ctx, key);
-			hdr = (void *)data.dptr;
-			if (!data.dptr) {
-				if (tdb_error(tdb_ctx) != TDB_ERR_NOEXIST)
-					return EIO;
+			data = db_fetch(i->node, &size);
+			hdr = data;
+			if (!data) {
+				if (errno != ENOENT)
+					return errno;
 				gen = NO_GENERATION;
 			} else {
 				trace_tdb("read %s size %zu\n", i->node,
-					  key.dsize + data.dsize);
+					  strlen(i->node) + size);
 				gen = hdr->generation;
 			}
-			talloc_free(data.dptr);
+			talloc_free(data);
 			if (i->generation != gen)
 				return EAGAIN;
 		}
@@ -393,19 +393,17 @@ static int finalize_transaction(struct connection *conn,
 
 	while ((i = list_top(&trans->accessed, struct accessed_node, list))) {
 		if (i->ta_node) {
-			set_tdb_key(i->trans_name, &key);
-			data = tdb_fetch(tdb_ctx, key);
-			if (data.dptr) {
+			data = db_fetch(i->trans_name, &size);
+			if (data) {
 				trace_tdb("read %s size %zu\n", i->trans_name,
-					  key.dsize + data.dsize);
-				hdr = (void *)data.dptr;
+					  strlen(i->trans_name) + size);
+				hdr = data;
 				hdr->generation = ++generation;
 				flag = (i->generation == NO_GENERATION)
 				       ? NODE_CREATE : NODE_MODIFY;
-				*is_corrupt |= db_write(conn, i->node,
-							data.dptr, data.dsize,
-							NULL, flag, true);
-				talloc_free(data.dptr);
+				*is_corrupt |= db_write(conn, i->node, data,
+							size, NULL, flag, true);
+				talloc_free(data);
 				if (db_delete(conn, i->trans_name, NULL))
 					*is_corrupt = true;
 			} else {
-- 
2.35.3


