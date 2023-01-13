Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 676E6668B88
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:36:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476620.739039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjj-0005OD-8z; Fri, 13 Jan 2023 05:36:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476620.739039; Fri, 13 Jan 2023 05:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCji-0005HE-KI; Fri, 13 Jan 2023 05:36:18 +0000
Received: by outflank-mailman (input) for mailman id 476620;
 Fri, 13 Jan 2023 05:36:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCej-0005sP-Nm
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:31:09 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7ad5d262-9303-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 06:31:07 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34C54FEC;
 Thu, 12 Jan 2023 21:31:49 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7676F3F587;
 Thu, 12 Jan 2023 21:31:04 -0800 (PST)
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
X-Inumbo-ID: 7ad5d262-9303-11ed-b8d0-410ff93cb8f0
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 29/40] xen/mpu: introduce mpu_memory_section_contains for address range check
Date: Fri, 13 Jan 2023 13:29:02 +0800
Message-Id: <20230113052914.3845596-30-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have already introduced "mpu,xxx-memory-section" to limit system/domain
configuration, so we shall add check to verfify user's configuration.

We shall check if any guest boot module is within the boot module section,
including kernel module(BOOTMOD_KERNEL), device tree
passthrough module(BOOTMOD_GUEST_DTB), and ramdisk module(BOOTMOD_RAMDISK).

We also shall check if any guest RAM through "xen,static-mem" is within
the guest memory section.

Function mpu_memory_section_contains is introduced to do above check.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/domain_build.c      |  4 ++++
 xen/arch/arm/include/asm/setup.h |  2 ++
 xen/arch/arm/kernel.c            | 18 ++++++++++++++++++
 xen/arch/arm/setup_mpu.c         | 22 ++++++++++++++++++++++
 4 files changed, 46 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 829cea8de8..f48a3f679f 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -546,6 +546,10 @@ static mfn_t __init acquire_static_memory_bank(struct domain *d,
                d, *psize);
         return INVALID_MFN;
     }
+#ifdef CONFIG_HAS_MPU
+    if ( !mpu_memory_section_contains(*pbase, *pbase + *psize, MSINFO_GUEST) )
+        return INVALID_MFN;
+#endif
 
     smfn = maddr_to_mfn(*pbase);
     res = acquire_domstatic_pages(d, smfn, PFN_DOWN(*psize), 0);
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 61f24b5848..d4c1336597 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -209,6 +209,8 @@ extern struct mpuinfo mpuinfo;
 
 extern int process_mpuinfo(const void *fdt, int node, uint32_t address_cells,
                            uint32_t size_cells);
+extern bool mpu_memory_section_contains(paddr_t s, paddr_t e,
+                                        enum mpu_section_info type);
 #endif /* CONFIG_HAS_MPU */
 
 #endif
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 0475d8fae7..ee7144ec13 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -467,6 +467,12 @@ int __init kernel_probe(struct kernel_info *info,
                 mod = boot_module_find_by_addr_and_kind(
                         BOOTMOD_KERNEL, kernel_addr);
                 info->kernel_bootmodule = mod;
+#ifdef CONFIG_HAS_MPU
+                if ( !mpu_memory_section_contains(mod->start,
+                                                  mod->start + mod->size,
+                                                  MSINFO_BOOTMODULE) )
+                    return -EINVAL;
+#endif
             }
             else if ( dt_device_is_compatible(node, "multiboot,ramdisk") )
             {
@@ -477,6 +483,12 @@ int __init kernel_probe(struct kernel_info *info,
                 dt_get_range(&val, node, &initrd_addr, &size);
                 info->initrd_bootmodule = boot_module_find_by_addr_and_kind(
                         BOOTMOD_RAMDISK, initrd_addr);
+#ifdef CONFIG_HAS_MPU
+                if ( !mpu_memory_section_contains(mod->start,
+                                                  mod->start + mod->size,
+                                                  MSINFO_BOOTMODULE) )
+                    return -EINVAL;
+#endif
             }
             else if ( dt_device_is_compatible(node, "multiboot,device-tree") )
             {
@@ -489,6 +501,12 @@ int __init kernel_probe(struct kernel_info *info,
                 dt_get_range(&val, node, &dtb_addr, &size);
                 info->dtb_bootmodule = boot_module_find_by_addr_and_kind(
                         BOOTMOD_GUEST_DTB, dtb_addr);
+#ifdef CONFIG_HAS_MPU
+                if ( !mpu_memory_section_contains(mod->start,
+                                                  mod->start + mod->size,
+                                                  MSINFO_BOOTMODULE) )
+                    return -EINVAL;
+#endif
             }
             else
                 continue;
diff --git a/xen/arch/arm/setup_mpu.c b/xen/arch/arm/setup_mpu.c
index 160934bf86..f7d74ea604 100644
--- a/xen/arch/arm/setup_mpu.c
+++ b/xen/arch/arm/setup_mpu.c
@@ -130,6 +130,28 @@ void __init setup_mm(void)
     init_staticmem_pages();
 }
 
+bool __init mpu_memory_section_contains(paddr_t s, paddr_t e,
+                                        enum mpu_section_info type)
+{
+    unsigned int i = 0;
+
+    for ( ; i < mpuinfo.sections[type].nr_banks; i++ )
+    {
+        paddr_t section_start = mpuinfo.sections[type].bank[i].start;
+        paddr_t section_size = mpuinfo.sections[type].bank[i].size;
+        paddr_t section_end = section_start + section_size;
+
+        /* range inclusive */
+        if ( s >= section_start && e <= section_end )
+            return true;
+    }
+
+    printk(XENLOG_ERR
+           "mpu: invalid range configuration 0x%"PRIpaddr" - 0x%"PRIpaddr", and it shall be within %s\n",
+           s, e, mpu_section_info_str[i]);
+    return false;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.25.1


