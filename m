Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8C74B0C17
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 12:17:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269817.463938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI7R4-0005Yu-8q; Thu, 10 Feb 2022 11:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269817.463938; Thu, 10 Feb 2022 11:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI7R4-0005Wu-5M; Thu, 10 Feb 2022 11:16:26 +0000
Received: by outflank-mailman (input) for mailman id 269817;
 Thu, 10 Feb 2022 11:16:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jhle=SZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nI7R3-0005Wo-68
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 11:16:25 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1495abc-8a62-11ec-8eb8-a37418f5ba1a;
 Thu, 10 Feb 2022 12:16:23 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0F98D21117;
 Thu, 10 Feb 2022 11:16:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B962B13B43;
 Thu, 10 Feb 2022 11:16:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 71oQLAb0BGIACAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 10 Feb 2022 11:16:22 +0000
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
X-Inumbo-ID: e1495abc-8a62-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644491783; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vDMRqo0fy2QD6qLWKCmj2A2+bsGQr6Rovexh7Zkq0L8=;
	b=AoXamwc+0lfeLMq+EA5D6MHKTPSgdD0vkSIoDCVlrtumM0BK0LJnd2c8z1u5ejSTs3jPc1
	Yxo1bhBIV8R6wEHrBsV2zZNmZbIsdaVc19xEfmpdGLdsU1G+t+O074rJcFzdIQGX0yARSF
	TgbLz+SK3MAjxgJRgyZBhwIqxpOUQcM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/xenstore: add error indicator to ring page
Date: Thu, 10 Feb 2022 12:16:20 +0100
Message-Id: <20220210111620.5256-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case Xenstore is detecting a malicious ring page modification (e.g.
an invalid producer or consumer index set by a guest) it will ignore
the connection of that guest in future.

Add a new error field to the ring page indicating that case. Add a new
feature bit in order to signal the presence of that error field.

Move the ignore_connection() function to xenstored_domain.c in order
to be able to access the ring page for setting the error indicator.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/misc/xenstore-ring.txt       | 29 +++++++++++++++++++++
 tools/xenstore/xenstored_core.c   | 43 +++++++------------------------
 tools/xenstore/xenstored_core.h   |  1 -
 tools/xenstore/xenstored_domain.c | 34 +++++++++++++++++++++++-
 tools/xenstore/xenstored_domain.h |  1 +
 xen/include/public/io/xs_wire.h   |  9 +++++++
 6 files changed, 82 insertions(+), 35 deletions(-)

diff --git a/docs/misc/xenstore-ring.txt b/docs/misc/xenstore-ring.txt
index 16b4d0f5ac..ec5b8eb4b9 100644
--- a/docs/misc/xenstore-ring.txt
+++ b/docs/misc/xenstore-ring.txt
@@ -22,6 +22,7 @@ Offset  Length  Description
 2060    4       Output producer offset
 2064    4       Server feature bitmap
 2068    4       Connection state
+2072    4       Connection error indicator
 
 The Input data and Output data are circular buffers. Each buffer is
 associated with a pair of free-running offsets labelled "consumer" and
@@ -66,6 +67,7 @@ The following features are defined:
 Mask    Description
 -----------------------------------------------------------------
 1       Ring reconnection (see the ring reconnection feature below)
+2       Connection error indicator (see connection error feature below)
 
 The "Connection state" field is used to request a ring close and reconnect.
 The "Connection state" field only contains valid data if the server has
@@ -78,6 +80,18 @@ Value   Description
 1       Ring close and reconnect is in progress (see the "ring
         reconnection feature" described below)
 
+The "Connection error indicator" is used to let the server indicate it has
+detected some error that led to deactivation of the connection by the server.
+If the feature has been advertised then the "Connection error indicator" may
+take the following values:
+
+Value   Description
+-----------------------------------------------------------------
+0       No error, connection is valid
+1       Communication problems (event channel not functional)
+2       Inconsistent producer or consumer offset
+3       Protocol violation (client data package too long)
+
 The ring reconnection feature
 =============================
 
@@ -114,3 +128,18 @@ packet boundary.
 
 Note that only the guest may set the Connection state to 1 and only the
 server may set it back to 0.
+
+The connection error feature
+============================
+
+The connection error feature allows the server to signal error conditions
+leading to a stop of the communication with the client. In case such an error
+condition has occurred, the server will set the appropriate error condition in
+the Connection error indicator and will stop communication with the client.
+
+The server will discard any already read or written packets, in-flight
+requests, watches and transactions associated with the connection.
+
+Depending on the error cause it might be possible that a reconnect via the
+ring reconnection feature (if present) can be performed. There is no guarantee
+this will succeed.
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 91d3adccb1..6e4022e5da 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1455,35 +1455,6 @@ static struct {
 	[XS_DIRECTORY_PART]    = { "DIRECTORY_PART",    send_directory_part },
 };
 
-/*
- * Keep the connection alive but stop processing any new request or sending
- * reponse. This is to allow sending @releaseDomain watch event at the correct
- * moment and/or to allow the connection to restart (not yet implemented).
- *
- * All watches, transactions, buffers will be freed.
- */
-void ignore_connection(struct connection *conn)
-{
-	struct buffered_data *out, *tmp;
-
-	trace("CONN %p ignored\n", conn);
-
-	conn->is_ignored = true;
-	conn_delete_all_watches(conn);
-	conn_delete_all_transactions(conn);
-
-	list_for_each_entry_safe(out, tmp, &conn->out_list, list) {
-		list_del(&out->list);
-		talloc_free(out);
-	}
-
-	talloc_free(conn->in);
-	conn->in = NULL;
-	/* if this is a socket connection, drop it now */
-	if (conn->fd >= 0)
-		talloc_free(conn);
-}
-
 static const char *sockmsg_string(enum xsd_sockmsg_type type)
 {
 	if ((unsigned int)type < ARRAY_SIZE(wire_funcs) && wire_funcs[type].str)
@@ -1598,6 +1569,7 @@ static void handle_input(struct connection *conn)
 {
 	int bytes;
 	struct buffered_data *in;
+	unsigned int err;
 
 	if (!conn->in) {
 		conn->in = new_buffer(conn);
@@ -1612,8 +1584,10 @@ static void handle_input(struct connection *conn)
 		if (in->used != sizeof(in->hdr)) {
 			bytes = conn->funcs->read(conn, in->hdr.raw + in->used,
 						  sizeof(in->hdr) - in->used);
-			if (bytes < 0)
+			if (bytes < 0) {
+				err = XENSTORE_ERROR_RINGIDX;
 				goto bad_client;
+			}
 			in->used += bytes;
 			if (in->used != sizeof(in->hdr))
 				return;
@@ -1621,6 +1595,7 @@ static void handle_input(struct connection *conn)
 			if (in->hdr.msg.len > XENSTORE_PAYLOAD_MAX) {
 				syslog(LOG_ERR, "Client tried to feed us %i",
 				       in->hdr.msg.len);
+				err = XENSTORE_ERROR_PROTO;
 				goto bad_client;
 			}
 		}
@@ -1638,8 +1613,10 @@ static void handle_input(struct connection *conn)
 
 	bytes = conn->funcs->read(conn, in->buffer + in->used,
 				  in->hdr.msg.len - in->used);
-	if (bytes < 0)
+	if (bytes < 0) {
+		err = XENSTORE_ERROR_RINGIDX;
 		goto bad_client;
+	}
 
 	in->used += bytes;
 	if (in->used != in->hdr.msg.len)
@@ -1649,14 +1626,14 @@ static void handle_input(struct connection *conn)
 	return;
 
 bad_client:
-	ignore_connection(conn);
+	ignore_connection(conn, err);
 }
 
 static void handle_output(struct connection *conn)
 {
 	/* Ignore the connection if an error occured */
 	if (!write_messages(conn))
-		ignore_connection(conn);
+		ignore_connection(conn, XENSTORE_ERROR_RINGIDX);
 }
 
 struct connection *new_connection(const struct interface_funcs *funcs)
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 190d2447cd..742812a974 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -206,7 +206,6 @@ struct node *read_node(struct connection *conn, const void *ctx,
 
 struct connection *new_connection(const struct interface_funcs *funcs);
 struct connection *get_connection_by_id(unsigned int conn_id);
-void ignore_connection(struct connection *conn);
 void check_store(void);
 void corrupt(struct connection *conn, const char *fmt, ...);
 
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index d03c7d93a9..ae065fcbee 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -427,6 +427,38 @@ static void domain_conn_reset(struct domain *domain)
 	domain->interface->rsp_cons = domain->interface->rsp_prod = 0;
 }
 
+/*
+ * Keep the connection alive but stop processing any new request or sending
+ * reponse. This is to allow sending @releaseDomain watch event at the correct
+ * moment and/or to allow the connection to restart (not yet implemented).
+ *
+ * All watches, transactions, buffers will be freed.
+ */
+void ignore_connection(struct connection *conn, unsigned int err)
+{
+	struct buffered_data *out, *tmp;
+
+	trace("CONN %p ignored, reason %u\n", conn, err);
+
+	if (conn->domain && conn->domain->interface)
+		conn->domain->interface->error = err;
+
+	conn->is_ignored = true;
+	conn_delete_all_watches(conn);
+	conn_delete_all_transactions(conn);
+
+	list_for_each_entry_safe(out, tmp, &conn->out_list, list) {
+		list_del(&out->list);
+		talloc_free(out);
+	}
+
+	talloc_free(conn->in);
+	conn->in = NULL;
+	/* if this is a socket connection, drop it now */
+	if (conn->fd >= 0)
+		talloc_free(conn);
+}
+
 static struct domain *introduce_domain(const void *ctx,
 				       unsigned int domid,
 				       evtchn_port_t port, bool restore)
@@ -1305,7 +1337,7 @@ void read_state_connection(const void *ctx, const void *state)
 		 * dead. So mark it as ignored.
 		 */
 		if (!domain->port || !domain->interface)
-			ignore_connection(conn);
+			ignore_connection(conn, XENSTORE_ERROR_COMM);
 
 		if (sc->spec.ring.tdomid != DOMID_INVALID) {
 			tdomain = find_or_alloc_domain(ctx,
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index 1e929b8f8c..4a37de67a0 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -47,6 +47,7 @@ int do_reset_watches(struct connection *conn, struct buffered_data *in);
 void domain_init(int evtfd);
 void dom0_init(void);
 void domain_deinit(void);
+void ignore_connection(struct connection *conn, unsigned int err);
 
 /* Returns the implicit path of a connection (only domains have this) */
 const char *get_implicit_path(const struct connection *conn);
diff --git a/xen/include/public/io/xs_wire.h b/xen/include/public/io/xs_wire.h
index 4dd6632669..953a0050a3 100644
--- a/xen/include/public/io/xs_wire.h
+++ b/xen/include/public/io/xs_wire.h
@@ -124,6 +124,7 @@ struct xenstore_domain_interface {
     XENSTORE_RING_IDX rsp_cons, rsp_prod;
     uint32_t server_features; /* Bitmap of features supported by the server */
     uint32_t connection;
+    uint32_t error;
 };
 
 /* Violating this is very bad.  See docs/misc/xenstore.txt. */
@@ -135,11 +136,19 @@ struct xenstore_domain_interface {
 
 /* The ability to reconnect a ring */
 #define XENSTORE_SERVER_FEATURE_RECONNECTION 1
+/* The presence of the "error" field in the ring page */
+#define XENSTORE_SERVER_FEATURE_ERROR        2
 
 /* Valid values for the connection field */
 #define XENSTORE_CONNECTED 0 /* the steady-state */
 #define XENSTORE_RECONNECT 1 /* guest has initiated a reconnect */
 
+/* Valid values for the error field */
+#define XENSTORE_ERROR_NONE    0 /* No error */
+#define XENSTORE_ERROR_COMM    1 /* Communication problem */
+#define XENSTORE_ERROR_RINGIDX 2 /* Invalid ring index */
+#define XENSTORE_ERROR_PROTO   3 /* Protocol violation (payload too long) */
+
 #endif /* _XS_WIRE_H */
 
 /*
-- 
2.34.1


