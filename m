Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4975D668B8C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:36:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476636.739100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjv-0007yl-0g; Fri, 13 Jan 2023 05:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476636.739100; Fri, 13 Jan 2023 05:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjt-0007iT-V6; Fri, 13 Jan 2023 05:36:29 +0000
Received: by outflank-mailman (input) for mailman id 476636;
 Fri, 13 Jan 2023 05:36:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCf5-0005sP-Dh
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:31:31 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 87c8b44c-9303-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 06:31:29 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7EFAFEC;
 Thu, 12 Jan 2023 21:32:10 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 35CBE3F587;
 Thu, 12 Jan 2023 21:31:25 -0800 (PST)
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
X-Inumbo-ID: 87c8b44c-9303-11ed-b8d0-410ff93cb8f0
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 35/40] xen/mpu: destroy boot modules and early FDT mapping in MPU system
Date: Fri, 13 Jan 2023 13:29:08 +0800
Message-Id: <20230113052914.3845596-36-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In MMU system, we will free all memory as boot modules, like kernel
initramfs module, into heap, and it is not applicable in MPU system.
Heap must be statically configured in Device tree, so it should not
change.
In MPU system, we destory MPU memory regions of boot modules.

In MPU version of remove_early_mappings, we destroy MPU memory
region of early FDT mapping.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/mm_mpu.c    |  4 ++++
 xen/arch/arm/setup.c     | 25 -------------------------
 xen/arch/arm/setup_mmu.c | 25 +++++++++++++++++++++++++
 xen/arch/arm/setup_mpu.c | 26 ++++++++++++++++++++++++++
 4 files changed, 55 insertions(+), 25 deletions(-)

diff --git a/xen/arch/arm/mm_mpu.c b/xen/arch/arm/mm_mpu.c
index de0c7d919a..118bb11d1a 100644
--- a/xen/arch/arm/mm_mpu.c
+++ b/xen/arch/arm/mm_mpu.c
@@ -854,6 +854,10 @@ void dump_hyp_walk(vaddr_t addr)
 
 void __init remove_early_mappings(void)
 {
+    /* Earlier, early FDT is mapped with MAX_FDT_SIZE in early_fdt_map */
+    if ( destroy_xen_mappings(round_pgdown(dtb_paddr),
+                              round_pgup(dtb_paddr + MAX_FDT_SIZE)) )
+        panic("Unable to destroy early Device-Tree mapping.\n");
 }
 
 int init_secondary_pagetables(int cpu)
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 0eac33e68c..49ba998f68 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -412,31 +412,6 @@ const char * __init boot_module_kind_as_string(bootmodule_kind kind)
     }
 }
 
-void __init discard_initial_modules(void)
-{
-    struct bootmodules *mi = &bootinfo.modules;
-    int i;
-
-    for ( i = 0; i < mi->nr_mods; i++ )
-    {
-        paddr_t s = mi->module[i].start;
-        paddr_t e = s + PAGE_ALIGN(mi->module[i].size);
-
-        if ( mi->module[i].kind == BOOTMOD_XEN )
-            continue;
-
-        if ( !mfn_valid(maddr_to_mfn(s)) ||
-             !mfn_valid(maddr_to_mfn(e)) )
-            continue;
-
-        fw_unreserved_regions(s, e, init_domheap_pages, 0);
-    }
-
-    mi->nr_mods = 0;
-
-    remove_early_mappings();
-}
-
 /* Relocate the FDT in Xen heap */
 static void * __init relocate_fdt(paddr_t dtb_paddr, size_t dtb_size)
 {
diff --git a/xen/arch/arm/setup_mmu.c b/xen/arch/arm/setup_mmu.c
index 7e5d87f8bd..611a60633e 100644
--- a/xen/arch/arm/setup_mmu.c
+++ b/xen/arch/arm/setup_mmu.c
@@ -340,6 +340,31 @@ void __init setup_mm(void)
 }
 #endif
 
+void __init discard_initial_modules(void)
+{
+    struct bootmodules *mi = &bootinfo.modules;
+    int i;
+
+    for ( i = 0; i < mi->nr_mods; i++ )
+    {
+        paddr_t s = mi->module[i].start;
+        paddr_t e = s + PAGE_ALIGN(mi->module[i].size);
+
+        if ( mi->module[i].kind == BOOTMOD_XEN )
+            continue;
+
+        if ( !mfn_valid(maddr_to_mfn(s)) ||
+             !mfn_valid(maddr_to_mfn(e)) )
+            continue;
+
+        fw_unreserved_regions(s, e, init_domheap_pages, 0);
+    }
+
+    mi->nr_mods = 0;
+
+    remove_early_mappings();
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/setup_mpu.c b/xen/arch/arm/setup_mpu.c
index f7d74ea604..f47f1f39ee 100644
--- a/xen/arch/arm/setup_mpu.c
+++ b/xen/arch/arm/setup_mpu.c
@@ -152,6 +152,32 @@ bool __init mpu_memory_section_contains(paddr_t s, paddr_t e,
     return false;
 }
 
+void __init discard_initial_modules(void)
+{
+    unsigned int i = 0;
+
+    /*
+     * Xenheap in MPU system must be statically configured in FDT in MPU
+     * system, so its base address and size couldn't change and it could not
+     * accept freed memory from boot modules.
+     * Disable MPU memory region of boot module section, since it will be in
+     * no use after boot.
+     */
+    for ( ; i < mpuinfo.sections[MSINFO_BOOTMODULE].nr_banks; i++ )
+    {
+        paddr_t start = mpuinfo.sections[MSINFO_BOOTMODULE].bank[i].start;
+        paddr_t size = mpuinfo.sections[MSINFO_BOOTMODULE].bank[i].size;
+        int rc;
+
+        rc = destroy_xen_mappings(start, start + size);
+        if ( rc )
+            panic("mpu: Unable to destroy boot module section 0x%"PRIpaddr"- 0x%"PRIpaddr"\n",
+                  start, start + size);
+    }
+
+    remove_early_mappings();
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.25.1


