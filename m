Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A18668B78
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:35:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476571.738902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCj6-0007v6-UX; Fri, 13 Jan 2023 05:35:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476571.738902; Fri, 13 Jan 2023 05:35:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCj6-0007no-Pf; Fri, 13 Jan 2023 05:35:40 +0000
Received: by outflank-mailman (input) for mailman id 476571;
 Fri, 13 Jan 2023 05:35:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCec-0005sJ-EQ
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:31:02 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 772af550-9303-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 06:31:01 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00DCFFEC;
 Thu, 12 Jan 2023 21:31:43 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 42AD23F587;
 Thu, 12 Jan 2023 21:30:58 -0800 (PST)
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
X-Inumbo-ID: 772af550-9303-11ed-91b6-6bf2151ebd3b
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 27/40] xen/mpu: map device memory resource in MPU system
Date: Fri, 13 Jan 2023 13:29:00 +0800
Message-Id: <20230113052914.3845596-28-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In MPU system, we could not afford mapping a new MPU memory region
with each new device, it will exhaust limited MPU memory regions
very quickly.

So we introduce `mpu,device-memory-section` for users to statically
configure the whole system device memory with the least number of
memory regions in Device Tree. This section shall cover all devices
that will be used in Xen, like `UART`, `GIC`, etc.

Before we map `mpu,device-memory-section` with device memory attributes and
permissions(REGION_HYPRVISOR_NOCACHE), we shall destroy the mapping for early
UART which got set up in assembly boot-time, to avoid MPU memory
region overlapping.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/include/asm/arm64/mpu.h |  6 ++++--
 xen/arch/arm/include/asm/setup.h     |  1 +
 xen/arch/arm/mm_mpu.c                | 14 +++++++++++++-
 xen/arch/arm/setup_mpu.c             |  5 +++++
 4 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index c1dea1c8e9..8e8679bc82 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -69,10 +69,11 @@
 #define REGION_TRANSIENT_MASK(x)  (((x) >> _REGION_TRANSIENT_BIT) & 0x3U)
 
 /*
- * _REGION_NORMAL is convenience define. It is not meant to be used
- * outside of this header.
+ * _REGION_NORMAL and _REGION_DEVICE are convenience defines. They are not
+ * meant to be used outside of this header.
  */
 #define _REGION_NORMAL            (MT_NORMAL|_REGION_PRESENT)
+#define _REGION_DEVICE            (_REGION_XN|_REGION_PRESENT)
 
 #define REGION_HYPERVISOR_RW      (_REGION_NORMAL|_REGION_XN)
 #define REGION_HYPERVISOR_RO      (_REGION_NORMAL|_REGION_XN|_REGION_RO)
@@ -80,6 +81,7 @@
 #define REGION_HYPERVISOR         REGION_HYPERVISOR_RW
 #define REGION_HYPERVISOR_BOOT    (REGION_HYPERVISOR_RW|_REGION_BOOTONLY)
 #define REGION_HYPERVISOR_SWITCH  (REGION_HYPERVISOR_RW|_REGION_SWITCH)
+#define REGION_HYPERVISOR_NOCACHE (_REGION_DEVICE|MT_DEVICE_nGnRE|_REGION_SWITCH)
 
 #define INVALID_REGION            (~0UL)
 
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 3581f8f990..b7a2225c25 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -194,6 +194,7 @@ struct init_info
 /* Index of MPU memory section */
 enum mpu_section_info {
     MSINFO_GUEST,
+    MSINFO_DEVICE,
     MSINFO_MAX
 };
 
diff --git a/xen/arch/arm/mm_mpu.c b/xen/arch/arm/mm_mpu.c
index 3a0d110b13..1566ba60af 100644
--- a/xen/arch/arm/mm_mpu.c
+++ b/xen/arch/arm/mm_mpu.c
@@ -73,6 +73,7 @@ struct page_info *frame_table;
 
 static const unsigned int mpu_section_mattr[MSINFO_MAX] = {
     REGION_HYPERVISOR_SWITCH,
+    REGION_HYPERVISOR_NOCACHE,
 };
 
 /* Write a MPU protection region */
@@ -673,8 +674,19 @@ void __init setup_static_mappings(void)
     setup_staticheap_mappings();
 
     for ( uint8_t i = MSINFO_GUEST; i < MSINFO_MAX; i++ )
+    {
+#ifdef CONFIG_EARLY_PRINTK
+        if ( i == MSINFO_DEVICE )
+            /*
+             * Destroy early UART mapping before mapping device memory section.
+             * WARNING：console will be inaccessible temporarily.
+             */
+            destroy_xen_mappings(CONFIG_EARLY_UART_BASE_ADDRESS,
+                                 CONFIG_EARLY_UART_BASE_ADDRESS + EARLY_UART_SIZE);
+#endif
         map_mpu_memory_section_on_boot(i, mpu_section_mattr[i]);
-    /* TODO: device memory section, boot-module section, etc */
+    }
+    /* TODO: boot-module section, etc */
 }
 
 /* Map a frame table to cover physical addresses ps through pe */
diff --git a/xen/arch/arm/setup_mpu.c b/xen/arch/arm/setup_mpu.c
index 09a38a34a4..ec05542f68 100644
--- a/xen/arch/arm/setup_mpu.c
+++ b/xen/arch/arm/setup_mpu.c
@@ -29,6 +29,7 @@
 
 const char *mpu_section_info_str[MSINFO_MAX] = {
     "mpu,guest-memory-section",
+    "mpu,device-memory-section",
 };
 
 /*
@@ -47,6 +48,10 @@ struct mpuinfo __initdata mpuinfo;
  * through "xen,static-mem" property in MPU system. "mpu,guest-memory-section"
  * limits the scattering of "xen,static-mem", as users could not define
  * a "xen,static-mem" outside "mpu,guest-memory-section".
+ *
+ * "mpu,device-memory-section": this section draws the device memory layout
+ * with the least number of memory regions for all devices in system that will
+ * be used in Xen, like `UART`, `GIC`, etc.
  */
 static int __init process_mpu_memory_section(const void *fdt, int node,
                                              const char *name, void *data,
-- 
2.25.1


