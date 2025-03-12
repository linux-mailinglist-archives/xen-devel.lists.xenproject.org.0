Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E65EEA5DE69
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 14:53:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910340.1317122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsMWL-00081A-A2; Wed, 12 Mar 2025 13:53:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910340.1317122; Wed, 12 Mar 2025 13:53:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsMWL-0007wX-5B; Wed, 12 Mar 2025 13:53:17 +0000
Received: by outflank-mailman (input) for mailman id 910340;
 Wed, 12 Mar 2025 13:53:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FzNf=V7=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tsMWJ-0006ux-EH
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 13:53:15 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 57e1c12b-ff49-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 14:53:14 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C05D8152B;
 Wed, 12 Mar 2025 06:53:24 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 100F63F5A1;
 Wed, 12 Mar 2025 06:53:12 -0700 (PDT)
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
X-Inumbo-ID: 57e1c12b-ff49-11ef-9ab9-95dc52dad729
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 05/10] arm/mpu: Introduce frame_table, virt_to_page, maddr_to_virt
Date: Wed, 12 Mar 2025 13:52:53 +0000
Message-Id: <20250312135258.1815706-6-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312135258.1815706-1-luca.fancellu@arm.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce variables and functions used in the common Arm code by
MPU memory management subsystem, provide struct page_info and
the MPU implementation for helpers and macros used in the common
arm code.

Moving virt_to_page helper to mmu/mpu part is not easy as it needs
visibility of 'struct page_info', so protect it with CONFIG_MMU
and provide the MPU variant in the #else branch.

Introduce FRAMETABLE_NR that is required for 'pdx_group_valid' in
pdx.c.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/include/asm/mm.h         | 18 ++++++++++++++++++
 xen/arch/arm/include/asm/mpu/layout.h |  3 +++
 xen/arch/arm/include/asm/mpu/mm.h     |  3 +++
 xen/arch/arm/mpu/mm.c                 |  4 ++++
 4 files changed, 28 insertions(+)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index e7767cdab493..c96d33aceaf0 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -341,6 +341,8 @@ static inline uint64_t gvirt_to_maddr(vaddr_t va, paddr_t *pa,
 #define virt_to_mfn(va)     __virt_to_mfn(va)
 #define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
 
+#ifdef CONFIG_MMU
+
 /* Convert between Xen-heap virtual addresses and page-info structures. */
 static inline struct page_info *virt_to_page(const void *v)
 {
@@ -355,6 +357,22 @@ static inline struct page_info *virt_to_page(const void *v)
     return frame_table + pdx - frametable_base_pdx;
 }
 
+#else /* !CONFIG_MMU */
+
+/* Convert between virtual address to page-info structure. */
+static inline struct page_info *virt_to_page(const void *v)
+{
+    unsigned long pdx;
+
+    pdx = paddr_to_pdx(virt_to_maddr(v));
+    ASSERT(pdx >= frametable_base_pdx);
+    ASSERT(pdx < frametable_pdx_end);
+
+    return frame_table + pdx - frametable_base_pdx;
+}
+
+#endif /* CONFIG_MMU */
+
 static inline void *page_to_virt(const struct page_info *pg)
 {
     return mfn_to_virt(mfn_x(page_to_mfn(pg)));
diff --git a/xen/arch/arm/include/asm/mpu/layout.h b/xen/arch/arm/include/asm/mpu/layout.h
index 248e55f8882d..c46b634c9c15 100644
--- a/xen/arch/arm/include/asm/mpu/layout.h
+++ b/xen/arch/arm/include/asm/mpu/layout.h
@@ -3,6 +3,9 @@
 #ifndef __ARM_MPU_LAYOUT_H__
 #define __ARM_MPU_LAYOUT_H__
 
+#define FRAMETABLE_SIZE   GB(32)
+#define FRAMETABLE_NR     (FRAMETABLE_SIZE / sizeof(*frame_table))
+
 #define XEN_START_ADDRESS CONFIG_XEN_START_ADDRESS
 
 /*
diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index 57f1e558fd44..2219c9979548 100644
--- a/xen/arch/arm/include/asm/mpu/mm.h
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -5,6 +5,9 @@
 
 #include <xen/macros.h>
 
+extern struct page_info *frame_table;
+extern unsigned long frametable_pdx_end;
+
 #define virt_to_maddr(va) ({  \
     (paddr_t)va;              \
 })
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index a11e017d8a96..4036dd62eeeb 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -3,6 +3,10 @@
 #include <xen/lib.h>
 #include <xen/init.h>
 #include <xen/sizes.h>
+#include <xen/mm.h>
+
+struct page_info *frame_table;
+unsigned long __read_mostly frametable_pdx_end;
 
 static void __init __maybe_unused build_assertions(void)
 {
-- 
2.34.1


