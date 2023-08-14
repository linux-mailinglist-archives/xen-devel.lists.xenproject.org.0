Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D44D77B319
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:57:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583372.913595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSS4-0002Mv-DC; Mon, 14 Aug 2023 07:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583372.913595; Mon, 14 Aug 2023 07:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSS4-0002Eh-8w; Mon, 14 Aug 2023 07:57:24 +0000
Received: by outflank-mailman (input) for mailman id 583372;
 Mon, 14 Aug 2023 07:57:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzbS=D7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qVSJX-0002SK-5Y
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:48:35 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8815513-3a76-11ee-b288-6b7b168915f2;
 Mon, 14 Aug 2023 09:48:34 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 622541FD5F;
 Mon, 14 Aug 2023 07:48:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 355B6138EE;
 Mon, 14 Aug 2023 07:48:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZwO4C1Lc2WQ6QgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 14 Aug 2023 07:48:34 +0000
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
X-Inumbo-ID: f8815513-3a76-11ee-b288-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691999314; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=67GuzleUBnIFGrFUii49tc7ebqaTcMaYS5ADc4ipvx4=;
	b=MTN04PxQKkPNKbFaPehj6eoFGjLw+8TRWcTB3j6RmH1NdmoUAiv6/xvfpoLBJgBH8JXtAJ
	+dJngazQPPm8MzaYawPkNbZRl1h2TYwAc+HT310/+IfXrf7dU8/+Javy4CaASLiXHAK6k+
	H/vpR4ThsO6sJY7OrkZJSMBZwaGa91Q=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 15/19] tools/xenstore: merge is_valid_nodename() into canonicalize()
Date: Mon, 14 Aug 2023 09:47:03 +0200
Message-Id: <20230814074707.27696-16-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230814074707.27696-1-jgross@suse.com>
References: <20230814074707.27696-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today is_valid_nodename() is always called directly after calling
canonicalize(), with the exception of do_unwatch(), where the call
is missing (which is not correct, but results just in a wrong error
reason being returned).

Merge is_valid_nodename() into canonicalize(). While at it merge
valid_chars() into it, too.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
V4:
- make name const in canonicalize()
- don't merge valid_chars() (Julien Grall)
- free full path string in case of error (Julien Grall)
---
 tools/xenstore/xenstored_core.c  | 85 +++++++++++++++++---------------
 tools/xenstore/xenstored_core.h  |  6 +--
 tools/xenstore/xenstored_watch.c | 16 ++----
 3 files changed, 50 insertions(+), 57 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 0ebe4bb7d2..69e147df2c 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1219,33 +1219,6 @@ static bool valid_chars(const char *node)
 		       "0123456789-/_@") == strlen(node));
 }
 
-bool is_valid_nodename(const struct connection *conn, const char *node,
-		       bool allow_special)
-{
-	int local_off = 0;
-	unsigned int domid;
-
-	/* Must start in / or - if special nodes are allowed - in @. */
-	if (!strstarts(node, "/") && (!allow_special || !strstarts(node, "@")))
-		return false;
-
-	/* Cannot end in / (unless it's just "/"). */
-	if (strends(node, "/") && !streq(node, "/"))
-		return false;
-
-	/* No double //. */
-	if (strstr(node, "//"))
-		return false;
-
-	if (sscanf(node, "/local/domain/%5u/%n", &domid, &local_off) != 1)
-		local_off = 0;
-
-	if (domain_max_chk(conn, ACC_PATHLEN, strlen(node) - local_off))
-		return false;
-
-	return valid_chars(node);
-}
-
 /* We expect one arg in the input: return NULL otherwise.
  * The payload must contain exactly one nul, at the end.
  */
@@ -1278,16 +1251,51 @@ static char *node_perms_to_strings(const struct node *node, unsigned int *len)
 }
 
 const char *canonicalize(struct connection *conn, const void *ctx,
-			 const char *node)
+			 const char *node, bool allow_special)
 {
-	const char *prefix;
+	const char *name;
+	int local_off = 0;
+	unsigned int domid;
 
-	if (!node || (node[0] == '/') || (node[0] == '@'))
-		return node;
-	prefix = get_implicit_path(conn);
-	if (prefix)
-		return talloc_asprintf(ctx, "%s/%s", prefix, node);
-	return node;
+	/*
+	 * Invalid if any of:
+	 * - no node at all
+	 * - illegal character in node
+	 * - starts with '@' but no special node allowed
+	 */
+	errno = EINVAL;
+	if (!node ||
+	    !valid_chars(node) ||
+	    (node[0] == '@' && !allow_special))
+		return NULL;
+
+	if (node[0] != '/' && node[0] != '@') {
+		name = talloc_asprintf(ctx, "%s/%s", get_implicit_path(conn),
+				       node);
+		if (!name)
+			return NULL;
+	} else
+		name = node;
+
+	if (sscanf(name, "/local/domain/%5u/%n", &domid, &local_off) != 1)
+		local_off = 0;
+
+	/*
+	 * Only valid if:
+	 * - doesn't end in / (unless it's just "/")
+	 * - no double //
+	 * - not violating max allowed path length
+	 */
+	if (!(strends(name, "/") && !streq(name, "/")) &&
+	    !strstr(name, "//") &&
+	    !domain_max_chk(conn, ACC_PATHLEN, strlen(name) - local_off))
+		return name;
+
+	/* Release the memory if 'name' was allocated by us. */
+	if (name != node)
+		talloc_free(name);
+
+	return NULL;
 }
 
 static struct node *get_node_canonicalized(struct connection *conn,
@@ -1301,13 +1309,10 @@ static struct node *get_node_canonicalized(struct connection *conn,
 
 	if (!canonical_name)
 		canonical_name = &tmp_name;
-	*canonical_name = canonicalize(conn, ctx, name);
+	*canonical_name = canonicalize(conn, ctx, name, allow_special);
 	if (!*canonical_name)
 		return NULL;
-	if (!is_valid_nodename(conn, *canonical_name, allow_special)) {
-		errno = EINVAL;
-		return NULL;
-	}
+
 	return get_node(conn, ctx, *canonical_name, perm);
 }
 
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 5575cc0689..ad87199042 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -241,7 +241,7 @@ void send_ack(struct connection *conn, enum xsd_sockmsg_type type);
 
 /* Canonicalize this path if possible. */
 const char *canonicalize(struct connection *conn, const void *ctx,
-			 const char *node);
+			 const char *node, bool allow_special);
 
 /* Get access permissions. */
 unsigned int perm_for_conn(struct connection *conn,
@@ -304,10 +304,6 @@ struct connection *get_connection_by_id(unsigned int conn_id);
 void check_store(void);
 void corrupt(struct connection *conn, const char *fmt, ...);
 
-/* Is this a valid node name? */
-bool is_valid_nodename(const struct connection *conn, const char *node,
-		       bool allow_special);
-
 /* Get name of parent node. */
 char *get_parent(const void *ctx, const char *node);
 
diff --git a/tools/xenstore/xenstored_watch.c b/tools/xenstore/xenstored_watch.c
index e695762c64..7d4d097cf9 100644
--- a/tools/xenstore/xenstored_watch.c
+++ b/tools/xenstore/xenstored_watch.c
@@ -164,17 +164,9 @@ static int check_watch_path(struct connection *conn, const void *ctx,
 			    const char **path, bool *relative)
 {
 	*relative = !strstarts(*path, "/") && !strstarts(*path, "@");
-	*path = canonicalize(conn, ctx, *path);
-	if (!*path)
-		return errno;
-	if (!is_valid_nodename(conn, *path, true))
-		goto inval;
-
-	return 0;
+	*path = canonicalize(conn, ctx, *path, true);
 
- inval:
-	errno = EINVAL;
-	return errno;
+	return *path ? 0 : errno;
 }
 
 static struct watch *add_watch(struct connection *conn, const char *path,
@@ -258,9 +250,9 @@ int do_unwatch(const void *ctx, struct connection *conn,
 	if (get_strings(in, vec, ARRAY_SIZE(vec)) != ARRAY_SIZE(vec))
 		return EINVAL;
 
-	node = canonicalize(conn, ctx, vec[0]);
+	node = canonicalize(conn, ctx, vec[0], true);
 	if (!node)
-		return ENOMEM;
+		return errno;
 	list_for_each_entry(watch, &conn->watches, list) {
 		if (streq(watch->node, node) && streq(watch->token, vec[1])) {
 			list_del(&watch->list);
-- 
2.35.3


