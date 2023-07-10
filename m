Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD7E74CDF1
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 09:09:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560987.877234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIl1o-0001mY-Ky; Mon, 10 Jul 2023 07:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560987.877234; Mon, 10 Jul 2023 07:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIl1o-0001jp-GO; Mon, 10 Jul 2023 07:09:48 +0000
Received: by outflank-mailman (input) for mailman id 560987;
 Mon, 10 Jul 2023 07:09:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xcmr=C4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qIktj-0002xd-Dj
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 07:01:27 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 964fa27c-1eef-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 09:01:26 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 39A6A1F38D;
 Mon, 10 Jul 2023 07:01:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 08D201361C;
 Mon, 10 Jul 2023 07:01:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /abeAMasq2RqYwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 10 Jul 2023 07:01:26 +0000
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
X-Inumbo-ID: 964fa27c-1eef-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688972486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oJsbcuHqSaGcFxvtX6uJ+xBRX6S90Qjkd1Nn8k3REng=;
	b=iyzKqaCpi6cQsXUB1OgL0Rq1Ksvd/n/9Atg9gaA2+P3cXF1i+6fcchLvVyt8I3cgz2O3N/
	MiqUzetzlNiO1ImY/SUiD/KAmU84EqmVy+7y0suK/YuCaX4BT8aIc/TCcvxFo700nsrSjP
	ObYkLnff1E1hNUkl4dyV07u3800hpFw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 17/18] tools/xenstore: use struct node_hdr in struct node
Date: Mon, 10 Jul 2023 08:59:46 +0200
Message-Id: <20230710065947.4201-18-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230710065947.4201-1-jgross@suse.com>
References: <20230710065947.4201-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace some individual fields in struct node with struct node_hdr.

This allows to add a helper for calculating the accounted memory size
of a node.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 tools/xenstore/xenstored_core.c        | 108 ++++++++++++-------------
 tools/xenstore/xenstored_core.h        |  16 ++--
 tools/xenstore/xenstored_domain.c      |   5 +-
 tools/xenstore/xenstored_transaction.c |  13 +--
 4 files changed, 71 insertions(+), 71 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 9f0e56a149..7495747d76 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -555,6 +555,12 @@ static void initialize_fds(int *p_sock_pollfd_idx, int *ptimeout)
 	}
 }
 
+static size_t calc_node_acc_size(struct node_hdr *hdr)
+{
+	return sizeof(*hdr) + hdr->num_perms * sizeof(struct xs_permissions) +
+	       hdr->datalen + hdr->childlen;
+}
+
 struct node_hdr *db_fetch(const char *db_name, size_t *size)
 {
 	struct node_hdr *hdr;
@@ -565,8 +571,7 @@ struct node_hdr *db_fetch(const char *db_name, size_t *size)
 		return NULL;
 	}
 
-	*size = sizeof(*hdr) + hdr->num_perms * sizeof(struct xs_permissions) +
-		hdr->datalen + hdr->childlen;
+	*size = calc_node_acc_size(hdr);
 
 	trace_tdb("read %s size %zu\n", db_name, *size + strlen(db_name));
 
@@ -725,7 +730,7 @@ struct node *read_node(struct connection *conn, const void *ctx,
 	hdr = db_fetch(db_name, &size);
 
 	if (hdr == NULL) {
-		node->generation = NO_GENERATION;
+		node->hdr.generation = NO_GENERATION;
 		err = access_node(conn, node, NODE_ACCESS_READ, NULL);
 		errno = err ? : ENOENT;
 		goto error;
@@ -734,10 +739,7 @@ struct node *read_node(struct connection *conn, const void *ctx,
 	node->parent = NULL;
 
 	/* Datalen, childlen, number of permissions */
-	node->generation = hdr->generation;
-	node->num_perms = hdr->num_perms;
-	node->datalen = hdr->datalen;
-	node->childlen = hdr->childlen;
+	node->hdr = *hdr;
 	node->acc.domid = perms_from_node_hdr(hdr)->id;
 	node->acc.memory = size;
 
@@ -761,7 +763,7 @@ struct node *read_node(struct connection *conn, const void *ctx,
 	/* Data is binary blob (usually ascii, no nul). */
 	node->data = node->perms + hdr->num_perms;
 	/* Children is strings, nul separated. */
-	node->children = node->data + node->datalen;
+	node->children = node->data + node->hdr.datalen;
 
 	if (access_node(conn, node, NODE_ACCESS_READ, NULL))
 		goto error;
@@ -797,9 +799,7 @@ int write_node_raw(struct connection *conn, const char *db_name,
 	if (domain_adjust_node_perms(node))
 		return errno;
 
-	size = sizeof(*hdr)
-		+ node->num_perms * sizeof(node->perms[0])
-		+ node->datalen + node->childlen;
+	size = calc_node_acc_size(&node->hdr);
 
 	/* Call domain_max_chk() in any case in order to record max values. */
 	if (domain_max_chk(conn, ACC_NODESZ, size) && !no_quota_check) {
@@ -814,17 +814,14 @@ int write_node_raw(struct connection *conn, const char *db_name,
 	}
 
 	hdr = data;
-	hdr->generation = node->generation;
-	hdr->num_perms = node->num_perms;
-	hdr->datalen = node->datalen;
-	hdr->childlen = node->childlen;
+	*hdr = node->hdr;
 
 	p = perms_from_node_hdr(hdr);
-	memcpy(p, node->perms, node->num_perms * sizeof(*node->perms));
-	p += node->num_perms * sizeof(*node->perms);
-	memcpy(p, node->data, node->datalen);
-	p += node->datalen;
-	memcpy(p, node->children, node->childlen);
+	memcpy(p, node->perms, node->hdr.num_perms * sizeof(*node->perms));
+	p += node->hdr.num_perms * sizeof(*node->perms);
+	memcpy(p, node->data, node->hdr.datalen);
+	p += node->hdr.datalen;
+	memcpy(p, node->children, node->hdr.childlen);
 
 	if (db_write(conn, db_name, data, size, &node->acc, mode,
 		     no_quota_check))
@@ -1287,7 +1284,7 @@ static int send_directory(const void *ctx, struct connection *conn,
 	if (!node)
 		return errno;
 
-	send_reply(conn, XS_DIRECTORY, node->children, node->childlen);
+	send_reply(conn, XS_DIRECTORY, node->children, node->hdr.childlen);
 
 	return 0;
 }
@@ -1312,10 +1309,11 @@ static int send_directory_part(const void *ctx, struct connection *conn,
 	/* Second arg is childlist offset. */
 	off = atoi(in->buffer + strlen(in->buffer) + 1);
 
-	genlen = snprintf(gen, sizeof(gen), "%"PRIu64, node->generation) + 1;
+	genlen = snprintf(gen, sizeof(gen), "%"PRIu64, node->hdr.generation) +
+		 1;
 
 	/* Offset behind list: just return a list with an empty string. */
-	if (off >= node->childlen) {
+	if (off >= node->hdr.childlen) {
 		gen[genlen] = 0;
 		send_reply(conn, XS_DIRECTORY_PART, gen, genlen + 1);
 		return 0;
@@ -1328,7 +1326,7 @@ static int send_directory_part(const void *ctx, struct connection *conn,
 	while (len + strlen(child) < maxlen) {
 		len += strlen(child) + 1;
 		child += strlen(child) + 1;
-		if (off + len == node->childlen)
+		if (off + len == node->hdr.childlen)
 			break;
 	}
 
@@ -1338,7 +1336,7 @@ static int send_directory_part(const void *ctx, struct connection *conn,
 
 	memcpy(data, gen, genlen);
 	memcpy(data + genlen, node->children + off, len);
-	if (off + len == node->childlen) {
+	if (off + len == node->hdr.childlen) {
 		data[genlen + len] = 0;
 		len++;
 	}
@@ -1358,7 +1356,7 @@ static int do_read(const void *ctx, struct connection *conn,
 	if (!node)
 		return errno;
 
-	send_reply(conn, XS_READ, node->data, node->datalen);
+	send_reply(conn, XS_READ, node->data, node->hdr.datalen);
 
 	return 0;
 }
@@ -1377,13 +1375,13 @@ static int add_child(const void *ctx, struct node *parent, const char *name)
 
 	base = basename(name);
 	baselen = strlen(base) + 1;
-	children = talloc_array(ctx, char, parent->childlen + baselen);
+	children = talloc_array(ctx, char, parent->hdr.childlen + baselen);
 	if (!children)
 		return ENOMEM;
-	memcpy(children, parent->children, parent->childlen);
-	memcpy(children + parent->childlen, base, baselen);
+	memcpy(children, parent->children, parent->hdr.childlen);
+	memcpy(children + parent->hdr.childlen, base, baselen);
 	parent->children = children;
-	parent->childlen += baselen;
+	parent->hdr.childlen += baselen;
 
 	return 0;
 }
@@ -1436,9 +1434,9 @@ static struct node *construct_node(struct connection *conn, const void *ctx,
 		node->name = talloc_steal(node, names[levels - 1]);
 
 		/* Inherit permissions, unpriv domains own what they create. */
-		node->num_perms = parent->num_perms;
+		node->hdr.num_perms = parent->hdr.num_perms;
 		node->perms = talloc_memdup(node, parent->perms,
-					    node->num_perms *
+					    node->hdr.num_perms *
 					    sizeof(*node->perms));
 		if (!node->perms)
 			goto nomem;
@@ -1447,7 +1445,7 @@ static struct node *construct_node(struct connection *conn, const void *ctx,
 
 		/* No children, no data */
 		node->children = node->data = NULL;
-		node->childlen = node->datalen = 0;
+		node->hdr.childlen = node->hdr.datalen = 0;
 		node->acc.memory = 0;
 		node->parent = parent;
 
@@ -1499,7 +1497,7 @@ static struct node *create_node(struct connection *conn, const void *ctx,
 		ta_node_created(conn->transaction);
 
 	node->data = data;
-	node->datalen = datalen;
+	node->hdr.datalen = datalen;
 
 	/*
 	 * We write out the nodes bottom up.
@@ -1579,7 +1577,7 @@ static int do_write(const void *ctx, struct connection *conn,
 			return errno;
 	} else {
 		node->data = in->buffer + offset;
-		node->datalen = datalen;
+		node->hdr.datalen = datalen;
 		if (write_node(conn, node, NODE_MODIFY, false))
 			return errno;
 	}
@@ -1627,8 +1625,8 @@ static int remove_child_entry(struct connection *conn, struct node *node,
 {
 	size_t childlen = strlen(node->children + offset);
 
-	memdel(node->children, offset, childlen + 1, node->childlen);
-	node->childlen -= childlen + 1;
+	memdel(node->children, offset, childlen + 1, node->hdr.childlen);
+	node->hdr.childlen -= childlen + 1;
 
 	return write_node(conn, node, NODE_MODIFY, true);
 }
@@ -1638,8 +1636,9 @@ static int delete_child(struct connection *conn,
 {
 	unsigned int i;
 
-	for (i = 0; i < node->childlen; i += strlen(node->children+i) + 1) {
-		if (streq(node->children+i, childname)) {
+	for (i = 0; i < node->hdr.childlen;
+	     i += strlen(node->children + i) + 1) {
+		if (streq(node->children + i, childname)) {
 			errno = remove_child_entry(conn, node, i) ? EIO : 0;
 			return errno;
 		}
@@ -1907,7 +1906,7 @@ int walk_node_tree(const void *ctx, struct connection *conn, const char *root,
 		/* node == NULL possible only for the initial loop iteration. */
 		if (node) {
 			/* Go one step up if ret or if last child finished. */
-			if (ret || node->childoff >= node->childlen) {
+			if (ret || node->childoff >= node->hdr.childlen) {
 				parent = node->parent;
 				/* Call function AFTER processing a node. */
 				ret = walk_call_func(ctx, conn, node, parent,
@@ -2337,10 +2336,10 @@ static void manual_node(const char *name, const char *child)
 
 	node->name = name;
 	node->perms = &perms;
-	node->num_perms = 1;
+	node->hdr.num_perms = 1;
 	node->children = (char *)child;
 	if (child)
-		node->childlen = strlen(child) + 1;
+		node->hdr.childlen = strlen(child) + 1;
 
 	if (write_node(NULL, node, NODE_CREATE, false))
 		barf_perror("Could not create initial node %s", name);
@@ -3208,12 +3207,12 @@ static int dump_state_node(const void *ctx, struct connection *conn,
 	sn.conn_id = 0;
 	sn.ta_id = 0;
 	sn.ta_access = 0;
-	sn.perm_n = node->num_perms;
+	sn.perm_n = node->hdr.num_perms;
 	sn.path_len = pathlen;
-	sn.data_len = node->datalen;
-	head.length += node->num_perms * sizeof(*sn.perms);
+	sn.data_len = node->hdr.datalen;
+	head.length += node->hdr.num_perms * sizeof(*sn.perms);
 	head.length += pathlen;
-	head.length += node->datalen;
+	head.length += node->hdr.datalen;
 	head.length = ROUNDUP(head.length, 3);
 
 	if (fwrite(&head, sizeof(head), 1, fp) != 1)
@@ -3221,14 +3220,15 @@ static int dump_state_node(const void *ctx, struct connection *conn,
 	if (fwrite(&sn, sizeof(sn), 1, fp) != 1)
 		return dump_state_node_err(data, "Dump node state error");
 
-	ret = dump_state_node_perms(fp, node->perms, node->num_perms);
+	ret = dump_state_node_perms(fp, node->perms, node->hdr.num_perms);
 	if (ret)
 		return dump_state_node_err(data, ret);
 
 	if (fwrite(node->name, pathlen, 1, fp) != 1)
 		return dump_state_node_err(data, "Dump node path error");
 
-	if (node->datalen && fwrite(node->data, node->datalen, 1, fp) != 1)
+	if (node->hdr.datalen &&
+	    fwrite(node->data, node->hdr.datalen, 1, fp) != 1)
 		return dump_state_node_err(data, "Dump node data error");
 
 	ret = dump_state_align(fp);
@@ -3413,17 +3413,17 @@ void read_state_node(const void *ctx, const void *state)
 
 	node->acc.memory = 0;
 	node->name = name;
-	node->generation = ++generation;
-	node->datalen = sn->data_len;
+	node->hdr.generation = ++generation;
+	node->hdr.datalen = sn->data_len;
 	node->data = name + sn->path_len;
-	node->childlen = 0;
+	node->hdr.childlen = 0;
 	node->children = NULL;
-	node->num_perms = sn->perm_n;
+	node->hdr.num_perms = sn->perm_n;
 	node->perms = talloc_array(node, struct xs_permissions,
-				   node->num_perms);
+				   node->hdr.num_perms);
 	if (!node->perms)
 		barf("allocation error restoring node");
-	for (i = 0; i < node->num_perms; i++) {
+	for (i = 0; i < node->hdr.num_perms; i++) {
 		switch (sn->perms[i].access) {
 		case 'r':
 			node->perms[i].perms = XS_PERM_READ;
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index c706d30b63..79b2a699fd 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -181,6 +181,7 @@ extern struct list_head connections;
  */
 struct node_hdr {
 	uint64_t generation;
+#define NO_GENERATION ~((uint64_t)0)
 	uint16_t num_perms;
 	uint16_t datalen;
 	uint32_t childlen;
@@ -197,6 +198,10 @@ struct node_account_data {
 };
 
 struct node {
+	/* Data direct for data base. */
+	struct node_hdr hdr;
+
+	/* Xenstore path. */
 	const char *name;
 	/* Name used to access data base. */
 	const char *db_name;
@@ -204,20 +209,13 @@ struct node {
 	/* Parent (optional) */
 	struct node *parent;
 
-	/* Generation count. */
-	uint64_t generation;
-#define NO_GENERATION ~((uint64_t)0)
-
 	/* Permissions. */
-	unsigned int num_perms;
 	struct xs_permissions *perms;
 
 	/* Contents. */
-	unsigned int datalen;
 	void *data;
 
 	/* Children, each nul-terminated. */
-	unsigned int childlen;
 	unsigned int childoff;	/* Used by walk_node_tree() internally. */
 	char *children;
 
@@ -258,7 +256,7 @@ static inline unsigned int get_node_owner(const struct node *node)
 static inline void node_to_node_perms(const struct node *node,
 				      struct node_perms *perms)
 {
-	perms->num = node->num_perms;
+	perms->num = node->hdr.num_perms;
 	perms->p = node->perms;
 }
 
@@ -266,7 +264,7 @@ static inline void node_to_node_perms(const struct node *node,
 static inline void node_perms_to_node(const struct node_perms *perms,
 				      struct node *node)
 {
-	node->num_perms = perms->num;
+	node->hdr.num_perms = perms->num;
 	node->perms = perms->p;
 }
 
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index b17402fe11..4d66dc91ce 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -1335,10 +1335,11 @@ int domain_adjust_node_perms(struct node *node)
 {
 	unsigned int i;
 
-	for (i = 1; i < node->num_perms; i++) {
+	for (i = 1; i < node->hdr.num_perms; i++) {
 		if (node->perms[i].perms & XS_PERM_IGNORE)
 			continue;
-		if (!chk_domain_generation(node->perms[i].id, node->generation))
+		if (!chk_domain_generation(node->perms[i].id,
+					   node->hdr.generation))
 			node->perms[i].perms |= XS_PERM_IGNORE;
 	}
 
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstore/xenstored_transaction.c
index e39df3a82d..acea4761e7 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstore/xenstored_transaction.c
@@ -232,7 +232,7 @@ int access_node(struct connection *conn, struct node *node,
 	bool introduce = false;
 
 	if (type != NODE_ACCESS_READ) {
-		node->generation = ++generation;
+		node->hdr.generation = ++generation;
 		if (conn && !conn->transaction)
 			wrl_apply_debit_direct(conn);
 	}
@@ -259,12 +259,13 @@ int access_node(struct connection *conn, struct node *node,
 		if (!i->trans_name)
 			goto nomem;
 		i->node = strchr(i->trans_name, '/') + 1;
-		if (node->generation != NO_GENERATION && node->num_perms) {
+		if (node->hdr.generation != NO_GENERATION &&
+		    node->hdr.num_perms) {
 			i->perms.p = talloc_array(i, struct xs_permissions,
-						  node->num_perms);
+						  node->hdr.num_perms);
 			if (!i->perms.p)
 				goto nomem;
-			i->perms.num = node->num_perms;
+			i->perms.num = node->hdr.num_perms;
 			memcpy(i->perms.p, node->perms,
 			       i->perms.num * sizeof(*i->perms.p));
 		}
@@ -282,9 +283,9 @@ int access_node(struct connection *conn, struct node *node,
 		 * from the write types.
 		 */
 		if (type == NODE_ACCESS_READ) {
-			i->generation = node->generation;
+			i->generation = node->hdr.generation;
 			i->check_gen = true;
-			if (node->generation != NO_GENERATION) {
+			if (node->hdr.generation != NO_GENERATION) {
 				ret = write_node_raw(conn, i->trans_name, node,
 						     NODE_CREATE, true);
 				if (ret)
-- 
2.35.3


