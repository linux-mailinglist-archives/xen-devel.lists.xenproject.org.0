Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16808668B59
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:30:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476498.738729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCdV-0006iA-TN; Fri, 13 Jan 2023 05:29:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476498.738729; Fri, 13 Jan 2023 05:29:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCdV-0006fc-QL; Fri, 13 Jan 2023 05:29:53 +0000
Received: by outflank-mailman (input) for mailman id 476498;
 Fri, 13 Jan 2023 05:29:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCdT-0005sP-Sg
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:29:51 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 4c66a87e-9303-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 06:29:49 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C4AD13D5;
 Thu, 12 Jan 2023 21:30:31 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EC0E93F587;
 Thu, 12 Jan 2023 21:29:46 -0800 (PST)
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
X-Inumbo-ID: 4c66a87e-9303-11ed-b8d0-410ff93cb8f0
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 03/40] xen/arm: adjust Xen TLB helpers for Armv8-R64 PMSA
Date: Fri, 13 Jan 2023 13:28:36 +0800
Message-Id: <20230113052914.3845596-4-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

From Arm ARM Supplement of Armv8-R AArch64 (DDI 0600A) [1],
section D1.6.2 TLB maintenance instructions, we know that
Armv8-R AArch64 permits an implementation to cache stage 1
VMSAv8-64 and stage 2 PMSAv8-64 attributes as a common entry
for the Secure EL1&0 translation regime. But for Xen itself,
it's running with stage 1 PMSAv8-64 on Armv8-R AArch64. The
EL2 MPU updates for stage 1 PMSAv8-64 will not be cached in
TLB entries. So we don't need any TLB invalidation for Xen
itself in EL2.

So in this patch, we use empty macros to stub Xen TLB helpers
for MPU system (PMSA), but still keep the Guest TLB helpers.
Because when a guest running in EL1 with VMSAv8-64 (MMU), guest
TLB invalidation is still needed. But we need some policy to
distinguish MPU and MMU guest, this will be done in guest
support of Armv8-R AArch64 later.

[1] https://developer.arm.com/documentation/ddi0600/ac

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. No change.
---
 xen/arch/arm/include/asm/arm64/flushtlb.h | 25 +++++++++++++++++++++++
 xen/arch/arm/include/asm/flushtlb.h       | 22 ++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
index 7c54315187..fe445f6831 100644
--- a/xen/arch/arm/include/asm/arm64/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
@@ -51,6 +51,8 @@ TLB_HELPER(flush_all_guests_tlb_local, alle1);
 /* Flush innershareable TLBs, all VMIDs, non-hypervisor mode */
 TLB_HELPER(flush_all_guests_tlb, alle1is);
 
+#ifndef CONFIG_HAS_MPU
+
 /* Flush all hypervisor mappings from the TLB of the local processor. */
 TLB_HELPER(flush_xen_tlb_local, alle2);
 
@@ -66,6 +68,29 @@ static inline void __flush_xen_tlb_one(vaddr_t va)
     asm volatile("tlbi vae2is, %0;" : : "r" (va>>PAGE_SHIFT) : "memory");
 }
 
+#else
+
+/*
+ * When Xen is running with stage 1 PMSAv8-64 on MPU systems. The EL2 MPU
+ * updates for stage1 PMSAv8-64 will not be cached in TLB entries. So we
+ * don't need any TLB invalidation for Xen itself in EL2. See Arm ARM
+ * Supplement of Armv8-R AArch64 (DDI 0600A), section D1.6.2 TLB maintenance
+ * instructions for more details.
+ */
+static inline void flush_xen_tlb_local(void)
+{
+}
+
+static inline void  __flush_xen_tlb_one_local(vaddr_t va)
+{
+}
+
+static inline void __flush_xen_tlb_one(vaddr_t va)
+{
+}
+
+#endif /* CONFIG_HAS_MPU */
+
 #endif /* __ASM_ARM_ARM64_FLUSHTLB_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/flushtlb.h b/xen/arch/arm/include/asm/flushtlb.h
index 125a141975..4b8bf65281 100644
--- a/xen/arch/arm/include/asm/flushtlb.h
+++ b/xen/arch/arm/include/asm/flushtlb.h
@@ -28,6 +28,7 @@ static inline void page_set_tlbflush_timestamp(struct page_info *page)
 /* Flush specified CPUs' TLBs */
 void arch_flush_tlb_mask(const cpumask_t *mask);
 
+#ifndef CONFIG_HAS_MPU
 /*
  * Flush a range of VA's hypervisor mappings from the TLB of the local
  * processor.
@@ -66,6 +67,27 @@ static inline void flush_xen_tlb_range_va(vaddr_t va,
     isb();
 }
 
+#else
+
+/*
+ * When Xen is running with stage 1 PMSAv8-64 on MPU systems. The EL2 MPU
+ * updates for stage1 PMSAv8-64 will not be cached in TLB entries. So we
+ * don't need any TLB invalidation for Xen itself in EL2. See Arm ARM
+ * Supplement of Armv8-R AArch64 (DDI 0600A), section D1.6.2 TLB maintenance
+ * instructions for more details.
+ */
+static inline void flush_xen_tlb_range_va_local(vaddr_t va,
+                                                unsigned long size)
+{
+}
+
+static inline void flush_xen_tlb_range_va(vaddr_t va,
+                                          unsigned long size)
+{
+}
+
+#endif /* CONFIG_HAS_MPU */
+
 #endif /* __ASM_ARM_FLUSHTLB_H__ */
 /*
  * Local variables:
-- 
2.25.1


