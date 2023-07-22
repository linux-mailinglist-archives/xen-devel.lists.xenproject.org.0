Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F26AA75DB03
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jul 2023 10:17:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567879.887355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qN7nN-0000ui-B0; Sat, 22 Jul 2023 08:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567879.887355; Sat, 22 Jul 2023 08:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qN7nN-0000sV-7O; Sat, 22 Jul 2023 08:16:57 +0000
Received: by outflank-mailman (input) for mailman id 567879;
 Sat, 22 Jul 2023 08:16:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9aU5=DI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qN7nM-0000sH-7l
 for xen-devel@lists.xenproject.org; Sat, 22 Jul 2023 08:16:56 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e75c7bb-2868-11ee-b23a-6b7b168915f2;
 Sat, 22 Jul 2023 10:16:55 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AF8741FD99;
 Sat, 22 Jul 2023 08:16:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 83AAA1346D;
 Sat, 22 Jul 2023 08:16:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wffKHnaQu2S/QQAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 22 Jul 2023 08:16:54 +0000
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
X-Inumbo-ID: 1e75c7bb-2868-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690013814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r+WpFCfUEhtaV9T33uK5LGEUOuSmGQRC70pWzEcNNf8=;
	b=PL4BgzEcV8HMEYahyguXSL9OxjkC7VJw3fT+6m1olauOsj3mZXQhTV25G1BQO4Tks2FuYq
	W0L4Ghc70d3l5q3/Qr+CAgoILO4qpLMFZM1iONb7oFshSNVQlojYevVaztDaqLurRRk5Uu
	iIea8CrWyYtjVFf5begoNGgm+iY0Gpw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 1/2] tools/xenstore: add const to the return type of  canonicalize()
Date: Sat, 22 Jul 2023 10:16:45 +0200
Message-Id: <20230722081646.4136-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230722081646.4136-1-jgross@suse.com>
References: <20230722081646.4136-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return type of canonicalize() can be modified to const char *.
This avoids the need to cast the const away from the input parameter.

There need to be quite some other functions modified to take const
parameters in order to avoid further casts.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c  | 22 ++++++++++++----------
 tools/xenstore/xenstored_core.h  |  3 ++-
 tools/xenstore/xenstored_watch.c | 16 ++++++++++------
 3 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index a1d3047e48..3d3c39bd70 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1216,25 +1216,26 @@ static char *perms_to_strings(const void *ctx, const struct node_perms *perms,
 	return strings;
 }
 
-char *canonicalize(struct connection *conn, const void *ctx, const char *node)
+const char *canonicalize(struct connection *conn, const void *ctx,
+			 const char *node)
 {
 	const char *prefix;
 
 	if (!node || (node[0] == '/') || (node[0] == '@'))
-		return (char *)node;
+		return node;
 	prefix = get_implicit_path(conn);
 	if (prefix)
 		return talloc_asprintf(ctx, "%s/%s", prefix, node);
-	return (char *)node;
+	return node;
 }
 
 static struct node *get_node_canonicalized(struct connection *conn,
 					   const void *ctx,
 					   const char *name,
-					   char **canonical_name,
+					   const char **canonical_name,
 					   unsigned int perm)
 {
-	char *tmp_name;
+	const char *tmp_name;
 
 	if (!canonical_name)
 		canonical_name = &tmp_name;
@@ -1249,7 +1250,7 @@ static struct node *get_node_canonicalized(struct connection *conn,
 }
 
 static struct node *get_spec_node(struct connection *conn, const void *ctx,
-				  const char *name, char **canonical_name,
+				  const char *name, const char **canonical_name,
 				  unsigned int perm)
 {
 	if (name[0] == '@')
@@ -1539,7 +1540,7 @@ static int do_write(const void *ctx, struct connection *conn,
 	unsigned int offset, datalen;
 	struct node *node;
 	char *vec[1] = { NULL }; /* gcc4 + -W + -Werror fucks code. */
-	char *name;
+	const char *name;
 
 	/* Extra "strings" can be created by binary data. */
 	if (get_strings(in, vec, ARRAY_SIZE(vec)) < ARRAY_SIZE(vec))
@@ -1574,7 +1575,7 @@ static int do_mkdir(const void *ctx, struct connection *conn,
 		    struct buffered_data *in)
 {
 	struct node *node;
-	char *name;
+	const char *name;
 
 	node = get_node_canonicalized(conn, ctx, onearg(in), &name,
 				      XS_PERM_WRITE);
@@ -1703,7 +1704,7 @@ static int do_rm(const void *ctx, struct connection *conn,
 {
 	struct node *node;
 	int ret;
-	char *name;
+	const char *name;
 	char *parentname;
 
 	node = get_node_canonicalized(conn, ctx, onearg(in), &name,
@@ -1765,7 +1766,8 @@ static int do_set_perms(const void *ctx, struct connection *conn,
 			struct buffered_data *in)
 {
 	struct node_perms perms, old_perms;
-	char *name, *permstr;
+	const char *name;
+	char *permstr;
 	struct node *node;
 
 	perms.num = xenstore_count_strings(in->buffer, in->used);
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 84a611cbb5..4184a4b7ef 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -224,7 +224,8 @@ void send_event(struct buffered_data *req, struct connection *conn,
 void send_ack(struct connection *conn, enum xsd_sockmsg_type type);
 
 /* Canonicalize this path if possible. */
-char *canonicalize(struct connection *conn, const void *ctx, const char *node);
+const char *canonicalize(struct connection *conn, const void *ctx,
+			 const char *node);
 
 /* Get access permissions. */
 unsigned int perm_for_conn(struct connection *conn,
diff --git a/tools/xenstore/xenstored_watch.c b/tools/xenstore/xenstored_watch.c
index 4195c59e17..f92fbeb73a 100644
--- a/tools/xenstore/xenstored_watch.c
+++ b/tools/xenstore/xenstored_watch.c
@@ -161,7 +161,7 @@ static int destroy_watch(void *_watch)
 }
 
 static int check_watch_path(struct connection *conn, const void *ctx,
-			    char **path, bool *relative)
+			    const char **path, bool *relative)
 {
 	/* Check if valid event. */
 	if (strstarts(*path, "@")) {
@@ -184,8 +184,9 @@ static int check_watch_path(struct connection *conn, const void *ctx,
 	return errno;
 }
 
-static struct watch *add_watch(struct connection *conn, char *path, char *token,
-			       bool relative, bool no_quota_check)
+static struct watch *add_watch(struct connection *conn, const char *path,
+			       const char *token, bool relative,
+			       bool no_quota_check)
 {
 	struct watch *watch;
 
@@ -218,12 +219,14 @@ int do_watch(const void *ctx, struct connection *conn, struct buffered_data *in)
 {
 	struct watch *watch;
 	char *vec[2];
+	const char *path;
 	bool relative;
 
 	if (get_strings(in, vec, ARRAY_SIZE(vec)) != ARRAY_SIZE(vec))
 		return EINVAL;
 
-	errno = check_watch_path(conn, ctx, &(vec[0]), &relative);
+	path = vec[0];
+	errno = check_watch_path(conn, ctx, &path, &relative);
 	if (errno)
 		return errno;
 
@@ -258,7 +261,8 @@ int do_unwatch(const void *ctx, struct connection *conn,
 	       struct buffered_data *in)
 {
 	struct watch *watch;
-	char *node, *vec[2];
+	const char *node;
+	char *vec[2];
 
 	if (get_strings(in, vec, ARRAY_SIZE(vec)) != ARRAY_SIZE(vec))
 		return EINVAL;
@@ -336,7 +340,7 @@ void read_state_watch(const void *ctx, const void *state)
 {
 	const struct xs_state_watch *sw = state;
 	struct connection *conn;
-	char *path, *token;
+	const char *path, *token;
 	bool relative;
 
 	conn = get_connection_by_id(sw->conn_id);
-- 
2.35.3


