Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A2F77B516
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 11:06:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583511.913729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVTWa-00073d-0J; Mon, 14 Aug 2023 09:06:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583511.913729; Mon, 14 Aug 2023 09:06:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVTWZ-00071N-To; Mon, 14 Aug 2023 09:06:07 +0000
Received: by outflank-mailman (input) for mailman id 583511;
 Mon, 14 Aug 2023 09:06:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DK7P=D7=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qVTWY-00071H-5z
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 09:06:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb2d292a-3a81-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 11:06:03 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 8E66F4EE0737;
 Mon, 14 Aug 2023 11:06:02 +0200 (CEST)
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
X-Inumbo-ID: cb2d292a-3a81-11ee-8613-37d641c3527e
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [XEN PATCH v2] x86: address MISRA C:2012 Rule 5.3
Date: Mon, 14 Aug 2023 11:05:30 +0200
Message-Id: <c0bb67b18e1ad158a8af059abd1436c36eb8edf6.1692003656.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Address some occurrences of shadowing between the global
variable 'e820' in 'xen/arch/x86/e820.c' and the function
parameter name of 'e820_add_range'.

Since the function is only ever called with the global variable
as the actual parameter, so there is no need to have it as a parameter
because both are defined in the same file (mentioned above).
This in turn causes several other functions to lose their parameter
'e820' because they are involved in the call chain that leads to
'e820_add_range'.

Similarly, 'kexec_reserve_area' is only ever called with the static
variable 'boot_e820' as a parameter, which is defined in the same file
as the function, thus it does not need that parameter, which is a cause
of shadowing, as explained above.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- Mention 'kexec_reserve_area' in the commit message.

Other occurrences of shadowing on the same global in
'e820_change_range_type' and 'reserve_e820_ram' are not addressed in
this patch and will be the subject of a future one, as the parameter
needs to be renamed instead, and could potentially be part of a general
name refactoring for consistency around e820.

The following threads are useful to have more context about this patch, which
was previously part of a series of changes related to the same MISRA Rule.
- https://lore.kernel.org/xen-devel/3a9db416c6f8b2d5a549d49ff02238eb408cc905.1691492441.git.nicola.vetrini@bugseng.com/
- https://lore.kernel.org/xen-devel/896a2235560fd348f79eded33731609c5d2e74ab.1691162261.git.nicola.vetrini@bugseng.com/
---
 xen/arch/x86/e820.c                         | 38 ++++++++++-----------
 xen/arch/x86/guest/hyperv/hyperv.c          |  4 +--
 xen/arch/x86/guest/hypervisor.c             |  4 +--
 xen/arch/x86/guest/xen/xen.c                |  4 +--
 xen/arch/x86/include/asm/e820.h             |  3 +-
 xen/arch/x86/include/asm/guest/hypervisor.h |  6 ++--
 xen/arch/x86/include/asm/pv/shim.h          |  4 +--
 xen/arch/x86/pv/shim.c                      | 10 +++---
 xen/arch/x86/setup.c                        |  8 ++---
 xen/arch/x86/x86_64/mmconf-fam10h.c         |  2 +-
 xen/drivers/passthrough/amd/iommu_acpi.c    |  2 +-
 11 files changed, 42 insertions(+), 43 deletions(-)

diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
index 4911e64b8cf4..6a3ce7e0a07f 100644
--- a/xen/arch/x86/e820.c
+++ b/xen/arch/x86/e820.c
@@ -543,27 +543,27 @@ static void __init machine_specific_memory_setup(struct e820map *raw)
         clip_to_limit(top_of_ram, "MTRRs do not cover all of memory.");
 }

-/* This function relies on the passed in e820->map[] being sorted. */
-int __init e820_add_range(
-    struct e820map *e820, uint64_t s, uint64_t e, uint32_t type)
+/* This function relies on the global e820->map[] being sorted. */
+int __init e820_add_range(uint64_t s, uint64_t e, uint32_t type)
 {
     unsigned int i;
+    struct e820entry *ei = e820.map;

-    for ( i = 0; i < e820->nr_map; ++i )
+    for ( i = 0; i < e820.nr_map; ++i )
     {
-        uint64_t rs = e820->map[i].addr;
-        uint64_t re = rs + e820->map[i].size;
+        uint64_t rs = ei[i].addr;
+        uint64_t re = rs + ei[i].size;

-        if ( rs == e && e820->map[i].type == type )
+        if ( rs == e && ei[i].type == type )
         {
-            e820->map[i].addr = s;
+            ei[i].addr = s;
             return 1;
         }

-        if ( re == s && e820->map[i].type == type &&
-             (i + 1 == e820->nr_map || e820->map[i + 1].addr >= e) )
+        if ( re == s && ei[i].type == type &&
+             (i + 1 == e820.nr_map || ei[i + 1].addr >= e) )
         {
-            e820->map[i].size += e - s;
+            ei[i].size += e - s;
             return 1;
         }

@@ -574,20 +574,20 @@ int __init e820_add_range(
             return 0;
     }

-    if ( e820->nr_map >= ARRAY_SIZE(e820->map) )
+    if ( e820.nr_map >= ARRAY_SIZE(e820.map) )
     {
         printk(XENLOG_WARNING "E820: overflow while adding region"
                " %"PRIx64"-%"PRIx64"\n", s, e);
         return 0;
     }

-    memmove(e820->map + i + 1, e820->map + i,
-            (e820->nr_map - i) * sizeof(*e820->map));
+    memmove(ei + i + 1, ei + i,
+            (e820.nr_map - i) * sizeof(*e820.map));

-    e820->nr_map++;
-    e820->map[i].addr = s;
-    e820->map[i].size = e - s;
-    e820->map[i].type = type;
+    e820.nr_map++;
+    ei[i].addr = s;
+    ei[i].size = e - s;
+    ei[i].type = type;

     return 1;
 }
@@ -694,7 +694,7 @@ unsigned long __init init_e820(const char *str, struct e820map *raw)
     machine_specific_memory_setup(raw);

     if ( cpu_has_hypervisor )
-        hypervisor_e820_fixup(&e820);
+        hypervisor_e820_fixup();

     printk("%s RAM map:\n", str);
     print_e820_memory_map(e820.map, e820.nr_map);
diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/guest/hyperv/hyperv.c
index aacc7a61670b..912099564ec4 100644
--- a/xen/arch/x86/guest/hyperv/hyperv.c
+++ b/xen/arch/x86/guest/hyperv/hyperv.c
@@ -187,11 +187,11 @@ static int cf_check ap_setup(void)
     return setup_vp_assist();
 }

-static void __init cf_check e820_fixup(struct e820map *e820)
+static void __init cf_check e820_fixup(void)
 {
     uint64_t s = HV_HCALL_MFN << PAGE_SHIFT;

-    if ( !e820_add_range(e820, s, s + PAGE_SIZE, E820_RESERVED) )
+    if ( !e820_add_range(s, s + PAGE_SIZE, E820_RESERVED) )
         panic("Unable to reserve Hyper-V hypercall range\n");
 }

diff --git a/xen/arch/x86/guest/hypervisor.c b/xen/arch/x86/guest/hypervisor.c
index b8549a131a5a..e0b046cc6c89 100644
--- a/xen/arch/x86/guest/hypervisor.c
+++ b/xen/arch/x86/guest/hypervisor.c
@@ -60,10 +60,10 @@ void hypervisor_resume(void)
         ops.resume();
 }

-void __init hypervisor_e820_fixup(struct e820map *e820)
+void __init hypervisor_e820_fixup(void)
 {
     if ( ops.e820_fixup )
-        ops.e820_fixup(e820);
+        ops.e820_fixup();
 }

 int hypervisor_flush_tlb(const cpumask_t *mask, const void *va,
diff --git a/xen/arch/x86/guest/xen/xen.c b/xen/arch/x86/guest/xen/xen.c
index f93dfc89f724..2eed32fe46c7 100644
--- a/xen/arch/x86/guest/xen/xen.c
+++ b/xen/arch/x86/guest/xen/xen.c
@@ -306,10 +306,10 @@ static void cf_check resume(void)
         pv_console_init();
 }

-static void __init cf_check e820_fixup(struct e820map *e820)
+static void __init cf_check e820_fixup(void)
 {
     if ( pv_shim )
-        pv_shim_fixup_e820(e820);
+        pv_shim_fixup_e820();
 }

 static int cf_check flush_tlb(
diff --git a/xen/arch/x86/include/asm/e820.h b/xen/arch/x86/include/asm/e820.h
index 213d5b5dd227..af90085d65d1 100644
--- a/xen/arch/x86/include/asm/e820.h
+++ b/xen/arch/x86/include/asm/e820.h
@@ -29,8 +29,7 @@ extern int reserve_e820_ram(struct e820map *e820, uint64_t s, uint64_t e);
 extern int e820_change_range_type(
     struct e820map *e820, uint64_t s, uint64_t e,
     uint32_t orig_type, uint32_t new_type);
-extern int e820_add_range(
-    struct e820map *, uint64_t s, uint64_t e, uint32_t type);
+extern int e820_add_range(uint64_t s, uint64_t e, uint32_t type);
 extern unsigned long init_e820(const char *str, struct e820map *raw);
 extern void print_e820_memory_map(const struct e820entry *map,
     unsigned int entries);
diff --git a/xen/arch/x86/include/asm/guest/hypervisor.h b/xen/arch/x86/include/asm/guest/hypervisor.h
index 4cffea386609..c8f18a035ee6 100644
--- a/xen/arch/x86/include/asm/guest/hypervisor.h
+++ b/xen/arch/x86/include/asm/guest/hypervisor.h
@@ -22,7 +22,7 @@ struct hypervisor_ops {
     /* Resume from suspension */
     void (*resume)(void);
     /* Fix up e820 map */
-    void (*e820_fixup)(struct e820map *e820);
+    void (*e820_fixup)(void);
     /* L0 assisted TLB flush */
     int (*flush_tlb)(const cpumask_t *mask, const void *va, unsigned int flags);
 };
@@ -33,7 +33,7 @@ const char *hypervisor_probe(void);
 void hypervisor_setup(void);
 int hypervisor_ap_setup(void);
 void hypervisor_resume(void);
-void hypervisor_e820_fixup(struct e820map *e820);
+void hypervisor_e820_fixup(void);
 /*
  * L0 assisted TLB flush.
  * mask: cpumask of the dirty vCPUs that should be flushed.
@@ -52,7 +52,7 @@ static inline const char *hypervisor_probe(void) { return NULL; }
 static inline void hypervisor_setup(void) { ASSERT_UNREACHABLE(); }
 static inline int hypervisor_ap_setup(void) { return 0; }
 static inline void hypervisor_resume(void) { ASSERT_UNREACHABLE(); }
-static inline void hypervisor_e820_fixup(struct e820map *e820) {}
+static inline void hypervisor_e820_fixup(void) {}
 static inline int hypervisor_flush_tlb(const cpumask_t *mask, const void *va,
                                        unsigned int flags)
 {
diff --git a/xen/arch/x86/include/asm/pv/shim.h b/xen/arch/x86/include/asm/pv/shim.h
index 5625b90b72bd..6153e2700598 100644
--- a/xen/arch/x86/include/asm/pv/shim.h
+++ b/xen/arch/x86/include/asm/pv/shim.h
@@ -33,7 +33,7 @@ void pv_shim_online_memory(unsigned int nr, unsigned int order);
 void pv_shim_offline_memory(unsigned int nr, unsigned int order);
 domid_t get_initial_domain_id(void);
 uint64_t pv_shim_mem(uint64_t avail);
-void pv_shim_fixup_e820(struct e820map *e820);
+void pv_shim_fixup_e820(void);
 const struct platform_bad_page *pv_shim_reserved_pages(unsigned int *size);
 typeof(do_event_channel_op) pv_shim_event_channel_op;
 typeof(do_grant_table_op) pv_shim_grant_table_op;
@@ -85,7 +85,7 @@ static inline uint64_t pv_shim_mem(uint64_t avail)
     ASSERT_UNREACHABLE();
     return 0;
 }
-static inline void pv_shim_fixup_e820(struct e820map *e820)
+static inline void pv_shim_fixup_e820(void)
 {
     ASSERT_UNREACHABLE();
 }
diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index 404408711972..ca0e639db323 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -98,17 +98,17 @@ uint64_t pv_shim_mem(uint64_t avail)
     return shim_nrpages;
 }

-static void __init mark_pfn_as_ram(struct e820map *e820, uint64_t pfn)
+static void __init mark_pfn_as_ram(uint64_t pfn)
 {
-    if ( !e820_add_range(e820, pfn << PAGE_SHIFT,
+    if ( !e820_add_range(pfn << PAGE_SHIFT,
                          (pfn << PAGE_SHIFT) + PAGE_SIZE, E820_RAM) &&
-         !e820_change_range_type(e820, pfn << PAGE_SHIFT,
+         !e820_change_range_type(&e820, pfn << PAGE_SHIFT,
                                  (pfn << PAGE_SHIFT) + PAGE_SIZE,
                                  E820_RESERVED, E820_RAM) )
         panic("Unable to add/change memory type of pfn %#lx to RAM\n", pfn);
 }

-void __init pv_shim_fixup_e820(struct e820map *e820)
+void __init pv_shim_fixup_e820(void)
 {
     uint64_t pfn = 0;
     unsigned int i = 0;
@@ -120,7 +120,7 @@ void __init pv_shim_fixup_e820(struct e820map *e820)
     rc = xen_hypercall_hvm_get_param(p, &pfn);  \
     if ( rc )                                   \
         panic("Unable to get " #p "\n");        \
-    mark_pfn_as_ram(e820, pfn);                 \
+    mark_pfn_as_ram(pfn);                       \
     ASSERT(i < ARRAY_SIZE(reserved_pages));     \
     reserved_pages[i++].mfn = pfn;              \
 })
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 2bfc1fd00f8c..3358d9a0ff63 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -688,7 +688,7 @@ static void __init parse_video_info(void)
 #endif
 }

-static void __init kexec_reserve_area(struct e820map *e820)
+static void __init kexec_reserve_area(void)
 {
 #ifdef CONFIG_KEXEC
     unsigned long kdump_start = kexec_crash_area.start;
@@ -702,7 +702,7 @@ static void __init kexec_reserve_area(struct e820map *e820)

     is_reserved = true;

-    if ( !reserve_e820_ram(e820, kdump_start, kdump_start + kdump_size) )
+    if ( !reserve_e820_ram(&boot_e820, kdump_start, kdump_start + kdump_size) )
     {
         printk("Kdump: DISABLED (failed to reserve %luMB (%lukB) at %#lx)"
                "\n", kdump_size >> 20, kdump_size >> 10, kdump_start);
@@ -1310,7 +1310,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         if ( e820.map[i].type == E820_RAM )
             nr_pages += e820.map[i].size >> PAGE_SHIFT;
     set_kexec_crash_area_size((u64)nr_pages << PAGE_SHIFT);
-    kexec_reserve_area(&boot_e820);
+    kexec_reserve_area();

     initial_images = mod;
     nr_initial_images = mbi->mods_count;
@@ -1497,7 +1497,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         reserve_e820_ram(&boot_e820, __pa(_stext), __pa(__2M_rwdata_end));

     /* Late kexec reservation (dynamic start address). */
-    kexec_reserve_area(&boot_e820);
+    kexec_reserve_area();

     setup_max_pdx(raw_max_page);
     if ( highmem_start )
diff --git a/xen/arch/x86/x86_64/mmconf-fam10h.c b/xen/arch/x86/x86_64/mmconf-fam10h.c
index a834ab3149be..36b32eb769e1 100644
--- a/xen/arch/x86/x86_64/mmconf-fam10h.c
+++ b/xen/arch/x86/x86_64/mmconf-fam10h.c
@@ -135,7 +135,7 @@ static void __init get_fam10h_pci_mmconf_base(void)
 	return;

 out:
-	if (e820_add_range(&e820, start, start + SIZE, E820_RESERVED))
+	if (e820_add_range(start, start + SIZE, E820_RESERVED))
 		fam10h_pci_mmconf_base = start;
 }

diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
index 3b577c9b390c..db993d6df275 100644
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -418,7 +418,7 @@ static int __init parse_ivmd_block(const struct acpi_ivrs_memory *ivmd_block)

             if ( type == RAM_TYPE_UNKNOWN )
             {
-                if ( e820_add_range(&e820, addr, addr + PAGE_SIZE,
+                if ( e820_add_range(addr, addr + PAGE_SIZE,
                                     E820_RESERVED) )
                     continue;
                 AMD_IOMMU_ERROR("IVMD: page at %lx couldn't be reserved\n",
--
2.34.1

