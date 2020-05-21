Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 726D51DD74F
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 21:34:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbqvz-0002ZJ-Ez; Thu, 21 May 2020 19:32:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RqGm=7D=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jbqvx-0002ZE-IX
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 19:32:49 +0000
X-Inumbo-ID: da7143a4-9b99-11ea-ae69-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da7143a4-9b99-11ea-ae69-bc764e2007e4;
 Thu, 21 May 2020 19:32:49 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CB978207D3;
 Thu, 21 May 2020 19:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590089568;
 bh=wVdNaS0ZwKTecNDaqDlBLOhKCIthZf+jeeG5uNktzc8=;
 h=From:To:Cc:Subject:Date:From;
 b=NBLDLTkRTKeIfjBmoz7sgk+dNW0U0DUEyoIHVSfRSPNr/V73wzHCQ6PLDfpIjPC00
 NWqxvApQHe0eDRSi55HDN7vJ/etlgvlt2G6xFFl4T/TT9lduHQUV9q+Y2q47g6B44w
 DbbdfkFw0COPKQyEsJhdKUOm6DYqiU6XGxLzsfLs=
From: Stefano Stabellini <sstabellini@kernel.org>
To: jgross@suse.com
Subject: [PATCH v2] 9p/xen: increase XEN_9PFS_RING_ORDER
Date: Thu, 21 May 2020 12:32:42 -0700
Message-Id: <20200521193242.15953-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: lucho@ionkov.net, sstabellini@kernel.org, ericvh@gmail.com,
 asmadeus@codewreck.org, linux-kernel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Increase XEN_9PFS_RING_ORDER to 9 for performance reason. Order 9 is the
max allowed by the protocol.

We can't assume that all backends will support order 9. The xenstore
property max-ring-page-order specifies the max order supported by the
backend. We'll use max-ring-page-order for the size of the ring.

This means that the size of the ring is not static
(XEN_FLEX_RING_SIZE(9)) anymore. Change XEN_9PFS_RING_SIZE to take an
argument and base the calculation on the order chosen at setup time.

Finally, modify p9_xen_trans.maxsize to be divided by 4 compared to the
original value. We need to divide it by 2 because we have two rings
coming off the same order allocation: the in and out rings. This was a
mistake in the original code. Also divide it further by 2 because we
don't want a single request/reply to fill up the entire ring. There can
be multiple requests/replies outstanding at any given time and if we use
the full ring with one, we risk forcing the backend to wait for the
client to read back more replies before continuing, which is not
performant.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v2:
- Fix setting of p9_xen_trans.maxsize in xen_9pfs_front_probe to match
  the initial setting for the reasons explained in the commit message

---
 net/9p/trans_xen.c | 61 ++++++++++++++++++++++++++--------------------
 1 file changed, 34 insertions(+), 27 deletions(-)

diff --git a/net/9p/trans_xen.c b/net/9p/trans_xen.c
index 3963eb11c3fb..3debad93be1a 100644
--- a/net/9p/trans_xen.c
+++ b/net/9p/trans_xen.c
@@ -43,8 +43,8 @@
 #include <net/9p/transport.h>
 
 #define XEN_9PFS_NUM_RINGS 2
-#define XEN_9PFS_RING_ORDER 6
-#define XEN_9PFS_RING_SIZE  XEN_FLEX_RING_SIZE(XEN_9PFS_RING_ORDER)
+#define XEN_9PFS_RING_ORDER 9
+#define XEN_9PFS_RING_SIZE(ring)  XEN_FLEX_RING_SIZE(ring->intf->ring_order)
 
 struct xen_9pfs_header {
 	uint32_t size;
@@ -132,8 +132,8 @@ static bool p9_xen_write_todo(struct xen_9pfs_dataring *ring, RING_IDX size)
 	prod = ring->intf->out_prod;
 	virt_mb();
 
-	return XEN_9PFS_RING_SIZE -
-		xen_9pfs_queued(prod, cons, XEN_9PFS_RING_SIZE) >= size;
+	return XEN_9PFS_RING_SIZE(ring) -
+		xen_9pfs_queued(prod, cons, XEN_9PFS_RING_SIZE(ring)) >= size;
 }
 
 static int p9_xen_request(struct p9_client *client, struct p9_req_t *p9_req)
@@ -167,17 +167,18 @@ static int p9_xen_request(struct p9_client *client, struct p9_req_t *p9_req)
 	prod = ring->intf->out_prod;
 	virt_mb();
 
-	if (XEN_9PFS_RING_SIZE - xen_9pfs_queued(prod, cons,
-						 XEN_9PFS_RING_SIZE) < size) {
+	if (XEN_9PFS_RING_SIZE(ring) -
+	    xen_9pfs_queued(prod, cons, XEN_9PFS_RING_SIZE(ring)) < size) {
 		spin_unlock_irqrestore(&ring->lock, flags);
 		goto again;
 	}
 
-	masked_prod = xen_9pfs_mask(prod, XEN_9PFS_RING_SIZE);
-	masked_cons = xen_9pfs_mask(cons, XEN_9PFS_RING_SIZE);
+	masked_prod = xen_9pfs_mask(prod, XEN_9PFS_RING_SIZE(ring));
+	masked_cons = xen_9pfs_mask(cons, XEN_9PFS_RING_SIZE(ring));
 
 	xen_9pfs_write_packet(ring->data.out, p9_req->tc.sdata, size,
-			      &masked_prod, masked_cons, XEN_9PFS_RING_SIZE);
+			      &masked_prod, masked_cons,
+			      XEN_9PFS_RING_SIZE(ring));
 
 	p9_req->status = REQ_STATUS_SENT;
 	virt_wmb();			/* write ring before updating pointer */
@@ -207,19 +208,19 @@ static void p9_xen_response(struct work_struct *work)
 		prod = ring->intf->in_prod;
 		virt_rmb();
 
-		if (xen_9pfs_queued(prod, cons, XEN_9PFS_RING_SIZE) <
+		if (xen_9pfs_queued(prod, cons, XEN_9PFS_RING_SIZE(ring)) <
 		    sizeof(h)) {
 			notify_remote_via_irq(ring->irq);
 			return;
 		}
 
-		masked_prod = xen_9pfs_mask(prod, XEN_9PFS_RING_SIZE);
-		masked_cons = xen_9pfs_mask(cons, XEN_9PFS_RING_SIZE);
+		masked_prod = xen_9pfs_mask(prod, XEN_9PFS_RING_SIZE(ring));
+		masked_cons = xen_9pfs_mask(cons, XEN_9PFS_RING_SIZE(ring));
 
 		/* First, read just the header */
 		xen_9pfs_read_packet(&h, ring->data.in, sizeof(h),
 				     masked_prod, &masked_cons,
-				     XEN_9PFS_RING_SIZE);
+				     XEN_9PFS_RING_SIZE(ring));
 
 		req = p9_tag_lookup(priv->client, h.tag);
 		if (!req || req->status != REQ_STATUS_SENT) {
@@ -233,11 +234,11 @@ static void p9_xen_response(struct work_struct *work)
 		memcpy(&req->rc, &h, sizeof(h));
 		req->rc.offset = 0;
 
-		masked_cons = xen_9pfs_mask(cons, XEN_9PFS_RING_SIZE);
+		masked_cons = xen_9pfs_mask(cons, XEN_9PFS_RING_SIZE(ring));
 		/* Then, read the whole packet (including the header) */
 		xen_9pfs_read_packet(req->rc.sdata, ring->data.in, h.size,
 				     masked_prod, &masked_cons,
-				     XEN_9PFS_RING_SIZE);
+				     XEN_9PFS_RING_SIZE(ring));
 
 		virt_mb();
 		cons += h.size;
@@ -267,7 +268,7 @@ static irqreturn_t xen_9pfs_front_event_handler(int irq, void *r)
 
 static struct p9_trans_module p9_xen_trans = {
 	.name = "xen",
-	.maxsize = 1 << (XEN_9PFS_RING_ORDER + XEN_PAGE_SHIFT),
+	.maxsize = 1 << (XEN_9PFS_RING_ORDER + XEN_PAGE_SHIFT - 2),
 	.def = 1,
 	.create = p9_xen_create,
 	.close = p9_xen_close,
@@ -295,14 +296,16 @@ static void xen_9pfs_front_free(struct xen_9pfs_front_priv *priv)
 		if (priv->rings[i].irq > 0)
 			unbind_from_irqhandler(priv->rings[i].irq, priv->dev);
 		if (priv->rings[i].data.in) {
-			for (j = 0; j < (1 << XEN_9PFS_RING_ORDER); j++) {
+			for (j = 0;
+			     j < (1 << priv->rings[i].intf->ring_order);
+			     j++) {
 				grant_ref_t ref;
 
 				ref = priv->rings[i].intf->ref[j];
 				gnttab_end_foreign_access(ref, 0, 0);
 			}
 			free_pages((unsigned long)priv->rings[i].data.in,
-				   XEN_9PFS_RING_ORDER -
+				   priv->rings[i].intf->ring_order -
 				   (PAGE_SHIFT - XEN_PAGE_SHIFT));
 		}
 		gnttab_end_foreign_access(priv->rings[i].ref, 0, 0);
@@ -323,7 +326,8 @@ static int xen_9pfs_front_remove(struct xenbus_device *dev)
 }
 
 static int xen_9pfs_front_alloc_dataring(struct xenbus_device *dev,
-					 struct xen_9pfs_dataring *ring)
+					 struct xen_9pfs_dataring *ring,
+					 unsigned int order)
 {
 	int i = 0;
 	int ret = -ENOMEM;
@@ -342,21 +346,21 @@ static int xen_9pfs_front_alloc_dataring(struct xenbus_device *dev,
 		goto out;
 	ring->ref = ret;
 	bytes = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
-			XEN_9PFS_RING_ORDER - (PAGE_SHIFT - XEN_PAGE_SHIFT));
+			order - (PAGE_SHIFT - XEN_PAGE_SHIFT));
 	if (!bytes) {
 		ret = -ENOMEM;
 		goto out;
 	}
-	for (; i < (1 << XEN_9PFS_RING_ORDER); i++) {
+	for (; i < (1 << order); i++) {
 		ret = gnttab_grant_foreign_access(
 				dev->otherend_id, virt_to_gfn(bytes) + i, 0);
 		if (ret < 0)
 			goto out;
 		ring->intf->ref[i] = ret;
 	}
-	ring->intf->ring_order = XEN_9PFS_RING_ORDER;
+	ring->intf->ring_order = order;
 	ring->data.in = bytes;
-	ring->data.out = bytes + XEN_9PFS_RING_SIZE;
+	ring->data.out = bytes + XEN_FLEX_RING_SIZE(order);
 
 	ret = xenbus_alloc_evtchn(dev, &ring->evtchn);
 	if (ret)
@@ -374,7 +378,7 @@ static int xen_9pfs_front_alloc_dataring(struct xenbus_device *dev,
 		for (i--; i >= 0; i--)
 			gnttab_end_foreign_access(ring->intf->ref[i], 0, 0);
 		free_pages((unsigned long)bytes,
-			   XEN_9PFS_RING_ORDER -
+			   ring->intf->ring_order -
 			   (PAGE_SHIFT - XEN_PAGE_SHIFT));
 	}
 	gnttab_end_foreign_access(ring->ref, 0, 0);
@@ -404,8 +408,10 @@ static int xen_9pfs_front_probe(struct xenbus_device *dev,
 		return -EINVAL;
 	max_ring_order = xenbus_read_unsigned(dev->otherend,
 					      "max-ring-page-order", 0);
-	if (max_ring_order < XEN_9PFS_RING_ORDER)
-		return -EINVAL;
+	if (max_ring_order > XEN_9PFS_RING_ORDER)
+		max_ring_order = XEN_9PFS_RING_ORDER;
+	if (p9_xen_trans.maxsize > XEN_FLEX_RING_SIZE(max_ring_order))
+		p9_xen_trans.maxsize = XEN_FLEX_RING_SIZE(max_ring_order) / 2;
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -422,7 +428,8 @@ static int xen_9pfs_front_probe(struct xenbus_device *dev,
 
 	for (i = 0; i < priv->num_rings; i++) {
 		priv->rings[i].priv = priv;
-		ret = xen_9pfs_front_alloc_dataring(dev, &priv->rings[i]);
+		ret = xen_9pfs_front_alloc_dataring(dev, &priv->rings[i],
+						    max_ring_order);
 		if (ret < 0)
 			goto error;
 	}
-- 
2.17.1


