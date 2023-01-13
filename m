Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E492668B8F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:36:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476642.739120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjy-0000m7-S8; Fri, 13 Jan 2023 05:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476642.739120; Fri, 13 Jan 2023 05:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjy-0000dE-Gz; Fri, 13 Jan 2023 05:36:34 +0000
Received: by outflank-mailman (input) for mailman id 476642;
 Fri, 13 Jan 2023 05:36:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCeX-0005sP-BN
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:30:57 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 73673be4-9303-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 06:30:55 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C178BFEC;
 Thu, 12 Jan 2023 21:31:36 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0F3863F587;
 Thu, 12 Jan 2023 21:30:51 -0800 (PST)
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
X-Inumbo-ID: 73673be4-9303-11ed-b8d0-410ff93cb8f0
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 25/40] xen/mpu: map MPU guest memory section before static memory initialization
Date: Fri, 13 Jan 2023 13:28:58 +0800
Message-Id: <20230113052914.3845596-26-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previous commit introduces a new device tree property
"mpu,guest-memory-section" to define MPU guest memory section, which
will mitigate the scattering of statically-configured guest RAM.

We only need to set up MPU memory region mapping for MPU guest memory section
to have access to all guest RAM.
And this should happen before static memory initialization(init_staticmem_pages())

MPU memory region for MPU guest memory secction gets switched out when
idle vcpu leaving, to avoid region overlapping if the vcpu enters into guest
mode later. On the contrary, it gets switched in when idle vcpu entering.
We introduce a bit in region "region.prlar.sw"(struct pr_t region) to
indicate this kind of feature.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/include/asm/arm64/mpu.h | 14 ++++++---
 xen/arch/arm/mm_mpu.c                | 47 +++++++++++++++++++++++++---
 2 files changed, 53 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index b85e420a90..0044bbf05d 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -45,22 +45,26 @@
  * [3:4] Execute Never
  * [5:6] Access Permission
  * [7]   Region Present
- * [8]   Boot-only Region
+ * [8:9] 0b00: Fixed Region; 0b01: Boot-only Region;
+ *       0b10: Region needs switching out/in during vcpu context switch;
  */
 #define _REGION_AI_BIT            0
 #define _REGION_XN_BIT            3
 #define _REGION_AP_BIT            5
 #define _REGION_PRESENT_BIT       7
-#define _REGION_BOOTONLY_BIT      8
+#define _REGION_TRANSIENT_BIT     8
 #define _REGION_XN                (2U << _REGION_XN_BIT)
 #define _REGION_RO                (2U << _REGION_AP_BIT)
 #define _REGION_PRESENT           (1U << _REGION_PRESENT_BIT)
-#define _REGION_BOOTONLY          (1U << _REGION_BOOTONLY_BIT)
+#define _REGION_BOOTONLY          (1U << _REGION_TRANSIENT_BIT)
+#define _REGION_SWITCH            (2U << _REGION_TRANSIENT_BIT)
 #define REGION_AI_MASK(x)         (((x) >> _REGION_AI_BIT) & 0x7U)
 #define REGION_XN_MASK(x)         (((x) >> _REGION_XN_BIT) & 0x3U)
 #define REGION_AP_MASK(x)         (((x) >> _REGION_AP_BIT) & 0x3U)
 #define REGION_RO_MASK(x)         (((x) >> _REGION_AP_BIT) & 0x2U)
 #define REGION_BOOTONLY_MASK(x)   (((x) >> _REGION_BOOTONLY_BIT) & 0x1U)
+#define REGION_SWITCH_MASK(x)     (((x) >> _REGION_TRANSIENT_BIT) & 0x2U)
+#define REGION_TRANSIENT_MASK(x)  (((x) >> _REGION_TRANSIENT_BIT) & 0x3U)
 
 /*
  * _REGION_NORMAL is convenience define. It is not meant to be used
@@ -73,6 +77,7 @@
 
 #define REGION_HYPERVISOR         REGION_HYPERVISOR_RW
 #define REGION_HYPERVISOR_BOOT    (REGION_HYPERVISOR_RW|_REGION_BOOTONLY)
+#define REGION_HYPERVISOR_SWITCH  (REGION_HYPERVISOR_RW|_REGION_SWITCH)
 
 #define INVALID_REGION            (~0UL)
 
@@ -98,7 +103,8 @@ typedef union {
         unsigned long ns:1;     /* Not-Secure */
         unsigned long res:1;    /* Reserved 0 by hardware */
         unsigned long limit:42; /* Limit Address */
-        unsigned long pad:16;
+        unsigned long pad:15;
+        unsigned long sw:1;     /* Region gets switched out/in during vcpu context switch? */
     } reg;
     uint64_t bits;
 } prlar_t;
diff --git a/xen/arch/arm/mm_mpu.c b/xen/arch/arm/mm_mpu.c
index 7b282be4fb..d2e19e836c 100644
--- a/xen/arch/arm/mm_mpu.c
+++ b/xen/arch/arm/mm_mpu.c
@@ -71,6 +71,10 @@ static paddr_t dtb_paddr;
 
 struct page_info *frame_table;
 
+static const unsigned int mpu_section_mattr[MSINFO_MAX] = {
+    REGION_HYPERVISOR_SWITCH,
+};
+
 /* Write a MPU protection region */
 #define WRITE_PROTECTION_REGION(sel, pr, prbar_el2, prlar_el2) ({       \
     uint64_t _sel = sel;                                                \
@@ -414,10 +418,13 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
         if ( system_state <= SYS_STATE_active )
         {
             /*
-             * If it is a boot-only region (i.e. region for early FDT),
-             * it shall be added from the tail for late init re-organizing
+             * If it is a transient region, including boot-only region
+             * (i.e. region for early FDT), and region which needs switching
+             * in/out during vcpu context switch(i.e. region for guest memory
+             * section), it shall be added from the tail for late init
+             * re-organizing
              */
-            if ( REGION_BOOTONLY_MASK(flags) )
+            if ( REGION_TRANSIENT_MASK(flags) )
                 idx = next_transient_region_idx;
             else
                 idx = next_fixed_region_idx;
@@ -427,6 +434,13 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
         /* Set permission */
         xen_mpumap[idx].prbar.reg.ap = REGION_AP_MASK(flags);
         xen_mpumap[idx].prbar.reg.xn = REGION_XN_MASK(flags);
+        /*
+         * Bit sw indicates that region gets switched out when idle vcpu
+         * leaving hypervisor mode, and region gets switched in when idle vcpu
+         * entering hypervisor mode.
+         */
+        if ( REGION_SWITCH_MASK(flags) )
+            xen_mpumap[idx].prlar.reg.sw = 1;
 
         /* Update and enable the region */
         access_protection_region(false, NULL, (const pr_t*)(&xen_mpumap[idx]),
@@ -552,6 +566,29 @@ static void __init setup_staticheap_mappings(void)
     }
 }
 
+static void __init map_mpu_memory_section_on_boot(enum mpu_section_info type,
+                                                  unsigned int flags)
+{
+    unsigned int i = 0;
+
+    for ( ; i < mpuinfo.sections[type].nr_banks; i++ )
+    {
+        paddr_t start = round_pgup(
+                        mpuinfo.sections[type].bank[i].start);
+        paddr_t size = round_pgdown(mpuinfo.sections[type].bank[i].size);
+
+        /*
+         * Map MPU memory section with transient MPU memory region,
+         * as they are either boot-only, or will be switched out/in
+         * during vcpu context switch(i.e. guest memory section).
+         */
+        if ( map_pages_to_xen(start, maddr_to_mfn(start), size >> PAGE_SHIFT,
+                              flags) )
+            panic("mpu: failed to map MPU memory section %s\n",
+                  mpu_section_info_str[type]);
+    }
+}
+
 /*
  * System RAM is statically partitioned into different functionality
  * section in Device Tree, including static xenheap, guest memory
@@ -563,7 +600,9 @@ void __init setup_static_mappings(void)
 {
     setup_staticheap_mappings();
 
-    /* TODO: guest memory section, device memory section, boot-module section, etc */
+    for ( uint8_t i = MSINFO_GUEST; i < MSINFO_MAX; i++ )
+        map_mpu_memory_section_on_boot(i, mpu_section_mattr[i]);
+    /* TODO: device memory section, boot-module section, etc */
 }
 
 /* Map a frame table to cover physical addresses ps through pe */
-- 
2.25.1


