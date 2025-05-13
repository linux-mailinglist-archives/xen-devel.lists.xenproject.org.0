Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18810AB5ABC
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 19:06:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983189.1369586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEt5Y-0005OW-AL; Tue, 13 May 2025 17:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983189.1369586; Tue, 13 May 2025 17:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEt5Y-0005LY-59; Tue, 13 May 2025 17:06:44 +0000
Received: by outflank-mailman (input) for mailman id 983189;
 Tue, 13 May 2025 17:06:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dvFL=X5=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uEt5W-0003Uz-52
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 17:06:42 +0000
Received: from 3.mo560.mail-out.ovh.net (3.mo560.mail-out.ovh.net
 [46.105.58.226]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a32417f8-301c-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 19:06:40 +0200 (CEST)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.9.41])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4ZxjYr0fnXz2608
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 17:06:40 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-zc9lv (unknown [10.111.182.11])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id E92D51FE93;
 Tue, 13 May 2025 17:06:38 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.97])
 by ghost-submission-5b5ff79f4f-zc9lv with ESMTPSA
 id v4giIh58I2hOCwAAwZMn8g
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 13 May 2025 17:06:38 +0000
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
X-Inumbo-ID: a32417f8-301c-11f0-9ffb-bf95429c2676
Authentication-Results:garm.ovh; auth=pass (GARM-97G0027c0ea9b5-02f7-4c0b-a2ce-a4b0217a26c7,
                    0F27B6D195039ACFBDF5EC7F2AC12BEA7E98F15C) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v2 06/22] xen/arch/x86: reserve TXT memory during Slaunch
Date: Tue, 13 May 2025 20:05:43 +0300
Message-ID: <1de7add75db7b15f157adc89922470bed67bef09.1747155790.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8944148862897534108
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdegieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepgeekffeiiedtveekhfdugeffveeigefgleegvdeghefftdetheefueeliedukedvnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukedurddujeekpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehiedtmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=NikVSRACtV+SZZqcNOgRXTNCO+PpplVigM2Tfg0XHoo=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1747156000; v=1;
 b=fZtKCBjbDDeZMd8KNSZTJYb/vINI0F8DKvSdgoBZUILNd4RKah16AszQefIyF12e8dIuMd0n
 yYvjQbpQOnuFQccFMO0sY94Me/3HiSSHNRUIPCRqOw7Ech47Ta6ZvzwA1/+3VeddU6InO02d2zf
 CMVb1UK1ZBNMtUcSMAeFt6fqpRRh/pJsolZjXKvrUx/swM8ReHcfhwYioDH4tp8v2pT1TBJmF63
 COz86IOfgQUiXi3Mgb2GHsHOu34gvAtNb4wZwuk+jaCC9CZJ5aZGbVPTfk1rSaqrFnmWQDQVdE3
 62WOWeTv1fe2VgogoXWvRlhYVko0BgYFj+Q72Zxe7Ruzg==

From: Kacper Stojek <kacper.stojek@3mdeb.com>

TXT heap, SINIT and TXT private space are marked as reserved or unused
in e820 to protect from unintended uses.

Signed-off-by: Kacper Stojek <kacper.stojek@3mdeb.com>
Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Michał Żygowski <michal.zygowski@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 xen/arch/x86/Makefile                |   1 +
 xen/arch/x86/include/asm/intel-txt.h |   6 ++
 xen/arch/x86/include/asm/mm.h        |   3 +
 xen/arch/x86/include/asm/slaunch.h   |  44 +++++++++++
 xen/arch/x86/intel-txt.c             | 113 +++++++++++++++++++++++++++
 xen/arch/x86/setup.c                 |  10 ++-
 xen/arch/x86/slaunch.c               |  98 ++++++++++++++++++++++-
 7 files changed, 271 insertions(+), 4 deletions(-)
 create mode 100644 xen/arch/x86/intel-txt.c

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 43a80be458..6f15c5a87a 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -38,6 +38,7 @@ obj-$(CONFIG_GDBSX) += gdbsx.o
 obj-y += hypercall.o
 obj-y += i387.o
 obj-y += i8259.o
+obj-y += intel-txt.o
 obj-y += io_apic.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o
 obj-y += msi.o
diff --git a/xen/arch/x86/include/asm/intel-txt.h b/xen/arch/x86/include/asm/intel-txt.h
index 339c29ebef..0126f56a6c 100644
--- a/xen/arch/x86/include/asm/intel-txt.h
+++ b/xen/arch/x86/include/asm/intel-txt.h
@@ -399,6 +399,12 @@ static inline void txt_verify_pmr_ranges(struct txt_os_mle_data *os_mle,
     */
 }
 
+/* Prepares for accesses to TXT-specific memory. */
+void txt_map_mem_regions(void);
+
+/* Marks TXT-specific memory as used to avoid its corruption. */
+void txt_reserve_mem_regions(void);
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* ASM__X86__INTEL_TXT_H */
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index d6e80db71c..91fa95cd90 100644
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
index 3fc5f00073..ddc1bd2361 100644
--- a/xen/arch/x86/include/asm/slaunch.h
+++ b/xen/arch/x86/include/asm/slaunch.h
@@ -7,6 +7,7 @@
 #ifndef ASM__X86__SLAUNCH_H
 #define ASM__X86__SLAUNCH_H
 
+#include <xen/slr-table.h>
 #include <xen/types.h>
 
 /* Indicates an active Secure Launch boot. */
@@ -18,9 +19,52 @@ extern bool slaunch_active;
  */
 extern uint32_t slaunch_slrt;
 
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
 #endif /* ASM__X86__SLAUNCH_H */
diff --git a/xen/arch/x86/intel-txt.c b/xen/arch/x86/intel-txt.c
new file mode 100644
index 0000000000..67051b0917
--- /dev/null
+++ b/xen/arch/x86/intel-txt.c
@@ -0,0 +1,113 @@
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
+#include <asm/intel-txt.h>
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
+static int __init mark_ram_as(struct e820map *map, uint64_t start,
+                              uint64_t end, uint32_t type)
+{
+    unsigned int i;
+    uint32_t from_type = E820_RAM;
+
+    for ( i = 0; i < map->nr_map; i++ )
+    {
+        uint64_t rs = map->map[i].addr;
+        uint64_t re = rs + map->map[i].size;
+
+        /* The entry includes the range. */
+        if ( start >= rs && end <= re )
+            break;
+
+        /* The entry intersects the range. */
+        if ( end > rs && start < re )
+        {
+            /* Fatal failure. */
+            return 0;
+        }
+    }
+
+    /*
+     * If the range is not included by any entry and no entry intersects it,
+     * then it's not listed in the memory map.  Consider this case as a success
+     * since we're only preventing RAM from being used and unlisted range should
+     * not be used.
+     */
+    if ( i == map->nr_map )
+        return 1;
+
+    /*
+     * e820_change_range_type() fails if the range is already marked with the
+     * desired type.  Don't consider it an error if firmware has done it for us.
+     */
+    if ( map->map[i].type == type )
+        return 1;
+
+    /* E820_ACPI or E820_NVS are really unexpected, but others are fine. */
+    if ( map->map[i].type == E820_RESERVED ||
+         map->map[i].type == E820_UNUSABLE )
+        from_type = map->map[i].type;
+
+    return e820_change_range_type(map, start, end, from_type, type);
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
index 2518954124..479d2d744e 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -53,6 +53,7 @@
 #include <asm/prot-key.h>
 #include <asm/pv/domain.h>
 #include <asm/setup.h>
+#include <asm/slaunch.h>
 #include <asm/smp.h>
 #include <asm/spec_ctrl.h>
 #include <asm/tboot.h>
@@ -1086,9 +1087,6 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     return d;
 }
 
-/* How much of the directmap is prebuilt at compile time. */
-#define PREBUILT_MAP_LIMIT (1 << L2_PAGETABLE_SHIFT)
-
 void asmlinkage __init noreturn __start_xen(void)
 {
     const char *memmap_type = NULL;
@@ -1424,6 +1422,12 @@ void asmlinkage __init noreturn __start_xen(void)
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
index a3e6ab8d71..ac3b43942b 100644
--- a/xen/arch/x86/slaunch.c
+++ b/xen/arch/x86/slaunch.c
@@ -7,14 +7,18 @@
 #include <xen/compiler.h>
 #include <xen/init.h>
 #include <xen/macros.h>
+#include <xen/mm.h>
 #include <xen/types.h>
+#include <asm/e820.h>
+#include <asm/intel-txt.h>
+#include <asm/page.h>
 #include <asm/slaunch.h>
 
 /*
  * These variables are assigned to by the code near Xen's entry point.
  *
  * slaunch_active is not __initdata to allow checking for an active Secure
- * Launch boot.
+ * Launch boot at any point.
  */
 bool slaunch_active;
 uint32_t __initdata slaunch_slrt; /* physical address */
@@ -25,3 +29,95 @@ static void __maybe_unused compile_time_checks(void)
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


