Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 000235693E6
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 23:08:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362550.592672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CGC-0000L9-TD; Wed, 06 Jul 2022 21:08:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362550.592672; Wed, 06 Jul 2022 21:08:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CGC-0000EN-JT; Wed, 06 Jul 2022 21:08:36 +0000
Received: by outflank-mailman (input) for mailman id 362550;
 Wed, 06 Jul 2022 21:08:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJEZ=XL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1o9CFl-0003HV-0C
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 21:08:09 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bae41d24-fd6f-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 23:08:07 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1657141520651940.6489274956703;
 Wed, 6 Jul 2022 14:05:20 -0700 (PDT)
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
X-Inumbo-ID: bae41d24-fd6f-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; t=1657141522; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bmYSXXAUB8n4jSmYj9pKCDn2/3VNyaxHV4BJgn8SwBVOKjN4q5kJ6wB7JaTqWt+inxiWwVfWvTTdeP5mfEITFjzQoqbHXvMxBx/9V1hgI1JIZc8HO2zLpB4YfWrdECHcz5sOTii9yjMbBosZWbaUom5EXUkbEfTS6GHdMTQfp7w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1657141522; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=eTpqwxpSkEMWg//PoKCMIGmKB8+qr3bwNRO2rt7uCKo=; 
	b=inPXKKpZqe9qe9iysKSIX2T1UnQj+vvh9u+rMs9FCpDbfzpENQQXg/rkhWdb9J7Lpz/I23ah36RQOCM1O/yQjnOgFw/Wx+LoqNcCEhHI7aYI9tHM3RiNbDwuVY9NLsyiQ0yAtI1V7EPibmXkebWlefXxu+fyEwzXvsNhSfOCWwU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1657141522;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=eTpqwxpSkEMWg//PoKCMIGmKB8+qr3bwNRO2rt7uCKo=;
	b=Uo4wzGK9lFd7R8bDuJokrOPOnARrls4G0FKlTP2ZIIA3y0D6zX+sWF1RQvA9SBdF
	tpvS/wxIfvEmRz6AbtHsSkSuF9f0hU0XvPUfqHJ1SOQ453SpXIlmZbmOF2JJoOfLAFA
	fPum7fIiqay1QIJx7SWKiUGo6X8e2FIFD/+bb7g4=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	Wei Liu <wl@xen.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	christopher.clark@starlab.io,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 11/18] x86: initial conversion to domain builder
Date: Wed,  6 Jul 2022 17:04:46 -0400
Message-Id: <20220706210454.30096-12-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220706210454.30096-1-dpsmith@apertussolutions.com>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit is the first step in adopting domain builder. It goes through the
dom0 creation and construction functions, converting them over to consume
struct boot_domaain and changes the startup sequence to use the domain builder
to create and construct dom0.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
---
 xen/arch/x86/dom0_build.c             |  30 +++----
 xen/arch/x86/hvm/dom0_build.c         |  10 +--
 xen/arch/x86/include/asm/dom0_build.h |   8 +-
 xen/arch/x86/include/asm/setup.h      |   5 +-
 xen/arch/x86/pv/dom0_build.c          |  39 ++++-----
 xen/arch/x86/setup.c                  | 114 +++++++++++++++-----------
 6 files changed, 109 insertions(+), 97 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index e44f7f3c43..216c9e3590 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -6,6 +6,7 @@
 
 #include <xen/bootdomain.h>
 #include <xen/bootinfo.h>
+#include <xen/domain_builder.h>
 #include <xen/init.h>
 #include <xen/iocap.h>
 #include <xen/libelf.h>
@@ -556,31 +557,32 @@ int __init dom0_setup_permissions(struct domain *d)
     return rc;
 }
 
-int __init construct_dom0(
-    struct domain *d, const struct boot_module *image,
-    struct boot_module *initrd, char *cmdline)
+int __init construct_domain(struct boot_domain *bd)
 {
-    int rc;
+    int rc = 0;
 
     /* Sanity! */
-    BUG_ON(!pv_shim && d->domain_id != 0);
-    BUG_ON(d->vcpu[0] == NULL);
-    BUG_ON(d->vcpu[0]->is_initialised);
+    BUG_ON(!pv_shim && bd->domid != 0);
+    BUG_ON(bd->domain->vcpu[0] == NULL);
+    BUG_ON(bd->domain->vcpu[0]->is_initialised);
 
     process_pending_softirqs();
 
-    if ( is_hvm_domain(d) )
-        rc = dom0_construct_pvh(d, image, initrd, cmdline);
-    else if ( is_pv_domain(d) )
-        rc = dom0_construct_pv(d, image, initrd, cmdline);
-    else
-        panic("Cannot construct Dom0. No guest interface available\n");
+    if ( builder_is_initdom(bd) )
+    {
+        if ( is_hvm_domain(bd->domain) )
+            rc = dom0_construct_pvh(bd);
+        else if ( is_pv_domain(bd->domain) )
+            rc = dom0_construct_pv(bd);
+        else
+            panic("Cannot construct Dom0. No guest interface available\n");
+    }
 
     if ( rc )
         return rc;
 
     /* Sanity! */
-    BUG_ON(!d->vcpu[0]->is_initialised);
+    BUG_ON(!bd->domain->vcpu[0]->is_initialised);
 
     return 0;
 }
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 4e903a848d..2fee2ed926 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -19,6 +19,7 @@
  */
 
 #include <xen/acpi.h>
+#include <xen/bootdomain.h>
 #include <xen/bootinfo.h>
 #include <xen/init.h>
 #include <xen/libelf.h>
@@ -1217,10 +1218,9 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
     }
 }
 
-int __init dom0_construct_pvh(
-    struct domain *d, const struct boot_module *image,
-    struct boot_module *initrd, char *cmdline)
+int __init dom0_construct_pvh(struct boot_domain *bd)
 {
+    struct domain *d = bd->domain;
     paddr_t entry, start_info;
     int rc;
 
@@ -1249,8 +1249,8 @@ int __init dom0_construct_pvh(
         return rc;
     }
 
-    rc = pvh_load_kernel(d, image, initrd, bootstrap_map(image),
-                         cmdline, &entry, &start_info);
+    rc = pvh_load_kernel(d, bd->kernel, bd->ramdisk, bootstrap_map(bd->kernel),
+                         bd->kernel->string.bytes, &entry, &start_info);
     if ( rc )
     {
         printk("Failed to load Dom0 kernel\n");
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index ad33413710..571b25ea71 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -14,13 +14,9 @@ unsigned long dom0_compute_nr_pages(struct domain *d,
                                     unsigned long initrd_len);
 int dom0_setup_permissions(struct domain *d);
 
-int __init dom0_construct_pv(
-    struct domain *d, const struct boot_module *image,
-    struct boot_module *initrd, char *cmdline);
+int dom0_construct_pv(struct boot_domain *bd);
 
-int __init dom0_construct_pvh(
-    struct domain *d, const struct boot_module *image,
-    struct boot_module *initrd, char *cmdline);
+int dom0_construct_pvh(struct boot_domain *bd);
 
 unsigned long dom0_paging_pages(const struct domain *d,
                                 unsigned long nr_pages);
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 27c0d61819..f9c1468fcc 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -33,9 +33,8 @@ void vesa_init(void);
 static inline void vesa_init(void) {};
 #endif
 
-int construct_dom0(
-    struct domain *d, const struct boot_module *image,
-    struct boot_module *initrd, char *cmdline);
+int construct_domain(struct boot_domain *bd);
+
 void setup_io_bitmap(struct domain *d);
 
 unsigned long initial_images_nrpages(nodeid_t node);
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index f6131147ef..78ebb03b1b 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2002-2005, K A Fraser
  */
 
+#include <xen/bootdomain.h>
 #include <xen/bootinfo.h>
 #include <xen/console.h>
 #include <xen/domain.h>
@@ -295,9 +296,7 @@ static struct page_info * __init alloc_chunk(struct domain *d,
     return page;
 }
 
-int __init dom0_construct_pv(
-    struct domain *d, const struct boot_module *image,
-    struct boot_module *initrd, char *cmdline)
+int __init dom0_construct_pv(struct boot_domain *bd)
 {
     int i, rc, order, machine;
     bool compatible, compat;
@@ -311,11 +310,12 @@ int __init dom0_construct_pv(
     unsigned long count;
     struct page_info *page = NULL;
     start_info_t *si;
+    struct domain *d = bd->domain;
     struct vcpu *v = d->vcpu[0];
-    void *image_base = bootstrap_map(image);
-    unsigned long image_len = image->size;
-    void *image_start = image_base + image->arch->headroom;
-    unsigned long initrd_len = initrd ? initrd->size : 0;
+    void *image_base = bootstrap_map(bd->kernel);
+    unsigned long image_len = bd->kernel->size;
+    void *image_start = image_base + bd->kernel->arch->headroom;
+    unsigned long initrd_len = bd->ramdisk ? bd->ramdisk->size : 0;
     l4_pgentry_t *l4tab = NULL, *l4start = NULL;
     l3_pgentry_t *l3tab = NULL, *l3start = NULL;
     l2_pgentry_t *l2tab = NULL, *l2start = NULL;
@@ -355,7 +355,7 @@ int __init dom0_construct_pv(
     d->max_pages = ~0U;
 
     if ( (rc =
-          bzimage_parse(image_base, &image_start, image->arch->headroom,
+          bzimage_parse(image_base, &image_start, bd->kernel->arch->headroom,
                          &image_len)) != 0 )
         return rc;
 
@@ -545,7 +545,7 @@ int __init dom0_construct_pv(
         initrd_pfn = vinitrd_start ?
                      (vinitrd_start - v_start) >> PAGE_SHIFT :
                      domain_tot_pages(d);
-        initrd_mfn = mfn = mfn_x(initrd->mfn);
+        initrd_mfn = mfn = mfn_x(bd->ramdisk->mfn);
         count = PFN_UP(initrd_len);
         if ( d->arch.physaddr_bitsize &&
              ((mfn + count - 1) >> (d->arch.physaddr_bitsize - PAGE_SHIFT)) )
@@ -560,13 +560,13 @@ int __init dom0_construct_pv(
                     free_domheap_pages(page, order);
                     page += 1UL << order;
                 }
-            memcpy(page_to_virt(page), maddr_to_virt(initrd->start),
+            memcpy(page_to_virt(page), maddr_to_virt(bd->ramdisk->start),
                    initrd_len);
-            mpt_alloc = initrd->start;
+            mpt_alloc = bd->ramdisk->start;
             init_domheap_pages(mpt_alloc,
                                mpt_alloc + PAGE_ALIGN(initrd_len));
-            bootmodule_update_mfn(initrd, page_to_mfn(page));
-            initrd_mfn = mfn_x(initrd->mfn);
+            bootmodule_update_mfn(bd->ramdisk, page_to_mfn(page));
+            initrd_mfn = mfn_x(bd->ramdisk->mfn);
         }
         else
         {
@@ -574,7 +574,7 @@ int __init dom0_construct_pv(
                 if ( assign_pages(mfn_to_page(_mfn(mfn++)), 1, d, 0) )
                     BUG();
         }
-        initrd->size = 0;
+        bd->ramdisk->size = 0;
     }
 
     printk("PHYSICAL MEMORY ARRANGEMENT:\n"
@@ -583,9 +583,9 @@ int __init dom0_construct_pv(
     if ( domain_tot_pages(d) < nr_pages )
         printk(" (%lu pages to be allocated)",
                nr_pages - domain_tot_pages(d));
-    if ( initrd )
+    if ( bd->ramdisk )
     {
-        mpt_alloc = initrd->start;
+        mpt_alloc = bd->ramdisk->start;
         printk("\n Init. ramdisk: %"PRIpaddr"->%"PRIpaddr,
                mpt_alloc, mpt_alloc + initrd_len);
     }
@@ -806,7 +806,7 @@ int __init dom0_construct_pv(
         if ( pfn >= initrd_pfn )
         {
             if ( pfn < initrd_pfn + PFN_UP(initrd_len) )
-                mfn = mfn_x(initrd->mfn) + (pfn - initrd_pfn);
+                mfn = mfn_x(bd->ramdisk->mfn) + (pfn - initrd_pfn);
             else
                 mfn -= PFN_UP(initrd_len);
         }
@@ -866,8 +866,9 @@ int __init dom0_construct_pv(
     }
 
     memset(si->cmd_line, 0, sizeof(si->cmd_line));
-    if ( cmdline != NULL )
-        strlcpy((char *)si->cmd_line, cmdline, sizeof(si->cmd_line));
+    if ( strlen(bd->kernel->string.bytes) > 0 )
+        strlcpy((char *)si->cmd_line, bd->kernel->string.bytes,
+                sizeof(si->cmd_line));
 
 #ifdef CONFIG_VIDEO
     if ( !pv_shim && fill_console_start_info((void *)(si + 1)) )
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 28dbfcd209..860b9e3d64 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -45,7 +45,6 @@
 #include <asm/edd.h>
 #include <xsm/xsm.h>
 #include <asm/tboot.h>
-#include <asm/bzimage.h> /* for bzimage_headroom */
 #include <asm/mach-generic/mach_apic.h> /* for generic_apic_probe */
 #include <asm/setup.h>
 #include <xen/cpu.h>
@@ -272,6 +271,24 @@ static int __init cf_check parse_acpi_param(const char *s)
 }
 custom_param("acpi", parse_acpi_param);
 
+void __init arch_builder_apply_cmdline(
+    struct boot_info *info, struct boot_domain *bd)
+{
+    if ( skip_ioapic_setup && !strstr(bd->kernel->string.bytes, "noapic") )
+        strlcat(bd->kernel->string.bytes, " noapic", MAX_GUEST_CMDLINE);
+    if ( (strlen(acpi_param) == 0) && acpi_disabled )
+    {
+        printk("ACPI is disabled, notifying Domain 0 (acpi=off)\n");
+        strlcpy(acpi_param, "off", sizeof(acpi_param));
+    }
+    if ( (strlen(acpi_param) != 0) &&
+         !strstr(bd->kernel->string.bytes, "acpi=") )
+    {
+        strlcat(bd->kernel->string.bytes, " acpi=", MAX_GUEST_CMDLINE);
+        strlcat(bd->kernel->string.bytes, acpi_param, MAX_GUEST_CMDLINE);
+    }
+}
+
 struct boot_info __initdata *boot_info;
 
 unsigned long __init initial_images_nrpages(nodeid_t node)
@@ -728,7 +745,8 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
     return n;
 }
 
-static struct domain *__init create_dom0(const struct boot_info *bi)
+static struct domain *__init create_dom0(
+    const struct boot_info *bi, struct boot_domain *bd)
 {
     struct xen_domctl_createdomain dom0_cfg = {
         .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
@@ -741,14 +759,10 @@ static struct domain *__init create_dom0(const struct boot_info *bi)
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
         },
     };
-    struct boot_module *image = bootmodule_next_by_kind(bi, BOOTMOD_KERNEL, 0);
-    struct boot_module *initrd = bootmodule_next_by_kind(bi, BOOTMOD_RAMDISK, 0);
-    struct domain *d;
     char *cmdline;
-    domid_t domid = 0;
 
-    if ( image == NULL )
-        panic("Error creating d%uv0\n", domid);
+    if ( bd->kernel == NULL )
+        panic("Error creating d%uv0\n", bd->domid);
 
     if ( opt_dom0_pvh )
     {
@@ -764,45 +778,46 @@ static struct domain *__init create_dom0(const struct boot_info *bi)
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
     /* Create initial domain.  Not d0 for pvshim. */
-    domid = get_initial_domain_id();
-    d = domain_create(domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
-    if ( IS_ERR(d) )
-        panic("Error creating d%u: %ld\n", domid, PTR_ERR(d));
+    bd->domid = get_initial_domain_id();
+    bd->domain = domain_create(bd->domid, &dom0_cfg, pv_shim ?
+                               0 : CDF_privileged);
+    if ( IS_ERR(bd->domain) )
+        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(bd->domain));
 
-    init_dom0_cpuid_policy(d);
+    init_dom0_cpuid_policy(bd->domain);
 
-    if ( alloc_dom0_vcpu0(d) == NULL )
-        panic("Error creating d%uv0\n", domid);
+    if ( alloc_dom0_vcpu0(bd->domain) == NULL )
+        panic("Error creating d%uv0\n", bd->domid);
 
     /* Grab the DOM0 command line. */
-    cmdline = (image->string.kind == BOOTSTR_CMDLINE) ?
-              image->string.bytes : NULL;
+    cmdline = (bd->kernel->string.kind == BOOTSTR_CMDLINE) ?
+              bd->kernel->string.bytes : NULL;
     if ( cmdline || bi->arch->kextra )
     {
-        static char __initdata dom0_cmdline[MAX_GUEST_CMDLINE];
+        char dom0_cmdline[MAX_GUEST_CMDLINE];
 
         cmdline = arch_prepare_cmdline(cmdline, bi->arch);
-        safe_strcpy(dom0_cmdline, cmdline);
+        strlcpy(dom0_cmdline, cmdline, MAX_GUEST_CMDLINE);
 
         if ( bi->arch->kextra )
             /* kextra always includes exactly one leading space. */
-            safe_strcat(dom0_cmdline, bi->arch->kextra);
+            strlcat(dom0_cmdline, bi->arch->kextra, MAX_GUEST_CMDLINE);
 
         /* Append any extra parameters. */
         if ( skip_ioapic_setup && !strstr(dom0_cmdline, "noapic") )
-            safe_strcat(dom0_cmdline, " noapic");
+            strlcat(dom0_cmdline, " noapic", MAX_GUEST_CMDLINE);
         if ( (strlen(acpi_param) == 0) && acpi_disabled )
         {
             printk("ACPI is disabled, notifying Domain 0 (acpi=off)\n");
-            safe_strcpy(acpi_param, "off");
+            strlcpy(acpi_param, "off", sizeof(acpi_param));
         }
         if ( (strlen(acpi_param) != 0) && !strstr(dom0_cmdline, "acpi=") )
         {
-            safe_strcat(dom0_cmdline, " acpi=");
-            safe_strcat(dom0_cmdline, acpi_param);
+            strlcat(dom0_cmdline, " acpi=", MAX_GUEST_CMDLINE);
+            strlcat(dom0_cmdline, acpi_param, MAX_GUEST_CMDLINE);
         }
 
-        cmdline = dom0_cmdline;
+        strlcpy(bd->kernel->string.bytes, dom0_cmdline, MAX_GUEST_CMDLINE);
     }
 
     /*
@@ -816,7 +831,7 @@ static struct domain *__init create_dom0(const struct boot_info *bi)
         write_cr4(read_cr4() & ~X86_CR4_SMAP);
     }
 
-    if ( construct_dom0(d, image, initrd, cmdline) != 0 )
+    if ( construct_domain(bd) != 0 )
         panic("Could not construct domain 0\n");
 
     if ( cpu_has_smap )
@@ -825,14 +840,14 @@ static struct domain *__init create_dom0(const struct boot_info *bi)
         cr4_pv32_mask |= X86_CR4_SMAP;
     }
 
-    return d;
+    return bd->domain;
 }
 
 void __init arch_create_dom(
     const struct boot_info *bi, struct boot_domain *bd)
 {
     if ( builder_is_initdom(bd) )
-        create_dom0(bi);
+        create_dom0(bi, bd);
 }
 
 /* How much of the directmap is prebuilt at compile time. */
@@ -1010,10 +1025,7 @@ void __init noreturn __start_xen(unsigned long bi_p)
                boot_info->nr_mods);
     }
 
-    /* Dom0 kernel is the first boot module */
-    boot_info->mods[0].kind = BOOTMOD_KERNEL;
-    if ( boot_info->mods[0].string.len )
-        boot_info->mods[0].string.kind = BOOTSTR_CMDLINE;
+    builder_init(boot_info);
 
     if ( pvh_boot )
     {
@@ -1168,11 +1180,6 @@ void __init noreturn __start_xen(unsigned long bi_p)
         boot_info->mods[boot_info->nr_mods].size = __2M_rwdata_end - _stext;
     }
 
-    boot_info->mods[0].arch->headroom = bzimage_headroom(
-                                        bootstrap_map(&boot_info->mods[0]),
-                                        boot_info->mods[0].size);
-    bootstrap_map(NULL);
-
 #ifndef highmem_start
     /* Don't allow split below 4Gb. */
     if ( highmem_start < GB(4) )
@@ -1905,22 +1912,29 @@ void __init noreturn __start_xen(unsigned long bi_p)
            cpu_has_nx ? XENLOG_INFO : XENLOG_WARNING "Warning: ",
            cpu_has_nx ? "" : "not ");
 
-    initrdidx = bootmodule_next_idx_by_kind(boot_info, BOOTMOD_UNKNOWN, 0);
-    if ( initrdidx < boot_info->nr_mods )
-        boot_info->mods[initrdidx].kind = BOOTMOD_RAMDISK;
-
-    if ( bootmodule_count_by_kind(boot_info, BOOTMOD_UNKNOWN) > 1 )
-        printk(XENLOG_WARNING
-               "Multiple initrd candidates, picking module #%u\n",
-               initrdidx);
-
     /*
-     * We're going to setup domain0 using the module(s) that we stashed safely
-     * above our heap. The second module, if present, is an initrd ramdisk.
+     * Boot description not provided, check to see if there are any remaining
+     * boot modules, the first one found will be provided as the ramdisk.
      */
-    dom0 = create_dom0(boot_info);
+    if ( ! boot_info->builder->fdt_enabled )
+    {
+        initrdidx = bootmodule_next_idx_by_kind(boot_info, BOOTMOD_UNKNOWN, 0);
+        if ( initrdidx < boot_info->nr_mods )
+        {
+            boot_info->builder->domains[0].ramdisk = &boot_info->mods[initrdidx];
+            boot_info->mods[initrdidx].kind = BOOTMOD_RAMDISK;
+        }
+        if ( bootmodule_count_by_kind(boot_info, BOOTMOD_UNKNOWN) > 1 )
+            printk(XENLOG_WARNING
+                   "Multiple initrd candidates, picking module #%u\n",
+                   initrdidx);
+    }
+
+    builder_create_domains(boot_info);
+
+    dom0 = builder_get_hwdom(boot_info);
     if ( !dom0 )
-        panic("Could not set up DOM0 guest OS\n");
+        panic("No hardware domain was built\n");
 
     heap_init_late();
 
-- 
2.20.1


