Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6B4668B8E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:36:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476652.739142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCk3-0001tA-Av; Fri, 13 Jan 2023 05:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476652.739142; Fri, 13 Jan 2023 05:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCk3-0001gS-1h; Fri, 13 Jan 2023 05:36:39 +0000
Received: by outflank-mailman (input) for mailman id 476652;
 Fri, 13 Jan 2023 05:36:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCeg-0005sP-Hr
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:31:06 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 78f4a527-9303-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 06:31:04 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B20FFEC;
 Thu, 12 Jan 2023 21:31:46 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5C9923F587;
 Thu, 12 Jan 2023 21:31:01 -0800 (PST)
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
X-Inumbo-ID: 78f4a527-9303-11ed-b8d0-410ff93cb8f0
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 28/40] xen/mpu: map boot module section in MPU system
Date: Fri, 13 Jan 2023 13:29:01 +0800
Message-Id: <20230113052914.3845596-29-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In MPU system, we could not afford mapping a new MPU memory region
with each new guest boot module, it will exhaust limited MPU memory regions
very quickly.

So we introduce `mpu,boot-module-section` for users to statically configure
one big memory section or very few memory sections for all guests' boot mudules.
Users shall make sure that any guest boot module defined in Device Tree is
within the section, including kernel module(BOOTMOD_KERNEL), device tree
passthrough module(BOOTMOD_GUEST_DTB), and ramdisk module(BOOTMOD_RAMDISK).

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/include/asm/setup.h | 1 +
 xen/arch/arm/mm_mpu.c            | 2 +-
 xen/arch/arm/setup_mpu.c         | 7 +++++++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index b7a2225c25..61f24b5848 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -195,6 +195,7 @@ struct init_info
 enum mpu_section_info {
     MSINFO_GUEST,
     MSINFO_DEVICE,
+    MSINFO_BOOTMODULE,
     MSINFO_MAX
 };
 
diff --git a/xen/arch/arm/mm_mpu.c b/xen/arch/arm/mm_mpu.c
index 1566ba60af..ea64aa38e4 100644
--- a/xen/arch/arm/mm_mpu.c
+++ b/xen/arch/arm/mm_mpu.c
@@ -74,6 +74,7 @@ struct page_info *frame_table;
 static const unsigned int mpu_section_mattr[MSINFO_MAX] = {
     REGION_HYPERVISOR_SWITCH,
     REGION_HYPERVISOR_NOCACHE,
+    REGION_HYPERVISOR_BOOT,
 };
 
 /* Write a MPU protection region */
@@ -686,7 +687,6 @@ void __init setup_static_mappings(void)
 #endif
         map_mpu_memory_section_on_boot(i, mpu_section_mattr[i]);
     }
-    /* TODO: boot-module section, etc */
 }
 
 /* Map a frame table to cover physical addresses ps through pe */
diff --git a/xen/arch/arm/setup_mpu.c b/xen/arch/arm/setup_mpu.c
index ec05542f68..160934bf86 100644
--- a/xen/arch/arm/setup_mpu.c
+++ b/xen/arch/arm/setup_mpu.c
@@ -30,6 +30,7 @@
 const char *mpu_section_info_str[MSINFO_MAX] = {
     "mpu,guest-memory-section",
     "mpu,device-memory-section",
+    "mpu,boot-module-section",
 };
 
 /*
@@ -52,6 +53,12 @@ struct mpuinfo __initdata mpuinfo;
  * "mpu,device-memory-section": this section draws the device memory layout
  * with the least number of memory regions for all devices in system that will
  * be used in Xen, like `UART`, `GIC`, etc.
+ *
+ * "mpu,boot-module-section": this property uses one big memory section or
+ * very few memory sections to describe all guests' boot mudules. Users shall
+ * make sure that any guest boot module defined in Device Tree is within
+ * the section, including kernel module(BOOTMOD_KERNEL), device tree
+ * passthrough module(BOOTMOD_GUEST_DTB), and ramdisk module(BOOTMOD_RAMDISK).
  */
 static int __init process_mpu_memory_section(const void *fdt, int node,
                                              const char *name, void *data,
-- 
2.25.1


