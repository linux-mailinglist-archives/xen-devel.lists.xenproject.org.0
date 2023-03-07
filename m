Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 613E16AE8BB
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 18:18:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507652.781468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZawx-0001Lx-FQ; Tue, 07 Mar 2023 17:18:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507652.781468; Tue, 07 Mar 2023 17:18:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZawx-0001Bq-9L; Tue, 07 Mar 2023 17:18:07 +0000
Received: by outflank-mailman (input) for mailman id 507652;
 Tue, 07 Mar 2023 17:18:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yYpO=67=casper.srs.infradead.org=BATV+9298a7250c90fe94fbb7+7135+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pZawv-0000az-A4
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 17:18:05 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0341a4c8-bd0c-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 18:18:01 +0100 (CET)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pZawj-006axM-DT; Tue, 07 Mar 2023 17:17:54 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pZawj-009cgf-1K; Tue, 07 Mar 2023 17:17:53 +0000
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
X-Inumbo-ID: 0341a4c8-bd0c-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=+GrJT1RUPTlZbaKvMbiojr7CZve8QJC+9zG/ntSg2ts=; b=KpN24XIv3NFs/Mw1avbHBUFoxB
	3bWoKuYJ+uhiMle65jaVmHMkPKbMOyFNzMwzPkG9b8aInzGbdIjPCwKf/XlJpa6TbZpZlkotUdZBB
	AK3F4TqhmxHhuiJp0D5BPd/MkSuaUwxBlkbWosBJwoF8Aet0fOY4ZvZs7gzY6LY5a2+qmY7GiokJc
	ZMRxJXJ/NxmMkcwvm7DeI3bCFlfJ7cRejD+46MgG/fWaGr8E8hdGF+0aBPFnprZOtlx0BOBMASxy4
	yMwqSjJfKlWbVAFm2HB2tfQvMPjmKcj+8lAepIlK1MS3P1O45v+AY91gFlfDjO9+dZG29enLcQ+Y2
	HYmAaR3g==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	vikram.garhwal@amd.com,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Juan Quintela <quintela@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 03/27] hw/xen: Implement XenStore watches
Date: Tue,  7 Mar 2023 17:17:26 +0000
Message-Id: <20230307171750.2293175-4-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307171750.2293175-1-dwmw2@infradead.org>
References: <20230307171750.2293175-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Starts out fairly simple: a hash table of watches based on the path.

Except there can be multiple watches on the same path, so the watch ends
up being a simple linked list, and the head of that list is in the hash
table. Which makes removal a bit of a PITA but it's not so bad; we just
special-case "I had to remove the head of the list and now I have to
replace it in / remove it from the hash table". And if we don't remove
the head, it's a simple linked-list operation.

We do need to fire watches on *deleted* nodes, so instead of just a simple
xs_node_unref() on the topmost victim, we need to recurse down and fire
watches on them all.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xenstore_impl.c | 253 +++++++++++++++++++++++++++++++++---
 tests/unit/test-xs-node.c   |  85 ++++++++++++
 2 files changed, 323 insertions(+), 15 deletions(-)

diff --git a/hw/i386/kvm/xenstore_impl.c b/hw/i386/kvm/xenstore_impl.c
index 9e10a31bea..9c2348835f 100644
--- a/hw/i386/kvm/xenstore_impl.c
+++ b/hw/i386/kvm/xenstore_impl.c
@@ -37,9 +37,20 @@ typedef struct XsNode {
 #endif
 } XsNode;
 
+typedef struct XsWatch {
+    struct XsWatch *next;
+    xs_impl_watch_fn *cb;
+    void *cb_opaque;
+    char *token;
+    unsigned int dom_id;
+    int rel_prefix;
+} XsWatch;
+
 struct XenstoreImplState {
     XsNode *root;
     unsigned int nr_nodes;
+    GHashTable *watches;
+    unsigned int nr_domu_watches;
 };
 
 static inline XsNode *xs_node_new(void)
@@ -146,6 +157,7 @@ struct walk_op {
     void *op_opaque;
     void *op_opaque2;
 
+    GList *watches;
     unsigned int dom_id;
 
     /* The number of nodes which will exist in the tree if this op succeeds. */
@@ -166,6 +178,35 @@ struct walk_op {
     bool create_dirs;
 };
 
+static void fire_watches(struct walk_op *op, bool parents)
+{
+    GList *l = NULL;
+    XsWatch *w;
+
+    if (!op->mutating) {
+        return;
+    }
+
+    if (parents) {
+        l = op->watches;
+    }
+
+    w = g_hash_table_lookup(op->s->watches, op->path);
+    while (w || l) {
+        if (!w) {
+            /* Fire the parent nodes from 'op' if asked to */
+            w = l->data;
+            l = l->next;
+            continue;
+        }
+
+        assert(strlen(op->path) > w->rel_prefix);
+        w->cb(w->cb_opaque, op->path + w->rel_prefix, w->token);
+
+        w = w->next;
+    }
+}
+
 static int xs_node_add_content(XsNode **n, struct walk_op *op)
 {
     GByteArray *data = op->op_opaque;
@@ -213,6 +254,8 @@ static int xs_node_get_content(XsNode **n, struct walk_op *op)
 static int node_rm_recurse(gpointer key, gpointer value, gpointer user_data)
 {
     struct walk_op *op = user_data;
+    int path_len = strlen(op->path);
+    int key_len = strlen(key);
     XsNode *n = value;
     bool this_inplace = op->inplace;
 
@@ -220,11 +263,22 @@ static int node_rm_recurse(gpointer key, gpointer value, gpointer user_data)
         op->inplace = 0;
     }
 
+    assert(key_len + path_len + 2 <= sizeof(op->path));
+    op->path[path_len] = '/';
+    memcpy(op->path + path_len + 1, key, key_len + 1);
+
     if (n->children) {
         g_hash_table_foreach_remove(n->children, node_rm_recurse, op);
     }
     op->new_nr_nodes--;
 
+    /*
+     * Fire watches on *this* node but not the parents because they are
+     * going to be deleted too, so the watch will fire for them anyway.
+     */
+    fire_watches(op, false);
+    op->path[path_len] = '\0';
+
     /*
      * Actually deleting the child here is just an optimisation; if we
      * don't then the final unref on the topmost victim will just have
@@ -238,7 +292,7 @@ static int xs_node_rm(XsNode **n, struct walk_op *op)
 {
     bool this_inplace = op->inplace;
 
-    /* Keep count of the nodes in the subtree which gets deleted. */
+    /* Fire watches for, and count, nodes in the subtree which get deleted */
     if ((*n)->children) {
         g_hash_table_foreach_remove((*n)->children, node_rm_recurse, op);
     }
@@ -269,9 +323,11 @@ static int xs_node_walk(XsNode **n, struct walk_op *op)
     XsNode *old = *n, *child = NULL;
     bool stole_child = false;
     bool this_inplace;
+    XsWatch *watch;
     int err;
 
     namelen = strlen(op->path);
+    watch = g_hash_table_lookup(op->s->watches, op->path);
 
     /* Is there a child, or do we hit the double-NUL termination? */
     if (op->path[namelen + 1]) {
@@ -292,6 +348,9 @@ static int xs_node_walk(XsNode **n, struct walk_op *op)
     if (!child_name) {
         /* This is the actual node on which the operation shall be performed */
         err = op->op_fn(n, op);
+        if (!err) {
+            fire_watches(op, true);
+        }
         goto out;
     }
 
@@ -333,11 +392,24 @@ static int xs_node_walk(XsNode **n, struct walk_op *op)
         goto out;
     }
 
+    /*
+     * If there's a watch on this node, add it to the list to be fired
+     * (with the correct full pathname for the modified node) at the end.
+     */
+    if (watch) {
+        op->watches = g_list_append(op->watches, watch);
+    }
+
     /*
      * Except for the temporary child-stealing as noted, our node has not
      * changed yet. We don't yet know the overall operation will complete.
      */
     err = xs_node_walk(&child, op);
+
+    if (watch) {
+        op->watches = g_list_remove(op->watches, watch);
+    }
+
     if (err || !op->mutating) {
         if (stole_child) {
             /* Put it back as it was. */
@@ -375,6 +447,7 @@ static int xs_node_walk(XsNode **n, struct walk_op *op)
  out:
     op->path[namelen] = '\0';
     if (!namelen) {
+        assert(!op->watches);
         /*
          * On completing the recursion back up the path walk and reaching the
          * top, assign the new node count if the operation was successful.
@@ -457,6 +530,7 @@ static int init_walk_op(XenstoreImplState *s, struct walk_op *op,
      * path element for the lookup.
      */
     op->path[strlen(op->path) + 1] = '\0';
+    op->watches = NULL;
     op->path[0] = '\0';
     op->inplace = true;
     op->mutating = false;
@@ -589,38 +663,187 @@ int xs_impl_set_perms(XenstoreImplState *s, unsigned int dom_id,
 int xs_impl_watch(XenstoreImplState *s, unsigned int dom_id, const char *path,
                   const char *token, xs_impl_watch_fn fn, void *opaque)
 {
-    /*
-     * When calling the callback @fn, note that the path should
-     * precisely match the relative path that the guest provided, even
-     * if it was a relative path which needed to be prefixed with
-     * /local/domain/${domid}/
-     */
-    return ENOSYS;
+    char abspath[XENSTORE_ABS_PATH_MAX + 1];
+    XsWatch *w, *l;
+    int ret;
+
+    ret = validate_path(abspath, path, dom_id);
+    if (ret) {
+        return ret;
+    }
+
+    /* Check for duplicates */
+    l = w = g_hash_table_lookup(s->watches, abspath);
+    while (w) {
+        if (!g_strcmp0(token, w->token) &&  opaque == w->cb_opaque &&
+            fn == w->cb && dom_id == w->dom_id) {
+            return EEXIST;
+        }
+        w = w->next;
+    }
+
+    if (dom_id && s->nr_domu_watches >= XS_MAX_WATCHES) {
+        return E2BIG;
+    }
+
+    w = g_new0(XsWatch, 1);
+    w->token = g_strdup(token);
+    w->cb = fn;
+    w->cb_opaque = opaque;
+    w->dom_id = dom_id;
+    w->rel_prefix = strlen(abspath) - strlen(path);
+
+    /* l was looked up above when checking for duplicates */
+    if (l) {
+        w->next = l->next;
+        l->next = w;
+    } else {
+        g_hash_table_insert(s->watches, g_strdup(abspath), w);
+    }
+    if (dom_id) {
+        s->nr_domu_watches++;
+    }
+
+    /* A new watch should fire immediately */
+    fn(opaque, path, token);
+
+    return 0;
+}
+
+static XsWatch *free_watch(XenstoreImplState *s, XsWatch *w)
+{
+    XsWatch *next = w->next;
+
+    if (w->dom_id) {
+        assert(s->nr_domu_watches);
+        s->nr_domu_watches--;
+    }
+
+    g_free(w->token);
+    g_free(w);
+
+    return next;
 }
 
 int xs_impl_unwatch(XenstoreImplState *s, unsigned int dom_id,
                     const char *path, const char *token,
                     xs_impl_watch_fn fn, void *opaque)
 {
+    char abspath[XENSTORE_ABS_PATH_MAX + 1];
+    XsWatch *w, **l;
+    int ret;
+
+    ret = validate_path(abspath, path, dom_id);
+    if (ret) {
+        return ret;
+    }
+
+    w = g_hash_table_lookup(s->watches, abspath);
+    if (!w) {
+        return ENOENT;
+    }
+
     /*
-     * When calling the callback @fn, note that the path should
-     * precisely match the relative path that the guest provided, even
-     * if it was a relative path which needed to be prefixed with
-     * /local/domain/${domid}/
+     * The hash table contains the first element of a list of
+     * watches. Removing the first element in the list is a
+     * special case because we have to update the hash table to
+     * point to the next (or remove it if there's nothing left).
      */
-    return ENOSYS;
+    if (!g_strcmp0(token, w->token) && fn == w->cb && opaque == w->cb_opaque &&
+        dom_id == w->dom_id) {
+        if (w->next) {
+            /* Insert the previous 'next' into the hash table */
+            g_hash_table_insert(s->watches, g_strdup(abspath), w->next);
+        } else {
+            /* Nothing left; remove from hash table */
+            g_hash_table_remove(s->watches, abspath);
+        }
+        free_watch(s, w);
+        return 0;
+    }
+
+    /*
+     * We're all done messing with the hash table because the element
+     * it points to has survived the cull. Now it's just a simple
+     * linked list removal operation.
+     */
+    for (l = &w->next; *l; l = &w->next) {
+        w = *l;
+
+        if (!g_strcmp0(token, w->token) && fn == w->cb &&
+            opaque != w->cb_opaque && dom_id == w->dom_id) {
+            *l = free_watch(s, w);
+            return 0;
+        }
+    }
+
+    return ENOENT;
 }
 
 int xs_impl_reset_watches(XenstoreImplState *s, unsigned int dom_id)
 {
-    /* Remove the watch that matches all four criteria */
-    return ENOSYS;
+    char **watch_paths;
+    guint nr_watch_paths;
+    guint i;
+
+    watch_paths = (char **)g_hash_table_get_keys_as_array(s->watches,
+                                                          &nr_watch_paths);
+
+    for (i = 0; i < nr_watch_paths; i++) {
+        XsWatch *w1 = g_hash_table_lookup(s->watches, watch_paths[i]);
+        XsWatch *w2, *w, **l;
+
+        /*
+         * w1 is the original list. The hash table has this pointer.
+         * w2 is the head of our newly-filtered list.
+         * w and l are temporary for processing. w is somewhat redundant
+         * with *l but makes my eyes bleed less.
+         */
+
+        w = w2 = w1;
+        l = &w;
+        while (w) {
+            if (w->dom_id == dom_id) {
+                /* If we're freeing the head of the list, bump w2 */
+                if (w2 == w) {
+                    w2 = w->next;
+                }
+                *l = free_watch(s, w);
+            } else {
+                l = &w->next;
+            }
+            w = *l;
+        }
+        /*
+         * If the head of the list survived the cull, we don't need to
+         * touch the hash table and we're done with this path. Else...
+         */
+        if (w1 != w2) {
+            g_hash_table_steal(s->watches, watch_paths[i]);
+
+            /*
+             * It was already freed. (Don't worry, this whole thing is
+             * single-threaded and nobody saw it in the meantime). And
+             * having *stolen* it, we now own the watch_paths[i] string
+             * so if we don't give it back to the hash table, we need
+             * to free it.
+             */
+            if (w2) {
+                g_hash_table_insert(s->watches, watch_paths[i], w2);
+            } else {
+                g_free(watch_paths[i]);
+            }
+        }
+    }
+    g_free(watch_paths);
+    return 0;
 }
 
 XenstoreImplState *xs_impl_create(void)
 {
     XenstoreImplState *s = g_new0(XenstoreImplState, 1);
 
+    s->watches = g_hash_table_new_full(g_str_hash, g_str_equal, g_free, NULL);
     s->nr_nodes = 1;
     s->root = xs_node_new();
 #ifdef XS_NODE_UNIT_TEST
diff --git a/tests/unit/test-xs-node.c b/tests/unit/test-xs-node.c
index c78d5bd581..19000b64b2 100644
--- a/tests/unit/test-xs-node.c
+++ b/tests/unit/test-xs-node.c
@@ -34,10 +34,14 @@ static void xs_impl_delete(XenstoreImplState *s)
 {
     int err;
 
+    xs_impl_reset_watches(s, DOMID_GUEST);
+    g_assert(!s->nr_domu_watches);
+
     err = xs_impl_rm(s, DOMID_QEMU, XBT_NULL, "/local");
     g_assert(!err);
     g_assert(s->nr_nodes == 1);
 
+    g_hash_table_unref(s->watches);
     xs_node_unref(s->root);
     g_free(s);
 
@@ -65,6 +69,14 @@ static int write_str(XenstoreImplState *s, unsigned int dom_id,
     return err;
 }
 
+static void watch_cb(void *_str, const char *path, const char *token)
+{
+    GString *str = _str;
+
+    g_string_append(str, path);
+    g_string_append(str, token);
+}
+
 static XenstoreImplState *setup(void)
 {
    XenstoreImplState *s = xs_impl_create();
@@ -75,6 +87,7 @@ static XenstoreImplState *setup(void)
 
    err = write_str(s, DOMID_QEMU, XBT_NULL, abspath, "");
    g_assert(!err);
+   g_assert(s->nr_nodes == 4);
 
    g_free(abspath);
 
@@ -93,6 +106,8 @@ static void test_xs_node_simple(void)
 {
     GByteArray *data = g_byte_array_new();
     XenstoreImplState *s = setup();
+    GString *guest_watches = g_string_new(NULL);
+    GString *qemu_watches = g_string_new(NULL);
     GList *items = NULL;
     XsNode *old_root;
     uint64_t gencnt;
@@ -100,6 +115,20 @@ static void test_xs_node_simple(void)
 
     g_assert(s);
 
+    err = xs_impl_watch(s, DOMID_GUEST, "some", "guestwatch",
+                        watch_cb, guest_watches);
+    g_assert(!err);
+    g_assert(guest_watches->len == strlen("someguestwatch"));
+    g_assert(!strcmp(guest_watches->str, "someguestwatch"));
+    g_string_truncate(guest_watches, 0);
+
+    err = xs_impl_watch(s, 0, "/local/domain/1/some", "qemuwatch",
+                        watch_cb, qemu_watches);
+    g_assert(!err);
+    g_assert(qemu_watches->len == strlen("/local/domain/1/someqemuwatch"));
+    g_assert(!strcmp(qemu_watches->str, "/local/domain/1/someqemuwatch"));
+    g_string_truncate(qemu_watches, 0);
+
     /* Read gives ENOENT when it should */
     err = xs_impl_read(s, DOMID_GUEST, XBT_NULL, "foo", data);
     g_assert(err == ENOENT);
@@ -109,6 +138,14 @@ static void test_xs_node_simple(void)
                     "something");
     g_assert(s->nr_nodes == 7);
     g_assert(!err);
+    g_assert(!strcmp(guest_watches->str,
+                     "some/relative/pathguestwatch"));
+    g_assert(!strcmp(qemu_watches->str,
+                     "/local/domain/1/some/relative/pathqemuwatch"));
+
+    g_string_truncate(qemu_watches, 0);
+    g_string_truncate(guest_watches, 0);
+    xs_impl_reset_watches(s, 0);
 
     /* Read gives back what we wrote */
     err = xs_impl_read(s, DOMID_GUEST, XBT_NULL, "some/relative/path", data);
@@ -123,6 +160,8 @@ static void test_xs_node_simple(void)
     g_assert(!err);
     g_assert(data->len == strlen("something"));
 
+    g_assert(!qemu_watches->len);
+    g_assert(!guest_watches->len);
     /* Keep a copy, to force COW mode */
     old_root = xs_node_ref(s->root);
 
@@ -132,12 +171,18 @@ static void test_xs_node_simple(void)
                     "something else");
     g_assert(!err);
     g_assert(s->nr_nodes == 8);
+    g_assert(!qemu_watches->len);
+    g_assert(!strcmp(guest_watches->str, "some/relative/path2guestwatch"));
+    g_string_truncate(guest_watches, 0);
 
     /* Overwrite an existing node */
     err = write_str(s, DOMID_GUEST, XBT_NULL, "some/relative/path",
                     "another thing");
     g_assert(!err);
     g_assert(s->nr_nodes == 8);
+    g_assert(!qemu_watches->len);
+    g_assert(!strcmp(guest_watches->str, "some/relative/pathguestwatch"));
+    g_string_truncate(guest_watches, 0);
 
     /* We can list the two files we wrote */
     err = xs_impl_directory(s, DOMID_GUEST, XBT_NULL, "some/relative", &gencnt,
@@ -151,9 +196,38 @@ static void test_xs_node_simple(void)
     g_assert(!items->next->next);
     g_list_free_full(items, g_free);
 
+    err = xs_impl_unwatch(s, DOMID_GUEST, "some", "guestwatch",
+                          watch_cb, guest_watches);
+    g_assert(!err);
+
+    err = xs_impl_unwatch(s, DOMID_GUEST, "some", "guestwatch",
+                          watch_cb, guest_watches);
+    g_assert(err == ENOENT);
+
+    err = xs_impl_watch(s, DOMID_GUEST, "some/relative/path2", "watchp2",
+                        watch_cb, guest_watches);
+    g_assert(!err);
+    g_assert(guest_watches->len == strlen("some/relative/path2watchp2"));
+    g_assert(!strcmp(guest_watches->str, "some/relative/path2watchp2"));
+    g_string_truncate(guest_watches, 0);
+
+    err = xs_impl_watch(s, DOMID_GUEST, "/local/domain/1/some/relative",
+                        "watchrel", watch_cb, guest_watches);
+    g_assert(!err);
+    g_assert(guest_watches->len ==
+             strlen("/local/domain/1/some/relativewatchrel"));
+    g_assert(!strcmp(guest_watches->str,
+                     "/local/domain/1/some/relativewatchrel"));
+    g_string_truncate(guest_watches, 0);
+
     /* Write somewhere else which already existed */
     err = write_str(s, DOMID_GUEST, XBT_NULL, "some/relative", "moredata");
     g_assert(!err);
+    g_assert(s->nr_nodes == 8);
+
+    g_assert(!strcmp(guest_watches->str,
+                     "/local/domain/1/some/relativewatchrel"));
+    g_string_truncate(guest_watches, 0);
 
     g_byte_array_set_size(data, 0);
     err = xs_impl_read(s, DOMID_GUEST, XBT_NULL, "some/relative", data);
@@ -164,6 +238,7 @@ static void test_xs_node_simple(void)
     /* Overwrite existing data */
     err = write_str(s, DOMID_GUEST, XBT_NULL, "some/relative", "otherdata");
     g_assert(!err);
+    g_string_truncate(guest_watches, 0);
 
     g_byte_array_set_size(data, 0);
     err = xs_impl_read(s, DOMID_GUEST, XBT_NULL, "some/relative", data);
@@ -176,11 +251,21 @@ static void test_xs_node_simple(void)
     g_assert(!err);
     g_assert(s->nr_nodes == 5);
 
+    /* Each watch fires with the least specific relevant path */
+    g_assert(strstr(guest_watches->str,
+                    "some/relative/path2watchp2"));
+    g_assert(strstr(guest_watches->str,
+                    "/local/domain/1/some/relativewatchrel"));
+    g_string_truncate(guest_watches, 0);
+
     g_byte_array_set_size(data, 0);
     err = xs_impl_read(s, DOMID_GUEST, XBT_NULL, "some/relative", data);
     g_assert(err == ENOENT);
     g_byte_array_unref(data);
 
+    xs_impl_reset_watches(s, DOMID_GUEST);
+    g_string_free(qemu_watches, true);
+    g_string_free(guest_watches, true);
     xs_node_unref(old_root);
     xs_impl_delete(s);
 }
-- 
2.39.0


