Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC89B642A2A
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 15:16:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453708.711303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2CGU-0000m0-8k; Mon, 05 Dec 2022 14:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453708.711303; Mon, 05 Dec 2022 14:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2CGU-0000jU-4o; Mon, 05 Dec 2022 14:16:14 +0000
Received: by outflank-mailman (input) for mailman id 453708;
 Mon, 05 Dec 2022 14:16:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N3Kf=4D=huawei.com=yangyingliang@srs-se1.protection.inumbo.net>)
 id 1p2CGS-0000jO-Uj
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 14:16:12 +0000
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c0ac571-74a7-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 15:16:10 +0100 (CET)
Received: from dggpemm500007.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NQltq2HZ2zFq4w;
 Mon,  5 Dec 2022 22:15:15 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 5 Dec
 2022 22:16:01 +0800
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
X-Inumbo-ID: 5c0ac571-74a7-11ed-8fd2-01056ac49cbb
From: Yang Yingliang <yangyingliang@huawei.com>
To: <xen-devel@lists.xenproject.org>, <netdev@vger.kernel.org>
CC: <wei.liu@kernel.org>, <paul@xen.org>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<jbeulich@suse.com>, <jgross@suse.com>
Subject: [PATCH net] xen/netback: don't call kfree_skb() under spin_lock_irqsave()
Date: Mon, 5 Dec 2022 22:13:33 +0800
Message-ID: <20221205141333.3974565-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected

It is not allowed to call kfree_skb() from hardware interrupt
context or with interrupts being disabled. So replace kfree_skb()
with dev_kfree_skb_irq() under spin_lock_irqsave().

Fixes: be81992f9086 ("xen/netback: don't queue unlimited number of packages")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/net/xen-netback/rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/xen-netback/rx.c b/drivers/net/xen-netback/rx.c
index 932762177110..d022206a0d17 100644
--- a/drivers/net/xen-netback/rx.c
+++ b/drivers/net/xen-netback/rx.c
@@ -92,7 +92,7 @@ void xenvif_rx_queue_tail(struct xenvif_queue *queue, struct sk_buff *skb)
 		struct net_device *dev = queue->vif->dev;
 
 		netif_tx_stop_queue(netdev_get_tx_queue(dev, queue->id));
-		kfree_skb(skb);
+		dev_kfree_skb_irq(skb);
 		queue->vif->dev->stats.rx_dropped++;
 	} else {
 		if (skb_queue_empty(&queue->rx_queue))
-- 
2.25.1


