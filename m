Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6051475F47D
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 13:08:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568767.888753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtQG-0001iH-8e; Mon, 24 Jul 2023 11:08:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568767.888753; Mon, 24 Jul 2023 11:08:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtQF-0001bP-Q5; Mon, 24 Jul 2023 11:08:15 +0000
Received: by outflank-mailman (input) for mailman id 568767;
 Mon, 24 Jul 2023 11:08:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVkC=DK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qNtMv-0000KR-Gh
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 11:04:49 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7cef7ff-2a11-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 13:04:48 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9AE2C22973;
 Mon, 24 Jul 2023 11:04:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 62B8713476;
 Mon, 24 Jul 2023 11:04:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2DaxFtBavmRiYgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 24 Jul 2023 11:04:48 +0000
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
X-Inumbo-ID: e7cef7ff-2a11-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690196688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tZobPrK7ENIq2LYLKVZ55LBjmihB+bKrO8uvn/+a32A=;
	b=ik3qFlDDMYiRPGNQW0ZOd4kCMuYHHFUQ4x/do2uc6JMSIAWmIDCwEvucRXMYFlvj6h/LJu
	FDxUKOfI+hw+GQ/MilaaUuCt5VKZ/SQki7zTLMcwVAh7F88ZrsJCkA/xYsxVxHwu8tPNTy
	uFUg+X3f9wfpYAU040NoxYK77TkXVjA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 21/25] tools/xenstore: introduce read_node_nocopy()
Date: Mon, 24 Jul 2023 13:02:43 +0200
Message-Id: <20230724110247.10520-22-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230724110247.10520-1-jgross@suse.com>
References: <20230724110247.10520-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a read_node() variant returning a pointer to const struct
node, which doesn't do a copy of the node data after retrieval from
the data base.

Call this variant where appropriate.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new approach (Julien Grall)
---
 tools/xenstore/xenstored_core.c   | 104 ++++++++++++++++++++++--------
 tools/xenstore/xenstored_core.h   |   2 +
 tools/xenstore/xenstored_domain.c |   4 +-
 tools/xenstore/xenstored_watch.c  |  10 +--
 tools/xenstore/xenstored_watch.h  |   3 +-
 5 files changed, 89 insertions(+), 34 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index ea3d20a372..102be92a43 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -705,11 +705,11 @@ void db_delete(struct connection *conn, const char *name,
  * If it fails, returns NULL and sets errno.
  * Temporary memory allocations will be done with ctx.
  */
-struct node *read_node(struct connection *conn, const void *ctx,
-		       const char *name)
+static struct node *read_node_alloc(struct connection *conn, const void *ctx,
+				    const char *name,
+				    const struct node_hdr **hdr)
 {
 	size_t size;
-	const struct node_hdr *hdr;
 	struct node *node;
 	const char *db_name;
 	int err;
@@ -719,17 +719,16 @@ struct node *read_node(struct connection *conn, const void *ctx,
 		errno = ENOMEM;
 		return NULL;
 	}
+
 	node->name = talloc_strdup(node, name);
 	if (!node->name) {
-		talloc_free(node);
 		errno = ENOMEM;
-		return NULL;
+		goto error;
 	}
 
 	db_name = transaction_prepend(conn, name);
-	hdr = db_fetch(db_name, &size);
-
-	if (hdr == NULL) {
+	*hdr = db_fetch(db_name, &size);
+	if (*hdr == NULL) {
 		node->hdr.generation = NO_GENERATION;
 		err = access_node(conn, node, NODE_ACCESS_READ, NULL);
 		errno = err ? : ENOENT;
@@ -739,31 +738,79 @@ struct node *read_node(struct connection *conn, const void *ctx,
 	node->parent = NULL;
 
 	/* Datalen, childlen, number of permissions */
-	node->hdr = *hdr;
-	node->acc.domid = perms_from_node_hdr(hdr)->id;
+	node->hdr = **hdr;
+	node->acc.domid = perms_from_node_hdr(*hdr)->id;
 	node->acc.memory = size;
 
-	/* Copy node data to new memory area, starting with permissions. */
-	size -= sizeof(*hdr);
-	node->perms = talloc_memdup(node, perms_from_node_hdr(hdr), size);
-	if (node->perms == NULL) {
-		errno = ENOMEM;
-		goto error;
-	}
+	return node;
 
+ error:
+	talloc_free(node);
+	return NULL;
+}
+
+static int read_node_helper(struct connection *conn, struct node *node)
+{
 	/* Data is binary blob (usually ascii, no nul). */
-	node->data = node->perms + hdr->num_perms;
+	node->data = node->perms + node->hdr.num_perms;
 	/* Children is strings, nul separated. */
 	node->children = node->data + node->hdr.datalen;
 
 	if (domain_adjust_node_perms(node))
-		goto error;
+		return -1;
 
 	/* If owner is gone reset currently accounted memory size. */
 	if (node->acc.domid != get_node_owner(node))
 		node->acc.memory = 0;
 
 	if (access_node(conn, node, NODE_ACCESS_READ, NULL))
+		return -1;
+
+	return 0;
+}
+
+struct node *read_node(struct connection *conn, const void *ctx,
+		       const char *name)
+{
+	size_t size;
+	const struct node_hdr *hdr;
+	struct node *node;
+
+	node = read_node_alloc(conn, ctx, name, &hdr);
+	if (!node)
+		return NULL;
+
+	/* Copy node data to new memory area, starting with permissions. */
+	size = node->acc.memory - sizeof(*hdr);
+	node->perms = talloc_memdup(node, perms_from_node_hdr(hdr), size);
+	if (node->perms == NULL) {
+		errno = ENOMEM;
+		goto error;
+	}
+
+	if (read_node_helper(conn, node))
+		goto error;
+
+	return node;
+
+ error:
+	talloc_free(node);
+	return NULL;
+}
+
+const struct node *read_node_const(struct connection *conn, const void *ctx,
+				   const char *name)
+{
+	const struct node_hdr *hdr;
+	struct node *node;
+
+	node = read_node_alloc(conn, ctx, name, &hdr);
+	if (!node)
+		return NULL;
+
+	node->perms = perms_from_node_hdr(hdr);
+
+	if (read_node_helper(conn, node))
 		goto error;
 
 	return node;
@@ -896,14 +943,14 @@ char *get_parent(const void *ctx, const char *node)
 static int ask_parents(struct connection *conn, const void *ctx,
 		       const char *name, unsigned int *perm)
 {
-	struct node *node;
+	const struct node *node;
 	struct node_perms perms;
 
 	do {
 		name = get_parent(ctx, name);
 		if (!name)
 			return errno;
-		node = read_node(conn, ctx, name);
+		node = read_node_const(conn, ctx, name);
 		if (node)
 			break;
 		if (read_node_can_propagate_errno())
@@ -3194,9 +3241,8 @@ static int dump_state_node_err(struct dump_node_data *data, const char *err)
 }
 
 static int dump_state_node(const void *ctx, struct connection *conn,
-			   struct node *node, void *arg)
+			   const struct node *node, struct dump_node_data *data)
 {
-	struct dump_node_data *data = arg;
 	FILE *fp = data->fp;
 	unsigned int pathlen;
 	struct xs_state_record_header head;
@@ -3241,14 +3287,20 @@ static int dump_state_node(const void *ctx, struct connection *conn,
 	return WALK_TREE_OK;
 }
 
+static int dump_state_node_enter(const void *ctx, struct connection *conn,
+				 struct node *node, void *arg)
+{
+	return dump_state_node(ctx, conn, node, arg);
+}
+
 static int dump_state_special_node(FILE *fp, const void *ctx,
 				   struct dump_node_data *data,
 				   const char *name)
 {
-	struct node *node;
+	const struct node *node;
 	int ret;
 
-	node = read_node(NULL, ctx, name);
+	node = read_node_const(NULL, ctx, name);
 	if (!node)
 		return dump_state_node_err(data, "Dump node read node error");
 
@@ -3264,7 +3316,7 @@ const char *dump_state_nodes(FILE *fp, const void *ctx)
 		.fp = fp,
 		.err = "Dump node walk error"
 	};
-	struct walk_funcs walkfuncs = { .enter = dump_state_node };
+	struct walk_funcs walkfuncs = { .enter = dump_state_node_enter };
 
 	if (walk_node_tree(ctx, NULL, "/", &walkfuncs, &data))
 		return data.err;
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index adf8a785fc..65782c559d 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -282,6 +282,8 @@ int write_node_raw(struct connection *conn, const char *db_name,
 /* Get a node from the data base. */
 struct node *read_node(struct connection *conn, const void *ctx,
 		       const char *name);
+const struct node *read_node_const(struct connection *conn, const void *ctx,
+				   const char *name);
 
 /* Remove a node and its children. */
 int rm_node(struct connection *conn, const void *ctx, const char *name);
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index cdef6efef4..7290bbc848 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -563,12 +563,12 @@ static void domain_tree_remove(struct domain *domain)
 static void fire_special_watches(const char *name)
 {
 	void *ctx = talloc_new(NULL);
-	struct node *node;
+	const struct node *node;
 
 	if (!ctx)
 		return;
 
-	node = read_node(NULL, ctx, name);
+	node = read_node_const(NULL, ctx, name);
 
 	if (node)
 		fire_watches(NULL, ctx, name, node, true, NULL);
diff --git a/tools/xenstore/xenstored_watch.c b/tools/xenstore/xenstored_watch.c
index c161385f89..86cf8322b4 100644
--- a/tools/xenstore/xenstored_watch.c
+++ b/tools/xenstore/xenstored_watch.c
@@ -73,11 +73,11 @@ static const char *get_watch_path(const struct watch *watch, const char *name)
  * changed permissions we need to take the old permissions into account, too.
  */
 static bool watch_permitted(struct connection *conn, const void *ctx,
-			    const char *name, struct node *node,
+			    const char *name, const struct node *node,
 			    struct node_perms *perms)
 {
 	unsigned int perm;
-	struct node *parent;
+	const struct node *parent;
 	char *parent_name;
 	struct node_perms node_perms;
 
@@ -88,7 +88,7 @@ static bool watch_permitted(struct connection *conn, const void *ctx,
 	}
 
 	if (!node) {
-		node = read_node(conn, ctx, name);
+		node = read_node_const(conn, ctx, name);
 		if (!node)
 			return false;
 	}
@@ -103,7 +103,7 @@ static bool watch_permitted(struct connection *conn, const void *ctx,
 		parent_name = get_parent(ctx, node->name);
 		if (!parent_name)
 			return false;
-		parent = read_node(conn, ctx, parent_name);
+		parent = read_node_const(conn, ctx, parent_name);
 		if (!parent)
 			return false;
 	}
@@ -122,7 +122,7 @@ static bool watch_permitted(struct connection *conn, const void *ctx,
  * watch event, too.
  */
 void fire_watches(struct connection *conn, const void *ctx, const char *name,
-		  struct node *node, bool exact, struct node_perms *perms)
+		  const struct node *node, bool exact, struct node_perms *perms)
 {
 	struct connection *i;
 	struct buffered_data *req;
diff --git a/tools/xenstore/xenstored_watch.h b/tools/xenstore/xenstored_watch.h
index 091890edca..ea247997ad 100644
--- a/tools/xenstore/xenstored_watch.h
+++ b/tools/xenstore/xenstored_watch.h
@@ -28,7 +28,8 @@ int do_unwatch(const void *ctx, struct connection *conn,
 
 /* Fire all watches: !exact means all the children are affected (ie. rm). */
 void fire_watches(struct connection *conn, const void *tmp, const char *name,
-		  struct node *node, bool exact, struct node_perms *perms);
+		  const struct node *node, bool exact,
+		  struct node_perms *perms);
 
 void conn_delete_all_watches(struct connection *conn);
 
-- 
2.35.3


