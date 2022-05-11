Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DE1523384
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 14:58:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326804.549445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nolv3-0002GC-H1; Wed, 11 May 2022 12:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326804.549445; Wed, 11 May 2022 12:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nolv3-0002De-Bd; Wed, 11 May 2022 12:58:21 +0000
Received: by outflank-mailman (input) for mailman id 326804;
 Wed, 11 May 2022 12:58:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I4DC=VT=bombadil.srs.infradead.org=BATV+bd3371fd9649de263009+6835+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nolv0-0002DF-Ak
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 12:58:19 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05e66253-d12a-11ec-a406-831a346695d4;
 Wed, 11 May 2022 14:58:16 +0200 (CEST)
Received: from [2001:4bb8:184:7881:740a:25f7:2c13:ef7a] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nolut-006reA-JL; Wed, 11 May 2022 12:58:12 +0000
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
X-Inumbo-ID: 05e66253-d12a-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=VBAca1xXxndzNfh1X1k86JeV9qFeb8QaWGR+x5euRpI=; b=VBMFfZIBGc4yLHRm2Wa5peBxYo
	L7lkpBKL9qmRp7GdsRzDbo2hOxkLdrUFWSDWJAWKxk7QsvkAo2WDU1HButK/AFoRRG2iI+xRaqzne
	eJpGCLr8lqE1G4UklNZu5W5Via4KqfQygzftAqjThgZhRiLJT9nOUNEt91aPkno5EGtYNQKITCBm9
	0qhtN7kBThU6Wf12wDMqazMp94VKvBm1Bh2nyagV+tLVCyBBcz19ufT9rcxQ1nGaInv4lWj1hvQ9c
	ORWQ8Tf+T/53asn71Frgu3Zufwh+iDGXlg9wwgJIvAusQNxKo6BMaE2N49S38haolif8C8QpTZGf3
	yN2fiQ/g==;
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Conor.Dooley@microchip.com,
	xen-devel@lists.xenproject.org
Subject: [PATCH 1/3] swiotlb: don't panic when the swiotlb buffer can't be allocated
Date: Wed, 11 May 2022 14:58:03 +0200
Message-Id: <20220511125805.1377025-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220511125805.1377025-1-hch@lst.de>
References: <20220511125805.1377025-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

For historical reasons the switlb code paniced when the metadata could
not be allocated, but just printed a warning when the actual main
swiotlb buffer could not be allocated.  Restore this somewhat unexpected
behavior as changing it caused a boot failure on the Microchip RISC-V
PolarFire SoC Icicle kit.

Fixes: 6424e31b1c05 ("swiotlb: remove swiotlb_init_with_tbl and swiotlb_init_late_with_tbl")
Reported-by: Conor Dooley <Conor.Dooley@microchip.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
Tested-by: Conor Dooley <Conor.Dooley@microchip.com>
---
 kernel/dma/swiotlb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index e2ef0864eb1e5..3e992a308c8a1 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -254,8 +254,10 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 		tlb = memblock_alloc(bytes, PAGE_SIZE);
 	else
 		tlb = memblock_alloc_low(bytes, PAGE_SIZE);
-	if (!tlb)
-		panic("%s: failed to allocate tlb structure\n", __func__);
+	if (!tlb) {
+		pr_warn("%s: failed to allocate tlb structure\n", __func__);
+		return;
+	}
 
 	if (remap && remap(tlb, nslabs) < 0) {
 		memblock_free(tlb, PAGE_ALIGN(bytes));
-- 
2.30.2


