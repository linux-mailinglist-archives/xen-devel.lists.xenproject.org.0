Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B139C6AF013
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 19:28:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507783.781836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZc24-00049L-0D; Tue, 07 Mar 2023 18:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507783.781836; Tue, 07 Mar 2023 18:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZc23-0003vo-HD; Tue, 07 Mar 2023 18:27:27 +0000
Received: by outflank-mailman (input) for mailman id 507783;
 Tue, 07 Mar 2023 18:27:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tG96=67=desiato.srs.infradead.org=BATV+98a25f4d4d04c9e21499+7135+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pZc20-0002MP-6g
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 18:27:24 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1235e2d-bd15-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 19:27:18 +0100 (CET)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pZc1n-00H8TA-1j; Tue, 07 Mar 2023 18:27:11 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pZc1n-009e8s-1M; Tue, 07 Mar 2023 18:27:11 +0000
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
X-Inumbo-ID: b1235e2d-bd15-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=ZXh5QHgukOZTgV/qoyS0v8jG6O20d8mSR6buWcgbDbg=; b=C4R3gXq5/hWKZSqBRnsr++XS30
	NuwraW7T/CzsaAkSzZyXnb7yDJ8fLacKfBTq34OF/YP6bsCeFUymDkgtbk+jted1MMmXfwxNu5ygS
	fD2AEkiK9uuV2qv878sUzDS1emVR+vLKt4R90B+2S8kCd/dbR2vRRct/vb2EEQDZ/21g6ZKu6005K
	0/ZxJVh9iVfDfnmH775maFJwrkiJH+7/jdiomJvo/XGhkM+0nnR+MzomfZxJLuHRNoMvsUuwrxrcH
	tdAGIaLLBvs2zeCn1wtLY3Dx6ZWVO+/nkzppa2W3jDQqF9LuqxZrSFw/NqsgjNkDEn67u0oWt0GMT
	11wIg+tA==;
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
Subject: [PULL 11/27] hw/xen: Pass grant ref to gnttab unmap operation
Date: Tue,  7 Mar 2023 18:26:51 +0000
Message-Id: <20230307182707.2298618-12-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307182707.2298618-1-dwmw2@infradead.org>
References: <20230307182707.2298618-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

The previous commit introduced redirectable gnttab operations fairly
much like-for-like, with the exception of the extra arguments to the
->open() call which were always NULL/0 anyway.

This *changes* the arguments to the ->unmap() operation to include the
original ref# that was mapped. Under real Xen it isn't necessary; all we
need to do from QEMU is munmap(), then the kernel will release the grant,
and Xen does the tracking/refcounting for the guest.

When we have emulated grant tables though, we need to do all that for
ourselves. So let's have the back ends keep track of what they mapped
and pass it in to the ->unmap() method for us.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/9pfs/xen-9p-backend.c            |  7 ++++---
 hw/block/dataplane/xen-block.c      |  1 +
 hw/char/xen_console.c               |  2 +-
 hw/net/xen_nic.c                    | 13 ++++++++-----
 hw/usb/xen-usb.c                    | 21 ++++++++++++++++-----
 hw/xen/xen-bus.c                    |  4 ++--
 hw/xen/xen-legacy-backend.c         |  4 ++--
 hw/xen/xen-operations.c             |  9 ++++++++-
 include/hw/xen/xen-bus.h            |  2 +-
 include/hw/xen/xen-legacy-backend.h |  6 +++---
 include/hw/xen/xen_backend_ops.h    |  7 ++++---
 11 files changed, 50 insertions(+), 26 deletions(-)

diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
index 864bdaf952..d8bb0e847c 100644
--- a/hw/9pfs/xen-9p-backend.c
+++ b/hw/9pfs/xen-9p-backend.c
@@ -359,12 +359,13 @@ static int xen_9pfs_free(struct XenLegacyDevice *xendev)
         if (xen_9pdev->rings[i].data != NULL) {
             xen_be_unmap_grant_refs(&xen_9pdev->xendev,
                                     xen_9pdev->rings[i].data,
+                                    xen_9pdev->rings[i].intf->ref,
                                     (1 << xen_9pdev->rings[i].ring_order));
         }
         if (xen_9pdev->rings[i].intf != NULL) {
-            xen_be_unmap_grant_refs(&xen_9pdev->xendev,
-                                    xen_9pdev->rings[i].intf,
-                                    1);
+            xen_be_unmap_grant_ref(&xen_9pdev->xendev,
+                                   xen_9pdev->rings[i].intf,
+                                   xen_9pdev->rings[i].ref);
         }
         if (xen_9pdev->rings[i].bh != NULL) {
             qemu_bh_delete(xen_9pdev->rings[i].bh);
diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
index 2785b9e849..e55b713002 100644
--- a/hw/block/dataplane/xen-block.c
+++ b/hw/block/dataplane/xen-block.c
@@ -705,6 +705,7 @@ void xen_block_dataplane_stop(XenBlockDataPlane *dataplane)
         Error *local_err = NULL;
 
         xen_device_unmap_grant_refs(xendev, dataplane->sring,
+                                    dataplane->ring_ref,
                                     dataplane->nr_ring_ref, &local_err);
         dataplane->sring = NULL;
 
diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index 63153dfde4..19ad6c946a 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -271,7 +271,7 @@ static void con_disconnect(struct XenLegacyDevice *xendev)
         if (!xendev->dev) {
             xenforeignmemory_unmap(xen_fmem, con->sring, 1);
         } else {
-            xen_be_unmap_grant_ref(xendev, con->sring);
+            xen_be_unmap_grant_ref(xendev, con->sring, con->ring_ref);
         }
         con->sring = NULL;
     }
diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
index 7d92c2d022..166d03787d 100644
--- a/hw/net/xen_nic.c
+++ b/hw/net/xen_nic.c
@@ -181,7 +181,7 @@ static void net_tx_packets(struct XenNetDev *netdev)
                 qemu_send_packet(qemu_get_queue(netdev->nic),
                                  page + txreq.offset, txreq.size);
             }
-            xen_be_unmap_grant_ref(&netdev->xendev, page);
+            xen_be_unmap_grant_ref(&netdev->xendev, page, txreq.gref);
             net_tx_response(netdev, &txreq, NETIF_RSP_OKAY);
         }
         if (!netdev->tx_work) {
@@ -261,7 +261,7 @@ static ssize_t net_rx_packet(NetClientState *nc, const uint8_t *buf, size_t size
         return -1;
     }
     memcpy(page + NET_IP_ALIGN, buf, size);
-    xen_be_unmap_grant_ref(&netdev->xendev, page);
+    xen_be_unmap_grant_ref(&netdev->xendev, page, rxreq.gref);
     net_rx_response(netdev, &rxreq, NETIF_RSP_OKAY, NET_IP_ALIGN, size, 0);
 
     return size;
@@ -343,7 +343,8 @@ static int net_connect(struct XenLegacyDevice *xendev)
                                        netdev->rx_ring_ref,
                                        PROT_READ | PROT_WRITE);
     if (!netdev->rxs) {
-        xen_be_unmap_grant_ref(&netdev->xendev, netdev->txs);
+        xen_be_unmap_grant_ref(&netdev->xendev, netdev->txs,
+                               netdev->tx_ring_ref);
         netdev->txs = NULL;
         return -1;
     }
@@ -368,11 +369,13 @@ static void net_disconnect(struct XenLegacyDevice *xendev)
     xen_pv_unbind_evtchn(&netdev->xendev);
 
     if (netdev->txs) {
-        xen_be_unmap_grant_ref(&netdev->xendev, netdev->txs);
+        xen_be_unmap_grant_ref(&netdev->xendev, netdev->txs,
+                               netdev->tx_ring_ref);
         netdev->txs = NULL;
     }
     if (netdev->rxs) {
-        xen_be_unmap_grant_ref(&netdev->xendev, netdev->rxs);
+        xen_be_unmap_grant_ref(&netdev->xendev, netdev->rxs,
+                               netdev->rx_ring_ref);
         netdev->rxs = NULL;
     }
 }
diff --git a/hw/usb/xen-usb.c b/hw/usb/xen-usb.c
index 0f7369e7ed..a770a64cb4 100644
--- a/hw/usb/xen-usb.c
+++ b/hw/usb/xen-usb.c
@@ -101,6 +101,8 @@ struct usbback_hotplug {
 struct usbback_info {
     struct XenLegacyDevice         xendev;  /* must be first */
     USBBus                   bus;
+    uint32_t                 urb_ring_ref;
+    uint32_t                 conn_ring_ref;
     void                     *urb_sring;
     void                     *conn_sring;
     struct usbif_urb_back_ring urb_ring;
@@ -277,10 +279,11 @@ static int usbback_init_packet(struct usbback_req *usbback_req)
 static void usbback_do_response(struct usbback_req *usbback_req, int32_t status,
                                 int32_t actual_length, int32_t error_count)
 {
+    uint32_t ref[USBIF_MAX_SEGMENTS_PER_REQUEST];
     struct usbback_info *usbif;
     struct usbif_urb_response *res;
     struct XenLegacyDevice *xendev;
-    unsigned int notify;
+    unsigned int notify, i;
 
     usbif = usbback_req->usbif;
     xendev = &usbif->xendev;
@@ -293,13 +296,19 @@ static void usbback_do_response(struct usbback_req *usbback_req, int32_t status,
     }
 
     if (usbback_req->buffer) {
-        xen_be_unmap_grant_refs(xendev, usbback_req->buffer,
+        for (i = 0; i < usbback_req->nr_buffer_segs; i++) {
+            ref[i] = usbback_req->req.seg[i].gref;
+        }
+        xen_be_unmap_grant_refs(xendev, usbback_req->buffer, ref,
                                 usbback_req->nr_buffer_segs);
         usbback_req->buffer = NULL;
     }
 
     if (usbback_req->isoc_buffer) {
-        xen_be_unmap_grant_refs(xendev, usbback_req->isoc_buffer,
+        for (i = 0; i < usbback_req->nr_extra_segs; i++) {
+            ref[i] = usbback_req->req.seg[i + usbback_req->req.nr_buffer_segs].gref;
+        }
+        xen_be_unmap_grant_refs(xendev, usbback_req->isoc_buffer, ref,
                                 usbback_req->nr_extra_segs);
         usbback_req->isoc_buffer = NULL;
     }
@@ -832,11 +841,11 @@ static void usbback_disconnect(struct XenLegacyDevice *xendev)
     xen_pv_unbind_evtchn(xendev);
 
     if (usbif->urb_sring) {
-        xen_be_unmap_grant_ref(xendev, usbif->urb_sring);
+        xen_be_unmap_grant_ref(xendev, usbif->urb_sring, usbif->urb_ring_ref);
         usbif->urb_sring = NULL;
     }
     if (usbif->conn_sring) {
-        xen_be_unmap_grant_ref(xendev, usbif->conn_sring);
+        xen_be_unmap_grant_ref(xendev, usbif->conn_sring, usbif->conn_ring_ref);
         usbif->conn_sring = NULL;
     }
 
@@ -889,6 +898,8 @@ static int usbback_connect(struct XenLegacyDevice *xendev)
         return -1;
     }
 
+    usbif->urb_ring_ref = urb_ring_ref;
+    usbif->conn_ring_ref = conn_ring_ref;
     urb_sring = usbif->urb_sring;
     conn_sring = usbif->conn_sring;
     BACK_RING_INIT(&usbif->urb_ring, urb_sring, XC_PAGE_SIZE);
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index b247e86f28..aee6a8c9b0 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -967,10 +967,10 @@ void *xen_device_map_grant_refs(XenDevice *xendev, uint32_t *refs,
     return map;
 }
 
-void xen_device_unmap_grant_refs(XenDevice *xendev, void *map,
+void xen_device_unmap_grant_refs(XenDevice *xendev, void *map, uint32_t *refs,
                                  unsigned int nr_refs, Error **errp)
 {
-    if (qemu_xen_gnttab_unmap(xendev->xgth, map, nr_refs)) {
+    if (qemu_xen_gnttab_unmap(xendev->xgth, map, refs, nr_refs)) {
         error_setg_errno(errp, errno, "xengnttab_unmap failed");
     }
 }
diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 1e9a28f263..a48a25aeb5 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -137,11 +137,11 @@ void *xen_be_map_grant_refs(struct XenLegacyDevice *xendev, uint32_t *refs,
 }
 
 void xen_be_unmap_grant_refs(struct XenLegacyDevice *xendev, void *ptr,
-                             unsigned int nr_refs)
+                             uint32_t *refs, unsigned int nr_refs)
 {
     assert(xendev->ops->flags & DEVOPS_FLAG_NEED_GNTDEV);
 
-    if (qemu_xen_gnttab_unmap(xendev->gnttabdev, ptr, nr_refs)) {
+    if (qemu_xen_gnttab_unmap(xendev->gnttabdev, ptr, refs, nr_refs)) {
         xen_pv_printf(xendev, 0, "xengnttab_unmap failed: %s\n",
                       strerror(errno));
     }
diff --git a/hw/xen/xen-operations.c b/hw/xen/xen-operations.c
index 2e74a28965..c5956d28c6 100644
--- a/hw/xen/xen-operations.c
+++ b/hw/xen/xen-operations.c
@@ -200,6 +200,13 @@ static xengnttab_handle *libxengnttab_backend_open(void)
     return xengnttab_open(NULL, 0);
 }
 
+static int libxengnttab_backend_unmap(xengnttab_handle *xgt,
+                                      void *start_address, uint32_t *refs,
+                                      uint32_t count)
+{
+    return xengnttab_unmap(xgt, start_address, count);
+}
+
 
 static struct gnttab_backend_ops libxengnttab_backend_ops = {
     .features = XEN_GNTTAB_OP_FEATURE_MAP_MULTIPLE,
@@ -208,7 +215,7 @@ static struct gnttab_backend_ops libxengnttab_backend_ops = {
     .grant_copy = libxengnttab_fallback_grant_copy,
     .set_max_grants = xengnttab_set_max_grants,
     .map_refs = xengnttab_map_domain_grant_refs,
-    .unmap = xengnttab_unmap,
+    .unmap = libxengnttab_backend_unmap,
 };
 
 void setup_xen_backend_ops(void)
diff --git a/include/hw/xen/xen-bus.h b/include/hw/xen/xen-bus.h
index 72d71d1eb7..5a90e79d53 100644
--- a/include/hw/xen/xen-bus.h
+++ b/include/hw/xen/xen-bus.h
@@ -102,7 +102,7 @@ void xen_device_set_max_grant_refs(XenDevice *xendev, unsigned int nr_refs,
 void *xen_device_map_grant_refs(XenDevice *xendev, uint32_t *refs,
                                 unsigned int nr_refs, int prot,
                                 Error **errp);
-void xen_device_unmap_grant_refs(XenDevice *xendev, void *map,
+void xen_device_unmap_grant_refs(XenDevice *xendev, void *map, uint32_t *refs,
                                  unsigned int nr_refs, Error **errp);
 
 typedef struct XenDeviceGrantCopySegment {
diff --git a/include/hw/xen/xen-legacy-backend.h b/include/hw/xen/xen-legacy-backend.h
index eaf79cd221..ab28583267 100644
--- a/include/hw/xen/xen-legacy-backend.h
+++ b/include/hw/xen/xen-legacy-backend.h
@@ -52,7 +52,7 @@ void xen_be_set_max_grant_refs(struct XenLegacyDevice *xendev,
 void *xen_be_map_grant_refs(struct XenLegacyDevice *xendev, uint32_t *refs,
                             unsigned int nr_refs, int prot);
 void xen_be_unmap_grant_refs(struct XenLegacyDevice *xendev, void *ptr,
-                             unsigned int nr_refs);
+                             uint32_t *refs, unsigned int nr_refs);
 
 int xen_be_copy_grant_refs(struct XenLegacyDevice *xendev,
                            bool to_domain, XenGrantCopySegment segs[],
@@ -65,9 +65,9 @@ static inline void *xen_be_map_grant_ref(struct XenLegacyDevice *xendev,
 }
 
 static inline void xen_be_unmap_grant_ref(struct XenLegacyDevice *xendev,
-                                          void *ptr)
+                                          void *ptr, uint32_t ref)
 {
-    return xen_be_unmap_grant_refs(xendev, ptr, 1);
+    return xen_be_unmap_grant_refs(xendev, ptr, &ref, 1);
 }
 
 /* actual backend drivers */
diff --git a/include/hw/xen/xen_backend_ops.h b/include/hw/xen/xen_backend_ops.h
index bb3333ab00..6f9d8e2c62 100644
--- a/include/hw/xen/xen_backend_ops.h
+++ b/include/hw/xen/xen_backend_ops.h
@@ -144,7 +144,8 @@ struct gnttab_backend_ops {
     int (*set_max_grants)(xengnttab_handle *xgt, uint32_t nr_grants);
     void *(*map_refs)(xengnttab_handle *xgt, uint32_t count, uint32_t domid,
                       uint32_t *refs, int prot);
-    int (*unmap)(xengnttab_handle *xgt, void *start_address, uint32_t count);
+    int (*unmap)(xengnttab_handle *xgt, void *start_address, uint32_t *refs,
+                 uint32_t count);
 };
 
 extern struct gnttab_backend_ops *xen_gnttab_ops;
@@ -204,13 +205,13 @@ static inline void *qemu_xen_gnttab_map_refs(xengnttab_handle *xgt,
 }
 
 static inline int qemu_xen_gnttab_unmap(xengnttab_handle *xgt,
-                                        void *start_address,
+                                        void *start_address, uint32_t *refs,
                                         uint32_t count)
 {
     if (!xen_gnttab_ops) {
         return -ENOSYS;
     }
-    return xen_gnttab_ops->unmap(xgt, start_address, count);
+    return xen_gnttab_ops->unmap(xgt, start_address, refs, count);
 }
 
 void setup_xen_backend_ops(void);
-- 
2.39.0


