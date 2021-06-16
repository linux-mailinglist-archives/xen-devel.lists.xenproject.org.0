Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6BB3A9DED
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 16:43:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143281.264132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWlQ-0005Oo-M1; Wed, 16 Jun 2021 14:43:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143281.264132; Wed, 16 Jun 2021 14:43:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWlQ-0005IK-IN; Wed, 16 Jun 2021 14:43:32 +0000
Received: by outflank-mailman (input) for mailman id 143281;
 Wed, 16 Jun 2021 14:43:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ltWlP-0005Fw-R6
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 14:43:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltWlO-0004Cu-NI; Wed, 16 Jun 2021 14:43:30 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltWlO-0007D0-EZ; Wed, 16 Jun 2021 14:43:30 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=NtHsRqFJ/9j0/O4AKrXX5mo/TDjv7sxBrn2GQynLUM8=; b=qy0Yl7SLc8nebkjHd6dzT+3G1
	HiAD+0b2NTEFeji3acrVAe2Er1QrWgZT+SNC8ysP/0aXBk06BVprwuINaQxS5DU09/MfPG9EETbDG
	YF16eBb8l9f1vbTl9ZM4QszPAkv/KsiPvfk8IZbmzb9ALDwU90mbTVsatqlQiDjC1LXPY=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	doebel@amazon.de,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 02/10] tools/xenstored: Introduce lu_get_connection() and use it
Date: Wed, 16 Jun 2021 15:43:16 +0100
Message-Id: <20210616144324.31652-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210616144324.31652-1-julien@xen.org>
References: <20210616144324.31652-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

At the moment, dump_state_buffered_data() is taking two connections
in parameters (one is the connection to dump, the other is the
connection used to request LU). The naming doesn't help to
distinguish (c vs conn) them and this already lead to several mistake
while modifying the function.

To remove the confusion, introduce an help lu_get_connection() that
will return the connection used to request LU and use it
in place of the existing parameter.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_control.c | 13 ++++++++++++-
 tools/xenstore/xenstored_control.h |  2 ++
 tools/xenstore/xenstored_core.c    |  7 +++----
 tools/xenstore/xenstored_core.h    |  1 -
 tools/xenstore/xenstored_domain.c  |  6 +++---
 tools/xenstore/xenstored_domain.h  |  2 +-
 6 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 0d57f9f9400d..d08a2b961432 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -104,6 +104,17 @@ static const char *lu_begin(struct connection *conn)
 
 	return NULL;
 }
+
+struct connection *lu_get_connection(void)
+{
+	return lu_status ? lu_status->conn : NULL;
+}
+
+#else
+struct connection *lu_get_connection(void)
+{
+	return NULL;
+}
 #endif
 
 struct cmd_s {
@@ -516,7 +527,7 @@ static const char *lu_dump_state(const void *ctx, struct connection *conn)
 	ret = dump_state_global(fp);
 	if (ret)
 		goto out;
-	ret = dump_state_connections(fp, conn);
+	ret = dump_state_connections(fp);
 	if (ret)
 		goto out;
 	ret = dump_state_special_nodes(fp);
diff --git a/tools/xenstore/xenstored_control.h b/tools/xenstore/xenstored_control.h
index aac61f05908f..6842b8d88760 100644
--- a/tools/xenstore/xenstored_control.h
+++ b/tools/xenstore/xenstored_control.h
@@ -18,3 +18,5 @@
 
 int do_control(struct connection *conn, struct buffered_data *in);
 void lu_read_state(void);
+
+struct connection *lu_get_connection(void);
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 883a1a582a60..607187361d84 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2369,14 +2369,13 @@ const char *dump_state_global(FILE *fp)
 
 /* Called twice: first with fp == NULL to get length, then for writing data. */
 const char *dump_state_buffered_data(FILE *fp, const struct connection *c,
-				     const struct connection *conn,
 				     struct xs_state_connection *sc)
 {
 	unsigned int len = 0, used;
 	struct buffered_data *out, *in = c->in;
 	bool partial = true;
 
-	if (in && c != conn) {
+	if (in && c != lu_get_connection()) {
 		len = in->inhdr ? in->used : sizeof(in->hdr);
 		if (fp && fwrite(&in->hdr, len, 1, fp) != 1)
 			return "Dump read data error";
@@ -2416,8 +2415,8 @@ const char *dump_state_buffered_data(FILE *fp, const struct connection *c,
 	}
 
 	/* Add "OK" for live-update command. */
-	if (c == conn) {
-		struct xsd_sockmsg msg = conn->in->hdr.msg;
+	if (c == lu_get_connection()) {
+		struct xsd_sockmsg msg = c->in->hdr.msg;
 
 		msg.len = sizeof("OK");
 		if (fp && fwrite(&msg, sizeof(msg), 1, fp) != 1)
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index bb36111ecc56..89ce155e755b 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -269,7 +269,6 @@ void set_tdb_key(const char *name, TDB_DATA *key);
 
 const char *dump_state_global(FILE *fp);
 const char *dump_state_buffered_data(FILE *fp, const struct connection *c,
-				     const struct connection *conn,
 				     struct xs_state_connection *sc);
 const char *dump_state_nodes(FILE *fp, const void *ctx);
 const char *dump_state_node_perms(FILE *fp, const struct xs_permissions *perms,
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 322b0dbca449..6d8d29cbe41c 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -1183,7 +1183,7 @@ void wrl_apply_debit_trans_commit(struct connection *conn)
 	wrl_apply_debit_actual(conn->domain);
 }
 
-const char *dump_state_connections(FILE *fp, struct connection *conn)
+const char *dump_state_connections(FILE *fp)
 {
 	const char *ret = NULL;
 	unsigned int conn_id = 1;
@@ -1209,7 +1209,7 @@ const char *dump_state_connections(FILE *fp, struct connection *conn)
 			sc.spec.socket_fd = c->fd;
 		}
 
-		ret = dump_state_buffered_data(NULL, c, conn, &sc);
+		ret = dump_state_buffered_data(NULL, c, &sc);
 		if (ret)
 			return ret;
 		head.length += sc.data_in_len + sc.data_out_len;
@@ -1219,7 +1219,7 @@ const char *dump_state_connections(FILE *fp, struct connection *conn)
 		if (fwrite(&sc, offsetof(struct xs_state_connection, data),
 			   1, fp) != 1)
 			return "Dump connection state error";
-		ret = dump_state_buffered_data(fp, c, conn, NULL);
+		ret = dump_state_buffered_data(fp, c, NULL);
 		if (ret)
 			return ret;
 		ret = dump_state_align(fp);
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
index cc5147d7e747..62ee471ea6aa 100644
--- a/tools/xenstore/xenstored_domain.h
+++ b/tools/xenstore/xenstored_domain.h
@@ -101,7 +101,7 @@ void wrl_log_periodic(struct wrl_timestampt now);
 void wrl_apply_debit_direct(struct connection *conn);
 void wrl_apply_debit_trans_commit(struct connection *conn);
 
-const char *dump_state_connections(FILE *fp, struct connection *conn);
+const char *dump_state_connections(FILE *fp);
 const char *dump_state_special_nodes(FILE *fp);
 
 void read_state_connection(const void *ctx, const void *state);
-- 
2.17.1


