Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2EE3A996F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 13:43:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142890.263517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltTx0-00064I-0y; Wed, 16 Jun 2021 11:43:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142890.263517; Wed, 16 Jun 2021 11:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltTwz-00061H-Tw; Wed, 16 Jun 2021 11:43:17 +0000
Received: by outflank-mailman (input) for mailman id 142890;
 Wed, 16 Jun 2021 11:43:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=igu3=LK=gmail.com=rm.skakun@srs-us1.protection.inumbo.net>)
 id 1ltTwy-00060l-9z
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 11:43:16 +0000
Received: from mail-lj1-x22b.google.com (unknown [2a00:1450:4864:20::22b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a84bb722-96ed-4cdc-8182-d5ca1c592074;
 Wed, 16 Jun 2021 11:43:15 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id d2so3347420ljj.11
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jun 2021 04:43:15 -0700 (PDT)
Received: from localhost ([178.151.124.169])
 by smtp.gmail.com with ESMTPSA id m18sm239190ljg.105.2021.06.16.04.43.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 04:43:14 -0700 (PDT)
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
X-Inumbo-ID: a84bb722-96ed-4cdc-8182-d5ca1c592074
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7nQgkz7v7kjXkgg5q9M0yPzBFdiLLV6nxJ8RkjNgpeA=;
        b=aDPrdhEfh1kFSt/STcDHzzby2mSMyRVLn2/IHyVKerpOr7l762ZRsl4B8m+uIlcDi3
         YarS0JqZSnkfgGWTjhBS33bwVvWwsN9nS6HTbF06IdrjyF0I+4ErUV0d4n3oQwSBWmRP
         dj+YSl8fn58koBvmMomHtj+y335nmWnHTHraIFK6AntfuXyCET5STmdVe2XbvZl7nFhp
         BO6DQqYEqPgl4aaK7NM2AXkY++fkunJiXeaavy0hWBed6lC73frJYMnYO1aVCTLtlrF1
         +S4ovABSl4rLVsvoQQEbRdYYJjfqE1/WP2IX9ovrmrc8rEP1iDam+gsllSJ/H1DQHFmm
         O1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7nQgkz7v7kjXkgg5q9M0yPzBFdiLLV6nxJ8RkjNgpeA=;
        b=g1oMw62aYEEmUIJXAs/R6lIOBXSXZMNE1WKnQV6z8tRwXaZ58VjgMJdkJQQ6EqgWwJ
         1h5hkhRF7ssmUllreGdvSmb4C+esAyt3BYeYqU9B6r/P/FK/7TDfHzTMVMICoQ0L6f4H
         9vuatgjDLXbo+GQfhBqxVMKdhFQIzRbtV8BVJJ6ubdTyJz1U55eShNYeEQxYDf9sqPRl
         +xIT9cyniCF9dVfNxKTG37uwdCEP/5y1adZKRF637JQCz3VJen3q8kB3W9XyWr+rUS55
         wihgol/0e0MzRwpIDLzsDn5x3zpMGDdh5s4nDX+UUf8HmY/qSt5y42NNnrqdifqP5LjD
         oL0g==
X-Gm-Message-State: AOAM530E7JqgyOVFEOb24x1om8vsX1oUbvZIHKK5Laaq55FJSdp1CRka
	qMcBrCZZDWoV5Azh4P8nAVI=
X-Google-Smtp-Source: ABdhPJy8y+YAcCkoYKQg66iG8xEkfr5244XcQiy8PJossc/WgLE8Gd946VbZxMMUHzTiblQoWh+b7A==
X-Received: by 2002:a2e:b0eb:: with SMTP id h11mr2037701ljl.350.1623843794328;
        Wed, 16 Jun 2021 04:43:14 -0700 (PDT)
From: Roman Skakun <rm.skakun@gmail.com>
X-Google-Original-From: Roman Skakun <roman_skakun@epam.com>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Roman Skakun <rm.skakun@gmail.com>,
	Roman Skakun <roman_skakun@epam.com>,
	Andrii Anisov <andrii_anisov@epam.com>
Subject: [PATCH 2/2] swiotlb-xen: override common mmap and get_sgtable dma ops
Date: Wed, 16 Jun 2021 14:42:05 +0300
Message-Id: <20210616114205.38902-2-roman_skakun@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616114205.38902-1-roman_skakun@epam.com>
References: <855a58e2-1e03-4763-cb56-81367b73762c@oracle.com>
 <20210616114205.38902-1-roman_skakun@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit is dedicated to fix incorrect conversion from
cpu_addr to page address in cases when we get virtual
address which allocated through xen_swiotlb_alloc_coherent()
and can be mapped in the vmalloc range.
As the result, virt_to_page() cannot convert this address
properly and return incorrect page address.

Need to detect such cases and obtains the page address using
vmalloc_to_page() instead.

The reference code for mmap() and get_sgtable() was copied
from kernel/dma/ops_helpers.c and modified to provide
additional detections as described above.

In order to simplify code there was added a new
dma_cpu_addr_to_page() helper.

Signed-off-by: Roman Skakun <roman_skakun@epam.com>
Reviewed-by: Andrii Anisov <andrii_anisov@epam.com>
---
 drivers/xen/swiotlb-xen.c | 42 +++++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 90bc5fc321bc..9331a8500547 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -118,6 +118,14 @@ static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
 	return 0;
 }
 
+static struct page *cpu_addr_to_page(void *cpu_addr)
+{
+	if (is_vmalloc_addr(cpu_addr))
+		return vmalloc_to_page(cpu_addr);
+	else
+		return virt_to_page(cpu_addr);
+}
+
 static int
 xen_swiotlb_fixup(void *buf, size_t size, unsigned long nslabs)
 {
@@ -337,7 +345,7 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
 	int order = get_order(size);
 	phys_addr_t phys;
 	u64 dma_mask = DMA_BIT_MASK(32);
-	struct page *page;
+	struct page *page = cpu_addr_to_page(vaddr);
 
 	if (hwdev && hwdev->coherent_dma_mask)
 		dma_mask = hwdev->coherent_dma_mask;
@@ -349,11 +357,6 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
 	/* Convert the size to actually allocated. */
 	size = 1UL << (order + XEN_PAGE_SHIFT);
 
-	if (is_vmalloc_addr(vaddr))
-		page = vmalloc_to_page(vaddr);
-	else
-		page = virt_to_page(vaddr);
-
 	if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
 		     range_straddles_page_boundary(phys, size)) &&
 	    TestClearPageXenRemapped(page))
@@ -573,7 +576,23 @@ xen_swiotlb_dma_mmap(struct device *dev, struct vm_area_struct *vma,
 		     void *cpu_addr, dma_addr_t dma_addr, size_t size,
 		     unsigned long attrs)
 {
-	return dma_common_mmap(dev, vma, cpu_addr, dma_addr, size, attrs);
+	unsigned long user_count = vma_pages(vma);
+	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
+	unsigned long off = vma->vm_pgoff;
+	struct page *page = cpu_addr_to_page(cpu_addr);
+	int ret;
+
+	vma->vm_page_prot = dma_pgprot(dev, vma->vm_page_prot, attrs);
+
+	if (dma_mmap_from_dev_coherent(dev, vma, cpu_addr, size, &ret))
+		return ret;
+
+	if (off >= count || user_count > count - off)
+		return -ENXIO;
+
+	return remap_pfn_range(vma, vma->vm_start,
+			page_to_pfn(page) + vma->vm_pgoff,
+			user_count << PAGE_SHIFT, vma->vm_page_prot);
 }
 
 /*
@@ -585,7 +604,14 @@ xen_swiotlb_get_sgtable(struct device *dev, struct sg_table *sgt,
 			void *cpu_addr, dma_addr_t handle, size_t size,
 			unsigned long attrs)
 {
-	return dma_common_get_sgtable(dev, sgt, cpu_addr, handle, size, attrs);
+	struct page *page = cpu_addr_to_page(cpu_addr);
+	int ret;
+
+	ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
+	if (!ret)
+		sg_set_page(sgt->sgl, page, PAGE_ALIGN(size), 0);
+
+	return ret;
 }
 
 const struct dma_map_ops xen_swiotlb_dma_ops = {
-- 
2.25.1


