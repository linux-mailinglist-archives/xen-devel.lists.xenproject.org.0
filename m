Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4123437F533
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 12:03:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126806.238287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh8BS-0004F5-GG; Thu, 13 May 2021 10:03:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126806.238287; Thu, 13 May 2021 10:03:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh8BS-0004CK-Cw; Thu, 13 May 2021 10:03:10 +0000
Received: by outflank-mailman (input) for mailman id 126806;
 Thu, 13 May 2021 10:03:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KipV=KI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lh8BQ-0003vw-Nm
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 10:03:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e7d7ef8-c3c2-48a1-a0e8-26c163d772ed;
 Thu, 13 May 2021 10:03:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9FC13B05D;
 Thu, 13 May 2021 10:03:06 +0000 (UTC)
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
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 5e7d7ef8-c3c2-48a1-a0e8-26c163d772ed
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620900186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g+1fyoENkOuy7Zh/t/9f7BoPHxXHhIGX5kJfVKmIRpA=;
	b=g/KYhXDBmr+jGf2DUNwYpTYmyFb5iID0n+JwQIYx5JoW7VIHybKPbSnGj1UPKNEw9rGj7B
	MiaQabJO4iSCO/G/rIVuX8Zf026zsfTmGZsYXeuDjGQ5Idoe7g910FX9BfA6fL9/j32Q2m
	vig7EKf4L+OCtklY3VcDg8L1QLco2XY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 6/8] xen/netfront: don't read data from request on the ring page
Date: Thu, 13 May 2021 12:03:00 +0200
Message-Id: <20210513100302.22027-7-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210513100302.22027-1-jgross@suse.com>
References: <20210513100302.22027-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to avoid a malicious backend being able to influence the local
processing of a request build the request locally first and then copy
it to the ring page. Any reading from the request needs to be done on
the local instance.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/net/xen-netfront.c | 75 ++++++++++++++++++--------------------
 1 file changed, 36 insertions(+), 39 deletions(-)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index f91e41ece554..261c35be0147 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -435,7 +435,8 @@ struct xennet_gnttab_make_txreq {
 	struct netfront_queue *queue;
 	struct sk_buff *skb;
 	struct page *page;
-	struct xen_netif_tx_request *tx; /* Last request */
+	struct xen_netif_tx_request *tx;      /* Last request on ring page */
+	struct xen_netif_tx_request tx_local; /* Last request local copy*/
 	unsigned int size;
 };
 
@@ -463,30 +464,27 @@ static void xennet_tx_setup_grant(unsigned long gfn, unsigned int offset,
 	queue->grant_tx_page[id] = page;
 	queue->grant_tx_ref[id] = ref;
 
-	tx->id = id;
-	tx->gref = ref;
-	tx->offset = offset;
-	tx->size = len;
-	tx->flags = 0;
+	info->tx_local.id = id;
+	info->tx_local.gref = ref;
+	info->tx_local.offset = offset;
+	info->tx_local.size = len;
+	info->tx_local.flags = 0;
+
+	*tx = info->tx_local;
 
 	info->tx = tx;
-	info->size += tx->size;
+	info->size += info->tx_local.size;
 }
 
 static struct xen_netif_tx_request *xennet_make_first_txreq(
-	struct netfront_queue *queue, struct sk_buff *skb,
-	struct page *page, unsigned int offset, unsigned int len)
+	struct xennet_gnttab_make_txreq *info,
+	unsigned int offset, unsigned int len)
 {
-	struct xennet_gnttab_make_txreq info = {
-		.queue = queue,
-		.skb = skb,
-		.page = page,
-		.size = 0,
-	};
+	info->size = 0;
 
-	gnttab_for_one_grant(page, offset, len, xennet_tx_setup_grant, &info);
+	gnttab_for_one_grant(info->page, offset, len, xennet_tx_setup_grant, info);
 
-	return info.tx;
+	return info->tx;
 }
 
 static void xennet_make_one_txreq(unsigned long gfn, unsigned int offset,
@@ -499,35 +497,27 @@ static void xennet_make_one_txreq(unsigned long gfn, unsigned int offset,
 	xennet_tx_setup_grant(gfn, offset, len, data);
 }
 
-static struct xen_netif_tx_request *xennet_make_txreqs(
-	struct netfront_queue *queue, struct xen_netif_tx_request *tx,
-	struct sk_buff *skb, struct page *page,
+static void xennet_make_txreqs(
+	struct xennet_gnttab_make_txreq *info,
+	struct page *page,
 	unsigned int offset, unsigned int len)
 {
-	struct xennet_gnttab_make_txreq info = {
-		.queue = queue,
-		.skb = skb,
-		.tx = tx,
-	};
-
 	/* Skip unused frames from start of page */
 	page += offset >> PAGE_SHIFT;
 	offset &= ~PAGE_MASK;
 
 	while (len) {
-		info.page = page;
-		info.size = 0;
+		info->page = page;
+		info->size = 0;
 
 		gnttab_foreach_grant_in_range(page, offset, len,
 					      xennet_make_one_txreq,
-					      &info);
+					      info);
 
 		page++;
 		offset = 0;
-		len -= info.size;
+		len -= info->size;
 	}
-
-	return info.tx;
 }
 
 /*
@@ -580,10 +570,14 @@ static int xennet_xdp_xmit_one(struct net_device *dev,
 {
 	struct netfront_info *np = netdev_priv(dev);
 	struct netfront_stats *tx_stats = this_cpu_ptr(np->tx_stats);
+	struct xennet_gnttab_make_txreq info = {
+		.queue = queue,
+		.skb = NULL,
+		.page = virt_to_page(xdpf->data),
+	};
 	int notify;
 
-	xennet_make_first_txreq(queue, NULL,
-				virt_to_page(xdpf->data),
+	xennet_make_first_txreq(&info,
 				offset_in_page(xdpf->data),
 				xdpf->len);
 
@@ -647,6 +641,7 @@ static netdev_tx_t xennet_start_xmit(struct sk_buff *skb, struct net_device *dev
 	unsigned int len;
 	unsigned long flags;
 	struct netfront_queue *queue = NULL;
+	struct xennet_gnttab_make_txreq info = { };
 	unsigned int num_queues = dev->real_num_tx_queues;
 	u16 queue_index;
 	struct sk_buff *nskb;
@@ -704,14 +699,16 @@ static netdev_tx_t xennet_start_xmit(struct sk_buff *skb, struct net_device *dev
 	}
 
 	/* First request for the linear area. */
-	first_tx = tx = xennet_make_first_txreq(queue, skb,
-						page, offset, len);
+	info.queue = queue;
+	info.skb = skb;
+	info.page = page;
+	first_tx = tx = xennet_make_first_txreq(&info, offset, len);
 	offset += tx->size;
 	if (offset == PAGE_SIZE) {
 		page++;
 		offset = 0;
 	}
-	len -= tx->size;
+	len -= info.tx_local.size;
 
 	if (skb->ip_summed == CHECKSUM_PARTIAL)
 		/* local packet? */
@@ -741,12 +738,12 @@ static netdev_tx_t xennet_start_xmit(struct sk_buff *skb, struct net_device *dev
 	}
 
 	/* Requests for the rest of the linear area. */
-	tx = xennet_make_txreqs(queue, tx, skb, page, offset, len);
+	xennet_make_txreqs(&info, page, offset, len);
 
 	/* Requests for all the frags. */
 	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
 		skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
-		tx = xennet_make_txreqs(queue, tx, skb, skb_frag_page(frag),
+		xennet_make_txreqs(&info, skb_frag_page(frag),
 					skb_frag_off(frag),
 					skb_frag_size(frag));
 	}
-- 
2.26.2


