Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC654BFD0F
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:36:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276984.473434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMXDI-0002wz-Nu; Tue, 22 Feb 2022 15:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276984.473434; Tue, 22 Feb 2022 15:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMXDI-0002rc-DZ; Tue, 22 Feb 2022 15:36:28 +0000
Received: by outflank-mailman (input) for mailman id 276984;
 Tue, 22 Feb 2022 15:36:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CFyZ=TF=bombadil.srs.infradead.org=BATV+11ac0858211c0bd5236f+6757+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nMXCw-0005NI-1q
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 15:36:06 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24fcf85c-93f5-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 16:36:04 +0100 (CET)
Received: from [2001:4bb8:198:f8fc:c22a:ebfc:be8d:63c2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMXCe-00AH73-Qo; Tue, 22 Feb 2022 15:35:49 +0000
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
X-Inumbo-ID: 24fcf85c-93f5-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=zCMW1Q+QCPXYuvBuEGOZUQKFwE9OwdLFtYhltvQ29K4=; b=UivVJu0xfBlRElPO98LGgBvic3
	FgFkBA8tXOAwbzm4ASFviz4SOlLZ2Xk5ojd8aBpgvcYaCCrlUt0AmrI5QXz9BLb9cU7dErlkZgnz3
	IzVqfHy80xQHgtYs4YtsJIktFe5xVp6loPXsAhY+LqtEtDSPdoKeEjZiqWlkk7Equu3WmJaFkQpSY
	nCZa1Oyt2hQQICm8D2KgV+1H1RPCuXGZ7ggZgJ+BM2gIRjfpfUXSW4OsSGdg/5dox+XsD7+FHqwZ8
	loSXrmeHFqVxP2h0pkLAiL/0DZ/bH24KlkPtKONU0U65lHnthcy9X8oVbBAOSQMLGRq8tZSF7/H/x
	UnbZJ7Dg==;
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Cc: x86@kernel.org,
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
Subject: [PATCH 11/11] x86: remove cruft from <asm/dma-mapping.h>
Date: Tue, 22 Feb 2022 16:35:14 +0100
Message-Id: <20220222153514.593231-12-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220222153514.593231-1-hch@lst.de>
References: <20220222153514.593231-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

<asm/dma-mapping.h> gets pulled in by all drivers using the DMA API.
Remove x86 internal variables and unnecessary includes from it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/x86/include/asm/dma-mapping.h | 11 -----------
 arch/x86/include/asm/iommu.h       |  2 ++
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/arch/x86/include/asm/dma-mapping.h b/arch/x86/include/asm/dma-mapping.h
index 256fd8115223d..1c66708e30623 100644
--- a/arch/x86/include/asm/dma-mapping.h
+++ b/arch/x86/include/asm/dma-mapping.h
@@ -2,17 +2,6 @@
 #ifndef _ASM_X86_DMA_MAPPING_H
 #define _ASM_X86_DMA_MAPPING_H
 
-/*
- * IOMMU interface. See Documentation/core-api/dma-api-howto.rst and
- * Documentation/core-api/dma-api.rst for documentation.
- */
-
-#include <linux/scatterlist.h>
-#include <asm/io.h>
-
-extern int iommu_merge;
-extern int panic_on_overflow;
-
 extern const struct dma_map_ops *dma_ops;
 
 static inline const struct dma_map_ops *get_arch_dma_ops(struct bus_type *bus)
diff --git a/arch/x86/include/asm/iommu.h b/arch/x86/include/asm/iommu.h
index dba89ed40d38d..0bef44d30a278 100644
--- a/arch/x86/include/asm/iommu.h
+++ b/arch/x86/include/asm/iommu.h
@@ -8,6 +8,8 @@
 
 extern int force_iommu, no_iommu;
 extern int iommu_detected;
+extern int iommu_merge;
+extern int panic_on_overflow;
 
 #ifdef CONFIG_SWIOTLB
 extern bool x86_swiotlb_enable;
-- 
2.30.2


