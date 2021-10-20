Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E3A434F7C
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 17:56:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214005.372408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdDx5-0004bh-Jl; Wed, 20 Oct 2021 15:56:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214005.372408; Wed, 20 Oct 2021 15:56:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdDx5-0004Zr-Gm; Wed, 20 Oct 2021 15:56:27 +0000
Received: by outflank-mailman (input) for mailman id 214005;
 Wed, 20 Oct 2021 15:56:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lw/m=PI=kernel.org=kuba@srs-us1.protection.inumbo.net>)
 id 1mdDx4-0004Zl-Eb
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 15:56:26 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2070466-b9f2-4a0b-832b-0045a3c1c753;
 Wed, 20 Oct 2021 15:56:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 90CCE613A9;
 Wed, 20 Oct 2021 15:56:24 +0000 (UTC)
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
X-Inumbo-ID: c2070466-b9f2-4a0b-832b-0045a3c1c753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634745384;
	bh=R+swL9rmtFSenC2ia6irgU9Xg+bV/QFrmjtvxo3XbsE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g7dmnVbOEq0DGrt2G18FaHqWKUjiiogE7RW0GmNbyB4M3tXS0BH4nYaYWeeDx9LNa
	 ncqgJkB+qH7CU0awEMRWLgSP6mttePSpz4ZY9JjXJuaC3satz0ip88ZGT1ebV2OnrU
	 RCuPbSgBARIpPJ18V8GxooYJgPHh9oiPvLuskfadSQdWjQG+b26879eVPNHkwg2h8Z
	 WyVtWxwYaSmyw2N1d3i3kI9bsMzakCU13AWlwmajuEEcnKGACcfEFSGfuIeUqsx5is
	 xKL3mOJYvhllJ7/V8F5JVnxmj+s4E0rbbmwwjY9YzuTmqiVEK1crtF6CoqNMIkzKoY
	 mE+bHAZMu6OJg==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	wei.liu@kernel.org,
	paul@xen.org,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH net-next 01/12] net: xen: use eth_hw_addr_set()
Date: Wed, 20 Oct 2021 08:56:06 -0700
Message-Id: <20211020155617.1721694-2-kuba@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211020155617.1721694-1-kuba@kernel.org>
References: <20211020155617.1721694-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 406f42fa0d3c ("net-next: When a bond have a massive amount
of VLANs...") introduced a rbtree for faster Ethernet address look
up. To maintain netdev->dev_addr in this tree we need to make all
the writes to it got through appropriate helpers.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: wei.liu@kernel.org
CC: paul@xen.org
CC: boris.ostrovsky@oracle.com
CC: jgross@suse.com
CC: sstabellini@kernel.org
CC: xen-devel@lists.xenproject.org
---
 drivers/net/xen-netback/interface.c | 6 ++++--
 drivers/net/xen-netfront.c          | 4 +++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/xen-netback/interface.c b/drivers/net/xen-netback/interface.c
index c58996c1e230..fe8e21ad8ed9 100644
--- a/drivers/net/xen-netback/interface.c
+++ b/drivers/net/xen-netback/interface.c
@@ -494,6 +494,9 @@ static const struct net_device_ops xenvif_netdev_ops = {
 struct xenvif *xenvif_alloc(struct device *parent, domid_t domid,
 			    unsigned int handle)
 {
+	static const u8 dummy_addr[ETH_ALEN] = {
+		0xfe, 0xff, 0xff, 0xff, 0xff, 0xff,
+	};
 	int err;
 	struct net_device *dev;
 	struct xenvif *vif;
@@ -551,8 +554,7 @@ struct xenvif *xenvif_alloc(struct device *parent, domid_t domid,
 	 * stolen by an Ethernet bridge for STP purposes.
 	 * (FE:FF:FF:FF:FF:FF)
 	 */
-	eth_broadcast_addr(dev->dev_addr);
-	dev->dev_addr[0] &= ~0x01;
+	eth_hw_addr_set(dev, dummy_addr);
 
 	netif_carrier_off(dev);
 
diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index e31b98403f31..57437e4b8a94 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -2157,6 +2157,7 @@ static int talk_to_netback(struct xenbus_device *dev,
 	unsigned int max_queues = 0;
 	struct netfront_queue *queue = NULL;
 	unsigned int num_queues = 1;
+	u8 addr[ETH_ALEN];
 
 	info->netdev->irq = 0;
 
@@ -2170,11 +2171,12 @@ static int talk_to_netback(struct xenbus_device *dev,
 					"feature-split-event-channels", 0);
 
 	/* Read mac addr. */
-	err = xen_net_read_mac(dev, info->netdev->dev_addr);
+	err = xen_net_read_mac(dev, addr);
 	if (err) {
 		xenbus_dev_fatal(dev, err, "parsing %s/mac", dev->nodename);
 		goto out_unlocked;
 	}
+	eth_hw_addr_set(info->netdev, addr);
 
 	info->netback_has_xdp_headroom = xenbus_read_unsigned(info->xbdev->otherend,
 							      "feature-xdp-headroom", 0);
-- 
2.31.1


