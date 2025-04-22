Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F176A96FEC
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:07:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962765.1353961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FDY-0001lg-Pa; Tue, 22 Apr 2025 15:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962765.1353961; Tue, 22 Apr 2025 15:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FDY-0001jY-Kz; Tue, 22 Apr 2025 15:07:24 +0000
Received: by outflank-mailman (input) for mailman id 962765;
 Tue, 22 Apr 2025 15:07:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BiSK=XI=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1u7FDX-0008SP-CB
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:07:23 +0000
Received: from 8.mo583.mail-out.ovh.net (8.mo583.mail-out.ovh.net
 [178.32.116.78]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7da3cf56-1f8b-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 17:07:21 +0200 (CEST)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.108.25.16])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4Zhlvs0mQ0z1hRD
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 15:07:21 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-9jk7j (unknown [10.110.164.38])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 4B0F81FEC8;
 Tue, 22 Apr 2025 15:07:20 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.105])
 by ghost-submission-5b5ff79f4f-9jk7j with ESMTPSA
 id 8J+EB6iwB2h4GgEATnw8yA
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 22 Apr 2025 15:07:20 +0000
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
X-Inumbo-ID: 7da3cf56-1f8b-11f0-9ffb-bf95429c2676
Authentication-Results:garm.ovh; auth=pass (GARM-105G006566173e4-e8e0-4e73-a28e-31db44e7d3fa,
                    7E508E014E7E7C169EB13C6E22C3C4EBF1F0FDD7) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH 06/21] xen/arch/x86: reserve TXT memory
Date: Tue, 22 Apr 2025 18:06:40 +0300
Message-ID: <39d9839d4cb3bafbe7b43f91d472c50cce1e720f.1745172094.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12729705823544194204
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepgeekffeiiedtveekhfdugeffveeigefgleegvdeghefftdetheefueeliedukedvnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukedurddujeekpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheekfegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=HvumLBFYP6CuHegJXtZM9ondyMXqUewjKdXuvImTbxE=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745334441; v=1;
 b=bzfRhvdQ9bEu02yLXJWY9MSF6ulVuy0R9bzwIolKpiQQEXpuPgN+fCe1SHKnb6viuRztcOHd
 XB+VZ6mGsR0qVjW9xBqjGh/SnyB7dpbySnXmswD0rVdV/E7BljgA1nY/7jnVuc9SF6JXwyRczvA
 XGwDyAw3Ay4RZ352XhC3SCbgE1p8O/py8wy0Mfjb/SGJH1lREARR0rju64K0i+fhYDc87r2rU1f
 mj5qPnYTJCQr/zUUrKdAab6UQBl2dT45gwUpMjw6RoL1Odflzi+NpUeRpECetR7niyG9ALmO3wD
 NwIU9xFr0Mcfgt8zuhCGPKScWGmKWYSVHXeY0Hh9m13zw==

From: Kacper Stojek <kacper.stojek@3mdeb.com>

TXT heap, SINIT and TXT private space are marked as reserved or unused
in e820 to protect from unintended uses.

Signed-off-by: Kacper Stojek <kacper.stojek@3mdeb.com>
Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Michał Żygowski <michal.zygowski@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 xen/arch/x86/Makefile                |   1 +
 xen/arch/x86/include/asm/intel_txt.h |   6 ++
 xen/arch/x86/include/asm/mm.h        |   3 +
 xen/arch/x86/include/asm/slaunch.h   |  44 ++++++++++++
 xen/arch/x86/intel_txt.c             | 102 +++++++++++++++++++++++++++
 xen/arch/x86/setup.c                 |  10 ++-
 xen/arch/x86/slaunch.c               |  96 +++++++++++++++++++++++++
 7 files changed, 259 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/x86/intel_txt.c

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 571cad160d..cae548f7e9 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_GDBSX) += gdbsx.o
 obj-y += hypercall.o
 obj-y += i387.o
 obj-y += i8259.o
+obj-y += intel_txt.o
 obj-y += io_apic.o
 obj-$(CONFIG_LIVEPATCH) += alternative.o livepatch.o
 obj-y += msi.o
diff --git a/xen/arch/x86/include/asm/intel_txt.h b/xen/arch/x86/include/asm/intel_txt.h
index 7170baf6fb..85ef9f6245 100644
--- a/xen/arch/x86/include/asm/intel_txt.h
+++ b/xen/arch/x86/include/asm/intel_txt.h
@@ -396,4 +396,10 @@ static inline void txt_verify_pmr_ranges(struct txt_os_mle_data *os_mle,
     */
 }
 
+/* Prepares for accesses to TXT-specific memory. */
+void txt_map_mem_regions(void);
+
+/* Marks TXT-specific memory as used to avoid its corruption. */
+void txt_reserve_mem_regions(void);
+
 #endif /* __ASSEMBLY__ */
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index a1bc8cc274..061cb12a5b 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -106,6 +106,9 @@
 #define _PGC_need_scrub   _PGC_allocated
 #define PGC_need_scrub    PGC_allocated
 
+/* How much of the directmap is prebuilt at compile time. */
+#define PREBUILT_MAP_LIMIT (1 << L2_PAGETABLE_SHIFT)
+
 #ifndef CONFIG_BIGMEM
 /*
  * This definition is solely for the use in struct page_info (and
diff --git a/xen/arch/x86/include/asm/slaunch.h b/xen/arch/x86/include/asm/slaunch.h
index 08cc2657f0..78d3c8bf37 100644
--- a/xen/arch/x86/include/asm/slaunch.h
+++ b/xen/arch/x86/include/asm/slaunch.h
@@ -7,13 +7,57 @@
 #ifndef _ASM_X86_SLAUNCH_H_
 #define _ASM_X86_SLAUNCH_H_
 
+#include <xen/slr_table.h>
 #include <xen/types.h>
 
 extern bool slaunch_active;
 
+/*
+ * evt_log is assigned a physical address and the caller must map it to
+ * virtual, if needed.
+ */
+static inline void find_evt_log(struct slr_table *slrt, void **evt_log,
+                                uint32_t *evt_log_size)
+{
+    struct slr_entry_log_info *log_info;
+
+    log_info = (struct slr_entry_log_info *)
+        slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_LOG_INFO);
+    if ( log_info != NULL )
+    {
+        *evt_log = _p(log_info->addr);
+        *evt_log_size = log_info->size;
+    }
+    else
+    {
+        *evt_log = NULL;
+        *evt_log_size = 0;
+    }
+}
+
 /*
  * Retrieves pointer to SLRT.  Checks table's validity and maps it as necessary.
  */
 struct slr_table *slaunch_get_slrt(void);
 
+/*
+ * Prepares for accesses to essential data structures setup by boot environment.
+ */
+void slaunch_map_mem_regions(void);
+
+/* Marks regions of memory as used to avoid their corruption. */
+void slaunch_reserve_mem_regions(void);
+
+/*
+ * This helper function is used to map memory using L2 page tables by aligning
+ * mapped regions to 2MB. This way page allocator (which at this point isn't
+ * yet initialized) isn't needed for creating new L1 mappings. The function
+ * also checks and skips memory already mapped by the prebuilt tables.
+ *
+ * There is no unmap_l2() because the function is meant to be used by the code
+ * that accesses DRTM-related memory soon after which Xen rebuilds memory maps,
+ * effectively dropping all existing mappings.
+ */
+int slaunch_map_l2(unsigned long paddr, unsigned long size);
+
 #endif /* _ASM_X86_SLAUNCH_H_ */
diff --git a/xen/arch/x86/intel_txt.c b/xen/arch/x86/intel_txt.c
new file mode 100644
index 0000000000..4a4e404007
--- /dev/null
+++ b/xen/arch/x86/intel_txt.c
@@ -0,0 +1,102 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2022-2025 3mdeb Sp. z o.o. All rights reserved.
+ */
+
+#include <xen/bug.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/types.h>
+#include <asm/e820.h>
+#include <asm/intel_txt.h>
+#include <asm/slaunch.h>
+
+static uint64_t __initdata txt_heap_base, txt_heap_size;
+
+void __init txt_map_mem_regions(void)
+{
+    int rc;
+
+    rc = slaunch_map_l2(TXT_PRIV_CONFIG_REGS_BASE, NR_TXT_CONFIG_SIZE);
+    BUG_ON(rc != 0);
+
+    txt_heap_base = read_txt_reg(TXTCR_HEAP_BASE);
+    BUG_ON(txt_heap_base == 0);
+
+    txt_heap_size = read_txt_reg(TXTCR_HEAP_SIZE);
+    BUG_ON(txt_heap_size == 0);
+
+    rc = slaunch_map_l2(txt_heap_base, txt_heap_size);
+    BUG_ON(rc != 0);
+}
+
+/* Mark RAM region as RESERVED if it isn't marked that way already. */
+static int __init mark_ram_as(struct e820map *e820, uint64_t start,
+                              uint64_t end, uint32_t type)
+{
+    unsigned int i;
+    uint32_t from_type = E820_RAM;
+
+    for ( i = 0; i < e820->nr_map; i++ )
+    {
+        uint64_t rs = e820->map[i].addr;
+        uint64_t re = rs + e820->map[i].size;
+        if ( start >= rs && end <= re )
+            break;
+    }
+
+    /*
+     * Allow the range to be unlisted since we're only preventing RAM from
+     * use.
+     */
+    if ( i == e820->nr_map )
+        return 1;
+
+    /*
+     * e820_change_range_type() fails if the range is already marked with the
+     * desired type. Don't consider it an error if firmware has done it for us.
+     */
+    if ( e820->map[i].type == type )
+        return 1;
+
+    /* E820_ACPI or E820_NVS are really unexpected, but others are fine. */
+    if ( e820->map[i].type == E820_RESERVED ||
+         e820->map[i].type == E820_UNUSABLE )
+        from_type = e820->map[i].type;
+
+    return e820_change_range_type(e820, start, end, from_type, type);
+}
+
+void __init txt_reserve_mem_regions(void)
+{
+    int rc;
+    uint64_t sinit_base, sinit_size;
+
+    /* TXT Heap */
+    BUG_ON(txt_heap_base == 0);
+    printk("SLAUNCH: reserving TXT heap (%#lx - %#lx)\n", txt_heap_base,
+           txt_heap_base + txt_heap_size);
+    rc = mark_ram_as(&e820_raw, txt_heap_base, txt_heap_base + txt_heap_size,
+                     E820_RESERVED);
+    BUG_ON(rc == 0);
+
+    sinit_base = read_txt_reg(TXTCR_SINIT_BASE);
+    BUG_ON(sinit_base == 0);
+
+    sinit_size = read_txt_reg(TXTCR_SINIT_SIZE);
+    BUG_ON(sinit_size == 0);
+
+    /* SINIT */
+    printk("SLAUNCH: reserving SINIT memory (%#lx - %#lx)\n", sinit_base,
+           sinit_base + sinit_size);
+    rc = mark_ram_as(&e820_raw, sinit_base, sinit_base + sinit_size,
+                     E820_RESERVED);
+    BUG_ON(rc == 0);
+
+    /* TXT Private Space */
+    rc = mark_ram_as(&e820_raw, TXT_PRIV_CONFIG_REGS_BASE,
+                     TXT_PRIV_CONFIG_REGS_BASE + NR_TXT_CONFIG_SIZE,
+                     E820_UNUSABLE);
+    BUG_ON(rc == 0);
+}
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 24b36c1a59..403d976449 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -52,6 +52,7 @@
 #include <asm/prot-key.h>
 #include <asm/pv/domain.h>
 #include <asm/setup.h>
+#include <asm/slaunch.h>
 #include <asm/smp.h>
 #include <asm/spec_ctrl.h>
 #include <asm/tboot.h>
@@ -1058,9 +1059,6 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     return d;
 }
 
-/* How much of the directmap is prebuilt at compile time. */
-#define PREBUILT_MAP_LIMIT (1 << L2_PAGETABLE_SHIFT)
-
 void asmlinkage __init noreturn __start_xen(void)
 {
     const char *memmap_type = NULL;
@@ -1396,6 +1394,12 @@ void asmlinkage __init noreturn __start_xen(void)
 #endif
     }
 
+    if ( slaunch_active )
+    {
+        slaunch_map_mem_regions();
+        slaunch_reserve_mem_regions();
+    }
+
     /* Sanitise the raw E820 map to produce a final clean version. */
     max_page = raw_max_page = init_e820(memmap_type, &e820_raw);
 
diff --git a/xen/arch/x86/slaunch.c b/xen/arch/x86/slaunch.c
index 0404084b02..20e277cc5c 100644
--- a/xen/arch/x86/slaunch.c
+++ b/xen/arch/x86/slaunch.c
@@ -7,7 +7,11 @@
 #include <xen/compiler.h>
 #include <xen/init.h>
 #include <xen/macros.h>
+#include <xen/mm.h>
 #include <xen/types.h>
+#include <asm/e820.h>
+#include <asm/intel_txt.h>
+#include <asm/page.h>
 #include <asm/slaunch.h>
 
 /*
@@ -24,3 +28,95 @@ static void __maybe_unused compile_time_checks(void)
 {
     BUILD_BUG_ON(sizeof(slaunch_active) != 1);
 }
+
+struct slr_table *__init slaunch_get_slrt(void)
+{
+    static struct slr_table *slrt;
+
+    if (slrt == NULL) {
+        int rc;
+
+        slrt = __va(slaunch_slrt);
+
+        rc = slaunch_map_l2(slaunch_slrt, PAGE_SIZE);
+        BUG_ON(rc != 0);
+
+        if ( slrt->magic != SLR_TABLE_MAGIC )
+            panic("SLRT has invalid magic value: %#08x!\n", slrt->magic);
+        /* XXX: are newer revisions allowed? */
+        if ( slrt->revision != SLR_TABLE_REVISION )
+            panic("SLRT is of unsupported revision: %#04x!\n", slrt->revision);
+        if ( slrt->architecture != SLR_INTEL_TXT )
+            panic("SLRT is for unexpected architecture: %#04x!\n",
+                  slrt->architecture);
+        if ( slrt->size > slrt->max_size )
+            panic("SLRT is larger than its max size: %#08x > %#08x!\n",
+                  slrt->size, slrt->max_size);
+
+        if ( slrt->size > PAGE_SIZE )
+        {
+            rc = slaunch_map_l2(slaunch_slrt, slrt->size);
+            BUG_ON(rc != 0);
+        }
+    }
+
+    return slrt;
+}
+
+void __init slaunch_map_mem_regions(void)
+{
+    void *evt_log_addr;
+    uint32_t evt_log_size;
+
+    /* Vendor-specific part. */
+    txt_map_mem_regions();
+
+    find_evt_log(slaunch_get_slrt(), &evt_log_addr, &evt_log_size);
+    if ( evt_log_addr != NULL )
+    {
+        int rc = slaunch_map_l2((uintptr_t)evt_log_addr, evt_log_size);
+        BUG_ON(rc != 0);
+    }
+}
+
+void __init slaunch_reserve_mem_regions(void)
+{
+    int rc;
+
+    void *evt_log_addr;
+    uint32_t evt_log_size;
+
+    /* Vendor-specific part. */
+    txt_reserve_mem_regions();
+
+    find_evt_log(slaunch_get_slrt(), &evt_log_addr, &evt_log_size);
+    if ( evt_log_addr != NULL )
+    {
+        printk("SLAUNCH: reserving event log (%#lx - %#lx)\n",
+               (uint64_t)evt_log_addr,
+               (uint64_t)evt_log_addr + evt_log_size);
+        rc = reserve_e820_ram(&e820_raw, (uint64_t)evt_log_addr,
+                              (uint64_t)evt_log_addr + evt_log_size);
+        BUG_ON(rc == 0);
+    }
+}
+
+int __init slaunch_map_l2(unsigned long paddr, unsigned long size)
+{
+    unsigned long aligned_paddr = paddr & ~((1ULL << L2_PAGETABLE_SHIFT) - 1);
+    unsigned long pages = ((paddr + size) - aligned_paddr);
+    pages = ROUNDUP(pages, 1ULL << L2_PAGETABLE_SHIFT) >> PAGE_SHIFT;
+
+    if ( aligned_paddr + pages * PAGE_SIZE <= PREBUILT_MAP_LIMIT )
+        return 0;
+
+    if ( aligned_paddr < PREBUILT_MAP_LIMIT )
+    {
+        pages -= (PREBUILT_MAP_LIMIT - aligned_paddr) >> PAGE_SHIFT;
+        aligned_paddr = PREBUILT_MAP_LIMIT;
+    }
+
+    return map_pages_to_xen((uintptr_t)__va(aligned_paddr),
+                            maddr_to_mfn(aligned_paddr),
+                            pages, PAGE_HYPERVISOR);
+}
-- 
2.49.0


