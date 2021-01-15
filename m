Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE5A2F745C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 09:30:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67726.121123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0KVF-0000cD-A7; Fri, 15 Jan 2021 08:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67726.121123; Fri, 15 Jan 2021 08:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0KVE-0000aa-RC; Fri, 15 Jan 2021 08:30:40 +0000
Received: by outflank-mailman (input) for mailman id 67726;
 Fri, 15 Jan 2021 08:30:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v6X5=GS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l0KVD-0008Gh-Fs
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 08:30:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9926760f-ac98-4180-9380-4be2dff450d1;
 Fri, 15 Jan 2021 08:30:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7F23DB944;
 Fri, 15 Jan 2021 08:30:07 +0000 (UTC)
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
X-Inumbo-ID: 9926760f-ac98-4180-9380-4be2dff450d1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610699408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sSnAF7fRT0i6R+7d24NOVdIRMygQrGad5fUKdqzr1pY=;
	b=okxDcM8Ov0R+Y8piHkHPx2GuDHma6Z2tr7Lnns8sGJyPCsCv4+T0DVeCfFSIkJk8BJ1E2Q
	MR1zXDn4y7VaFrBKig+aZbv7b328GOEXWpsyiSJM+HZTkaGykvSWgmC+n93fE6eRArlrKA
	IQOEfuxM3oKZea5tFc+ti2fFB+9fTUw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v12 24/27] tools/xenstore: add read node state for live update
Date: Fri, 15 Jan 2021 09:29:57 +0100
Message-Id: <20210115083000.14186-25-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115083000.14186-1-jgross@suse.com>
References: <20210115083000.14186-1-jgross@suse.com>
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
---
 tools/xenstore/xenstored_control.c |   1 +
 tools/xenstore/xenstored_core.c    | 105 ++++++++++++++++++++++++++---
 tools/xenstore/xenstored_core.h    |   1 +
 3 files changed, 96 insertions(+), 11 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 7428b836a5..287417de6b 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -547,6 +547,7 @@ void lu_read_state(void)
 			xprintf("live-update: ignore transaction record\n");
 			break;
 		case XS_STATE_TYPE_NODE:
+			read_state_node(ctx, head + 1);
 			break;
 		default:
 			xprintf("live-update: unknown state record %08x\n",
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index b2c544b165..a5c1a56c6c 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -979,13 +979,30 @@ static char *basename(const char *name)
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
@@ -998,15 +1015,8 @@ static struct node *construct_node(struct connection *conn, const void *ctx,
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
@@ -2619,6 +2629,79 @@ void read_state_buffered_data(const void *ctx, struct connection *conn,
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
index dcb3ad3e4b..6ac5a6fbfa 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -276,6 +276,7 @@ const char *dump_state_node_perms(FILE *fp, struct xs_state_node *sn,
 void read_state_global(const void *ctx, const void *state);
 void read_state_buffered_data(const void *ctx, struct connection *conn,
 			      const struct xs_state_connection *sc);
+void read_state_node(const void *ctx, const void *state);
 
 #endif /* _XENSTORED_CORE_H */
 
-- 
2.26.2


