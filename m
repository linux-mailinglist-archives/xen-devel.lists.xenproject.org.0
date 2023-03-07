Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD6A6AF05E
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 19:30:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507813.781973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZc3w-00054i-GT; Tue, 07 Mar 2023 18:29:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507813.781973; Tue, 07 Mar 2023 18:29:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZc3w-00050i-7S; Tue, 07 Mar 2023 18:29:24 +0000
Received: by outflank-mailman (input) for mailman id 507813;
 Tue, 07 Mar 2023 18:29:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yYpO=67=casper.srs.infradead.org=BATV+9298a7250c90fe94fbb7+7135+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pZc27-0002MP-7G
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 18:27:31 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2d9ae03-bd15-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 19:27:21 +0100 (CET)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pZc1n-006deA-4y; Tue, 07 Mar 2023 18:27:11 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pZc1n-009e8V-0M; Tue, 07 Mar 2023 18:27:11 +0000
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
X-Inumbo-ID: b2d9ae03-bd15-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=f47Z62qCt++fBsDGyE1O3bc9SRNNoe9XPhR3UVxqg/A=; b=crGhH6TPykVEcAXCssplaY/s1h
	RuyFaiIMGkmMixxVv14glZ8WCHFyWyLHxo6q9l8nhN60NDNQvwoC65YH0n93ypz1RtlUvrjhV/Ajz
	BUcLKrKcZntZ/sG5wGbAkCnPecXooPzZEoKiCNF13AmrvgM6mbDnyMqrsvqbiEcWDtq3FYRl1AqOu
	rfEa8vItzY6e5wcPp7hz0acgGZbIzaxgryeTA7ilFkB4adL7BLg1ddkWtX7HBxE2ey6CXvQfBUXFi
	USkG0Guqcfb9WzL0Z91xlVsC1A/My9cu1x6LDwww23/7dN6Ope+qCjiDbsAdqMo/e/GUXi+5LNqja
	H+oMjqoQ==;
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
Subject: [PULL 06/27] hw/xen: Implement XenStore permissions
Date: Tue,  7 Mar 2023 18:26:46 +0000
Message-Id: <20230307182707.2298618-7-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307182707.2298618-1-dwmw2@infradead.org>
References: <20230307182707.2298618-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: Paul Durrant <pdurrant@amazon.com>

Store perms as a GList of strings, check permissions.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_xenstore.c  |   2 +-
 hw/i386/kvm/xenstore_impl.c | 259 +++++++++++++++++++++++++++++++++---
 hw/i386/kvm/xenstore_impl.h |   8 +-
 tests/unit/test-xs-node.c   |  27 +++-
 4 files changed, 275 insertions(+), 21 deletions(-)

diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index 64d8f1a38f..3b409e3817 100644
--- a/hw/i386/kvm/xen_xenstore.c
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -98,7 +98,7 @@ static void xen_xenstore_realize(DeviceState *dev, Error **errp)
     aio_set_fd_handler(qemu_get_aio_context(), xen_be_evtchn_fd(s->eh), true,
                        xen_xenstore_event, NULL, NULL, NULL, s);
 
-    s->impl = xs_impl_create();
+    s->impl = xs_impl_create(xen_domid);
 }
 
 static bool xen_xenstore_is_needed(void *opaque)
diff --git a/hw/i386/kvm/xenstore_impl.c b/hw/i386/kvm/xenstore_impl.c
index 60f42f61d6..8a2053e243 100644
--- a/hw/i386/kvm/xenstore_impl.c
+++ b/hw/i386/kvm/xenstore_impl.c
@@ -12,6 +12,8 @@
 #include "qemu/osdep.h"
 #include "qom/object.h"
 
+#include "hw/xen/xen.h"
+
 #include "xen_xenstore.h"
 #include "xenstore_impl.h"
 
@@ -30,6 +32,7 @@
 typedef struct XsNode {
     uint32_t ref;
     GByteArray *content;
+    GList *perms;
     GHashTable *children;
     uint64_t gencnt;
     bool deleted_in_tx;
@@ -133,6 +136,9 @@ static inline void xs_node_unref(XsNode *n)
     if (n->content) {
         g_byte_array_unref(n->content);
     }
+    if (n->perms) {
+        g_list_free_full(n->perms, g_free);
+    }
     if (n->children) {
         g_hash_table_unref(n->children);
     }
@@ -144,8 +150,51 @@ static inline void xs_node_unref(XsNode *n)
     g_free(n);
 }
 
+char *xs_perm_as_string(unsigned int perm, unsigned int domid)
+{
+    char letter;
+
+    switch (perm) {
+    case XS_PERM_READ | XS_PERM_WRITE:
+        letter = 'b';
+        break;
+    case XS_PERM_READ:
+        letter = 'r';
+        break;
+    case XS_PERM_WRITE:
+        letter = 'w';
+        break;
+    case XS_PERM_NONE:
+    default:
+        letter = 'n';
+        break;
+    }
+
+    return g_strdup_printf("%c%u", letter, domid);
+}
+
+static gpointer do_perm_copy(gconstpointer src, gpointer user_data)
+{
+    return g_strdup(src);
+}
+
+static XsNode *xs_node_create(const char *name, GList *perms)
+{
+    XsNode *n = xs_node_new();
+
+#ifdef XS_NODE_UNIT_TEST
+    if (name) {
+        n->name = g_strdup(name);
+    }
+#endif
+
+    n->perms = g_list_copy_deep(perms, do_perm_copy, NULL);
+
+    return n;
+}
+
 /* For copying from one hash table to another using g_hash_table_foreach() */
-static void do_insert(gpointer key, gpointer value, gpointer user_data)
+static void do_child_insert(gpointer key, gpointer value, gpointer user_data)
 {
     g_hash_table_insert(user_data, g_strdup(key), xs_node_ref(value));
 }
@@ -162,12 +211,16 @@ static XsNode *xs_node_copy(XsNode *old)
     }
 #endif
 
+    assert(old);
     if (old->children) {
         n->children = g_hash_table_new_full(g_str_hash, g_str_equal, g_free,
                                             (GDestroyNotify)xs_node_unref);
-        g_hash_table_foreach(old->children, do_insert, n->children);
+        g_hash_table_foreach(old->children, do_child_insert, n->children);
     }
-    if (old && old->content) {
+    if (old->perms) {
+        n->perms = g_list_copy_deep(old->perms, do_perm_copy, NULL);
+    }
+    if (old->content) {
         n->content = g_byte_array_ref(old->content);
     }
     return n;
@@ -383,6 +436,9 @@ static XsNode *xs_node_copy_deleted(XsNode *old, struct walk_op *op)
         op->op_opaque2 = n->children;
         g_hash_table_foreach(old->children, copy_deleted_recurse, op);
     }
+    if (old->perms) {
+        n->perms = g_list_copy_deep(old->perms, do_perm_copy, NULL);
+    }
     n->deleted_in_tx = true;
     /* If it gets resurrected we only fire a watch if it lost its content */
     if (old->content) {
@@ -417,6 +473,104 @@ static int xs_node_rm(XsNode **n, struct walk_op *op)
     return 0;
 }
 
+static int xs_node_get_perms(XsNode **n, struct walk_op *op)
+{
+    GList **perms = op->op_opaque;
+
+    assert(op->inplace);
+    assert(*n);
+
+    *perms = g_list_copy_deep((*n)->perms, do_perm_copy, NULL);
+    return 0;
+}
+
+static void parse_perm(const char *perm, char *letter, unsigned int *dom_id)
+{
+    unsigned int n = sscanf(perm, "%c%u", letter, dom_id);
+
+    assert(n == 2);
+}
+
+static bool can_access(unsigned int dom_id, GList *perms, const char *letters)
+{
+    unsigned int i, n;
+    char perm_letter;
+    unsigned int perm_dom_id;
+    bool access;
+
+    if (dom_id == 0) {
+        return true;
+    }
+
+    n = g_list_length(perms);
+    assert(n >= 1);
+
+    /*
+     * The dom_id of the first perm is the owner, and the owner always has
+     * read-write access.
+     */
+    parse_perm(g_list_nth_data(perms, 0), &perm_letter, &perm_dom_id);
+    if (dom_id == perm_dom_id) {
+        return true;
+    }
+
+    /*
+     * The letter of the first perm specified the default access for all other
+     * domains.
+     */
+    access = !!strchr(letters, perm_letter);
+    for (i = 1; i < n; i++) {
+        parse_perm(g_list_nth_data(perms, i), &perm_letter, &perm_dom_id);
+        if (dom_id != perm_dom_id) {
+            continue;
+        }
+        access = !!strchr(letters, perm_letter);
+    }
+
+    return access;
+}
+
+static int xs_node_set_perms(XsNode **n, struct walk_op *op)
+{
+    GList *perms = op->op_opaque;
+
+    if (op->dom_id) {
+        unsigned int perm_dom_id;
+        char perm_letter;
+
+        /* A guest may not change permissions on nodes it does not own */
+        if (!can_access(op->dom_id, (*n)->perms, "")) {
+            return EPERM;
+        }
+
+        /* A guest may not change the owner of a node it owns. */
+        parse_perm(perms->data, &perm_letter, &perm_dom_id);
+        if (perm_dom_id != op->dom_id) {
+            return EPERM;
+        }
+
+        if (g_list_length(perms) > XS_MAX_PERMS_PER_NODE) {
+            return ENOSPC;
+        }
+    }
+
+    /* We *are* the node to be written. Either this or a copy. */
+    if (!op->inplace) {
+        XsNode *old = *n;
+        *n = xs_node_copy(old);
+        xs_node_unref(old);
+    }
+
+    if ((*n)->perms) {
+        g_list_free_full((*n)->perms, g_free);
+    }
+    (*n)->perms = g_list_copy_deep(perms, do_perm_copy, NULL);
+    if (op->tx_id != XBT_NULL) {
+        (*n)->modified_in_tx = true;
+    }
+    return 0;
+}
+
 /*
  * Passed a full reference in *n which it may free if it needs to COW.
  *
@@ -458,6 +612,13 @@ static int xs_node_walk(XsNode **n, struct walk_op *op)
     }
 
     if (!child_name) {
+        const char *letters = op->mutating ? "wb" : "rb";
+
+        if (!can_access(op->dom_id, old->perms, letters)) {
+            err = EACCES;
+            goto out;
+        }
+
         /* This is the actual node on which the operation shall be performed */
         err = op->op_fn(n, op);
         if (!err) {
@@ -491,12 +652,20 @@ static int xs_node_walk(XsNode **n, struct walk_op *op)
             stole_child = true;
         }
     } else if (op->create_dirs) {
+        assert(op->mutating);
+
+        if (!can_access(op->dom_id, old->perms, "wb")) {
+            err = EACCES;
+            goto out;
+        }
+
         if (op->dom_id && op->new_nr_nodes >= XS_MAX_DOMAIN_NODES) {
             err = ENOSPC;
             goto out;
         }
+
+        child = xs_node_create(child_name, old->perms);
         op->new_nr_nodes++;
-        child = xs_node_new();
 
         /*
          * If we're creating a new child, we can clearly modify it (and its
@@ -918,20 +1087,73 @@ int xs_impl_rm(XenstoreImplState *s, unsigned int dom_id,
 int xs_impl_get_perms(XenstoreImplState *s, unsigned int dom_id,
                       xs_transaction_t tx_id, const char *path, GList **perms)
 {
-    /*
-     * The perms are (char *) in the <perm-as-string> wire format to be
-     * freed by the caller.
-     */
-    return ENOSYS;
+    struct walk_op op;
+    XsNode **n;
+    int ret;
+
+    ret = init_walk_op(s, &op, tx_id, dom_id, path, &n);
+    if (ret) {
+        return ret;
+    }
+    op.op_fn = xs_node_get_perms;
+    op.op_opaque = perms;
+    return xs_node_walk(n, &op);
+}
+
+static void is_valid_perm(gpointer data, gpointer user_data)
+{
+    char *perm = data;
+    bool *valid = user_data;
+    char letter;
+    unsigned int dom_id;
+
+    if (!*valid) {
+        return;
+    }
+
+    if (sscanf(perm, "%c%u", &letter, &dom_id) != 2) {
+        *valid = false;
+        return;
+    }
+
+    switch (letter) {
+    case 'n':
+    case 'r':
+    case 'w':
+    case 'b':
+        break;
+
+    default:
+        *valid = false;
+        break;
+    }
 }
 
 int xs_impl_set_perms(XenstoreImplState *s, unsigned int dom_id,
                       xs_transaction_t tx_id, const char *path, GList *perms)
 {
-    /*
-     * The perms are (const char *) in the <perm-as-string> wire format.
-     */
-    return ENOSYS;
+    struct walk_op op;
+    XsNode **n;
+    bool valid = true;
+    int ret;
+
+    if (!g_list_length(perms)) {
+        return EINVAL;
+    }
+
+    g_list_foreach(perms, is_valid_perm, &valid);
+    if (!valid) {
+        return EINVAL;
+    }
+
+    ret = init_walk_op(s, &op, tx_id, dom_id, path, &n);
+    if (ret) {
+        return ret;
+    }
+    op.op_fn = xs_node_set_perms;
+    op.op_opaque = perms;
+    op.mutating = true;
+    return xs_node_walk(n, &op);
 }
 
 int xs_impl_watch(XenstoreImplState *s, unsigned int dom_id, const char *path,
@@ -1122,18 +1344,19 @@ static void xs_tx_free(void *_tx)
     g_free(tx);
 }
 
-XenstoreImplState *xs_impl_create(void)
+XenstoreImplState *xs_impl_create(unsigned int dom_id)
 {
     XenstoreImplState *s = g_new0(XenstoreImplState, 1);
+    GList *perms;
 
     s->watches = g_hash_table_new_full(g_str_hash, g_str_equal, g_free, NULL);
     s->transactions = g_hash_table_new_full(g_direct_hash, g_direct_equal,
                                             NULL, xs_tx_free);
+
+    perms = g_list_append(NULL, xs_perm_as_string(XS_PERM_NONE, 0));
+    s->root = xs_node_create("/", perms);
+    g_list_free_full(perms, g_free);
     s->nr_nodes = 1;
-    s->root = xs_node_new();
-#ifdef XS_NODE_UNIT_TEST
-    s->root->name = g_strdup("/");
-#endif
 
     s->root_tx = s->last_tx = 1;
     return s;
diff --git a/hw/i386/kvm/xenstore_impl.h b/hw/i386/kvm/xenstore_impl.h
index beb7b29ab8..2f81251b5e 100644
--- a/hw/i386/kvm/xenstore_impl.h
+++ b/hw/i386/kvm/xenstore_impl.h
@@ -16,9 +16,15 @@ typedef uint32_t xs_transaction_t;
 
 #define XBT_NULL 0
 
+#define XS_PERM_NONE  0x00
+#define XS_PERM_READ  0x01
+#define XS_PERM_WRITE 0x02
+
 typedef struct XenstoreImplState XenstoreImplState;
 
-XenstoreImplState *xs_impl_create(void);
+XenstoreImplState *xs_impl_create(unsigned int dom_id);
+
+char *xs_perm_as_string(unsigned int perm, unsigned int domid);
 
 /*
  * These functions return *positive* error numbers. This is a little
diff --git a/tests/unit/test-xs-node.c b/tests/unit/test-xs-node.c
index 02c72baa62..2c0f89c694 100644
--- a/tests/unit/test-xs-node.c
+++ b/tests/unit/test-xs-node.c
@@ -80,8 +80,9 @@ static void watch_cb(void *_str, const char *path, const char *token)
 
 static XenstoreImplState *setup(void)
 {
-   XenstoreImplState *s = xs_impl_create();
+   XenstoreImplState *s = xs_impl_create(DOMID_GUEST);
    char *abspath;
+   GList *perms;
    int err;
 
    abspath = g_strdup_printf("/local/domain/%u", DOMID_GUEST);
@@ -90,6 +91,13 @@ static XenstoreImplState *setup(void)
    g_assert(!err);
    g_assert(s->nr_nodes == 4);
 
+   perms = g_list_append(NULL, g_strdup_printf("n%u", DOMID_QEMU));
+   perms = g_list_append(perms, g_strdup_printf("r%u", DOMID_GUEST));
+
+   err = xs_impl_set_perms(s, DOMID_QEMU, XBT_NULL, abspath, perms);
+   g_assert(!err);
+
+   g_list_free_full(perms, g_free);
    g_free(abspath);
 
    abspath = g_strdup_printf("/local/domain/%u/some", DOMID_GUEST);
@@ -98,6 +106,12 @@ static XenstoreImplState *setup(void)
    g_assert(!err);
    g_assert(s->nr_nodes == 5);
 
+   perms = g_list_append(NULL, g_strdup_printf("n%u", DOMID_GUEST));
+
+   err = xs_impl_set_perms(s, DOMID_QEMU, XBT_NULL, abspath, perms);
+   g_assert(!err);
+
+   g_list_free_full(perms, g_free);
    g_free(abspath);
 
    return s;
@@ -166,6 +180,12 @@ static void test_xs_node_simple(void)
     /* Keep a copy, to force COW mode */
     old_root = xs_node_ref(s->root);
 
+    /* Write somewhere we aren't allowed, in COW mode */
+    err = write_str(s, DOMID_GUEST, XBT_NULL, "/local/domain/badplace",
+                    "moredata");
+    g_assert(err == EACCES);
+    g_assert(s->nr_nodes == 7);
+
     /* Write works again */
     err = write_str(s, DOMID_GUEST, XBT_NULL,
                     "/local/domain/1/some/relative/path2",
@@ -226,6 +246,11 @@ static void test_xs_node_simple(void)
     g_assert(!err);
     g_assert(s->nr_nodes == 8);
 
+    /* Write somewhere we aren't allowed */
+    err = write_str(s, DOMID_GUEST, XBT_NULL, "/local/domain/badplace",
+                    "moredata");
+    g_assert(err == EACCES);
+
     g_assert(!strcmp(guest_watches->str,
                      "/local/domain/1/some/relativewatchrel"));
     g_string_truncate(guest_watches, 0);
-- 
2.39.0


