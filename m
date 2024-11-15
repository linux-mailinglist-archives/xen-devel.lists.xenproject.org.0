Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA3F9CDFA2
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 14:12:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837561.1253488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBw7n-0007GA-4s; Fri, 15 Nov 2024 13:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837561.1253488; Fri, 15 Nov 2024 13:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBw7n-0007Ea-1v; Fri, 15 Nov 2024 13:12:35 +0000
Received: by outflank-mailman (input) for mailman id 837561;
 Fri, 15 Nov 2024 13:12:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=54cC=SK=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tBw7l-0006v7-NS
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 13:12:33 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4383f925-a353-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 14:12:29 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1731676332910286.5289440972075;
 Fri, 15 Nov 2024 05:12:12 -0800 (PST)
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
X-Inumbo-ID: 4383f925-a353-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQzODNmOTI1LWEzNTMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjc2MzQ5Ljk3NjYyMSwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1731676335; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RyjrH5jZBLGfC2T3QFvh3yHy1fwVypbpkRsUzULSjDk63acIB7dEJL1xmn1vkw7NzgWooRbgDSbFgqr4f8uovAEG9sNC5v6CJmd0ZvKU/N94gFlDBgRKLMdFmBcB5/5OdYu/+LvzeGX2GYK5/GDd+MBcmScI2o/dTSWmiJMJNaU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731676335; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VzSieBjkOBJnnpxsq7w+NmNX7HbgJy32WIO1NLNWBIo=; 
	b=IgDPo+09caTali1H0gN+XUMRmEjbhQdiNs+upve7vJYIzkEOxr5a970t4RkHauY6fyhTpsaicSm3nwiI+Hs/Yu1aMNavU/xZg+COaI8dcV7NXZQ+O0d+zd+GIFu+/VuJ1SKLcUHGOW6YcafzHtEoURkHSQZ3OpL7BqDs2a4yCy8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731676335;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=VzSieBjkOBJnnpxsq7w+NmNX7HbgJy32WIO1NLNWBIo=;
	b=BhRdaI//kbKABUP7pIEyZ3Hfcn8Y1yHAvbMDUZ++amLvxVi8pR0SwL7ns8+3c6Nl
	gSqdK0OaWHQwGH6ykjM4R9Ae6muF3aqGjzhBJOSlLqmxEo0dypvW9404SAv3SiaB24y
	u6MeS+szM+2CPuOwEYb5zdN61xFQy0zAlY3c9CHc=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v9 1/6] x86/boot: convert domain construction to use boot info
Date: Fri, 15 Nov 2024 08:11:59 -0500
Message-Id: <20241115131204.32135-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241115131204.32135-1-dpsmith@apertussolutions.com>
References: <20241115131204.32135-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

With all the components used to construct dom0 encapsulated in struct boot_info
and struct boot_module, it is no longer necessary to pass all them as
parameters down the domain construction call chain. Change the parameter list
to pass the struct boot_info instance and the struct domain reference.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v8:
- moved forward in the series

Changes since v7:
- renamed from "x86/boot: convert create_dom0 to use boot info"

Changes since v5:
- change headroom back to unsigned long
- make mod_idx unsigned int
---
 xen/arch/x86/dom0_build.c             |  8 ++--
 xen/arch/x86/hvm/dom0_build.c         | 46 ++++++++++++--------
 xen/arch/x86/include/asm/dom0_build.h | 12 ++----
 xen/arch/x86/include/asm/setup.h      |  8 ++--
 xen/arch/x86/pv/dom0_build.c          | 62 +++++++++++++++++----------
 xen/arch/x86/setup.c                  | 33 ++++++++------
 6 files changed, 95 insertions(+), 74 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 72747b92475a..e8f5bf5447bc 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -596,9 +596,7 @@ int __init dom0_setup_permissions(struct domain *d)
     return rc;
 }
 
-int __init construct_dom0(struct domain *d, const module_t *image,
-                          unsigned long image_headroom, module_t *initrd,
-                          const char *cmdline)
+int __init construct_dom0(struct boot_info *bi, struct domain *d)
 {
     int rc;
 
@@ -610,9 +608,9 @@ int __init construct_dom0(struct domain *d, const module_t *image,
     process_pending_softirqs();
 
     if ( is_hvm_domain(d) )
-        rc = dom0_construct_pvh(d, image, image_headroom, initrd, cmdline);
+        rc = dom0_construct_pvh(bi, d);
     else if ( is_pv_domain(d) )
-        rc = dom0_construct_pv(d, image, image_headroom, initrd, cmdline);
+        rc = dom0_construct_pv(bi, d);
     else
         panic("Cannot construct Dom0. No guest interface available\n");
 
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 3dd913bdb029..d1bdf1b14601 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -16,6 +16,7 @@
 
 #include <acpi/actables.h>
 
+#include <asm/bootinfo.h>
 #include <asm/bzimage.h>
 #include <asm/dom0_build.h>
 #include <asm/hvm/support.h>
@@ -642,15 +643,15 @@ static bool __init check_and_adjust_load_address(
     return true;
 }
 
-static int __init pvh_load_kernel(struct domain *d, const module_t *image,
-                                  unsigned long image_headroom,
-                                  module_t *initrd, void *image_base,
-                                  const char *cmdline, paddr_t *entry,
-                                  paddr_t *start_info_addr)
+static int __init pvh_load_kernel(
+    struct domain *d, struct boot_module *image, struct boot_module *initrd,
+    paddr_t *entry, paddr_t *start_info_addr)
 {
-    void *image_start = image_base + image_headroom;
-    unsigned long image_len = image->mod_end;
-    unsigned long initrd_len = initrd ? initrd->mod_end : 0;
+    void *image_base = bootstrap_map_bm(image);
+    void *image_start = image_base + image->headroom;
+    unsigned long image_len = image->mod->mod_end;
+    unsigned long initrd_len = initrd ? initrd->mod->mod_end : 0;
+    const char *cmdline = __va(image->cmdline_pa);
     struct elf_binary elf;
     struct elf_dom_parms parms;
     paddr_t last_addr;
@@ -725,8 +726,8 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
 
     if ( initrd != NULL )
     {
-        rc = hvm_copy_to_guest_phys(last_addr, mfn_to_virt(initrd->mod_start),
-                                    initrd_len, v);
+        rc = hvm_copy_to_guest_phys(
+            last_addr, mfn_to_virt(initrd->mod->mod_start), initrd_len, v);
         if ( rc )
         {
             printk("Unable to copy initrd to guest\n");
@@ -736,9 +737,9 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
         mod.paddr = last_addr;
         mod.size = initrd_len;
         last_addr += ROUNDUP(initrd_len, elf_64bit(&elf) ? 8 : 4);
-        if ( initrd->string )
+        if ( initrd->cmdline_pa )
         {
-            char *str = __va(initrd->string);
+            char *str = __va(initrd->cmdline_pa);
             size_t len = strlen(str) + 1;
 
             rc = hvm_copy_to_guest_phys(last_addr, str, len, v);
@@ -1300,16 +1301,26 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
     }
 }
 
-int __init dom0_construct_pvh(struct domain *d, const module_t *image,
-                              unsigned long image_headroom,
-                              module_t *initrd,
-                              const char *cmdline)
+int __init dom0_construct_pvh(struct boot_info *bi, struct domain *d)
 {
     paddr_t entry, start_info;
+    struct boot_module *image;
+    struct boot_module *initrd = NULL;
+    unsigned int idx;
     int rc;
 
     printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
 
+    idx = first_boot_module_index(bi, BOOTMOD_KERNEL);
+    if ( idx >= bi->nr_modules )
+        panic("Missing kernel boot module for %pd construction\n", d);
+
+    image = &bi->mods[idx];
+
+    idx = first_boot_module_index(bi, BOOTMOD_RAMDISK);
+    if ( idx < bi->nr_modules )
+        initrd = &bi->mods[idx];
+
     if ( is_hardware_domain(d) )
     {
         /*
@@ -1347,8 +1358,7 @@ int __init dom0_construct_pvh(struct domain *d, const module_t *image,
         return rc;
     }
 
-    rc = pvh_load_kernel(d, image, image_headroom, initrd, bootstrap_map(image),
-                         cmdline, &entry, &start_info);
+    rc = pvh_load_kernel(d, image, initrd, &entry, &start_info);
     if ( rc )
     {
         printk("Failed to load Dom0 kernel\n");
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index 107c1ff98367..2d67b17213dc 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -13,15 +13,9 @@ unsigned long dom0_compute_nr_pages(struct domain *d,
                                     unsigned long initrd_len);
 int dom0_setup_permissions(struct domain *d);
 
-int dom0_construct_pv(struct domain *d, const module_t *image,
-                      unsigned long image_headroom,
-                      module_t *initrd,
-                      const char *cmdline);
-
-int dom0_construct_pvh(struct domain *d, const module_t *image,
-                       unsigned long image_headroom,
-                       module_t *initrd,
-                       const char *cmdline);
+struct boot_info;
+int dom0_construct_pv(struct boot_info *bi, struct domain *d);
+int dom0_construct_pvh(struct boot_info *bi, struct domain *d);
 
 unsigned long dom0_paging_pages(const struct domain *d,
                                 unsigned long nr_pages);
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 25c15ef9140d..8a415087e9a4 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -26,11 +26,9 @@ void subarch_init_memory(void);
 
 void init_IRQ(void);
 
-int construct_dom0(
-    struct domain *d,
-    const module_t *image, unsigned long image_headroom,
-    module_t *initrd,
-    const char *cmdline);
+struct boot_info;
+int construct_dom0(struct boot_info *bi, struct domain *d);
+
 void setup_io_bitmap(struct domain *d);
 
 extern struct boot_info xen_boot_info;
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index cc882bee61c3..6be3d7745fab 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -14,6 +14,7 @@
 #include <xen/softirq.h>
 #include <xen/vga.h>
 
+#include <asm/bootinfo.h>
 #include <asm/bzimage.h>
 #include <asm/dom0_build.h>
 #include <asm/guest.h>
@@ -354,13 +355,10 @@ static struct page_info * __init alloc_chunk(struct domain *d,
     return page;
 }
 
-static int __init dom0_construct(struct domain *d,
-                                 const module_t *image,
-                                 unsigned long image_headroom,
-                                 module_t *initrd,
-                                 const char *cmdline)
+static int __init dom0_construct(struct boot_info *bi, struct domain *d)
 {
-    int i, rc, order, machine;
+    unsigned int i;
+    int rc, order, machine;
     bool compatible, compat;
     struct cpu_user_regs *regs;
     unsigned long pfn, mfn;
@@ -374,10 +372,13 @@ static int __init dom0_construct(struct domain *d,
     unsigned int flush_flags = 0;
     start_info_t *si;
     struct vcpu *v = d->vcpu[0];
-    void *image_base = bootstrap_map(image);
-    unsigned long image_len = image->mod_end;
-    void *image_start = image_base + image_headroom;
-    unsigned long initrd_len = initrd ? initrd->mod_end : 0;
+    struct boot_module *image;
+    struct boot_module *initrd = NULL;
+    void *image_base;
+    unsigned long image_len;
+    void *image_start;
+    unsigned long initrd_len = 0;
+    const char *cmdline;
     l4_pgentry_t *l4tab = NULL, *l4start = NULL;
     l3_pgentry_t *l3tab = NULL, *l3start = NULL;
     l2_pgentry_t *l2tab = NULL, *l2start = NULL;
@@ -414,6 +415,23 @@ static int __init dom0_construct(struct domain *d,
 
     printk(XENLOG_INFO "*** Building a PV Dom%d ***\n", d->domain_id);
 
+    i = first_boot_module_index(bi, BOOTMOD_KERNEL);
+    if ( i >= bi->nr_modules )
+        panic("Missing kernel boot module for %pd construction\n", d);
+
+    image = &bi->mods[i];
+    image_base = bootstrap_map_bm(image);
+    image_len = image->mod->mod_end;
+    image_start = image_base + image->headroom;
+    cmdline = __va(image->cmdline_pa);
+
+    i = first_boot_module_index(bi, BOOTMOD_RAMDISK);
+    if ( i < bi->nr_modules )
+    {
+        initrd = &bi->mods[i];
+        initrd_len = initrd->mod->mod_end;
+    }
+
     d->max_pages = ~0U;
 
     if ( (rc = bzimage_parse(image_base, &image_start, &image_len)) != 0 )
@@ -613,7 +631,8 @@ static int __init dom0_construct(struct domain *d,
         initrd_pfn = vinitrd_start ?
                      (vinitrd_start - v_start) >> PAGE_SHIFT :
                      domain_tot_pages(d);
-        initrd_mfn = mfn = initrd->mod_start;
+        initrd_mfn = initrd->mod->mod_start;
+        mfn = initrd_mfn;
         count = PFN_UP(initrd_len);
         if ( d->arch.physaddr_bitsize &&
              ((mfn + count - 1) >> (d->arch.physaddr_bitsize - PAGE_SHIFT)) )
@@ -628,12 +647,13 @@ static int __init dom0_construct(struct domain *d,
                     free_domheap_pages(page, order);
                     page += 1UL << order;
                 }
-            memcpy(page_to_virt(page), mfn_to_virt(initrd->mod_start),
+            memcpy(page_to_virt(page), mfn_to_virt(initrd->mod->mod_start),
                    initrd_len);
-            mpt_alloc = (paddr_t)initrd->mod_start << PAGE_SHIFT;
+            mpt_alloc = pfn_to_paddr(initrd->mod->mod_start);
             init_domheap_pages(mpt_alloc,
                                mpt_alloc + PAGE_ALIGN(initrd_len));
-            initrd->mod_start = initrd_mfn = mfn_x(page_to_mfn(page));
+            initrd_mfn = mfn_x(page_to_mfn(page));
+            initrd->mod->mod_start = initrd_mfn;
         }
         else
         {
@@ -650,7 +670,7 @@ static int __init dom0_construct(struct domain *d,
          * Either way, tell discard_initial_images() to not free it a second
          * time.
          */
-        initrd->mod_end = 0;
+        initrd->mod->mod_end = 0;
 
         iommu_memory_setup(d, "initrd", mfn_to_page(_mfn(initrd_mfn)),
                            PFN_UP(initrd_len), &flush_flags);
@@ -664,7 +684,7 @@ static int __init dom0_construct(struct domain *d,
                nr_pages - domain_tot_pages(d));
     if ( initrd )
     {
-        mpt_alloc = (paddr_t)initrd->mod_start << PAGE_SHIFT;
+        mpt_alloc = pfn_to_paddr(initrd->mod->mod_start);
         printk("\n Init. ramdisk: %"PRIpaddr"->%"PRIpaddr,
                mpt_alloc, mpt_alloc + initrd_len);
     }
@@ -892,7 +912,7 @@ static int __init dom0_construct(struct domain *d,
         if ( pfn >= initrd_pfn )
         {
             if ( pfn < initrd_pfn + PFN_UP(initrd_len) )
-                mfn = initrd->mod_start + (pfn - initrd_pfn);
+                mfn = initrd->mod->mod_start + (pfn - initrd_pfn);
             else
                 mfn -= PFN_UP(initrd_len);
         }
@@ -1060,11 +1080,7 @@ out:
     return rc;
 }
 
-int __init dom0_construct_pv(struct domain *d,
-                             const module_t *image,
-                             unsigned long image_headroom,
-                             module_t *initrd,
-                             const char *cmdline)
+int __init dom0_construct_pv(struct boot_info *bi, struct domain *d)
 {
     unsigned long cr4 = read_cr4();
     int rc;
@@ -1082,7 +1098,7 @@ int __init dom0_construct_pv(struct domain *d,
         write_cr4(cr4 & ~X86_CR4_SMAP);
     }
 
-    rc = dom0_construct(d, image, image_headroom, initrd, cmdline);
+    rc = dom0_construct(bi, d);
 
     if ( cr4 & X86_CR4_SMAP )
     {
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 4feef9f2e05a..495e90a7e132 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -950,10 +950,7 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
     return n;
 }
 
-static struct domain *__init create_dom0(const module_t *image,
-                                         unsigned long headroom,
-                                         module_t *initrd, const char *kextra,
-                                         const char *loader)
+static struct domain *__init create_dom0(struct boot_info *bi)
 {
     static char __initdata cmdline[MAX_GUEST_CMDLINE];
 
@@ -970,6 +967,14 @@ static struct domain *__init create_dom0(const module_t *image,
     };
     struct domain *d;
     domid_t domid;
+    struct boot_module *image;
+    unsigned int idx;
+
+    idx = first_boot_module_index(bi, BOOTMOD_KERNEL);
+    if ( idx >= bi->nr_modules )
+        panic("Missing kernel boot module for building domain\n");
+
+    image = &bi->mods[idx];
 
     if ( opt_dom0_pvh )
     {
@@ -996,14 +1001,15 @@ static struct domain *__init create_dom0(const module_t *image,
         panic("Error creating d%uv0\n", domid);
 
     /* Grab the DOM0 command line. */
-    if ( image->string || kextra )
+    if ( image->cmdline_pa || bi->kextra )
     {
-        if ( image->string )
-            safe_strcpy(cmdline, cmdline_cook(__va(image->string), loader));
+        if ( image->cmdline_pa )
+            safe_strcpy(
+                cmdline, cmdline_cook(__va(image->cmdline_pa), bi->loader));
 
-        if ( kextra )
+        if ( bi->kextra )
             /* kextra always includes exactly one leading space. */
-            safe_strcat(cmdline, kextra);
+            safe_strcat(cmdline, bi->kextra);
 
         /* Append any extra parameters. */
         if ( skip_ioapic_setup && !strstr(cmdline, "noapic") )
@@ -1020,9 +1026,11 @@ static struct domain *__init create_dom0(const module_t *image,
             safe_strcat(cmdline, " acpi=");
             safe_strcat(cmdline, acpi_param);
         }
+
+        image->cmdline_pa = __pa(cmdline);
     }
 
-    if ( construct_dom0(d, image, headroom, initrd, cmdline) != 0 )
+    if ( construct_dom0(bi, d) != 0 )
         panic("Could not construct domain 0\n");
 
     return d;
@@ -2114,10 +2122,7 @@ void asmlinkage __init noreturn __start_xen(void)
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
-    dom0 = create_dom0(bi->mods[0].mod, bi->mods[0].headroom,
-                       initrdidx < bi->nr_modules ? bi->mods[initrdidx].mod
-                                                  : NULL,
-                       bi->kextra, bi->loader);
+    dom0 = create_dom0(bi);
     if ( !dom0 )
         panic("Could not set up DOM0 guest OS\n");
 
-- 
2.30.2


