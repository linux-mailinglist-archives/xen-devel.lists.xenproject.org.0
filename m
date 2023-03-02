Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A778E6A857D
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 16:39:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505185.777825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXl25-0006m1-C4; Thu, 02 Mar 2023 15:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505185.777825; Thu, 02 Mar 2023 15:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXl25-0006i9-7C; Thu, 02 Mar 2023 15:39:49 +0000
Received: by outflank-mailman (input) for mailman id 505185;
 Thu, 02 Mar 2023 15:39:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZMsQ=62=desiato.srs.infradead.org=BATV+9a0490e5ac528e462c30+7130+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pXkxW-0001Jw-Og
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 15:35:06 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2b78cc0-b90f-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 16:34:49 +0100 (CET)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pXkx5-00FL3r-07; Thu, 02 Mar 2023 15:34:41 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pXkx4-004uzk-2x; Thu, 02 Mar 2023 15:34:38 +0000
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
X-Inumbo-ID: c2b78cc0-b90f-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=GIy/mr/P0dU4lKy5osmGAuO163GgHpykyx4+8Dxy3J8=; b=psZYAy7hv1vPQkhNzx5j+j6PHj
	aUyGV4bYYciEJOkFzCEJhMbOARGxDslIEJw4j6rxUHi9qpYkgFnxvxXqk03Pp+ElrcJlqwIbw+kjg
	0RXL1heQljsalhW8cGZyUm5iCD4ShOcWcXuuPNF4VhSVDPNv4zLroaiJOyTgIwDKcEMURGOw8VKyK
	GsT8GvlhpqTuky3/UE+sacR11dim6D8pDQtAmaXf5qZxu4Zs/zJAPFF28d6emV39xcadQbJdnnXyE
	aZsTR+Ey1CRyZYzmWD7AnOg1oliBGmpQ3E7GMXZvW/AiYUQS3GKoL1fMm0WGxCRfjqHGGj7IrPXNt
	PTJwgqWw==;
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
Subject: [RFC PATCH v1 22/25] hw/xen: Add emulated implementation of XenStore operations
Date: Thu,  2 Mar 2023 15:34:32 +0000
Message-Id: <20230302153435.1170111-23-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230302153435.1170111-1-dwmw2@infradead.org>
References: <20230302153435.1170111-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Now that we have an internal implementation of XenStore, we can populate
the xenstore_backend_ops to allow PV backends to talk to it.

Watches can't be processed with immediate callbacks because that would
call back into XenBus code recursively. Defer them to a QEMUBH to be run
as appropriate from the main loop. We use a QEMUBH per XS handle, and it
walks all the watches (there shouldn't be many per handle) to fire any
which have pending events. We *could* have done it differently but this
allows us to use the same struct watch_event as we have for the guest
side, and keeps things relatively simple.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_xenstore.c | 273 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 269 insertions(+), 4 deletions(-)

diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index bab40d1a04..028f80499e 100644
--- a/hw/i386/kvm/xen_xenstore.c
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -49,7 +49,7 @@ struct XenXenstoreState {
     /*< public >*/
 
     XenstoreImplState *impl;
-    GList *watch_events;
+    GList *watch_events; /* for the guest */
 
     MemoryRegion xenstore_page;
     struct xenstore_domain_interface *xs;
@@ -73,6 +73,8 @@ struct XenXenstoreState *xen_xenstore_singleton;
 static void xen_xenstore_event(void *opaque);
 static void fire_watch_cb(void *opaque, const char *path, const char *token);
 
+static struct xenstore_backend_ops emu_xenstore_backend_ops;
+
 static void G_GNUC_PRINTF (4, 5) relpath_printf(XenXenstoreState *s,
                                                 GList *perms,
                                                 const char *relpath,
@@ -169,6 +171,8 @@ static void xen_xenstore_realize(DeviceState *dev, Error **errp)
     relpath_printf(s, perms, "feature", "%s", "");
 
     g_list_free_full(perms, g_free);
+
+    xen_xenstore_ops = &emu_xenstore_backend_ops;
 }
 
 static bool xen_xenstore_is_needed(void *opaque)
@@ -1305,6 +1309,15 @@ struct watch_event {
     char *token;
 };
 
+static void free_watch_event(struct watch_event *ev)
+{
+    if (ev) {
+        g_free(ev->path);
+        g_free(ev->token);
+        g_free(ev);
+    }
+}
+
 static void queue_watch(XenXenstoreState *s, const char *path,
                         const char *token)
 {
@@ -1351,9 +1364,7 @@ static void process_watch_events(XenXenstoreState *s)
     deliver_watch(s, ev->path, ev->token);
 
     s->watch_events = g_list_remove(s->watch_events, ev);
-    g_free(ev->path);
-    g_free(ev->token);
-    g_free(ev);
+    free_watch_event(ev);
 }
 
 static void xen_xenstore_event(void *opaque)
@@ -1443,3 +1454,257 @@ int xen_xenstore_reset(void)
 
     return 0;
 }
+
+struct qemu_xs_handle {
+    XenstoreImplState *impl;
+    GList *watches;
+    QEMUBH *watch_bh;
+};
+
+struct qemu_xs_watch {
+    struct qemu_xs_handle *h;
+    char *path;
+    xs_watch_fn fn;
+    void *opaque;
+    GList *events;
+};
+
+static char *xs_be_get_domain_path(struct qemu_xs_handle *h, unsigned int domid)
+{
+    return g_strdup_printf("/local/domain/%u", domid);
+}
+
+static char **xs_be_directory(struct qemu_xs_handle *h, xs_transaction_t t,
+                              const char *path, unsigned int *num)
+{
+    GList *items = NULL, *l;
+    unsigned int i = 0;
+    char **items_ret;
+    int err;
+
+    err = xs_impl_directory(h->impl, DOMID_QEMU, t, path, NULL, &items);
+    if (err) {
+        errno = err;
+        return NULL;
+    }
+
+    items_ret = g_new0(char *, g_list_length(items) + 1);
+    *num = 0;
+    for (l = items; l; l = l->next) {
+        items_ret[i++] = l->data;
+        (*num)++;
+    }
+    g_list_free(items);
+    return items_ret;
+}
+
+static void *xs_be_read(struct qemu_xs_handle *h, xs_transaction_t t,
+                        const char *path, unsigned int *len)
+{
+    GByteArray *data = g_byte_array_new();
+    bool free_segment = false;
+    int err;
+
+    err = xs_impl_read(h->impl, DOMID_QEMU, t, path, data);
+    if (err) {
+        free_segment = true;
+        errno = err;
+    } else {
+        if (len) {
+            *len = data->len;
+        }
+        /* The xen-bus-helper code expects to get NUL terminated string! */
+        g_byte_array_append(data, (void *)"", 1);
+    }
+
+    return g_byte_array_free(data, free_segment);
+}
+
+static bool xs_be_write(struct qemu_xs_handle *h, xs_transaction_t t,
+                        const char *path, const void *data, unsigned int len)
+{
+    GByteArray *gdata = g_byte_array_new();
+    int err;
+
+    g_byte_array_append(gdata, data, len);
+    err = xs_impl_write(h->impl, DOMID_QEMU, t, path, gdata);
+    g_byte_array_unref(gdata);
+    if (err) {
+        errno = err;
+        return false;
+    }
+    return true;
+}
+
+static bool xs_be_create(struct qemu_xs_handle *h, xs_transaction_t t,
+                         unsigned int owner, unsigned int domid,
+                         unsigned int perms, const char *path)
+{
+    g_autoptr(GByteArray) data = g_byte_array_new();
+    GList *perms_list = NULL;
+    int err;
+
+    /* mkdir does this */
+    err = xs_impl_read(h->impl, DOMID_QEMU, t, path, data);
+    if (err == ENOENT) {
+        err = xs_impl_write(h->impl, DOMID_QEMU, t, path, data);
+    }
+    if (err) {
+        errno = err;
+        return false;
+    }
+
+    perms_list = g_list_append(perms_list,
+                               xs_perm_as_string(XS_PERM_NONE, owner));
+    perms_list = g_list_append(perms_list,
+                               xs_perm_as_string(perms, domid));
+
+    err = xs_impl_set_perms(h->impl, DOMID_QEMU, t, path, perms_list);
+    g_list_free_full(perms_list, g_free);
+    if (err) {
+        errno = err;
+        return false;
+    }
+    return true;
+}
+
+static bool xs_be_destroy(struct qemu_xs_handle *h, xs_transaction_t t,
+                          const char *path)
+{
+    int err = xs_impl_rm(h->impl, DOMID_QEMU, t, path);
+    if (err) {
+        errno = err;
+        return false;
+    }
+    return true;
+}
+
+static void be_watch_bh(void *_h)
+{
+    struct qemu_xs_handle *h = _h;
+    GList *l;
+
+    for (l = h->watches; l; l = l->next) {
+        struct qemu_xs_watch *w = l->data;
+
+        while (w->events) {
+            struct watch_event *ev = w->events->data;
+
+            w->fn(w->opaque, ev->path);
+
+            w->events = g_list_remove(w->events, ev);
+            free_watch_event(ev);
+        }
+    }
+}
+
+static void xs_be_watch_cb(void *opaque, const char *path, const char *token)
+{
+    struct watch_event *ev = g_new0(struct watch_event, 1);
+    struct qemu_xs_watch *w = opaque;
+
+    /* We don't care about the token */
+    ev->path = g_strdup(path);
+    w->events = g_list_append(w->events, ev);
+
+    qemu_bh_schedule(w->h->watch_bh);
+}
+
+static struct qemu_xs_watch *xs_be_watch(struct qemu_xs_handle *h,
+                                         const char *path, xs_watch_fn fn,
+                                         void *opaque)
+{
+    struct qemu_xs_watch *w = g_new0(struct qemu_xs_watch, 1);
+    int err;
+
+    w->h = h;
+    w->fn = fn;
+    w->opaque = opaque;
+
+    err = xs_impl_watch(h->impl, DOMID_QEMU, path, NULL, xs_be_watch_cb, w);
+    if (err) {
+        errno = err;
+        g_free(w);
+        return NULL;
+    }
+
+    w->path = g_strdup(path);
+    h->watches = g_list_append(h->watches, w);
+    return w;
+}
+
+static void xs_be_unwatch(struct qemu_xs_handle *h, struct qemu_xs_watch *w)
+{
+    xs_impl_unwatch(h->impl, DOMID_QEMU, w->path, NULL, xs_be_watch_cb, w);
+
+    h->watches = g_list_remove(h->watches, w);
+    g_list_free_full(w->events, (GDestroyNotify)free_watch_event);
+    g_free(w->path);
+    g_free(w);
+}
+
+static xs_transaction_t xs_be_transaction_start(struct qemu_xs_handle *h)
+{
+    unsigned int new_tx = XBT_NULL;
+    int err = xs_impl_transaction_start(h->impl, DOMID_QEMU, &new_tx);
+    if (err) {
+        errno = err;
+        return XBT_NULL;
+    }
+    return new_tx;
+}
+
+static bool xs_be_transaction_end(struct qemu_xs_handle *h, xs_transaction_t t,
+                                  bool abort)
+{
+    int err = xs_impl_transaction_end(h->impl, DOMID_QEMU, t, !abort);
+    if (err) {
+        errno = err;
+        return false;
+    }
+    return true;
+}
+
+static struct qemu_xs_handle *xs_be_open(void)
+{
+    XenXenstoreState *s = xen_xenstore_singleton;
+    struct qemu_xs_handle *h;
+
+    if (!s && !s->impl) {
+        errno = -ENOSYS;
+        return NULL;
+    }
+
+    h = g_new0(struct qemu_xs_handle, 1);
+    h->impl = s->impl;
+
+    h->watch_bh = aio_bh_new(qemu_get_aio_context(), be_watch_bh, h);
+
+    return h;
+}
+
+static void xs_be_close(struct qemu_xs_handle *h)
+{
+    while (h->watches) {
+        struct qemu_xs_watch *w = h->watches->data;
+        xs_be_unwatch(h, w);
+    }
+
+    qemu_bh_delete(h->watch_bh);
+    g_free(h);
+}
+
+static struct xenstore_backend_ops emu_xenstore_backend_ops = {
+    .open = xs_be_open,
+    .close = xs_be_close,
+    .get_domain_path = xs_be_get_domain_path,
+    .directory = xs_be_directory,
+    .read = xs_be_read,
+    .write = xs_be_write,
+    .create = xs_be_create,
+    .destroy = xs_be_destroy,
+    .watch = xs_be_watch,
+    .unwatch = xs_be_unwatch,
+    .transaction_start = xs_be_transaction_start,
+    .transaction_end = xs_be_transaction_end,
+};
-- 
2.39.0


