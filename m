Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0796A8542
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 16:35:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505052.777609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkxM-000231-Dg; Thu, 02 Mar 2023 15:34:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505052.777609; Thu, 02 Mar 2023 15:34:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkxM-0001pG-7B; Thu, 02 Mar 2023 15:34:56 +0000
Received: by outflank-mailman (input) for mailman id 505052;
 Thu, 02 Mar 2023 15:34:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZMsQ=62=desiato.srs.infradead.org=BATV+9a0490e5ac528e462c30+7130+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pXkxK-0001Jv-5T
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 15:34:54 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2cd18b0-b90f-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 16:34:49 +0100 (CET)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pXkx4-00FL3i-1h; Thu, 02 Mar 2023 15:34:39 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pXkx4-004uz3-1J; Thu, 02 Mar 2023 15:34:38 +0000
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
X-Inumbo-ID: c2cd18b0-b90f-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=5roE0YB+d8rwQAkUuNGzRtMIdxxHP+hz32oiYI6yf7w=; b=ZMiL3mxSXiO+MHU/FiBVWoME3R
	Ko8a+F95bX2y7tnmyGdEXww1EHQVtXKhZhpvb53UzDhaNdyAizxp6zbLhC/cr4n+P61sgFp0AdPaj
	D6wZ7McMkUylocJagzgdfPt1R9h/nElYoVS1F0u/ecX/c670vQGs7wE25vMaa1lRHilGn7juoT7al
	YK6prpJLu6NRRZMv9TA4DJDt8kzN+Qs2L/Mn90lvZtfxjLTmU2uUtnst/V/xbcF21ooQAXcUjEtLp
	9K9WdnAR+WDmKcQFNQ6Nz4l2yptOdA5bSIQhIjtk0HZBTCEpPNniyRWjtyd/dsNmg0oQib7SFidI7
	be11QR6Q==;
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
Subject: [RFC PATCH v1 12/25] hw/xen: Add foreignmem operations to allow redirection to internal emulation
Date: Thu,  2 Mar 2023 15:34:22 +0000
Message-Id: <20230302153435.1170111-13-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230302153435.1170111-1-dwmw2@infradead.org>
References: <20230302153435.1170111-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
 hw/char/xen_console.c            |  8 +++---
 hw/display/xenfb.c               | 20 +++++++-------
 hw/xen/xen-operations.c          | 45 ++++++++++++++++++++++++++++++++
 include/hw/xen/xen_backend_ops.h | 26 ++++++++++++++++++
 include/hw/xen/xen_common.h      | 13 ---------
 softmmu/globals.c                |  1 +
 tests/unit/test-xs-node.c        |  1 +
 7 files changed, 88 insertions(+), 26 deletions(-)

diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index 19ad6c946a..e9cef3e1ef 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -237,9 +237,9 @@ static int con_initialise(struct XenLegacyDevice *xendev)
 
     if (!xendev->dev) {
         xen_pfn_t mfn = con->ring_ref;
-        con->sring = xenforeignmemory_map(xen_fmem, con->xendev.dom,
-                                          PROT_READ | PROT_WRITE,
-                                          1, &mfn, NULL);
+        con->sring = qemu_xen_foreignmem_map(con->xendev.dom, NULL,
+                                             PROT_READ | PROT_WRITE,
+                                             1, &mfn, NULL);
     } else {
         con->sring = xen_be_map_grant_ref(xendev, con->ring_ref,
                                           PROT_READ | PROT_WRITE);
@@ -269,7 +269,7 @@ static void con_disconnect(struct XenLegacyDevice *xendev)
 
     if (con->sring) {
         if (!xendev->dev) {
-            xenforeignmemory_unmap(xen_fmem, con->sring, 1);
+            qemu_xen_foreignmem_unmap(con->sring, 1);
         } else {
             xen_be_unmap_grant_ref(xendev, con->sring, con->ring_ref);
         }
diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
index 260eb38a76..2c4016fcbd 100644
--- a/hw/display/xenfb.c
+++ b/hw/display/xenfb.c
@@ -98,8 +98,9 @@ static int common_bind(struct common *c)
     if (xenstore_read_fe_int(&c->xendev, "event-channel", &c->xendev.remote_port) == -1)
         return -1;
 
-    c->page = xenforeignmemory_map(xen_fmem, c->xendev.dom,
-                                   PROT_READ | PROT_WRITE, 1, &mfn, NULL);
+    c->page = qemu_xen_foreignmem_map(c->xendev.dom, NULL,
+                                      PROT_READ | PROT_WRITE, 1, &mfn,
+                                      NULL);
     if (c->page == NULL)
         return -1;
 
@@ -115,7 +116,7 @@ static void common_unbind(struct common *c)
 {
     xen_pv_unbind_evtchn(&c->xendev);
     if (c->page) {
-        xenforeignmemory_unmap(xen_fmem, c->page, 1);
+        qemu_xen_foreignmem_unmap(c->page, 1);
         c->page = NULL;
     }
 }
@@ -500,15 +501,16 @@ static int xenfb_map_fb(struct XenFB *xenfb)
     fbmfns = g_new0(xen_pfn_t, xenfb->fbpages);
 
     xenfb_copy_mfns(mode, n_fbdirs, pgmfns, pd);
-    map = xenforeignmemory_map(xen_fmem, xenfb->c.xendev.dom,
-                               PROT_READ, n_fbdirs, pgmfns, NULL);
+    map = qemu_xen_foreignmem_map(xenfb->c.xendev.dom, NULL, PROT_READ,
+                                  n_fbdirs, pgmfns, NULL);
     if (map == NULL)
         goto out;
     xenfb_copy_mfns(mode, xenfb->fbpages, fbmfns, map);
-    xenforeignmemory_unmap(xen_fmem, map, n_fbdirs);
+    qemu_xen_foreignmem_unmap(map, n_fbdirs);
 
-    xenfb->pixels = xenforeignmemory_map(xen_fmem, xenfb->c.xendev.dom,
-            PROT_READ, xenfb->fbpages, fbmfns, NULL);
+    xenfb->pixels = qemu_xen_foreignmem_map(xenfb->c.xendev.dom, NULL,
+                                            PROT_READ, xenfb->fbpages,
+                                            fbmfns, NULL);
     if (xenfb->pixels == NULL)
         goto out;
 
@@ -927,7 +929,7 @@ static void fb_disconnect(struct XenLegacyDevice *xendev)
      *   Replacing the framebuffer with anonymous shared memory
      *   instead.  This releases the guest pages and keeps qemu happy.
      */
-    xenforeignmemory_unmap(xen_fmem, fb->pixels, fb->fbpages);
+    qemu_xen_foreignmem_unmap(fb->pixels, fb->fbpages);
     fb->pixels = mmap(fb->pixels, fb->fbpages * XC_PAGE_SIZE,
                       PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANON,
                       -1, 0);
diff --git a/hw/xen/xen-operations.c b/hw/xen/xen-operations.c
index 73dabac8e5..61e56a7abe 100644
--- a/hw/xen/xen-operations.c
+++ b/hw/xen/xen-operations.c
@@ -22,6 +22,7 @@
  */
 #undef XC_WANT_COMPAT_EVTCHN_API
 #undef XC_WANT_COMPAT_GNTTAB_API
+#undef XC_WANT_COMPAT_MAP_FOREIGN_API
 
 #include <xenctrl.h>
 
@@ -56,10 +57,13 @@ typedef xc_gnttab xengnttab_handle;
 #define xengnttab_map_domain_grant_refs(h, c, d, r, p) \
     xc_gnttab_map_domain_grant_refs(h, c, d, r, p)
 
+typedef xc_interface xenforeignmemory_handle;
+
 #else /* CONFIG_XEN_CTRL_INTERFACE_VERSION >= 40701 */
 
 #include <xenevtchn.h>
 #include <xengnttab.h>
+#include <xenforeignmemory.h>
 
 #endif
 
@@ -218,6 +222,46 @@ static struct gnttab_backend_ops libxengnttab_backend_ops = {
     .unmap = libxengnttab_backend_unmap,
 };
 
+#if CONFIG_XEN_CTRL_INTERFACE_VERSION < 40701
+
+static void *libxenforeignmem_backend_map(uint32_t dom, void *addr, int prot,
+                                          size_t pages, xfn_pfn_t *pfns,
+                                          int *errs)
+{
+    if (errs) {
+        return xc_map_foreign_bulk(xen_xc, dom, prot, pfns, errs, pages);
+    } else {
+        return xc_map_foreign_pages(xen_xc, dom, prot, pfns, pages);
+    }
+}
+
+static int libxenforeignmem_backend_unmap(void *addr, size_t pages)
+{
+    return munmap(addr, pages * XC_PAGE_SIZE);
+}
+
+#else /* CONFIG_XEN_CTRL_INTERFACE_VERSION >= 40701 */
+
+static void *libxenforeignmem_backend_map(uint32_t dom, void *addr, int prot,
+                                          size_t pages, xen_pfn_t *pfns,
+                                          int *errs)
+{
+    return xenforeignmemory_map2(xen_fmem, dom, addr, prot, 0, pages, pfns,
+                                 errs);
+}
+
+static int libxenforeignmem_backend_unmap(void *addr, size_t pages)
+{
+    return xenforeignmemory_unmap(xen_fmem, addr, pages);
+}
+
+#endif
+
+struct foreignmem_backend_ops libxenforeignmem_backend_ops = {
+    .map = libxenforeignmem_backend_map,
+    .unmap = libxenforeignmem_backend_unmap,
+};
+
 void setup_xen_backend_ops(void)
 {
 #if CONFIG_XEN_CTRL_INTERFACE_VERSION >= 40800
@@ -232,4 +276,5 @@ void setup_xen_backend_ops(void)
 #endif
     xen_evtchn_ops = &libxenevtchn_backend_ops;
     xen_gnttab_ops = &libxengnttab_backend_ops;
+    xen_foreignmem_ops = &libxenforeignmem_backend_ops;
 }
diff --git a/include/hw/xen/xen_backend_ops.h b/include/hw/xen/xen_backend_ops.h
index 6f9d8e2c62..0dff06bbde 100644
--- a/include/hw/xen/xen_backend_ops.h
+++ b/include/hw/xen/xen_backend_ops.h
@@ -214,6 +214,32 @@ static inline int qemu_xen_gnttab_unmap(xengnttab_handle *xgt,
     return xen_gnttab_ops->unmap(xgt, start_address, refs, count);
 }
 
+struct foreignmem_backend_ops {
+    void *(*map)(uint32_t dom, void *addr, int prot, size_t pages,
+                 xen_pfn_t *pfns, int *errs);
+    int (*unmap)(void *addr, size_t pages);
+};
+
+extern struct foreignmem_backend_ops *xen_foreignmem_ops;
+
+static inline void *qemu_xen_foreignmem_map(uint32_t dom, void *addr, int prot,
+                                            size_t pages, xen_pfn_t *pfns,
+                                            int *errs)
+{
+    if (!xen_foreignmem_ops) {
+        return NULL;
+    }
+    return xen_foreignmem_ops->map(dom, addr, prot, pages, pfns, errs);
+}
+
+static inline int qemu_xen_foreignmem_unmap(void *addr, size_t pages)
+{
+    if (!xen_foreignmem_ops) {
+        return -ENOSYS;
+    }
+    return xen_foreignmem_ops->unmap(addr, pages);
+}
+
 void setup_xen_backend_ops(void);
 
 #endif /* QEMU_XEN_BACKEND_OPS_H */
diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
index d4d10d3ff1..632ce617cc 100644
--- a/include/hw/xen/xen_common.h
+++ b/include/hw/xen/xen_common.h
@@ -32,19 +32,6 @@ typedef xc_interface xenforeignmemory_handle;
 #define xenforeignmemory_open(l, f) xen_xc
 #define xenforeignmemory_close(h)
 
-static inline void *xenforeignmemory_map(xc_interface *h, uint32_t dom,
-                                         int prot, size_t pages,
-                                         const xen_pfn_t arr[/*pages*/],
-                                         int err[/*pages*/])
-{
-    if (err)
-        return xc_map_foreign_bulk(h, dom, prot, arr, err, pages);
-    else
-        return xc_map_foreign_pages(h, dom, prot, arr, pages);
-}
-
-#define xenforeignmemory_unmap(h, p, s) munmap(p, s * XC_PAGE_SIZE)
-
 #else /* CONFIG_XEN_CTRL_INTERFACE_VERSION >= 40701 */
 
 #include <xenforeignmemory.h>
diff --git a/softmmu/globals.c b/softmmu/globals.c
index 23bb27f0f6..dda32986f7 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -67,3 +67,4 @@ enum xen_mode xen_mode = XEN_DISABLED;
 bool xen_domid_restrict;
 struct evtchn_backend_ops *xen_evtchn_ops;
 struct gnttab_backend_ops *xen_gnttab_ops;
+struct foreignmem_backend_ops *xen_foreignmem_ops;
diff --git a/tests/unit/test-xs-node.c b/tests/unit/test-xs-node.c
index fda6a047d0..b80d10ff98 100644
--- a/tests/unit/test-xs-node.c
+++ b/tests/unit/test-xs-node.c
@@ -23,6 +23,7 @@ static GList *xs_node_list;
  * doesn't hurt).
  */
 #define __XEN_PUBLIC_XEN_H__
+typedef unsigned long xen_pfn_t;
 
 #include "hw/i386/kvm/xenstore_impl.c"
 
-- 
2.39.0


