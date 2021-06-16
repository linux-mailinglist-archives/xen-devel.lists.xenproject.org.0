Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2AE3A996E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 13:43:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142889.263506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltTwu-0005mC-Nm; Wed, 16 Jun 2021 11:43:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142889.263506; Wed, 16 Jun 2021 11:43:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltTwu-0005kM-KL; Wed, 16 Jun 2021 11:43:12 +0000
Received: by outflank-mailman (input) for mailman id 142889;
 Wed, 16 Jun 2021 11:43:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=igu3=LK=gmail.com=rm.skakun@srs-us1.protection.inumbo.net>)
 id 1ltTws-0005kF-Vk
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 11:43:11 +0000
Received: from mail-lf1-x136.google.com (unknown [2a00:1450:4864:20::136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28481f55-5f02-4a9e-bded-afe8bdc3180d;
 Wed, 16 Jun 2021 11:43:10 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id p7so3814561lfg.4
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jun 2021 04:43:10 -0700 (PDT)
Received: from localhost ([178.151.124.169])
 by smtp.gmail.com with ESMTPSA id bp28sm222612lfb.188.2021.06.16.04.43.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 04:43:08 -0700 (PDT)
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
X-Inumbo-ID: 28481f55-5f02-4a9e-bded-afe8bdc3180d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TRz4KFdLmerhp38zcm9b3IR/zrRQXeHz9t6YRT8nYG4=;
        b=BQ1EiQqyrVqVHYO1YJE1WkJqCisfV4zCqAT3TpOECMypGYpV2HVPzoVU78QyxUTGAf
         aAH1SaSFCB7L2Zwql0oaykhTd5SIZvsqRiyKGnR6Kxog148iIqumKXrnh0/VJ/veU9Ux
         wvSgoT6qHRxR8lAsqujwyx9M+PQupGHXXWZpxTPZG0r4b8vCndoHVlDaSmhzeTE2Manq
         3vxiQEtDa7fUD49JhUcZzcevSLWhTCg706FlcM3EuG69A56qczdMbi5WsoKwXdU2sXaJ
         ze1zdv4c9B+QJXP88ExqlT0wV7mh1mHgraR8vV7NhcZ77jHpxAgJjsi/6obs4dwP4k4B
         Da3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TRz4KFdLmerhp38zcm9b3IR/zrRQXeHz9t6YRT8nYG4=;
        b=fmUI/8oLWjJbxccEsAqHUtk7WcGpRC5d49YoBlSRDxYUrB7SI1t1s7CMBqiANmsthY
         moqy8+8KyjmsqllvnQ6Ct8LXzJLqYn6JFD19VaiNuTjnKQcZd00dt1Jn2oyIl1q9SZ88
         44BiqdvtKAY3dx+pqPk6dsl3xFg3z8sHGBRExP+mUdwOIfKiGcyA/38MndgpKLPIbXGD
         t1uXtENj00kmdV7O1bSf6VKpIck1ppS+KH3dzuYyOykGnFyaPHf8n1MIzgSQm3EXlAY8
         EtUq3aa5yMymyIPsf45vxoj5a5EEe+PUw7DcA/yU1BwzhbDQAJKwdEyD+fadIYhA0iLj
         miHA==
X-Gm-Message-State: AOAM530DKQEjBn8ws2DCWmQWUochB6RfCTfhNX11QPhMjt0uE+XoOOnI
	D2iNjDfKelqchXjnmQ7UEeI=
X-Google-Smtp-Source: ABdhPJwAYLX/JWWa/WTgHFPNNwbAi3jjfzTIsIUGQh6s1o9tPoHMdzNk1Uqk89bpuFeRS3vRXZ3c8w==
X-Received: by 2002:ac2:58e3:: with SMTP id v3mr3388446lfo.339.1623843788885;
        Wed, 16 Jun 2021 04:43:08 -0700 (PDT)
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
	Roman Skakun <roman_skakun@epam.com>
Subject: [PATCH 1/2] Revert "swiotlb-xen: remove xen_swiotlb_dma_mmap and xen_swiotlb_dma_get_sgtable"
Date: Wed, 16 Jun 2021 14:42:04 +0300
Message-Id: <20210616114205.38902-1-roman_skakun@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <855a58e2-1e03-4763-cb56-81367b73762c@oracle.com>
References: <855a58e2-1e03-4763-cb56-81367b73762c@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 922659ea771b3fd728149262c5ea15608fab9719.

Signed-off-by: Roman Skakun <roman_skakun@epam.com>
---
 drivers/xen/swiotlb-xen.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 2b385c1b4a99..90bc5fc321bc 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -563,6 +563,31 @@ xen_swiotlb_dma_supported(struct device *hwdev, u64 mask)
 	return xen_virt_to_bus(hwdev, xen_io_tlb_end - 1) <= mask;
 }
 
+/*
+ * Create userspace mapping for the DMA-coherent memory.
+ * This function should be called with the pages from the current domain only,
+ * passing pages mapped from other domains would lead to memory corruption.
+ */
+static int
+xen_swiotlb_dma_mmap(struct device *dev, struct vm_area_struct *vma,
+		     void *cpu_addr, dma_addr_t dma_addr, size_t size,
+		     unsigned long attrs)
+{
+	return dma_common_mmap(dev, vma, cpu_addr, dma_addr, size, attrs);
+}
+
+/*
+ * This function should be called with the pages from the current domain only,
+ * passing pages mapped from other domains would lead to memory corruption.
+ */
+static int
+xen_swiotlb_get_sgtable(struct device *dev, struct sg_table *sgt,
+			void *cpu_addr, dma_addr_t handle, size_t size,
+			unsigned long attrs)
+{
+	return dma_common_get_sgtable(dev, sgt, cpu_addr, handle, size, attrs);
+}
+
 const struct dma_map_ops xen_swiotlb_dma_ops = {
 	.alloc = xen_swiotlb_alloc_coherent,
 	.free = xen_swiotlb_free_coherent,
@@ -575,8 +600,8 @@ const struct dma_map_ops xen_swiotlb_dma_ops = {
 	.map_page = xen_swiotlb_map_page,
 	.unmap_page = xen_swiotlb_unmap_page,
 	.dma_supported = xen_swiotlb_dma_supported,
-	.mmap = dma_common_mmap,
-	.get_sgtable = dma_common_get_sgtable,
+	.mmap = xen_swiotlb_dma_mmap,
+	.get_sgtable = xen_swiotlb_get_sgtable,
 	.alloc_pages = dma_common_alloc_pages,
 	.free_pages = dma_common_free_pages,
 };
-- 
2.25.1


