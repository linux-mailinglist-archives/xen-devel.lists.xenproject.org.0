Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1638D73D681
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:40:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555072.866776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5T-0007R0-F6; Mon, 26 Jun 2023 03:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555072.866776; Mon, 26 Jun 2023 03:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5S-0007ML-R3; Mon, 26 Jun 2023 03:40:22 +0000
Received: by outflank-mailman (input) for mailman id 555072;
 Mon, 26 Jun 2023 03:40:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd2B-0007ej-Bm
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:36:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b41595ed-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:36:58 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C69601FB;
 Sun, 25 Jun 2023 20:37:41 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2ACB33F64C;
 Sun, 25 Jun 2023 20:36:54 -0700 (PDT)
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
X-Inumbo-ID: b41595ed-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 35/52] xen/arm: map static memory on demand
Date: Mon, 26 Jun 2023 11:34:26 +0800
Message-Id: <20230626033443.2943270-36-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In function init_staticmem_pages, we need the access to static memory
for proper initialization.
It is not a problem in MMU system, as Xen map the whole RAM in
setup_mm(). However, with limited MPU memory regions, it is too luxury
to map the whole RAM.
As a result, we follow the rule of "map on demand", to map static memory
temporarily before its initialization, and unmap immediately after its
initialization.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- new commit
---
 xen/arch/arm/include/asm/mm.h |  2 ++
 xen/arch/arm/mmu/mm.c         | 10 ++++++++++
 xen/arch/arm/mpu/mm.c         | 10 ++++++++++
 xen/arch/arm/setup.c          | 21 +++++++++++++++++++++
 4 files changed, 43 insertions(+)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 66d98b9a29..cffbf8a595 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -224,6 +224,8 @@ extern void mm_init_secondary_cpu(void);
 extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
 /* map a physical range in virtual memory */
 void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int attributes);
+extern int map_staticmem_pages_to_xen(paddr_t start, paddr_t end);
+extern int unmap_staticmem_pages_to_xen(paddr_t start, paddr_t end);
 
 static inline void __iomem *ioremap_nocache(paddr_t start, size_t len)
 {
diff --git a/xen/arch/arm/mmu/mm.c b/xen/arch/arm/mmu/mm.c
index 2f29cb53fe..4196a55c32 100644
--- a/xen/arch/arm/mmu/mm.c
+++ b/xen/arch/arm/mmu/mm.c
@@ -1113,6 +1113,16 @@ int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
     return xen_pt_update(virt, INVALID_MFN, nr_mfns, _PAGE_POPULATE);
 }
 
+int __init map_staticmem_pages_to_xen(paddr_t start, paddr_t end)
+{
+    return 0;
+}
+
+int __init unmap_staticmem_pages_to_xen(paddr_t start, paddr_t end)
+{
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index a40055ae5e..9d5c1da39c 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -614,6 +614,16 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
            frametable_size - (nr_pdxs * sizeof(struct page_info)));
 }
 
+int __init map_staticmem_pages_to_xen(paddr_t start, paddr_t end)
+{
+    return xen_mpumap_update(start, end, PAGE_HYPERVISOR | _PAGE_TRANSIENT);
+}
+
+int __init unmap_staticmem_pages_to_xen(paddr_t start, paddr_t end)
+{
+    return xen_mpumap_update(start, end, 0);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index f42b53d17b..c21d1db763 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -637,12 +637,33 @@ void __init init_staticmem_pages(void)
             mfn_t bank_start = _mfn(PFN_UP(bootinfo.reserved_mem.bank[bank].start));
             unsigned long bank_pages = PFN_DOWN(bootinfo.reserved_mem.bank[bank].size);
             mfn_t bank_end = mfn_add(bank_start, bank_pages);
+            int res;
 
             if ( mfn_x(bank_end) <= mfn_x(bank_start) )
                 return;
 
+            /* Map temporarily before initialization */
+            res = map_staticmem_pages_to_xen(mfn_to_maddr(bank_start),
+                                             mfn_to_maddr(bank_end));
+            if ( res )
+            {
+                printk(XENLOG_ERR "Failed to map static memory to Xen: %d\n",
+                       res);
+                return;
+            }
+
             unprepare_staticmem_pages(mfn_to_page(bank_start),
                                       bank_pages, false);
+
+            /* Unmap immediately after initialization */
+            res = unmap_staticmem_pages_to_xen(mfn_to_maddr(bank_start),
+                                               mfn_to_maddr(bank_end));
+            if ( res )
+            {
+                printk(XENLOG_ERR "Failed to unmap static memory to Xen: %d\n",
+                       res);
+                return;
+            }
         }
     }
 #endif
-- 
2.25.1


