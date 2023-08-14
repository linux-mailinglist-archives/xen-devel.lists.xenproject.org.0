Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAC777B327
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 10:02:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583426.913656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSWz-0006co-Ja; Mon, 14 Aug 2023 08:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583426.913656; Mon, 14 Aug 2023 08:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSWz-0006Or-BL; Mon, 14 Aug 2023 08:02:29 +0000
Received: by outflank-mailman (input) for mailman id 583426;
 Mon, 14 Aug 2023 08:02:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzbS=D7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qVSJS-0001Z5-PN
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:48:30 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f527da99-3a76-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 09:48:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C7D8021984;
 Mon, 14 Aug 2023 07:48:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 98504138EE;
 Mon, 14 Aug 2023 07:48:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KWffI0zc2WQyQgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 14 Aug 2023 07:48:28 +0000
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
X-Inumbo-ID: f527da99-3a76-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691999308; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5bnEnKl2k584I2gogO8qpBBRAlYy26bn85d9fhzAf9E=;
	b=PfvT02qon9pJ7zdNI9Ne6QjLaveWPp2svjDZf0r2F+ZoPQ7Xme2Ro5SfDZBiXjxkiUkyQ/
	HpJk1ZlAqVIUQ4hSg53QwykIVCxI4RQZ9DTAxHPhcOLq/1XZwhN2iI4XXz2rMGK9mN3xbY
	s5964k/2sLZsU17iFHX3/9/yACORJRY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 14/19] tools/xenstore: merge get_spec_node() into get_node_canonicalized()
Date: Mon, 14 Aug 2023 09:47:02 +0200
Message-Id: <20230814074707.27696-15-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230814074707.27696-1-jgross@suse.com>
References: <20230814074707.27696-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a "allow_special" parameter to get_node_canonicalized() allowing
to merge get_spec_node() into get_node_canonicalized().

Add the same parameter to is_valid_nodename(), as this will simplify
check_watch_path().

This is done in preparation to introducing a get_node() variant
returning a pointer to const struct node.

Note that this will change how special node names are going to be
validated, as now the normal restrictions for node names will be
applied:

- they can't end with "/"
- they can't contain "//"
- they can't contain characters other than the ones allowed for normal
  nodes
- the length of the node name is restricted by the max path length
  quota

For defined special node names this isn't any real restriction, though.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
V4:
- expand commit message (Julien Grall)
---
 tools/xenstore/xenstored_core.c  | 45 +++++++++++++-------------------
 tools/xenstore/xenstored_core.h  |  3 ++-
 tools/xenstore/xenstored_watch.c | 19 +++++---------
 3 files changed, 26 insertions(+), 41 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index f8e5e7b697..0ebe4bb7d2 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1219,13 +1219,14 @@ static bool valid_chars(const char *node)
 		       "0123456789-/_@") == strlen(node));
 }
 
-bool is_valid_nodename(const struct connection *conn, const char *node)
+bool is_valid_nodename(const struct connection *conn, const char *node,
+		       bool allow_special)
 {
 	int local_off = 0;
 	unsigned int domid;
 
-	/* Must start in /. */
-	if (!strstarts(node, "/"))
+	/* Must start in / or - if special nodes are allowed - in @. */
+	if (!strstarts(node, "/") && (!allow_special || !strstarts(node, "@")))
 		return false;
 
 	/* Cannot end in / (unless it's just "/"). */
@@ -1293,7 +1294,8 @@ static struct node *get_node_canonicalized(struct connection *conn,
 					   const void *ctx,
 					   const char *name,
 					   const char **canonical_name,
-					   unsigned int perm)
+					   unsigned int perm,
+					   bool allow_special)
 {
 	const char *tmp_name;
 
@@ -1302,33 +1304,20 @@ static struct node *get_node_canonicalized(struct connection *conn,
 	*canonical_name = canonicalize(conn, ctx, name);
 	if (!*canonical_name)
 		return NULL;
-	if (!is_valid_nodename(conn, *canonical_name)) {
+	if (!is_valid_nodename(conn, *canonical_name, allow_special)) {
 		errno = EINVAL;
 		return NULL;
 	}
 	return get_node(conn, ctx, *canonical_name, perm);
 }
 
-static struct node *get_spec_node(struct connection *conn, const void *ctx,
-				  const char *name, const char **canonical_name,
-				  unsigned int perm)
-{
-	if (name[0] == '@') {
-		if (canonical_name)
-			*canonical_name = name;
-		return get_node(conn, ctx, name, perm);
-	}
-
-	return get_node_canonicalized(conn, ctx, name, canonical_name, perm);
-}
-
 static int send_directory(const void *ctx, struct connection *conn,
 			  struct buffered_data *in)
 {
 	struct node *node;
 
 	node = get_node_canonicalized(conn, ctx, onearg(in), NULL,
-				      XS_PERM_READ);
+				      XS_PERM_READ, false);
 	if (!node)
 		return errno;
 
@@ -1350,7 +1339,7 @@ static int send_directory_part(const void *ctx, struct connection *conn,
 
 	/* First arg is node name. */
 	node = get_node_canonicalized(conn, ctx, in->buffer, NULL,
-				      XS_PERM_READ);
+				      XS_PERM_READ, false);
 	if (!node)
 		return errno;
 
@@ -1400,7 +1389,7 @@ static int do_read(const void *ctx, struct connection *conn,
 	struct node *node;
 
 	node = get_node_canonicalized(conn, ctx, onearg(in), NULL,
-				      XS_PERM_READ);
+				      XS_PERM_READ, false);
 	if (!node)
 		return errno;
 
@@ -1614,7 +1603,8 @@ static int do_write(const void *ctx, struct connection *conn,
 	offset = strlen(vec[0]) + 1;
 	datalen = in->used - offset;
 
-	node = get_node_canonicalized(conn, ctx, vec[0], &name, XS_PERM_WRITE);
+	node = get_node_canonicalized(conn, ctx, vec[0], &name, XS_PERM_WRITE,
+				      false);
 	if (!node) {
 		/* No permissions, invalid input? */
 		if (errno != ENOENT)
@@ -1643,7 +1633,7 @@ static int do_mkdir(const void *ctx, struct connection *conn,
 	const char *name;
 
 	node = get_node_canonicalized(conn, ctx, onearg(in), &name,
-				      XS_PERM_WRITE);
+				      XS_PERM_WRITE, false);
 
 	/* If it already exists, fine. */
 	if (!node) {
@@ -1773,7 +1763,7 @@ static int do_rm(const void *ctx, struct connection *conn,
 	char *parentname;
 
 	node = get_node_canonicalized(conn, ctx, onearg(in), &name,
-				      XS_PERM_WRITE);
+				      XS_PERM_WRITE, false);
 	if (!node) {
 		/* Didn't exist already?  Fine, if parent exists. */
 		if (errno == ENOENT) {
@@ -1814,7 +1804,8 @@ static int do_get_perms(const void *ctx, struct connection *conn,
 	char *strings;
 	unsigned int len;
 
-	node = get_spec_node(conn, ctx, onearg(in), NULL, XS_PERM_READ);
+	node = get_node_canonicalized(conn, ctx, onearg(in), NULL, XS_PERM_READ,
+				      true);
 	if (!node)
 		return errno;
 
@@ -1857,8 +1848,8 @@ static int do_set_perms(const void *ctx, struct connection *conn,
 		return ENOENT;
 
 	/* We must own node to do this (tools can do this too). */
-	node = get_spec_node(conn, ctx, in->buffer, &name,
-			     XS_PERM_WRITE | XS_PERM_OWNER);
+	node = get_node_canonicalized(conn, ctx, in->buffer, &name,
+				      XS_PERM_WRITE | XS_PERM_OWNER, true);
 	if (!node)
 		return errno;
 
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 07c59c07b7..5575cc0689 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -305,7 +305,8 @@ void check_store(void);
 void corrupt(struct connection *conn, const char *fmt, ...);
 
 /* Is this a valid node name? */
-bool is_valid_nodename(const struct connection *conn, const char *node);
+bool is_valid_nodename(const struct connection *conn, const char *node,
+		       bool allow_special);
 
 /* Get name of parent node. */
 char *get_parent(const void *ctx, const char *node);
diff --git a/tools/xenstore/xenstored_watch.c b/tools/xenstore/xenstored_watch.c
index d6e5a4be1e..e695762c64 100644
--- a/tools/xenstore/xenstored_watch.c
+++ b/tools/xenstore/xenstored_watch.c
@@ -163,19 +163,12 @@ static int destroy_watch(void *_watch)
 static int check_watch_path(struct connection *conn, const void *ctx,
 			    const char **path, bool *relative)
 {
-	/* Check if valid event. */
-	if (strstarts(*path, "@")) {
-		*relative = false;
-		if (strlen(*path) > XENSTORE_REL_PATH_MAX)
-			goto inval;
-	} else {
-		*relative = !strstarts(*path, "/");
-		*path = canonicalize(conn, ctx, *path);
-		if (!*path)
-			return errno;
-		if (!is_valid_nodename(conn, *path))
-			goto inval;
-	}
+	*relative = !strstarts(*path, "/") && !strstarts(*path, "@");
+	*path = canonicalize(conn, ctx, *path);
+	if (!*path)
+		return errno;
+	if (!is_valid_nodename(conn, *path, true))
+		goto inval;
 
 	return 0;
 
-- 
2.35.3


