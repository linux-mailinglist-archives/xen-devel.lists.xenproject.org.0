Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 026EE512E67
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 10:28:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316172.534974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzVB-00065V-4S; Thu, 28 Apr 2022 08:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316172.534974; Thu, 28 Apr 2022 08:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzVA-0005zo-Tw; Thu, 28 Apr 2022 08:27:52 +0000
Received: by outflank-mailman (input) for mailman id 316172;
 Thu, 28 Apr 2022 08:27:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KUQd=VG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1njzV8-0005SM-Dv
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 08:27:50 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1632c798-c6cd-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 10:27:48 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6132A21871;
 Thu, 28 Apr 2022 08:27:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1BC7913491;
 Thu, 28 Apr 2022 08:27:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0KaDBQRQamIBLgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 28 Apr 2022 08:27:48 +0000
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
X-Inumbo-ID: 1632c798-c6cd-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651134468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1+sLUcbyL72u2uT21oB5tsWX/EFozEKqCEXKzXzCiFA=;
	b=UnsC/U6cRAnvBqbXD65jZsvqsn6XqCQFhpOxRtYjKbTiLSNREIe8/ihMdRY93qVR4qiTmB
	rCJNq/A/60c+PxQpAn3nr/EmT1y0umP0H3kUFtXu8lzWdFOifhRD45y1sS0Z6sfcuDpnyr
	bbK/7Lz+zzWkM7Ld2KfJdNfwt4J5+eo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 02/19] xen/netfront: switch netfront to use INVALID_GRANT_REF
Date: Thu, 28 Apr 2022 10:27:26 +0200
Message-Id: <20220428082743.16593-3-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220428082743.16593-1-jgross@suse.com>
References: <20220428082743.16593-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using a private macro for an invalid grant reference use
the common one.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/net/xen-netfront.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index e2b4a1893a13..af3d3de7d9fa 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -78,8 +78,6 @@ struct netfront_cb {
 
 #define RX_COPY_THRESHOLD 256
 
-#define GRANT_INVALID_REF	0
-
 #define NET_TX_RING_SIZE __CONST_RING_SIZE(xen_netif_tx, XEN_PAGE_SIZE)
 #define NET_RX_RING_SIZE __CONST_RING_SIZE(xen_netif_rx, XEN_PAGE_SIZE)
 
@@ -224,7 +222,7 @@ static grant_ref_t xennet_get_rx_ref(struct netfront_queue *queue,
 {
 	int i = xennet_rxidx(ri);
 	grant_ref_t ref = queue->grant_rx_ref[i];
-	queue->grant_rx_ref[i] = GRANT_INVALID_REF;
+	queue->grant_rx_ref[i] = INVALID_GRANT_REF;
 	return ref;
 }
 
@@ -432,7 +430,7 @@ static bool xennet_tx_buf_gc(struct netfront_queue *queue)
 			}
 			gnttab_release_grant_reference(
 				&queue->gref_tx_head, queue->grant_tx_ref[id]);
-			queue->grant_tx_ref[id] = GRANT_INVALID_REF;
+			queue->grant_tx_ref[id] = INVALID_GRANT_REF;
 			queue->grant_tx_page[id] = NULL;
 			add_id_to_list(&queue->tx_skb_freelist, queue->tx_link, id);
 			dev_kfree_skb_irq(skb);
@@ -1021,7 +1019,7 @@ static int xennet_get_responses(struct netfront_queue *queue,
 		 * the backend driver. In future this should flag the bad
 		 * situation to the system controller to reboot the backend.
 		 */
-		if (ref == GRANT_INVALID_REF) {
+		if (ref == INVALID_GRANT_REF) {
 			if (net_ratelimit())
 				dev_warn(dev, "Bad rx response id %d.\n",
 					 rx->id);
@@ -1390,7 +1388,7 @@ static void xennet_release_tx_bufs(struct netfront_queue *queue)
 		gnttab_end_foreign_access(queue->grant_tx_ref[i],
 					  (unsigned long)page_address(queue->grant_tx_page[i]));
 		queue->grant_tx_page[i] = NULL;
-		queue->grant_tx_ref[i] = GRANT_INVALID_REF;
+		queue->grant_tx_ref[i] = INVALID_GRANT_REF;
 		add_id_to_list(&queue->tx_skb_freelist, queue->tx_link, i);
 		dev_kfree_skb_irq(skb);
 	}
@@ -1411,7 +1409,7 @@ static void xennet_release_rx_bufs(struct netfront_queue *queue)
 			continue;
 
 		ref = queue->grant_rx_ref[id];
-		if (ref == GRANT_INVALID_REF)
+		if (ref == INVALID_GRANT_REF)
 			continue;
 
 		page = skb_frag_page(&skb_shinfo(skb)->frags[0]);
@@ -1422,7 +1420,7 @@ static void xennet_release_rx_bufs(struct netfront_queue *queue)
 		get_page(page);
 		gnttab_end_foreign_access(ref,
 					  (unsigned long)page_address(page));
-		queue->grant_rx_ref[id] = GRANT_INVALID_REF;
+		queue->grant_rx_ref[id] = INVALID_GRANT_REF;
 
 		kfree_skb(skb);
 	}
@@ -1761,7 +1759,7 @@ static int netfront_probe(struct xenbus_device *dev,
 static void xennet_end_access(int ref, void *page)
 {
 	/* This frees the page as a side-effect */
-	if (ref != GRANT_INVALID_REF)
+	if (ref != INVALID_GRANT_REF)
 		gnttab_end_foreign_access(ref, (unsigned long)page);
 }
 
@@ -1798,8 +1796,8 @@ static void xennet_disconnect_backend(struct netfront_info *info)
 		xennet_end_access(queue->tx_ring_ref, queue->tx.sring);
 		xennet_end_access(queue->rx_ring_ref, queue->rx.sring);
 
-		queue->tx_ring_ref = GRANT_INVALID_REF;
-		queue->rx_ring_ref = GRANT_INVALID_REF;
+		queue->tx_ring_ref = INVALID_GRANT_REF;
+		queue->rx_ring_ref = INVALID_GRANT_REF;
 		queue->tx.sring = NULL;
 		queue->rx.sring = NULL;
 
@@ -1927,8 +1925,8 @@ static int setup_netfront(struct xenbus_device *dev,
 	grant_ref_t gref;
 	int err;
 
-	queue->tx_ring_ref = GRANT_INVALID_REF;
-	queue->rx_ring_ref = GRANT_INVALID_REF;
+	queue->tx_ring_ref = INVALID_GRANT_REF;
+	queue->rx_ring_ref = INVALID_GRANT_REF;
 	queue->rx.sring = NULL;
 	queue->tx.sring = NULL;
 
@@ -1978,17 +1976,17 @@ static int setup_netfront(struct xenbus_device *dev,
 	 * granted pages because backend is not accessing it at this point.
 	 */
  fail:
-	if (queue->rx_ring_ref != GRANT_INVALID_REF) {
+	if (queue->rx_ring_ref != INVALID_GRANT_REF) {
 		gnttab_end_foreign_access(queue->rx_ring_ref,
 					  (unsigned long)rxs);
-		queue->rx_ring_ref = GRANT_INVALID_REF;
+		queue->rx_ring_ref = INVALID_GRANT_REF;
 	} else {
 		free_page((unsigned long)rxs);
 	}
-	if (queue->tx_ring_ref != GRANT_INVALID_REF) {
+	if (queue->tx_ring_ref != INVALID_GRANT_REF) {
 		gnttab_end_foreign_access(queue->tx_ring_ref,
 					  (unsigned long)txs);
-		queue->tx_ring_ref = GRANT_INVALID_REF;
+		queue->tx_ring_ref = INVALID_GRANT_REF;
 	} else {
 		free_page((unsigned long)txs);
 	}
@@ -2020,7 +2018,7 @@ static int xennet_init_queue(struct netfront_queue *queue)
 	queue->tx_pend_queue = TX_LINK_NONE;
 	for (i = 0; i < NET_TX_RING_SIZE; i++) {
 		queue->tx_link[i] = i + 1;
-		queue->grant_tx_ref[i] = GRANT_INVALID_REF;
+		queue->grant_tx_ref[i] = INVALID_GRANT_REF;
 		queue->grant_tx_page[i] = NULL;
 	}
 	queue->tx_link[NET_TX_RING_SIZE - 1] = TX_LINK_NONE;
@@ -2028,7 +2026,7 @@ static int xennet_init_queue(struct netfront_queue *queue)
 	/* Clear out rx_skbs */
 	for (i = 0; i < NET_RX_RING_SIZE; i++) {
 		queue->rx_skbs[i] = NULL;
-		queue->grant_rx_ref[i] = GRANT_INVALID_REF;
+		queue->grant_rx_ref[i] = INVALID_GRANT_REF;
 	}
 
 	/* A grant for every tx ring slot */
-- 
2.34.1


