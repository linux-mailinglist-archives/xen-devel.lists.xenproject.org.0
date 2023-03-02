Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC9C6A8544
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 16:35:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505064.777729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkxc-0005lp-Qu; Thu, 02 Mar 2023 15:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505064.777729; Thu, 02 Mar 2023 15:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkxb-0005Ql-MF; Thu, 02 Mar 2023 15:35:11 +0000
Received: by outflank-mailman (input) for mailman id 505064;
 Thu, 02 Mar 2023 15:35:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZMsQ=62=desiato.srs.infradead.org=BATV+9a0490e5ac528e462c30+7130+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pXkxQ-0001Jw-NV
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 15:35:00 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c49d05a4-b90f-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 16:34:49 +0100 (CET)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pXkx4-00FL3b-0G; Thu, 02 Mar 2023 15:34:38 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pXkx3-004uyX-38; Thu, 02 Mar 2023 15:34:37 +0000
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
X-Inumbo-ID: c49d05a4-b90f-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=gNY1jRXkt4M+fhnisAFzyDAWz2lraNB7iybmZmnwhbA=; b=GRyqh7DapHLe3B/pRWqdW4OS43
	eIn+XARqVp00KvshV2cnL61jmlRonq5iwlxJrBirExF2US0rY7depwSF8Yd5UTakOZgffCvMm9bsS
	VFNt1q7bf14maCXqnYIS2gH1j2+1Wd1jGG8TeFrloEpDJPHlWLcw1SsO47qi5wL1w1sHhBl4rGOwl
	MUeNJiQ/D4Pe+yHFi7511Irjgf3BlpSbixgsH6pmk/r5R6hK9VAa3GCsSjV6WeKj9gaQr9/AqE8Qx
	QwnqAuq9chcegAbBj/OYPnfMrVN7FnK4KQPExfwlN4kmYm3E1OJCxahLdi4JP2GPqlwv+5KDzZsGh
	9ud3Rf7g==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	vikram.garhwal@amd.com,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: [RFC PATCH v1 04/25] hw/xen: Implement XenStore transactions
Date: Thu,  2 Mar 2023 15:34:14 +0000
Message-Id: <20230302153435.1170111-5-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230302153435.1170111-1-dwmw2@infradead.org>
References: <20230302153435.1170111-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Given that the whole thing supported copy on write from the beginning,
transactions end up being fairly simple. On starting a transaction, just
take a ref of the existing root; swap it back in on a successful commit.

The main tree has a transaction ID too, and we keep a record of the last
transaction ID given out. if the main tree is ever modified when it isn't
the latest, it gets a new transaction ID.

A commit can only succeed if the main tree hasn't moved on since it was
forked. Strictly speaking, the XenStore protocol allows a transaction to
succeed as long as nothing *it* read or wrote has changed in the interim,
but no implementations do that; *any* change is sufficient to abort a
transaction.

This does not yet fire watches on the changed nodes on a commit. That bit
is more fun and will come in a follow-on commit.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xenstore_impl.c | 150 ++++++++++++++++++++++++++++++++++--
 tests/unit/test-xs-node.c   | 118 ++++++++++++++++++++++++++++
 2 files changed, 262 insertions(+), 6 deletions(-)

diff --git a/hw/i386/kvm/xenstore_impl.c b/hw/i386/kvm/xenstore_impl.c
index 2e464af93a..e5074ab1ec 100644
--- a/hw/i386/kvm/xenstore_impl.c
+++ b/hw/i386/kvm/xenstore_impl.c
@@ -46,13 +46,56 @@ typedef struct XsWatch {
     int rel_prefix;
 } XsWatch;
 
+typedef struct XsTransaction {
+    XsNode *root;
+    unsigned int nr_nodes;
+    unsigned int base_tx;
+    unsigned int tx_id;
+    unsigned int dom_id;
+} XsTransaction;
+
 struct XenstoreImplState {
     XsNode *root;
     unsigned int nr_nodes;
     GHashTable *watches;
     unsigned int nr_domu_watches;
+    GHashTable *transactions;
+    unsigned int nr_domu_transactions;
+    unsigned int root_tx;
+    unsigned int last_tx;
 };
 
+
+static void nobble_tx(gpointer key, gpointer value, gpointer user_data)
+{
+    unsigned int *new_tx_id = user_data;
+    XsTransaction *tx = value;
+
+    if (tx->base_tx == *new_tx_id) {
+        /* Transactions based on XBT_NULL will always fail */
+        tx->base_tx = XBT_NULL;
+    }
+}
+
+static inline unsigned int next_tx(struct XenstoreImplState *s)
+{
+    unsigned int tx_id;
+
+    /* Find the next TX id which isn't either XBT_NULL or in use. */
+    do {
+        tx_id = ++s->last_tx;
+    } while (tx_id == XBT_NULL || tx_id == s->root_tx ||
+             g_hash_table_lookup(s->transactions, GINT_TO_POINTER(tx_id)));
+
+    /*
+     * It is vanishingly unlikely, but ensure that no outstanding transaction
+     * is based on the (previous incarnation of the) newly-allocated TX id.
+     */
+    g_hash_table_foreach(s->transactions, nobble_tx, &tx_id);
+
+    return tx_id;
+}
+
 static inline XsNode *xs_node_new(void)
 {
     XsNode *n = g_new0(XsNode, 1);
@@ -159,6 +202,7 @@ struct walk_op {
 
     GList *watches;
     unsigned int dom_id;
+    unsigned int tx_id;
 
     /* The number of nodes which will exist in the tree if this op succeeds. */
     unsigned int new_nr_nodes;
@@ -176,6 +220,7 @@ struct walk_op {
     bool inplace;
     bool mutating;
     bool create_dirs;
+    bool in_transaction;
 };
 
 static void fire_watches(struct walk_op *op, bool parents)
@@ -183,7 +228,7 @@ static void fire_watches(struct walk_op *op, bool parents)
     GList *l = NULL;
     XsWatch *w;
 
-    if (!op->mutating) {
+    if (!op->mutating || op->in_transaction) {
         return;
     }
 
@@ -450,10 +495,23 @@ static int xs_node_walk(XsNode **n, struct walk_op *op)
         assert(!op->watches);
         /*
          * On completing the recursion back up the path walk and reaching the
-         * top, assign the new node count if the operation was successful.
+         * top, assign the new node count if the operation was successful. If
+         * the main tree was changed, bump its tx ID so that outstanding
+         * transactions correctly fail. But don't bump it every time; only
+         * if it makes a difference.
          */
         if (!err && op->mutating) {
-            op->s->nr_nodes = op->new_nr_nodes;
+            if (!op->in_transaction) {
+                if (op->s->root_tx != op->s->last_tx) {
+                    op->s->root_tx = next_tx(op->s);
+                }
+                op->s->nr_nodes = op->new_nr_nodes;
+            } else {
+                XsTransaction *tx = g_hash_table_lookup(op->s->transactions,
+                                                        GINT_TO_POINTER(op->tx_id));
+                assert(tx);
+                tx->nr_nodes = op->new_nr_nodes;
+            }
         }
     }
     return err;
@@ -535,14 +593,23 @@ static int init_walk_op(XenstoreImplState *s, struct walk_op *op,
     op->inplace = true;
     op->mutating = false;
     op->create_dirs = false;
+    op->in_transaction = false;
     op->dom_id = dom_id;
+    op->tx_id = tx_id;
     op->s = s;
 
     if (tx_id == XBT_NULL) {
         *rootp = &s->root;
         op->new_nr_nodes = s->nr_nodes;
     } else {
-        return ENOENT;
+        XsTransaction *tx = g_hash_table_lookup(s->transactions,
+                                                GINT_TO_POINTER(tx_id));
+        if (!tx) {
+            return ENOENT;
+        }
+        *rootp = &tx->root;
+        op->new_nr_nodes = tx->nr_nodes;
+        op->in_transaction = true;
     }
 
     return 0;
@@ -616,13 +683,71 @@ int xs_impl_directory(XenstoreImplState *s, unsigned int dom_id,
 int xs_impl_transaction_start(XenstoreImplState *s, unsigned int dom_id,
                               xs_transaction_t *tx_id)
 {
-    return ENOSYS;
+    XsTransaction *tx;
+
+    if (*tx_id != XBT_NULL) {
+        return EINVAL;
+    }
+
+    if (dom_id && s->nr_domu_transactions >= XS_MAX_TRANSACTIONS) {
+        return ENOSPC;
+    }
+
+    tx = g_new0(XsTransaction, 1);
+
+    tx->nr_nodes = s->nr_nodes;
+    tx->tx_id = next_tx(s);
+    tx->base_tx = s->root_tx;
+    tx->root = xs_node_ref(s->root);
+    tx->dom_id = dom_id;
+
+    g_hash_table_insert(s->transactions, GINT_TO_POINTER(tx->tx_id), tx);
+    if (dom_id) {
+        s->nr_domu_transactions++;
+    }
+    *tx_id = tx->tx_id;
+    return 0;
+}
+
+static int transaction_commit(XenstoreImplState *s, XsTransaction *tx)
+{
+    if (s->root_tx != tx->base_tx) {
+        return EAGAIN;
+    }
+    xs_node_unref(s->root);
+    s->root = tx->root;
+    tx->root = NULL;
+    s->root_tx = tx->tx_id;
+    s->nr_nodes = tx->nr_nodes;
+
+    /*
+     * XX: Walk the new root and fire watches on any node which has a
+     * refcount of one (which is therefore unique to this transaction).
+     */
+    return 0;
 }
 
 int xs_impl_transaction_end(XenstoreImplState *s, unsigned int dom_id,
                             xs_transaction_t tx_id, bool commit)
 {
-    return ENOSYS;
+    int ret = 0;
+    XsTransaction *tx = g_hash_table_lookup(s->transactions,
+                                            GINT_TO_POINTER(tx_id));
+
+    if (!tx || tx->dom_id != dom_id) {
+        return ENOENT;
+    }
+
+    if (commit) {
+        ret = transaction_commit(s, tx);
+    }
+
+    g_hash_table_remove(s->transactions, GINT_TO_POINTER(tx_id));
+    if (dom_id) {
+        assert(s->nr_domu_transactions);
+        s->nr_domu_transactions--;
+    }
+    return ret;
 }
 
 int xs_impl_rm(XenstoreImplState *s, unsigned int dom_id,
@@ -839,15 +964,28 @@ int xs_impl_reset_watches(XenstoreImplState *s, unsigned int dom_id)
     return 0;
 }
 
+static void xs_tx_free(void *_tx)
+{
+    XsTransaction *tx = _tx;
+    if (tx->root) {
+        xs_node_unref(tx->root);
+    }
+    g_free(tx);
+}
+
 XenstoreImplState *xs_impl_create(void)
 {
     XenstoreImplState *s = g_new0(XenstoreImplState, 1);
 
     s->watches = g_hash_table_new_full(g_str_hash, g_str_equal, g_free, NULL);
+    s->transactions = g_hash_table_new_full(g_direct_hash, g_direct_equal,
+                                            NULL, xs_tx_free);
     s->nr_nodes = 1;
     s->root = xs_node_new();
 #ifdef XS_NODE_UNIT_TEST
     s->root->name = g_strdup("/");
 #endif
+
+    s->root_tx = s->last_tx = 1;
     return s;
 }
diff --git a/tests/unit/test-xs-node.c b/tests/unit/test-xs-node.c
index 19000b64b2..3c3654550a 100644
--- a/tests/unit/test-xs-node.c
+++ b/tests/unit/test-xs-node.c
@@ -42,6 +42,7 @@ static void xs_impl_delete(XenstoreImplState *s)
     g_assert(s->nr_nodes == 1);
 
     g_hash_table_unref(s->watches);
+    g_hash_table_unref(s->transactions);
     xs_node_unref(s->root);
     g_free(s);
 
@@ -271,12 +272,129 @@ static void test_xs_node_simple(void)
 }
 
 
+static void do_test_xs_node_tx(bool fail, bool commit)
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
+    err = write_str(s, DOMID_GUEST, XBT_NULL, "some/relative/path",
+                    "something");
+    g_assert(s->nr_nodes == 7);
+    g_assert(!err);
+    g_assert(!strcmp(watches->str,
+                     "some/relative/pathwatch"));
+    g_string_truncate(watches, 0);
+
+    /* Create a transaction */
+    err = xs_impl_transaction_start(s, DOMID_GUEST, &tx_id);
+    g_assert(!err);
+
+    if (fail) {
+        /* Write something else in the root */
+        err = write_str(s, DOMID_GUEST, XBT_NULL, "some/relative/path",
+                        "another thing");
+        g_assert(!err);
+        g_assert(s->nr_nodes == 7);
+        g_assert(!strcmp(watches->str,
+                         "some/relative/pathwatch"));
+        g_string_truncate(watches, 0);
+    }
+
+    g_assert(!watches->len);
+
+    /* Perform a write in the transaction */
+    err = write_str(s, DOMID_GUEST, tx_id, "some/relative/path",
+                    "something else");
+    g_assert(!err);
+    g_assert(s->nr_nodes == 7);
+    g_assert(!watches->len);
+
+    err = xs_impl_read(s, DOMID_GUEST, XBT_NULL, "some/relative/path", data);
+    g_assert(!err);
+    if (fail) {
+        g_assert(data->len == strlen("another thing"));
+        g_assert(!memcmp(data->data, "another thing", data->len));
+    } else {
+        g_assert(data->len == strlen("something"));
+        g_assert(!memcmp(data->data, "something", data->len));
+    }
+    g_byte_array_set_size(data, 0);
+
+    err = xs_impl_read(s, DOMID_GUEST, tx_id, "some/relative/path", data);
+    g_assert(!err);
+    g_assert(data->len == strlen("something else"));
+    g_assert(!memcmp(data->data, "something else", data->len));
+    g_byte_array_set_size(data, 0);
+
+    /* Attempt to commit the transaction */
+    err = xs_impl_transaction_end(s, DOMID_GUEST, tx_id, commit);
+    if (commit && fail) {
+        g_assert(err == EAGAIN);
+    } else {
+        g_assert(!err);
+    }
+    g_assert(!watches->len);
+    g_assert(s->nr_nodes == 7);
+
+    err = xs_impl_unwatch(s, DOMID_GUEST, "some", "watch",
+                        watch_cb, watches);
+    g_assert(!err);
+
+    err = xs_impl_read(s, DOMID_GUEST, XBT_NULL, "some/relative/path", data);
+    g_assert(!err);
+    if (fail) {
+        g_assert(data->len == strlen("another thing"));
+        g_assert(!memcmp(data->data, "another thing", data->len));
+    } else if (commit) {
+        g_assert(data->len == strlen("something else"));
+        g_assert(!memcmp(data->data, "something else", data->len));
+    } else {
+        g_assert(data->len == strlen("something"));
+        g_assert(!memcmp(data->data, "something", data->len));
+    }
+    g_byte_array_unref(data);
+    g_string_free(watches, true);
+    xs_impl_delete(s);
+}
+
+static void test_xs_node_tx_fail(void)
+{
+    do_test_xs_node_tx(true, true);
+}
+
+static void test_xs_node_tx_abort(void)
+{
+    do_test_xs_node_tx(false, false);
+    do_test_xs_node_tx(true, false);
+}
+static void test_xs_node_tx_succeed(void)
+{
+    do_test_xs_node_tx(false, true);
+}
+
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
     module_call_init(MODULE_INIT_QOM);
 
     g_test_add_func("/xs_node/simple", test_xs_node_simple);
+    g_test_add_func("/xs_node/tx_abort", test_xs_node_tx_abort);
+    g_test_add_func("/xs_node/tx_fail", test_xs_node_tx_fail);
+    g_test_add_func("/xs_node/tx_succeed", test_xs_node_tx_succeed);
 
     return g_test_run();
 }
-- 
2.39.0


