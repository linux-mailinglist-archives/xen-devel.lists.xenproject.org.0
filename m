Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 216CB73D690
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:40:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555101.866890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5t-0005Sb-E8; Mon, 26 Jun 2023 03:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555101.866890; Mon, 26 Jun 2023 03:40:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5s-0005Cr-IC; Mon, 26 Jun 2023 03:40:48 +0000
Received: by outflank-mailman (input) for mailman id 555101;
 Mon, 26 Jun 2023 03:40:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd1z-0000HH-Su
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:36:47 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id acb2b9d8-13d2-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 05:36:45 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FEB22F4;
 Sun, 25 Jun 2023 20:37:29 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B83B73F64C;
 Sun, 25 Jun 2023 20:36:42 -0700 (PDT)
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
X-Inumbo-ID: acb2b9d8-13d2-11ee-8611-37d641c3527e
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 31/52] xen/mpu: make early_fdt_map support in MPU systems
Date: Mon, 26 Jun 2023 11:34:22 +0800
Message-Id: <20230626033443.2943270-32-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In MPU system, MPU memory region is always mapped PAGE_ALIGN, so in order to
not access unexpected memory area, dtb section in xen.lds.S should be made
page-aligned too.
We add . = ALIGN(PAGE_SIZE); in the head of dtb section to make it happen.

In this commit, we map early FDT with a transient MPU memory region, as
it will be relocated into heap and unmapped at the end of boot.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- map the first 2MB. Check the size and then re-map with an extra 2MB if needed
---
 xen/arch/arm/include/asm/arm64/mpu.h |  3 ++-
 xen/arch/arm/include/asm/page.h      |  5 +++++
 xen/arch/arm/mm.c                    | 26 ++++++++++++++++++++------
 xen/arch/arm/mpu/mm.c                |  1 +
 xen/arch/arm/xen.lds.S               |  5 ++++-
 5 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index a6b07bab02..715ea69884 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -72,7 +72,8 @@ typedef union {
         unsigned long ns:1;     /* Not-Secure */
         unsigned long res:1;    /* Reserved 0 by hardware */
         unsigned long limit:42; /* Limit Address */
-        unsigned long pad:16;
+        unsigned long pad:15;
+        unsigned long tran:1;   /* Transient region */
     } reg;
     uint64_t bits;
 } prlar_t;
diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/page.h
index 85ecd5e4de..a434e2205a 100644
--- a/xen/arch/arm/include/asm/page.h
+++ b/xen/arch/arm/include/asm/page.h
@@ -97,19 +97,24 @@
  * [3:4] Execute Never
  * [5:6] Access Permission
  * [7]   Region Present
+ * [8]   Transient Region, e.g. MPU memory region is temproraily
+ *                              mapped for a short time
  */
 #define _PAGE_AI_BIT            0
 #define _PAGE_XN_BIT            3
 #define _PAGE_AP_BIT            5
 #define _PAGE_PRESENT_BIT       7
+#define _PAGE_TRANSIENT_BIT     8
 #define _PAGE_AI                (7U << _PAGE_AI_BIT)
 #define _PAGE_XN                (2U << _PAGE_XN_BIT)
 #define _PAGE_RO                (2U << _PAGE_AP_BIT)
 #define _PAGE_PRESENT           (1U << _PAGE_PRESENT_BIT)
+#define _PAGE_TRANSIENT         (1U << _PAGE_TRANSIENT_BIT)
 #define PAGE_AI_MASK(x)         (((x) >> _PAGE_AI_BIT) & 0x7U)
 #define PAGE_XN_MASK(x)         (((x) >> _PAGE_XN_BIT) & 0x3U)
 #define PAGE_AP_MASK(x)         (((x) >> _PAGE_AP_BIT) & 0x3U)
 #define PAGE_RO_MASK(x)         (((x) >> _PAGE_AP_BIT) & 0x2U)
+#define PAGE_TRANSIENT_MASK(x)  (((x) >> _PAGE_TRANSIENT_BIT) & 0x1U)
 #endif /* CONFIG_HAS_MPU */
 
 /*
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index d35e7e280f..8625066256 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -61,8 +61,17 @@ void flush_page_to_ram(unsigned long mfn, bool sync_icache)
 
 void * __init early_fdt_map(paddr_t fdt_paddr)
 {
+#ifndef CONFIG_HAS_MPU
     /* We are using 2MB superpage for mapping the FDT */
     paddr_t base_paddr = fdt_paddr & SECOND_MASK;
+    unsigned int flags = PAGE_HYPERVISOR_RO | _PAGE_BLOCK;
+    unsigned long base_virt = BOOT_FDT_VIRT_START;
+#else
+    /* MPU region must be PAGE aligned */
+    paddr_t base_paddr = fdt_paddr & PAGE_MASK;
+    unsigned int flags = PAGE_HYPERVISOR_RO | _PAGE_TRANSIENT;
+    unsigned long base_virt = ~0UL;
+#endif
     paddr_t offset;
     void *fdt_virt;
     uint32_t size;
@@ -79,18 +88,24 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
     if ( !fdt_paddr || fdt_paddr % MIN_FDT_ALIGN )
         return NULL;
 
+#ifndef CONFIG_HAS_MPU
     /* The FDT is mapped using 2MB superpage */
     BUILD_BUG_ON(BOOT_FDT_VIRT_START % SZ_2M);
+#endif
 
-    rc = map_pages_to_xen(BOOT_FDT_VIRT_START, maddr_to_mfn(base_paddr),
-                          SZ_2M >> PAGE_SHIFT,
-                          PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
+    rc = map_pages_to_xen(base_virt, maddr_to_mfn(base_paddr),
+                          SZ_2M >> PAGE_SHIFT, flags);
     if ( rc )
         panic("Unable to map the device-tree.\n");
 
 
+#ifndef CONFIG_HAS_MPU
     offset = fdt_paddr % SECOND_SIZE;
     fdt_virt = (void *)BOOT_FDT_VIRT_START + offset;
+#else
+    offset = fdt_paddr % PAGE_SIZE;
+    fdt_virt = (void *)fdt_paddr;
+#endif
 
     if ( fdt_magic(fdt_virt) != FDT_MAGIC )
         return NULL;
@@ -101,10 +116,9 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
 
     if ( (offset + size) > SZ_2M )
     {
-        rc = map_pages_to_xen(BOOT_FDT_VIRT_START + SZ_2M,
+        rc = map_pages_to_xen(base_virt + SZ_2M,
                               maddr_to_mfn(base_paddr + SZ_2M),
-                              SZ_2M >> PAGE_SHIFT,
-                              PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
+                              SZ_2M >> PAGE_SHIFT, flags);
         if ( rc )
             panic("Unable to map the device-tree\n");
     }
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 14a1309ca1..f4ce19d36a 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -448,6 +448,7 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
         /* Set permission */
         xen_mpumap[idx].prbar.reg.ap = PAGE_AP_MASK(flags);
         xen_mpumap[idx].prbar.reg.xn = PAGE_XN_MASK(flags);
+        xen_mpumap[idx].prlar.reg.tran = PAGE_TRANSIENT_MASK(flags);
 
         write_protection_region((const pr_t*)(&xen_mpumap[idx]), idx);
     }
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 4f7daa7dca..f2715d7cb7 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -216,7 +216,10 @@ SECTIONS
   _end = . ;
 
   /* Section for the device tree blob (if any). */
-  .dtb : { *(.dtb) } :text
+  .dtb : {
+      . = ALIGN(PAGE_SIZE);
+      *(.dtb)
+  } :text
 
   DWARF2_DEBUG_SECTIONS
 
-- 
2.25.1


