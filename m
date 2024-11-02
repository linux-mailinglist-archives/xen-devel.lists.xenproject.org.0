Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E3D9BA1BD
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2024 18:37:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829598.1244608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7I31-0001C0-Gp; Sat, 02 Nov 2024 17:36:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829598.1244608; Sat, 02 Nov 2024 17:36:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7I31-00019N-AE; Sat, 02 Nov 2024 17:36:27 +0000
Received: by outflank-mailman (input) for mailman id 829598;
 Sat, 02 Nov 2024 17:36:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RajI=R5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t7HuK-0005zO-6m
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2024 17:27:28 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9042e17-993f-11ef-a0c5-8be0dac302b0;
 Sat, 02 Nov 2024 18:27:25 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730568371686592.9410739240645;
 Sat, 2 Nov 2024 10:26:11 -0700 (PDT)
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
X-Inumbo-ID: b9042e17-993f-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImI5MDQyZTE3LTk5M2YtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNTY4NDQ1LjYwOTg4OCwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730568382; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mTxocaw2aTmmjbtNyLxeZlPAg6zz7wgDZuCq2P1ZmgTQ318SnYwvsHxs++ub8gBGADVllyy8TIp0jNLmAPUnVxrxqbAsG1jWeEOWQef07ePN2dmsbPYYcnKzYh3Gtptlfr7VPy2AiZvbG8jaEJ4MBL3tzWvkGS/VgyMx9VDjE3U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730568382; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Lqch7F1xargZBo/VkvL/BtzwFfKefeZoUmZw1HodarM=; 
	b=QTwU7SPpLluNGZbz96hnXDrB1BK94BqPuCfkrHryY5Vf5qq5eUThL9vib1sGfIIH18tMkvh4M4RSvzCWYbxbLQGi2U6VhorARbRR1HcNsPFv73KKHewL0HqnLizN0rJLfznKZE9YuxoXaGMfNG1MoTNx/VffnszhOk0ahOyvwqI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730568382;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Lqch7F1xargZBo/VkvL/BtzwFfKefeZoUmZw1HodarM=;
	b=GyszozVMlcznzwc55Q8draW6XhURdi9eZotdbZmL4ZVrD/Rq4qmnsP81psy67uFb
	IV2Jjy26eexd9JM/W1IcwlHx4PP29dmLiBKHRpjtJ4JJujhNyNto7Q4A95fus7N/3yg
	X93HiWdGd9yUAn4CuFyqS2pd0w5T4BahotUszOHk=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 08/12] x86/boot: convert domain construction to use boot info
Date: Sat,  2 Nov 2024 13:25:47 -0400
Message-Id: <20241102172551.17233-9-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241102172551.17233-1-dpsmith@apertussolutions.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

With all the components used to construct dom0 encapsulated in struct boot_info
and struct boot_module, it is no longer necessary to pass all them as
parameters down the domain construction call chain. Change the parameter list
to pass the struct boot_info instance and the struct domain reference.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v5:
- renamed from "x86/boot: convert create_dom0 to use boot info"

Changes since v5:
- change headroom back to unsigned long
- make mod_idx unsigned int
---
 xen/arch/x86/dom0_build.c             |  9 ++--
 xen/arch/x86/hvm/dom0_build.c         | 49 +++++++++++++---------
 xen/arch/x86/include/asm/dom0_build.h | 13 ++----
 xen/arch/x86/include/asm/setup.h      |  7 ++--
 xen/arch/x86/pv/dom0_build.c          | 59 ++++++++++++++++-----------
 xen/arch/x86/setup.c                  | 33 ++++++++-------
 6 files changed, 95 insertions(+), 75 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 8d56705a0861..2276965c02bd 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -13,6 +13,7 @@
 #include <xen/softirq.h>
 
 #include <asm/amd.h>
+#include <asm/bootinfo.h>
 #include <asm/dom0_build.h>
 #include <asm/guest.h>
 #include <asm/hpet.h>
@@ -596,9 +597,7 @@ int __init dom0_setup_permissions(struct domain *d)
     return rc;
 }
 
-int __init construct_dom0(struct domain *d, const module_t *image,
-                          unsigned long image_headroom, module_t *initrd,
-                          const char *cmdline)
+int __init construct_dom0(struct boot_info *bi, struct domain *d)
 {
     int rc;
 
@@ -610,9 +609,9 @@ int __init construct_dom0(struct domain *d, const module_t *image,
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
index a4ac262db463..cd97f94a168a 100644
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
@@ -704,7 +705,7 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
         return rc;
     }
 
-    release_module(image, true);
+    release_boot_module(image, true);
 
     /*
      * Find a RAM region big enough (and that doesn't overlap with the loaded
@@ -727,8 +728,8 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
 
     if ( initrd != NULL )
     {
-        rc = hvm_copy_to_guest_phys(last_addr, mfn_to_virt(initrd->mod_start),
-                                    initrd_len, v);
+        rc = hvm_copy_to_guest_phys(
+            last_addr, mfn_to_virt(initrd->mod->mod_start), initrd_len, v);
         if ( rc )
         {
             printk("Unable to copy initrd to guest\n");
@@ -738,9 +739,9 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
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
@@ -754,7 +755,7 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
         }
         last_addr = ROUNDUP(last_addr, PAGE_SIZE);
 
-        release_module(initrd, true);
+        release_boot_module(initrd, true);
     }
 
     if ( cmdline != NULL )
@@ -1301,16 +1302,25 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
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
     int rc;
 
     printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
 
+    rc = first_boot_module_index(bi, BOOTMOD_KERNEL);
+    if ( unlikely(rc < 0 || rc > bi->nr_modules) )
+        panic("Missing kernel boot module for %pd construction\n", d);
+
+    image = &bi->mods[rc];
+
+    rc = first_boot_module_index(bi, BOOTMOD_RAMDISK);
+    if ( rc > 0 || rc < bi->nr_modules )
+        initrd = &bi->mods[rc];
+
     if ( is_hardware_domain(d) )
     {
         /*
@@ -1348,8 +1358,7 @@ int __init dom0_construct_pvh(struct domain *d, const module_t *image,
         return rc;
     }
 
-    rc = pvh_load_kernel(d, image, image_headroom, initrd, bootstrap_map(image),
-                         cmdline, &entry, &start_info);
+    rc = pvh_load_kernel(d, image, initrd, &entry, &start_info);
     if ( rc )
     {
         printk("Failed to load Dom0 kernel\n");
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index 107c1ff98367..4c2193c4a982 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -13,15 +13,10 @@ unsigned long dom0_compute_nr_pages(struct domain *d,
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
+
+int dom0_construct_pvh(struct boot_info *bi, struct domain *d);
 
 unsigned long dom0_paging_pages(const struct domain *d,
                                 unsigned long nr_pages);
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index d68d37a5293b..1e23f55be51b 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -26,11 +26,10 @@ void subarch_init_memory(void);
 
 void init_IRQ(void);
 
+struct boot_info;
 int construct_dom0(
-    struct domain *d,
-    const module_t *image, unsigned long image_headroom,
-    module_t *initrd,
-    const char *cmdline);
+    struct boot_info *bi,
+    struct domain *d);
 void setup_io_bitmap(struct domain *d);
 
 extern struct boot_info xen_boot_info;
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index c1f44502a1ac..594874cd8d85 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -14,6 +14,7 @@
 #include <xen/softirq.h>
 #include <xen/vga.h>
 
+#include <asm/bootinfo.h>
 #include <asm/bzimage.h>
 #include <asm/dom0_build.h>
 #include <asm/guest.h>
@@ -354,11 +355,7 @@ static struct page_info * __init alloc_chunk(struct domain *d,
     return page;
 }
 
-static int __init dom0_construct(struct domain *d,
-                                 const module_t *image,
-                                 unsigned long image_headroom,
-                                 module_t *initrd,
-                                 const char *cmdline)
+static int __init dom0_construct(struct boot_info *bi, struct domain *d)
 {
     int i, rc, order, machine;
     bool compatible, compat;
@@ -374,10 +371,13 @@ static int __init dom0_construct(struct domain *d,
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
@@ -414,6 +414,23 @@ static int __init dom0_construct(struct domain *d,
 
     printk(XENLOG_INFO "*** Building a PV Dom%d ***\n", d->domain_id);
 
+    i = first_boot_module_index(bi, BOOTMOD_KERNEL);
+    if ( unlikely(i < 0 || i > bi->nr_modules) )
+        panic("Missing kernel boot module for %pd construction\n", d);
+
+    image = &bi->mods[i];
+    image_base = bootstrap_map_bm(image);
+    image_len = image->mod->mod_end;
+    image_start = image_base + image->headroom;
+    cmdline = __va(image->cmdline_pa);
+
+    i = first_boot_module_index(bi, BOOTMOD_RAMDISK);
+    if ( i > 0 || i < bi->nr_modules )
+    {
+        initrd = &bi->mods[i];
+        initrd_len = initrd->mod->mod_end;
+    }
+
     d->max_pages = ~0U;
 
     if ( (rc = bzimage_parse(image_base, &image_start, &image_len)) != 0 )
@@ -613,7 +630,7 @@ static int __init dom0_construct(struct domain *d,
         initrd_pfn = vinitrd_start ?
                      (vinitrd_start - v_start) >> PAGE_SHIFT :
                      domain_tot_pages(d);
-        initrd_mfn = mfn = initrd->mod_start;
+        initrd_mfn = mfn = initrd->mod->mod_start;
         count = PFN_UP(initrd_len);
         if ( d->arch.physaddr_bitsize &&
              ((mfn + count - 1) >> (d->arch.physaddr_bitsize - PAGE_SHIFT)) )
@@ -628,17 +645,17 @@ static int __init dom0_construct(struct domain *d,
                     free_domheap_pages(page, order);
                     page += 1UL << order;
                 }
-            memcpy(page_to_virt(page), mfn_to_virt(initrd->mod_start),
+            memcpy(page_to_virt(page), mfn_to_virt(initrd->mod->mod_start),
                    initrd_len);
-            release_module(initrd, true);
-            initrd->mod_start = initrd_mfn = mfn_x(page_to_mfn(page));
+            release_boot_module(initrd, true);
+            initrd->mod->mod_start = initrd_mfn = mfn_x(page_to_mfn(page));
         }
         else
         {
             while ( count-- )
                 if ( assign_pages(mfn_to_page(_mfn(mfn++)), 1, d, 0) )
                     BUG();
-            release_module(initrd, false);
+            release_boot_module(initrd, false);
         }
 
         iommu_memory_setup(d, "initrd", mfn_to_page(_mfn(initrd_mfn)),
@@ -653,7 +670,7 @@ static int __init dom0_construct(struct domain *d,
                nr_pages - domain_tot_pages(d));
     if ( initrd )
     {
-        mpt_alloc = (paddr_t)initrd->mod_start << PAGE_SHIFT;
+        mpt_alloc = (paddr_t)initrd->mod->mod_start << PAGE_SHIFT;
         printk("\n Init. ramdisk: %"PRIpaddr"->%"PRIpaddr,
                mpt_alloc, mpt_alloc + initrd_len);
     }
@@ -830,7 +847,7 @@ static int __init dom0_construct(struct domain *d,
     }
     /* All done with kernel, release the module pages */
     bootstrap_unmap();
-    release_module(image, true);
+    release_boot_module(image, true);
 
     if ( UNSET_ADDR != parms.virt_hypercall )
     {
@@ -880,7 +897,7 @@ static int __init dom0_construct(struct domain *d,
         if ( pfn >= initrd_pfn )
         {
             if ( pfn < initrd_pfn + PFN_UP(initrd_len) )
-                mfn = initrd->mod_start + (pfn - initrd_pfn);
+                mfn = initrd->mod->mod_start + (pfn - initrd_pfn);
             else
                 mfn -= PFN_UP(initrd_len);
         }
@@ -1048,11 +1065,7 @@ out:
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
@@ -1070,7 +1083,7 @@ int __init dom0_construct_pv(struct domain *d,
         write_cr4(cr4 & ~X86_CR4_SMAP);
     }
 
-    rc = dom0_construct(d, image, image_headroom, initrd, cmdline);
+    rc = dom0_construct(bi, d);
 
     if ( cr4 & X86_CR4_SMAP )
     {
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index aba9df8620ef..d9785acf89b6 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -977,10 +977,7 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
     return n;
 }
 
-static struct domain *__init create_dom0(const module_t *image,
-                                         unsigned long headroom,
-                                         module_t *initrd, const char *kextra,
-                                         const char *loader)
+static struct domain *__init create_dom0(struct boot_info *bi)
 {
     static char __initdata cmdline[MAX_GUEST_CMDLINE];
 
@@ -997,6 +994,14 @@ static struct domain *__init create_dom0(const module_t *image,
     };
     struct domain *d;
     domid_t domid;
+    struct boot_module *image;
+    unsigned int idx;
+
+    idx = first_boot_module_index(bi, BOOTMOD_KERNEL);
+    if ( unlikely(idx < 0 || idx > bi->nr_modules) )
+        panic("Missing kernel boot module for building Dom0\n");
+
+    image = &bi->mods[idx];
 
     if ( opt_dom0_pvh )
     {
@@ -1023,14 +1028,15 @@ static struct domain *__init create_dom0(const module_t *image,
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
@@ -1047,9 +1053,11 @@ static struct domain *__init create_dom0(const module_t *image,
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
@@ -2143,10 +2151,7 @@ void asmlinkage __init noreturn __start_xen(void)
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


