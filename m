Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 880CA74CDF5
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 09:10:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561004.877288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIl24-0004PH-05; Mon, 10 Jul 2023 07:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561004.877288; Mon, 10 Jul 2023 07:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIl23-0004Gb-Ps; Mon, 10 Jul 2023 07:10:03 +0000
Received: by outflank-mailman (input) for mailman id 561004;
 Mon, 10 Jul 2023 07:10:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xcmr=C4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qIktB-0002xd-Un
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 07:00:53 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8235cea3-1eef-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 09:00:52 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7E48421E91;
 Mon, 10 Jul 2023 07:00:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4CA0B1361C;
 Mon, 10 Jul 2023 07:00:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pTM4EaSsq2QgYwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 10 Jul 2023 07:00:52 +0000
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
X-Inumbo-ID: 8235cea3-1eef-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688972452; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L9wkqTCyOjGjiu/WtVNnaatoSAz4S33Tyi60lW8cADE=;
	b=vXZvqyklLjIhkBkbKZ5EF4zNFYmCqZpjYoeGcJ14N7NFil/lzVSLDOmKAlUlFo30zU77Ah
	IESp0RORqr+USuB9SMnROHq1uwRCAZwUg8PlRa4FHh9KkJJMQCM/6q+FwPL18RIlvfWXgD
	Um3wQAYfNoztBzclilwiFVgOokMWIL8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 11/18] tools/xenstore: drop use of tdb
Date: Mon, 10 Jul 2023 08:59:40 +0200
Message-Id: <20230710065947.4201-12-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230710065947.4201-1-jgross@suse.com>
References: <20230710065947.4201-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today all Xenstore nodes are stored in a TDB data base. This data base
has several disadvantages:

- It is using a fixed sized hash table, resulting in high memory
  overhead for small installations with only very few VMs, and a rather
  large performance hit for systems with lots of VMs due to many
  collisions.
  The hash table size today is 7919 entries. This means that e.g. in
  case of a simple desktop use case with 2 or 3 VMs probably far less
  than 10% of the entries will be used (assuming roughly 100 nodes per
  VM). OTOH a setup on a large server with 500 VMs would result in
  heavy conflicts in the hash list with 5-10 nodes per hash table entry.

- TDB is using a single large memory area for storing the nodes. It
  only ever increases this area and will never shrink it afterwards.
  This will result in more memory usage than necessary after a peak of
  Xenstore usage.

- Xenstore is only single-threaded, while TDB is designed to be fit
  for multi-threaded use cases, resulting in much higher code
  complexity than needed.

- Special use cases of Xenstore are not possible to implement with TDB
  in an effective way, while an implementation of a data base tailored
  for Xenstore could simplify some handling (e.g. transactions) a lot.

So drop using TDB and store the nodes directly in memory making them
easily accessible. Use a hash-based lookup mechanism for fast lookup
of nodes by their full path.

For now only replace TDB keeping the current access functions.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- add const (Julien Grall)
- use specific pointer type instead of void * (Julien Grall)
- add comment to db_fetch() (Julien Grall)
---
 tools/xenstore/xenstored_core.c        | 158 ++++++++++---------------
 tools/xenstore/xenstored_core.h        |   5 +-
 tools/xenstore/xenstored_transaction.c |   1 -
 3 files changed, 64 insertions(+), 100 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 70db5265ad..ff10659e65 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -53,7 +53,6 @@
 #include "xenstored_domain.h"
 #include "xenstored_control.h"
 #include "xenstored_lu.h"
-#include "tdb.h"
 
 #ifndef NO_SOCKETS
 #if defined(HAVE_SYSTEMD)
@@ -85,7 +84,7 @@ bool keep_orphans = false;
 static int reopen_log_pipe[2];
 static int reopen_log_pipe0_pollfd_idx = -1;
 char *tracefile = NULL;
-static TDB_CONTEXT *tdb_ctx = NULL;
+static struct hashtable *nodes;
 unsigned int trace_flags = TRACE_OBJ | TRACE_IO;
 
 static const char *sockmsg_string(enum xsd_sockmsg_type type);
@@ -556,32 +555,32 @@ static void initialize_fds(int *p_sock_pollfd_idx, int *ptimeout)
 	}
 }
 
-static void set_tdb_key(const char *name, TDB_DATA *key)
-{
-	/*
-	 * Dropping const is fine here, as the key will never be modified
-	 * by TDB.
-	 */
-	key->dptr = (char *)name;
-	key->dsize = strlen(name);
-}
-
 struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size)
 {
-	TDB_DATA key, data;
+	const struct xs_tdb_record_hdr *hdr;
+	struct xs_tdb_record_hdr *p;
 
-	set_tdb_key(db_name, &key);
-	data = tdb_fetch(tdb_ctx, key);
-	if (!data.dptr) {
-		errno = (tdb_error(tdb_ctx) == TDB_ERR_NOEXIST) ? ENOENT : EIO;
-		*size = 0;
-	} else {
-		*size = data.dsize;
-		trace_tdb("read %s size %zu\n", db_name,
-			  *size + strlen(db_name));
+	hdr = hashtable_search(nodes, db_name);
+	if (!hdr) {
+		errno = ENOENT;
+		return NULL;
 	}
 
-	return (struct xs_tdb_record_hdr *)data.dptr;
+	*size = sizeof(*hdr) + hdr->num_perms * sizeof(hdr->perms[0]) +
+		hdr->datalen + hdr->childlen;
+
+	p = talloc_size(NULL, *size);
+	if (!p) {
+		errno = ENOMEM;
+		return NULL;
+	}
+
+	trace_tdb("read %s size %zu\n", db_name, *size + strlen(db_name));
+
+	/* Return a copy, avoiding a potential modification in the DB. */
+	memcpy(p, hdr, *size);
+
+	return p;
 }
 
 static void get_acc_data(const char *name, struct node_account_data *acc)
@@ -621,12 +620,10 @@ int db_write(struct connection *conn, const char *db_name, void *data,
 	struct xs_tdb_record_hdr *hdr = data;
 	struct node_account_data old_acc = {};
 	unsigned int old_domid, new_domid;
+	size_t name_len = strlen(db_name);
+	const char *name;
 	int ret;
-	TDB_DATA key, dat;
 
-	set_tdb_key(db_name, &key);
-	dat.dptr = data;
-	dat.dsize = size;
 	if (!acc)
 		old_acc.memory = -1;
 	else
@@ -642,29 +639,36 @@ int db_write(struct connection *conn, const char *db_name, void *data,
 	 */
 	if (old_acc.memory)
 		domain_memory_add_nochk(conn, old_domid,
-					-old_acc.memory - key.dsize);
-	ret = domain_memory_add(conn, new_domid, size + key.dsize,
+					-old_acc.memory - name_len);
+	ret = domain_memory_add(conn, new_domid, size + name_len,
 				no_quota_check);
 	if (ret) {
 		/* Error path, so no quota check. */
 		if (old_acc.memory)
 			domain_memory_add_nochk(conn, old_domid,
-						old_acc.memory + key.dsize);
+						old_acc.memory + name_len);
 		return ret;
 	}
 
-	/* TDB should set errno, but doesn't even set ecode AFAICT. */
-	if (tdb_store(tdb_ctx, key, dat,
-		      (mode == NODE_CREATE) ? TDB_INSERT : TDB_MODIFY) != 0) {
-		domain_memory_add_nochk(conn, new_domid, -size - key.dsize);
+	if (mode == NODE_CREATE) {
+		/* db_name could be modified later, so allocate a copy. */
+		name = talloc_strdup(data, db_name);
+		ret = name ? hashtable_add(nodes, name, data) : ENOMEM;
+	} else
+		ret = hashtable_replace(nodes, db_name, data);
+
+	if (ret) {
+		/* Free data, as it isn't owned by hashtable now. */
+		talloc_free(data);
+		domain_memory_add_nochk(conn, new_domid, -size - name_len);
 		/* Error path, so no quota check. */
 		if (old_acc.memory)
 			domain_memory_add_nochk(conn, old_domid,
-						old_acc.memory + key.dsize);
-		errno = EIO;
+						old_acc.memory + name_len);
+		errno = ret;
 		return errno;
 	}
-	trace_tdb("store %s size %zu\n", db_name, size + key.dsize);
+	trace_tdb("store %s size %zu\n", db_name, size + name_len);
 
 	if (acc) {
 		/* Don't use new_domid, as it might be a transaction node. */
@@ -680,9 +684,6 @@ int db_delete(struct connection *conn, const char *name,
 {
 	struct node_account_data tmp_acc;
 	unsigned int domid;
-	TDB_DATA key;
-
-	set_tdb_key(name, &key);
 
 	if (!acc) {
 		acc = &tmp_acc;
@@ -691,15 +692,13 @@ int db_delete(struct connection *conn, const char *name,
 
 	get_acc_data(name, acc);
 
-	if (tdb_delete(tdb_ctx, key)) {
-		errno = EIO;
-		return errno;
-	}
+	hashtable_remove(nodes, name);
 	trace_tdb("delete %s\n", name);
 
 	if (acc->memory) {
 		domid = get_acc_domid(conn, name, acc->domid);
-		domain_memory_add_nochk(conn, domid, -acc->memory - key.dsize);
+		domain_memory_add_nochk(conn, domid,
+					-acc->memory - strlen(name));
 	}
 
 	return 0;
@@ -2349,43 +2348,29 @@ static void manual_node(const char *name, const char *child)
 	talloc_free(node);
 }
 
-static void tdb_logger(TDB_CONTEXT *tdb, int level, const char * fmt, ...)
+static unsigned int hash_from_key_fn(const void *k)
 {
-	va_list ap;
-	char *s;
-	int saved_errno = errno;
+	const char *str = k;
+	unsigned int hash = 5381;
+	char c;
 
-	va_start(ap, fmt);
-	s = talloc_vasprintf(NULL, fmt, ap);
-	va_end(ap);
+	while ((c = *str++))
+		hash = ((hash << 5) + hash) + (unsigned int)c;
 
-	if (s) {
-		trace("TDB: %s\n", s);
-		syslog(LOG_ERR, "TDB: %s",  s);
-		if (verbose)
-			xprintf("TDB: %s", s);
-		talloc_free(s);
-	} else {
-		trace("talloc failure during logging\n");
-		syslog(LOG_ERR, "talloc failure during logging\n");
-	}
+	return hash;
+}
 
-	errno = saved_errno;
+static int keys_equal_fn(const void *key1, const void *key2)
+{
+	return 0 == strcmp(key1, key2);
 }
 
 void setup_structure(bool live_update)
 {
-	char *tdbname;
-
-	tdbname = talloc_strdup(talloc_autofree_context(), "/dev/mem");
-	if (!tdbname)
-		barf_perror("Could not create tdbname");
-
-	tdb_ctx = tdb_open_ex(tdbname, 7919, TDB_INTERNAL | TDB_NOLOCK,
-			      O_RDWR | O_CREAT | O_EXCL | O_CLOEXEC,
-			      0640, &tdb_logger, NULL);
-	if (!tdb_ctx)
-		barf_perror("Could not create tdb file %s", tdbname);
+	nodes = create_hashtable(NULL, "nodes", hash_from_key_fn, keys_equal_fn,
+				 HASHTABLE_FREE_KEY | HASHTABLE_FREE_VALUE);
+	if (!nodes)
+		barf_perror("Could not create nodes hashtable");
 
 	if (live_update)
 		manual_node("/", NULL);
@@ -2399,24 +2384,6 @@ void setup_structure(bool live_update)
 	}
 }
 
-static unsigned int hash_from_key_fn(const void *k)
-{
-	const char *str = k;
-	unsigned int hash = 5381;
-	char c;
-
-	while ((c = *str++))
-		hash = ((hash << 5) + hash) + (unsigned int)c;
-
-	return hash;
-}
-
-
-static int keys_equal_fn(const void *key1, const void *key2)
-{
-	return 0 == strcmp(key1, key2);
-}
-
 int remember_string(struct hashtable *hash, const char *str)
 {
 	char *k = talloc_strdup(NULL, str);
@@ -2476,12 +2443,11 @@ static int check_store_enoent(const void *ctx, struct connection *conn,
 /**
  * Helper to clean_store below.
  */
-static int clean_store_(TDB_CONTEXT *tdb, TDB_DATA key, TDB_DATA val,
-			void *private)
+static int clean_store_(const void *key, void *val, void *private)
 {
 	struct hashtable *reachable = private;
 	char *slash;
-	char * name = talloc_strndup(NULL, key.dptr, key.dsize);
+	char *name = talloc_strdup(NULL, key);
 
 	if (!name) {
 		log("clean_store: ENOMEM");
@@ -2511,7 +2477,7 @@ static int clean_store_(TDB_CONTEXT *tdb, TDB_DATA key, TDB_DATA val,
  */
 static void clean_store(struct check_store_data *data)
 {
-	tdb_traverse(tdb_ctx, &clean_store_, data->reachable);
+	hashtable_iterate(nodes, clean_store_, data->reachable);
 	domain_check_acc(data->domains);
 }
 
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 590d1b0a1f..5d96799c60 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -33,7 +33,6 @@
 #include "xenstore_lib.h"
 #include "xenstore_state.h"
 #include "list.h"
-#include "tdb.h"
 #include "hashtable.h"
 
 #ifndef O_CLOEXEC
@@ -236,7 +235,7 @@ static inline unsigned int get_node_owner(const struct node *node)
 	return node->perms.p[0].id;
 }
 
-/* Write a node to the tdb data base. */
+/* Write a node to the data base. */
 enum write_node_mode {
 	NODE_CREATE,
 	NODE_MODIFY
@@ -246,7 +245,7 @@ int write_node_raw(struct connection *conn, const char *db_name,
 		   struct node *node, enum write_node_mode mode,
 		   bool no_quota_check);
 
-/* Get a node from the tdb data base. */
+/* Get a node from the data base. */
 struct node *read_node(struct connection *conn, const void *ctx,
 		       const char *name);
 
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index 7d8c0afc6a..420645e55d 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -396,7 +396,6 @@ static int finalize_transaction(struct connection *conn,
 				       ? NODE_CREATE : NODE_MODIFY;
 				*is_corrupt |= db_write(conn, i->node, hdr,
 							size, NULL, flag, true);
-				talloc_free(hdr);
 				if (db_delete(conn, i->trans_name, NULL))
 					*is_corrupt = true;
 			} else {
-- 
2.35.3


