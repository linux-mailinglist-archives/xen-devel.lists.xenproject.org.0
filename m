Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1785E73D67F
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:40:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555057.866739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5L-0005QJ-VJ; Mon, 26 Jun 2023 03:40:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555057.866739; Mon, 26 Jun 2023 03:40:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5L-00054m-0e; Mon, 26 Jun 2023 03:40:15 +0000
Received: by outflank-mailman (input) for mailman id 555057;
 Mon, 26 Jun 2023 03:40:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd1p-0007ej-4G
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:36:37 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a719f79e-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:36:36 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 136B41FB;
 Sun, 25 Jun 2023 20:37:20 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 604803F64C;
 Sun, 25 Jun 2023 20:36:33 -0700 (PDT)
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
X-Inumbo-ID: a719f79e-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 28/52] xen/mpu: plump virt/maddr conversion in MPU system
Date: Mon, 26 Jun 2023 11:34:19 +0800
Message-Id: <20230626033443.2943270-29-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virt_to_maddr and maddr_to_virt are used widely in Xen code. So
even there is no VMSA in MPU system, we keep the interface in MPU to
stay the same code flow.

The MPU version of virt/maddr conversion is simple, and we just return
the input address as the output with type conversion.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- Fix typos
- Move the implementation from mm/mpu.h to mm.h, to share as much as
possible with MMU system.
---
 xen/arch/arm/include/asm/mm.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index eb520b49e3..ea4847c12b 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -267,13 +267,22 @@ static inline void __iomem *ioremap_wc(paddr_t start, size_t len)
 /* Page-align address and convert to frame number format */
 #define paddr_to_pfn_aligned(paddr)    paddr_to_pfn(PAGE_ALIGN(paddr))
 
+#ifndef CONFIG_HAS_MPU
 static inline paddr_t __virt_to_maddr(vaddr_t va)
 {
     uint64_t par = va_to_par(va);
     return (par & PADDR_MASK & PAGE_MASK) | (va & ~PAGE_MASK);
 }
+#else
+static inline paddr_t __virt_to_maddr(vaddr_t va)
+{
+    return (paddr_t)va;
+}
+#endif /* CONFIG_HAS_MPU */
+
 #define virt_to_maddr(va)   __virt_to_maddr((vaddr_t)(va))
 
+#ifndef CONFIG_HAS_MPU
 #ifdef CONFIG_ARM_32
 static inline void *maddr_to_virt(paddr_t ma)
 {
@@ -292,6 +301,12 @@ static inline void *maddr_to_virt(paddr_t ma)
                      ((ma & ma_top_mask) >> pfn_pdx_hole_shift)));
 }
 #endif
+#else /* CONFIG_HAS_MPU */
+static inline void *maddr_to_virt(paddr_t ma)
+{
+    return (void *)(unsigned long)ma;
+}
+#endif
 
 /*
  * Translate a guest virtual address to a machine address.
-- 
2.25.1


