Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1044274CDF3
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 09:10:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560993.877252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIl1p-000280-Qs; Mon, 10 Jul 2023 07:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560993.877252; Mon, 10 Jul 2023 07:09:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIl1p-00021i-K2; Mon, 10 Jul 2023 07:09:49 +0000
Received: by outflank-mailman (input) for mailman id 560993;
 Mon, 10 Jul 2023 07:09:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xcmr=C4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qIkte-0002xd-1M
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 07:01:22 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92f97648-1eef-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 09:01:20 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9A30D1F747;
 Mon, 10 Jul 2023 07:01:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 70D2D1361C;
 Mon, 10 Jul 2023 07:01:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id x54CGsCsq2RcYwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 10 Jul 2023 07:01:20 +0000
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
X-Inumbo-ID: 92f97648-1eef-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688972480; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WtP2Hvcsee1BM5wHnt6iDRDNOfzjthZIJA5g4uTEXwA=;
	b=gVkW1LejfaGi0WjC/p5Rk+dFanCqsWn8urSWKbp5Bg8l6768qjVvSt+8IyUgFE36IUjsIe
	ffpyBQlBN8Qp98Kopy1BOXhJKrWRCjt7TDEEWdkUOp7yZAQ3ZU/6IQzht+gF7FNdZ6m0+p
	d7f2rpN1XBml1SXnDnKvdf0lKgUnB5A=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 16/18] tools/xenstore: don't use struct node_perms in struct node
Date: Mon, 10 Jul 2023 08:59:45 +0200
Message-Id: <20230710065947.4201-17-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230710065947.4201-1-jgross@suse.com>
References: <20230710065947.4201-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Open code struct node_perms in struct node in order to prepare using
struct node_hdr in struct node.

Add two helpers to transfer permissions between struct node and struct
node_perms.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 tools/xenstore/xenstored_core.c        | 78 ++++++++++++++------------
 tools/xenstore/xenstored_core.h        | 21 ++++++-
 tools/xenstore/xenstored_domain.c      | 13 ++---
 tools/xenstore/xenstored_transaction.c |  8 +--
 tools/xenstore/xenstored_watch.c       |  7 ++-
 5 files changed, 76 insertions(+), 51 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index d886d66dd6..9f0e56a149 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -735,7 +735,7 @@ struct node *read_node(struct connection *conn, const void *ctx,
 
 	/* Datalen, childlen, number of permissions */
 	node->generation = hdr->generation;
-	node->perms.num = hdr->num_perms;
+	node->num_perms = hdr->num_perms;
 	node->datalen = hdr->datalen;
 	node->childlen = hdr->childlen;
 	node->acc.domid = perms_from_node_hdr(hdr)->id;
@@ -743,12 +743,12 @@ struct node *read_node(struct connection *conn, const void *ctx,
 
 	/* Copy node data to new memory area, starting with permissions. */
 	size -= sizeof(*hdr);
-	node->perms.p = talloc_size(node, size);
-	if (node->perms.p == NULL) {
+	node->perms = talloc_size(node, size);
+	if (node->perms == NULL) {
 		errno = ENOMEM;
 		goto error;
 	}
-	memcpy(node->perms.p, perms_from_node_hdr(hdr), size);
+	memcpy(node->perms, perms_from_node_hdr(hdr), size);
 
 	/* Permissions are struct xs_permissions. */
 	if (domain_adjust_node_perms(node))
@@ -759,7 +759,7 @@ struct node *read_node(struct connection *conn, const void *ctx,
 		node->acc.memory = 0;
 
 	/* Data is binary blob (usually ascii, no nul). */
-	node->data = node->perms.p + hdr->num_perms;
+	node->data = node->perms + hdr->num_perms;
 	/* Children is strings, nul separated. */
 	node->children = node->data + node->datalen;
 
@@ -798,7 +798,7 @@ int write_node_raw(struct connection *conn, const char *db_name,
 		return errno;
 
 	size = sizeof(*hdr)
-		+ node->perms.num * sizeof(node->perms.p[0])
+		+ node->num_perms * sizeof(node->perms[0])
 		+ node->datalen + node->childlen;
 
 	/* Call domain_max_chk() in any case in order to record max values. */
@@ -815,13 +815,13 @@ int write_node_raw(struct connection *conn, const char *db_name,
 
 	hdr = data;
 	hdr->generation = node->generation;
-	hdr->num_perms = node->perms.num;
+	hdr->num_perms = node->num_perms;
 	hdr->datalen = node->datalen;
 	hdr->childlen = node->childlen;
 
 	p = perms_from_node_hdr(hdr);
-	memcpy(p, node->perms.p, node->perms.num * sizeof(*node->perms.p));
-	p += node->perms.num * sizeof(*node->perms.p);
+	memcpy(p, node->perms, node->num_perms * sizeof(*node->perms));
+	p += node->num_perms * sizeof(*node->perms);
 	memcpy(p, node->data, node->datalen);
 	p += node->datalen;
 	memcpy(p, node->children, node->childlen);
@@ -902,6 +902,7 @@ static int ask_parents(struct connection *conn, const void *ctx,
 		       const char *name, unsigned int *perm)
 {
 	struct node *node;
+	struct node_perms perms;
 
 	do {
 		name = get_parent(ctx, name);
@@ -921,7 +922,8 @@ static int ask_parents(struct connection *conn, const void *ctx,
 		return 0;
 	}
 
-	*perm = perm_for_conn(conn, &node->perms);
+	node_to_node_perms(node, &perms);
+	*perm = perm_for_conn(conn, &perms);
 	return 0;
 }
 
@@ -958,11 +960,13 @@ static struct node *get_node(struct connection *conn,
 			     unsigned int perm)
 {
 	struct node *node;
+	struct node_perms perms;
 
 	node = read_node(conn, ctx, name);
 	/* If we don't have permission, we don't have node. */
 	if (node) {
-		if ((perm_for_conn(conn, &node->perms) & perm) != perm) {
+		node_to_node_perms(node, &perms);
+		if ((perm_for_conn(conn, &perms) & perm) != perm) {
 			errno = EACCES;
 			node = NULL;
 		}
@@ -1432,14 +1436,14 @@ static struct node *construct_node(struct connection *conn, const void *ctx,
 		node->name = talloc_steal(node, names[levels - 1]);
 
 		/* Inherit permissions, unpriv domains own what they create. */
-		node->perms.num = parent->perms.num;
-		node->perms.p = talloc_memdup(node, parent->perms.p,
-					      node->perms.num *
-					      sizeof(*node->perms.p));
-		if (!node->perms.p)
+		node->num_perms = parent->num_perms;
+		node->perms = talloc_memdup(node, parent->perms,
+					    node->num_perms *
+					    sizeof(*node->perms));
+		if (!node->perms)
 			goto nomem;
 		if (domain_is_unprivileged(conn))
-			node->perms.p[0].id = conn->id;
+			node->perms[0].id = conn->id;
 
 		/* No children, no data */
 		node->children = node->data = NULL;
@@ -1762,12 +1766,14 @@ static int do_get_perms(const void *ctx, struct connection *conn,
 	struct node *node;
 	char *strings;
 	unsigned int len;
+	struct node_perms perms;
 
 	node = get_spec_node(conn, ctx, onearg(in), NULL, XS_PERM_READ);
 	if (!node)
 		return errno;
 
-	strings = perms_to_strings(node, &node->perms, &len);
+	node_to_node_perms(node, &perms);
+	strings = perms_to_strings(node, &perms, &len);
 	if (!strings)
 		return errno;
 
@@ -1815,10 +1821,10 @@ static int do_set_perms(const void *ctx, struct connection *conn,
 	    perms.p[0].id != get_node_owner(node))
 		return EPERM;
 
-	old_perms = node->perms;
+	node_to_node_perms(node, &old_perms);
 	if (domain_nbentry_dec(conn, get_node_owner(node)))
 		return ENOMEM;
-	node->perms = perms;
+	node_perms_to_node(&perms, node);
 	if (domain_nbentry_inc(conn, get_node_owner(node)))
 		return ENOMEM;
 
@@ -2330,8 +2336,8 @@ static void manual_node(const char *name, const char *child)
 		barf_perror("Could not allocate initial node %s", name);
 
 	node->name = name;
-	node->perms.p = &perms;
-	node->perms.num = 1;
+	node->perms = &perms;
+	node->num_perms = 1;
 	node->children = (char *)child;
 	if (child)
 		node->childlen = strlen(child) + 1;
@@ -3202,10 +3208,10 @@ static int dump_state_node(const void *ctx, struct connection *conn,
 	sn.conn_id = 0;
 	sn.ta_id = 0;
 	sn.ta_access = 0;
-	sn.perm_n = node->perms.num;
+	sn.perm_n = node->num_perms;
 	sn.path_len = pathlen;
 	sn.data_len = node->datalen;
-	head.length += node->perms.num * sizeof(*sn.perms);
+	head.length += node->num_perms * sizeof(*sn.perms);
 	head.length += pathlen;
 	head.length += node->datalen;
 	head.length = ROUNDUP(head.length, 3);
@@ -3215,7 +3221,7 @@ static int dump_state_node(const void *ctx, struct connection *conn,
 	if (fwrite(&sn, sizeof(sn), 1, fp) != 1)
 		return dump_state_node_err(data, "Dump node state error");
 
-	ret = dump_state_node_perms(fp, node->perms.p, node->perms.num);
+	ret = dump_state_node_perms(fp, node->perms, node->num_perms);
 	if (ret)
 		return dump_state_node_err(data, ret);
 
@@ -3412,29 +3418,29 @@ void read_state_node(const void *ctx, const void *state)
 	node->data = name + sn->path_len;
 	node->childlen = 0;
 	node->children = NULL;
-	node->perms.num = sn->perm_n;
-	node->perms.p = talloc_array(node, struct xs_permissions,
-				     node->perms.num);
-	if (!node->perms.p)
+	node->num_perms = sn->perm_n;
+	node->perms = talloc_array(node, struct xs_permissions,
+				   node->num_perms);
+	if (!node->perms)
 		barf("allocation error restoring node");
-	for (i = 0; i < node->perms.num; i++) {
+	for (i = 0; i < node->num_perms; i++) {
 		switch (sn->perms[i].access) {
 		case 'r':
-			node->perms.p[i].perms = XS_PERM_READ;
+			node->perms[i].perms = XS_PERM_READ;
 			break;
 		case 'w':
-			node->perms.p[i].perms = XS_PERM_WRITE;
+			node->perms[i].perms = XS_PERM_WRITE;
 			break;
 		case 'b':
-			node->perms.p[i].perms = XS_PERM_READ | XS_PERM_WRITE;
+			node->perms[i].perms = XS_PERM_READ | XS_PERM_WRITE;
 			break;
 		default:
-			node->perms.p[i].perms = XS_PERM_NONE;
+			node->perms[i].perms = XS_PERM_NONE;
 			break;
 		}
 		if (sn->perms[i].flags & XS_STATE_NODE_PERM_IGNORE)
-			node->perms.p[i].perms |= XS_PERM_IGNORE;
-		node->perms.p[i].id = sn->perms[i].domid;
+			node->perms[i].perms |= XS_PERM_IGNORE;
+		node->perms[i].id = sn->perms[i].domid;
 	}
 
 	if (!strstarts(name, "@")) {
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 968b6f843c..c706d30b63 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -209,7 +209,8 @@ struct node {
 #define NO_GENERATION ~((uint64_t)0)
 
 	/* Permissions. */
-	struct node_perms perms;
+	unsigned int num_perms;
+	struct xs_permissions *perms;
 
 	/* Contents. */
 	unsigned int datalen;
@@ -250,7 +251,23 @@ unsigned int perm_for_conn(struct connection *conn,
 /* Get owner of a node. */
 static inline unsigned int get_node_owner(const struct node *node)
 {
-	return node->perms.p[0].id;
+	return node->perms[0].id;
+}
+
+/* Transfer permissions from node to struct node_perms. */
+static inline void node_to_node_perms(const struct node *node,
+				      struct node_perms *perms)
+{
+	perms->num = node->num_perms;
+	perms->p = node->perms;
+}
+
+/* Transfer permissions from struct node_perms to node. */
+static inline void node_perms_to_node(const struct node_perms *perms,
+				      struct node *node)
+{
+	node->num_perms = perms->num;
+	node->perms = perms->p;
 }
 
 /* Write a node to the data base. */
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index d8810fa353..b17402fe11 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -513,12 +513,12 @@ static int domain_tree_remove_sub(const void *ctx, struct connection *conn,
 	struct domain *domain = arg;
 	int ret = WALK_TREE_OK;
 
-	if (node->perms.p[0].id != domain->domid)
+	if (node->perms[0].id != domain->domid)
 		return WALK_TREE_OK;
 
 	if (keep_orphans) {
 		domain_nbentry_dec(NULL, domain->domid);
-		node->perms.p[0].id = priv_domid;
+		node->perms[0].id = priv_domid;
 		node->acc.memory = 0;
 		domain_nbentry_inc(NULL, priv_domid);
 		if (write_node_raw(NULL, node->name, node, NODE_MODIFY, true)) {
@@ -1335,12 +1335,11 @@ int domain_adjust_node_perms(struct node *node)
 {
 	unsigned int i;
 
-	for (i = 1; i < node->perms.num; i++) {
-		if (node->perms.p[i].perms & XS_PERM_IGNORE)
+	for (i = 1; i < node->num_perms; i++) {
+		if (node->perms[i].perms & XS_PERM_IGNORE)
 			continue;
-		if (!chk_domain_generation(node->perms.p[i].id,
-					   node->generation))
-			node->perms.p[i].perms |= XS_PERM_IGNORE;
+		if (!chk_domain_generation(node->perms[i].id, node->generation))
+			node->perms[i].perms |= XS_PERM_IGNORE;
 	}
 
 	return 0;
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index 77c14f4c24..e39df3a82d 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -259,13 +259,13 @@ int access_node(struct connection *conn, struct node *node,
 		if (!i->trans_name)
 			goto nomem;
 		i->node = strchr(i->trans_name, '/') + 1;
-		if (node->generation != NO_GENERATION && node->perms.num) {
+		if (node->generation != NO_GENERATION && node->num_perms) {
 			i->perms.p = talloc_array(i, struct xs_permissions,
-						  node->perms.num);
+						  node->num_perms);
 			if (!i->perms.p)
 				goto nomem;
-			i->perms.num = node->perms.num;
-			memcpy(i->perms.p, node->perms.p,
+			i->perms.num = node->num_perms;
+			memcpy(i->perms.p, node->perms,
 			       i->perms.num * sizeof(*i->perms.p));
 		}
 
diff --git a/tools/xenstore/xenstored_watch.c b/tools/xenstore/xenstored_watch.c
index 4195c59e17..10645f762d 100644
--- a/tools/xenstore/xenstored_watch.c
+++ b/tools/xenstore/xenstored_watch.c
@@ -79,6 +79,7 @@ static bool watch_permitted(struct connection *conn, const void *ctx,
 	unsigned int perm;
 	struct node *parent;
 	char *parent_name;
+	struct node_perms node_perms;
 
 	if (perms) {
 		perm = perm_for_conn(conn, perms);
@@ -92,7 +93,8 @@ static bool watch_permitted(struct connection *conn, const void *ctx,
 			return false;
 	}
 
-	perm = perm_for_conn(conn, &node->perms);
+	node_to_node_perms(node, &node_perms);
+	perm = perm_for_conn(conn, &node_perms);
 	if (perm & XS_PERM_READ)
 		return true;
 
@@ -106,7 +108,8 @@ static bool watch_permitted(struct connection *conn, const void *ctx,
 			return false;
 	}
 
-	perm = perm_for_conn(conn, &parent->perms);
+	node_to_node_perms(parent, &node_perms);
+	perm = perm_for_conn(conn, &node_perms);
 
 	return perm & XS_PERM_READ;
 }
-- 
2.35.3


