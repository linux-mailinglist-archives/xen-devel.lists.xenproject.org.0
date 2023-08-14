Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6410477B326
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 10:02:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583417.913641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSWy-0006Iq-LF; Mon, 14 Aug 2023 08:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583417.913641; Mon, 14 Aug 2023 08:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSWy-0006GX-Ee; Mon, 14 Aug 2023 08:02:28 +0000
Received: by outflank-mailman (input) for mailman id 583417;
 Mon, 14 Aug 2023 08:02:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzbS=D7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qVSJN-0001Z5-7k
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:48:25 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1d04b79-3a76-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 09:48:23 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 33DE621984;
 Mon, 14 Aug 2023 07:48:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 01D83138EE;
 Mon, 14 Aug 2023 07:48:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WUJBOkbc2WQqQgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 14 Aug 2023 07:48:22 +0000
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
X-Inumbo-ID: f1d04b79-3a76-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691999303; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HtyyKA0W3H9KXqmdyPCi1zHxsPuz4ujFGNiMpwH4XHk=;
	b=udqbhJGcYU/4PU1AGped1+Knd7oMy+OudhePXwtDKNsHulDPmqHi/vWS2NeuSYfe6Phce0
	vms42M2PjWmUI5gVYtmnUzSAiqSdNEdmmW4HWG2Kp0iErSB9S0CAS1biMDQzYUGiboWCTv
	Y+l/Q3LHxgOWovbD8wqMY7fScBkHFOA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 13/19] tools/xenstore: introduce read_node_const()
Date: Mon, 14 Aug 2023 09:47:01 +0200
Message-Id: <20230814074707.27696-14-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230814074707.27696-1-jgross@suse.com>
References: <20230814074707.27696-1-jgross@suse.com>
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
V4:
- fix patch subject (Julien Grall)
- let read_node_helper() return a bool (Julien Grall)
---
 tools/xenstore/xenstored_core.c   | 105 ++++++++++++++++++++++--------
 tools/xenstore/xenstored_core.h   |   2 +
 tools/xenstore/xenstored_domain.c |   4 +-
 tools/xenstore/xenstored_watch.c  |  10 +--
 tools/xenstore/xenstored_watch.h  |   3 +-
 5 files changed, 90 insertions(+), 34 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index c8c8c4b8f4..f8e5e7b697 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -706,11 +706,11 @@ void db_delete(struct connection *conn, const char *name,
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
@@ -720,17 +720,16 @@ struct node *read_node(struct connection *conn, const void *ctx,
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
@@ -740,31 +739,80 @@ struct node *read_node(struct connection *conn, const void *ctx,
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
+
+ error:
+	talloc_free(node);
+	return NULL;
+}
 
+static bool read_node_helper(struct connection *conn, struct node *node)
+{
 	/* Data is binary blob (usually ascii, no nul). */
-	node->data = node->perms + hdr->num_perms;
+	node->data = node->perms + node->hdr.num_perms;
 	/* Children is strings, nul separated. */
 	node->children = node->data + node->hdr.datalen;
 
 	if (domain_adjust_node_perms(node))
-		goto error;
+		return false;
 
 	/* If owner is gone reset currently accounted memory size. */
 	if (node->acc.domid != get_node_owner(node))
 		node->acc.memory = 0;
 
 	if (access_node(conn, node, NODE_ACCESS_READ, NULL))
+		return false;
+
+	return true;
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
+	if (!read_node_helper(conn, node))
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
+	/* Unfortunately node->perms isn't const. */
+	node->perms = (void *)perms_from_node_hdr(hdr);
+
+	if (!read_node_helper(conn, node))
 		goto error;
 
 	return node;
@@ -900,13 +948,13 @@ char *get_parent(const void *ctx, const char *node)
 static int ask_parents(struct connection *conn, const void *ctx,
 		       const char *name, unsigned int *perm)
 {
-	struct node *node;
+	const struct node *node;
 
 	do {
 		name = get_parent(ctx, name);
 		if (!name)
 			return errno;
-		node = read_node(conn, ctx, name);
+		node = read_node_const(conn, ctx, name);
 		if (node)
 			break;
 		if (read_node_can_propagate_errno())
@@ -3197,9 +3245,8 @@ static int dump_state_node_err(struct dump_node_data *data, const char *err)
 }
 
 static int dump_state_node(const void *ctx, struct connection *conn,
-			   struct node *node, void *arg)
+			   const struct node *node, struct dump_node_data *data)
 {
-	struct dump_node_data *data = arg;
 	FILE *fp = data->fp;
 	unsigned int pathlen;
 	struct xs_state_record_header head;
@@ -3244,14 +3291,20 @@ static int dump_state_node(const void *ctx, struct connection *conn,
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
 
@@ -3267,7 +3320,7 @@ const char *dump_state_nodes(FILE *fp, const void *ctx)
 		.fp = fp,
 		.err = "Dump node walk error"
 	};
-	struct walk_funcs walkfuncs = { .enter = dump_state_node };
+	struct walk_funcs walkfuncs = { .enter = dump_state_node_enter };
 
 	if (walk_node_tree(ctx, NULL, "/", &walkfuncs, &data))
 		return data.err;
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index cbed412a86..07c59c07b7 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -292,6 +292,8 @@ int write_node_raw(struct connection *conn, const char *db_name,
 /* Get a node from the data base. */
 struct node *read_node(struct connection *conn, const void *ctx,
 		       const char *name);
+const struct node *read_node_const(struct connection *conn, const void *ctx,
+				   const char *name);
 
 /* Remove a node and its children. */
 int rm_node(struct connection *conn, const void *ctx, const char *name);
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index c00ea397cf..1bf138c8b1 100644
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
index 5767675e04..d6e5a4be1e 100644
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
 
 	if (perms) {
@@ -87,7 +87,7 @@ static bool watch_permitted(struct connection *conn, const void *ctx,
 	}
 
 	if (!node) {
-		node = read_node(conn, ctx, name);
+		node = read_node_const(conn, ctx, name);
 		if (!node)
 			return false;
 	}
@@ -101,7 +101,7 @@ static bool watch_permitted(struct connection *conn, const void *ctx,
 		parent_name = get_parent(ctx, node->name);
 		if (!parent_name)
 			return false;
-		parent = read_node(conn, ctx, parent_name);
+		parent = read_node_const(conn, ctx, parent_name);
 		if (!parent)
 			return false;
 	}
@@ -119,7 +119,7 @@ static bool watch_permitted(struct connection *conn, const void *ctx,
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


