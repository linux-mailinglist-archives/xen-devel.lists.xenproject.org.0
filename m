Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5A754212A
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jun 2022 06:38:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343616.568984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nynRp-0005is-3C; Wed, 08 Jun 2022 04:37:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343616.568984; Wed, 08 Jun 2022 04:37:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nynRo-0005fQ-W9; Wed, 08 Jun 2022 04:37:36 +0000
Received: by outflank-mailman (input) for mailman id 343616;
 Wed, 08 Jun 2022 04:37:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dgi5=WP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nynRn-0005fJ-1N
 for xen-devel@lists.xenproject.org; Wed, 08 Jun 2022 04:37:35 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b67b1ae4-e6e4-11ec-bd2c-47488cf2e6aa;
 Wed, 08 Jun 2022 06:37:33 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BC28D1F9C5;
 Wed,  8 Jun 2022 04:37:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 657F813A15;
 Wed,  8 Jun 2022 04:37:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KylBF4wnoGIEYAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 08 Jun 2022 04:37:32 +0000
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
X-Inumbo-ID: b67b1ae4-e6e4-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1654663052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5b0LCcjxt2G2c58tf8D2HlEk4AjfaFqov/aOlpz/9ps=;
	b=Clad6PfPBjwlU+3zwJgEWSQiKzQeeiKfI0l2WATAP3iDRom/7TNf8QKUIMnNN3n4yTPqfe
	+EGmk/r/ijLOE0BZ46sVNoUtsYFNhKfey1U+7wgTQbgWaOb83AoIUq+LpWMaB1yBIpojVw
	QEHhxwnX2bcmSQwV4qlNaRrW9WTAqlc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH Resend] xen/netback: do some code cleanup
Date: Wed,  8 Jun 2022 06:37:26 +0200
Message-Id: <20220608043726.9380-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove some unused macros and functions, make local functions static.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Wei Liu <wei.liu@kernel.org>
---
 drivers/net/xen-netback/common.h    | 12 ------------
 drivers/net/xen-netback/interface.c | 16 +---------------
 drivers/net/xen-netback/netback.c   |  4 +++-
 drivers/net/xen-netback/rx.c        |  2 +-
 4 files changed, 5 insertions(+), 29 deletions(-)

diff --git a/drivers/net/xen-netback/common.h b/drivers/net/xen-netback/common.h
index d9dea4829c86..8174d7b2966c 100644
--- a/drivers/net/xen-netback/common.h
+++ b/drivers/net/xen-netback/common.h
@@ -48,7 +48,6 @@
 #include <linux/debugfs.h>
 
 typedef unsigned int pending_ring_idx_t;
-#define INVALID_PENDING_RING_IDX (~0U)
 
 struct pending_tx_info {
 	struct xen_netif_tx_request req; /* tx request */
@@ -82,8 +81,6 @@ struct xenvif_rx_meta {
 /* Discriminate from any valid pending_idx value. */
 #define INVALID_PENDING_IDX 0xFFFF
 
-#define MAX_BUFFER_OFFSET XEN_PAGE_SIZE
-
 #define MAX_PENDING_REQS XEN_NETIF_TX_RING_SIZE
 
 /* The maximum number of frags is derived from the size of a grant (same
@@ -367,11 +364,6 @@ void xenvif_free(struct xenvif *vif);
 int xenvif_xenbus_init(void);
 void xenvif_xenbus_fini(void);
 
-int xenvif_schedulable(struct xenvif *vif);
-
-int xenvif_queue_stopped(struct xenvif_queue *queue);
-void xenvif_wake_queue(struct xenvif_queue *queue);
-
 /* (Un)Map communication rings. */
 void xenvif_unmap_frontend_data_rings(struct xenvif_queue *queue);
 int xenvif_map_frontend_data_rings(struct xenvif_queue *queue,
@@ -394,7 +386,6 @@ int xenvif_dealloc_kthread(void *data);
 irqreturn_t xenvif_ctrl_irq_fn(int irq, void *data);
 
 bool xenvif_have_rx_work(struct xenvif_queue *queue, bool test_kthread);
-void xenvif_rx_action(struct xenvif_queue *queue);
 void xenvif_rx_queue_tail(struct xenvif_queue *queue, struct sk_buff *skb);
 
 void xenvif_carrier_on(struct xenvif *vif);
@@ -403,9 +394,6 @@ void xenvif_carrier_on(struct xenvif *vif);
 void xenvif_zerocopy_callback(struct sk_buff *skb, struct ubuf_info *ubuf,
 			      bool zerocopy_success);
 
-/* Unmap a pending page and release it back to the guest */
-void xenvif_idx_unmap(struct xenvif_queue *queue, u16 pending_idx);
-
 static inline pending_ring_idx_t nr_pending_reqs(struct xenvif_queue *queue)
 {
 	return MAX_PENDING_REQS -
diff --git a/drivers/net/xen-netback/interface.c b/drivers/net/xen-netback/interface.c
index 8e035374a370..fb32ae82d9b0 100644
--- a/drivers/net/xen-netback/interface.c
+++ b/drivers/net/xen-netback/interface.c
@@ -69,7 +69,7 @@ void xenvif_skb_zerocopy_complete(struct xenvif_queue *queue)
 	wake_up(&queue->dealloc_wq);
 }
 
-int xenvif_schedulable(struct xenvif *vif)
+static int xenvif_schedulable(struct xenvif *vif)
 {
 	return netif_running(vif->dev) &&
 		test_bit(VIF_STATUS_CONNECTED, &vif->status) &&
@@ -177,20 +177,6 @@ irqreturn_t xenvif_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-int xenvif_queue_stopped(struct xenvif_queue *queue)
-{
-	struct net_device *dev = queue->vif->dev;
-	unsigned int id = queue->id;
-	return netif_tx_queue_stopped(netdev_get_tx_queue(dev, id));
-}
-
-void xenvif_wake_queue(struct xenvif_queue *queue)
-{
-	struct net_device *dev = queue->vif->dev;
-	unsigned int id = queue->id;
-	netif_tx_wake_queue(netdev_get_tx_queue(dev, id));
-}
-
 static u16 xenvif_select_queue(struct net_device *dev, struct sk_buff *skb,
 			       struct net_device *sb_dev)
 {
diff --git a/drivers/net/xen-netback/netback.c b/drivers/net/xen-netback/netback.c
index d93814c14a23..fc61a4418737 100644
--- a/drivers/net/xen-netback/netback.c
+++ b/drivers/net/xen-netback/netback.c
@@ -112,6 +112,8 @@ static void make_tx_response(struct xenvif_queue *queue,
 			     s8       st);
 static void push_tx_responses(struct xenvif_queue *queue);
 
+static void xenvif_idx_unmap(struct xenvif_queue *queue, u16 pending_idx);
+
 static inline int tx_work_todo(struct xenvif_queue *queue);
 
 static inline unsigned long idx_to_pfn(struct xenvif_queue *queue,
@@ -1418,7 +1420,7 @@ static void push_tx_responses(struct xenvif_queue *queue)
 		notify_remote_via_irq(queue->tx_irq);
 }
 
-void xenvif_idx_unmap(struct xenvif_queue *queue, u16 pending_idx)
+static void xenvif_idx_unmap(struct xenvif_queue *queue, u16 pending_idx)
 {
 	int ret;
 	struct gnttab_unmap_grant_ref tx_unmap_op;
diff --git a/drivers/net/xen-netback/rx.c b/drivers/net/xen-netback/rx.c
index dbac4c03d21a..8df2c736fd23 100644
--- a/drivers/net/xen-netback/rx.c
+++ b/drivers/net/xen-netback/rx.c
@@ -486,7 +486,7 @@ static void xenvif_rx_skb(struct xenvif_queue *queue)
 
 #define RX_BATCH_SIZE 64
 
-void xenvif_rx_action(struct xenvif_queue *queue)
+static void xenvif_rx_action(struct xenvif_queue *queue)
 {
 	struct sk_buff_head completed_skbs;
 	unsigned int work_done = 0;
-- 
2.35.3


