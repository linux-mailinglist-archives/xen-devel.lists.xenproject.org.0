Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 981202DB1AE
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:43:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54634.95108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDQA-0001AD-Li; Tue, 15 Dec 2020 16:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54634.95108; Tue, 15 Dec 2020 16:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDQA-00019o-IA; Tue, 15 Dec 2020 16:43:30 +0000
Received: by outflank-mailman (input) for mailman id 54634;
 Tue, 15 Dec 2020 16:43:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2CwE=FT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kpDJs-000667-I3
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:37:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11243044-b289-43c5-9894-68c2e92a0253;
 Tue, 15 Dec 2020 16:36:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 424A5B281;
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
X-Inumbo-ID: 11243044-b289-43c5-9894-68c2e92a0253
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608050172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HtVxa77CLyXcQ6lxzjJcuCpBF5I8/PiHNgqqLa9tyHM=;
	b=TK0PlX6y3Jkvu5emSXlbw4TpyW/RtmzHmACAG7DKRnhWU9Th2Eb6jQSqbEDW/RXM6LqQFh
	wiklHF52f18E4hbMT9qV0h1E5Lveao0pCsLRj0m+HTU3skXkq1mU3GyHM/bHsR2mZQgYkg
	1VBkskMDDnkSXdDifD3Op/QElt8BXeo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v10 22/25] tools/xenstore: add read node state for live update
Date: Tue, 15 Dec 2020 17:36:00 +0100
Message-Id: <20201215163603.21700-23-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215163603.21700-1-jgross@suse.com>
References: <20201215163603.21700-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the needed functions for reading node state for live update.

This requires some refactoring of current node handling in Xenstore in
order to avoid repeating the same code patterns multiple times.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Acked-by: Julien Grall <jgrall@amazon.com>
---
V4:
- drop local node handling (Julien Grall)

V5:
- use set_tdb_key (Paul Durrant)

V6:
- add permission flag handling (Julien Grall)

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_control.c |   1 +
 tools/xenstore/xenstored_core.c    | 105 ++++++++++++++++++++++++++---
 tools/xenstore/xenstored_core.h    |   1 +
 3 files changed, 96 insertions(+), 11 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 4bf075ad79..a978ccf17e 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -530,6 +530,7 @@ void lu_read_state(void)
 			xprintf("live-update: ignore transaction record\n");
 			break;
 		case XS_STATE_TYPE_NODE:
+			read_state_node(ctx, head + 1);
 			break;
 		default:
 			xprintf("live-update: unknown state record %08x\n",
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 2ad1cc8d44..649dfb534a 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -930,13 +930,30 @@ static char *basename(const char *name)
 	return strrchr(name, '/') + 1;
 }
 
-static struct node *construct_node(struct connection *conn, const void *ctx,
-				   const char *name)
+static int add_child(const void *ctx, struct node *parent, const char *name)
 {
 	const char *base;
 	unsigned int baselen;
+	char *children;
+
+	base = basename(name);
+	baselen = strlen(base) + 1;
+	children = talloc_array(ctx, char, parent->childlen + baselen);
+	if (!children)
+		return ENOMEM;
+	memcpy(children, parent->children, parent->childlen);
+	memcpy(children + parent->childlen, base, baselen);
+	parent->children = children;
+	parent->childlen += baselen;
+
+	return 0;
+}
+
+static struct node *construct_node(struct connection *conn, const void *ctx,
+				   const char *name)
+{
 	struct node *parent, *node;
-	char *children, *parentname = get_parent(ctx, name);
+	char *parentname = get_parent(ctx, name);
 
 	if (!parentname)
 		return NULL;
@@ -949,15 +966,8 @@ static struct node *construct_node(struct connection *conn, const void *ctx,
 		return NULL;
 
 	/* Add child to parent. */
-	base = basename(name);
-	baselen = strlen(base) + 1;
-	children = talloc_array(ctx, char, parent->childlen + baselen);
-	if (!children)
+	if (add_child(ctx, parent, name))
 		goto nomem;
-	memcpy(children, parent->children, parent->childlen);
-	memcpy(children + parent->childlen, base, baselen);
-	parent->children = children;
-	parent->childlen += baselen;
 
 	/* Allocate node */
 	node = talloc(ctx, struct node);
@@ -2558,6 +2568,79 @@ void read_state_buffered_data(const void *ctx, struct connection *conn,
 	}
 }
 
+void read_state_node(const void *ctx, const void *state)
+{
+	const struct xs_state_node *sn = state;
+	struct node *node, *parent;
+	TDB_DATA key;
+	char *name, *parentname;
+	unsigned int i;
+	struct connection conn = { .id = priv_domid };
+
+	name = (char *)(sn->perms + sn->perm_n);
+	node = talloc(ctx, struct node);
+	if (!node)
+		barf("allocation error restoring node");
+
+	node->name = name;
+	node->generation = ++generation;
+	node->datalen = sn->data_len;
+	node->data = name + sn->path_len;
+	node->childlen = 0;
+	node->children = NULL;
+	node->perms.num = sn->perm_n;
+	node->perms.p = talloc_array(node, struct xs_permissions,
+				     node->perms.num);
+	if (!node->perms.p)
+		barf("allocation error restoring node");
+	for (i = 0; i < node->perms.num; i++) {
+		switch (sn->perms[i].access) {
+		case 'r':
+			node->perms.p[i].perms = XS_PERM_READ;
+			break;
+		case 'w':
+			node->perms.p[i].perms = XS_PERM_WRITE;
+			break;
+		case 'b':
+			node->perms.p[i].perms = XS_PERM_READ | XS_PERM_WRITE;
+			break;
+		default:
+			node->perms.p[i].perms = XS_PERM_NONE;
+			break;
+		}
+		if (sn->perms[i].flags & XS_STATE_NODE_PERM_IGNORE)
+			node->perms.p[i].perms |= XS_PERM_IGNORE;
+		node->perms.p[i].id = sn->perms[i].domid;
+	}
+
+	if (strstarts(name, "@")) {
+		set_perms_special(&conn, name, &node->perms);
+		talloc_free(node);
+		return;
+	}
+
+	parentname = get_parent(node, name);
+	if (!parentname)
+		barf("allocation error restoring node");
+	parent = read_node(NULL, node, parentname);
+	if (!parent)
+		barf("read parent error restoring node");
+
+	if (add_child(node, parent, name))
+		barf("allocation error restoring node");
+
+	set_tdb_key(parentname, &key);
+	if (write_node_raw(NULL, &key, parent, true))
+		barf("write parent error restoring node");
+
+	set_tdb_key(name, &key);
+	if (write_node_raw(NULL, &key, node, true))
+		barf("write node error restoring node");
+	domain_entry_inc(&conn, node);
+
+	talloc_free(node);
+}
+
 /*
  * Local variables:
  *  mode: C
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index cb256626fe..0af2f364bf 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -255,6 +255,7 @@ const char *dump_state_node_perms(FILE *fp, struct xs_state_node *sn,
 void read_state_global(const void *ctx, const void *state);
 void read_state_buffered_data(const void *ctx, struct connection *conn,
 			      const struct xs_state_connection *sc);
+void read_state_node(const void *ctx, const void *state);
 
 #endif /* _XENSTORED_CORE_H */
 
-- 
2.26.2


