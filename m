Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8494F0EA0
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 07:07:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298114.507763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbEv9-0002qG-Tn; Mon, 04 Apr 2022 05:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298114.507763; Mon, 04 Apr 2022 05:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbEv9-0002kS-O0; Mon, 04 Apr 2022 05:06:31 +0000
Received: by outflank-mailman (input) for mailman id 298114;
 Mon, 04 Apr 2022 05:06:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yBc+=UO=bombadil.srs.infradead.org=BATV+8f3f264ef3f87e17849e+6798+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nbEv8-00021C-8l
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 05:06:30 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc2f67c5-b3d4-11ec-8fbc-03012f2f19d4;
 Mon, 04 Apr 2022 07:06:29 +0200 (CEST)
Received: from 089144211060.atnat0020.highway.a1.net ([89.144.211.60]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbEuq-00D8ox-50; Mon, 04 Apr 2022 05:06:13 +0000
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
X-Inumbo-ID: fc2f67c5-b3d4-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=3bKOwa/vIjXDTctiHR3yrY0M3Nyf9zVmyxkMzvumqG8=; b=EB7gLsK0UvHav6B4abhaPvjJm4
	FSQhyO6o0EYvmijqssvR2Q1Gs9e9b7dbZYgZENsl7+jB7rWSFCNAlCbR1TzAA8Q1NVRTUwZMhXAYN
	+T/3Yc95IAf59JX6BzJyzdXMEVJ81KmzgtXkS84pkf42p/XCgBb24+Pe6oBHh6kTieMTt7Nj5y23Z
	wylVK+JE2wcAm+tlJTJmpJJ11tUpLjiTBDIjrztXtkuVK6/+I8gAYxYGF0MZhZA3St6JQ6dVe7QQT
	4i4Fld7CnHSKQSuWGvKwAQtoK98Bi5BCZne67U1mZDxrdJZA+51OSEmE/tuOtZVdA7Qu782BgN/Y9
	QNbBls1g==;
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Cc: x86@kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	tboot-devel@lists.sourceforge.net,
	linux-pci@vger.kernel.org
Subject: [PATCH 02/15] swiotlb: make swiotlb_exit a no-op if SWIOTLB_FORCE is set
Date: Mon,  4 Apr 2022 07:05:46 +0200
Message-Id: <20220404050559.132378-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220404050559.132378-1-hch@lst.de>
References: <20220404050559.132378-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

If force bouncing is enabled we can't release the buffers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 kernel/dma/swiotlb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 73a41cec9e386..98bb0eb44a7bf 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -369,6 +369,9 @@ void __init swiotlb_exit(void)
 	unsigned long tbl_vaddr;
 	size_t tbl_size, slots_size;
 
+	if (swiotlb_force == SWIOTLB_FORCE)
+		return;
+
 	if (!mem->nslabs)
 		return;
 
-- 
2.30.2


