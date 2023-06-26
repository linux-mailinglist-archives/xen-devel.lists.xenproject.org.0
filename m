Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E8B73D66D
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:39:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555007.866578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4r-0006Ao-Qj; Mon, 26 Jun 2023 03:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555007.866578; Mon, 26 Jun 2023 03:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4r-00061n-CG; Mon, 26 Jun 2023 03:39:45 +0000
Received: by outflank-mailman (input) for mailman id 555007;
 Mon, 26 Jun 2023 03:39:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd2Q-0007ej-PM
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:37:14 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id bd598d93-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:37:13 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A0401FB;
 Sun, 25 Jun 2023 20:37:57 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B249C3F64C;
 Sun, 25 Jun 2023 20:37:10 -0700 (PDT)
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
X-Inumbo-ID: bd598d93-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 40/52] xen/mpu: implement remove_early_mappings in MPU system
Date: Mon, 26 Jun 2023 11:34:31 +0800
Message-Id: <20230626033443.2943270-41-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We implement remove_early_mappings() to remove early mappings of
FDT in MPU system.

When mapping FDT in early_fdt_map(), we mapped the first 2MB firstly,
and check the size and then map with an extra 2MB if needed. So the
unmapping shall follow the same strategy.

In MMU, we could use fixed virtual address to remove the mapping.
As it is not workable for MPU, we pass the FDT physical address
in remove_early_mappings() for MPU to destroy the mapping.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- adapt to the change of mapping FDT in two 2MB chunks if needed
---
 xen/arch/arm/include/asm/mm.h |  2 +-
 xen/arch/arm/mmu/mm.c         |  2 +-
 xen/arch/arm/mpu/mm.c         | 15 +++++++++++++++
 xen/arch/arm/setup.c          |  3 +--
 4 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 0352182d99..2b119a87da 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -209,7 +209,7 @@ extern bool flags_has_rwx(unsigned int flags);
 /* Map FDT in boot pagetable */
 extern void *early_fdt_map(paddr_t fdt_paddr);
 /* Remove early mappings */
-extern void remove_early_mappings(void);
+extern void remove_early_mappings(paddr_t dtb_paddr);
 /*
  * Allocate and initialise memory mapping for a secondary CPU.
  * Sets init_mm to the new memory mapping table
diff --git a/xen/arch/arm/mmu/mm.c b/xen/arch/arm/mmu/mm.c
index 4196a55c32..f37912d066 100644
--- a/xen/arch/arm/mmu/mm.c
+++ b/xen/arch/arm/mmu/mm.c
@@ -361,7 +361,7 @@ lpae_t pte_of_xenaddr(vaddr_t va)
     return mfn_to_xen_entry(maddr_to_mfn(ma), MT_NORMAL);
 }
 
-void __init remove_early_mappings(void)
+void __init remove_early_mappings(paddr_t dtb_paddr)
 {
     int rc;
 
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 79d1c10d05..27d924e449 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -20,9 +20,11 @@
  */
 
 #include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/mm.h>
 #include <xen/page-size.h>
 #include <xen/pfn.h>
+#include <xen/sizes.h>
 #include <asm/arm64/mpu.h>
 #include <asm/page.h>
 #include <asm/setup.h>
@@ -857,6 +859,19 @@ bool is_mm_range_mapped_transient(paddr_t pa, paddr_t len)
     return false;
 }
 
+void __init remove_early_mappings(paddr_t dtb_paddr)
+{
+    paddr_t pa = dtb_paddr & PAGE_MASK, offset = dtb_paddr % PAGE_SIZE;
+    uint32_t size = fdt_totalsize(maddr_to_virt(dtb_paddr));
+
+    if ( xen_mpumap_update(pa, pa + SZ_2M, 0) )
+        panic("Unable to destroy early Device-Tree mapping.\n");
+
+    if ( (offset + size) > SZ_2M )
+        if ( xen_mpumap_update(pa + SZ_2M, pa + SZ_2M + SZ_2M, 0) )
+            panic("Unable to destroy early Device-Tree mapping.\n");
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index c21d1db763..200fa6eb53 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -529,8 +529,6 @@ void __init discard_initial_modules(void)
 
         mi->nr_mods = 0;
     }
-
-    remove_early_mappings();
 }
 
 /* Relocate the FDT in Xen heap */
@@ -973,6 +971,7 @@ void __init start_xen(unsigned long boot_phys_offset,
      * will be scrubbed (unless suppressed).
      */
     discard_initial_modules();
+    remove_early_mappings(fdt_paddr);
 
     heap_init_late();
 
-- 
2.25.1


