Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD583A3FA6
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 11:56:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140328.259314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrdtG-0007DA-OK; Fri, 11 Jun 2021 09:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140328.259314; Fri, 11 Jun 2021 09:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrdtG-0007BE-Kh; Fri, 11 Jun 2021 09:55:50 +0000
Received: by outflank-mailman (input) for mailman id 140328;
 Fri, 11 Jun 2021 09:55:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Erf=LF=gmail.com=rm.skakun@srs-us1.protection.inumbo.net>)
 id 1lrdtF-0007B8-RM
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 09:55:49 +0000
Received: from mail-lf1-x132.google.com (unknown [2a00:1450:4864:20::132])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2946a7b-4725-4054-861a-dff63ae2b86e;
 Fri, 11 Jun 2021 09:55:48 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id v22so7728501lfa.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jun 2021 02:55:48 -0700 (PDT)
Received: from localhost ([178.151.124.169])
 by smtp.gmail.com with ESMTPSA id r17sm651828ljp.40.2021.06.11.02.55.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 02:55:47 -0700 (PDT)
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
X-Inumbo-ID: b2946a7b-4725-4054-861a-dff63ae2b86e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L6Nq/3eMJ61O2ppaiV+K5WCKa4wxPQ8pA+EactXa5/Q=;
        b=ph/XomxAPqIvxyU2lBvMH35+Kz6l15GgxHvCZPiV1EKnsNbwv18k8r3CfcXnDTadvY
         0HnwK+tCN0fm+FLw08qSlxbWGgLd6GqEV8gP9+/y3mC8mcoEseYaHD7LCYroqq3CWIuc
         rvV1kJGEsSsa+H0Bu3TBsRdiyQHI4toAKrUIEEeDeNkbUJRQmjgiwHPiHMItUrOZc1Jp
         W4prezTF9Lefwdpg90MeiDy/5zo0TrVfeIoYveukEK7APT3Exak8EMxXVAcMlp+QDfko
         P6XaKRDFXiSX8yq0rw+oLRrog118hw6/Wc5k0gg7+VdGPRxrUvhmGPfxUDfyLjcQfPpN
         E6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L6Nq/3eMJ61O2ppaiV+K5WCKa4wxPQ8pA+EactXa5/Q=;
        b=nLPpMC9vkrEwbDCXbtbppNT6dZAUFunhpLIRU7dESK2EEeKjasKQLwNGijIjQCvqYB
         nCIGtSYUZMUK4c9uYls5ChhLZkWvWBW1pLkHU3tSFYD4JgOghx5wFTo/ls2+Qb4CfNbz
         sl19wrcxacqDCLS+MNos2VQcfTFjFNEMlecn9mX9P+MAK8ixxNFua0l117gGIsAIBqwK
         sjlo/WHXFWCWqGd9rJjD9BgFg8mmreOIQdtg053uui9xYKR23+uGDoyJp151iP+pgE/C
         CTWwTlLvryjfUMmSoJFO5p56LIDssUSiBPG86luDlgSGNKauNh3ZCtLryffv3phTZ5Kp
         avQw==
X-Gm-Message-State: AOAM532Q3PO9B1b8AUqu9jASZ6myKPwGibKDNdt4Mn9NF6RAzvpCaAAn
	YS1twyxIhYOyNJcxdkGarN0=
X-Google-Smtp-Source: ABdhPJy8EDHCE1f4s4ZC6KDj2A/UHmJhDH+REBsIFZnu4F/CM9rWslxdJXdDy1hMj7lLIs/rkF7G0w==
X-Received: by 2002:a19:dc02:: with SMTP id t2mr2158836lfg.261.1623405347760;
        Fri, 11 Jun 2021 02:55:47 -0700 (PDT)
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
Subject: [PATCH] swiotlb-xen: override common mmap and get_sgtable dma ops
Date: Fri, 11 Jun 2021 12:55:28 +0300
Message-Id: <20210611095528.9230-1-roman_skakun@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit is dedicated to fix incorrect convertion from
cpu_addr to page address in cases when we get virtual
address which allocated throught xen_swiotlb_alloc_coherent()
and can be mapped in the vmalloc range.
As the result, virt_to_page() cannot convert this address
properly and return incorrect page address.

Need to detect such cases and obtains the page address using
vmalloc_to_page() instead.

The reference code was copied from kernel/dma/ops_helpers.c
and modified to provide additional detections as described
above.

Signed-off-by: Roman Skakun <roman_skakun@epam.com>
Reviewed-by: Andrii Anisov <andrii_anisov@epam.com>

---
Also, I have observed that the original common code didn't 
make additional checks about contiguity of the memory region
represented by cpu_addr and size

May be, this means that these functions can get only physically 
contiguous memory.
Is this correct?

Cheers!

---
 drivers/xen/swiotlb-xen.c | 51 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 2b385c1b4a99..f99c98472927 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -563,6 +563,53 @@ xen_swiotlb_dma_supported(struct device *hwdev, u64 mask)
 	return xen_virt_to_bus(hwdev, xen_io_tlb_end - 1) <= mask;
 }
 
+static int
+xen_swiotlb_dma_mmap(struct device *dev, struct vm_area_struct *vma,
+		void *cpu_addr, dma_addr_t dma_addr, size_t size,
+		unsigned long attrs)
+{
+	unsigned long user_count = vma_pages(vma);
+	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
+	unsigned long off = vma->vm_pgoff;
+	struct page *page;
+
+	if (is_vmalloc_addr(cpu_addr))
+		page = vmalloc_to_page(cpu_addr);
+	else
+		page = virt_to_page(cpu_addr);
+
+	vma->vm_page_prot = dma_pgprot(dev, vma->vm_page_prot, attrs);
+
+	if (dma_mmap_from_dev_coherent(dev, vma, cpu_addr, size, &ret))
+		return -ENXIO;
+
+	if (off >= count || user_count > count - off)
+		return -ENXIO;
+
+	return remap_pfn_range(vma, vma->vm_start,
+			page_to_pfn(page) + vma->vm_pgoff,
+			user_count << PAGE_SHIFT, vma->vm_page_prot);
+}
+
+static int
+xen_swiotlb_dma_get_sgtable(struct device *dev, struct sg_table *sgt,
+		 void *cpu_addr, dma_addr_t dma_addr, size_t size,
+		 unsigned long attrs)
+{
+	struct page *page;
+	int ret;
+
+	if (is_vmalloc_addr(cpu_addr))
+		page = vmalloc_to_page(cpu_addr);
+	else
+		page = virt_to_page(cpu_addr);
+
+	ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
+	if (!ret)
+		sg_set_page(sgt->sgl, page, PAGE_ALIGN(size), 0);
+	return ret;
+}
+
 const struct dma_map_ops xen_swiotlb_dma_ops = {
 	.alloc = xen_swiotlb_alloc_coherent,
 	.free = xen_swiotlb_free_coherent,
@@ -575,8 +622,8 @@ const struct dma_map_ops xen_swiotlb_dma_ops = {
 	.map_page = xen_swiotlb_map_page,
 	.unmap_page = xen_swiotlb_unmap_page,
 	.dma_supported = xen_swiotlb_dma_supported,
-	.mmap = dma_common_mmap,
-	.get_sgtable = dma_common_get_sgtable,
+	.mmap = xen_swiotlb_dma_mmap,
+	.get_sgtable = xen_swiotlb_dma_get_sgtable,
 	.alloc_pages = dma_common_alloc_pages,
 	.free_pages = dma_common_free_pages,
 };
-- 
2.27.0


