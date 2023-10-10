Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBAF7BFF32
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 16:27:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615067.956234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqDh7-0003Go-H3; Tue, 10 Oct 2023 14:26:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615067.956234; Tue, 10 Oct 2023 14:26:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqDh7-0003Dl-DX; Tue, 10 Oct 2023 14:26:45 +0000
Received: by outflank-mailman (input) for mailman id 615067;
 Tue, 10 Oct 2023 14:26:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wBiT=FY=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1qqDh5-0002hy-UR
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 14:26:43 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 0792d664-6779-11ee-9b0d-b553b5be7939;
 Tue, 10 Oct 2023 16:26:41 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 614DBC15;
 Tue, 10 Oct 2023 07:27:21 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C85E93F762;
 Tue, 10 Oct 2023 07:26:39 -0700 (PDT)
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
X-Inumbo-ID: 0792d664-6779-11ee-9b0d-b553b5be7939
From: Luca Fancellu <luca.fancellu@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org,
	Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH 1/1] xen-netback: add software timestamp capabilities
Date: Tue, 10 Oct 2023 15:26:30 +0100
Message-Id: <20231010142630.984585-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231010142630.984585-1-luca.fancellu@arm.com>
References: <20231010142630.984585-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add software timestamp capabilities to the xen-netback driver
by advertising it on the struct ethtool_ops and calling
skb_tx_timestamp before passing the buffer to the queue.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 drivers/net/xen-netback/interface.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/xen-netback/interface.c b/drivers/net/xen-netback/interface.c
index f3f2c07423a6..b71158967123 100644
--- a/drivers/net/xen-netback/interface.c
+++ b/drivers/net/xen-netback/interface.c
@@ -254,6 +254,9 @@ xenvif_start_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (vif->hash.alg == XEN_NETIF_CTRL_HASH_ALGORITHM_NONE)
 		skb_clear_hash(skb);
 
+	/* timestamp packet in software */
+	skb_tx_timestamp(skb);
+
 	if (!xenvif_rx_queue_tail(queue, skb))
 		goto drop;
 
@@ -460,7 +463,7 @@ static void xenvif_get_strings(struct net_device *dev, u32 stringset, u8 * data)
 
 static const struct ethtool_ops xenvif_ethtool_ops = {
 	.get_link	= ethtool_op_get_link,
-
+	.get_ts_info 	= ethtool_op_get_ts_info,
 	.get_sset_count = xenvif_get_sset_count,
 	.get_ethtool_stats = xenvif_get_ethtool_stats,
 	.get_strings = xenvif_get_strings,
-- 
2.34.1


