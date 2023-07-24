Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC2075F361
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 12:33:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568717.888527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNssh-0003KJ-Ci; Mon, 24 Jul 2023 10:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568717.888527; Mon, 24 Jul 2023 10:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNssh-0003IW-6X; Mon, 24 Jul 2023 10:33:35 +0000
Received: by outflank-mailman (input) for mailman id 568717;
 Mon, 24 Jul 2023 10:33:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVkC=DK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qNssf-00031Q-Sl
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 10:33:34 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89b2cb80-2a0d-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 12:33:32 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9934820665;
 Mon, 24 Jul 2023 10:33:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6A849138E8;
 Mon, 24 Jul 2023 10:33:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GMJQGHxTvmR0UAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 24 Jul 2023 10:33:32 +0000
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
X-Inumbo-ID: 89b2cb80-2a0d-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690194812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QztVVey2YoDwROHqqVV26V6sbdHLNr1pk8Dham/+sKc=;
	b=cLneK8POTES+WRVwOCQkrwj+rrLBR86cUux8d7OfyKkgvypopcr8qraUjAlhjJMh0dcfLH
	ReWg6z6NFjlOnUQqxuSogp3c0QsJ1lezCwIJgY/LBdR3Cx8JwwQttTYv6QBaRgdTO0DCnk
	ZJ3IzSbzZl0+z0nH/GBmX0Duy9Qgzlk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 1/2] tools/xenstore: add const to the return type of  canonicalize()
Date: Mon, 24 Jul 2023 12:33:23 +0200
Message-Id: <20230724103324.4207-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230724103324.4207-1-jgross@suse.com>
References: <20230724103324.4207-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return type of canonicalize() can be modified to const char *.
This avoids the need to cast the const away from the input parameter.

There need to be quite some other functions modified to take const
parameters in order to avoid further casts.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch (Julien Grall)
V3:
- add get_strings() conversion to take const pointer (Julien Grall)
---
 tools/xenstore/xenstored_control.c   | 33 ++++++++++++++--------------
 tools/xenstore/xenstored_core.c      | 26 ++++++++++++----------
 tools/xenstore/xenstored_core.h      |  5 +++--
 tools/xenstore/xenstored_domain.c    |  4 ++--
 tools/xenstore/xenstored_lu.c        |  2 +-
 tools/xenstore/xenstored_lu.h        |  4 ++--
 tools/xenstore/xenstored_lu_daemon.c |  2 +-
 tools/xenstore/xenstored_lu_minios.c |  2 +-
 tools/xenstore/xenstored_watch.c     | 14 +++++++-----
 9 files changed, 49 insertions(+), 43 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 145a0e5aff..3bdf2edc34 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -34,7 +34,7 @@
 
 struct cmd_s {
 	char *cmd;
-	int (*func)(const void *, struct connection *, char **, int);
+	int (*func)(const void *, struct connection *, const char **, int);
 	char *pars;
 	/*
 	 * max_pars can be used to limit the size of the parameter vector,
@@ -47,7 +47,7 @@ struct cmd_s {
 };
 
 static int do_control_check(const void *ctx, struct connection *conn,
-			    char **vec, int num)
+			    const char **vec, int num)
 {
 	if (num)
 		return EINVAL;
@@ -59,7 +59,7 @@ static int do_control_check(const void *ctx, struct connection *conn,
 }
 
 static int do_control_log(const void *ctx, struct connection *conn,
-			  char **vec, int num)
+			  const char **vec, int num)
 {
 	int ret;
 
@@ -126,7 +126,7 @@ static int quota_show_current(const void *ctx, struct connection *conn,
 }
 
 static int quota_set(const void *ctx, struct connection *conn,
-		     char **vec, int num, struct quota *quotas)
+		     const char **vec, int num, struct quota *quotas)
 {
 	unsigned int i;
 	int val;
@@ -150,7 +150,7 @@ static int quota_set(const void *ctx, struct connection *conn,
 }
 
 static int quota_get(const void *ctx, struct connection *conn,
-		     char **vec, int num)
+		     const char **vec, int num)
 {
 	if (num != 1)
 		return EINVAL;
@@ -159,7 +159,7 @@ static int quota_get(const void *ctx, struct connection *conn,
 }
 
 static int quota_max(const void *ctx, struct connection *conn,
-		     char **vec, int num)
+		     const char **vec, int num)
 {
 	if (num > 1)
 		return EINVAL;
@@ -175,7 +175,7 @@ static int quota_max(const void *ctx, struct connection *conn,
 }
 
 static int do_control_quota(const void *ctx, struct connection *conn,
-			    char **vec, int num)
+			    const char **vec, int num)
 {
 	if (num == 0)
 		return quota_show_current(ctx, conn, hard_quotas);
@@ -190,7 +190,7 @@ static int do_control_quota(const void *ctx, struct connection *conn,
 }
 
 static int do_control_quota_s(const void *ctx, struct connection *conn,
-			      char **vec, int num)
+			      const char **vec, int num)
 {
 	if (num == 0)
 		return quota_show_current(ctx, conn, soft_quotas);
@@ -203,7 +203,7 @@ static int do_control_quota_s(const void *ctx, struct connection *conn,
 
 #ifdef __MINIOS__
 static int do_control_memreport(const void *ctx, struct connection *conn,
-				char **vec, int num)
+				const char **vec, int num)
 {
 	if (num)
 		return EINVAL;
@@ -215,7 +215,7 @@ static int do_control_memreport(const void *ctx, struct connection *conn,
 }
 #else
 static int do_control_logfile(const void *ctx, struct connection *conn,
-			      char **vec, int num)
+			      const char **vec, int num)
 {
 	if (num != 1)
 		return EINVAL;
@@ -230,7 +230,7 @@ static int do_control_logfile(const void *ctx, struct connection *conn,
 }
 
 static int do_control_memreport(const void *ctx, struct connection *conn,
-				char **vec, int num)
+				const char **vec, int num)
 {
 	FILE *fp;
 	int fd;
@@ -270,7 +270,7 @@ static int do_control_memreport(const void *ctx, struct connection *conn,
 #endif
 
 static int do_control_print(const void *ctx, struct connection *conn,
-			    char **vec, int num)
+			    const char **vec, int num)
 {
 	if (num != 1)
 		return EINVAL;
@@ -281,7 +281,8 @@ static int do_control_print(const void *ctx, struct connection *conn,
 	return 0;
 }
 
-static int do_control_help(const void *, struct connection *, char **, int);
+static int do_control_help(const void *, struct connection *, const char **,
+			   int);
 
 static struct cmd_s cmds[] = {
 	{ "check", do_control_check, "" },
@@ -322,7 +323,7 @@ static struct cmd_s cmds[] = {
 };
 
 static int do_control_help(const void *ctx, struct connection *conn,
-			   char **vec, int num)
+			   const char **vec, int num)
 {
 	int cmd;
 	char *resp;
@@ -348,7 +349,7 @@ int do_control(const void *ctx, struct connection *conn,
 	       struct buffered_data *in)
 {
 	unsigned int cmd, num, off;
-	char **vec = NULL;
+	const char **vec = NULL;
 
 	if (domain_is_unprivileged(conn))
 		return EACCES;
@@ -365,7 +366,7 @@ int do_control(const void *ctx, struct connection *conn,
 	num = xenstore_count_strings(in->buffer, in->used);
 	if (cmds[cmd].max_pars)
 		num = min(num, cmds[cmd].max_pars);
-	vec = talloc_array(ctx, char *, num);
+	vec = (const char **)talloc_array(ctx, char *, num);
 	if (!vec)
 		return ENOMEM;
 	if (get_strings(in, vec, num) < num)
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index a1d3047e48..6d27b2dd7f 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -994,7 +994,7 @@ unsigned int get_string(const struct buffered_data *data, unsigned int offset)
  * ignore any data after the final nul.
  */
 unsigned int get_strings(struct buffered_data *data,
-			 char *vec[], unsigned int num)
+			 const char *vec[], unsigned int num)
 {
 	unsigned int off, i, len;
 
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
@@ -1538,8 +1539,8 @@ static int do_write(const void *ctx, struct connection *conn,
 {
 	unsigned int offset, datalen;
 	struct node *node;
-	char *vec[1] = { NULL }; /* gcc4 + -W + -Werror fucks code. */
-	char *name;
+	const char *vec[1] = { NULL }; /* gcc4 + -W + -Werror fucks code. */
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
index 84a611cbb5..005556de90 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -212,7 +212,7 @@ const char *onearg(struct buffered_data *in);
 
 /* Break input into vectors, return the number, fill in up to num of them. */
 unsigned int get_strings(struct buffered_data *data,
-			 char *vec[], unsigned int num);
+			 const char *vec[], unsigned int num);
 unsigned int get_string(const struct buffered_data *data, unsigned int offset);
 
 void send_reply(struct connection *conn, enum xsd_sockmsg_type type,
@@ -224,7 +224,8 @@ void send_event(struct buffered_data *req, struct connection *conn,
 void send_ack(struct connection *conn, enum xsd_sockmsg_type type);
 
 /* Canonicalize this path if possible. */
-char *canonicalize(struct connection *conn, const void *ctx, const char *node);
+const char *canonicalize(struct connection *conn, const void *ctx,
+			 const char *node);
 
 /* Get access permissions. */
 unsigned int perm_for_conn(struct connection *conn,
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 632ddb5efc..cc67af5b98 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -1014,7 +1014,7 @@ int do_introduce(const void *ctx, struct connection *conn,
 		 struct buffered_data *in)
 {
 	struct domain *domain;
-	char *vec[3];
+	const char *vec[3];
 	unsigned int domid;
 	evtchn_port_t port;
 
@@ -1055,7 +1055,7 @@ static struct domain *find_connected_domain(unsigned int domid)
 int do_set_target(const void *ctx, struct connection *conn,
 		  struct buffered_data *in)
 {
-	char *vec[2];
+	const char *vec[2];
 	unsigned int domid, tdomid;
         struct domain *domain, *tdomain;
 	if (get_strings(in, vec, ARRAY_SIZE(vec)) < ARRAY_SIZE(vec))
diff --git a/tools/xenstore/xenstored_lu.c b/tools/xenstore/xenstored_lu.c
index b20d0d37ea..f7f76acbf9 100644
--- a/tools/xenstore/xenstored_lu.c
+++ b/tools/xenstore/xenstored_lu.c
@@ -360,7 +360,7 @@ static const char *lu_start(const void *ctx, struct connection *conn,
 	return NULL;
 }
 
-int do_control_lu(const void *ctx, struct connection *conn, char **vec,
+int do_control_lu(const void *ctx, struct connection *conn, const char **vec,
 		  int num)
 {
 	const char *ret = NULL;
diff --git a/tools/xenstore/xenstored_lu.h b/tools/xenstore/xenstored_lu.h
index d633a765a3..ac3c572ca8 100644
--- a/tools/xenstore/xenstored_lu.h
+++ b/tools/xenstore/xenstored_lu.h
@@ -50,7 +50,7 @@ void lu_read_state(void);
 /* Write the "OK" response for the live-update command */
 unsigned int lu_write_response(FILE *fp);
 
-int do_control_lu(const void *ctx, struct connection *conn, char **vec,
+int do_control_lu(const void *ctx, struct connection *conn, const char **vec,
 		  int num);
 
 /* Live update private interfaces. */
@@ -59,7 +59,7 @@ void lu_close_dump_state(struct lu_dump_state *state);
 FILE *lu_dump_open(const void *ctx);
 void lu_dump_close(FILE *fp);
 char *lu_exec(const void *ctx, int argc, char **argv);
-const char *lu_arch(const void *ctx, struct connection *conn, char **vec,
+const char *lu_arch(const void *ctx, struct connection *conn, const char **vec,
 		    int num);
 const char *lu_begin(struct connection *conn);
 void lu_destroy_arch(void *data);
diff --git a/tools/xenstore/xenstored_lu_daemon.c b/tools/xenstore/xenstored_lu_daemon.c
index 310fb8c2e6..8c7522b0e1 100644
--- a/tools/xenstore/xenstored_lu_daemon.c
+++ b/tools/xenstore/xenstored_lu_daemon.c
@@ -118,7 +118,7 @@ static const char *lu_binary(const void *ctx, struct connection *conn,
 	return NULL;
 }
 
-const char *lu_arch(const void *ctx, struct connection *conn, char **vec,
+const char *lu_arch(const void *ctx, struct connection *conn, const char **vec,
 		    int num)
 {
 	if (num == 2 && !strcmp(vec[0], "-f"))
diff --git a/tools/xenstore/xenstored_lu_minios.c b/tools/xenstore/xenstored_lu_minios.c
index 88fb9e0f38..ae0483575e 100644
--- a/tools/xenstore/xenstored_lu_minios.c
+++ b/tools/xenstore/xenstored_lu_minios.c
@@ -104,7 +104,7 @@ static const char *lu_binary_save(const void *ctx, struct connection *conn,
 	return NULL;
 }
 
-const char *lu_arch(const void *ctx, struct connection *conn, char **vec,
+const char *lu_arch(const void *ctx, struct connection *conn, const char **vec,
 		    int num)
 {
 	if (num == 2 && !strcmp(vec[0], "-b"))
diff --git a/tools/xenstore/xenstored_watch.c b/tools/xenstore/xenstored_watch.c
index 4195c59e17..fefbf56ab2 100644
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
 
@@ -217,7 +218,7 @@ static struct watch *add_watch(struct connection *conn, char *path, char *token,
 int do_watch(const void *ctx, struct connection *conn, struct buffered_data *in)
 {
 	struct watch *watch;
-	char *vec[2];
+	const char *vec[2];
 	bool relative;
 
 	if (get_strings(in, vec, ARRAY_SIZE(vec)) != ARRAY_SIZE(vec))
@@ -258,7 +259,8 @@ int do_unwatch(const void *ctx, struct connection *conn,
 	       struct buffered_data *in)
 {
 	struct watch *watch;
-	char *node, *vec[2];
+	const char *node;
+	const char *vec[2];
 
 	if (get_strings(in, vec, ARRAY_SIZE(vec)) != ARRAY_SIZE(vec))
 		return EINVAL;
@@ -336,7 +338,7 @@ void read_state_watch(const void *ctx, const void *state)
 {
 	const struct xs_state_watch *sw = state;
 	struct connection *conn;
-	char *path, *token;
+	const char *path, *token;
 	bool relative;
 
 	conn = get_connection_by_id(sw->conn_id);
-- 
2.35.3


