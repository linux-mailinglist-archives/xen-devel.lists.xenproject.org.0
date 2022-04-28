Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A5A512E60
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 10:28:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316182.535065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzVM-0008Uu-JS; Thu, 28 Apr 2022 08:28:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316182.535065; Thu, 28 Apr 2022 08:28:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzVL-0008FY-Gl; Thu, 28 Apr 2022 08:28:03 +0000
Received: by outflank-mailman (input) for mailman id 316182;
 Thu, 28 Apr 2022 08:27:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KUQd=VG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1njzVD-0005SL-B3
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 08:27:55 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17d24682-c6cd-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 10:27:51 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 213BC1F890;
 Thu, 28 Apr 2022 08:27:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CE03013491;
 Thu, 28 Apr 2022 08:27:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qCMIMQZQamIBLgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 28 Apr 2022 08:27:50 +0000
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
X-Inumbo-ID: 17d24682-c6cd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651134471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bVl00wdBYeWK59DNgpTl+klU3KYXSfeQcCWUD7CZHgs=;
	b=k881eTR02k8w1RYRfM94bVRQVC+/P1KxAKK9Vr1oaKX1zwBgry4GKvMMbwXVTKe5Vz9u53
	NzzI2WgN10PupMpUlvxc/YqIEqnJiuFBZzXUZpOWrtSvAndR0+LlKR61OsCyf7F7A5Xfen
	LBx/pgfQle9bOdS54vpk7CkRnFKHe3g=
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
Subject: [PATCH v2 12/19] xen/netfront: use xenbus_setup_ring() and xenbus_teardown_ring()
Date: Thu, 28 Apr 2022 10:27:36 +0200
Message-Id: <20220428082743.16593-13-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220428082743.16593-1-jgross@suse.com>
References: <20220428082743.16593-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify netfront's ring creation and removal via xenbus_setup_ring()
and xenbus_teardown_ring().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/net/xen-netfront.c | 53 +++++++++-----------------------------
 1 file changed, 12 insertions(+), 41 deletions(-)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index 966bee2a6902..65ab907aca5a 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -1921,8 +1921,7 @@ static int setup_netfront(struct xenbus_device *dev,
 			struct netfront_queue *queue, unsigned int feature_split_evtchn)
 {
 	struct xen_netif_tx_sring *txs;
-	struct xen_netif_rx_sring *rxs = NULL;
-	grant_ref_t gref;
+	struct xen_netif_rx_sring *rxs;
 	int err;
 
 	queue->tx_ring_ref = INVALID_GRANT_REF;
@@ -1930,33 +1929,19 @@ static int setup_netfront(struct xenbus_device *dev,
 	queue->rx.sring = NULL;
 	queue->tx.sring = NULL;
 
-	txs = (struct xen_netif_tx_sring *)get_zeroed_page(GFP_NOIO | __GFP_HIGH);
-	if (!txs) {
-		err = -ENOMEM;
-		xenbus_dev_fatal(dev, err, "allocating tx ring page");
+	err = xenbus_setup_ring(dev, GFP_NOIO | __GFP_HIGH, (void **)&txs,
+				1, &queue->tx_ring_ref);
+	if (err)
 		goto fail;
-	}
-	SHARED_RING_INIT(txs);
-	FRONT_RING_INIT(&queue->tx, txs, XEN_PAGE_SIZE);
 
-	err = xenbus_grant_ring(dev, txs, 1, &gref);
-	if (err < 0)
-		goto fail;
-	queue->tx_ring_ref = gref;
+	XEN_FRONT_RING_INIT(&queue->tx, txs, XEN_PAGE_SIZE);
 
-	rxs = (struct xen_netif_rx_sring *)get_zeroed_page(GFP_NOIO | __GFP_HIGH);
-	if (!rxs) {
-		err = -ENOMEM;
-		xenbus_dev_fatal(dev, err, "allocating rx ring page");
+	err = xenbus_setup_ring(dev, GFP_NOIO | __GFP_HIGH, (void **)&rxs,
+				1, &queue->rx_ring_ref);
+	if (err)
 		goto fail;
-	}
-	SHARED_RING_INIT(rxs);
-	FRONT_RING_INIT(&queue->rx, rxs, XEN_PAGE_SIZE);
 
-	err = xenbus_grant_ring(dev, rxs, 1, &gref);
-	if (err < 0)
-		goto fail;
-	queue->rx_ring_ref = gref;
+	XEN_FRONT_RING_INIT(&queue->rx, rxs, XEN_PAGE_SIZE);
 
 	if (feature_split_evtchn)
 		err = setup_netfront_split(queue);
@@ -1972,24 +1957,10 @@ static int setup_netfront(struct xenbus_device *dev,
 
 	return 0;
 
-	/* If we fail to setup netfront, it is safe to just revoke access to
-	 * granted pages because backend is not accessing it at this point.
-	 */
  fail:
-	if (queue->rx_ring_ref != INVALID_GRANT_REF) {
-		gnttab_end_foreign_access(queue->rx_ring_ref,
-					  (unsigned long)rxs);
-		queue->rx_ring_ref = INVALID_GRANT_REF;
-	} else {
-		free_page((unsigned long)rxs);
-	}
-	if (queue->tx_ring_ref != INVALID_GRANT_REF) {
-		gnttab_end_foreign_access(queue->tx_ring_ref,
-					  (unsigned long)txs);
-		queue->tx_ring_ref = INVALID_GRANT_REF;
-	} else {
-		free_page((unsigned long)txs);
-	}
+	xenbus_teardown_ring((void **)&queue->rx.sring, 1, &queue->rx_ring_ref);
+	xenbus_teardown_ring((void **)&queue->tx.sring, 1, &queue->tx_ring_ref);
+
 	return err;
 }
 
-- 
2.34.1


