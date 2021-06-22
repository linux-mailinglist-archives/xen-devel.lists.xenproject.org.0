Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 419AD3B05E8
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 15:35:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145882.268324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvgXt-00056Q-CN; Tue, 22 Jun 2021 13:34:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145882.268324; Tue, 22 Jun 2021 13:34:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvgXt-00053W-8d; Tue, 22 Jun 2021 13:34:29 +0000
Received: by outflank-mailman (input) for mailman id 145882;
 Tue, 22 Jun 2021 13:34:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BK9I=LQ=gmail.com=rm.skakun@srs-us1.protection.inumbo.net>)
 id 1lvgXr-00053O-5u
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 13:34:27 +0000
Received: from mail-lf1-x131.google.com (unknown [2a00:1450:4864:20::131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b1a62bf-a1d7-4d72-9b82-de0ce5bc0d9a;
 Tue, 22 Jun 2021 13:34:25 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id f30so36061424lfj.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jun 2021 06:34:25 -0700 (PDT)
Received: from localhost ([178.151.124.169])
 by smtp.gmail.com with ESMTPSA id l27sm2790583ljb.90.2021.06.22.06.34.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 06:34:23 -0700 (PDT)
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
X-Inumbo-ID: 8b1a62bf-a1d7-4d72-9b82-de0ce5bc0d9a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VpDilbWjWRuwm2Y0aj2xxaAxAvje8bBd6jPUCV3pOXQ=;
        b=fMPS6tmNxJ4WajUXO/WI+lAB/0vRCw/g40VCYzUAplHrCiShgYL4/pOWQt53jgsCrf
         grGcdhQjl09EnXls7tfkPf8x+Ekama0Z44pP8gN135yakp6jJ7WWKkoYaJkmCL6OFLUP
         nzOd+zztLMvLPOmX/8NCU+Nk6hN+3hpThfa+ReQZO3uaXdRMX34IHf9sOOvRgnLkv9G6
         alLI1QKAtA9yVaF6DuEsmIzeEi1WOWG1sjS4RoyJ/m5jVWPmmDB72ai9HnffPCdZGRoU
         45nWuPRiQFyqomMSwjaZkjlqTkynSdsmN1sLTW+F35Ra3uJpZOrA6cn28uqXYgBBKVYK
         yvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VpDilbWjWRuwm2Y0aj2xxaAxAvje8bBd6jPUCV3pOXQ=;
        b=MGgbTrGzkdzUk4d323vcR3FbiFbKGZgIadhdaeihjmwZzIG4pTq0VB6SClZQB0XeTE
         UEzDBnaUv1tmd222TGNLYmOFQ/yYXSEJ+wDeAeWR1/YBH66TGQLaVxjpD+pSbdXWFxUi
         EWNm0Mmu0AlthbhnPk9FZB5N5AoDiXOwC0HLXAooObekS4OnLqcWk1wkch+2QxK/ej2S
         kXsOFpZAysfbPGlxTF9IfAHlZv9G56taqmPTPfjW2sHPTIGmbM5+7Fje+EQuAYjrxF+Q
         QVBMUT+X6O2I6O05XzbOWchxRi2GteC43aXQM8qCvoa1kU5kei0zViIybDYU/E4KTSBq
         Y2cA==
X-Gm-Message-State: AOAM532cvuJXMiLmTocLUerHq3ZoFlF6hTeqsOgUctGIF1Vq7SLsyW4k
	/IN8Z5j135PSDjWa+MHL+Ok=
X-Google-Smtp-Source: ABdhPJyfiEMp266a5Vc5gXIKMSmpRt+IMoLHqhjEwQPGGcLOElP7Q+Iu0ooyEO/TCg6nVx1MPndmrQ==
X-Received: by 2002:ac2:5192:: with SMTP id u18mr2841831lfi.619.1624368864308;
        Tue, 22 Jun 2021 06:34:24 -0700 (PDT)
From: Roman Skakun <rm.skakun@gmail.com>
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
Subject: [PATCH v2] dma-mapping: use vmalloc_to_page for vmalloc addresses
Date: Tue, 22 Jun 2021 16:34:14 +0300
Message-Id: <20210622133414.132754-1-rm.skakun@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616154436.GA7619@lst.de>
References: <20210616154436.GA7619@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Hey!
Thanks for suggestions, Christoph!
I updated the patch according to your advice.
But, I'm so surprised because nobody catches this problem
in the common code before. It looks a bit strange as for me. 


 kernel/dma/ops_helpers.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/kernel/dma/ops_helpers.c b/kernel/dma/ops_helpers.c
index 910ae69cae77..782728d8a393 100644
--- a/kernel/dma/ops_helpers.c
+++ b/kernel/dma/ops_helpers.c
@@ -5,6 +5,14 @@
  */
 #include <linux/dma-map-ops.h>
 
+static struct page *cpu_addr_to_page(void *cpu_addr)
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
@@ -12,7 +20,7 @@ int dma_common_get_sgtable(struct device *dev, struct sg_table *sgt,
 		 void *cpu_addr, dma_addr_t dma_addr, size_t size,
 		 unsigned long attrs)
 {
-	struct page *page = virt_to_page(cpu_addr);
+	struct page *page = cpu_addr_to_page(cpu_addr);
 	int ret;
 
 	ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
@@ -43,7 +51,7 @@ int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
 		return -ENXIO;
 
 	return remap_pfn_range(vma, vma->vm_start,
-			page_to_pfn(virt_to_page(cpu_addr)) + vma->vm_pgoff,
+			page_to_pfn(cpu_addr_to_page(cpu_addr)) + vma->vm_pgoff,
 			user_count << PAGE_SHIFT, vma->vm_page_prot);
 #else
 	return -ENXIO;
-- 
2.25.1


