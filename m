Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A3073D678
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:40:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555045.866692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5D-0002xt-0g; Mon, 26 Jun 2023 03:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555045.866692; Mon, 26 Jun 2023 03:40:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5C-0002Ys-8i; Mon, 26 Jun 2023 03:40:06 +0000
Received: by outflank-mailman (input) for mailman id 555045;
 Mon, 26 Jun 2023 03:40:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd2I-0000HH-Ci
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:37:06 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id b7c70753-13d2-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 05:37:04 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0370E1FB;
 Sun, 25 Jun 2023 20:37:48 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5BAA53F64C;
 Sun, 25 Jun 2023 20:37:01 -0700 (PDT)
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
X-Inumbo-ID: b7c70753-13d2-11ee-8611-37d641c3527e
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 37/52] xen/mpu: implement MPU version of copy_from_paddr
Date: Mon, 26 Jun 2023 11:34:28 +0800
Message-Id: <20230626033443.2943270-38-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When implementing MPU version of copy_from_paddr, if source physical address
is not accessible, we shall map it temporarily with a transient MPU
memory region for copying and pasting.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- new patch
---
 xen/arch/arm/include/asm/mpu/mm.h |  3 +++
 xen/arch/arm/mpu/mm.c             |  6 +++---
 xen/arch/arm/mpu/setup.c          | 32 +++++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index 98f6df65b8..452fe20c5f 100644
--- a/xen/arch/arm/include/asm/mpu/mm.h
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -7,6 +7,9 @@ extern unsigned long frametable_pdx_end;
 
 extern int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags);
 extern void setup_staticheap_mappings(void);
+extern uint8_t is_mm_range_mapped(paddr_t pa, paddr_t len);
+extern void *map_mm_range(paddr_t pa, size_t len, unsigned int attributes);
+extern void unmap_mm_range(paddr_t pa);
 
 #endif /* __ARCH_ARM_MM_MPU__ */
 
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 3bb1a5c7c4..21276d6de9 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -631,7 +631,7 @@ int __init unmap_staticmem_pages_to_xen(paddr_t start, paddr_t end)
  * If it is mapped, the associated index will be returned.
  * If it is not mapped, INVALID_REGION_IDX will be returned.
  */
-static uint8_t is_mm_range_mapped(paddr_t pa, paddr_t len)
+uint8_t is_mm_range_mapped(paddr_t pa, paddr_t len)
 {
     int rc;
     uint8_t idx;
@@ -705,7 +705,7 @@ static int is_mm_range_mapped_with_attr(paddr_t pa, paddr_t len,
  * map_mm_range shall work with unmap_mm_range to map a chunk
  * of memory with a transient MPU memory region for a period of short time.
  */
-static void *map_mm_range(paddr_t pa, size_t len, unsigned int attributes)
+void *map_mm_range(paddr_t pa, size_t len, unsigned int attributes)
 {
     if ( xen_mpumap_update(pa, pa + len, attributes | _PAGE_TRANSIENT) )
         printk(XENLOG_ERR "Failed to map_mm_range 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
@@ -714,7 +714,7 @@ static void *map_mm_range(paddr_t pa, size_t len, unsigned int attributes)
     return maddr_to_virt(pa);
 }
 
-static void unmap_mm_range(paddr_t pa)
+void unmap_mm_range(paddr_t pa)
 {
     uint8_t idx;
 
diff --git a/xen/arch/arm/mpu/setup.c b/xen/arch/arm/mpu/setup.c
index 31f412957c..9963975b4e 100644
--- a/xen/arch/arm/mpu/setup.c
+++ b/xen/arch/arm/mpu/setup.c
@@ -22,6 +22,7 @@
 #include <xen/init.h>
 #include <xen/mm.h>
 #include <xen/pfn.h>
+#include <asm/arm64/mpu.h>
 #include <asm/mpu/mm.h>
 #include <asm/page.h>
 #include <asm/setup.h>
@@ -60,6 +61,37 @@ void __init setup_mm(void)
     init_staticmem_pages();
 }
 
+/*
+ * copy_from_paddr - copy data from a physical address
+ * @dst: destination virtual address
+ * @paddr: source physical address
+ * @len: length to copy
+ */
+void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long len)
+{
+    void *src, *rc = NULL;
+    uint8_t idx;
+
+    idx = is_mm_range_mapped(round_pgdown(paddr), round_pgup(len));
+    if ( idx == INVALID_REGION_IDX )
+    {
+        /*
+         * If source physical address is not accessible, we shall map it
+         * temporarily for copying and pasting
+         */
+        rc = map_mm_range(round_pgdown(paddr), round_pgup(len),
+                          PAGE_HYPERVISOR_WC);
+        if ( !rc )
+            return;
+    }
+
+    src = maddr_to_virt(paddr);
+    memcpy(dst, src, len);
+
+    if ( rc )
+        unmap_mm_range(round_pgdown(paddr));
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.25.1


