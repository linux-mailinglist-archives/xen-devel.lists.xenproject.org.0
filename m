Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA3F6A853F
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 16:35:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505062.777705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkxX-0004lY-VG; Thu, 02 Mar 2023 15:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505062.777705; Thu, 02 Mar 2023 15:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkxX-0004Zd-BR; Thu, 02 Mar 2023 15:35:07 +0000
Received: by outflank-mailman (input) for mailman id 505062;
 Thu, 02 Mar 2023 15:34:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZMsQ=62=desiato.srs.infradead.org=BATV+9a0490e5ac528e462c30+7130+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pXkxP-0001Jv-5x
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 15:34:59 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2ce6d02-b90f-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 16:34:49 +0100 (CET)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pXkx4-00FL3h-1J; Thu, 02 Mar 2023 15:34:39 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pXkx4-004uyv-0y; Thu, 02 Mar 2023 15:34:38 +0000
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
X-Inumbo-ID: c2ce6d02-b90f-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=9ZgYwkDmHdUTNn7NpOvT11cK4T0wTI/32/sDSKDPebo=; b=e+PfC71rTBVEii8yyVkbh/t56H
	+829LbM5c3AOktaXOdD1q5NguavsYOlIjTr6rqGbsoxAJIt97tD+7ZtVYEMlyNFprMB1Ae5DHOdK6
	1LdO7mgC1+qhnFjUVqDV/uwfebOXub1iavhFK+C6O/rSfypZM9WabK+tYkDkVgU3X7wBC/ZYIIXar
	AGvUUziKVsGWV9bfdC15Nk30WTJGzE/nGxZh601/E3eRz8xiRJ7XLeuw/3qAehEmR8ltOtcvSZleo
	vmPHP3Gn6cKDi0vaziNrMFBJD2fTKYjMBAFJ6nR0h42esHxxpk9YsAb3Z674NfeljO+ZmWaVMGNli
	RGdrseoQ==;
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
Subject: [RFC PATCH v1 10/25] hw/xen: Add gnttab operations to allow redirection to internal emulation
Date: Thu,  2 Mar 2023 15:34:20 +0000
Message-Id: <20230302153435.1170111-11-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230302153435.1170111-1-dwmw2@infradead.org>
References: <20230302153435.1170111-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Move the existing code using libxengnttab to xen-operations.c and allow
the operations to be redirected so that we can add emulation of grant
table mapping for backend drivers.

In emulation, mapping more than one grant ref to be virtually contiguous
would be fairly difficult. The best way to do it might be to make the
ram_block mappings actually backed by a file (shmem or a deleted file,
perhaps) so that we can have multiple *shared* mappings of it. But that
would be fairly intrusive.

Making the backend drivers cope with page *lists* instead of expecting
the mapping to be contiguous is also non-trivial, since some structures
would actually *cross* page boundaries (e.g. the 32-bit blkif responses
which are 12 bytes).

So for now, we'll support only single-page mappings in emulation. Add a
XEN_GNTTAB_OP_FEATURE_MAP_MULTIPLE flag to indicate that the native Xen
implementation *does* support multi-page maps, and a helper function to
query it.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
 hw/xen/xen-bus.c                    | 112 ++------------------
 hw/xen/xen-legacy-backend.c         | 125 ++--------------------
 hw/xen/xen-operations.c             | 157 ++++++++++++++++++++++++++++
 hw/xen/xen_pvdev.c                  |   2 +-
 include/hw/xen/xen-bus.h            |   3 +-
 include/hw/xen/xen-legacy-backend.h |  13 +--
 include/hw/xen/xen_backend_ops.h    | 100 ++++++++++++++++++
 include/hw/xen/xen_common.h         |  39 -------
 softmmu/globals.c                   |   1 +
 9 files changed, 280 insertions(+), 272 deletions(-)

diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index d0b1ae93da..b247e86f28 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -947,7 +947,7 @@ static void xen_device_frontend_destroy(XenDevice *xendev)
 void xen_device_set_max_grant_refs(XenDevice *xendev, unsigned int nr_refs,
                                    Error **errp)
 {
-    if (xengnttab_set_max_grants(xendev->xgth, nr_refs)) {
+    if (qemu_xen_gnttab_set_max_grants(xendev->xgth, nr_refs)) {
         error_setg_errno(errp, errno, "xengnttab_set_max_grants failed");
     }
 }
@@ -956,9 +956,8 @@ void *xen_device_map_grant_refs(XenDevice *xendev, uint32_t *refs,
                                 unsigned int nr_refs, int prot,
                                 Error **errp)
 {
-    void *map = xengnttab_map_domain_grant_refs(xendev->xgth, nr_refs,
-                                                xendev->frontend_id, refs,
-                                                prot);
+    void *map = qemu_xen_gnttab_map_refs(xendev->xgth, nr_refs,
+                                         xendev->frontend_id, refs, prot);
 
     if (!map) {
         error_setg_errno(errp, errno,
@@ -971,109 +970,17 @@ void *xen_device_map_grant_refs(XenDevice *xendev, uint32_t *refs,
 void xen_device_unmap_grant_refs(XenDevice *xendev, void *map,
                                  unsigned int nr_refs, Error **errp)
 {
-    if (xengnttab_unmap(xendev->xgth, map, nr_refs)) {
+    if (qemu_xen_gnttab_unmap(xendev->xgth, map, nr_refs)) {
         error_setg_errno(errp, errno, "xengnttab_unmap failed");
     }
 }
 
-static void compat_copy_grant_refs(XenDevice *xendev, bool to_domain,
-                                   XenDeviceGrantCopySegment segs[],
-                                   unsigned int nr_segs, Error **errp)
-{
-    uint32_t *refs = g_new(uint32_t, nr_segs);
-    int prot = to_domain ? PROT_WRITE : PROT_READ;
-    void *map;
-    unsigned int i;
-
-    for (i = 0; i < nr_segs; i++) {
-        XenDeviceGrantCopySegment *seg = &segs[i];
-
-        refs[i] = to_domain ? seg->dest.foreign.ref :
-            seg->source.foreign.ref;
-    }
-
-    map = xengnttab_map_domain_grant_refs(xendev->xgth, nr_segs,
-                                          xendev->frontend_id, refs,
-                                          prot);
-    if (!map) {
-        error_setg_errno(errp, errno,
-                         "xengnttab_map_domain_grant_refs failed");
-        goto done;
-    }
-
-    for (i = 0; i < nr_segs; i++) {
-        XenDeviceGrantCopySegment *seg = &segs[i];
-        void *page = map + (i * XC_PAGE_SIZE);
-
-        if (to_domain) {
-            memcpy(page + seg->dest.foreign.offset, seg->source.virt,
-                   seg->len);
-        } else {
-            memcpy(seg->dest.virt, page + seg->source.foreign.offset,
-                   seg->len);
-        }
-    }
-
-    if (xengnttab_unmap(xendev->xgth, map, nr_segs)) {
-        error_setg_errno(errp, errno, "xengnttab_unmap failed");
-    }
-
-done:
-    g_free(refs);
-}
-
 void xen_device_copy_grant_refs(XenDevice *xendev, bool to_domain,
                                 XenDeviceGrantCopySegment segs[],
                                 unsigned int nr_segs, Error **errp)
 {
-    xengnttab_grant_copy_segment_t *xengnttab_segs;
-    unsigned int i;
-
-    if (!xendev->feature_grant_copy) {
-        compat_copy_grant_refs(xendev, to_domain, segs, nr_segs, errp);
-        return;
-    }
-
-    xengnttab_segs = g_new0(xengnttab_grant_copy_segment_t, nr_segs);
-
-    for (i = 0; i < nr_segs; i++) {
-        XenDeviceGrantCopySegment *seg = &segs[i];
-        xengnttab_grant_copy_segment_t *xengnttab_seg = &xengnttab_segs[i];
-
-        if (to_domain) {
-            xengnttab_seg->flags = GNTCOPY_dest_gref;
-            xengnttab_seg->dest.foreign.domid = xendev->frontend_id;
-            xengnttab_seg->dest.foreign.ref = seg->dest.foreign.ref;
-            xengnttab_seg->dest.foreign.offset = seg->dest.foreign.offset;
-            xengnttab_seg->source.virt = seg->source.virt;
-        } else {
-            xengnttab_seg->flags = GNTCOPY_source_gref;
-            xengnttab_seg->source.foreign.domid = xendev->frontend_id;
-            xengnttab_seg->source.foreign.ref = seg->source.foreign.ref;
-            xengnttab_seg->source.foreign.offset =
-                seg->source.foreign.offset;
-            xengnttab_seg->dest.virt = seg->dest.virt;
-        }
-
-        xengnttab_seg->len = seg->len;
-    }
-
-    if (xengnttab_grant_copy(xendev->xgth, nr_segs, xengnttab_segs)) {
-        error_setg_errno(errp, errno, "xengnttab_grant_copy failed");
-        goto done;
-    }
-
-    for (i = 0; i < nr_segs; i++) {
-        xengnttab_grant_copy_segment_t *xengnttab_seg = &xengnttab_segs[i];
-
-        if (xengnttab_seg->status != GNTST_okay) {
-            error_setg(errp, "xengnttab_grant_copy seg[%u] failed", i);
-            break;
-        }
-    }
-
-done:
-    g_free(xengnttab_segs);
+    qemu_xen_gnttab_grant_copy(xendev->xgth, to_domain, xendev->frontend_id,
+                               (XenGrantCopySegment *)segs, nr_segs, errp);
 }
 
 struct XenEventChannel {
@@ -1235,7 +1142,7 @@ static void xen_device_unrealize(DeviceState *dev)
     xen_device_backend_destroy(xendev);
 
     if (xendev->xgth) {
-        xengnttab_close(xendev->xgth);
+        qemu_xen_gnttab_close(xendev->xgth);
         xendev->xgth = NULL;
     }
 
@@ -1298,15 +1205,12 @@ static void xen_device_realize(DeviceState *dev, Error **errp)
 
     xendev->watch_list = watch_list_create(xendev->xsh);
 
-    xendev->xgth = xengnttab_open(NULL, 0);
+    xendev->xgth = qemu_xen_gnttab_open();
     if (!xendev->xgth) {
         error_setg_errno(errp, errno, "failed xengnttab_open");
         goto unrealize;
     }
 
-    xendev->feature_grant_copy =
-        (xengnttab_grant_copy(xendev->xgth, 0, NULL) == 0);
-
     xen_device_backend_create(xendev, errp);
     if (*errp) {
         goto unrealize;
diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 9ce3dc204b..1e9a28f263 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -43,7 +43,6 @@ struct xs_handle *xenstore;
 const char *xen_protocol;
 
 /* private */
-static bool xen_feature_grant_copy;
 static int debug;
 
 int xenstore_write_be_str(struct XenLegacyDevice *xendev, const char *node,
@@ -113,7 +112,7 @@ void xen_be_set_max_grant_refs(struct XenLegacyDevice *xendev,
 {
     assert(xendev->ops->flags & DEVOPS_FLAG_NEED_GNTDEV);
 
-    if (xengnttab_set_max_grants(xendev->gnttabdev, nr_refs)) {
+    if (qemu_xen_gnttab_set_max_grants(xendev->gnttabdev, nr_refs)) {
         xen_pv_printf(xendev, 0, "xengnttab_set_max_grants failed: %s\n",
                       strerror(errno));
     }
@@ -126,8 +125,8 @@ void *xen_be_map_grant_refs(struct XenLegacyDevice *xendev, uint32_t *refs,
 
     assert(xendev->ops->flags & DEVOPS_FLAG_NEED_GNTDEV);
 
-    ptr = xengnttab_map_domain_grant_refs(xendev->gnttabdev, nr_refs,
-                                          xen_domid, refs, prot);
+    ptr = qemu_xen_gnttab_map_refs(xendev->gnttabdev, nr_refs, xen_domid, refs,
+                                   prot);
     if (!ptr) {
         xen_pv_printf(xendev, 0,
                       "xengnttab_map_domain_grant_refs failed: %s\n",
@@ -142,119 +141,27 @@ void xen_be_unmap_grant_refs(struct XenLegacyDevice *xendev, void *ptr,
 {
     assert(xendev->ops->flags & DEVOPS_FLAG_NEED_GNTDEV);
 
-    if (xengnttab_unmap(xendev->gnttabdev, ptr, nr_refs)) {
+    if (qemu_xen_gnttab_unmap(xendev->gnttabdev, ptr, nr_refs)) {
         xen_pv_printf(xendev, 0, "xengnttab_unmap failed: %s\n",
                       strerror(errno));
     }
 }
 
-static int compat_copy_grant_refs(struct XenLegacyDevice *xendev,
-                                  bool to_domain,
-                                  XenGrantCopySegment segs[],
-                                  unsigned int nr_segs)
-{
-    uint32_t *refs = g_new(uint32_t, nr_segs);
-    int prot = to_domain ? PROT_WRITE : PROT_READ;
-    void *pages;
-    unsigned int i;
-
-    for (i = 0; i < nr_segs; i++) {
-        XenGrantCopySegment *seg = &segs[i];
-
-        refs[i] = to_domain ?
-            seg->dest.foreign.ref : seg->source.foreign.ref;
-    }
-
-    pages = xengnttab_map_domain_grant_refs(xendev->gnttabdev, nr_segs,
-                                            xen_domid, refs, prot);
-    if (!pages) {
-        xen_pv_printf(xendev, 0,
-                      "xengnttab_map_domain_grant_refs failed: %s\n",
-                      strerror(errno));
-        g_free(refs);
-        return -1;
-    }
-
-    for (i = 0; i < nr_segs; i++) {
-        XenGrantCopySegment *seg = &segs[i];
-        void *page = pages + (i * XC_PAGE_SIZE);
-
-        if (to_domain) {
-            memcpy(page + seg->dest.foreign.offset, seg->source.virt,
-                   seg->len);
-        } else {
-            memcpy(seg->dest.virt, page + seg->source.foreign.offset,
-                   seg->len);
-        }
-    }
-
-    if (xengnttab_unmap(xendev->gnttabdev, pages, nr_segs)) {
-        xen_pv_printf(xendev, 0, "xengnttab_unmap failed: %s\n",
-                      strerror(errno));
-    }
-
-    g_free(refs);
-    return 0;
-}
-
 int xen_be_copy_grant_refs(struct XenLegacyDevice *xendev,
                            bool to_domain,
                            XenGrantCopySegment segs[],
                            unsigned int nr_segs)
 {
-    xengnttab_grant_copy_segment_t *xengnttab_segs;
-    unsigned int i;
     int rc;
 
     assert(xendev->ops->flags & DEVOPS_FLAG_NEED_GNTDEV);
 
-    if (!xen_feature_grant_copy) {
-        return compat_copy_grant_refs(xendev, to_domain, segs, nr_segs);
-    }
-
-    xengnttab_segs = g_new0(xengnttab_grant_copy_segment_t, nr_segs);
-
-    for (i = 0; i < nr_segs; i++) {
-        XenGrantCopySegment *seg = &segs[i];
-        xengnttab_grant_copy_segment_t *xengnttab_seg = &xengnttab_segs[i];
-
-        if (to_domain) {
-            xengnttab_seg->flags = GNTCOPY_dest_gref;
-            xengnttab_seg->dest.foreign.domid = xen_domid;
-            xengnttab_seg->dest.foreign.ref = seg->dest.foreign.ref;
-            xengnttab_seg->dest.foreign.offset = seg->dest.foreign.offset;
-            xengnttab_seg->source.virt = seg->source.virt;
-        } else {
-            xengnttab_seg->flags = GNTCOPY_source_gref;
-            xengnttab_seg->source.foreign.domid = xen_domid;
-            xengnttab_seg->source.foreign.ref = seg->source.foreign.ref;
-            xengnttab_seg->source.foreign.offset =
-                seg->source.foreign.offset;
-            xengnttab_seg->dest.virt = seg->dest.virt;
-        }
-
-        xengnttab_seg->len = seg->len;
-    }
-
-    rc = xengnttab_grant_copy(xendev->gnttabdev, nr_segs, xengnttab_segs);
-
+    rc = qemu_xen_gnttab_grant_copy(xendev->gnttabdev, to_domain, xen_domid,
+                                    segs, nr_segs, NULL);
     if (rc) {
-        xen_pv_printf(xendev, 0, "xengnttab_copy failed: %s\n",
-                      strerror(errno));
-    }
-
-    for (i = 0; i < nr_segs; i++) {
-        xengnttab_grant_copy_segment_t *xengnttab_seg =
-            &xengnttab_segs[i];
-
-        if (xengnttab_seg->status != GNTST_okay) {
-            xen_pv_printf(xendev, 0, "segment[%u] status: %d\n", i,
-                          xengnttab_seg->status);
-            rc = -1;
-        }
+        xen_pv_printf(xendev, 0, "xengnttab_grant_copy failed: %s\n",
+                      strerror(-rc));
     }
-
-    g_free(xengnttab_segs);
     return rc;
 }
 
@@ -466,7 +373,7 @@ static int xen_be_try_initialise(struct XenLegacyDevice *xendev)
     }
 
     if (xendev->ops->flags & DEVOPS_FLAG_NEED_GNTDEV) {
-        xendev->gnttabdev = xengnttab_open(NULL, 0);
+        xendev->gnttabdev = qemu_xen_gnttab_open();
         if (xendev->gnttabdev == NULL) {
             xen_pv_printf(NULL, 0, "can't open gnttab device\n");
             return -1;
@@ -524,7 +431,7 @@ static void xen_be_disconnect(struct XenLegacyDevice *xendev,
         xendev->ops->disconnect(xendev);
     }
     if (xendev->gnttabdev) {
-        xengnttab_close(xendev->gnttabdev);
+        qemu_xen_gnttab_close(xendev->gnttabdev);
         xendev->gnttabdev = NULL;
     }
     if (xendev->be_state != state) {
@@ -687,8 +594,6 @@ static void xen_set_dynamic_sysbus(void)
 
 void xen_be_init(void)
 {
-    xengnttab_handle *gnttabdev;
-
     xenstore = xs_daemon_open();
     if (!xenstore) {
         xen_pv_printf(NULL, 0, "can't connect to xenstored\n");
@@ -697,19 +602,11 @@ void xen_be_init(void)
 
     qemu_set_fd_handler(xs_fileno(xenstore), xenstore_update, NULL, NULL);
 
-    if (xen_xc == NULL || xen_fmem == NULL) {
+    if (xen_evtchn_ops == NULL || xen_gnttab_ops == NULL) {
         xen_pv_printf(NULL, 0, "Xen operations not set up\n");
         exit(1);
     }
 
-    gnttabdev = xengnttab_open(NULL, 0);
-    if (gnttabdev != NULL) {
-        if (xengnttab_grant_copy(gnttabdev, 0, NULL) == 0) {
-            xen_feature_grant_copy = true;
-        }
-        xengnttab_close(gnttabdev);
-    }
-
     xen_sysdev = qdev_new(TYPE_XENSYSDEV);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(xen_sysdev), &error_fatal);
     xen_sysbus = qbus_new(TYPE_XENSYSBUS, xen_sysdev, "xen-sysbus");
diff --git a/hw/xen/xen-operations.c b/hw/xen/xen-operations.c
index 1a959d89e8..eb5fb0a59f 100644
--- a/hw/xen/xen-operations.c
+++ b/hw/xen/xen-operations.c
@@ -21,6 +21,7 @@
  * must be undefined before including xenctrl.h
  */
 #undef XC_WANT_COMPAT_EVTCHN_API
+#undef XC_WANT_COMPAT_GNTTAB_API
 
 #include <xenctrl.h>
 
@@ -43,12 +44,141 @@ typedef evtchn_port_or_error_t xenevtchn_port_or_error_t;
 #define xenevtchn_unmask(h, p) xc_evtchn_unmask(h, p)
 #define xenevtchn_unbind(h, p) xc_evtchn_unbind(h, p)
 
+typedef xc_gnttab xengnttab_handle;
+
+#define xengnttab_open(l, f) xc_gnttab_open(l, f)
+#define xengnttab_close(h) xc_gnttab_close(h)
+#define xengnttab_set_max_grants(h, n) xc_gnttab_set_max_grants(h, n)
+#define xengnttab_map_grant_ref(h, d, r, p) xc_gnttab_map_grant_ref(h, d, r, p)
+#define xengnttab_unmap(h, a, n) xc_gnttab_munmap(h, a, n)
+#define xengnttab_map_grant_refs(h, c, d, r, p) \
+    xc_gnttab_map_grant_refs(h, c, d, r, p)
+#define xengnttab_map_domain_grant_refs(h, c, d, r, p) \
+    xc_gnttab_map_domain_grant_refs(h, c, d, r, p)
+
 #else /* CONFIG_XEN_CTRL_INTERFACE_VERSION >= 40701 */
 
 #include <xenevtchn.h>
+#include <xengnttab.h>
 
 #endif
 
+/* Xen before 4.8 */
+
+static int libxengnttab_fallback_grant_copy(xengnttab_handle *xgt,
+                                            bool to_domain, uint32_t domid,
+                                            XenGrantCopySegment segs[],
+                                            unsigned int nr_segs, Error **errp)
+{
+    uint32_t *refs = g_new(uint32_t, nr_segs);
+    int prot = to_domain ? PROT_WRITE : PROT_READ;
+    void *map;
+    unsigned int i;
+    int rc = 0;
+
+    for (i = 0; i < nr_segs; i++) {
+        XenGrantCopySegment *seg = &segs[i];
+
+        refs[i] = to_domain ? seg->dest.foreign.ref :
+            seg->source.foreign.ref;
+    }
+    map = xengnttab_map_domain_grant_refs(xgt, nr_segs, domid, refs, prot);
+    if (!map) {
+        if (errp) {
+            error_setg_errno(errp, errno,
+                             "xengnttab_map_domain_grant_refs failed");
+        }
+        rc = -errno;
+        goto done;
+    }
+
+    for (i = 0; i < nr_segs; i++) {
+        XenGrantCopySegment *seg = &segs[i];
+        void *page = map + (i * XEN_PAGE_SIZE);
+
+        if (to_domain) {
+            memcpy(page + seg->dest.foreign.offset, seg->source.virt,
+                   seg->len);
+        } else {
+            memcpy(seg->dest.virt, page + seg->source.foreign.offset,
+                   seg->len);
+        }
+    }
+
+    if (xengnttab_unmap(xgt, map, nr_segs)) {
+        if (errp) {
+            error_setg_errno(errp, errno, "xengnttab_unmap failed");
+        }
+        rc = -errno;
+    }
+
+done:
+    g_free(refs);
+    return rc;
+}
+
+#if CONFIG_XEN_CTRL_INTERFACE_VERSION >= 40800
+
+static int libxengnttab_backend_grant_copy(xengnttab_handle *xgt,
+                                           bool to_domain, uint32_t domid,
+                                           XenGrantCopySegment *segs,
+                                           uint32_t nr_segs, Error **errp)
+{
+    xengnttab_grant_copy_segment_t *xengnttab_segs;
+    unsigned int i;
+    int rc;
+
+    xengnttab_segs = g_new0(xengnttab_grant_copy_segment_t, nr_segs);
+
+    for (i = 0; i < nr_segs; i++) {
+        XenGrantCopySegment *seg = &segs[i];
+        xengnttab_grant_copy_segment_t *xengnttab_seg = &xengnttab_segs[i];
+
+        if (to_domain) {
+            xengnttab_seg->flags = GNTCOPY_dest_gref;
+            xengnttab_seg->dest.foreign.domid = domid;
+            xengnttab_seg->dest.foreign.ref = seg->dest.foreign.ref;
+            xengnttab_seg->dest.foreign.offset = seg->dest.foreign.offset;
+            xengnttab_seg->source.virt = seg->source.virt;
+        } else {
+            xengnttab_seg->flags = GNTCOPY_source_gref;
+            xengnttab_seg->source.foreign.domid = domid;
+            xengnttab_seg->source.foreign.ref = seg->source.foreign.ref;
+            xengnttab_seg->source.foreign.offset =
+                seg->source.foreign.offset;
+            xengnttab_seg->dest.virt = seg->dest.virt;
+        }
+
+        xengnttab_seg->len = seg->len;
+    }
+
+    if (xengnttab_grant_copy(xgt, nr_segs, xengnttab_segs)) {
+        if (errp) {
+            error_setg_errno(errp, errno, "xengnttab_grant_copy failed");
+        }
+        rc = -errno;
+        goto done;
+    }
+
+    rc = 0;
+    for (i = 0; i < nr_segs; i++) {
+        xengnttab_grant_copy_segment_t *xengnttab_seg = &xengnttab_segs[i];
+
+        if (xengnttab_seg->status != GNTST_okay) {
+            if (errp) {
+                error_setg(errp, "xengnttab_grant_copy seg[%u] failed", i);
+            }
+            rc = -EIO;
+            break;
+        }
+    }
+
+done:
+    g_free(xengnttab_segs);
+    return rc;
+}
+#endif
+
 static xenevtchn_handle *libxenevtchn_backend_open(void)
 {
     return xenevtchn_open(NULL, 0);
@@ -65,7 +195,34 @@ struct evtchn_backend_ops libxenevtchn_backend_ops = {
     .pending = xenevtchn_pending,
 };
 
+static xengnttab_handle *libxengnttab_backend_open(void)
+{
+    return xengnttab_open(NULL, 0);
+}
+
+
+static struct gnttab_backend_ops libxengnttab_backend_ops = {
+    .features = XEN_GNTTAB_OP_FEATURE_MAP_MULTIPLE,
+    .open = libxengnttab_backend_open,
+    .close = xengnttab_close,
+    .grant_copy = libxengnttab_fallback_grant_copy,
+    .set_max_grants = xengnttab_set_max_grants,
+    .map_refs = xengnttab_map_domain_grant_refs,
+    .unmap = xengnttab_unmap,
+};
+
 void setup_xen_backend_ops(void)
 {
+#if CONFIG_XEN_CTRL_INTERFACE_VERSION >= 40800
+    xengnttab_handle *xgt = xengnttab_open(NULL, 0);
+
+    if (xgt) {
+        if (xengnttab_grant_copy(xgt, 0, NULL) == 0) {
+            xen_gnttab_ops->grant_copy = libxengnttab_backend_grant_copy;
+        }
+        xengnttab_close(xgt);
+    }
+#endif
     xen_evtchn_ops = &libxenevtchn_backend_ops;
+    xen_gnttab_ops = &libxengnttab_backend_ops;
 }
diff --git a/hw/xen/xen_pvdev.c b/hw/xen/xen_pvdev.c
index 86a2c8e567..d8582cc74c 100644
--- a/hw/xen/xen_pvdev.c
+++ b/hw/xen/xen_pvdev.c
@@ -309,7 +309,7 @@ void xen_pv_del_xendev(struct XenLegacyDevice *xendev)
         qemu_xen_evtchn_close(xendev->evtchndev);
     }
     if (xendev->gnttabdev != NULL) {
-        xengnttab_close(xendev->gnttabdev);
+        qemu_xen_gnttab_close(xendev->gnttabdev);
     }
 
     QTAILQ_REMOVE(&xendevs, xendev, next);
diff --git a/include/hw/xen/xen-bus.h b/include/hw/xen/xen-bus.h
index e21b83796e..72d71d1eb7 100644
--- a/include/hw/xen/xen-bus.h
+++ b/include/hw/xen/xen-bus.h
@@ -9,7 +9,7 @@
 #define HW_XEN_BUS_H
 
 #include "hw/xen/xen_backend_ops.h"
-#include "hw/xen/xen_common.h"
+#include "hw/xen/interface/io/xenbus.h"
 #include "hw/sysbus.h"
 #include "qemu/notify.h"
 #include "qom/object.h"
@@ -33,7 +33,6 @@ struct XenDevice {
     bool backend_online;
     XenWatch *backend_online_watch;
     xengnttab_handle *xgth;
-    bool feature_grant_copy;
     bool inactive;
     QLIST_HEAD(, XenEventChannel) event_channels;
     QLIST_ENTRY(XenDevice) list;
diff --git a/include/hw/xen/xen-legacy-backend.h b/include/hw/xen/xen-legacy-backend.h
index 06985b1f03..eaf79cd221 100644
--- a/include/hw/xen/xen-legacy-backend.h
+++ b/include/hw/xen/xen-legacy-backend.h
@@ -1,8 +1,8 @@
 #ifndef HW_XEN_LEGACY_BACKEND_H
 #define HW_XEN_LEGACY_BACKEND_H
 
-#include "hw/xen/xen_common.h"
 #include "hw/xen/xen_backend_ops.h"
+#include "hw/xen/interface/io/xenbus.h"
 #include "hw/xen/xen_pvdev.h"
 #include "net/net.h"
 #include "qom/object.h"
@@ -54,17 +54,6 @@ void *xen_be_map_grant_refs(struct XenLegacyDevice *xendev, uint32_t *refs,
 void xen_be_unmap_grant_refs(struct XenLegacyDevice *xendev, void *ptr,
                              unsigned int nr_refs);
 
-typedef struct XenGrantCopySegment {
-    union {
-        void *virt;
-        struct {
-            uint32_t ref;
-            off_t offset;
-        } foreign;
-    } source, dest;
-    size_t len;
-} XenGrantCopySegment;
-
 int xen_be_copy_grant_refs(struct XenLegacyDevice *xendev,
                            bool to_domain, XenGrantCopySegment segs[],
                            unsigned int nr_segs);
diff --git a/include/hw/xen/xen_backend_ops.h b/include/hw/xen/xen_backend_ops.h
index 9605456e81..bb3333ab00 100644
--- a/include/hw/xen/xen_backend_ops.h
+++ b/include/hw/xen/xen_backend_ops.h
@@ -29,6 +29,12 @@
 typedef struct xenevtchn_handle xenevtchn_handle;
 typedef int xenevtchn_port_or_error_t;
 typedef uint32_t evtchn_port_t;
+typedef uint16_t domid_t;
+typedef uint32_t grant_ref_t;
+
+#define XEN_PAGE_SHIFT       12
+#define XEN_PAGE_SIZE        (1UL << XEN_PAGE_SHIFT)
+#define XEN_PAGE_MASK        (~(XEN_PAGE_SIZE - 1))
 
 struct evtchn_backend_ops {
     xenevtchn_handle *(*open)(void);
@@ -113,6 +119,100 @@ static inline int qemu_xen_evtchn_pending(xenevtchn_handle *xc)
     return xen_evtchn_ops->pending(xc);
 }
 
+typedef struct xengntdev_handle xengnttab_handle;
+
+typedef struct XenGrantCopySegment {
+    union {
+        void *virt;
+        struct {
+            uint32_t ref;
+            off_t offset;
+        } foreign;
+    } source, dest;
+    size_t len;
+} XenGrantCopySegment;
+
+#define XEN_GNTTAB_OP_FEATURE_MAP_MULTIPLE  (1U << 0)
+
+struct gnttab_backend_ops {
+    uint32_t features;
+    xengnttab_handle *(*open)(void);
+    int (*close)(xengnttab_handle *xgt);
+    int (*grant_copy)(xengnttab_handle *xgt, bool to_domain, uint32_t domid,
+                      XenGrantCopySegment *segs, uint32_t nr_segs,
+                      Error **errp);
+    int (*set_max_grants)(xengnttab_handle *xgt, uint32_t nr_grants);
+    void *(*map_refs)(xengnttab_handle *xgt, uint32_t count, uint32_t domid,
+                      uint32_t *refs, int prot);
+    int (*unmap)(xengnttab_handle *xgt, void *start_address, uint32_t count);
+};
+
+extern struct gnttab_backend_ops *xen_gnttab_ops;
+
+static inline bool qemu_xen_gnttab_can_map_multi(void)
+{
+    return xen_gnttab_ops &&
+        !!(xen_gnttab_ops->features & XEN_GNTTAB_OP_FEATURE_MAP_MULTIPLE);
+}
+
+static inline xengnttab_handle *qemu_xen_gnttab_open(void)
+{
+    if (!xen_gnttab_ops) {
+        return NULL;
+    }
+    return xen_gnttab_ops->open();
+}
+
+static inline int qemu_xen_gnttab_close(xengnttab_handle *xgt)
+{
+    if (!xen_gnttab_ops) {
+        return -ENOSYS;
+    }
+    return xen_gnttab_ops->close(xgt);
+}
+
+static inline int qemu_xen_gnttab_grant_copy(xengnttab_handle *xgt,
+                                             bool to_domain, uint32_t domid,
+                                             XenGrantCopySegment *segs,
+                                             uint32_t nr_segs, Error **errp)
+{
+    if (!xen_gnttab_ops) {
+        return -ENOSYS;
+    }
+
+    return xen_gnttab_ops->grant_copy(xgt, to_domain, domid, segs, nr_segs,
+                                      errp);
+}
+
+static inline int qemu_xen_gnttab_set_max_grants(xengnttab_handle *xgt,
+                                                 uint32_t nr_grants)
+{
+    if (!xen_gnttab_ops) {
+        return -ENOSYS;
+    }
+    return xen_gnttab_ops->set_max_grants(xgt, nr_grants);
+}
+
+static inline void *qemu_xen_gnttab_map_refs(xengnttab_handle *xgt,
+                                             uint32_t count, uint32_t domid,
+                                             uint32_t *refs, int prot)
+{
+    if (!xen_gnttab_ops) {
+        return NULL;
+    }
+    return xen_gnttab_ops->map_refs(xgt, count, domid, refs, prot);
+}
+
+static inline int qemu_xen_gnttab_unmap(xengnttab_handle *xgt,
+                                        void *start_address,
+                                        uint32_t count)
+{
+    if (!xen_gnttab_ops) {
+        return -ENOSYS;
+    }
+    return xen_gnttab_ops->unmap(xgt, start_address, count);
+}
+
 void setup_xen_backend_ops(void);
 
 #endif /* QEMU_XEN_BACKEND_OPS_H */
diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
index 34abd0a772..d4d10d3ff1 100644
--- a/include/hw/xen/xen_common.h
+++ b/include/hw/xen/xen_common.h
@@ -28,17 +28,6 @@ extern xc_interface *xen_xc;
 #if CONFIG_XEN_CTRL_INTERFACE_VERSION < 40701
 
 typedef xc_interface xenforeignmemory_handle;
-typedef xc_gnttab xengnttab_handle;
-
-#define xengnttab_open(l, f) xc_gnttab_open(l, f)
-#define xengnttab_close(h) xc_gnttab_close(h)
-#define xengnttab_set_max_grants(h, n) xc_gnttab_set_max_grants(h, n)
-#define xengnttab_map_grant_ref(h, d, r, p) xc_gnttab_map_grant_ref(h, d, r, p)
-#define xengnttab_unmap(h, a, n) xc_gnttab_munmap(h, a, n)
-#define xengnttab_map_grant_refs(h, c, d, r, p) \
-    xc_gnttab_map_grant_refs(h, c, d, r, p)
-#define xengnttab_map_domain_grant_refs(h, c, d, r, p) \
-    xc_gnttab_map_domain_grant_refs(h, c, d, r, p)
 
 #define xenforeignmemory_open(l, f) xen_xc
 #define xenforeignmemory_close(h)
@@ -58,7 +47,6 @@ static inline void *xenforeignmemory_map(xc_interface *h, uint32_t dom,
 
 #else /* CONFIG_XEN_CTRL_INTERFACE_VERSION >= 40701 */
 
-#include <xengnttab.h>
 #include <xenforeignmemory.h>
 
 #endif
@@ -648,31 +636,4 @@ static inline int xen_set_ioreq_server_state(domid_t dom,
 
 #endif
 
-/* Xen before 4.8 */
-
-#if CONFIG_XEN_CTRL_INTERFACE_VERSION < 40800
-
-struct xengnttab_grant_copy_segment {
-    union xengnttab_copy_ptr {
-        void *virt;
-        struct {
-            uint32_t ref;
-            uint16_t offset;
-            uint16_t domid;
-        } foreign;
-    } source, dest;
-    uint16_t len;
-    uint16_t flags;
-    int16_t status;
-};
-
-typedef struct xengnttab_grant_copy_segment xengnttab_grant_copy_segment_t;
-
-static inline int xengnttab_grant_copy(xengnttab_handle *xgt, uint32_t count,
-                                       xengnttab_grant_copy_segment_t *segs)
-{
-    return -ENOSYS;
-}
-#endif
-
 #endif /* QEMU_HW_XEN_COMMON_H */
diff --git a/softmmu/globals.c b/softmmu/globals.c
index eb62739be1..23bb27f0f6 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -66,3 +66,4 @@ uint32_t xen_domid;
 enum xen_mode xen_mode = XEN_DISABLED;
 bool xen_domid_restrict;
 struct evtchn_backend_ops *xen_evtchn_ops;
+struct gnttab_backend_ops *xen_gnttab_ops;
-- 
2.39.0


