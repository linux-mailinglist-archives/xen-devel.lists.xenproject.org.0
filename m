Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKBKHVXBs2mEagAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:48:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 052AA27EF86
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:48:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253371.1549670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0xG1-0005b2-9b; Fri, 13 Mar 2026 07:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253371.1549670; Fri, 13 Mar 2026 07:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0xG1-0005ZK-5d; Fri, 13 Mar 2026 07:48:29 +0000
Received: by outflank-mailman (input) for mailman id 1253371;
 Fri, 13 Mar 2026 07:48:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CqhT=BN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0xFz-0003TG-Gi
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 07:48:27 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04da738e-1eb1-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 08:48:26 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 59CFD4D656;
 Fri, 13 Mar 2026 07:48:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3AB7C403F6;
 Fri, 13 Mar 2026 07:48:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ESM7DUrBs2nVGAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 13 Mar 2026 07:48:26 +0000
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
X-Inumbo-ID: 04da738e-1eb1-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773388106; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h47Wy2/aIsr5uL9mIHAZhtR7cjBvlkykAr4Iab8gBlE=;
	b=MhtAHwKXqc3JN+tOPK19oGJl6h4eekw1GpDYzkcQIdE2ZH4KisVZgAEtQ2MrZBfw4LwVIQ
	7GyZRDsoT4nzTrjm+lE5OVyd/MxwogcENtORAlue2VlfHmq5OyN+X1AZIJoNcLTzZBO7Ak
	KUksYaJY6OFzhh7eA7lMX+jPtS4BJPM=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773388106; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h47Wy2/aIsr5uL9mIHAZhtR7cjBvlkykAr4Iab8gBlE=;
	b=MhtAHwKXqc3JN+tOPK19oGJl6h4eekw1GpDYzkcQIdE2ZH4KisVZgAEtQ2MrZBfw4LwVIQ
	7GyZRDsoT4nzTrjm+lE5OVyd/MxwogcENtORAlue2VlfHmq5OyN+X1AZIJoNcLTzZBO7Ak
	KUksYaJY6OFzhh7eA7lMX+jPtS4BJPM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 6/8] tools/xenstored: replace the fire_watches() exact parameter
Date: Fri, 13 Mar 2026 08:47:49 +0100
Message-ID: <20260313074751.2904215-7-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313074751.2904215-1-jgross@suse.com>
References: <20260313074751.2904215-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 052AA27EF86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Today fire_watches() has the boolean "exact" parameter specifying how
the matching of the modified node with registered watches is to be
handled (only the exact node name is matching or all nodes being
in the subtree beneath the watched node).

For the handling of <special-watch>/<domid> watch events 2 additional
matching possibility needs to be added, as those events should only
be delivered to clients having requested such events, either by
watching <special-watch> with the depth=1 parameter, or by directly
watching for <special-watch>/<domid>, while the traditional special
watch events should NOT delivered to those watchers.

For this purpose rename the "exact" parameter to "match" and make it
an enum with four possible values.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/core.c        | 12 +++++-----
 tools/xenstored/transaction.c | 14 +++++++-----
 tools/xenstored/transaction.h |  4 +++-
 tools/xenstored/watch.c       | 42 +++++++++++++++++++++++++----------
 tools/xenstored/watch.h       |  9 +++++++-
 5 files changed, 55 insertions(+), 26 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 09f1390f14..109e319f8c 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -1612,7 +1612,7 @@ static int do_write(const void *ctx, struct connection *conn,
 			return errno;
 	}
 
-	fire_watches(conn, ctx, name, node, false, NULL);
+	fire_watches(conn, ctx, name, node, MATCH_SUBTREE, NULL);
 	send_ack(conn, XS_WRITE);
 
 	return 0;
@@ -1636,7 +1636,7 @@ static int do_mkdir(const void *ctx, struct connection *conn,
 		node = create_node(conn, ctx, name, NULL, 0);
 		if (!node)
 			return errno;
-		fire_watches(conn, ctx, name, node, false, NULL);
+		fire_watches(conn, ctx, name, node, MATCH_SUBTREE, NULL);
 	}
 	send_ack(conn, XS_MKDIR);
 
@@ -1682,7 +1682,7 @@ static int delnode_sub(const void *ctx, struct connection *conn,
 		       struct node *node, void *arg)
 {
 	const char *root = arg;
-	bool watch_exact;
+	enum watch_match watch_match;
 	int ret;
 	const char *db_name;
 
@@ -1702,8 +1702,8 @@ static int delnode_sub(const void *ctx, struct connection *conn,
 	 * This fine as we are single threaded and the next possible read will
 	 * be handled only after the node has been really removed.
 	*/
-	watch_exact = strcmp(root, node->name);
-	fire_watches(conn, ctx, node->name, node, watch_exact, NULL);
+	watch_match = strcmp(root, node->name) ? MATCH_EXACT : MATCH_SUBTREE;
+	fire_watches(conn, ctx, node->name, node, watch_match, NULL);
 
 	return WALK_TREE_RM_CHILDENTRY;
 }
@@ -1857,7 +1857,7 @@ static int do_set_perms(const void *ctx, struct connection *conn,
 	if (write_node(conn, node, NODE_MODIFY, false))
 		return errno;
 
-	fire_watches(conn, ctx, name, node, false, &old_perms);
+	fire_watches(conn, ctx, name, node, MATCH_SUBTREE, &old_perms);
 	send_ack(conn, XS_SET_PERMS);
 
 	return 0;
diff --git a/tools/xenstored/transaction.c b/tools/xenstored/transaction.c
index ccf93a1132..7e15aa8a2c 100644
--- a/tools/xenstored/transaction.c
+++ b/tools/xenstored/transaction.c
@@ -134,7 +134,7 @@ struct accessed_node
 
 	/* Watch event flags. */
 	bool fire_watch;
-	bool watch_exact;
+	enum watch_match watch_match;
 };
 
 struct transaction
@@ -327,8 +327,10 @@ err:
  * A watch event should be fired for a node modified inside a transaction.
  * Set the corresponding information. A non-exact event is replacing an exact
  * one, but not the other way round.
+ * No special watch handling needed here, so MATCH_DEPTH is no issue.
  */
-void queue_watches(struct connection *conn, const char *name, bool watch_exact)
+void queue_watches(struct connection *conn, const char *name,
+		   enum watch_match watch_match)
 {
 	struct accessed_node *i;
 
@@ -340,9 +342,9 @@ void queue_watches(struct connection *conn, const char *name, bool watch_exact)
 
 	if (!i->fire_watch) {
 		i->fire_watch = true;
-		i->watch_exact = watch_exact;
-	} else if (!watch_exact) {
-		i->watch_exact = false;
+		i->watch_match = watch_match;
+	} else if (watch_match == MATCH_SUBTREE) {
+		i->watch_match = MATCH_SUBTREE;
 	}
 }
 
@@ -419,7 +421,7 @@ static int finalize_transaction(struct connection *conn,
 				db_delete(conn, i->node, NULL);
 		}
 		if (i->fire_watch)
-			fire_watches(conn, trans, i->node, NULL, i->watch_exact,
+			fire_watches(conn, trans, i->node, NULL, i->watch_match,
 				     i->perms.p ? &i->perms : NULL);
 
 		list_del(&i->list);
diff --git a/tools/xenstored/transaction.h b/tools/xenstored/transaction.h
index 90435b4fc9..b4f5f757e2 100644
--- a/tools/xenstored/transaction.h
+++ b/tools/xenstored/transaction.h
@@ -18,6 +18,7 @@
 #ifndef _XENSTORED_TRANSACTION_H
 #define _XENSTORED_TRANSACTION_H
 #include "core.h"
+#include "watch.h"
 
 enum node_access_type {
     NODE_ACCESS_READ,
@@ -44,7 +45,8 @@ int __must_check access_node(struct connection *conn, struct node *node,
                              enum node_access_type type, const char **db_name);
 
 /* Queue watches for a modified node. */
-void queue_watches(struct connection *conn, const char *name, bool watch_exact);
+void queue_watches(struct connection *conn, const char *name,
+		   enum watch_match watch_match);
 
 /* Prepend the transaction to name if appropriate. */
 const char *transaction_prepend(struct connection *conn, const char *name);
diff --git a/tools/xenstored/watch.c b/tools/xenstored/watch.c
index 5de386370d..342b283285 100644
--- a/tools/xenstored/watch.c
+++ b/tools/xenstored/watch.c
@@ -128,7 +128,8 @@ static bool watch_permitted(struct connection *conn, const void *ctx,
  * watch event, too.
  */
 void fire_watches(struct connection *conn, const void *ctx, const char *name,
-		  const struct node *node, bool exact, struct node_perms *perms)
+		  const struct node *node, enum watch_match match,
+		  struct node_perms *perms)
 {
 	struct connection *i;
 	struct buffered_data *req;
@@ -136,7 +137,7 @@ void fire_watches(struct connection *conn, const void *ctx, const char *name,
 
 	/* During transactions, don't fire watches, but queue them. */
 	if (conn && conn->transaction) {
-		queue_watches(conn, name, exact);
+		queue_watches(conn, name, match);
 		return;
 	}
 
@@ -148,17 +149,34 @@ void fire_watches(struct connection *conn, const void *ctx, const char *name,
 			continue;
 
 		list_for_each_entry(watch, &i->watches, list) {
-			if (exact) {
-				if (streq(name, watch->node))
-					send_event(req, i,
-						   get_watch_path(watch, name),
-						   watch->token);
-			} else {
-				if (is_child(name, watch->node, watch->depth))
-					send_event(req, i,
-						   get_watch_path(watch, name),
-						   watch->token);
+			bool send = false;
+
+			switch (match) {
+			case MATCH_EXACT:
+				send = streq(name, watch->node);
+				break;
+
+			case MATCH_SUBTREE:
+				send = is_child(name, watch->node,
+						watch->depth);
+				break;
+
+			case MATCH_DEPTH:
+				send = streq(name, watch->node) ||
+				       (watch->depth > 0 &&
+					is_child(name, watch->node,
+						 watch->depth));
+				break;
+
+			case MATCH_NODEPTH:
+				send = streq(name, watch->node) &&
+				       watch->depth < 0;
+				break;
 			}
+
+			if (send)
+				send_event(req, i, get_watch_path(watch, name),
+					   watch->token);
 		}
 	}
 }
diff --git a/tools/xenstored/watch.h b/tools/xenstored/watch.h
index afdfdc6b2f..692343389f 100644
--- a/tools/xenstored/watch.h
+++ b/tools/xenstored/watch.h
@@ -27,8 +27,15 @@ int do_unwatch(const void *ctx, struct connection *conn,
 	       struct buffered_data *in);
 
 /* Fire all watches: !exact means all the children are affected (ie. rm). */
+enum watch_match {
+	MATCH_EXACT,
+	MATCH_SUBTREE,
+	MATCH_DEPTH,	/* watches with depth > 0, MATCH_SUBTREE semantics */
+	MATCH_NODEPTH	/* watches with no depth, MATCH_EXACT semantics */
+};
+
 void fire_watches(struct connection *conn, const void *tmp, const char *name,
-		  const struct node *node, bool exact,
+		  const struct node *node, enum watch_match match,
 		  struct node_perms *perms);
 
 void conn_delete_all_watches(struct connection *conn);
-- 
2.53.0


