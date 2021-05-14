Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E76D38055C
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 10:39:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127260.239136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhTLj-0007mM-9h; Fri, 14 May 2021 08:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127260.239136; Fri, 14 May 2021 08:39:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhTLj-0007k0-5Y; Fri, 14 May 2021 08:39:11 +0000
Received: by outflank-mailman (input) for mailman id 127260;
 Fri, 14 May 2021 08:39:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sDpF=KJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lhTLh-0007ju-MV
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 08:39:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b8b0916-4a3a-44fb-a9e7-cbcfd3e61c7a;
 Fri, 14 May 2021 08:39:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 578DCB16C;
 Fri, 14 May 2021 08:39:07 +0000 (UTC)
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
X-Inumbo-ID: 2b8b0916-4a3a-44fb-a9e7-cbcfd3e61c7a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620981547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ob63ffXUj7jX5HQcQ9WrfD7PQ0n7r+vG/seNM0m+Z/w=;
	b=r2GdA0+j5+7TI8JKzqA13YEoIpnc3Sy+TMU0nWwZYVDm0ykPyGad4Vhrvxu8fxrIa8mNGR
	GfGvA6pGa3iJK90fQ11aT7yDfaIAWbZipmvBmOE981+SVYInIx66Y/8ZFhy+IH3FeFpT1F
	kxWS0c4NTSUiSSbqto96yIk1IFOOkNw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] tools/xenstore: simplify xenstored main loop
Date: Fri, 14 May 2021 10:39:05 +0200
Message-Id: <20210514083905.18212-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The main loop of xenstored is rather complicated due to different
handling of socket and ring-page interfaces. Unify that handling by
introducing interface type specific functions can_read() and
can_write().

Put the interface type specific functions in an own structure and let
struct connection contain only a pointer to that new function vector.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c   | 117 ++++++++++++++----------------
 tools/xenstore/xenstored_core.h   |  19 ++---
 tools/xenstore/xenstored_domain.c |  11 ++-
 3 files changed, 73 insertions(+), 74 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 4b7b71cfb3..b66d119a98 100644
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
+struct connection *new_connection(struct interface_funcs *funcs)
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
@@ -1622,17 +1621,7 @@ static void accept_connection(int sock)
 {
 }
 
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
+struct interface_funcs socket_funcs;
 #else
 int writefd(struct connection *conn, const void *data, unsigned int len)
 {
@@ -1672,6 +1661,29 @@ int readfd(struct connection *conn, void *data, unsigned int len)
 	return rc;
 }
 
+static bool socket_can_process(struct connection *conn, int mask)
+{
+	if (conn->pollfd_idx == -1)
+		return false;
+
+	if (fds[conn->pollfd_idx].revents & ~(POLLIN | POLLOUT)) {
+		talloc_free(conn);
+		return false;
+	}
+
+	return (fds[conn->pollfd_idx].revents & mask) && !conn->is_ignored;
+}
+
+static bool socket_can_write(struct connection *conn)
+{
+	return socket_can_process(conn, POLLOUT);
+}
+
+static bool socket_can_read(struct connection *conn)
+{
+	return socket_can_process(conn, POLLIN);
+}
+
 static void accept_connection(int sock)
 {
 	int fd;
@@ -1681,12 +1693,19 @@ static void accept_connection(int sock)
 	if (fd < 0)
 		return;
 
-	conn = new_connection(writefd, readfd);
+	conn = new_connection(&socket_funcs);
 	if (conn)
 		conn->fd = fd;
 	else
 		close(fd);
 }
+
+struct interface_funcs socket_funcs = {
+	.write = writefd,
+	.read = readfd,
+	.can_write = socket_can_write,
+	.can_read = socket_can_read,
+};
 #endif
 
 static int tdb_flags;
@@ -2304,47 +2323,19 @@ int main(int argc, char *argv[])
 			if (&next->list != &connections)
 				talloc_increase_ref_count(next);
 
-			if (conn->domain) {
-				if (domain_can_read(conn))
-					handle_input(conn);
-				if (talloc_free(conn) == 0)
-					continue;
-
-				talloc_increase_ref_count(conn);
-				if (domain_can_write(conn) &&
-				    !list_empty(&conn->out_list))
-					handle_output(conn);
-				if (talloc_free(conn) == 0)
-					continue;
-			} else {
-				if (conn->pollfd_idx != -1) {
-					if (fds[conn->pollfd_idx].revents
-					    & ~(POLLIN|POLLOUT))
-						talloc_free(conn);
-					else if ((fds[conn->pollfd_idx].revents
-						  & POLLIN) &&
-						 !conn->is_ignored)
-						handle_input(conn);
-				}
-				if (talloc_free(conn) == 0)
-					continue;
-
-				talloc_increase_ref_count(conn);
-
-				if (conn->pollfd_idx != -1) {
-					if (fds[conn->pollfd_idx].revents
-					    & ~(POLLIN|POLLOUT))
-						talloc_free(conn);
-					else if ((fds[conn->pollfd_idx].revents
-						  & POLLOUT) &&
-						 !conn->is_ignored)
-						handle_output(conn);
-				}
-				if (talloc_free(conn) == 0)
-					continue;
+			if (conn->funcs->can_read(conn))
+				handle_input(conn);
+			if (talloc_free(conn) == 0)
+				continue;
 
-				conn->pollfd_idx = -1;
-			}
+			talloc_increase_ref_count(conn);
+
+			if (conn->funcs->can_write(conn))
+				handle_output(conn);
+			if (talloc_free(conn) == 0)
+				continue;
+
+			conn->pollfd_idx = -1;
 		}
 
 		if (delayed_requests) {
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 6a6d0448e8..1467270476 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -86,8 +86,13 @@ struct delayed_request {
 };
 
 struct connection;
-typedef int connwritefn_t(struct connection *, const void *, unsigned int);
-typedef int connreadfn_t(struct connection *, void *, unsigned int);
+
+struct interface_funcs {
+	int (*write)(struct connection *, const void *, unsigned int);
+	int (*read)(struct connection *, void *, unsigned int);
+	bool (*can_write)(struct connection *);
+	bool (*can_read)(struct connection *);
+};
 
 struct connection
 {
@@ -131,9 +136,8 @@ struct connection
 	/* My watches. */
 	struct list_head watches;
 
-	/* Methods for communicating over this connection: write can be NULL */
-	connwritefn_t *write;
-	connreadfn_t *read;
+	/* Methods for communicating over this connection. */
+	struct interface_funcs *funcs;
 
 	/* Support for live update: connection id. */
 	unsigned int conn_id;
@@ -196,7 +200,7 @@ int write_node_raw(struct connection *conn, TDB_DATA *key, struct node *node,
 struct node *read_node(struct connection *conn, const void *ctx,
 		       const char *name);
 
-struct connection *new_connection(connwritefn_t *write, connreadfn_t *read);
+struct connection *new_connection(struct interface_funcs *funcs);
 struct connection *get_connection_by_id(unsigned int conn_id);
 void check_store(void);
 void corrupt(struct connection *conn, const char *fmt, ...);
@@ -254,9 +258,6 @@ void finish_daemonize(void);
 /* Open a pipe for signal handling */
 void init_pipe(int reopen_log_pipe[2]);
 
-int writefd(struct connection *conn, const void *data, unsigned int len);
-int readfd(struct connection *conn, void *data, unsigned int len);
-
 extern struct interface_funcs socket_funcs;
 extern xengnttab_handle **xgt_handle;
 
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 0c17937c0f..6e0fa6e861 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -172,6 +172,13 @@ static int readchn(struct connection *conn, void *data, unsigned int len)
 	return len;
 }
 
+static struct interface_funcs domain_funcs = {
+	.write = writechn,
+	.read = readchn,
+	.can_write = domain_can_write,
+	.can_read = domain_can_read,
+};
+
 static void *map_interface(domid_t domid)
 {
 	return xengnttab_map_grant_ref(*xgt_handle, domid,
@@ -389,7 +396,7 @@ static int new_domain(struct domain *domain, int port, bool restore)
 
 	domain->introduced = true;
 
-	domain->conn = new_connection(writechn, readchn);
+	domain->conn = new_connection(&domain_funcs);
 	if (!domain->conn)  {
 		errno = ENOMEM;
 		return errno;
@@ -1288,7 +1295,7 @@ void read_state_connection(const void *ctx, const void *state)
 	struct domain *domain, *tdomain;
 
 	if (sc->conn_type == XS_STATE_CONN_TYPE_SOCKET) {
-		conn = new_connection(writefd, readfd);
+		conn = new_connection(&socket_funcs);
 		if (!conn)
 			barf("error restoring connection");
 		conn->fd = sc->spec.socket_fd;
-- 
2.26.2


