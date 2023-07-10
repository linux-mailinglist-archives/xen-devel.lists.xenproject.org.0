Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 122AE74CDEE
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 09:09:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560984.877225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIl1d-0001Lg-8f; Mon, 10 Jul 2023 07:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560984.877225; Mon, 10 Jul 2023 07:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIl1d-0001ID-4D; Mon, 10 Jul 2023 07:09:37 +0000
Received: by outflank-mailman (input) for mailman id 560984;
 Mon, 10 Jul 2023 07:09:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xcmr=C4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qIkto-0002xd-WC
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 07:01:33 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99a2c6e0-1eef-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 09:01:32 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C6C5A1F38D;
 Mon, 10 Jul 2023 07:01:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9A10C1361C;
 Mon, 10 Jul 2023 07:01:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3sRVJMusq2RyYwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 10 Jul 2023 07:01:31 +0000
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
X-Inumbo-ID: 99a2c6e0-1eef-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688972491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UK04J9dErimDKqoXrosnGNBdXEpxv+Xoy6piXu//+Go=;
	b=L6vcRSYbCCaE/luqflnMc+4AEs3JIpmMPnN2bu8sfKaeQCNEqv2wyZB4UQZB9XHGXuDqfn
	9Qm7jcvaMfrL8g+0YGIjC1xspfJtt556FaB5DQEkitGuij4yG849KJBR/A0bvAoCsOfcUs
	SXwbqF851v6mUhpOJa/XG4ea30w0oNA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 18/18] tools/xenstore: add nocopy flag to node read functions
Date: Mon, 10 Jul 2023 08:59:47 +0200
Message-Id: <20230710065947.4201-19-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230710065947.4201-1-jgross@suse.com>
References: <20230710065947.4201-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today when reading a node from the data base through read_node(), the
node data is copied in order to avoid modifying the data base when
preparing a node update, as otherwise an error might result in an
inconsistent state.

There are, however, many cases where such a copy operation isn't
needed, as the node isn't modified.

Add a "nocopy" flag to read_node() and get_node*() functions for making
those cases less memory consuming and more performant.

Note that there is one modification of the node data left, which is not
problematic: domain_adjust_node_perms() might set the "ignore" flag of
a permission. This does no harm, as such an update of the permissions
doesn't need to be undone in case of a later processing error.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 tools/xenstore/xenstored_core.c   | 68 +++++++++++++++++--------------
 tools/xenstore/xenstored_core.h   |  2 +-
 tools/xenstore/xenstored_domain.c |  2 +-
 tools/xenstore/xenstored_watch.c  |  4 +-
 4 files changed, 41 insertions(+), 35 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 7495747d76..8041a6a1c6 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -706,7 +706,7 @@ void db_delete(struct connection *conn, const char *name,
  * Temporary memory allocations will be done with ctx.
  */
 struct node *read_node(struct connection *conn, const void *ctx,
-		       const char *name)
+		       const char *name, bool nocopy)
 {
 	size_t size;
 	struct node_hdr *hdr;
@@ -743,14 +743,18 @@ struct node *read_node(struct connection *conn, const void *ctx,
 	node->acc.domid = perms_from_node_hdr(hdr)->id;
 	node->acc.memory = size;
 
-	/* Copy node data to new memory area, starting with permissions. */
-	size -= sizeof(*hdr);
-	node->perms = talloc_size(node, size);
-	if (node->perms == NULL) {
-		errno = ENOMEM;
-		goto error;
+	if (nocopy) {
+		node->perms = (struct xs_permissions *)(hdr + 1);
+	} else {
+		/* Copy node data to new area, starting with permissions. */
+		size -= sizeof(*hdr);
+		node->perms = talloc_size(node, size);
+		if (node->perms == NULL) {
+			errno = ENOMEM;
+			goto error;
+		}
+		memcpy(node->perms, perms_from_node_hdr(hdr), size);
 	}
-	memcpy(node->perms, perms_from_node_hdr(hdr), size);
 
 	/* Permissions are struct xs_permissions. */
 	if (domain_adjust_node_perms(node))
@@ -905,7 +909,7 @@ static int ask_parents(struct connection *conn, const void *ctx,
 		name = get_parent(ctx, name);
 		if (!name)
 			return errno;
-		node = read_node(conn, ctx, name);
+		node = read_node(conn, ctx, name, true);
 		if (node)
 			break;
 		if (read_node_can_propagate_errno())
@@ -954,12 +958,12 @@ static int errno_from_parents(struct connection *conn, const void *ctx,
 static struct node *get_node(struct connection *conn,
 			     const void *ctx,
 			     const char *name,
-			     unsigned int perm)
+			     unsigned int perm, bool nocopy)
 {
 	struct node *node;
 	struct node_perms perms;
 
-	node = read_node(conn, ctx, name);
+	node = read_node(conn, ctx, name, nocopy);
 	/* If we don't have permission, we don't have node. */
 	if (node) {
 		node_to_node_perms(node, &perms);
@@ -1248,7 +1252,7 @@ static struct node *get_node_canonicalized(struct connection *conn,
 					   const void *ctx,
 					   const char *name,
 					   char **canonical_name,
-					   unsigned int perm)
+					   unsigned int perm, bool nocopy)
 {
 	char *tmp_name;
 
@@ -1261,17 +1265,18 @@ static struct node *get_node_canonicalized(struct connection *conn,
 		errno = EINVAL;
 		return NULL;
 	}
-	return get_node(conn, ctx, *canonical_name, perm);
+	return get_node(conn, ctx, *canonical_name, perm, nocopy);
 }
 
 static struct node *get_spec_node(struct connection *conn, const void *ctx,
 				  const char *name, char **canonical_name,
-				  unsigned int perm)
+				  unsigned int perm, bool nocopy)
 {
 	if (name[0] == '@')
-		return get_node(conn, ctx, name, perm);
+		return get_node(conn, ctx, name, perm, nocopy);
 
-	return get_node_canonicalized(conn, ctx, name, canonical_name, perm);
+	return get_node_canonicalized(conn, ctx, name, canonical_name, perm,
+				      nocopy);
 }
 
 static int send_directory(const void *ctx, struct connection *conn,
@@ -1280,7 +1285,7 @@ static int send_directory(const void *ctx, struct connection *conn,
 	struct node *node;
 
 	node = get_node_canonicalized(conn, ctx, onearg(in), NULL,
-				      XS_PERM_READ);
+				      XS_PERM_READ, true);
 	if (!node)
 		return errno;
 
@@ -1302,7 +1307,7 @@ static int send_directory_part(const void *ctx, struct connection *conn,
 
 	/* First arg is node name. */
 	node = get_node_canonicalized(conn, ctx, in->buffer, NULL,
-				      XS_PERM_READ);
+				      XS_PERM_READ, true);
 	if (!node)
 		return errno;
 
@@ -1352,7 +1357,7 @@ static int do_read(const void *ctx, struct connection *conn,
 	struct node *node;
 
 	node = get_node_canonicalized(conn, ctx, onearg(in), NULL,
-				      XS_PERM_READ);
+				      XS_PERM_READ, true);
 	if (!node)
 		return errno;
 
@@ -1414,7 +1419,7 @@ static struct node *construct_node(struct connection *conn, const void *ctx,
 			return NULL;
 
 		/* Try to read parent node until we found an existing one. */
-		parent = read_node(conn, ctx, parentname);
+		parent = read_node(conn, ctx, parentname, false);
 		if (!parent && (errno != ENOENT || !strcmp(parentname, "/")))
 			return NULL;
 
@@ -1566,7 +1571,8 @@ static int do_write(const void *ctx, struct connection *conn,
 	offset = strlen(vec[0]) + 1;
 	datalen = in->used - offset;
 
-	node = get_node_canonicalized(conn, ctx, vec[0], &name, XS_PERM_WRITE);
+	node = get_node_canonicalized(conn, ctx, vec[0], &name, XS_PERM_WRITE,
+				      false);
 	if (!node) {
 		/* No permissions, invalid input? */
 		if (errno != ENOENT)
@@ -1595,7 +1601,7 @@ static int do_mkdir(const void *ctx, struct connection *conn,
 	char *name;
 
 	node = get_node_canonicalized(conn, ctx, onearg(in), &name,
-				      XS_PERM_WRITE);
+				      XS_PERM_WRITE, false);
 
 	/* If it already exists, fine. */
 	if (!node) {
@@ -1689,7 +1695,7 @@ int rm_node(struct connection *conn, const void *ctx, const char *name)
 	if (!parentname)
 		return errno;
 
-	parent = read_node(conn, ctx, parentname);
+	parent = read_node(conn, ctx, parentname, false);
 	if (!parent)
 		return read_node_can_propagate_errno() ? errno : EINVAL;
 
@@ -1725,7 +1731,7 @@ static int do_rm(const void *ctx, struct connection *conn,
 	char *parentname;
 
 	node = get_node_canonicalized(conn, ctx, onearg(in), &name,
-				      XS_PERM_WRITE);
+				      XS_PERM_WRITE, false);
 	if (!node) {
 		/* Didn't exist already?  Fine, if parent exists. */
 		if (errno == ENOENT) {
@@ -1734,7 +1740,7 @@ static int do_rm(const void *ctx, struct connection *conn,
 			parentname = get_parent(ctx, name);
 			if (!parentname)
 				return errno;
-			node = read_node(conn, ctx, parentname);
+			node = read_node(conn, ctx, parentname, false);
 			if (node) {
 				send_ack(conn, XS_RM);
 				return 0;
@@ -1767,7 +1773,7 @@ static int do_get_perms(const void *ctx, struct connection *conn,
 	unsigned int len;
 	struct node_perms perms;
 
-	node = get_spec_node(conn, ctx, onearg(in), NULL, XS_PERM_READ);
+	node = get_spec_node(conn, ctx, onearg(in), NULL, XS_PERM_READ, true);
 	if (!node)
 		return errno;
 
@@ -1811,7 +1817,7 @@ static int do_set_perms(const void *ctx, struct connection *conn,
 
 	/* We must own node to do this (tools can do this too). */
 	node = get_spec_node(conn, ctx, in->buffer, &name,
-			     XS_PERM_WRITE | XS_PERM_OWNER);
+			     XS_PERM_WRITE | XS_PERM_OWNER, false);
 	if (!node)
 		return errno;
 
@@ -1933,7 +1939,7 @@ int walk_node_tree(const void *ctx, struct connection *conn, const char *root,
 			parent = node;
 		}
 		/* Read next node (root node or next child). */
-		node = read_node(conn, tmpctx, name);
+		node = read_node(conn, tmpctx, name, false);
 		if (!node) {
 			/* Child not found - should not happen! */
 			/* ENOENT case can be handled by supplied function. */
@@ -2483,7 +2489,7 @@ int check_store_path(const char *name, struct check_store_data *data)
 {
 	struct node *node;
 
-	node = read_node(NULL, NULL, name);
+	node = read_node(NULL, NULL, name, false);
 	if (!node) {
 		log("check_store: error %d reading special node '%s'", errno,
 		    name);
@@ -3245,7 +3251,7 @@ static int dump_state_special_node(FILE *fp, const void *ctx,
 	struct node *node;
 	int ret;
 
-	node = read_node(NULL, ctx, name);
+	node = read_node(NULL, ctx, name, true);
 	if (!node)
 		return dump_state_node_err(data, "Dump node read node error");
 
@@ -3447,7 +3453,7 @@ void read_state_node(const void *ctx, const void *state)
 		parentname = get_parent(node, name);
 		if (!parentname)
 			barf("allocation error restoring node");
-		parent = read_node(NULL, node, parentname);
+		parent = read_node(NULL, node, parentname, false);
 		if (!parent)
 			barf("read parent error restoring node");
 
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 79b2a699fd..a4cd3e503a 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -280,7 +280,7 @@ int write_node_raw(struct connection *conn, const char *db_name,
 
 /* Get a node from the data base. */
 struct node *read_node(struct connection *conn, const void *ctx,
-		       const char *name);
+		       const char *name, bool nocopy);
 
 /* Remove a node and its children. */
 int rm_node(struct connection *conn, const void *ctx, const char *name);
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 4d66dc91ce..b8fd7469d0 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -568,7 +568,7 @@ static void fire_special_watches(const char *name)
 	if (!ctx)
 		return;
 
-	node = read_node(NULL, ctx, name);
+	node = read_node(NULL, ctx, name, true);
 
 	if (node)
 		fire_watches(NULL, ctx, name, node, true, NULL);
diff --git a/tools/xenstore/xenstored_watch.c b/tools/xenstore/xenstored_watch.c
index 10645f762d..54a9468090 100644
--- a/tools/xenstore/xenstored_watch.c
+++ b/tools/xenstore/xenstored_watch.c
@@ -88,7 +88,7 @@ static bool watch_permitted(struct connection *conn, const void *ctx,
 	}
 
 	if (!node) {
-		node = read_node(conn, ctx, name);
+		node = read_node(conn, ctx, name, true);
 		if (!node)
 			return false;
 	}
@@ -103,7 +103,7 @@ static bool watch_permitted(struct connection *conn, const void *ctx,
 		parent_name = get_parent(ctx, node->name);
 		if (!parent_name)
 			return false;
-		parent = read_node(conn, ctx, parent_name);
+		parent = read_node(conn, ctx, parent_name, true);
 		if (!parent)
 			return false;
 	}
-- 
2.35.3


