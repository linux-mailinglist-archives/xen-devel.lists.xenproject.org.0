Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIGGIYEq52mo4wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:42:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D982437C9D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:42:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288449.1568747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5kw-00051l-0A; Tue, 21 Apr 2026 07:42:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288449.1568747; Tue, 21 Apr 2026 07:42:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5kv-0004yj-Sx; Tue, 21 Apr 2026 07:42:49 +0000
Received: by outflank-mailman (input) for mailman id 1288449;
 Tue, 21 Apr 2026 07:42:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wF5ku-0004x4-MP
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 07:42:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF5ku-00G0jJ-2c
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 09:42:48 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69e72a76-bab6-0a2a0a5309dd-0a2a450bd602-14
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:42:48 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69e72a77-212f-0a2a450b0019-c387df82b0ee-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:42:47 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3F1CD6A7F5;
 Tue, 21 Apr 2026 07:42:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1AD84593AF;
 Tue, 21 Apr 2026 07:42:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0bd2BXcq52krNwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 21 Apr 2026 07:42:47 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1776757367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7AkzXWRBIIt5yu/Uu/RZC1gnrUK51kfU1qHMPosN5b0=;
	b=BDy/bREWcKSE47EY3KAPrl1DQ27xdp63lLRJ1G8uK14nn7TKwPs9M3DBzUe2AV8upebf+4
	9OuP4oYSuZ0oXyn39a1xGXMETbk3uOwR1cGPee3Bb1obAJ4vkpbaAuybW9Zk+riTJ/N1zP
	VzYwNdjjQo+opTKH8g2M/moOyAM8V10=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1776757367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7AkzXWRBIIt5yu/Uu/RZC1gnrUK51kfU1qHMPosN5b0=;
	b=BDy/bREWcKSE47EY3KAPrl1DQ27xdp63lLRJ1G8uK14nn7TKwPs9M3DBzUe2AV8upebf+4
	9OuP4oYSuZ0oXyn39a1xGXMETbk3uOwR1cGPee3Bb1obAJ4vkpbaAuybW9Zk+riTJ/N1zP
	VzYwNdjjQo+opTKH8g2M/moOyAM8V10=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 6/9] tools/xenstored: replace the fire_watches() exact parameter
Date: Tue, 21 Apr 2026 09:42:08 +0200
Message-ID: <20260421074211.308473-7-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421074211.308473-1-jgross@suse.com>
References: <20260421074211.308473-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-purgate-ID: tlsNG-42698a/1776757367-0576AF3B-4AD8B1FA/0/0
X-purgate-type: clean
X-purgate-size: 8378
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:julien@xen.org,m:anthony.perard@vates.tech,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.990];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 3D982437C9D
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
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/xenstored/core.c        | 12 +++++-----
 tools/xenstored/transaction.c | 14 +++++++-----
 tools/xenstored/transaction.h |  4 +++-
 tools/xenstored/watch.c       | 42 +++++++++++++++++++++++++----------
 tools/xenstored/watch.h       |  9 +++++++-
 5 files changed, 55 insertions(+), 26 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 93244d0ac4..6d82111e29 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -1613,7 +1613,7 @@ static int do_write(const void *ctx, struct connection *conn,
 			return errno;
 	}
 
-	fire_watches(conn, ctx, name, node, false, NULL);
+	fire_watches(conn, ctx, name, node, MATCH_SUBTREE, NULL);
 	send_ack(conn, XS_WRITE);
 
 	return 0;
@@ -1637,7 +1637,7 @@ static int do_mkdir(const void *ctx, struct connection *conn,
 		node = create_node(conn, ctx, name, NULL, 0);
 		if (!node)
 			return errno;
-		fire_watches(conn, ctx, name, node, false, NULL);
+		fire_watches(conn, ctx, name, node, MATCH_SUBTREE, NULL);
 	}
 	send_ack(conn, XS_MKDIR);
 
@@ -1683,7 +1683,7 @@ static int delnode_sub(const void *ctx, struct connection *conn,
 		       struct node *node, void *arg)
 {
 	const char *root = arg;
-	bool watch_exact;
+	enum watch_match watch_match;
 	int ret;
 	const char *db_name;
 
@@ -1703,8 +1703,8 @@ static int delnode_sub(const void *ctx, struct connection *conn,
 	 * This fine as we are single threaded and the next possible read will
 	 * be handled only after the node has been really removed.
 	*/
-	watch_exact = strcmp(root, node->name);
-	fire_watches(conn, ctx, node->name, node, watch_exact, NULL);
+	watch_match = strcmp(root, node->name) ? MATCH_EXACT : MATCH_SUBTREE;
+	fire_watches(conn, ctx, node->name, node, watch_match, NULL);
 
 	return WALK_TREE_RM_CHILDENTRY;
 }
@@ -1858,7 +1858,7 @@ static int do_set_perms(const void *ctx, struct connection *conn,
 	if (write_node(conn, node, NODE_MODIFY, false))
 		return errno;
 
-	fire_watches(conn, ctx, name, node, false, &old_perms);
+	fire_watches(conn, ctx, name, node, MATCH_SUBTREE, &old_perms);
 	send_ack(conn, XS_SET_PERMS);
 
 	return 0;
diff --git a/tools/xenstored/transaction.c b/tools/xenstored/transaction.c
index 47cd6ecd3c..ec5b122a3f 100644
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
index 860c219f29..a9a06e9e48 100644
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


