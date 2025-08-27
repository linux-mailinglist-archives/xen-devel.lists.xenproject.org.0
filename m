Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D78B387E2
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 18:41:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096549.1451239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urJDB-0006bZ-Pp; Wed, 27 Aug 2025 16:41:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096549.1451239; Wed, 27 Aug 2025 16:41:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urJDB-0006Z5-Me; Wed, 27 Aug 2025 16:41:25 +0000
Received: by outflank-mailman (input) for mailman id 1096549;
 Wed, 27 Aug 2025 16:41:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mrvt=3H=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1urJDA-0004w9-2a
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 16:41:24 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id aa9a75c2-8364-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 18:41:23 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D2F8152B;
 Wed, 27 Aug 2025 09:41:14 -0700 (PDT)
Received: from PWQ0QT7DJ1.arm.com (unknown [10.57.64.177])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 857B53F738;
 Wed, 27 Aug 2025 09:41:20 -0700 (PDT)
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
X-Inumbo-ID: aa9a75c2-8364-11f0-aeb2-fb57b961d000
From: Hari Limaye <hari.limaye@arm.com>
To: xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v2 5/5] xen/arm: map static memory on demand
Date: Wed, 27 Aug 2025 17:35:13 +0100
Message-ID: <6408f218f3075acd43f5563bff26165091d9f184.1756312498.git.hari.limaye@arm.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <cover.1756312498.git.hari.limaye@arm.com>
References: <cover.1756312498.git.hari.limaye@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

In the function `init_staticmem_pages` we need to have mapped static
memory banks for initialization. Unlike on an MMU system, we cannot map
the entire RAM on an MPU system as we have a limited number of MPU
memory regions. To solve this, transiently map the static memory banks
for initialization.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Hari Limaye <hari.limaye@arm.com>
---
 xen/arch/arm/include/asm/mmu/mm.h |  3 +++
 xen/arch/arm/include/asm/mpu/mm.h |  4 ++++
 xen/arch/arm/mpu/setup.c          | 11 +++++++++++
 xen/include/xen/static-memory.h   |  8 ++++++++
 4 files changed, 26 insertions(+)

diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
index 7f4d59137d..645a0ea3cb 100644
--- a/xen/arch/arm/include/asm/mmu/mm.h
+++ b/xen/arch/arm/include/asm/mmu/mm.h
@@ -110,6 +110,9 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
 extern void switch_ttbr(uint64_t ttbr);
 extern void relocate_and_switch_ttbr(uint64_t ttbr);
 
+static inline void map_staticmem_pages_to_xen(paddr_t start, paddr_t end) {}
+static inline void unmap_staticmem_pages_to_xen(paddr_t start, paddr_t end) {}
+
 #endif /* __ARM_MMU_MM_H__ */
 
 /*
diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index efb0680e39..4cc769418e 100644
--- a/xen/arch/arm/include/asm/mpu/mm.h
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -123,6 +123,10 @@ void *map_mm_range(paddr_t base, paddr_t limit, unsigned int flags);
  */
 void unmap_mm_range(paddr_t base);
 
+/* {un}map_staticmem_pages_to_xen used while initializing static memory banks */
+void map_staticmem_pages_to_xen(paddr_t start, paddr_t end);
+void unmap_staticmem_pages_to_xen(paddr_t start, paddr_t end);
+
 /*
  * Checks whether a given memory range is present in the provided table of
  * MPU protection regions.
diff --git a/xen/arch/arm/mpu/setup.c b/xen/arch/arm/mpu/setup.c
index 163573b932..dbc3107333 100644
--- a/xen/arch/arm/mpu/setup.c
+++ b/xen/arch/arm/mpu/setup.c
@@ -83,6 +83,17 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
     return fdt_virt;
 }
 
+void __init map_staticmem_pages_to_xen(paddr_t start, paddr_t end)
+{
+    if ( !map_mm_range(start, end, PAGE_HYPERVISOR) )
+        panic("Unable to map staticmem pages to Xen!");
+}
+
+void __init unmap_staticmem_pages_to_xen(paddr_t start, paddr_t end)
+{
+    unmap_mm_range(start);
+}
+
 /*
  * copy_from_paddr - copy data from a physical address
  * @dst: destination virtual address
diff --git a/xen/include/xen/static-memory.h b/xen/include/xen/static-memory.h
index e445aa8057..d99abac113 100644
--- a/xen/include/xen/static-memory.h
+++ b/xen/include/xen/static-memory.h
@@ -18,7 +18,15 @@ static inline void init_staticmem_bank(const struct membank *bank)
     if ( mfn_x(bank_end) <= mfn_x(bank_start) )
         return;
 
+    /* Map temporarily before initialization */
+    map_staticmem_pages_to_xen(mfn_to_maddr(bank_start),
+                               mfn_to_maddr(bank_end));
+
     unprepare_staticmem_pages(mfn_to_page(bank_start), bank_pages, false);
+
+    /* Unmap immediately after initialization */
+    unmap_staticmem_pages_to_xen(mfn_to_maddr(bank_start),
+                                 mfn_to_maddr(bank_end));
 }
 
 void allocate_static_memory(struct domain *d, struct kernel_info *kinfo,
-- 
2.34.1


