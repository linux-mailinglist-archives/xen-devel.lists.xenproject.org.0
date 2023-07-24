Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C894D75F474
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 13:07:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568753.888681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtPU-00073J-7i; Mon, 24 Jul 2023 11:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568753.888681; Mon, 24 Jul 2023 11:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtPU-0006yt-3O; Mon, 24 Jul 2023 11:07:28 +0000
Received: by outflank-mailman (input) for mailman id 568753;
 Mon, 24 Jul 2023 11:07:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVkC=DK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qNtN7-0008WC-O3
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 11:05:01 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee780650-2a11-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 13:05:00 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C40F01FDF0;
 Mon, 24 Jul 2023 11:04:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 973BA13476;
 Mon, 24 Jul 2023 11:04:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lvtGI9tavmR+YgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 24 Jul 2023 11:04:59 +0000
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
X-Inumbo-ID: ee780650-2a11-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690196699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9aPawA5ESo5CRMIgOFiPZjmhXxpcDENIO0dImei+Tbo=;
	b=MOWePWqF3Qw+uHN0dIhCwibDKqjlcE2Xt2ucz5KA96XZstUbGtqdSW04vakXkOhyBwirwB
	/tiVphEvE9PeTZyDLm0TF3HKMIPK8GzHWakj8DFL41y7h4M2ruQ/C6Dc8dTTWlU1ZN+rOH
	R4xM3ZTgbox+vNfJwveEgxDSvh32HkY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 23/25] tools/xenstore: merge is_valid_nodename() into canonicalize()
Date: Mon, 24 Jul 2023 13:02:45 +0200
Message-Id: <20230724110247.10520-24-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230724110247.10520-1-jgross@suse.com>
References: <20230724110247.10520-1-jgross@suse.com>
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
---
 tools/xenstore/xenstored_core.c  | 89 ++++++++++++++------------------
 tools/xenstore/xenstored_core.h  |  6 +--
 tools/xenstore/xenstored_watch.c | 16 ++----
 3 files changed, 45 insertions(+), 66 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index ea5a1a9cce..ec20bc042d 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1210,42 +1210,6 @@ void send_ack(struct connection *conn, enum xsd_sockmsg_type type)
 	send_reply(conn, type, "OK", sizeof("OK"));
 }
 
-static bool valid_chars(const char *node)
-{
-	/* Nodes can have lots of crap. */
-	return (strspn(node, 
-		       "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
-		       "abcdefghijklmnopqrstuvwxyz"
-		       "0123456789-/_@") == strlen(node));
-}
-
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
@@ -1279,16 +1243,46 @@ static char *perms_to_strings(const void *ctx, const struct node_perms *perms,
 }
 
 const char *canonicalize(struct connection *conn, const void *ctx,
-			 const char *node)
+			 const char *node, bool allow_special)
 {
-	const char *prefix;
+	char *name;
+	int local_off = 0;
+	unsigned int domid;
 
-	if (!node || (node[0] == '/') || (node[0] == '@'))
-		return node;
-	prefix = get_implicit_path(conn);
-	if (prefix)
-		return talloc_asprintf(ctx, "%s/%s", prefix, node);
-	return node;
+	errno = EINVAL;
+	if (!node)
+		return NULL;
+
+	if (strspn(node, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
+			 "0123456789-/_@") != strlen(node))
+		return NULL;
+
+	if (node[0] == '@' && !allow_special)
+		return NULL;
+
+	if (node[0] != '/' && node[0] != '@') {
+		name = talloc_asprintf(ctx, "%s/%s", get_implicit_path(conn),
+				       node);
+		if (!name)
+			return NULL;
+	} else
+		name = (char *)node;
+
+	/* Cannot end in / (unless it's just "/"). */
+	if (strends(name, "/") && !streq(name, "/"))
+		return NULL;
+
+	/* No double //. */
+	if (strstr(name, "//"))
+		return NULL;
+
+	if (sscanf(name, "/local/domain/%5u/%n", &domid, &local_off) != 1)
+		local_off = 0;
+
+	if (domain_max_chk(conn, ACC_PATHLEN, strlen(name) - local_off))
+		return NULL;
+
+	return name;
 }
 
 static struct node *get_node_canonicalized(struct connection *conn,
@@ -1302,13 +1296,10 @@ static struct node *get_node_canonicalized(struct connection *conn,
 
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
index f3a83efce8..ec1d6aac27 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -241,7 +241,7 @@ void send_ack(struct connection *conn, enum xsd_sockmsg_type type);
 
 /* Canonicalize this path if possible. */
 const char *canonicalize(struct connection *conn, const void *ctx,
-			 const char *node);
+			 const char *node, bool allow_special);
 
 /* Get access permissions. */
 unsigned int perm_for_conn(struct connection *conn,
@@ -294,10 +294,6 @@ struct connection *get_connection_by_id(unsigned int conn_id);
 void check_store(void);
 void corrupt(struct connection *conn, const char *fmt, ...);
 
-/* Is this a valid node name? */
-bool is_valid_nodename(const struct connection *conn, const char *node,
-		       bool allow_special);
-
 /* Get name of parent node. */
 char *get_parent(const void *ctx, const char *node);
 
diff --git a/tools/xenstore/xenstored_watch.c b/tools/xenstore/xenstored_watch.c
index 2662a3fa49..247d37e80f 100644
--- a/tools/xenstore/xenstored_watch.c
+++ b/tools/xenstore/xenstored_watch.c
@@ -167,17 +167,9 @@ static int check_watch_path(struct connection *conn, const void *ctx,
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
@@ -261,9 +253,9 @@ int do_unwatch(const void *ctx, struct connection *conn,
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


