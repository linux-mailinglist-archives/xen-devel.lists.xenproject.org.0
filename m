Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INSaL0nBs2lQagAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:48:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF0127EF6F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:48:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253354.1549652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0xFq-0004mt-Pv; Fri, 13 Mar 2026 07:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253354.1549652; Fri, 13 Mar 2026 07:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0xFq-0004jW-Ll; Fri, 13 Mar 2026 07:48:18 +0000
Received: by outflank-mailman (input) for mailman id 1253354;
 Fri, 13 Mar 2026 07:48:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CqhT=BN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0xFo-0003TG-G4
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 07:48:16 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe548862-1eb0-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 08:48:15 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 79DA24D656;
 Fri, 13 Mar 2026 07:48:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5794B403F6;
 Fri, 13 Mar 2026 07:48:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id NQ08FD/Bs2m5GAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 13 Mar 2026 07:48:15 +0000
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
X-Inumbo-ID: fe548862-1eb0-11f1-b164-2bf370ae4941
Authentication-Results: smtp-out1.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 4/8] tools/xenstored: add depth information to watches
Date: Fri, 13 Mar 2026 08:47:47 +0100
Message-ID: <20260313074751.2904215-5-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313074751.2904215-1-jgross@suse.com>
References: <20260313074751.2904215-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spamd-Result: default: False [2.51 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[suse.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 9BF0127EF6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the depth for matching subdirectories of a watch to the watch
handling. A depth value of -1 is used for the current model of no
limit.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/lu.c    |   3 ++
 tools/xenstored/watch.c | 110 ++++++++++++++++++++++++++++------------
 tools/xenstored/watch.h |   1 +
 3 files changed, 81 insertions(+), 33 deletions(-)

diff --git a/tools/xenstored/lu.c b/tools/xenstored/lu.c
index eaffdbc69e..7d9f086a59 100644
--- a/tools/xenstored/lu.c
+++ b/tools/xenstored/lu.c
@@ -183,6 +183,9 @@ void lu_read_state(void)
 		case XS_STATE_TYPE_WATCH:
 			read_state_watch(ctx, state.buf);
 			break;
+		case XS_STATE_TYPE_WATCH_EXT:
+			read_state_watch_ext(ctx, state.buf);
+			break;
 		case XS_STATE_TYPE_TA:
 			xprintf("live-update: ignore transaction record\n");
 			break;
diff --git a/tools/xenstored/watch.c b/tools/xenstored/watch.c
index 36e4d33f22..3f1049911b 100644
--- a/tools/xenstored/watch.c
+++ b/tools/xenstored/watch.c
@@ -39,26 +39,35 @@ struct watch
 	/* Offset into path for skipping prefix (used for relative paths). */
 	unsigned int prefix_len;
 
+	int depth;	/* -1: no depth limit. */
 	char *token;
 	char *node;
 };
 
 /* Is child a subnode of parent, or equal? */
-static bool is_child(const char *child, const char *parent)
+static bool is_child(const char *child, const char *parent, int depth)
 {
-	unsigned int len = strlen(parent);
-
-	/*
-	 * / should really be "" for this algorithm to work, but that's a
-	 * usability nightmare.
-	 */
-	if (streq(parent, "/"))
-		return true;
+	unsigned int len = strlen(parent);	/* len == 1 if parent is "/". */
+	unsigned int sub_levels = (len == 1) ? 1 : 0;
 
 	if (strncmp(child, parent, len) != 0)
 		return false;
 
-	return child[len] == '/' || child[len] == '\0';
+	if (child[len] != '/' && child[len] != '\0' && len > 1)
+		return false;
+
+	if (depth < 0 || child[len] == '\0')
+		return true;
+
+	while (sub_levels <= depth) {
+		if (child[len] == '\0')
+			return true;
+		if (child[len] == '/')
+			sub_levels++;
+		len++;
+	}
+
+	return false;
 }
 
 static const char *get_watch_path(const struct watch *watch, const char *name)
@@ -145,7 +154,7 @@ void fire_watches(struct connection *conn, const void *ctx, const char *name,
 						   get_watch_path(watch, name),
 						   watch->token);
 			} else {
-				if (is_child(name, watch->node))
+				if (is_child(name, watch->node, watch->depth))
 					send_event(req, i,
 						   get_watch_path(watch, name),
 						   watch->token);
@@ -170,7 +179,7 @@ static int check_watch_path(struct connection *conn, const void *ctx,
 }
 
 static struct watch *add_watch(struct connection *conn, const char *path,
-			       const char *token, bool relative,
+			       const char *token, int depth, bool relative,
 			       bool no_quota_check)
 {
 	struct watch *watch;
@@ -178,6 +187,7 @@ static struct watch *add_watch(struct connection *conn, const char *path,
 	watch = talloc(conn, struct watch);
 	if (!watch)
 		goto nomem;
+	watch->depth = depth;
 	watch->node = talloc_strdup(watch, path);
 	watch->token = talloc_strdup(watch, token);
 	if (!watch->node || !watch->token)
@@ -204,6 +214,7 @@ int do_watch(const void *ctx, struct connection *conn, struct buffered_data *in)
 {
 	struct watch *watch;
 	const char *vec[2];
+	int depth = -1;
 	bool relative;
 
 	if (get_strings(in, vec, ARRAY_SIZE(vec)) != ARRAY_SIZE(vec))
@@ -223,7 +234,7 @@ int do_watch(const void *ctx, struct connection *conn, struct buffered_data *in)
 	if (domain_check_quota_add(conn->domain, ACC_WATCH, 1))
 		return ENOSPC;
 
-	watch = add_watch(conn, vec[0], vec[1], relative, false);
+	watch = add_watch(conn, vec[0], vec[1], depth, relative, false);
 	if (!watch)
 		return errno;
 
@@ -287,28 +298,47 @@ const char *dump_state_watches(FILE *fp, struct connection *conn,
 	const char *ret = NULL;
 	struct watch *watch;
 	struct xs_state_watch sw;
+	struct xs_state_watch_ext swe;
 	struct xs_state_record_header head;
 	const char *path;
-
-	head.type = XS_STATE_TYPE_WATCH;
+	size_t path_len, token_len;
 
 	list_for_each_entry(watch, &conn->watches, list) {
-		head.length = sizeof(sw);
-
-		sw.conn_id = conn_id;
 		path = get_watch_path(watch, watch->node);
-		sw.path_length = strlen(path) + 1;
-		sw.token_length = strlen(watch->token) + 1;
-		head.length += sw.path_length + sw.token_length;
+		path_len = strlen(path) + 1;
+		token_len = strlen(watch->token) + 1;
+
+		if (watch->depth >= 0) {
+			head.type = XS_STATE_TYPE_WATCH_EXT;
+			head.length = sizeof(swe);
+			swe.conn_id = conn_id;
+			swe.path_length = path_len;
+			swe.token_length = token_len;
+			swe.depth = watch->depth;
+		} else {
+			head.type = XS_STATE_TYPE_WATCH;
+			head.length = sizeof(sw);
+			sw.conn_id = conn_id;
+			sw.path_length = path_len;
+			sw.token_length = token_len;
+		}
+
+		head.length += path_len + token_len;
 		head.length = ROUNDUP(head.length, 3);
 		if (fwrite(&head, sizeof(head), 1, fp) != 1)
 			return "Dump watch state error";
-		if (fwrite(&sw, sizeof(sw), 1, fp) != 1)
-			return "Dump watch state error";
 
-		if (fwrite(path, sw.path_length, 1, fp) != 1)
+		if (watch->depth >= 0) {
+			if (fwrite(&swe, sizeof(sw), 1, fp) != 1)
+				return "Dump watch state ext error";
+		} else {
+			if (fwrite(&sw, sizeof(sw), 1, fp) != 1)
+				return "Dump watch state error";
+		}
+
+		if (fwrite(path, path_len, 1, fp) != 1)
 			return "Dump watch path error";
-		if (fwrite(watch->token, sw.token_length, 1, fp) != 1)
+		if (fwrite(watch->token, token_len, 1, fp) != 1)
 			return "Dump watch token error";
 
 		ret = dump_state_align(fp);
@@ -319,27 +349,41 @@ const char *dump_state_watches(FILE *fp, struct connection *conn,
 	return ret;
 }
 
-void read_state_watch(const void *ctx, const void *state)
+static void process_state_watch(const void *ctx, unsigned int conn_id,
+				const char *path, const char *token,
+				int depth)
 {
-	const struct xs_state_watch *sw = state;
 	struct connection *conn;
-	const char *path, *token;
 	bool relative;
 
-	conn = get_connection_by_id(sw->conn_id);
+	conn = get_connection_by_id(conn_id);
 	if (!conn)
 		barf("connection not found for read watch");
 
-	path = (char *)sw->data;
-	token = path + sw->path_length;
-
 	/* Don't check success, we want the relative information only. */
 	check_watch_path(conn, ctx, &path, &relative);
 	if (!path)
 		barf("allocation error for read watch");
 
-	if (!add_watch(conn, path, token, relative, true))
+	if (!add_watch(conn, path, token, depth, relative, true))
 		barf("error adding watch");
+
+}
+
+void read_state_watch(const void *ctx, const void *state)
+{
+	const struct xs_state_watch *sw = state;
+
+	process_state_watch(ctx, sw->conn_id, (char *)sw->data,
+			    (char *)sw->data + sw->path_length, -1);
+}
+
+void read_state_watch_ext(const void *ctx, const void *state)
+{
+	const struct xs_state_watch_ext *swe = state;
+
+	process_state_watch(ctx, swe->conn_id, (char *)swe->data,
+			    (char *)swe->data + swe->path_length, swe->depth);
 }
 
 /*
diff --git a/tools/xenstored/watch.h b/tools/xenstored/watch.h
index d9ac6a334a..afdfdc6b2f 100644
--- a/tools/xenstored/watch.h
+++ b/tools/xenstored/watch.h
@@ -37,5 +37,6 @@ const char *dump_state_watches(FILE *fp, struct connection *conn,
 			       unsigned int conn_id);
 
 void read_state_watch(const void *ctx, const void *state);
+void read_state_watch_ext(const void *ctx, const void *state);
 
 #endif /* _XENSTORED_WATCH_H */
-- 
2.53.0


