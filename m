Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D075F3F5C18
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 12:28:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170856.311837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mITfJ-0003eZ-OO; Tue, 24 Aug 2021 10:28:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170856.311837; Tue, 24 Aug 2021 10:28:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mITfJ-0003bh-JJ; Tue, 24 Aug 2021 10:28:21 +0000
Received: by outflank-mailman (input) for mailman id 170856;
 Tue, 24 Aug 2021 10:28:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3Uw6=NP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mITfI-00031f-7P
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:28:20 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fcdf2e9c-04c5-11ec-a8c4-12813bfff9fa;
 Tue, 24 Aug 2021 10:28:14 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A1B482004F;
 Tue, 24 Aug 2021 10:28:13 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 57BEF136DD;
 Tue, 24 Aug 2021 10:28:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id SPvuE73JJGG8DwAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 24 Aug 2021 10:28:13 +0000
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
X-Inumbo-ID: fcdf2e9c-04c5-11ec-a8c4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1629800893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IbajY+E/j5QwN8ylzKx9q6TBPEhkc8yuc65ahR0PtvI=;
	b=mtDdJM9krc0OORygAchXMQ1LUti7fTdnE0i5Bpye5LlNYakl02v56oaP3Wr3xyP9+Rr+gZ
	HYespA8yyUahVvKBf97VhQx96d+Ic56qZ/wmmuRcW28YMSIMSD76oguqKSoZxcM4pQD4B8
	2+uI+Ll40TQO7J+fbs6O3W9G6E+VGtc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 1/4] xen/netfront: read response from backend only once
Date: Tue, 24 Aug 2021 12:28:06 +0200
Message-Id: <20210824102809.26370-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210824102809.26370-1-jgross@suse.com>
References: <20210824102809.26370-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to avoid problems in case the backend is modifying a response
on the ring page while the frontend has already seen it, just read the
response into a local buffer in one go and then operate on that buffer
only.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
V2:
- use direct structure assignment instead of memcpy() (Jan Beulich)
---
 drivers/net/xen-netfront.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index 44275908d61a..003cdf2ffc92 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -399,13 +399,13 @@ static void xennet_tx_buf_gc(struct netfront_queue *queue)
 		rmb(); /* Ensure we see responses up to 'rp'. */
 
 		for (cons = queue->tx.rsp_cons; cons != prod; cons++) {
-			struct xen_netif_tx_response *txrsp;
+			struct xen_netif_tx_response txrsp;
 
-			txrsp = RING_GET_RESPONSE(&queue->tx, cons);
-			if (txrsp->status == XEN_NETIF_RSP_NULL)
+			RING_COPY_RESPONSE(&queue->tx, cons, &txrsp);
+			if (txrsp.status == XEN_NETIF_RSP_NULL)
 				continue;
 
-			id  = txrsp->id;
+			id  = txrsp.id;
 			skb = queue->tx_skbs[id].skb;
 			if (unlikely(gnttab_query_foreign_access(
 				queue->grant_tx_ref[id]) != 0)) {
@@ -814,7 +814,7 @@ static int xennet_get_extras(struct netfront_queue *queue,
 			     RING_IDX rp)
 
 {
-	struct xen_netif_extra_info *extra;
+	struct xen_netif_extra_info extra;
 	struct device *dev = &queue->info->netdev->dev;
 	RING_IDX cons = queue->rx.rsp_cons;
 	int err = 0;
@@ -830,24 +830,22 @@ static int xennet_get_extras(struct netfront_queue *queue,
 			break;
 		}
 
-		extra = (struct xen_netif_extra_info *)
-			RING_GET_RESPONSE(&queue->rx, ++cons);
+		RING_COPY_RESPONSE(&queue->rx, ++cons, &extra);
 
-		if (unlikely(!extra->type ||
-			     extra->type >= XEN_NETIF_EXTRA_TYPE_MAX)) {
+		if (unlikely(!extra.type ||
+			     extra.type >= XEN_NETIF_EXTRA_TYPE_MAX)) {
 			if (net_ratelimit())
 				dev_warn(dev, "Invalid extra type: %d\n",
-					extra->type);
+					 extra.type);
 			err = -EINVAL;
 		} else {
-			memcpy(&extras[extra->type - 1], extra,
-			       sizeof(*extra));
+			extras[extra.type - 1] = extra;
 		}
 
 		skb = xennet_get_rx_skb(queue, cons);
 		ref = xennet_get_rx_ref(queue, cons);
 		xennet_move_rx_slot(queue, skb, ref);
-	} while (extra->flags & XEN_NETIF_EXTRA_FLAG_MORE);
+	} while (extra.flags & XEN_NETIF_EXTRA_FLAG_MORE);
 
 	queue->rx.rsp_cons = cons;
 	return err;
@@ -905,7 +903,7 @@ static int xennet_get_responses(struct netfront_queue *queue,
 				struct sk_buff_head *list,
 				bool *need_xdp_flush)
 {
-	struct xen_netif_rx_response *rx = &rinfo->rx;
+	struct xen_netif_rx_response *rx = &rinfo->rx, rx_local;
 	int max = XEN_NETIF_NR_SLOTS_MIN + (rx->status <= RX_COPY_THRESHOLD);
 	RING_IDX cons = queue->rx.rsp_cons;
 	struct sk_buff *skb = xennet_get_rx_skb(queue, cons);
@@ -989,7 +987,8 @@ static int xennet_get_responses(struct netfront_queue *queue,
 			break;
 		}
 
-		rx = RING_GET_RESPONSE(&queue->rx, cons + slots);
+		RING_COPY_RESPONSE(&queue->rx, cons + slots, &rx_local);
+		rx = &rx_local;
 		skb = xennet_get_rx_skb(queue, cons + slots);
 		ref = xennet_get_rx_ref(queue, cons + slots);
 		slots++;
@@ -1044,10 +1043,11 @@ static int xennet_fill_frags(struct netfront_queue *queue,
 	struct sk_buff *nskb;
 
 	while ((nskb = __skb_dequeue(list))) {
-		struct xen_netif_rx_response *rx =
-			RING_GET_RESPONSE(&queue->rx, ++cons);
+		struct xen_netif_rx_response rx;
 		skb_frag_t *nfrag = &skb_shinfo(nskb)->frags[0];
 
+		RING_COPY_RESPONSE(&queue->rx, ++cons, &rx);
+
 		if (skb_shinfo(skb)->nr_frags == MAX_SKB_FRAGS) {
 			unsigned int pull_to = NETFRONT_SKB_CB(skb)->pull_to;
 
@@ -1062,7 +1062,7 @@ static int xennet_fill_frags(struct netfront_queue *queue,
 
 		skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
 				skb_frag_page(nfrag),
-				rx->offset, rx->status, PAGE_SIZE);
+				rx.offset, rx.status, PAGE_SIZE);
 
 		skb_shinfo(nskb)->nr_frags = 0;
 		kfree_skb(nskb);
@@ -1161,7 +1161,7 @@ static int xennet_poll(struct napi_struct *napi, int budget)
 	i = queue->rx.rsp_cons;
 	work_done = 0;
 	while ((i != rp) && (work_done < budget)) {
-		memcpy(rx, RING_GET_RESPONSE(&queue->rx, i), sizeof(*rx));
+		RING_COPY_RESPONSE(&queue->rx, i, rx);
 		memset(extras, 0, sizeof(rinfo.extras));
 
 		err = xennet_get_responses(queue, &rinfo, rp, &tmpq,
-- 
2.26.2


