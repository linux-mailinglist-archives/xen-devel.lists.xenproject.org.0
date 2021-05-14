Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D8838090E
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 13:57:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127334.239318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhWQg-0000Q6-Is; Fri, 14 May 2021 11:56:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127334.239318; Fri, 14 May 2021 11:56:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhWQg-0000NX-EY; Fri, 14 May 2021 11:56:30 +0000
Received: by outflank-mailman (input) for mailman id 127334;
 Fri, 14 May 2021 11:56:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sDpF=KJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lhWQf-0008GF-7L
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 11:56:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b132285a-3e73-4659-81bc-9120a1e39dd2;
 Fri, 14 May 2021 11:56:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 74EDFAF3B;
 Fri, 14 May 2021 11:56:22 +0000 (UTC)
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
X-Inumbo-ID: b132285a-3e73-4659-81bc-9120a1e39dd2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620993382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JABpMKFbWwF/cBhHZRIRb/5VTXEahnZX0PdYMClipEU=;
	b=IQKz1nlZQlEG+F7cT45CH7aovSZu9S450UcKyoE6gBQFJt0KpOXhRxOEficqLga1tnVQ3e
	AgisJbGGI6oWGYp0pn8JesamC3/E/xNH5GTzU1oRo0RuSL2/HlWCpGXrx/TomK/m5/BMvw
	dLcwXx/P5StDg5K1Q/FVtXTnTvUxKks=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/2] tools/xenstore: move per connection read and write func hooks into a struct
Date: Fri, 14 May 2021 13:56:19 +0200
Message-Id: <20210514115620.32731-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210514115620.32731-1-jgross@suse.com>
References: <20210514115620.32731-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Put the interface type specific functions into an own structure and let
struct connection contain only a pointer to that new function vector.

Don't even define the socket based functions in case of NO_SOCKETS
(Mini-OS).

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- split off from V1 patch (Julien Grall)
- use const qualifier (Julien Grall)
- drop socket specific case for Mini-OS (Julien Grall)
---
 tools/xenstore/xenstored_core.c   | 44 +++++++++++++------------------
 tools/xenstore/xenstored_core.h   | 19 +++++++------
 tools/xenstore/xenstored_domain.c | 13 +++++++--
 3 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 4b7b71cfb3..856f518075 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -226,8 +226,8 @@ static bool write_messages(struct connection *conn)
 				sockmsg_string(out->hdr.msg.type),
 				out->hdr.msg.len,
 				out->buffer, conn);
-		ret = conn->write(conn, out->hdr.raw + out->used,
-				  sizeof(out->hdr) - out->used);
+		ret = conn->funcs->write(conn, out->hdr.raw + out->used,
+					 sizeof(out->hdr) - out->used);
 		if (ret < 0)
 			return false;
 
@@ -243,8 +243,8 @@ static bool write_messages(struct connection *conn)
 			return true;
 	}
 
-	ret = conn->write(conn, out->buffer + out->used,
-			  out->hdr.msg.len - out->used);
+	ret = conn->funcs->write(conn, out->buffer + out->used,
+				 out->hdr.msg.len - out->used);
 	if (ret < 0)
 		return false;
 
@@ -1531,8 +1531,8 @@ static void handle_input(struct connection *conn)
 	/* Not finished header yet? */
 	if (in->inhdr) {
 		if (in->used != sizeof(in->hdr)) {
-			bytes = conn->read(conn, in->hdr.raw + in->used,
-					   sizeof(in->hdr) - in->used);
+			bytes = conn->funcs->read(conn, in->hdr.raw + in->used,
+						  sizeof(in->hdr) - in->used);
 			if (bytes < 0)
 				goto bad_client;
 			in->used += bytes;
@@ -1557,8 +1557,8 @@ static void handle_input(struct connection *conn)
 		in->inhdr = false;
 	}
 
-	bytes = conn->read(conn, in->buffer + in->used,
-			   in->hdr.msg.len - in->used);
+	bytes = conn->funcs->read(conn, in->buffer + in->used,
+				  in->hdr.msg.len - in->used);
 	if (bytes < 0)
 		goto bad_client;
 
@@ -1581,7 +1581,7 @@ static void handle_output(struct connection *conn)
 		ignore_connection(conn);
 }
 
-struct connection *new_connection(connwritefn_t *write, connreadfn_t *read)
+struct connection *new_connection(const struct interface_funcs *funcs)
 {
 	struct connection *new;
 
@@ -1591,8 +1591,7 @@ struct connection *new_connection(connwritefn_t *write, connreadfn_t *read)
 
 	new->fd = -1;
 	new->pollfd_idx = -1;
-	new->write = write;
-	new->read = read;
+	new->funcs = funcs;
 	new->is_ignored = false;
 	new->transaction_started = 0;
 	INIT_LIST_HEAD(&new->out_list);
@@ -1621,20 +1620,8 @@ struct connection *get_connection_by_id(unsigned int conn_id)
 static void accept_connection(int sock)
 {
 }
-
-int writefd(struct connection *conn, const void *data, unsigned int len)
-{
-	errno = EBADF;
-	return -1;
-}
-
-int readfd(struct connection *conn, void *data, unsigned int len)
-{
-	errno = EBADF;
-	return -1;
-}
 #else
-int writefd(struct connection *conn, const void *data, unsigned int len)
+static int writefd(struct connection *conn, const void *data, unsigned int len)
 {
 	int rc;
 
@@ -1650,7 +1637,7 @@ int writefd(struct connection *conn, const void *data, unsigned int len)
 	return rc;
 }
 
-int readfd(struct connection *conn, void *data, unsigned int len)
+static int readfd(struct connection *conn, void *data, unsigned int len)
 {
 	int rc;
 
@@ -1672,6 +1659,11 @@ int readfd(struct connection *conn, void *data, unsigned int len)
 	return rc;
 }
 
+const struct interface_funcs socket_funcs = {
+	.write = writefd,
+	.read = readfd,
+};
+
 static void accept_connection(int sock)
 {
 	int fd;
@@ -1681,7 +1673,7 @@ static void accept_connection(int sock)
 	if (fd < 0)
 		return;
 
-	conn = new_connection(writefd, readfd);
+	conn = new_connection(&socket_funcs);
 	if (conn)
 		conn->fd = fd;
 	else
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 6a6d0448e8..021e41076d 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -86,8 +86,11 @@ struct delayed_request {
 };
 
 struct connection;
-typedef int connwritefn_t(struct connection *, const void *, unsigned int);
-typedef int connreadfn_t(struct connection *, void *, unsigned int);
+
+struct interface_funcs {
+	int (*write)(struct connection *, const void *, unsigned int);
+	int (*read)(struct connection *, void *, unsigned int);
+};
 
 struct connection
 {
@@ -131,9 +134,8 @@ struct connection
 	/* My watches. */
 	struct list_head watches;
 
-	/* Methods for communicating over this connection: write can be NULL */
-	connwritefn_t *write;
-	connreadfn_t *read;
+	/* Methods for communicating over this connection. */
+	const struct interface_funcs *funcs;
 
 	/* Support for live update: connection id. */
 	unsigned int conn_id;
@@ -196,7 +198,7 @@ int write_node_raw(struct connection *conn, TDB_DATA *key, struct node *node,
 struct node *read_node(struct connection *conn, const void *ctx,
 		       const char *name);
 
-struct connection *new_connection(connwritefn_t *write, connreadfn_t *read);
+struct connection *new_connection(const struct interface_funcs *funcs);
 struct connection *get_connection_by_id(unsigned int conn_id);
 void check_store(void);
 void corrupt(struct connection *conn, const char *fmt, ...);
@@ -254,10 +256,7 @@ void finish_daemonize(void);
 /* Open a pipe for signal handling */
 void init_pipe(int reopen_log_pipe[2]);
 
-int writefd(struct connection *conn, const void *data, unsigned int len);
-int readfd(struct connection *conn, void *data, unsigned int len);
-
-extern struct interface_funcs socket_funcs;
+extern const struct interface_funcs socket_funcs;
 extern xengnttab_handle **xgt_handle;
 
 int remember_string(struct hashtable *hash, const char *str);
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 0c17937c0f..f3cd56050e 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -172,6 +172,11 @@ static int readchn(struct connection *conn, void *data, unsigned int len)
 	return len;
 }
 
+static const struct interface_funcs domain_funcs = {
+	.write = writechn,
+	.read = readchn,
+};
+
 static void *map_interface(domid_t domid)
 {
 	return xengnttab_map_grant_ref(*xgt_handle, domid,
@@ -389,7 +394,7 @@ static int new_domain(struct domain *domain, int port, bool restore)
 
 	domain->introduced = true;
 
-	domain->conn = new_connection(writechn, readchn);
+	domain->conn = new_connection(&domain_funcs);
 	if (!domain->conn)  {
 		errno = ENOMEM;
 		return errno;
@@ -1288,10 +1293,14 @@ void read_state_connection(const void *ctx, const void *state)
 	struct domain *domain, *tdomain;
 
 	if (sc->conn_type == XS_STATE_CONN_TYPE_SOCKET) {
-		conn = new_connection(writefd, readfd);
+#ifdef NO_SOCKETS
+		barf("socket based connection without sockets");
+#else
+		conn = new_connection(&socket_funcs);
 		if (!conn)
 			barf("error restoring connection");
 		conn->fd = sc->spec.socket_fd;
+#endif
 	} else {
 		domain = introduce_domain(ctx, sc->spec.ring.domid,
 					  sc->spec.ring.evtchn, true);
-- 
2.26.2


