Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BF46AF014
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 19:28:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507778.781787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZc1z-0002px-Fv; Tue, 07 Mar 2023 18:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507778.781787; Tue, 07 Mar 2023 18:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZc1z-0002kb-By; Tue, 07 Mar 2023 18:27:23 +0000
Received: by outflank-mailman (input) for mailman id 507778;
 Tue, 07 Mar 2023 18:27:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tG96=67=desiato.srs.infradead.org=BATV+98a25f4d4d04c9e21499+7135+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pZc1x-0002M9-UC
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 18:27:22 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b11668c4-bd15-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 19:27:18 +0100 (CET)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pZc1n-00H8T3-0Y; Tue, 07 Mar 2023 18:27:11 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pZc1n-009e8R-0A; Tue, 07 Mar 2023 18:27:11 +0000
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
X-Inumbo-ID: b11668c4-bd15-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=BkYMrTPfiwe8ful5EeikJA8cZYk3rSUcxns06e108Rc=; b=dY2QlCm7IXh6WsBhjK0nKl8xzd
	f2yogSGW7lsj22Vgrp2OBPQczHQYgkiNjy/zqevo7dbEl4RhXI7T6Xo251XW8aq623BwgQQFyUOq3
	1olI71ioh9h+/cI6xOYajuMwugxOX31vjcHWkjGTkHar12xiSa4+iPTh7jQR2ezRkk58jJETJRC5O
	2UzwbdKHTc50oL0gnzqfDGOZHTlE/4yfIG8M60SK/ShP7fpBSiFs7m6ov/PKTi4DJHcdE63yXFw6v
	zgfVIUaHUZvYD5j+PboWamizZrq2kfhDEQ0ZlQLhYZ4zomM7mRtIaZmN6GLRGfUDmEdl13FT1LKDn
	h5UzpXyg==;
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	vikram.garhwal@amd.com,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Juan Quintela <quintela@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 05/27] hw/xen: Watches on XenStore transactions
Date: Tue,  7 Mar 2023 18:26:45 +0000
Message-Id: <20230307182707.2298618-6-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307182707.2298618-1-dwmw2@infradead.org>
References: <20230307182707.2298618-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Firing watches on the nodes that still exist is relatively easy; just
walk the tree and look at the nodes with refcount of one.

Firing watches on *deleted* nodes is more fun. We add 'modified_in_tx'
and 'deleted_in_tx' flags to each node. Nodes with those flags cannot
be shared, as they will always be unique to the transaction in which
they were created.

When xs_node_walk would need to *create* a node as scaffolding and it
encounters a deleted_in_tx node, it can resurrect it simply by clearing
its deleted_in_tx flag. If that node originally had any *data*, they're
gone, and the modified_in_tx flag will have been set when it was first
deleted.

We then attempt to send appropriate watches when the transaction is
committed, properly delete the deleted_in_tx nodes, and remove the
modified_in_tx flag from the others.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xenstore_impl.c | 151 ++++++++++++++++++++++-
 tests/unit/test-xs-node.c   | 231 +++++++++++++++++++++++++++++++++++-
 2 files changed, 380 insertions(+), 2 deletions(-)

diff --git a/hw/i386/kvm/xenstore_impl.c b/hw/i386/kvm/xenstore_impl.c
index 0812e367b0..60f42f61d6 100644
--- a/hw/i386/kvm/xenstore_impl.c
+++ b/hw/i386/kvm/xenstore_impl.c
@@ -32,6 +32,8 @@ typedef struct XsNode {
     GByteArray *content;
     GHashTable *children;
     uint64_t gencnt;
+    bool deleted_in_tx;
+    bool modified_in_tx;
 #ifdef XS_NODE_UNIT_TEST
     gchar *name; /* debug only */
 #endif
@@ -153,6 +155,13 @@ static XsNode *xs_node_copy(XsNode *old)
     XsNode *n = xs_node_new();
 
     n->gencnt = old->gencnt;
+
+#ifdef XS_NODE_UNIT_TEST
+    if (n->name) {
+        n->name = g_strdup(old->name);
+    }
+#endif
+
     if (old->children) {
         n->children = g_hash_table_new_full(g_str_hash, g_str_equal, g_free,
                                             (GDestroyNotify)xs_node_unref);
@@ -221,6 +230,9 @@ struct walk_op {
     bool mutating;
     bool create_dirs;
     bool in_transaction;
+
+    /* Tracking during recursion so we know which is first. */
+    bool deleted_in_tx;
 };
 
 static void fire_watches(struct walk_op *op, bool parents)
@@ -277,6 +289,9 @@ static int xs_node_add_content(XsNode **n, struct walk_op *op)
         g_byte_array_unref((*n)->content);
     }
     (*n)->content = g_byte_array_ref(data);
+    if (op->tx_id != XBT_NULL) {
+        (*n)->modified_in_tx = true;
+    }
     return 0;
 }
 
@@ -333,10 +348,62 @@ static int node_rm_recurse(gpointer key, gpointer value, gpointer user_data)
     return this_inplace;
 }
 
+static XsNode *xs_node_copy_deleted(XsNode *old, struct walk_op *op);
+static void copy_deleted_recurse(gpointer key, gpointer value,
+                                 gpointer user_data)
+{
+    struct walk_op *op = user_data;
+    GHashTable *siblings = op->op_opaque2;
+    XsNode *n = xs_node_copy_deleted(value, op);
+
+    /*
+     * Reinsert the deleted_in_tx copy of the node into the parent's
+     * 'children' hash table. Having stashed it from op->op_opaque2
+     * before the recursive call to xs_node_copy_deleted() scribbled
+     * over it.
+     */
+    g_hash_table_insert(siblings, g_strdup(key), n);
+}
+
+static XsNode *xs_node_copy_deleted(XsNode *old, struct walk_op *op)
+{
+    XsNode *n = xs_node_new();
+
+    n->gencnt = old->gencnt;
+
+#ifdef XS_NODE_UNIT_TEST
+    if (old->name) {
+        n->name = g_strdup(old->name);
+    }
+#endif
+
+    if (old->children) {
+        n->children = g_hash_table_new_full(g_str_hash, g_str_equal, g_free,
+                                            (GDestroyNotify)xs_node_unref);
+        op->op_opaque2 = n->children;
+        g_hash_table_foreach(old->children, copy_deleted_recurse, op);
+    }
+    n->deleted_in_tx = true;
+    /* If it gets resurrected we only fire a watch if it lost its content */
+    if (old->content) {
+        n->modified_in_tx = true;
+    }
+    op->new_nr_nodes--;
+    return n;
+}
+
 static int xs_node_rm(XsNode **n, struct walk_op *op)
 {
     bool this_inplace = op->inplace;
 
+    if (op->tx_id != XBT_NULL) {
+        /* It's not trivial to do inplace handling for this one */
+        XsNode *old = *n;
+        *n = xs_node_copy_deleted(old, op);
+        xs_node_unref(old);
+        return 0;
+    }
+
     /* Fire watches for, and count, nodes in the subtree which get deleted */
     if ((*n)->children) {
         g_hash_table_foreach_remove((*n)->children, node_rm_recurse, op);
@@ -408,6 +475,10 @@ static int xs_node_walk(XsNode **n, struct walk_op *op)
     }
 
     if (child) {
+        if (child->deleted_in_tx) {
+            assert(child->ref == 1);
+            /* Cannot actually set child->deleted_in_tx = false until later */
+        }
         xs_node_ref(child);
         /*
          * Now we own it too. But if we can modify inplace, that's going to
@@ -475,6 +546,15 @@ static int xs_node_walk(XsNode **n, struct walk_op *op)
         xs_node_unref(old);
     }
 
+    /*
+     * If we resurrected a deleted_in_tx node, we can mark it as no longer
+     * deleted now that we know the overall operation has succeeded.
+     */
+    if (op->create_dirs && child && child->deleted_in_tx) {
+        op->new_nr_nodes++;
+        child->deleted_in_tx = false;
+    }
+
     /*
      * The child may be NULL here, for a remove operation. Either way,
      * xs_node_add_child() will do the right thing and return a value
@@ -709,8 +789,69 @@ int xs_impl_transaction_start(XenstoreImplState *s, unsigned int dom_id,
     return 0;
 }
 
+static gboolean tx_commit_walk(gpointer key, gpointer value,
+                               gpointer user_data)
+{
+    struct walk_op *op = user_data;
+    int path_len = strlen(op->path);
+    int key_len = strlen(key);
+    bool fire_parents = true;
+    XsWatch *watch;
+    XsNode *n = value;
+
+    if (n->ref != 1) {
+        return false;
+    }
+
+    if (n->deleted_in_tx) {
+        /*
+         * We fire watches on our parents if we are the *first* node
+         * to be deleted (the topmost one). This matches the behaviour
+         * when deleting in the live tree.
+         */
+        fire_parents = !op->deleted_in_tx;
+
+        /* Only used on the way down so no need to clear it later */
+        op->deleted_in_tx = true;
+    }
+
+    assert(key_len + path_len + 2 <= sizeof(op->path));
+    op->path[path_len] = '/';
+    memcpy(op->path + path_len + 1, key, key_len + 1);
+
+    watch = g_hash_table_lookup(op->s->watches, op->path);
+    if (watch) {
+        op->watches = g_list_append(op->watches, watch);
+    }
+
+    if (n->children) {
+        g_hash_table_foreach_remove(n->children, tx_commit_walk, op);
+    }
+
+    if (watch) {
+        op->watches = g_list_remove(op->watches, watch);
+    }
+
+    /*
+     * Don't fire watches if this node was only copied because a
+     * descendent was changed. The modified_in_tx flag indicates the
+     * ones which were really changed.
+     */
+    if (n->modified_in_tx || n->deleted_in_tx) {
+        fire_watches(op, fire_parents);
+        n->modified_in_tx = false;
+    }
+    op->path[path_len] = '\0';
+
+    /* Deleted nodes really do get expunged when we commit */
+    return n->deleted_in_tx;
+}
+
 static int transaction_commit(XenstoreImplState *s, XsTransaction *tx)
 {
+    struct walk_op op;
+    XsNode **n;
+
     if (s->root_tx != tx->base_tx) {
         return EAGAIN;
     }
@@ -720,10 +861,18 @@ static int transaction_commit(XenstoreImplState *s, XsTransaction *tx)
     s->root_tx = tx->tx_id;
     s->nr_nodes = tx->nr_nodes;
 
+    init_walk_op(s, &op, XBT_NULL, tx->dom_id, "/", &n);
+    op.deleted_in_tx = false;
+    op.mutating = true;
+
     /*
-     * XX: Walk the new root and fire watches on any node which has a
+     * Walk the new root and fire watches on any node which has a
      * refcount of one (which is therefore unique to this transaction).
      */
+    if (s->root->children) {
+        g_hash_table_foreach_remove(s->root->children, tx_commit_walk, &op);
+    }
+
     return 0;
 }
 
diff --git a/tests/unit/test-xs-node.c b/tests/unit/test-xs-node.c
index 3c3654550a..02c72baa62 100644
--- a/tests/unit/test-xs-node.c
+++ b/tests/unit/test-xs-node.c
@@ -347,7 +347,13 @@ static void do_test_xs_node_tx(bool fail, bool commit)
     } else {
         g_assert(!err);
     }
-    g_assert(!watches->len);
+    if (commit && !fail) {
+        g_assert(!strcmp(watches->str,
+                         "some/relative/pathwatch"));
+        g_string_truncate(watches, 0);
+    } else {
+       g_assert(!watches->len);
+    }
     g_assert(s->nr_nodes == 7);
 
     err = xs_impl_unwatch(s, DOMID_GUEST, "some", "watch",
@@ -386,6 +392,226 @@ static void test_xs_node_tx_succeed(void)
     do_test_xs_node_tx(false, true);
 }
 
+static void test_xs_node_tx_rm(void)
+{
+    XenstoreImplState *s = setup();
+    GString *watches = g_string_new(NULL);
+    GByteArray *data = g_byte_array_new();
+    unsigned int tx_id = XBT_NULL;
+    int err;
+
+    g_assert(s);
+
+    /* Set a watch */
+    err = xs_impl_watch(s, DOMID_GUEST, "some", "watch",
+                        watch_cb, watches);
+    g_assert(!err);
+    g_assert(watches->len == strlen("somewatch"));
+    g_assert(!strcmp(watches->str, "somewatch"));
+    g_string_truncate(watches, 0);
+
+    /* Write something */
+    err = write_str(s, DOMID_GUEST, XBT_NULL, "some/deep/dark/relative/path",
+                    "something");
+    g_assert(!err);
+    g_assert(s->nr_nodes == 9);
+    g_assert(!strcmp(watches->str,
+                     "some/deep/dark/relative/pathwatch"));
+    g_string_truncate(watches, 0);
+
+    /* Create a transaction */
+    err = xs_impl_transaction_start(s, DOMID_GUEST, &tx_id);
+    g_assert(!err);
+
+    /* Delete the tree in the transaction */
+    err = xs_impl_rm(s, DOMID_GUEST, tx_id, "some/deep/dark");
+    g_assert(!err);
+    g_assert(s->nr_nodes == 9);
+    g_assert(!watches->len);
+
+    err = xs_impl_read(s, DOMID_GUEST, XBT_NULL, "some/deep/dark/relative/path",
+                       data);
+    g_assert(!err);
+    g_assert(data->len == strlen("something"));
+    g_assert(!memcmp(data->data, "something", data->len));
+    g_byte_array_set_size(data, 0);
+
+    /* Commit the transaction */
+    err = xs_impl_transaction_end(s, DOMID_GUEST, tx_id, true);
+    g_assert(!err);
+    g_assert(s->nr_nodes == 6);
+
+    g_assert(!strcmp(watches->str, "some/deep/darkwatch"));
+    g_string_truncate(watches, 0);
+
+    /* Now the node is gone */
+    err = xs_impl_read(s, DOMID_GUEST, XBT_NULL, "some/deep/dark/relative/path",
+                       data);
+    g_assert(err == ENOENT);
+    g_byte_array_unref(data);
+
+    err = xs_impl_unwatch(s, DOMID_GUEST, "some", "watch",
+                        watch_cb, watches);
+    g_assert(!err);
+
+    g_string_free(watches, true);
+    xs_impl_delete(s);
+}
+
+static void test_xs_node_tx_resurrect(void)
+{
+    XenstoreImplState *s = setup();
+    GString *watches = g_string_new(NULL);
+    GByteArray *data = g_byte_array_new();
+    unsigned int tx_id = XBT_NULL;
+    int err;
+
+    g_assert(s);
+
+    /* Write something */
+    err = write_str(s, DOMID_GUEST, XBT_NULL, "some/deep/dark/relative/path",
+                    "something");
+    g_assert(!err);
+    g_assert(s->nr_nodes == 9);
+
+    /* This node will be wiped and resurrected */
+    err = write_str(s, DOMID_GUEST, XBT_NULL, "some/deep/dark",
+                    "foo");
+    g_assert(!err);
+    g_assert(s->nr_nodes == 9);
+
+    /* Set a watch */
+    err = xs_impl_watch(s, DOMID_GUEST, "some", "watch",
+                        watch_cb, watches);
+    g_assert(!err);
+    g_assert(watches->len == strlen("somewatch"));
+    g_assert(!strcmp(watches->str, "somewatch"));
+    g_string_truncate(watches, 0);
+
+    /* Create a transaction */
+    err = xs_impl_transaction_start(s, DOMID_GUEST, &tx_id);
+    g_assert(!err);
+
+    /* Delete the tree in the transaction */
+    err = xs_impl_rm(s, DOMID_GUEST, tx_id, "some/deep");
+    g_assert(!err);
+    g_assert(s->nr_nodes == 9);
+    g_assert(!watches->len);
+
+    /* Resurrect part of it */
+    err = write_str(s, DOMID_GUEST, tx_id, "some/deep/dark/different/path",
+                    "something");
+    g_assert(!err);
+    g_assert(s->nr_nodes == 9);
+
+    /* Commit the transaction */
+    err = xs_impl_transaction_end(s, DOMID_GUEST, tx_id, true);
+    g_assert(!err);
+    g_assert(s->nr_nodes == 9);
+
+    /* lost data */
+    g_assert(strstr(watches->str, "some/deep/dark/different/pathwatch"));
+    /* topmost deleted */
+    g_assert(strstr(watches->str, "some/deep/dark/relativewatch"));
+    /* lost data */
+    g_assert(strstr(watches->str, "some/deep/darkwatch"));
+
+    g_string_truncate(watches, 0);
+
+    /* Now the node is gone */
+    err = xs_impl_read(s, DOMID_GUEST, XBT_NULL, "some/deep/dark/relative/path",
+                       data);
+    g_assert(err == ENOENT);
+    g_byte_array_unref(data);
+
+    err = xs_impl_unwatch(s, DOMID_GUEST, "some", "watch",
+                        watch_cb, watches);
+    g_assert(!err);
+
+    g_string_free(watches, true);
+    xs_impl_delete(s);
+}
+
+static void test_xs_node_tx_resurrect2(void)
+{
+    XenstoreImplState *s = setup();
+    GString *watches = g_string_new(NULL);
+    GByteArray *data = g_byte_array_new();
+    unsigned int tx_id = XBT_NULL;
+    int err;
+
+    g_assert(s);
+
+    /* Write something */
+    err = write_str(s, DOMID_GUEST, XBT_NULL, "some/deep/dark/relative/path",
+                    "something");
+    g_assert(!err);
+    g_assert(s->nr_nodes == 9);
+
+    /* Another node to remain shared */
+    err = write_str(s, DOMID_GUEST, XBT_NULL, "some/place/safe", "keepme");
+    g_assert(!err);
+    g_assert(s->nr_nodes == 11);
+
+    /* This node will be wiped and resurrected */
+    err = write_str(s, DOMID_GUEST, XBT_NULL, "some/deep/dark",
+                    "foo");
+    g_assert(!err);
+    g_assert(s->nr_nodes == 11);
+
+    /* Set a watch */
+    err = xs_impl_watch(s, DOMID_GUEST, "some", "watch",
+                        watch_cb, watches);
+    g_assert(!err);
+    g_assert(watches->len == strlen("somewatch"));
+    g_assert(!strcmp(watches->str, "somewatch"));
+    g_string_truncate(watches, 0);
+
+    /* Create a transaction */
+    err = xs_impl_transaction_start(s, DOMID_GUEST, &tx_id);
+    g_assert(!err);
+
+    /* Delete the tree in the transaction */
+    err = xs_impl_rm(s, DOMID_GUEST, tx_id, "some/deep");
+    g_assert(!err);
+    g_assert(s->nr_nodes == 11);
+    g_assert(!watches->len);
+
+    /* Resurrect part of it */
+    err = write_str(s, DOMID_GUEST, tx_id, "some/deep/dark/relative/path",
+                    "something");
+    g_assert(!err);
+    g_assert(s->nr_nodes == 11);
+
+    /* Commit the transaction */
+    err = xs_impl_transaction_end(s, DOMID_GUEST, tx_id, true);
+    g_assert(!err);
+    g_assert(s->nr_nodes == 11);
+
+    /* lost data */
+    g_assert(strstr(watches->str, "some/deep/dark/relative/pathwatch"));
+    /* lost data */
+    g_assert(strstr(watches->str, "some/deep/darkwatch"));
+
+    g_string_truncate(watches, 0);
+
+    /* Now the node is gone */
+    err = xs_impl_read(s, DOMID_GUEST, XBT_NULL, "some/deep/dark/relative/path",
+                       data);
+    g_assert(!err);
+    g_assert(data->len == strlen("something"));
+    g_assert(!memcmp(data->data, "something", data->len));
+
+    g_byte_array_unref(data);
+
+    err = xs_impl_unwatch(s, DOMID_GUEST, "some", "watch",
+                        watch_cb, watches);
+    g_assert(!err);
+
+    g_string_free(watches, true);
+    xs_impl_delete(s);
+}
+
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
@@ -395,6 +621,9 @@ int main(int argc, char **argv)
     g_test_add_func("/xs_node/tx_abort", test_xs_node_tx_abort);
     g_test_add_func("/xs_node/tx_fail", test_xs_node_tx_fail);
     g_test_add_func("/xs_node/tx_succeed", test_xs_node_tx_succeed);
+    g_test_add_func("/xs_node/tx_rm", test_xs_node_tx_rm);
+    g_test_add_func("/xs_node/tx_resurrect", test_xs_node_tx_resurrect);
+    g_test_add_func("/xs_node/tx_resurrect2", test_xs_node_tx_resurrect2);
 
     return g_test_run();
 }
-- 
2.39.0


