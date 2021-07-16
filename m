Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE42A3CB470
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 10:40:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157106.289964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4JNw-0004ai-SD; Fri, 16 Jul 2021 08:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157106.289964; Fri, 16 Jul 2021 08:39:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4JNw-0004Y7-P8; Fri, 16 Jul 2021 08:39:52 +0000
Received: by outflank-mailman (input) for mailman id 157106;
 Fri, 16 Jul 2021 08:39:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7+J5=MI=gmail.com=rm.skakun@srs-us1.protection.inumbo.net>)
 id 1m4JNv-0004Xk-0S
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 08:39:51 +0000
Received: from mail-ej1-x631.google.com (unknown [2a00:1450:4864:20::631])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86cf1293-3fed-40bf-837d-bdf562ba8e9a;
 Fri, 16 Jul 2021 08:39:49 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id gb6so14003964ejc.5
 for <xen-devel@lists.xenproject.org>; Fri, 16 Jul 2021 01:39:49 -0700 (PDT)
Received: from localhost ([185.117.121.76])
 by smtp.gmail.com with ESMTPSA id p18sm3390639edu.8.2021.07.16.01.39.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 01:39:48 -0700 (PDT)
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
X-Inumbo-ID: 86cf1293-3fed-40bf-837d-bdf562ba8e9a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1Aw+MvYuySKaeeZ9hfm0Wk5AJLKyuRLmX4WBjc8rKNo=;
        b=oUyFrqUYKdou9ruiR6KE+JMXnnLCL8dvqhN70gcyzeACf6NUw7EI0ATRz7wTttz15f
         7mOLygE4HmSHan8OZfyp5j8RPsbBrT3a0He5k0WrJB0y+5+L+NOkn9K5yvzS/pYZCO7p
         u7KZO9StVPaxTPF8Gr1jsGLQfWYOI2yH+fArBC1KqFZmKDSGTfAFVbEAaJhaz4AytnK+
         dyb74/h+h4RPLfu4yWREg9BWVCsYAyrrBgnZTYI0oQjZZZAiUpIi/RfegTpwdAhY2A7S
         DsU9Z4zG4GoeFsMnKMjo7DZYbgBHzHPJ/9lwWvF6RbJwmOcAv7hCambLdViiqWQdNc4U
         0rYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1Aw+MvYuySKaeeZ9hfm0Wk5AJLKyuRLmX4WBjc8rKNo=;
        b=WnmQqzA+QlrKotrUXZhSCO7RLt/lLxdxSnXp9weEFP8P3FRQ5PUFrcOIeglG+2Af08
         /N1SyvxbkoCVjl1X7HWH0watZIL1ROU3LMbB1Q1zfykTNoyDQoKhD2wPi9CfvYPPQ0Lp
         wopLN2bar27Wxv52TQ60fkIRSctqvi7YT3VOeJAVOn+hJBCzyUzMRhb2U6A4A0iP90HV
         ZHZkNdBBX4y6chEPxwhGd8UBCWMtI8C+7pzxrqUgmubHlYW3iY91kscsOnSh32sAfzqK
         nAm3xVwwe7VC33KMmf/VxlEdkXnDPy8TNHx/8EuTfFIanxrd0piO0MO9vIls3+pRswSp
         TuVg==
X-Gm-Message-State: AOAM531uAuZA5rF96rIqygbK3J5mx6752oG//GtwFOLtKhMSxLLzPZm2
	lBWv/Odu7TabA1cOcIzyLYI=
X-Google-Smtp-Source: ABdhPJwfFSjxOhCm0YSnLeoEw5a02XTjG3qrNAIfyswu4/Xx0Hrjsx5GukzWb4EvgN4GswtGTuomdw==
X-Received: by 2002:a17:906:c9cb:: with SMTP id hk11mr10449398ejb.544.1626424789035;
        Fri, 16 Jul 2021 01:39:49 -0700 (PDT)
From: Roman Skakun <rm.skakun@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Andrii Anisov <andrii_anisov@epam.com>,
	Roman Skakun <rm.skakun@gmail.com>,
	Roman Skakun <Roman_Skakun@epam.com>,
	Roman Skakun <roman_skakun@epam.com>
Subject: [PATCH v2] dma-mapping: use vmalloc_to_page for vmalloc addresses
Date: Fri, 16 Jul 2021 11:39:34 +0300
Message-Id: <20210716083934.154992-1-rm.skakun@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210715170011.GA17324@lst.de>
References: <20210715170011.GA17324@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Roman Skakun <Roman_Skakun@epam.com>

This commit is dedicated to fix incorrect conversion from
cpu_addr to page address in cases when we get virtual
address which allocated in the vmalloc range.
As the result, virt_to_page() cannot convert this address
properly and return incorrect page address.

Need to detect such cases and obtains the page address using
vmalloc_to_page() instead.

Signed-off-by: Roman Skakun <roman_skakun@epam.com>
Reviewed-by: Andrii Anisov <andrii_anisov@epam.com>
---
Hi, Christoph!
It's updated patch in accordance with your and Stefano 
suggestions. 

 drivers/xen/swiotlb-xen.c   |  7 +------
 include/linux/dma-map-ops.h |  2 ++
 kernel/dma/ops_helpers.c    | 16 ++++++++++++++--
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 92ee6eea30cd..c2f612a10a95 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -337,7 +337,7 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
 	int order = get_order(size);
 	phys_addr_t phys;
 	u64 dma_mask = DMA_BIT_MASK(32);
-	struct page *page;
+	struct page *page = cpu_addr_to_page(vaddr);
 
 	if (hwdev && hwdev->coherent_dma_mask)
 		dma_mask = hwdev->coherent_dma_mask;
@@ -349,11 +349,6 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
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
diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index a5f89fc4d6df..ce0edb0bb603 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -226,6 +226,8 @@ struct page *dma_alloc_from_pool(struct device *dev, size_t size,
 		bool (*phys_addr_ok)(struct device *, phys_addr_t, size_t));
 bool dma_free_from_pool(struct device *dev, void *start, size_t size);
 
+struct page *cpu_addr_to_page(void *cpu_addr);
+
 #ifdef CONFIG_ARCH_HAS_DMA_COHERENCE_H
 #include <asm/dma-coherence.h>
 #elif defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
diff --git a/kernel/dma/ops_helpers.c b/kernel/dma/ops_helpers.c
index 910ae69cae77..472e861750d3 100644
--- a/kernel/dma/ops_helpers.c
+++ b/kernel/dma/ops_helpers.c
@@ -5,6 +5,17 @@
  */
 #include <linux/dma-map-ops.h>
 
+/*
+ * This helper converts virtual address to page address.
+ */
+struct page *cpu_addr_to_page(void *cpu_addr)
+{
+	if (is_vmalloc_addr(cpu_addr))
+		return vmalloc_to_page(cpu_addr);
+	else
+		return virt_to_page(cpu_addr);
+}
+
 /*
  * Create scatter-list for the already allocated DMA buffer.
  */
@@ -12,7 +23,7 @@ int dma_common_get_sgtable(struct device *dev, struct sg_table *sgt,
 		 void *cpu_addr, dma_addr_t dma_addr, size_t size,
 		 unsigned long attrs)
 {
-	struct page *page = virt_to_page(cpu_addr);
+	struct page *page = cpu_addr_to_page(cpu_addr);
 	int ret;
 
 	ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
@@ -32,6 +43,7 @@ int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
 	unsigned long user_count = vma_pages(vma);
 	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
 	unsigned long off = vma->vm_pgoff;
+	struct page *page = cpu_addr_to_page(cpu_addr);
 	int ret = -ENXIO;
 
 	vma->vm_page_prot = dma_pgprot(dev, vma->vm_page_prot, attrs);
@@ -43,7 +55,7 @@ int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
 		return -ENXIO;
 
 	return remap_pfn_range(vma, vma->vm_start,
-			page_to_pfn(virt_to_page(cpu_addr)) + vma->vm_pgoff,
+			page_to_pfn(page) + vma->vm_pgoff,
 			user_count << PAGE_SHIFT, vma->vm_page_prot);
 #else
 	return -ENXIO;
-- 
2.27.0


