Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13431850A08
	for <lists+xen-devel@lfdr.de>; Sun, 11 Feb 2024 16:39:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679070.1056588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZBuG-0004zW-Nk; Sun, 11 Feb 2024 15:38:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679070.1056588; Sun, 11 Feb 2024 15:38:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZBuG-0004wR-Jt; Sun, 11 Feb 2024 15:38:12 +0000
Received: by outflank-mailman (input) for mailman id 679070;
 Sun, 11 Feb 2024 15:10:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZVOd=JU=aladdin.ru=D.Dulov@srs-se1.protection.inumbo.net>)
 id 1rZBTI-0002dl-Dr
 for xen-devel@lists.xenproject.org; Sun, 11 Feb 2024 15:10:20 +0000
Received: from mail-out.aladdin-rd.ru (mail-out.aladdin-rd.ru [91.199.251.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6f06610-c8ef-11ee-98f5-efadbce2ee36;
 Sun, 11 Feb 2024 16:10:13 +0100 (CET)
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
X-Inumbo-ID: a6f06610-c8ef-11ee-98f5-efadbce2ee36
From: Daniil Dulov <d.dulov@aladdin.ru>
To: Juergen Gross <jgross@suse.com>
CC: Daniil Dulov <d.dulov@aladdin.ru>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Jeremy Fitzhardinge
	<jeremy.fitzhardinge@citrix.com>, <xen-devel@lists.xenproject.org>,
	<iommu@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
Subject: [PATCH] swiotlb-xen: remove redundant NULL check
Date: Sun, 11 Feb 2024 07:09:58 -0800
Message-ID: <20240211150958.4112-1-d.dulov@aladdin.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.20.125]
X-ClientProxiedBy: EXCH-2016-03.aladdin.ru (192.168.1.103) To
 EXCH-2016-01.aladdin.ru (192.168.1.101)

In this case hwdev cannot be NULL, so remove redundant NULL check.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: b097186fd29d ("swiotlb-xen: SWIOTLB library for Xen PV guest with PCI passthrough.")
Signed-off-by: Daniil Dulov <d.dulov@aladdin.ru>
---
 drivers/xen/swiotlb-xen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 2b385c1b4a99..b166f6efea26 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -305,7 +305,7 @@ xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
 	if (!ret)
 		return ret;
 
-	if (hwdev && hwdev->coherent_dma_mask)
+	if (hwdev->coherent_dma_mask)
 		dma_mask = hwdev->coherent_dma_mask;
 
 	/* At this point dma_handle is the dma address, next we are
-- 
2.25.1


