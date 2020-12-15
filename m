Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0BA2DB1BE
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:47:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54678.95187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDTf-00020u-T9; Tue, 15 Dec 2020 16:47:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54678.95187; Tue, 15 Dec 2020 16:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDTf-00020L-OV; Tue, 15 Dec 2020 16:47:07 +0000
Received: by outflank-mailman (input) for mailman id 54678;
 Tue, 15 Dec 2020 16:47:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2CwE=FT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kpDK8-00066M-JH
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:37:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4fc910e-a22a-4aa1-ae90-3f3d3434ab4a;
 Tue, 15 Dec 2020 16:36:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0E8A1B282;
 Tue, 15 Dec 2020 16:36:12 +0000 (UTC)
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
X-Inumbo-ID: b4fc910e-a22a-4aa1-ae90-3f3d3434ab4a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608050172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MSf4+puKW484kP2G0bQfIEcisU7NAj/olnxKhB+8UZ8=;
	b=i50mjkOdP+7BifXtMXoGf6d55kFLh6ncbe1YDHsy/X3dZZclnkC3OLl2lbReNLUL65f38T
	tDSmxxL3EW2nVCqAA+X8Quk08b7kGxqy837Xc+UtmzJOwSdKyx0WvryeKyyylpmLcFTJZM
	yOxbqzoZNOml94++9HnrzXq+NxAvS4A=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v10 21/25] tools/xenstore: add read connection state for live update
Date: Tue, 15 Dec 2020 17:35:59 +0100
Message-Id: <20201215163603.21700-22-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215163603.21700-1-jgross@suse.com>
References: <20201215163603.21700-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the needed functions for reading connection state for live update.

As the connection is identified by a unique connection id in the state
records we need to add this to struct connection. Add a new function
to return the connection based on a connection id.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V2:
- fixed condition in introduce_domain() (Julien Grall)

V4:
- set pending data msg type to XS_INVALID (Julien Grall)
- add buffered read data (Julien Grall)

V5:
- really read buffered read data (Julien Grall)
- drop conn parameter from introduce_domain() (Paul Durrant)
- split pending write data into individual buffers

V6:
- rename "first" to "partial" (Paul Durrant)

V7:
- use local port from connection data

V8:
- remove dom0 special handling

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_control.c |   1 +
 tools/xenstore/xenstored_core.c    | 102 ++++++++++++++++++++++++++++-
 tools/xenstore/xenstored_core.h    |  10 +++
 tools/xenstore/xenstored_domain.c  |  60 +++++++++++++----
 tools/xenstore/xenstored_domain.h  |   2 +
 5 files changed, 162 insertions(+), 13 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index f6c4ab3d8a..4bf075ad79 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -522,6 +522,7 @@ void lu_read_state(void)
 			read_state_global(ctx, head + 1);
 			break;
 		case XS_STATE_TYPE_CONN:
+			read_state_connection(ctx, head + 1);
 			break;
 		case XS_STATE_TYPE_WATCH:
 			break;
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 5922a03a98..2ad1cc8d44 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1532,12 +1532,35 @@ struct connection *new_connection(connwritefn_t *write, connreadfn_t *read)
 	return new;
 }
 
+struct connection *get_connection_by_id(unsigned int conn_id)
+{
+	struct connection *conn;
+
+	list_for_each_entry(conn, &connections, list)
+		if (conn->conn_id == conn_id)
+			return conn;
+
+	return NULL;
+}
+
 #ifdef NO_SOCKETS
 static void accept_connection(int sock)
 {
 }
+
+int writefd(struct connection *conn, const void *data, unsigned int len)
+{
+	errno = EBADF;
+	return -1;
+}
+
+int readfd(struct connection *conn, void *data, unsigned int len)
+{
+	errno = EBADF;
+	return -1;
+}
 #else
-static int writefd(struct connection *conn, const void *data, unsigned int len)
+int writefd(struct connection *conn, const void *data, unsigned int len)
 {
 	int rc;
 
@@ -1553,7 +1576,7 @@ static int writefd(struct connection *conn, const void *data, unsigned int len)
 	return rc;
 }
 
-static int readfd(struct connection *conn, void *data, unsigned int len)
+int readfd(struct connection *conn, void *data, unsigned int len)
 {
 	int rc;
 
@@ -2460,6 +2483,81 @@ void read_state_global(const void *ctx, const void *state)
 	domain_init(glb->evtchn_fd);
 }
 
+static void add_buffered_data(struct buffered_data *bdata,
+			      struct connection *conn, const uint8_t *data,
+			      unsigned int len)
+{
+	bdata->hdr.msg.len = len;
+	if (len <= DEFAULT_BUFFER_SIZE)
+		bdata->buffer = bdata->default_buffer;
+	else
+		bdata->buffer = talloc_array(bdata, char, len);
+	if (!bdata->buffer)
+		barf("error restoring buffered data");
+
+	memcpy(bdata->buffer, data, len);
+
+	/* Queue for later transmission. */
+	list_add_tail(&bdata->list, &conn->out_list);
+}
+
+void read_state_buffered_data(const void *ctx, struct connection *conn,
+			      const struct xs_state_connection *sc)
+{
+	struct buffered_data *bdata;
+	const uint8_t *data;
+	unsigned int len;
+	bool partial = sc->data_resp_len;
+
+	if (sc->data_in_len) {
+		bdata = new_buffer(conn);
+		if (!bdata)
+			barf("error restoring read data");
+		if (sc->data_in_len < sizeof(bdata->hdr)) {
+			bdata->inhdr = true;
+			memcpy(&bdata->hdr, sc->data, sc->data_in_len);
+			bdata->used = sc->data_in_len;
+		} else {
+			bdata->inhdr = false;
+			memcpy(&bdata->hdr, sc->data, sizeof(bdata->hdr));
+			if (bdata->hdr.msg.len <= DEFAULT_BUFFER_SIZE)
+				bdata->buffer = bdata->default_buffer;
+			else
+				bdata->buffer = talloc_array(bdata, char,
+							bdata->hdr.msg.len);
+			if (!bdata->buffer)
+				barf("Error allocating in buffer");
+			bdata->used = sc->data_in_len - sizeof(bdata->hdr);
+			memcpy(bdata->buffer, sc->data + sizeof(bdata->hdr),
+			       bdata->used);
+		}
+
+		conn->in = bdata;
+	}
+
+	for (data = sc->data + sc->data_in_len;
+	     data < sc->data + sc->data_in_len + sc->data_out_len;
+	     data += len) {
+		bdata = new_buffer(conn);
+		if (!bdata)
+			barf("error restoring buffered data");
+		if (partial) {
+			bdata->inhdr = false;
+			/* Make trace look nice. */
+			bdata->hdr.msg.type = XS_INVALID;
+			len = sc->data_resp_len;
+			add_buffered_data(bdata, conn, data, len);
+			partial = false;
+			continue;
+		}
+
+		memcpy(&bdata->hdr, data, sizeof(bdata->hdr));
+		data += sizeof(bdata->hdr);
+		len = bdata->hdr.msg.len;
+		add_buffered_data(bdata, conn, data, len);
+	}
+}
+
 /*
  * Local variables:
  *  mode: C
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 6c9d838f11..cb256626fe 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -118,6 +118,9 @@ struct connection
 	/* Methods for communicating over this connection: write can be NULL */
 	connwritefn_t *write;
 	connreadfn_t *read;
+
+	/* Support for live update: connection id. */
+	unsigned int conn_id;
 };
 extern struct list_head connections;
 
@@ -178,6 +181,7 @@ struct node *read_node(struct connection *conn, const void *ctx,
 		       const char *name);
 
 struct connection *new_connection(connwritefn_t *write, connreadfn_t *read);
+struct connection *get_connection_by_id(unsigned int conn_id);
 void check_store(void);
 void corrupt(struct connection *conn, const char *fmt, ...);
 enum xs_perm_type perm_for_conn(struct connection *conn,
@@ -229,6 +233,10 @@ void finish_daemonize(void);
 /* Open a pipe for signal handling */
 void init_pipe(int reopen_log_pipe[2]);
 
+int writefd(struct connection *conn, const void *data, unsigned int len);
+int readfd(struct connection *conn, void *data, unsigned int len);
+
+extern struct interface_funcs socket_funcs;
 extern xengnttab_handle **xgt_handle;
 
 int remember_string(struct hashtable *hash, const char *str);
@@ -245,6 +253,8 @@ const char *dump_state_node_perms(FILE *fp, struct xs_state_node *sn,
 				  unsigned int n_perms);
 
 void read_state_global(const void *ctx, const void *state);
+void read_state_buffered_data(const void *ctx, struct connection *conn,
+			      const struct xs_state_connection *sc);
 
 #endif /* _XENSTORED_CORE_H */
 
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 94dd501a3b..0cd8234bd1 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -355,7 +355,7 @@ static struct domain *find_or_alloc_domain(const void *ctx, unsigned int domid)
 	return domain ? : alloc_domain(ctx, domid);
 }
 
-static int new_domain(struct domain *domain, int port)
+static int new_domain(struct domain *domain, int port, bool restore)
 {
 	int rc;
 
@@ -369,11 +369,16 @@ static int new_domain(struct domain *domain, int port)
 
 	wrl_domain_new(domain);
 
-	/* Tell kernel we're interested in this event. */
-	rc = xenevtchn_bind_interdomain(xce_handle, domain->domid, port);
-	if (rc == -1)
-		return errno;
-	domain->port = rc;
+	if (restore)
+		domain->port = port;
+	else {
+		/* Tell kernel we're interested in this event. */
+		rc = xenevtchn_bind_interdomain(xce_handle, domain->domid,
+						port);
+		if (rc == -1)
+			return errno;
+		domain->port = rc;
+	}
 
 	domain->introduced = true;
 
@@ -423,7 +428,7 @@ static void domain_conn_reset(struct domain *domain)
 
 static struct domain *introduce_domain(const void *ctx,
 				       unsigned int domid,
-				       evtchn_port_t port)
+				       evtchn_port_t port, bool restore)
 {
 	struct domain *domain;
 	int rc;
@@ -439,7 +444,7 @@ static struct domain *introduce_domain(const void *ctx,
 					     : map_interface(domid);
 		if (!interface)
 			return NULL;
-		if (new_domain(domain, port)) {
+		if (new_domain(domain, port, restore)) {
 			rc = errno;
 			if (is_master_domain)
 				unmap_xenbus(interface);
@@ -453,7 +458,7 @@ static struct domain *introduce_domain(const void *ctx,
 		/* Now domain belongs to its connection. */
 		talloc_steal(domain->conn, domain);
 
-		if (!is_master_domain)
+		if (!is_master_domain && !restore)
 			fire_watches(NULL, ctx, "@introduceDomain", NULL,
 				     false, NULL);
 	} else {
@@ -486,7 +491,7 @@ int do_introduce(struct connection *conn, struct buffered_data *in)
 	if (port <= 0)
 		return EINVAL;
 
-	domain = introduce_domain(in, domid, port);
+	domain = introduce_domain(in, domid, port, false);
 	if (!domain)
 		return errno;
 
@@ -715,7 +720,7 @@ void dom0_init(void)
 	if (port == -1)
 		barf_perror("Failed to initialize dom0 port");
 
-	dom0 = introduce_domain(NULL, xenbus_master_domid(), port);
+	dom0 = introduce_domain(NULL, xenbus_master_domid(), port, false);
 	if (!dom0)
 		barf_perror("Failed to initialize dom0");
 
@@ -1261,6 +1266,39 @@ const char *dump_state_special_nodes(FILE *fp)
 	return ret;
 }
 
+void read_state_connection(const void *ctx, const void *state)
+{
+	const struct xs_state_connection *sc = state;
+	struct connection *conn;
+	struct domain *domain, *tdomain;
+
+	if (sc->conn_type == XS_STATE_CONN_TYPE_SOCKET) {
+		conn = new_connection(writefd, readfd);
+		if (!conn)
+			barf("error restoring connection");
+		conn->fd = sc->spec.socket_fd;
+	} else {
+		domain = introduce_domain(ctx, sc->spec.ring.domid,
+					  sc->spec.ring.evtchn, true);
+		if (!domain)
+			barf("domain allocation error");
+
+		if (sc->spec.ring.tdomid != DOMID_INVALID) {
+			tdomain = find_or_alloc_domain(ctx,
+						       sc->spec.ring.tdomid);
+			if (!tdomain)
+				barf("target domain allocation error");
+			talloc_reference(domain->conn, tdomain->conn);
+			domain->conn->target = tdomain->conn;
+		}
+		conn = domain->conn;
+	}
+
+	conn->conn_id = sc->conn_id;
+
+	read_state_buffered_data(ctx, conn, sc);
+}
+
 /*
  * Local variables:
  *  mode: C
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index b20269b038..8f3b4e0f8b 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -101,4 +101,6 @@ void wrl_apply_debit_trans_commit(struct connection *conn);
 const char *dump_state_connections(FILE *fp, struct connection *conn);
 const char *dump_state_special_nodes(FILE *fp);
 
+void read_state_connection(const void *ctx, const void *state);
+
 #endif /* _XENSTORED_DOMAIN_H */
-- 
2.26.2


