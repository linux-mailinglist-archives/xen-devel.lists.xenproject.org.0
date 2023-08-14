Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CACC77B2F0
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:48:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583330.913530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSIw-0005fy-PB; Mon, 14 Aug 2023 07:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583330.913530; Mon, 14 Aug 2023 07:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSIw-0005bQ-Kj; Mon, 14 Aug 2023 07:47:58 +0000
Received: by outflank-mailman (input) for mailman id 583330;
 Mon, 14 Aug 2023 07:47:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzbS=D7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qVSIv-0001Z5-8A
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:47:57 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1294d9b-3a76-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 09:47:55 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 424161FD60;
 Mon, 14 Aug 2023 07:47:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 14AC4138EE;
 Mon, 14 Aug 2023 07:47:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dZygAyvc2WTsQQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 14 Aug 2023 07:47:55 +0000
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
X-Inumbo-ID: e1294d9b-3a76-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691999275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dH1h2NgsanT/KSOLBiOeGPIqJ6MvlgxSpBNMRTKunaQ=;
	b=E+KDO0j5VOyQTerByqDkQUs2sCsuKI2511MGY/lrNjJCoUTkA80lcsVK0FK+ZFaNDSs1Ea
	9X8NOSRKIQs0yU95v0SWh4VzClsZodBBNs7ExF7R1lxkUK0YRCEcBfcJKInntCG8JtTFzC
	EDpCQvvihpTWD8j0qL/0ebVtT2LLBRg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 08/19] tools/xenstore: move copying of node data out of db_fetch()
Date: Mon, 14 Aug 2023 09:46:56 +0200
Message-Id: <20230814074707.27696-9-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230814074707.27696-1-jgross@suse.com>
References: <20230814074707.27696-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today the node data is copied in db_fetch() on each data base read in
order to avoid accidental data base modifications when working on a
node.

read_node() is the only caller of db_fetch() which isn't freeing the
returned data area immediately after using it. The other callers don't
modify the returned data, so they don't need the data to be copied.

Move copying of the data into read_node(), resulting in a speedup of
the other callers due to no memory allocation and no copying being
needed anymore.

This allows to let db_fetch() return a pointer to const data.

As db_fetch() can't return any error other than ENOENT now, error
handling for the callers can be simplified.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
V3:
- modify return type of db_fetch() to return a pointer to const
  (Julien Grall)
- drop stale comment (Julien Grall)
- fix transaction handling
V4:
- don't drop const attribute for hdr (Julien Grall)
---
 tools/xenstore/xenstored_core.c        | 43 ++++++++++----------------
 tools/xenstore/xenstored_core.h        |  2 +-
 tools/xenstore/xenstored_transaction.c | 23 +++++++++-----
 3 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index a08962c3ea..53e29aeb9a 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -555,10 +555,9 @@ static void initialize_fds(int *p_sock_pollfd_idx, int *ptimeout)
 	}
 }
 
-struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size)
+const struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size)
 {
 	const struct xs_tdb_record_hdr *hdr;
-	struct xs_tdb_record_hdr *p;
 
 	hdr = hashtable_search(nodes, db_name);
 	if (!hdr) {
@@ -569,22 +568,15 @@ struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size)
 	*size = sizeof(*hdr) + hdr->num_perms * sizeof(hdr->perms[0]) +
 		hdr->datalen + hdr->childlen;
 
-	/* Return a copy, avoiding a potential modification in the DB. */
-	p = talloc_memdup(NULL, hdr, *size);
-	if (!p) {
-		errno = ENOMEM;
-		return NULL;
-	}
-
 	trace_tdb("read %s size %zu\n", db_name, *size + strlen(db_name));
 
-	return p;
+	return hdr;
 }
 
 static void get_acc_data(const char *name, struct node_account_data *acc)
 {
 	size_t size;
-	struct xs_tdb_record_hdr *hdr;
+	const struct xs_tdb_record_hdr *hdr;
 
 	if (acc->memory < 0) {
 		hdr = db_fetch(name, &size);
@@ -595,7 +587,6 @@ static void get_acc_data(const char *name, struct node_account_data *acc)
 			acc->memory = size;
 			acc->domid = hdr->perms[0].id;
 		}
-		talloc_free(hdr);
 	}
 }
 
@@ -708,7 +699,7 @@ struct node *read_node(struct connection *conn, const void *ctx,
 		       const char *name)
 {
 	size_t size;
-	struct xs_tdb_record_hdr *hdr;
+	const struct xs_tdb_record_hdr *hdr;
 	struct node *node;
 	const char *db_name;
 	int err;
@@ -729,30 +720,30 @@ struct node *read_node(struct connection *conn, const void *ctx,
 	hdr = db_fetch(db_name, &size);
 
 	if (hdr == NULL) {
-		if (errno == ENOENT) {
-			node->generation = NO_GENERATION;
-			err = access_node(conn, node, NODE_ACCESS_READ, NULL);
-			errno = err ? : ENOENT;
-		} else {
-			log("DB error on read: %s", strerror(errno));
-			errno = EIO;
-		}
+		node->generation = NO_GENERATION;
+		err = access_node(conn, node, NODE_ACCESS_READ, NULL);
+		errno = err ? : ENOENT;
 		goto error;
 	}
 
 	node->parent = NULL;
-	talloc_steal(node, hdr);
 
 	/* Datalen, childlen, number of permissions */
 	node->generation = hdr->generation;
 	node->perms.num = hdr->num_perms;
 	node->datalen = hdr->datalen;
 	node->childlen = hdr->childlen;
-
-	/* Permissions are struct xs_permissions. */
-	node->perms.p = hdr->perms;
-	node->acc.domid = get_node_owner(node);
+	node->acc.domid = hdr->perms[0].id;
 	node->acc.memory = size;
+
+	/* Copy node data to new memory area, starting with permissions. */
+	size -= sizeof(*hdr);
+	node->perms.p = talloc_memdup(node, hdr->perms, size);
+	if (node->perms.p == NULL) {
+		errno = ENOMEM;
+		goto error;
+	}
+
 	if (domain_adjust_node_perms(node))
 		goto error;
 
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index e1aeb4aecd..4a370f766f 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -362,7 +362,7 @@ extern xengnttab_handle **xgt_handle;
 int remember_string(struct hashtable *hash, const char *str);
 
 /* Data base access functions. */
-struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size);
+const struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size);
 int db_write(struct connection *conn, const char *db_name, void *data,
 	     size_t size, struct node_account_data *acc,
 	     enum write_node_mode mode, bool no_quota_check);
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index fbcea3663e..a90283dcc5 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -357,20 +357,17 @@ static int finalize_transaction(struct connection *conn,
 {
 	struct accessed_node *i, *n;
 	size_t size;
-	struct xs_tdb_record_hdr *hdr;
+	const struct xs_tdb_record_hdr *hdr;
 	uint64_t gen;
 
 	list_for_each_entry_safe(i, n, &trans->accessed, list) {
 		if (i->check_gen) {
 			hdr = db_fetch(i->node, &size);
 			if (!hdr) {
-				if (errno != ENOENT)
-					return errno;
 				gen = NO_GENERATION;
 			} else {
 				gen = hdr->generation;
 			}
-			talloc_free(hdr);
 			if (i->generation != gen)
 				return EAGAIN;
 		}
@@ -388,14 +385,26 @@ static int finalize_transaction(struct connection *conn,
 		if (i->ta_node) {
 			hdr = db_fetch(i->trans_name, &size);
 			if (hdr) {
+				/*
+				 * Delete transaction entry and write it as
+				 * no-TA entry. As we only hold a reference
+				 * to the data, increment its ref count, then
+				 * delete it from the DB. Now we own it and can
+				 * drop the const attribute for changing the
+				 * generation count.
+				 */
 				enum write_node_mode mode;
+				struct xs_tdb_record_hdr *own;
 
-				hdr->generation = ++generation;
+				talloc_increase_ref_count(hdr);
+				db_delete(conn, i->trans_name, NULL);
+
+				own = (struct xs_tdb_record_hdr *)hdr;
+				own->generation = ++generation;
 				mode = (i->generation == NO_GENERATION)
 				       ? NODE_CREATE : NODE_MODIFY;
-				*is_corrupt |= db_write(conn, i->node, hdr,
+				*is_corrupt |= db_write(conn, i->node, own,
 							size, NULL, mode, true);
-				db_delete(conn, i->trans_name, NULL);
 			} else {
 				*is_corrupt = true;
 			}
-- 
2.35.3


