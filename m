Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D32D373D68E
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:40:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555086.866849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5l-0003HH-6U; Mon, 26 Jun 2023 03:40:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555086.866849; Mon, 26 Jun 2023 03:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5j-0002Yk-VC; Mon, 26 Jun 2023 03:40:39 +0000
Received: by outflank-mailman (input) for mailman id 555086;
 Mon, 26 Jun 2023 03:40:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd1m-0007ej-DR
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:36:34 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a5415410-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:36:33 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0A9C1FB;
 Sun, 25 Jun 2023 20:37:16 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 44BE13F64C;
 Sun, 25 Jun 2023 20:36:30 -0700 (PDT)
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
X-Inumbo-ID: a5415410-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 27/52] xen/mpu: introduce setup_mm_mappings
Date: Mon, 26 Jun 2023 11:34:18 +0800
Message-Id: <20230626033443.2943270-28-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function setup_pagetables is responsible for boot-time pagetable setup
in MMU system at C world.
In MPU system, as we have already built up start-of-day Xen MPU memory
region mapping in assembly boot-time, here we only need to do a few
memory management data initializtion, including reading the number of
maximum MPU regions supported by the EL2 MPU, and setting the according
bitfield for regions enabled in assembly boot-time, in bitmap xen_mpumap_mask.
This bitmap xen_mpumap_mask is responsible for recording the usage of EL2 MPU
memory regions.

In order to keep only one codeflow in arm/setup.c, setup_mm_mappings
, with a more generic name, is introduced to replace setup_pagetables.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- introduce bitmap xen_mpumap_mask for dynamic allocation on MPU regions
---
 xen/arch/arm/include/asm/arm64/mpu.h     |  1 +
 xen/arch/arm/include/asm/arm64/sysregs.h |  3 +++
 xen/arch/arm/include/asm/mm.h            |  4 ++--
 xen/arch/arm/mmu/mm.c                    |  7 +++++-
 xen/arch/arm/mpu/mm.c                    | 30 ++++++++++++++++++++++++
 xen/arch/arm/setup.c                     |  2 +-
 6 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index 6ec2c10b14..407fec66c9 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -19,6 +19,7 @@
  * or it needs adjustment.
  */
 #define REGION_UART_SEL            0x07
+#define MPUIR_REGION_MASK          ((_AC(1, UL) << 8) - 1)
 
 #ifndef __ASSEMBLY__
 
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index c41d805fde..a249a660a8 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -474,6 +474,9 @@
 /* MPU Protection Region Selection Register encode */
 #define PRSELR_EL2  S3_4_C6_C2_1
 
+/* MPU Type registers encode */
+#define MPUIR_EL2   S3_4_C0_C0_4
+
 #endif
 
 /* Access to system registers */
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 5d890a6a45..eb520b49e3 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -201,8 +201,8 @@ extern unsigned long total_pages;
 
 extern uint64_t init_mm;
 
-/* Boot-time pagetable setup */
-extern void setup_pagetables(unsigned long boot_phys_offset);
+/* Boot-time memory mapping setup */
+extern void setup_mm_mappings(unsigned long boot_phys_offset);
 /* Map FDT in boot pagetable */
 extern void *early_fdt_map(paddr_t fdt_paddr);
 /* Remove early mappings */
diff --git a/xen/arch/arm/mmu/mm.c b/xen/arch/arm/mmu/mm.c
index 43c19fa914..d7d5bf7287 100644
--- a/xen/arch/arm/mmu/mm.c
+++ b/xen/arch/arm/mmu/mm.c
@@ -398,7 +398,7 @@ static void clear_table(void *table)
 
 /* Boot-time pagetable setup.
  * Changes here may need matching changes in head.S */
-void __init setup_pagetables(unsigned long boot_phys_offset)
+static void __init setup_pagetables(unsigned long boot_phys_offset)
 {
     uint64_t ttbr;
     lpae_t pte, *p;
@@ -470,6 +470,11 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
 #endif
 }
 
+void setup_mm_mappings(unsigned long boot_phys_offset)
+{
+    setup_pagetables(boot_phys_offset);
+}
+
 static void clear_boot_pagetables(void)
 {
     /*
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index fb6bb721b1..e06a6e5810 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -20,6 +20,7 @@
  */
 
 #include <xen/init.h>
+#include <xen/mm.h>
 #include <xen/page-size.h>
 #include <asm/arm64/mpu.h>
 
@@ -27,6 +28,35 @@
 pr_t __aligned(PAGE_SIZE) __section(".data.page_aligned")
      xen_mpumap[ARM_MAX_MPU_MEMORY_REGIONS];
 
+/* Maximum number of supported MPU memory regions by the EL2 MPU. */
+uint8_t __ro_after_init max_xen_mpumap;
+
+/*
+ * Bitmap xen_mpumap_mask is to record the usage of EL2 MPU memory regions.
+ * Bit 0 represents MPU memory region 0, bit 1 represents MPU memory
+ * region 1, ..., and so on.
+ * If a MPU memory region gets enabled, set the according bit to 1.
+ */
+static DECLARE_BITMAP(xen_mpumap_mask, ARM_MAX_MPU_MEMORY_REGIONS);
+
+void __init setup_mm_mappings(unsigned long boot_phys_offset)
+{
+    unsigned int nr_regions = REGION_UART_SEL, i = 0;
+
+    /*
+     * MPUIR_EL2.Region[0:7] identifies the number of regions supported by
+     * the EL2 MPU.
+     */
+    max_xen_mpumap = (uint8_t)(READ_SYSREG(MPUIR_EL2) & MPUIR_REGION_MASK);
+
+    /* Set the bitfield for regions enabled in assembly boot-time. */
+#ifdef CONFIG_EARLY_PRINTK
+    nr_regions = REGION_UART_SEL + 1;
+#endif
+    for ( ; i < nr_regions; i++ )
+        set_bit(i, xen_mpumap_mask);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 6f8dd98d6b..f42b53d17b 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -781,7 +781,7 @@ void __init start_xen(unsigned long boot_phys_offset,
     /* Initialize traps early allow us to get backtrace when an error occurred */
     init_traps();
 
-    setup_pagetables(boot_phys_offset);
+    setup_mm_mappings(boot_phys_offset);
 
     smp_clear_cpu_maps();
 
-- 
2.25.1


