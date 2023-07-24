Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C84B075F482
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 13:08:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568773.888791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtQJ-0002oR-Mh; Mon, 24 Jul 2023 11:08:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568773.888791; Mon, 24 Jul 2023 11:08:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtQJ-0002ba-7m; Mon, 24 Jul 2023 11:08:19 +0000
Received: by outflank-mailman (input) for mailman id 568773;
 Mon, 24 Jul 2023 11:08:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVkC=DK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qNtNC-0000KR-6f
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 11:05:06 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1ce6737-2a11-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 13:05:05 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 648F820698;
 Mon, 24 Jul 2023 11:05:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 329F613476;
 Mon, 24 Jul 2023 11:05:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eiHwCuFavmSSYgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 24 Jul 2023 11:05:05 +0000
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
X-Inumbo-ID: f1ce6737-2a11-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690196705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q9VQYVzWF+hzExhRy+1hXjgi0IQDCM4dRNBtJbobDzo=;
	b=WY7uqR9cSk04kvTpBVpiHW4mxeMmeADXxXA9URdgoksfu5hTrCO9jHjqmHHbVB8qUIswzy
	JsgIGRF0owIAEv4dXc9Jw3pJcNG5M9JIXFabwzuZcyPqu4UqDGNgM1m5JoFU/WCn+HIx3q
	Oj/EvucfWQTQZ+1yt2lXJz/RfGx/Luc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 24/25] tools/xenstore: rework get_node()
Date: Mon, 24 Jul 2023 13:02:46 +0200
Message-Id: <20230724110247.10520-25-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230724110247.10520-1-jgross@suse.com>
References: <20230724110247.10520-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today get_node_canonicalized() is the only caller of get_node().

In order to prepare introducing a get_node() variant returning a
pointer to const struct node, do the following restructuring:

- move the call of read_node() from get_node() into
  get_node_canonicalized()

- rename get_node() to get_node_chk_perm()

- rename get_node_canonicalized() to get_node()

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 tools/xenstore/xenstored_core.c | 57 +++++++++++++++------------------
 1 file changed, 25 insertions(+), 32 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index ec20bc042d..fa07bc0c31 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -996,27 +996,26 @@ static int errno_from_parents(struct connection *conn, const void *ctx,
  * If it fails, returns NULL and sets errno.
  * Temporary memory allocations are done with ctx.
  */
-static struct node *get_node(struct connection *conn,
-			     const void *ctx,
-			     const char *name,
-			     unsigned int perm)
+static bool get_node_chk_perm(struct connection *conn, const void *ctx,
+			      const struct node *node, const char *name,
+			      unsigned int perm)
 {
-	struct node *node;
 	struct node_perms perms;
+	bool err = false;
 
-	node = read_node(conn, ctx, name);
 	/* If we don't have permission, we don't have node. */
 	if (node) {
 		node_to_node_perms(node, &perms);
 		if ((perm_for_conn(conn, &perms) & perm) != perm) {
 			errno = EACCES;
-			node = NULL;
+			err = true;
 		}
 	}
 	/* Clean up errno if they weren't supposed to know. */
-	if (!node && !read_node_can_propagate_errno())
+	if (err && !read_node_can_propagate_errno())
 		errno = errno_from_parents(conn, ctx, name, errno, perm);
-	return node;
+
+	return err;
 }
 
 static struct buffered_data *new_buffer(void *ctx)
@@ -1285,14 +1284,12 @@ const char *canonicalize(struct connection *conn, const void *ctx,
 	return name;
 }
 
-static struct node *get_node_canonicalized(struct connection *conn,
-					   const void *ctx,
-					   const char *name,
-					   const char **canonical_name,
-					   unsigned int perm,
-					   bool allow_special)
+static struct node *get_node(struct connection *conn, const void *ctx,
+			     const char *name, const char **canonical_name,
+			     unsigned int perm, bool allow_special)
 {
 	const char *tmp_name;
+	struct node *node;
 
 	if (!canonical_name)
 		canonical_name = &tmp_name;
@@ -1300,7 +1297,10 @@ static struct node *get_node_canonicalized(struct connection *conn,
 	if (!*canonical_name)
 		return NULL;
 
-	return get_node(conn, ctx, *canonical_name, perm);
+	node = read_node(conn, ctx, *canonical_name);
+
+	return get_node_chk_perm(conn, ctx, node, *canonical_name, perm)
+	       ? NULL : node;
 }
 
 static int send_directory(const void *ctx, struct connection *conn,
@@ -1308,8 +1308,7 @@ static int send_directory(const void *ctx, struct connection *conn,
 {
 	struct node *node;
 
-	node = get_node_canonicalized(conn, ctx, onearg(in), NULL,
-				      XS_PERM_READ, false);
+	node = get_node(conn, ctx, onearg(in), NULL, XS_PERM_READ, false);
 	if (!node)
 		return errno;
 
@@ -1330,8 +1329,7 @@ static int send_directory_part(const void *ctx, struct connection *conn,
 		return EINVAL;
 
 	/* First arg is node name. */
-	node = get_node_canonicalized(conn, ctx, in->buffer, NULL,
-				      XS_PERM_READ, false);
+	node = get_node(conn, ctx, in->buffer, NULL, XS_PERM_READ, false);
 	if (!node)
 		return errno;
 
@@ -1380,8 +1378,7 @@ static int do_read(const void *ctx, struct connection *conn,
 {
 	struct node *node;
 
-	node = get_node_canonicalized(conn, ctx, onearg(in), NULL,
-				      XS_PERM_READ, false);
+	node = get_node(conn, ctx, onearg(in), NULL, XS_PERM_READ, false);
 	if (!node)
 		return errno;
 
@@ -1595,8 +1592,7 @@ static int do_write(const void *ctx, struct connection *conn,
 	offset = strlen(vec[0]) + 1;
 	datalen = in->used - offset;
 
-	node = get_node_canonicalized(conn, ctx, vec[0], &name, XS_PERM_WRITE,
-				      false);
+	node = get_node(conn, ctx, vec[0], &name, XS_PERM_WRITE, false);
 	if (!node) {
 		/* No permissions, invalid input? */
 		if (errno != ENOENT)
@@ -1624,8 +1620,7 @@ static int do_mkdir(const void *ctx, struct connection *conn,
 	struct node *node;
 	const char *name;
 
-	node = get_node_canonicalized(conn, ctx, onearg(in), &name,
-				      XS_PERM_WRITE, false);
+	node = get_node(conn, ctx, onearg(in), &name, XS_PERM_WRITE, false);
 
 	/* If it already exists, fine. */
 	if (!node) {
@@ -1754,8 +1749,7 @@ static int do_rm(const void *ctx, struct connection *conn,
 	const char *name;
 	char *parentname;
 
-	node = get_node_canonicalized(conn, ctx, onearg(in), &name,
-				      XS_PERM_WRITE, false);
+	node = get_node(conn, ctx, onearg(in), &name, XS_PERM_WRITE, false);
 	if (!node) {
 		/* Didn't exist already?  Fine, if parent exists. */
 		if (errno == ENOENT) {
@@ -1797,8 +1791,7 @@ static int do_get_perms(const void *ctx, struct connection *conn,
 	unsigned int len;
 	struct node_perms perms;
 
-	node = get_node_canonicalized(conn, ctx, onearg(in), NULL, XS_PERM_READ,
-				      true);
+	node = get_node(conn, ctx, onearg(in), NULL, XS_PERM_READ, true);
 	if (!node)
 		return errno;
 
@@ -1842,8 +1835,8 @@ static int do_set_perms(const void *ctx, struct connection *conn,
 		return ENOENT;
 
 	/* We must own node to do this (tools can do this too). */
-	node = get_node_canonicalized(conn, ctx, in->buffer, &name,
-				      XS_PERM_WRITE | XS_PERM_OWNER, true);
+	node = get_node(conn, ctx, in->buffer, &name,
+			XS_PERM_WRITE | XS_PERM_OWNER, true);
 	if (!node)
 		return errno;
 
-- 
2.35.3


