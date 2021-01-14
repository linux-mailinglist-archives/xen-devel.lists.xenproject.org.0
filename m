Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 091452F6501
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:49:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67262.119941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04sE-0005dk-Be; Thu, 14 Jan 2021 15:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67262.119941; Thu, 14 Jan 2021 15:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04sE-0005dG-7F; Thu, 14 Jan 2021 15:49:22 +0000
Received: by outflank-mailman (input) for mailman id 67262;
 Thu, 14 Jan 2021 15:49:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P5GR=GR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l04ia-0002Sh-Kh
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:39:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b6d48066-278a-4cf7-975e-da1af403dab1;
 Thu, 14 Jan 2021 15:38:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 991BCAF2C;
 Thu, 14 Jan 2021 15:38:11 +0000 (UTC)
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
X-Inumbo-ID: b6d48066-278a-4cf7-975e-da1af403dab1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610638691; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4kmuVlHOspaVKDt96etixwggFxvBVpVKxBmCa9TPUeo=;
	b=sfGsOR2FQoYyTPJqDQjwlZEn4BlIdg4SVietJnkw0a7ihFea+Fg2p9+ggWDbWAPiETXNha
	5DFJnTNR46ISS7tus5oI1ImW3L0+NQS+ZVO0NojQepvqSCUO1VM0xPG6tXCJlgFT6OZplM
	oTwvWspjeUwRVWL0B3X1D7ZqPNSFWyc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v11 24/27] tools/xenstore: add read node state for live update
Date: Thu, 14 Jan 2021 16:38:00 +0100
Message-Id: <20210114153803.2591-25-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114153803.2591-1-jgross@suse.com>
References: <20210114153803.2591-1-jgross@suse.com>
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
index d6454d4e77..d73e1dca7e 100644
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
index 4175b871ee..3e133b475c 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -972,13 +972,30 @@ static char *basename(const char *name)
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
@@ -991,15 +1008,8 @@ static struct node *construct_node(struct connection *conn, const void *ctx,
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
@@ -2612,6 +2622,79 @@ void read_state_buffered_data(const void *ctx, struct connection *conn,
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


