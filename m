Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C646A8534
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 16:35:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505053.777622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkxN-0002GQ-85; Thu, 02 Mar 2023 15:34:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505053.777622; Thu, 02 Mar 2023 15:34:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkxM-00028x-So; Thu, 02 Mar 2023 15:34:56 +0000
Received: by outflank-mailman (input) for mailman id 505053;
 Thu, 02 Mar 2023 15:34:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ucY8=62=casper.srs.infradead.org=BATV+a1ad97f05afd282148df+7130+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pXkxK-0001Jw-MQ
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 15:34:54 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c20b2aa4-b90f-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 16:34:49 +0100 (CET)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pXkx4-002UNM-I1; Thu, 02 Mar 2023 15:34:39 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pXkx4-004uzF-1p; Thu, 02 Mar 2023 15:34:38 +0000
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
X-Inumbo-ID: c20b2aa4-b90f-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=NsStsbU/wrYzcT7pqD6BfZJ/9CY8QxWSUO7MAruBqXQ=; b=SVOthX9RI/7oAIXMFIA0zNaRPr
	UvaAcMmuLtQcin9lHMzeMeGPWpqcB4ypj6KWx9bdn7eBtBYK4+Ex0tvX2vrd0zuDQUMkU69LQ2SAV
	dzUYdCMQSjsmZr7cpMg2trM6ZMw8nGG0M9zI0UXhyHkfrmAbOQQbxIQ+feJnk3V5SRmDKR6uAF+6D
	y5/roN1G3IYdY3REGr1BIUfu72Vb3r6TfppOKKFMRufu8I9494Vjj/ETN5DAGTdaSti7Vkk0WbWN/
	/XnSMg1dvMMuMX5Mh7mUO/B0eyMuHP/OEBSYDH33O6gVMVKSXsqlAFCZ5bpUUPZ2fo3/ly2um1W2k
	lVkCg1Bw==;
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
Subject: [RFC PATCH v1 15/25] hw/xen: Use XEN_PAGE_SIZE in PV backend drivers
Date: Thu,  2 Mar 2023 15:34:25 +0000
Message-Id: <20230302153435.1170111-16-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230302153435.1170111-1-dwmw2@infradead.org>
References: <20230302153435.1170111-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

XC_PAGE_SIZE comes from the actual Xen libraries, while XEN_PAGE_SIZE is
provided by QEMU itself in xen_backend_ops.h. For backends which may be
built for emulation mode, use the latter.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/block/dataplane/xen-block.c |  8 ++++----
 hw/display/xenfb.c             | 12 ++++++------
 hw/net/xen_nic.c               | 12 ++++++------
 hw/usb/xen-usb.c               |  8 ++++----
 4 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
index e55b713002..8322a1de82 100644
--- a/hw/block/dataplane/xen-block.c
+++ b/hw/block/dataplane/xen-block.c
@@ -101,9 +101,9 @@ static XenBlockRequest *xen_block_start_request(XenBlockDataPlane *dataplane)
          * re-use requests, allocate the memory once here. It will be freed
          * xen_block_dataplane_destroy() when the request list is freed.
          */
-        request->buf = qemu_memalign(XC_PAGE_SIZE,
+        request->buf = qemu_memalign(XEN_PAGE_SIZE,
                                      BLKIF_MAX_SEGMENTS_PER_REQUEST *
-                                     XC_PAGE_SIZE);
+                                     XEN_PAGE_SIZE);
         dataplane->requests_total++;
         qemu_iovec_init(&request->v, 1);
     } else {
@@ -185,7 +185,7 @@ static int xen_block_parse_request(XenBlockRequest *request)
             goto err;
         }
         if (request->req.seg[i].last_sect * dataplane->sector_size >=
-            XC_PAGE_SIZE) {
+            XEN_PAGE_SIZE) {
             error_report("error: page crossing");
             goto err;
         }
@@ -740,7 +740,7 @@ void xen_block_dataplane_start(XenBlockDataPlane *dataplane,
 
     dataplane->protocol = protocol;
 
-    ring_size = XC_PAGE_SIZE * dataplane->nr_ring_ref;
+    ring_size = XEN_PAGE_SIZE * dataplane->nr_ring_ref;
     switch (dataplane->protocol) {
     case BLKIF_PROTOCOL_NATIVE:
     {
diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
index 2c4016fcbd..0074a9b6f8 100644
--- a/hw/display/xenfb.c
+++ b/hw/display/xenfb.c
@@ -489,13 +489,13 @@ static int xenfb_map_fb(struct XenFB *xenfb)
     }
 
     if (xenfb->pixels) {
-        munmap(xenfb->pixels, xenfb->fbpages * XC_PAGE_SIZE);
+        munmap(xenfb->pixels, xenfb->fbpages * XEN_PAGE_SIZE);
         xenfb->pixels = NULL;
     }
 
-    xenfb->fbpages = DIV_ROUND_UP(xenfb->fb_len, XC_PAGE_SIZE);
+    xenfb->fbpages = DIV_ROUND_UP(xenfb->fb_len, XEN_PAGE_SIZE);
     n_fbdirs = xenfb->fbpages * mode / 8;
-    n_fbdirs = DIV_ROUND_UP(n_fbdirs, XC_PAGE_SIZE);
+    n_fbdirs = DIV_ROUND_UP(n_fbdirs, XEN_PAGE_SIZE);
 
     pgmfns = g_new0(xen_pfn_t, n_fbdirs);
     fbmfns = g_new0(xen_pfn_t, xenfb->fbpages);
@@ -528,8 +528,8 @@ static int xenfb_configure_fb(struct XenFB *xenfb, size_t fb_len_lim,
 {
     size_t mfn_sz = sizeof_field(struct xenfb_page, pd[0]);
     size_t pd_len = sizeof_field(struct xenfb_page, pd) / mfn_sz;
-    size_t fb_pages = pd_len * XC_PAGE_SIZE / mfn_sz;
-    size_t fb_len_max = fb_pages * XC_PAGE_SIZE;
+    size_t fb_pages = pd_len * XEN_PAGE_SIZE / mfn_sz;
+    size_t fb_len_max = fb_pages * XEN_PAGE_SIZE;
     int max_width, max_height;
 
     if (fb_len_lim > fb_len_max) {
@@ -930,7 +930,7 @@ static void fb_disconnect(struct XenLegacyDevice *xendev)
      *   instead.  This releases the guest pages and keeps qemu happy.
      */
     qemu_xen_foreignmem_unmap(fb->pixels, fb->fbpages);
-    fb->pixels = mmap(fb->pixels, fb->fbpages * XC_PAGE_SIZE,
+    fb->pixels = mmap(fb->pixels, fb->fbpages * XEN_PAGE_SIZE,
                       PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANON,
                       -1, 0);
     if (fb->pixels == MAP_FAILED) {
diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
index 166d03787d..9bbf6599fc 100644
--- a/hw/net/xen_nic.c
+++ b/hw/net/xen_nic.c
@@ -145,7 +145,7 @@ static void net_tx_packets(struct XenNetDev *netdev)
                 continue;
             }
 
-            if ((txreq.offset + txreq.size) > XC_PAGE_SIZE) {
+            if ((txreq.offset + txreq.size) > XEN_PAGE_SIZE) {
                 xen_pv_printf(&netdev->xendev, 0, "error: page crossing\n");
                 net_tx_error(netdev, &txreq, rc);
                 continue;
@@ -171,7 +171,7 @@ static void net_tx_packets(struct XenNetDev *netdev)
             if (txreq.flags & NETTXF_csum_blank) {
                 /* have read-only mapping -> can't fill checksum in-place */
                 if (!tmpbuf) {
-                    tmpbuf = g_malloc(XC_PAGE_SIZE);
+                    tmpbuf = g_malloc(XEN_PAGE_SIZE);
                 }
                 memcpy(tmpbuf, page + txreq.offset, txreq.size);
                 net_checksum_calculate(tmpbuf, txreq.size, CSUM_ALL);
@@ -243,9 +243,9 @@ static ssize_t net_rx_packet(NetClientState *nc, const uint8_t *buf, size_t size
     if (rc == rp || RING_REQUEST_CONS_OVERFLOW(&netdev->rx_ring, rc)) {
         return 0;
     }
-    if (size > XC_PAGE_SIZE - NET_IP_ALIGN) {
+    if (size > XEN_PAGE_SIZE - NET_IP_ALIGN) {
         xen_pv_printf(&netdev->xendev, 0, "packet too big (%lu > %ld)",
-                      (unsigned long)size, XC_PAGE_SIZE - NET_IP_ALIGN);
+                      (unsigned long)size, XEN_PAGE_SIZE - NET_IP_ALIGN);
         return -1;
     }
 
@@ -348,8 +348,8 @@ static int net_connect(struct XenLegacyDevice *xendev)
         netdev->txs = NULL;
         return -1;
     }
-    BACK_RING_INIT(&netdev->tx_ring, netdev->txs, XC_PAGE_SIZE);
-    BACK_RING_INIT(&netdev->rx_ring, netdev->rxs, XC_PAGE_SIZE);
+    BACK_RING_INIT(&netdev->tx_ring, netdev->txs, XEN_PAGE_SIZE);
+    BACK_RING_INIT(&netdev->rx_ring, netdev->rxs, XEN_PAGE_SIZE);
 
     xen_be_bind_evtchn(&netdev->xendev);
 
diff --git a/hw/usb/xen-usb.c b/hw/usb/xen-usb.c
index a770a64cb4..66cb3f7c24 100644
--- a/hw/usb/xen-usb.c
+++ b/hw/usb/xen-usb.c
@@ -161,7 +161,7 @@ static int usbback_gnttab_map(struct usbback_req *usbback_req)
 
     for (i = 0; i < nr_segs; i++) {
         if ((unsigned)usbback_req->req.seg[i].offset +
-            (unsigned)usbback_req->req.seg[i].length > XC_PAGE_SIZE) {
+            (unsigned)usbback_req->req.seg[i].length > XEN_PAGE_SIZE) {
             xen_pv_printf(xendev, 0, "segment crosses page boundary\n");
             return -EINVAL;
         }
@@ -185,7 +185,7 @@ static int usbback_gnttab_map(struct usbback_req *usbback_req)
 
         for (i = 0; i < usbback_req->nr_buffer_segs; i++) {
             seg = usbback_req->req.seg + i;
-            addr = usbback_req->buffer + i * XC_PAGE_SIZE + seg->offset;
+            addr = usbback_req->buffer + i * XEN_PAGE_SIZE + seg->offset;
             qemu_iovec_add(&usbback_req->packet.iov, addr, seg->length);
         }
     }
@@ -902,8 +902,8 @@ static int usbback_connect(struct XenLegacyDevice *xendev)
     usbif->conn_ring_ref = conn_ring_ref;
     urb_sring = usbif->urb_sring;
     conn_sring = usbif->conn_sring;
-    BACK_RING_INIT(&usbif->urb_ring, urb_sring, XC_PAGE_SIZE);
-    BACK_RING_INIT(&usbif->conn_ring, conn_sring, XC_PAGE_SIZE);
+    BACK_RING_INIT(&usbif->urb_ring, urb_sring, XEN_PAGE_SIZE);
+    BACK_RING_INIT(&usbif->conn_ring, conn_sring, XEN_PAGE_SIZE);
 
     xen_be_bind_evtchn(xendev);
 
-- 
2.39.0


