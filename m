Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BC35B81B3
	for <lists+xen-devel@lfdr.de>; Wed, 14 Sep 2022 08:52:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406792.649191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYMFr-0005hK-Ph; Wed, 14 Sep 2022 06:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406792.649191; Wed, 14 Sep 2022 06:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYMFr-0005ec-Mg; Wed, 14 Sep 2022 06:52:15 +0000
Received: by outflank-mailman (input) for mailman id 406792;
 Wed, 14 Sep 2022 06:47:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SnZY=ZR=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1oYMBD-0003b8-0B
 for xen-devel@lists.xenproject.org; Wed, 14 Sep 2022 06:47:27 +0000
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15dedde5-33f9-11ed-9761-273f2230c3a0;
 Wed, 14 Sep 2022 08:47:24 +0200 (CEST)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MS9lV2t1mzmVGh;
 Wed, 14 Sep 2022 14:43:34 +0800 (CST)
Received: from huawei.com (10.67.175.83) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 14 Sep
 2022 14:47:19 +0800
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
X-Inumbo-ID: 15dedde5-33f9-11ed-9761-273f2230c3a0
From: ruanjinjie <ruanjinjie@huawei.com>
To: <jgross@suse.com>, <sstabellini@kernel.org>,
	<oleksandr_tyshchenko@epam.com>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<xen-devel@lists.xenproject.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next] xen-netfront: make bounce_skb static
Date: Wed, 14 Sep 2022 14:43:39 +0800
Message-ID: <20220914064339.49841-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.175.83]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected

The symbol is not used outside of the file, so mark it static.

Fixes the following warning:

./drivers/net/xen-netfront.c:676:16: warning: symbol 'bounce_skb' was not declared. Should it be static?

Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
---
 drivers/net/xen-netfront.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index 27a11cc08c61..2cb7e741e1a2 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -673,7 +673,7 @@ static int xennet_xdp_xmit(struct net_device *dev, int n,
 	return nxmit;
 }
 
-struct sk_buff *bounce_skb(const struct sk_buff *skb)
+static struct sk_buff *bounce_skb(const struct sk_buff *skb)
 {
 	unsigned int headerlen = skb_headroom(skb);
 	/* Align size to allocate full pages and avoid contiguous data leaks */
-- 
2.25.1


