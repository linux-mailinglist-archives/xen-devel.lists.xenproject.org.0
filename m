Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4298675F475
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 13:07:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568752.888675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtPT-0006yr-W9; Mon, 24 Jul 2023 11:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568752.888675; Mon, 24 Jul 2023 11:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtPT-0006xE-TA; Mon, 24 Jul 2023 11:07:27 +0000
Received: by outflank-mailman (input) for mailman id 568752;
 Mon, 24 Jul 2023 11:07:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVkC=DK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qNtMZ-0000KR-0e
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 11:04:27 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da691f06-2a11-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 13:04:26 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2673A2298F;
 Mon, 24 Jul 2023 11:04:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EC43613476;
 Mon, 24 Jul 2023 11:04:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id X8JKOLlavmQZYgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 24 Jul 2023 11:04:25 +0000
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
X-Inumbo-ID: da691f06-2a11-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690196666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HbG6vFfvfpnBEfnaaQaQ12ffiTPqhKHDZgquwOgUpOo=;
	b=lZQCbaqclyrLeW7Qk45h0NM5eK5D7aWNYWZkIEjznaHuVvQhWzLS/6hNsyXfCkYebr4QcY
	/af6jMVjIgKjxv3/cmUE8B/NTSXBHaXGbmWeB6qDLDr+p1Q37j3B2msfrrWU5l0VXzBiSl
	fRmhVGMr4Z0lqkE6w4mkKCpYP7QaCAU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 17/25] tools/xenstore: rework struct xs_tdb_record_hdr
Date: Mon, 24 Jul 2023 13:02:39 +0200
Message-Id: <20230724110247.10520-18-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230724110247.10520-1-jgross@suse.com>
References: <20230724110247.10520-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Struct xs_tdb_record_hdr is used for nodes stored in the data base.
When working on a node, struct node is being used, which is including
the same information as struct xs_tdb_record_hdr, but in a different
format. Rework struct xs_tdb_record_hdr in order to prepare including
it in struct node.

Do the following modifications:

- move its definition to xenstored_core.h, as the reason to put it into
  utils.h are no longer existing

- rename it to struct node_hdr, as the "tdb" in its name has only
  historical reasons

- replace the empty permission array at the end with a comment about
  the layout of data in the data base (concatenation of header,
  permissions, node contents, and children list)

- use narrower types for num_perms and datalen, as those are naturally
  limited to XENSTORE_PAYLOAD_MAX (childlen is different here, as it is
  in theory basically unlimited)

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 tools/xenstore/utils.h                 |  9 -------
 tools/xenstore/xenstored_core.c        | 35 +++++++++++++++-----------
 tools/xenstore/xenstored_core.h        | 20 ++++++++++++++-
 tools/xenstore/xenstored_transaction.c |  6 ++---
 4 files changed, 42 insertions(+), 28 deletions(-)

diff --git a/tools/xenstore/utils.h b/tools/xenstore/utils.h
index 028ecb9d7a..405d662ea2 100644
--- a/tools/xenstore/utils.h
+++ b/tools/xenstore/utils.h
@@ -9,15 +9,6 @@
 
 #include "xenstore_lib.h"
 
-/* Header of the node record in tdb. */
-struct xs_tdb_record_hdr {
-	uint64_t generation;
-	uint32_t num_perms;
-	uint32_t datalen;
-	uint32_t childlen;
-	struct xs_permissions perms[0];
-};
-
 /* Is A == B ? */
 #define streq(a,b) (strcmp((a),(b)) == 0)
 
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 1f5f118f1c..86b7c9bf36 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -555,9 +555,9 @@ static void initialize_fds(int *p_sock_pollfd_idx, int *ptimeout)
 	}
 }
 
-const struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size)
+const struct node_hdr *db_fetch(const char *db_name, size_t *size)
 {
-	struct xs_tdb_record_hdr *hdr;
+	struct node_hdr *hdr;
 
 	hdr = hashtable_search(nodes, db_name);
 	if (!hdr) {
@@ -565,7 +565,7 @@ const struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size)
 		return NULL;
 	}
 
-	*size = sizeof(*hdr) + hdr->num_perms * sizeof(hdr->perms[0]) +
+	*size = sizeof(*hdr) + hdr->num_perms * sizeof(struct xs_permissions) +
 		hdr->datalen + hdr->childlen;
 
 	trace_tdb("read %s size %zu\n", db_name, *size + strlen(db_name));
@@ -573,10 +573,15 @@ const struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size)
 	return hdr;
 }
 
+static struct xs_permissions *perms_from_node_hdr(const struct node_hdr *hdr)
+{
+	return (struct xs_permissions *)(hdr + 1);
+}
+
 static void get_acc_data(const char *name, struct node_account_data *acc)
 {
 	size_t size;
-	const struct xs_tdb_record_hdr *hdr;
+	const struct node_hdr *hdr;
 
 	if (acc->memory < 0) {
 		hdr = db_fetch(name, &size);
@@ -585,7 +590,7 @@ static void get_acc_data(const char *name, struct node_account_data *acc)
 			acc->memory = 0;
 		} else {
 			acc->memory = size;
-			acc->domid = hdr->perms[0].id;
+			acc->domid = perms_from_node_hdr(hdr)->id;
 		}
 	}
 }
@@ -606,7 +611,7 @@ int db_write(struct connection *conn, const char *db_name, const void *data,
 	     size_t size, struct node_account_data *acc,
 	     enum write_node_mode mode, bool no_quota_check)
 {
-	const struct xs_tdb_record_hdr *hdr = data;
+	const struct node_hdr *hdr = data;
 	struct node_account_data old_acc = {};
 	unsigned int old_domid, new_domid;
 	size_t name_len = strlen(db_name);
@@ -620,7 +625,7 @@ int db_write(struct connection *conn, const char *db_name, const void *data,
 
 	get_acc_data(db_name, &old_acc);
 	old_domid = get_acc_domid(conn, db_name, old_acc.domid);
-	new_domid = get_acc_domid(conn, db_name, hdr->perms[0].id);
+	new_domid = get_acc_domid(conn, db_name, perms_from_node_hdr(hdr)->id);
 
 	/*
 	 * Don't check for ENOENT, as we want to be able to switch orphaned
@@ -661,7 +666,7 @@ int db_write(struct connection *conn, const char *db_name, const void *data,
 
 	if (acc) {
 		/* Don't use new_domid, as it might be a transaction node. */
-		acc->domid = hdr->perms[0].id;
+		acc->domid = perms_from_node_hdr(hdr)->id;
 		acc->memory = size;
 	}
 
@@ -699,7 +704,7 @@ struct node *read_node(struct connection *conn, const void *ctx,
 		       const char *name)
 {
 	size_t size;
-	const struct xs_tdb_record_hdr *hdr;
+	const struct node_hdr *hdr;
 	struct node *node;
 	const char *db_name;
 	int err;
@@ -733,12 +738,12 @@ struct node *read_node(struct connection *conn, const void *ctx,
 	node->perms.num = hdr->num_perms;
 	node->datalen = hdr->datalen;
 	node->childlen = hdr->childlen;
-	node->acc.domid = hdr->perms[0].id;
+	node->acc.domid = perms_from_node_hdr(hdr)->id;
 	node->acc.memory = size;
 
 	/* Copy node data to new memory area, starting with permissions. */
 	size -= sizeof(*hdr);
-	node->perms.p = talloc_memdup(node, hdr->perms, size);
+	node->perms.p = talloc_memdup(node, perms_from_node_hdr(hdr), size);
 	if (node->perms.p == NULL) {
 		errno = ENOMEM;
 		goto error;
@@ -785,7 +790,7 @@ int write_node_raw(struct connection *conn, const char *db_name,
 	void *data;
 	size_t size;
 	void *p;
-	struct xs_tdb_record_hdr *hdr;
+	struct node_hdr *hdr;
 
 	if (domain_adjust_node_perms(node))
 		return errno;
@@ -812,9 +817,9 @@ int write_node_raw(struct connection *conn, const char *db_name,
 	hdr->datalen = node->datalen;
 	hdr->childlen = node->childlen;
 
-	memcpy(hdr->perms, node->perms.p,
-	       node->perms.num * sizeof(*node->perms.p));
-	p = hdr->perms + node->perms.num;
+	p = perms_from_node_hdr(hdr);
+	memcpy(p, node->perms.p, node->perms.num * sizeof(*node->perms.p));
+	p += node->perms.num * sizeof(*node->perms.p);
 	memcpy(p, node->data, node->datalen);
 	p += node->datalen;
 	memcpy(p, node->children, node->childlen);
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 6d1578ce97..c965709090 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -168,6 +168,24 @@ struct connection
 };
 extern struct list_head connections;
 
+/*
+ * Header of the node record in the data base.
+ * In the data base the memory of the node is a single memory chunk with the
+ * following format:
+ * struct {
+ *     node_hdr hdr;
+ *     struct xs_permissions perms[hdr.num_perms];
+ *     char data[hdr.datalen];
+ *     char children[hdr.childlen];
+ * };
+ */
+struct node_hdr {
+	uint64_t generation;
+	uint16_t num_perms;
+	uint16_t datalen;
+	uint32_t childlen;
+};
+
 struct node_perms {
 	unsigned int num;
 	struct xs_permissions *p;
@@ -362,7 +380,7 @@ extern xengnttab_handle **xgt_handle;
 int remember_string(struct hashtable *hash, const char *str);
 
 /* Data base access functions. */
-const struct xs_tdb_record_hdr *db_fetch(const char *db_name, size_t *size);
+const struct node_hdr *db_fetch(const char *db_name, size_t *size);
 int db_write(struct connection *conn, const char *db_name, const void *data,
 	     size_t size, struct node_account_data *acc,
 	     enum write_node_mode mode, bool no_quota_check);
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index a90283dcc5..9ca73b9874 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -357,7 +357,7 @@ static int finalize_transaction(struct connection *conn,
 {
 	struct accessed_node *i, *n;
 	size_t size;
-	const struct xs_tdb_record_hdr *hdr;
+	const struct node_hdr *hdr;
 	uint64_t gen;
 
 	list_for_each_entry_safe(i, n, &trans->accessed, list) {
@@ -394,12 +394,12 @@ static int finalize_transaction(struct connection *conn,
 				 * generation count.
 				 */
 				enum write_node_mode mode;
-				struct xs_tdb_record_hdr *own;
+				struct node_hdr *own;
 
 				talloc_increase_ref_count(hdr);
 				db_delete(conn, i->trans_name, NULL);
 
-				own = (struct xs_tdb_record_hdr *)hdr;
+				own = (struct node_hdr *)hdr;
 				own->generation = ++generation;
 				mode = (i->generation == NO_GENERATION)
 				       ? NODE_CREATE : NODE_MODIFY;
-- 
2.35.3


