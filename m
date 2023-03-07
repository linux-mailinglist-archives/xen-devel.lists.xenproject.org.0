Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB436AE8CA
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 18:18:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507656.781511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZax1-0002Wz-CL; Tue, 07 Mar 2023 17:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507656.781511; Tue, 07 Mar 2023 17:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZax0-0002Lw-Tw; Tue, 07 Mar 2023 17:18:10 +0000
Received: by outflank-mailman (input) for mailman id 507656;
 Tue, 07 Mar 2023 17:18:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yYpO=67=casper.srs.infradead.org=BATV+9298a7250c90fe94fbb7+7135+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pZawx-0000az-AJ
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 17:18:07 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03b46039-bd0c-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 18:18:02 +0100 (CET)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pZawk-006axc-0J; Tue, 07 Mar 2023 17:17:54 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pZawk-009chK-03; Tue, 07 Mar 2023 17:17:54 +0000
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
X-Inumbo-ID: 03b46039-bd0c-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=CSUW5QTKrBhNjvACfw85vRZYDYV84DrUj4rWYgkN2Oo=; b=GKOFJYGnaJh7eIOz34aOFQXCy9
	nwHzhODUFpkXAM8HfSyhPlNOzzHcea0hT/BbrxuzTzy0M22os8v8ymtrRvQzvG+ff2IyREGSPA3Wl
	A97iKe1T3ewQEXFk7lVJYc/Y5g+ovnLOX2dA3VKbp3wbtJ/8Qxz6bOUMNQrydkq/b9LijxuXUlXt3
	QVdl2CrZrU+cxDbylVDx1/1DvMmR3RVhxe2O1pJ6TRA5gvonAk/XSsQ7vPMl7ttej63e4BvuvaakS
	H0ykFybz+3aJb6hJk5QVxaoFqTFxxO9KUu5IDblq0dPmHStzjm9UL8HuNCkU+aw8vOdTx1ezGbSyE
	lZDZB7eA==;
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
Subject: [PATCH v2 13/27] hw/xen: Add xenstore operations to allow redirection to internal emulation
Date: Tue,  7 Mar 2023 17:17:36 +0000
Message-Id: <20230307171750.2293175-14-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307171750.2293175-1-dwmw2@infradead.org>
References: <20230307171750.2293175-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: Paul Durrant <pdurrant@amazon.com>

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 accel/xen/xen-all.c                 |  11 +-
 hw/char/xen_console.c               |   2 +-
 hw/i386/kvm/xen_xenstore.c          |   3 -
 hw/i386/kvm/xenstore_impl.h         |   8 +-
 hw/xen/xen-bus-helper.c             |  62 +++----
 hw/xen/xen-bus.c                    | 261 ++++------------------------
 hw/xen/xen-legacy-backend.c         | 119 +++++++------
 hw/xen/xen-operations.c             | 198 +++++++++++++++++++++
 hw/xen/xen_devconfig.c              |   4 +-
 hw/xen/xen_pt_graphics.c            |   1 -
 hw/xen/xen_pvdev.c                  |  49 +-----
 include/hw/xen/xen-bus-helper.h     |  26 +--
 include/hw/xen/xen-bus.h            |  17 +-
 include/hw/xen/xen-legacy-backend.h |   6 +-
 include/hw/xen/xen_backend_ops.h    | 163 +++++++++++++++++
 include/hw/xen/xen_common.h         |   1 -
 include/hw/xen/xen_pvdev.h          |   2 +-
 softmmu/globals.c                   |   1 +
 18 files changed, 525 insertions(+), 409 deletions(-)

diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index e85e4aeba5..425216230f 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -90,12 +90,15 @@ void xenstore_store_pv_console_info(int i, Chardev *chr)
 }
 
 
-static void xenstore_record_dm_state(struct xs_handle *xs, const char *state)
+static void xenstore_record_dm_state(const char *state)
 {
+    struct xs_handle *xs;
     char path[50];
 
+    /* We now have everything we need to set the xenstore entry. */
+    xs = xs_open(0);
     if (xs == NULL) {
-        error_report("xenstore connection not initialized");
+        fprintf(stderr, "Could not contact XenStore\n");
         exit(1);
     }
 
@@ -109,6 +112,8 @@ static void xenstore_record_dm_state(struct xs_handle *xs, const char *state)
         error_report("error recording dm state");
         exit(1);
     }
+
+    xs_close(xs);
 }
 
 
@@ -117,7 +122,7 @@ static void xen_change_state_handler(void *opaque, bool running,
 {
     if (running) {
         /* record state running */
-        xenstore_record_dm_state(xenstore, "running");
+        xenstore_record_dm_state("running");
     }
 }
 
diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index e9cef3e1ef..ad8638a86d 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -181,7 +181,7 @@ static int con_init(struct XenLegacyDevice *xendev)
     const char *output;
 
     /* setup */
-    dom = xs_get_domain_path(xenstore, con->xendev.dom);
+    dom = qemu_xen_xs_get_domain_path(xenstore, con->xendev.dom);
     if (!xendev->dev) {
         snprintf(con->console, sizeof(con->console), "%s/console", dom);
     } else {
diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index fb3648a058..35898e9b37 100644
--- a/hw/i386/kvm/xen_xenstore.c
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -38,9 +38,6 @@
 #define TYPE_XEN_XENSTORE "xen-xenstore"
 OBJECT_DECLARE_SIMPLE_TYPE(XenXenstoreState, XEN_XENSTORE)
 
-#define XEN_PAGE_SHIFT 12
-#define XEN_PAGE_SIZE (1ULL << XEN_PAGE_SHIFT)
-
 #define ENTRIES_PER_FRAME_V1 (XEN_PAGE_SIZE / sizeof(grant_entry_v1_t))
 #define ENTRIES_PER_FRAME_V2 (XEN_PAGE_SIZE / sizeof(grant_entry_v2_t))
 
diff --git a/hw/i386/kvm/xenstore_impl.h b/hw/i386/kvm/xenstore_impl.h
index bbe2391e2e..0df2a91aae 100644
--- a/hw/i386/kvm/xenstore_impl.h
+++ b/hw/i386/kvm/xenstore_impl.h
@@ -12,13 +12,7 @@
 #ifndef QEMU_XENSTORE_IMPL_H
 #define QEMU_XENSTORE_IMPL_H
 
-typedef uint32_t xs_transaction_t;
-
-#define XBT_NULL 0
-
-#define XS_PERM_NONE  0x00
-#define XS_PERM_READ  0x01
-#define XS_PERM_WRITE 0x02
+#include "hw/xen/xen_backend_ops.h"
 
 typedef struct XenstoreImplState XenstoreImplState;
 
diff --git a/hw/xen/xen-bus-helper.c b/hw/xen/xen-bus-helper.c
index 5a1e12b374..b2b2cc9c5d 100644
--- a/hw/xen/xen-bus-helper.c
+++ b/hw/xen/xen-bus-helper.c
@@ -10,6 +10,7 @@
 #include "hw/xen/xen-bus.h"
 #include "hw/xen/xen-bus-helper.h"
 #include "qapi/error.h"
+#include "trace.h"
 
 #include <glib/gprintf.h>
 
@@ -46,34 +47,28 @@ const char *xs_strstate(enum xenbus_state state)
     return "INVALID";
 }
 
-void xs_node_create(struct xs_handle *xsh, xs_transaction_t tid,
-                    const char *node, struct xs_permissions perms[],
-                    unsigned int nr_perms, Error **errp)
+void xs_node_create(struct qemu_xs_handle *h, xs_transaction_t tid,
+                    const char *node, unsigned int owner, unsigned int domid,
+                    unsigned int perms, Error **errp)
 {
     trace_xs_node_create(node);
 
-    if (!xs_write(xsh, tid, node, "", 0)) {
+    if (!qemu_xen_xs_create(h, tid, owner, domid, perms, node)) {
         error_setg_errno(errp, errno, "failed to create node '%s'", node);
-        return;
-    }
-
-    if (!xs_set_permissions(xsh, tid, node, perms, nr_perms)) {
-        error_setg_errno(errp, errno, "failed to set node '%s' permissions",
-                         node);
     }
 }
 
-void xs_node_destroy(struct xs_handle *xsh, xs_transaction_t tid,
+void xs_node_destroy(struct qemu_xs_handle *h, xs_transaction_t tid,
                      const char *node, Error **errp)
 {
     trace_xs_node_destroy(node);
 
-    if (!xs_rm(xsh, tid, node)) {
+    if (!qemu_xen_xs_destroy(h, tid, node)) {
         error_setg_errno(errp, errno, "failed to destroy node '%s'", node);
     }
 }
 
-void xs_node_vprintf(struct xs_handle *xsh, xs_transaction_t tid,
+void xs_node_vprintf(struct qemu_xs_handle *h, xs_transaction_t tid,
                      const char *node, const char *key, Error **errp,
                      const char *fmt, va_list ap)
 {
@@ -86,7 +81,7 @@ void xs_node_vprintf(struct xs_handle *xsh, xs_transaction_t tid,
 
     trace_xs_node_vprintf(path, value);
 
-    if (!xs_write(xsh, tid, path, value, len)) {
+    if (!qemu_xen_xs_write(h, tid, path, value, len)) {
         error_setg_errno(errp, errno, "failed to write '%s' to '%s'",
                          value, path);
     }
@@ -95,18 +90,18 @@ void xs_node_vprintf(struct xs_handle *xsh, xs_transaction_t tid,
     g_free(path);
 }
 
-void xs_node_printf(struct xs_handle *xsh,  xs_transaction_t tid,
+void xs_node_printf(struct qemu_xs_handle *h,  xs_transaction_t tid,
                     const char *node, const char *key, Error **errp,
                     const char *fmt, ...)
 {
     va_list ap;
 
     va_start(ap, fmt);
-    xs_node_vprintf(xsh, tid, node, key, errp, fmt, ap);
+    xs_node_vprintf(h, tid, node, key, errp, fmt, ap);
     va_end(ap);
 }
 
-int xs_node_vscanf(struct xs_handle *xsh,  xs_transaction_t tid,
+int xs_node_vscanf(struct qemu_xs_handle *h,  xs_transaction_t tid,
                    const char *node, const char *key, Error **errp,
                    const char *fmt, va_list ap)
 {
@@ -115,7 +110,7 @@ int xs_node_vscanf(struct xs_handle *xsh,  xs_transaction_t tid,
 
     path = (strlen(node) != 0) ? g_strdup_printf("%s/%s", node, key) :
         g_strdup(key);
-    value = xs_read(xsh, tid, path, NULL);
+    value = qemu_xen_xs_read(h, tid, path, NULL);
 
     trace_xs_node_vscanf(path, value);
 
@@ -133,7 +128,7 @@ int xs_node_vscanf(struct xs_handle *xsh,  xs_transaction_t tid,
     return rc;
 }
 
-int xs_node_scanf(struct xs_handle *xsh,  xs_transaction_t tid,
+int xs_node_scanf(struct qemu_xs_handle *h,  xs_transaction_t tid,
                   const char *node, const char *key, Error **errp,
                   const char *fmt, ...)
 {
@@ -141,42 +136,35 @@ int xs_node_scanf(struct xs_handle *xsh,  xs_transaction_t tid,
     int rc;
 
     va_start(ap, fmt);
-    rc = xs_node_vscanf(xsh, tid, node, key, errp, fmt, ap);
+    rc = xs_node_vscanf(h, tid, node, key, errp, fmt, ap);
     va_end(ap);
 
     return rc;
 }
 
-void xs_node_watch(struct xs_handle *xsh, const char *node, const char *key,
-                   char *token, Error **errp)
+struct qemu_xs_watch *xs_node_watch(struct qemu_xs_handle *h, const char *node,
+                                    const char *key, xs_watch_fn fn,
+                                    void *opaque, Error **errp)
 {
     char *path;
+    struct qemu_xs_watch *w;
 
     path = (strlen(node) != 0) ? g_strdup_printf("%s/%s", node, key) :
         g_strdup(key);
 
     trace_xs_node_watch(path);
 
-    if (!xs_watch(xsh, path, token)) {
+    w = qemu_xen_xs_watch(h, path, fn, opaque);
+    if (!w) {
         error_setg_errno(errp, errno, "failed to watch node '%s'", path);
     }
 
     g_free(path);
+
+    return w;
 }
 
-void xs_node_unwatch(struct xs_handle *xsh, const char *node,
-                     const char *key, const char *token, Error **errp)
+void xs_node_unwatch(struct qemu_xs_handle *h, struct qemu_xs_watch *w)
 {
-    char *path;
-
-    path = (strlen(node) != 0) ? g_strdup_printf("%s/%s", node, key) :
-        g_strdup(key);
-
-    trace_xs_node_unwatch(path);
-
-    if (!xs_unwatch(xsh, path, token)) {
-        error_setg_errno(errp, errno, "failed to unwatch node '%s'", path);
-    }
-
-    g_free(path);
+    qemu_xen_xs_unwatch(h, w);
 }
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index aee6a8c9b0..9fe54967d4 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -62,7 +62,7 @@ static void xen_device_unplug(XenDevice *xendev, Error **errp)
 
     /* Mimic the way the Xen toolstack does an unplug */
 again:
-    tid = xs_transaction_start(xenbus->xsh);
+    tid = qemu_xen_xs_transaction_start(xenbus->xsh);
     if (tid == XBT_NULL) {
         error_setg_errno(errp, errno, "failed xs_transaction_start");
         return;
@@ -80,7 +80,7 @@ again:
         goto abort;
     }
 
-    if (!xs_transaction_end(xenbus->xsh, tid, false)) {
+    if (!qemu_xen_xs_transaction_end(xenbus->xsh, tid, false)) {
         if (errno == EAGAIN) {
             goto again;
         }
@@ -95,7 +95,7 @@ abort:
      * We only abort if there is already a failure so ignore any error
      * from ending the transaction.
      */
-    xs_transaction_end(xenbus->xsh, tid, true);
+    qemu_xen_xs_transaction_end(xenbus->xsh, tid, true);
 }
 
 static void xen_bus_print_dev(Monitor *mon, DeviceState *dev, int indent)
@@ -111,143 +111,6 @@ static char *xen_bus_get_dev_path(DeviceState *dev)
     return xen_device_get_backend_path(XEN_DEVICE(dev));
 }
 
-struct XenWatch {
-    char *node, *key;
-    char *token;
-    XenWatchHandler handler;
-    void *opaque;
-    Notifier notifier;
-};
-
-static void watch_notify(Notifier *n, void *data)
-{
-    XenWatch *watch = container_of(n, XenWatch, notifier);
-    const char *token = data;
-
-    if (!strcmp(watch->token, token)) {
-        watch->handler(watch->opaque);
-    }
-}
-
-static XenWatch *new_watch(const char *node, const char *key,
-                           XenWatchHandler handler, void *opaque)
-{
-    XenWatch *watch = g_new0(XenWatch, 1);
-    QemuUUID uuid;
-
-    qemu_uuid_generate(&uuid);
-
-    watch->token = qemu_uuid_unparse_strdup(&uuid);
-    watch->node = g_strdup(node);
-    watch->key = g_strdup(key);
-    watch->handler = handler;
-    watch->opaque = opaque;
-    watch->notifier.notify = watch_notify;
-
-    return watch;
-}
-
-static void free_watch(XenWatch *watch)
-{
-    g_free(watch->token);
-    g_free(watch->key);
-    g_free(watch->node);
-
-    g_free(watch);
-}
-
-struct XenWatchList {
-    struct xs_handle *xsh;
-    NotifierList notifiers;
-};
-
-static void watch_list_event(void *opaque)
-{
-    XenWatchList *watch_list = opaque;
-    char **v;
-    const char *token;
-
-    v = xs_check_watch(watch_list->xsh);
-    if (!v) {
-        return;
-    }
-
-    token = v[XS_WATCH_TOKEN];
-
-    notifier_list_notify(&watch_list->notifiers, (void *)token);
-
-    free(v);
-}
-
-static XenWatchList *watch_list_create(struct xs_handle *xsh)
-{
-    XenWatchList *watch_list = g_new0(XenWatchList, 1);
-
-    g_assert(xsh);
-
-    watch_list->xsh = xsh;
-    notifier_list_init(&watch_list->notifiers);
-    qemu_set_fd_handler(xs_fileno(watch_list->xsh), watch_list_event, NULL,
-                        watch_list);
-
-    return watch_list;
-}
-
-static void watch_list_destroy(XenWatchList *watch_list)
-{
-    g_assert(notifier_list_empty(&watch_list->notifiers));
-    qemu_set_fd_handler(xs_fileno(watch_list->xsh), NULL, NULL, NULL);
-    g_free(watch_list);
-}
-
-static XenWatch *watch_list_add(XenWatchList *watch_list, const char *node,
-                                const char *key, XenWatchHandler handler,
-                                void *opaque, Error **errp)
-{
-    ERRP_GUARD();
-    XenWatch *watch = new_watch(node, key, handler, opaque);
-
-    notifier_list_add(&watch_list->notifiers, &watch->notifier);
-
-    xs_node_watch(watch_list->xsh, node, key, watch->token, errp);
-    if (*errp) {
-        notifier_remove(&watch->notifier);
-        free_watch(watch);
-
-        return NULL;
-    }
-
-    return watch;
-}
-
-static void watch_list_remove(XenWatchList *watch_list, XenWatch *watch,
-                              Error **errp)
-{
-    xs_node_unwatch(watch_list->xsh, watch->node, watch->key, watch->token,
-                    errp);
-
-    notifier_remove(&watch->notifier);
-    free_watch(watch);
-}
-
-static XenWatch *xen_bus_add_watch(XenBus *xenbus, const char *node,
-                                   const char *key, XenWatchHandler handler,
-                                   Error **errp)
-{
-    trace_xen_bus_add_watch(node, key);
-
-    return watch_list_add(xenbus->watch_list, node, key, handler, xenbus,
-                          errp);
-}
-
-static void xen_bus_remove_watch(XenBus *xenbus, XenWatch *watch,
-                                 Error **errp)
-{
-    trace_xen_bus_remove_watch(watch->node, watch->key);
-
-    watch_list_remove(xenbus->watch_list, watch, errp);
-}
-
 static void xen_bus_backend_create(XenBus *xenbus, const char *type,
                                    const char *name, char *path,
                                    Error **errp)
@@ -261,15 +124,15 @@ static void xen_bus_backend_create(XenBus *xenbus, const char *type,
     trace_xen_bus_backend_create(type, path);
 
 again:
-    tid = xs_transaction_start(xenbus->xsh);
+    tid = qemu_xen_xs_transaction_start(xenbus->xsh);
     if (tid == XBT_NULL) {
         error_setg(errp, "failed xs_transaction_start");
         return;
     }
 
-    key = xs_directory(xenbus->xsh, tid, path, &n);
+    key = qemu_xen_xs_directory(xenbus->xsh, tid, path, &n);
     if (!key) {
-        if (!xs_transaction_end(xenbus->xsh, tid, true)) {
+        if (!qemu_xen_xs_transaction_end(xenbus->xsh, tid, true)) {
             error_setg_errno(errp, errno, "failed xs_transaction_end");
         }
         return;
@@ -300,7 +163,7 @@ again:
 
     free(key);
 
-    if (!xs_transaction_end(xenbus->xsh, tid, false)) {
+    if (!qemu_xen_xs_transaction_end(xenbus->xsh, tid, false)) {
         qobject_unref(opts);
 
         if (errno == EAGAIN) {
@@ -327,7 +190,7 @@ static void xen_bus_type_enumerate(XenBus *xenbus, const char *type)
 
     trace_xen_bus_type_enumerate(type);
 
-    backend = xs_directory(xenbus->xsh, XBT_NULL, domain_path, &n);
+    backend = qemu_xen_xs_directory(xenbus->xsh, XBT_NULL, domain_path, &n);
     if (!backend) {
         goto out;
     }
@@ -372,7 +235,7 @@ static void xen_bus_enumerate(XenBus *xenbus)
 
     trace_xen_bus_enumerate();
 
-    type = xs_directory(xenbus->xsh, XBT_NULL, "backend", &n);
+    type = qemu_xen_xs_directory(xenbus->xsh, XBT_NULL, "backend", &n);
     if (!type) {
         return;
     }
@@ -415,7 +278,7 @@ static void xen_bus_cleanup(XenBus *xenbus)
     }
 }
 
-static void xen_bus_backend_changed(void *opaque)
+static void xen_bus_backend_changed(void *opaque, const char *path)
 {
     XenBus *xenbus = opaque;
 
@@ -434,7 +297,7 @@ static void xen_bus_unrealize(BusState *bus)
 
         for (i = 0; i < xenbus->backend_types; i++) {
             if (xenbus->backend_watch[i]) {
-                xen_bus_remove_watch(xenbus, xenbus->backend_watch[i], NULL);
+                xs_node_unwatch(xenbus->xsh, xenbus->backend_watch[i]);
             }
         }
 
@@ -442,13 +305,8 @@ static void xen_bus_unrealize(BusState *bus)
         xenbus->backend_watch = NULL;
     }
 
-    if (xenbus->watch_list) {
-        watch_list_destroy(xenbus->watch_list);
-        xenbus->watch_list = NULL;
-    }
-
     if (xenbus->xsh) {
-        xs_close(xenbus->xsh);
+        qemu_xen_xs_close(xenbus->xsh);
     }
 }
 
@@ -463,7 +321,7 @@ static void xen_bus_realize(BusState *bus, Error **errp)
 
     trace_xen_bus_realize();
 
-    xenbus->xsh = xs_open(0);
+    xenbus->xsh = qemu_xen_xs_open();
     if (!xenbus->xsh) {
         error_setg_errno(errp, errno, "failed xs_open");
         goto fail;
@@ -476,19 +334,18 @@ static void xen_bus_realize(BusState *bus, Error **errp)
         xenbus->backend_id = 0; /* Assume lack of node means dom0 */
     }
 
-    xenbus->watch_list = watch_list_create(xenbus->xsh);
-
     module_call_init(MODULE_INIT_XEN_BACKEND);
 
     type = xen_backend_get_types(&xenbus->backend_types);
-    xenbus->backend_watch = g_new(XenWatch *, xenbus->backend_types);
+    xenbus->backend_watch = g_new(struct qemu_xs_watch *,
+                                  xenbus->backend_types);
 
     for (i = 0; i < xenbus->backend_types; i++) {
         char *node = g_strdup_printf("backend/%s", type[i]);
 
         xenbus->backend_watch[i] =
-            xen_bus_add_watch(xenbus, node, key, xen_bus_backend_changed,
-                              &local_err);
+            xs_node_watch(xenbus->xsh, node, key, xen_bus_backend_changed,
+                          xenbus, &local_err);
         if (local_err) {
             /* This need not be treated as a hard error so don't propagate */
             error_reportf_err(local_err,
@@ -631,7 +488,7 @@ static bool xen_device_frontend_is_active(XenDevice *xendev)
     }
 }
 
-static void xen_device_backend_changed(void *opaque)
+static void xen_device_backend_changed(void *opaque, const char *path)
 {
     XenDevice *xendev = opaque;
     const char *type = object_get_typename(OBJECT(xendev));
@@ -685,66 +542,35 @@ static void xen_device_backend_changed(void *opaque)
     }
 }
 
-static XenWatch *xen_device_add_watch(XenDevice *xendev, const char *node,
-                                      const char *key,
-                                      XenWatchHandler handler,
-                                      Error **errp)
-{
-    const char *type = object_get_typename(OBJECT(xendev));
-
-    trace_xen_device_add_watch(type, xendev->name, node, key);
-
-    return watch_list_add(xendev->watch_list, node, key, handler, xendev,
-                          errp);
-}
-
-static void xen_device_remove_watch(XenDevice *xendev, XenWatch *watch,
-                                    Error **errp)
-{
-    const char *type = object_get_typename(OBJECT(xendev));
-
-    trace_xen_device_remove_watch(type, xendev->name, watch->node,
-                                  watch->key);
-
-    watch_list_remove(xendev->watch_list, watch, errp);
-}
-
-
 static void xen_device_backend_create(XenDevice *xendev, Error **errp)
 {
     ERRP_GUARD();
     XenBus *xenbus = XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
-    struct xs_permissions perms[2];
 
     xendev->backend_path = xen_device_get_backend_path(xendev);
 
-    perms[0].id = xenbus->backend_id;
-    perms[0].perms = XS_PERM_NONE;
-    perms[1].id = xendev->frontend_id;
-    perms[1].perms = XS_PERM_READ;
-
     g_assert(xenbus->xsh);
 
-    xs_node_create(xenbus->xsh, XBT_NULL, xendev->backend_path, perms,
-                   ARRAY_SIZE(perms), errp);
+    xs_node_create(xenbus->xsh, XBT_NULL, xendev->backend_path,
+                   xenbus->backend_id, xendev->frontend_id, XS_PERM_READ, errp);
     if (*errp) {
         error_prepend(errp, "failed to create backend: ");
         return;
     }
 
     xendev->backend_state_watch =
-        xen_device_add_watch(xendev, xendev->backend_path,
-                             "state", xen_device_backend_changed,
-                             errp);
+        xs_node_watch(xendev->xsh, xendev->backend_path,
+                      "state", xen_device_backend_changed, xendev,
+                      errp);
     if (*errp) {
         error_prepend(errp, "failed to watch backend state: ");
         return;
     }
 
     xendev->backend_online_watch =
-        xen_device_add_watch(xendev, xendev->backend_path,
-                             "online", xen_device_backend_changed,
-                             errp);
+        xs_node_watch(xendev->xsh, xendev->backend_path,
+                      "online", xen_device_backend_changed, xendev,
+                      errp);
     if (*errp) {
         error_prepend(errp, "failed to watch backend online: ");
         return;
@@ -757,12 +583,12 @@ static void xen_device_backend_destroy(XenDevice *xendev)
     Error *local_err = NULL;
 
     if (xendev->backend_online_watch) {
-        xen_device_remove_watch(xendev, xendev->backend_online_watch, NULL);
+        xs_node_unwatch(xendev->xsh, xendev->backend_online_watch);
         xendev->backend_online_watch = NULL;
     }
 
     if (xendev->backend_state_watch) {
-        xen_device_remove_watch(xendev, xendev->backend_state_watch, NULL);
+        xs_node_unwatch(xendev->xsh, xendev->backend_state_watch);
         xendev->backend_state_watch = NULL;
     }
 
@@ -837,7 +663,7 @@ static void xen_device_frontend_set_state(XenDevice *xendev,
     }
 }
 
-static void xen_device_frontend_changed(void *opaque)
+static void xen_device_frontend_changed(void *opaque, const char *path)
 {
     XenDevice *xendev = opaque;
     XenDeviceClass *xendev_class = XEN_DEVICE_GET_CLASS(xendev);
@@ -885,7 +711,6 @@ static void xen_device_frontend_create(XenDevice *xendev, Error **errp)
 {
     ERRP_GUARD();
     XenBus *xenbus = XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
-    struct xs_permissions perms[2];
 
     xendev->frontend_path = xen_device_get_frontend_path(xendev);
 
@@ -894,15 +719,11 @@ static void xen_device_frontend_create(XenDevice *xendev, Error **errp)
      * toolstack.
      */
     if (!xen_device_frontend_exists(xendev)) {
-        perms[0].id = xendev->frontend_id;
-        perms[0].perms = XS_PERM_NONE;
-        perms[1].id = xenbus->backend_id;
-        perms[1].perms = XS_PERM_READ | XS_PERM_WRITE;
-
         g_assert(xenbus->xsh);
 
-        xs_node_create(xenbus->xsh, XBT_NULL, xendev->frontend_path, perms,
-                       ARRAY_SIZE(perms), errp);
+        xs_node_create(xenbus->xsh, XBT_NULL, xendev->frontend_path,
+                       xendev->frontend_id, xenbus->backend_id,
+                       XS_PERM_READ | XS_PERM_WRITE, errp);
         if (*errp) {
             error_prepend(errp, "failed to create frontend: ");
             return;
@@ -910,8 +731,8 @@ static void xen_device_frontend_create(XenDevice *xendev, Error **errp)
     }
 
     xendev->frontend_state_watch =
-        xen_device_add_watch(xendev, xendev->frontend_path, "state",
-                             xen_device_frontend_changed, errp);
+        xs_node_watch(xendev->xsh, xendev->frontend_path, "state",
+                      xen_device_frontend_changed, xendev, errp);
     if (*errp) {
         error_prepend(errp, "failed to watch frontend state: ");
     }
@@ -923,8 +744,7 @@ static void xen_device_frontend_destroy(XenDevice *xendev)
     Error *local_err = NULL;
 
     if (xendev->frontend_state_watch) {
-        xen_device_remove_watch(xendev, xendev->frontend_state_watch,
-                                NULL);
+        xs_node_unwatch(xendev->xsh, xendev->frontend_state_watch);
         xendev->frontend_state_watch = NULL;
     }
 
@@ -1146,13 +966,8 @@ static void xen_device_unrealize(DeviceState *dev)
         xendev->xgth = NULL;
     }
 
-    if (xendev->watch_list) {
-        watch_list_destroy(xendev->watch_list);
-        xendev->watch_list = NULL;
-    }
-
     if (xendev->xsh) {
-        xs_close(xendev->xsh);
+        qemu_xen_xs_close(xendev->xsh);
         xendev->xsh = NULL;
     }
 
@@ -1197,14 +1012,12 @@ static void xen_device_realize(DeviceState *dev, Error **errp)
 
     trace_xen_device_realize(type, xendev->name);
 
-    xendev->xsh = xs_open(0);
+    xendev->xsh = qemu_xen_xs_open();
     if (!xendev->xsh) {
         error_setg_errno(errp, errno, "failed xs_open");
         goto unrealize;
     }
 
-    xendev->watch_list = watch_list_create(xendev->xsh);
-
     xendev->xgth = qemu_xen_gnttab_open();
     if (!xendev->xgth) {
         error_setg_errno(errp, errno, "failed xengnttab_open");
diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index a48a25aeb5..4ded3cec23 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -39,7 +39,7 @@ BusState *xen_sysbus;
 /* ------------------------------------------------------------- */
 
 /* public */
-struct xs_handle *xenstore;
+struct qemu_xs_handle *xenstore;
 const char *xen_protocol;
 
 /* private */
@@ -274,6 +274,25 @@ static void xen_be_frontend_changed(struct XenLegacyDevice *xendev,
     }
 }
 
+static void xenstore_update_fe(void *opaque, const char *watch)
+{
+    struct XenLegacyDevice *xendev = opaque;
+    const char *node;
+    unsigned int len;
+
+    len = strlen(xendev->fe);
+    if (strncmp(xendev->fe, watch, len) != 0) {
+        return;
+    }
+    if (watch[len] != '/') {
+        return;
+    }
+    node = watch + len + 1;
+
+    xen_be_frontend_changed(xendev, node);
+    xen_be_check_state(xendev);
+}
+
 /* ------------------------------------------------------------- */
 /* Check for possible state transitions and perform them.        */
 
@@ -287,7 +306,6 @@ static void xen_be_frontend_changed(struct XenLegacyDevice *xendev,
  */
 static int xen_be_try_setup(struct XenLegacyDevice *xendev)
 {
-    char token[XEN_BUFSIZE];
     int be_state;
 
     if (xenstore_read_be_int(xendev, "state", &be_state) == -1) {
@@ -308,8 +326,9 @@ static int xen_be_try_setup(struct XenLegacyDevice *xendev)
     }
 
     /* setup frontend watch */
-    snprintf(token, sizeof(token), "fe:%p", xendev);
-    if (!xs_watch(xenstore, xendev->fe, token)) {
+    xendev->watch = qemu_xen_xs_watch(xenstore, xendev->fe, xenstore_update_fe,
+                                      xendev);
+    if (!xendev->watch) {
         xen_pv_printf(xendev, 0, "watching frontend path (%s) failed\n",
                       xendev->fe);
         return -1;
@@ -498,46 +517,20 @@ void xen_be_check_state(struct XenLegacyDevice *xendev)
 
 /* ------------------------------------------------------------- */
 
-static int xenstore_scan(const char *type, int dom, struct XenDevOps *ops)
-{
-    struct XenLegacyDevice *xendev;
-    char path[XEN_BUFSIZE], token[XEN_BUFSIZE];
-    char **dev = NULL;
-    unsigned int cdev, j;
-
-    /* setup watch */
-    snprintf(token, sizeof(token), "be:%p:%d:%p", type, dom, ops);
-    snprintf(path, sizeof(path), "backend/%s/%d", type, dom);
-    if (!xs_watch(xenstore, path, token)) {
-        xen_pv_printf(NULL, 0, "xen be: watching backend path (%s) failed\n",
-                      path);
-        return -1;
-    }
-
-    /* look for backends */
-    dev = xs_directory(xenstore, 0, path, &cdev);
-    if (!dev) {
-        return 0;
-    }
-    for (j = 0; j < cdev; j++) {
-        xendev = xen_be_get_xendev(type, dom, atoi(dev[j]), ops);
-        if (xendev == NULL) {
-            continue;
-        }
-        xen_be_check_state(xendev);
-    }
-    free(dev);
-    return 0;
-}
+struct xenstore_be {
+    const char *type;
+    int dom;
+    struct XenDevOps *ops;
+};
 
-void xenstore_update_be(char *watch, char *type, int dom,
-                        struct XenDevOps *ops)
+static void xenstore_update_be(void *opaque, const char *watch)
 {
+    struct xenstore_be *be = opaque;
     struct XenLegacyDevice *xendev;
     char path[XEN_BUFSIZE], *bepath;
     unsigned int len, dev;
 
-    len = snprintf(path, sizeof(path), "backend/%s/%d", type, dom);
+    len = snprintf(path, sizeof(path), "backend/%s/%d", be->type, be->dom);
     if (strncmp(path, watch, len) != 0) {
         return;
     }
@@ -551,9 +544,9 @@ void xenstore_update_be(char *watch, char *type, int dom,
         return;
     }
 
-    xendev = xen_be_get_xendev(type, dom, dev, ops);
+    xendev = xen_be_get_xendev(be->type, be->dom, dev, be->ops);
     if (xendev != NULL) {
-        bepath = xs_read(xenstore, 0, xendev->be, &len);
+        bepath = qemu_xen_xs_read(xenstore, 0, xendev->be, &len);
         if (bepath == NULL) {
             xen_pv_del_xendev(xendev);
         } else {
@@ -564,23 +557,41 @@ void xenstore_update_be(char *watch, char *type, int dom,
     }
 }
 
-void xenstore_update_fe(char *watch, struct XenLegacyDevice *xendev)
+static int xenstore_scan(const char *type, int dom, struct XenDevOps *ops)
 {
-    char *node;
-    unsigned int len;
+    struct XenLegacyDevice *xendev;
+    char path[XEN_BUFSIZE];
+    struct xenstore_be *be = g_new0(struct xenstore_be, 1);
+    char **dev = NULL;
+    unsigned int cdev, j;
 
-    len = strlen(xendev->fe);
-    if (strncmp(xendev->fe, watch, len) != 0) {
-        return;
-    }
-    if (watch[len] != '/') {
-        return;
+    /* setup watch */
+    be->type = type;
+    be->dom = dom;
+    be->ops = ops;
+    snprintf(path, sizeof(path), "backend/%s/%d", type, dom);
+    if (!qemu_xen_xs_watch(xenstore, path, xenstore_update_be, be)) {
+        xen_pv_printf(NULL, 0, "xen be: watching backend path (%s) failed\n",
+                      path);
+        return -1;
     }
-    node = watch + len + 1;
 
-    xen_be_frontend_changed(xendev, node);
-    xen_be_check_state(xendev);
+    /* look for backends */
+    dev = qemu_xen_xs_directory(xenstore, 0, path, &cdev);
+    if (!dev) {
+        return 0;
+    }
+    for (j = 0; j < cdev; j++) {
+        xendev = xen_be_get_xendev(type, dom, atoi(dev[j]), ops);
+        if (xendev == NULL) {
+            continue;
+        }
+        xen_be_check_state(xendev);
+    }
+    free(dev);
+    return 0;
 }
+
 /* -------------------------------------------------------------------- */
 
 static void xen_set_dynamic_sysbus(void)
@@ -594,14 +605,12 @@ static void xen_set_dynamic_sysbus(void)
 
 void xen_be_init(void)
 {
-    xenstore = xs_daemon_open();
+    xenstore = qemu_xen_xs_open();
     if (!xenstore) {
         xen_pv_printf(NULL, 0, "can't connect to xenstored\n");
         exit(1);
     }
 
-    qemu_set_fd_handler(xs_fileno(xenstore), xenstore_update, NULL, NULL);
-
     if (xen_evtchn_ops == NULL || xen_gnttab_ops == NULL) {
         xen_pv_printf(NULL, 0, "Xen operations not set up\n");
         exit(1);
diff --git a/hw/xen/xen-operations.c b/hw/xen/xen-operations.c
index 440e566bb1..abed812b63 100644
--- a/hw/xen/xen-operations.c
+++ b/hw/xen/xen-operations.c
@@ -10,6 +10,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/uuid.h"
 #include "qapi/error.h"
 
 #include "hw/xen/xen_backend_ops.h"
@@ -262,6 +263,202 @@ struct foreignmem_backend_ops libxenforeignmem_backend_ops = {
     .unmap = libxenforeignmem_backend_unmap,
 };
 
+struct qemu_xs_handle {
+    struct xs_handle *xsh;
+    NotifierList notifiers;
+};
+
+static void watch_event(void *opaque)
+{
+    struct qemu_xs_handle *h = opaque;
+
+    for (;;) {
+        char **v = xs_check_watch(h->xsh);
+
+        if (!v) {
+            break;
+        }
+
+        notifier_list_notify(&h->notifiers, v);
+        free(v);
+    }
+}
+
+static struct qemu_xs_handle *libxenstore_open(void)
+{
+    struct xs_handle *xsh = xs_open(0);
+    struct qemu_xs_handle *h = g_new0(struct qemu_xs_handle, 1);
+
+    if (!xsh) {
+        return NULL;
+    }
+
+    h = g_new0(struct qemu_xs_handle, 1);
+    h->xsh = xsh;
+
+    notifier_list_init(&h->notifiers);
+    qemu_set_fd_handler(xs_fileno(h->xsh), watch_event, NULL, h);
+
+    return h;
+}
+
+static void libxenstore_close(struct qemu_xs_handle *h)
+{
+    g_assert(notifier_list_empty(&h->notifiers));
+    qemu_set_fd_handler(xs_fileno(h->xsh), NULL, NULL, NULL);
+    xs_close(h->xsh);
+    g_free(h);
+}
+
+static char *libxenstore_get_domain_path(struct qemu_xs_handle *h,
+                                         unsigned int domid)
+{
+    return xs_get_domain_path(h->xsh, domid);
+}
+
+static char **libxenstore_directory(struct qemu_xs_handle *h,
+                                    xs_transaction_t t, const char *path,
+                                    unsigned int *num)
+{
+    return xs_directory(h->xsh, t, path, num);
+}
+
+static void *libxenstore_read(struct qemu_xs_handle *h, xs_transaction_t t,
+                              const char *path, unsigned int *len)
+{
+    return xs_read(h->xsh, t, path, len);
+}
+
+static bool libxenstore_write(struct qemu_xs_handle *h, xs_transaction_t t,
+                              const char *path, const void *data,
+                              unsigned int len)
+{
+    return xs_write(h->xsh, t, path, data, len);
+}
+
+static bool libxenstore_create(struct qemu_xs_handle *h, xs_transaction_t t,
+                               unsigned int owner, unsigned int domid,
+                               unsigned int perms, const char *path)
+{
+    struct xs_permissions perms_list[] = {
+        {
+            .id    = owner,
+            .perms = XS_PERM_NONE,
+        },
+        {
+            .id    = domid,
+            .perms = perms,
+        },
+    };
+
+    if (!xs_mkdir(h->xsh, t, path)) {
+        return false;
+    }
+
+    return xs_set_permissions(h->xsh, t, path, perms_list,
+                              ARRAY_SIZE(perms_list));
+}
+
+static bool libxenstore_destroy(struct qemu_xs_handle *h, xs_transaction_t t,
+                                const char *path)
+{
+    return xs_rm(h->xsh, t, path);
+}
+
+struct qemu_xs_watch {
+    char *path;
+    char *token;
+    xs_watch_fn fn;
+    void *opaque;
+    Notifier notifier;
+};
+
+static void watch_notify(Notifier *n, void *data)
+{
+    struct qemu_xs_watch *w = container_of(n, struct qemu_xs_watch, notifier);
+    const char **v = data;
+
+    if (!strcmp(w->token, v[XS_WATCH_TOKEN])) {
+        w->fn(w->opaque, v[XS_WATCH_PATH]);
+    }
+}
+
+static struct qemu_xs_watch *new_watch(const char *path, xs_watch_fn fn,
+                                       void *opaque)
+{
+    struct qemu_xs_watch *w = g_new0(struct qemu_xs_watch, 1);
+    QemuUUID uuid;
+
+    qemu_uuid_generate(&uuid);
+
+    w->token = qemu_uuid_unparse_strdup(&uuid);
+    w->path = g_strdup(path);
+    w->fn = fn;
+    w->opaque = opaque;
+    w->notifier.notify = watch_notify;
+
+    return w;
+}
+
+static void free_watch(struct qemu_xs_watch *w)
+{
+    g_free(w->token);
+    g_free(w->path);
+
+    g_free(w);
+}
+
+static struct qemu_xs_watch *libxenstore_watch(struct qemu_xs_handle *h,
+                                               const char *path, xs_watch_fn fn,
+                                               void *opaque)
+{
+    struct qemu_xs_watch *w = new_watch(path, fn, opaque);
+
+    notifier_list_add(&h->notifiers, &w->notifier);
+
+    if (!xs_watch(h->xsh, path, w->token)) {
+        notifier_remove(&w->notifier);
+        free_watch(w);
+        return NULL;
+    }
+
+    return w;
+}
+
+static void libxenstore_unwatch(struct qemu_xs_handle *h,
+                                struct qemu_xs_watch *w)
+{
+    xs_unwatch(h->xsh, w->path, w->token);
+    notifier_remove(&w->notifier);
+    free_watch(w);
+}
+
+static xs_transaction_t libxenstore_transaction_start(struct qemu_xs_handle *h)
+{
+    return xs_transaction_start(h->xsh);
+}
+
+static bool libxenstore_transaction_end(struct qemu_xs_handle *h,
+                                        xs_transaction_t t, bool abort)
+{
+    return xs_transaction_end(h->xsh, t, abort);
+}
+
+struct xenstore_backend_ops libxenstore_backend_ops = {
+    .open = libxenstore_open,
+    .close = libxenstore_close,
+    .get_domain_path = libxenstore_get_domain_path,
+    .directory = libxenstore_directory,
+    .read = libxenstore_read,
+    .write = libxenstore_write,
+    .create = libxenstore_create,
+    .destroy = libxenstore_destroy,
+    .watch = libxenstore_watch,
+    .unwatch = libxenstore_unwatch,
+    .transaction_start = libxenstore_transaction_start,
+    .transaction_end = libxenstore_transaction_end,
+};
+
 void setup_xen_backend_ops(void)
 {
 #if CONFIG_XEN_CTRL_INTERFACE_VERSION >= 40800
@@ -277,4 +474,5 @@ void setup_xen_backend_ops(void)
     xen_evtchn_ops = &libxenevtchn_backend_ops;
     xen_gnttab_ops = &libxengnttab_backend_ops;
     xen_foreignmem_ops = &libxenforeignmem_backend_ops;
+    xen_xenstore_ops = &libxenstore_backend_ops;
 }
diff --git a/hw/xen/xen_devconfig.c b/hw/xen/xen_devconfig.c
index 46ee4a7f02..9b7304e544 100644
--- a/hw/xen/xen_devconfig.c
+++ b/hw/xen/xen_devconfig.c
@@ -11,11 +11,11 @@ static int xen_config_dev_dirs(const char *ftype, const char *btype, int vdev,
 {
     char *dom;
 
-    dom = xs_get_domain_path(xenstore, xen_domid);
+    dom = qemu_xen_xs_get_domain_path(xenstore, xen_domid);
     snprintf(fe, len, "%s/device/%s/%d", dom, ftype, vdev);
     free(dom);
 
-    dom = xs_get_domain_path(xenstore, 0);
+    dom = qemu_xen_xs_get_domain_path(xenstore, 0);
     snprintf(be, len, "%s/backend/%s/%d/%d", dom, btype, xen_domid, vdev);
     free(dom);
 
diff --git a/hw/xen/xen_pt_graphics.c b/hw/xen/xen_pt_graphics.c
index f303f67c9c..0aed3bb6fd 100644
--- a/hw/xen/xen_pt_graphics.c
+++ b/hw/xen/xen_pt_graphics.c
@@ -5,7 +5,6 @@
 #include "qapi/error.h"
 #include "xen_pt.h"
 #include "xen-host-pci-device.h"
-#include "hw/xen/xen-legacy-backend.h"
 
 static unsigned long igd_guest_opregion;
 static unsigned long igd_host_opregion;
diff --git a/hw/xen/xen_pvdev.c b/hw/xen/xen_pvdev.c
index d8582cc74c..be1504b82c 100644
--- a/hw/xen/xen_pvdev.c
+++ b/hw/xen/xen_pvdev.c
@@ -54,31 +54,17 @@ void xen_config_cleanup(void)
     struct xs_dirs *d;
 
     QTAILQ_FOREACH(d, &xs_cleanup, list) {
-        xs_rm(xenstore, 0, d->xs_dir);
+        qemu_xen_xs_destroy(xenstore, 0, d->xs_dir);
     }
 }
 
 int xenstore_mkdir(char *path, int p)
 {
-    struct xs_permissions perms[2] = {
-        {
-            .id    = 0, /* set owner: dom0 */
-        }, {
-            .id    = xen_domid,
-            .perms = p,
-        }
-    };
-
-    if (!xs_mkdir(xenstore, 0, path)) {
+    if (!qemu_xen_xs_create(xenstore, 0, 0, xen_domid, p, path)) {
         xen_pv_printf(NULL, 0, "xs_mkdir %s: failed\n", path);
         return -1;
     }
     xenstore_cleanup_dir(g_strdup(path));
-
-    if (!xs_set_permissions(xenstore, 0, path, perms, 2)) {
-        xen_pv_printf(NULL, 0, "xs_set_permissions %s: failed\n", path);
-        return -1;
-    }
     return 0;
 }
 
@@ -87,7 +73,7 @@ int xenstore_write_str(const char *base, const char *node, const char *val)
     char abspath[XEN_BUFSIZE];
 
     snprintf(abspath, sizeof(abspath), "%s/%s", base, node);
-    if (!xs_write(xenstore, 0, abspath, val, strlen(val))) {
+    if (!qemu_xen_xs_write(xenstore, 0, abspath, val, strlen(val))) {
         return -1;
     }
     return 0;
@@ -100,7 +86,7 @@ char *xenstore_read_str(const char *base, const char *node)
     char *str, *ret = NULL;
 
     snprintf(abspath, sizeof(abspath), "%s/%s", base, node);
-    str = xs_read(xenstore, 0, abspath, &len);
+    str = qemu_xen_xs_read(xenstore, 0, abspath, &len);
     if (str != NULL) {
         /* move to qemu-allocated memory to make sure
          * callers can savely g_free() stuff. */
@@ -152,29 +138,6 @@ int xenstore_read_uint64(const char *base, const char *node, uint64_t *uval)
     return rc;
 }
 
-void xenstore_update(void *unused)
-{
-    char **vec = NULL;
-    intptr_t type, ops, ptr;
-    unsigned int dom, count;
-
-    vec = xs_read_watch(xenstore, &count);
-    if (vec == NULL) {
-        goto cleanup;
-    }
-
-    if (sscanf(vec[XS_WATCH_TOKEN], "be:%" PRIxPTR ":%d:%" PRIxPTR,
-               &type, &dom, &ops) == 3) {
-        xenstore_update_be(vec[XS_WATCH_PATH], (void *)type, dom, (void*)ops);
-    }
-    if (sscanf(vec[XS_WATCH_TOKEN], "fe:%" PRIxPTR, &ptr) == 1) {
-        xenstore_update_fe(vec[XS_WATCH_PATH], (void *)ptr);
-    }
-
-cleanup:
-    free(vec);
-}
-
 const char *xenbus_strstate(enum xenbus_state state)
 {
     static const char *const name[] = {
@@ -299,9 +262,7 @@ void xen_pv_del_xendev(struct XenLegacyDevice *xendev)
     }
 
     if (xendev->fe) {
-        char token[XEN_BUFSIZE];
-        snprintf(token, sizeof(token), "fe:%p", xendev);
-        xs_unwatch(xenstore, xendev->fe, token);
+        qemu_xen_xs_unwatch(xenstore, xendev->watch);
         g_free(xendev->fe);
     }
 
diff --git a/include/hw/xen/xen-bus-helper.h b/include/hw/xen/xen-bus-helper.h
index 8782f30550..d8dcc2f010 100644
--- a/include/hw/xen/xen-bus-helper.h
+++ b/include/hw/xen/xen-bus-helper.h
@@ -8,40 +8,40 @@
 #ifndef HW_XEN_BUS_HELPER_H
 #define HW_XEN_BUS_HELPER_H
 
-#include "hw/xen/xen_common.h"
+#include "hw/xen/xen_backend_ops.h"
 
 const char *xs_strstate(enum xenbus_state state);
 
-void xs_node_create(struct xs_handle *xsh,  xs_transaction_t tid,
-                    const char *node, struct xs_permissions perms[],
-                    unsigned int nr_perms, Error **errp);
-void xs_node_destroy(struct xs_handle *xsh,  xs_transaction_t tid,
+void xs_node_create(struct qemu_xs_handle *h,  xs_transaction_t tid,
+                    const char *node, unsigned int owner, unsigned int domid,
+                    unsigned int perms, Error **errp);
+void xs_node_destroy(struct qemu_xs_handle *h,  xs_transaction_t tid,
                      const char *node, Error **errp);
 
 /* Write to node/key unless node is empty, in which case write to key */
-void xs_node_vprintf(struct xs_handle *xsh,  xs_transaction_t tid,
+void xs_node_vprintf(struct qemu_xs_handle *h,  xs_transaction_t tid,
                      const char *node, const char *key, Error **errp,
                      const char *fmt, va_list ap)
     G_GNUC_PRINTF(6, 0);
-void xs_node_printf(struct xs_handle *xsh,  xs_transaction_t tid,
+void xs_node_printf(struct qemu_xs_handle *h,  xs_transaction_t tid,
                     const char *node, const char *key, Error **errp,
                     const char *fmt, ...)
     G_GNUC_PRINTF(6, 7);
 
 /* Read from node/key unless node is empty, in which case read from key */
-int xs_node_vscanf(struct xs_handle *xsh,  xs_transaction_t tid,
+int xs_node_vscanf(struct qemu_xs_handle *h,  xs_transaction_t tid,
                    const char *node, const char *key, Error **errp,
                    const char *fmt, va_list ap)
     G_GNUC_SCANF(6, 0);
-int xs_node_scanf(struct xs_handle *xsh,  xs_transaction_t tid,
+int xs_node_scanf(struct qemu_xs_handle *h,  xs_transaction_t tid,
                   const char *node, const char *key, Error **errp,
                   const char *fmt, ...)
     G_GNUC_SCANF(6, 7);
 
 /* Watch node/key unless node is empty, in which case watch key */
-void xs_node_watch(struct xs_handle *xsh, const char *node, const char *key,
-                   char *token, Error **errp);
-void xs_node_unwatch(struct xs_handle *xsh, const char *node, const char *key,
-                     const char *token, Error **errp);
+struct qemu_xs_watch *xs_node_watch(struct qemu_xs_handle *h, const char *node,
+                                    const char *key, xs_watch_fn fn,
+                                    void *opaque, Error **errp);
+void xs_node_unwatch(struct qemu_xs_handle *h, struct qemu_xs_watch *w);
 
 #endif /* HW_XEN_BUS_HELPER_H */
diff --git a/include/hw/xen/xen-bus.h b/include/hw/xen/xen-bus.h
index 5a90e79d53..f435898164 100644
--- a/include/hw/xen/xen-bus.h
+++ b/include/hw/xen/xen-bus.h
@@ -9,29 +9,23 @@
 #define HW_XEN_BUS_H
 
 #include "hw/xen/xen_backend_ops.h"
-#include "hw/xen/interface/io/xenbus.h"
 #include "hw/sysbus.h"
 #include "qemu/notify.h"
 #include "qom/object.h"
 
-typedef void (*XenWatchHandler)(void *opaque);
-
-typedef struct XenWatchList XenWatchList;
-typedef struct XenWatch XenWatch;
 typedef struct XenEventChannel XenEventChannel;
 
 struct XenDevice {
     DeviceState qdev;
     domid_t frontend_id;
     char *name;
-    struct xs_handle *xsh;
-    XenWatchList *watch_list;
+    struct qemu_xs_handle *xsh;
     char *backend_path, *frontend_path;
     enum xenbus_state backend_state, frontend_state;
     Notifier exit;
-    XenWatch *backend_state_watch, *frontend_state_watch;
+    struct qemu_xs_watch *backend_state_watch, *frontend_state_watch;
     bool backend_online;
-    XenWatch *backend_online_watch;
+    struct qemu_xs_watch *backend_online_watch;
     xengnttab_handle *xgth;
     bool inactive;
     QLIST_HEAD(, XenEventChannel) event_channels;
@@ -64,10 +58,9 @@ OBJECT_DECLARE_TYPE(XenDevice, XenDeviceClass, XEN_DEVICE)
 struct XenBus {
     BusState qbus;
     domid_t backend_id;
-    struct xs_handle *xsh;
-    XenWatchList *watch_list;
+    struct qemu_xs_handle *xsh;
     unsigned int backend_types;
-    XenWatch **backend_watch;
+    struct qemu_xs_watch **backend_watch;
     QLIST_HEAD(, XenDevice) inactive_devices;
 };
 
diff --git a/include/hw/xen/xen-legacy-backend.h b/include/hw/xen/xen-legacy-backend.h
index ab28583267..6c307c5f2c 100644
--- a/include/hw/xen/xen-legacy-backend.h
+++ b/include/hw/xen/xen-legacy-backend.h
@@ -2,7 +2,6 @@
 #define HW_XEN_LEGACY_BACKEND_H
 
 #include "hw/xen/xen_backend_ops.h"
-#include "hw/xen/interface/io/xenbus.h"
 #include "hw/xen/xen_pvdev.h"
 #include "net/net.h"
 #include "qom/object.h"
@@ -16,7 +15,7 @@ DECLARE_INSTANCE_CHECKER(XenLegacyDevice, XENBACKEND,
                          TYPE_XENBACKEND)
 
 /* variables */
-extern struct xs_handle *xenstore;
+extern struct qemu_xs_handle *xenstore;
 extern const char *xen_protocol;
 extern DeviceState *xen_sysdev;
 extern BusState *xen_sysbus;
@@ -31,9 +30,6 @@ int xenstore_write_be_int64(struct XenLegacyDevice *xendev, const char *node,
 char *xenstore_read_be_str(struct XenLegacyDevice *xendev, const char *node);
 int xenstore_read_be_int(struct XenLegacyDevice *xendev, const char *node,
                          int *ival);
-void xenstore_update_fe(char *watch, struct XenLegacyDevice *xendev);
-void xenstore_update_be(char *watch, char *type, int dom,
-                        struct XenDevOps *ops);
 char *xenstore_read_fe_str(struct XenLegacyDevice *xendev, const char *node);
 int xenstore_read_fe_int(struct XenLegacyDevice *xendev, const char *node,
                          int *ival);
diff --git a/include/hw/xen/xen_backend_ops.h b/include/hw/xen/xen_backend_ops.h
index 0dff06bbde..90cca85f52 100644
--- a/include/hw/xen/xen_backend_ops.h
+++ b/include/hw/xen/xen_backend_ops.h
@@ -12,6 +12,10 @@
 #ifndef QEMU_XEN_BACKEND_OPS_H
 #define QEMU_XEN_BACKEND_OPS_H
 
+#include "hw/xen/xen.h"
+#include "hw/xen/interface/xen.h"
+#include "hw/xen/interface/io/xenbus.h"
+
 /*
  * For the time being, these operations map fairly closely to the API of
  * the actual Xen libraries, e.g. libxenevtchn. As we complete the migration
@@ -36,6 +40,16 @@ typedef uint32_t grant_ref_t;
 #define XEN_PAGE_SIZE        (1UL << XEN_PAGE_SHIFT)
 #define XEN_PAGE_MASK        (~(XEN_PAGE_SIZE - 1))
 
+#ifndef xen_rmb
+#define xen_rmb() smp_rmb()
+#endif
+#ifndef xen_wmb
+#define xen_wmb() smp_wmb()
+#endif
+#ifndef xen_mb
+#define xen_mb() smp_mb()
+#endif
+
 struct evtchn_backend_ops {
     xenevtchn_handle *(*open)(void);
     int (*bind_interdomain)(xenevtchn_handle *xc, uint32_t domid,
@@ -240,6 +254,155 @@ static inline int qemu_xen_foreignmem_unmap(void *addr, size_t pages)
     return xen_foreignmem_ops->unmap(addr, pages);
 }
 
+typedef void (*xs_watch_fn)(void *opaque, const char *path);
+
+struct qemu_xs_handle;
+struct qemu_xs_watch;
+typedef uint32_t xs_transaction_t;
+
+#define XBT_NULL 0
+
+#define XS_PERM_NONE  0x00
+#define XS_PERM_READ  0x01
+#define XS_PERM_WRITE 0x02
+
+struct xenstore_backend_ops {
+    struct qemu_xs_handle *(*open)(void);
+    void (*close)(struct qemu_xs_handle *h);
+    char *(*get_domain_path)(struct qemu_xs_handle *h, unsigned int domid);
+    char **(*directory)(struct qemu_xs_handle *h, xs_transaction_t t,
+                        const char *path, unsigned int *num);
+    void *(*read)(struct qemu_xs_handle *h, xs_transaction_t t,
+                  const char *path, unsigned int *len);
+    bool (*write)(struct qemu_xs_handle *h, xs_transaction_t t,
+                  const char *path, const void *data, unsigned int len);
+    bool (*create)(struct qemu_xs_handle *h, xs_transaction_t t,
+                   unsigned int owner, unsigned int domid,
+                   unsigned int perms, const char *path);
+    bool (*destroy)(struct qemu_xs_handle *h, xs_transaction_t t,
+               const char *path);
+    struct qemu_xs_watch *(*watch)(struct qemu_xs_handle *h, const char *path,
+                                   xs_watch_fn fn, void *opaque);
+    void (*unwatch)(struct qemu_xs_handle *h, struct qemu_xs_watch *w);
+    xs_transaction_t (*transaction_start)(struct qemu_xs_handle *h);
+    bool (*transaction_end)(struct qemu_xs_handle *h, xs_transaction_t t,
+                            bool abort);
+};
+
+extern struct xenstore_backend_ops *xen_xenstore_ops;
+
+static inline struct qemu_xs_handle *qemu_xen_xs_open(void)
+{
+    if (!xen_xenstore_ops) {
+        return NULL;
+    }
+    return xen_xenstore_ops->open();
+}
+
+static inline void qemu_xen_xs_close(struct qemu_xs_handle *h)
+{
+    if (!xen_xenstore_ops) {
+        return;
+    }
+    xen_xenstore_ops->close(h);
+}
+
+static inline char *qemu_xen_xs_get_domain_path(struct qemu_xs_handle *h,
+                                                unsigned int domid)
+{
+    if (!xen_xenstore_ops) {
+        return NULL;
+    }
+    return xen_xenstore_ops->get_domain_path(h, domid);
+}
+
+static inline char **qemu_xen_xs_directory(struct qemu_xs_handle *h,
+                                           xs_transaction_t t, const char *path,
+                                           unsigned int *num)
+{
+    if (!xen_xenstore_ops) {
+        return NULL;
+    }
+    return xen_xenstore_ops->directory(h, t, path, num);
+}
+
+static inline void *qemu_xen_xs_read(struct qemu_xs_handle *h,
+                                     xs_transaction_t t, const char *path,
+                                     unsigned int *len)
+{
+    if (!xen_xenstore_ops) {
+        return NULL;
+    }
+    return xen_xenstore_ops->read(h, t, path, len);
+}
+
+static inline bool qemu_xen_xs_write(struct qemu_xs_handle *h,
+                                     xs_transaction_t t, const char *path,
+                                     const void *data, unsigned int len)
+{
+    if (!xen_xenstore_ops) {
+        return false;
+    }
+    return xen_xenstore_ops->write(h, t, path, data, len);
+}
+
+static inline bool qemu_xen_xs_create(struct qemu_xs_handle *h,
+                                      xs_transaction_t t, unsigned int owner,
+                                      unsigned int domid, unsigned int perms,
+                                      const char *path)
+{
+    if (!xen_xenstore_ops) {
+        return false;
+    }
+    return xen_xenstore_ops->create(h, t, owner, domid, perms, path);
+}
+
+static inline bool qemu_xen_xs_destroy(struct qemu_xs_handle *h,
+                                       xs_transaction_t t, const char *path)
+{
+    if (!xen_xenstore_ops) {
+        return false;
+    }
+    return xen_xenstore_ops->destroy(h, t, path);
+}
+
+static inline struct qemu_xs_watch *qemu_xen_xs_watch(struct qemu_xs_handle *h,
+                                                      const char *path,
+                                                      xs_watch_fn fn,
+                                                      void *opaque)
+{
+    if (!xen_xenstore_ops) {
+        return NULL;
+    }
+    return xen_xenstore_ops->watch(h, path, fn, opaque);
+}
+
+static inline void qemu_xen_xs_unwatch(struct qemu_xs_handle *h,
+                                       struct qemu_xs_watch *w)
+{
+    if (!xen_xenstore_ops) {
+        return;
+    }
+    xen_xenstore_ops->unwatch(h, w);
+}
+
+static inline xs_transaction_t qemu_xen_xs_transaction_start(struct qemu_xs_handle *h)
+{
+    if (!xen_xenstore_ops) {
+        return XBT_NULL;
+    }
+    return xen_xenstore_ops->transaction_start(h);
+}
+
+static inline bool qemu_xen_xs_transaction_end(struct qemu_xs_handle *h,
+                                               xs_transaction_t t, bool abort)
+{
+    if (!xen_xenstore_ops) {
+        return false;
+    }
+    return xen_xenstore_ops->transaction_end(h, t, abort);
+}
+
 void setup_xen_backend_ops(void);
 
 #endif /* QEMU_XEN_BACKEND_OPS_H */
diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
index 632ce617cc..7edcf3eb25 100644
--- a/include/hw/xen/xen_common.h
+++ b/include/hw/xen/xen_common.h
@@ -12,7 +12,6 @@
 
 #include <xenctrl.h>
 #include <xenstore.h>
-#include "hw/xen/interface/io/xenbus.h"
 
 #include "hw/xen/xen.h"
 #include "hw/pci/pci_device.h"
diff --git a/include/hw/xen/xen_pvdev.h b/include/hw/xen/xen_pvdev.h
index 9c27b14764..d8eea353b8 100644
--- a/include/hw/xen/xen_pvdev.h
+++ b/include/hw/xen/xen_pvdev.h
@@ -39,6 +39,7 @@ struct XenLegacyDevice {
     char               name[64];
     int                debug;
 
+    struct qemu_xs_watch *watch;
     enum xenbus_state  be_state;
     enum xenbus_state  fe_state;
     int                online;
@@ -64,7 +65,6 @@ int xenstore_write_int64(const char *base, const char *node, int64_t ival);
 char *xenstore_read_str(const char *base, const char *node);
 int xenstore_read_int(const char *base, const char *node, int *ival);
 int xenstore_read_uint64(const char *base, const char *node, uint64_t *uval);
-void xenstore_update(void *unused);
 
 const char *xenbus_strstate(enum xenbus_state state);
 
diff --git a/softmmu/globals.c b/softmmu/globals.c
index dda32986f7..39678aa8c5 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -68,3 +68,4 @@ bool xen_domid_restrict;
 struct evtchn_backend_ops *xen_evtchn_ops;
 struct gnttab_backend_ops *xen_gnttab_ops;
 struct foreignmem_backend_ops *xen_foreignmem_ops;
+struct xenstore_backend_ops *xen_xenstore_ops;
-- 
2.39.0


