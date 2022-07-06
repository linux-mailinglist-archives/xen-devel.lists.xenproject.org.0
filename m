Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9D4569422
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 23:18:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362584.592698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CPV-0004A2-AJ; Wed, 06 Jul 2022 21:18:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362584.592698; Wed, 06 Jul 2022 21:18:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CPV-00047q-7Q; Wed, 06 Jul 2022 21:18:13 +0000
Received: by outflank-mailman (input) for mailman id 362584;
 Wed, 06 Jul 2022 21:18:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJEZ=XL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1o9CGd-0007yd-8I
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 21:09:03 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db23b078-fd6f-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 23:09:01 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1657141527503522.1572181705782;
 Wed, 6 Jul 2022 14:05:27 -0700 (PDT)
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
X-Inumbo-ID: db23b078-fd6f-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1657141528; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gyMMf/zIGC9Fq0T/pchioGdYxETpEQ8ygFPgLloVVR0kmUPJl4bGNK733wllR1bzvUqrPOByzdvNe0DwmtEpNORy779oUDrojao7j6eMLlhfERlOZ21kmzvVAEJZTQAF2/A9bS7QDkehJ6T8voTCf1WySFOL3X0cCPVJ9+p8MZM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1657141528; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=wO71seG+2JNeV652NZFdlSDXjvFFYd1IqGaFh2WZtlI=; 
	b=VI5MXUQS/c+tlvAWLP9HWBYIaRff7f2hWCsV+c1f2rOSeQFywFoy0kLC8FuLSl07f/B0x7kVktXfUPSVrlX9RlLFsQK2YGwWjS6zuPC9npOMsS4AkcuRUtGZhn7B3X00wJF/cG1602PQFCGzGnJdWQO1QI78LjbKCFYrv+K9jn4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1657141528;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=wO71seG+2JNeV652NZFdlSDXjvFFYd1IqGaFh2WZtlI=;
	b=I0y8K00pZ6ObMS2+85N1SZsq8Mekv/hZPJ2S606KXO/zt/f9QcXMKFwry/zwVMa1
	55PkRhPS+rMlky8qIZaAvkfIkc7/nNh5sXvpCN3Ppi4LJjyqp8GlvTD3Ey6ixXYlidp
	pf2tKFSL+39oAY2iJsR9vy5dU+3KQWbAkV1DnVOM=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	Wei Liu <wl@xen.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	christopher.clark@starlab.io,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 16/18] x86: add pv multidomain construction
Date: Wed,  6 Jul 2022 17:04:51 -0400
Message-Id: <20220706210454.30096-17-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220706210454.30096-1-dpsmith@apertussolutions.com>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This adds the ability to domain builder for the construction of multiple pv
domains at boot.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
---
 xen/arch/x86/dom0_build.c                     |  31 -----
 xen/arch/x86/domain_builder.c                 |  58 ++++++--
 xen/arch/x86/include/asm/dom0_build.h         |   2 -
 xen/arch/x86/include/asm/setup.h              |   2 +
 xen/arch/x86/pv/Makefile                      |   2 +-
 .../x86/pv/{dom0_build.c => domain_builder.c} |  86 +++++++-----
 xen/common/domain-builder/Kconfig             |  10 ++
 xen/common/domain-builder/core.c              | 130 ++++++++++++++++--
 xen/include/xen/bootdomain.h                  |   6 +
 xen/include/xen/domain_builder.h              |  19 +++
 10 files changed, 259 insertions(+), 87 deletions(-)
 rename xen/arch/x86/pv/{dom0_build.c => domain_builder.c} (92%)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 0600773b8f..85a10f63aa 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -524,37 +524,6 @@ int __init dom0_setup_permissions(struct domain *d)
 
     return rc;
 }
-
-int __init construct_domain(struct boot_domain *bd)
-{
-    int rc = 0;
-
-    /* Sanity! */
-    BUG_ON(!pv_shim && bd->domid != 0);
-    BUG_ON(bd->domain->vcpu[0] == NULL);
-    BUG_ON(bd->domain->vcpu[0]->is_initialised);
-
-    process_pending_softirqs();
-
-    if ( builder_is_initdom(bd) )
-    {
-        if ( is_hvm_domain(bd->domain) )
-            rc = dom0_construct_pvh(bd);
-        else if ( is_pv_domain(bd->domain) )
-            rc = dom0_construct_pv(bd);
-        else
-            panic("Cannot construct Dom0. No guest interface available\n");
-    }
-
-    if ( rc )
-        return rc;
-
-    /* Sanity! */
-    BUG_ON(!bd->domain->vcpu[0]->is_initialised);
-
-    return 0;
-}
-
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/domain_builder.c b/xen/arch/x86/domain_builder.c
index d8babb1090..94f3ff4d5a 100644
--- a/xen/arch/x86/domain_builder.c
+++ b/xen/arch/x86/domain_builder.c
@@ -6,6 +6,7 @@
 #include <xen/grant_table.h>
 #include <xen/iommu.h>
 #include <xen/sched.h>
+#include <xen/softirq.h>
 
 #include <asm/pv/shim.h>
 #include <asm/dom0_build.h>
@@ -189,18 +190,22 @@ void __init arch_create_dom(
     if ( !pv_shim && builder_is_ctldom(bd) )
         is_privileged = CDF_privileged;
 
-    /* Create initial domain.  Not d0 for pvshim. */
-    bd->domid = get_initial_domain_id();
+    /* Determine proper domain id. */
+    if ( builder_is_initdom(bd) )
+        bd->domid = get_initial_domain_id();
+    else
+        bd->domid = bd->domid ? bd->domid : get_next_domid();
     bd->domain = domain_create(bd->domid, &dom_cfg, is_privileged);
     if ( IS_ERR(bd->domain) )
         panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(bd->domain));
 
-    init_dom0_cpuid_policy(bd->domain);
+    if ( builder_is_initdom(bd) )
+        init_dom0_cpuid_policy(bd->domain);
 
     if ( alloc_dom_vcpu0(bd) == NULL )
         panic("Error creating d%uv0\n", bd->domid);
 
-    /* Grab the DOM0 command line. */
+    /* Grab the command line. */
     cmdline = (bd->kernel->string.kind == BOOTSTR_CMDLINE) ?
               bd->kernel->string.bytes : NULL;
     if ( cmdline || bi->arch->kextra )
@@ -210,15 +215,23 @@ void __init arch_create_dom(
         cmdline = arch_prepare_cmdline(cmdline, bi->arch);
         strlcpy(dom_cmdline, cmdline, MAX_GUEST_CMDLINE);
 
-        if ( bi->arch->kextra )
-            /* kextra always includes exactly one leading space. */
-            strlcat(dom_cmdline, bi->arch->kextra, MAX_GUEST_CMDLINE);
+        if ( builder_is_initdom(bd) )
+        {
+            if ( bi->arch->kextra )
+                /* kextra always includes exactly one leading space. */
+                strlcat(dom_cmdline, bi->arch->kextra, MAX_GUEST_CMDLINE);
 
-        apply_xen_cmdline(dom_cmdline);
+            apply_xen_cmdline(dom_cmdline);
+        }
 
         strlcpy(bd->kernel->string.bytes, dom_cmdline, MAX_GUEST_CMDLINE);
     }
 
+    if ( alloc_system_evtchn(bi, bd) != 0 )
+        printk(XENLOG_WARNING "%s: "
+               "unable set up system event channels for Dom%d\n",
+               __func__, bd->domid);
+
     /*
      * Temporarily clear SMAP in CR4 to allow user-accesses in construct_dom0().
      * This saves a large number of corner cases interactions with
@@ -240,3 +253,32 @@ void __init arch_create_dom(
     }
 }
 
+int __init construct_domain(struct boot_domain *bd)
+{
+    int rc = 0;
+
+    /* Sanity! */
+    BUG_ON(bd->domid != bd->domain->domain_id);
+    BUG_ON(bd->domain->vcpu[0] == NULL);
+    BUG_ON(bd->domain->vcpu[0]->is_initialised);
+
+    process_pending_softirqs();
+
+    if ( is_hvm_domain(bd->domain) )
+        if ( builder_is_initdom(bd) )
+            rc = dom0_construct_pvh(bd);
+        else
+            panic("Cannot construct HVM DomU. Not supported.\n");
+    else if ( is_pv_domain(bd->domain) )
+            rc = dom_construct_pv(bd);
+    else
+        panic("Cannot construct Dom0. No guest interface available\n");
+
+    if ( rc )
+        return rc;
+
+    /* Sanity! */
+    BUG_ON(!bd->domain->vcpu[0]->is_initialised);
+
+    return 0;
+}
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index 6c26ab0878..3624a57641 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -22,8 +22,6 @@ unsigned long dom_compute_nr_pages(
 
 int dom0_setup_permissions(struct domain *d);
 
-int dom0_construct_pv(struct boot_domain *bd);
-
 int dom0_construct_pvh(struct boot_domain *bd);
 
 unsigned long dom0_paging_pages(const struct domain *d,
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 6f53623fb3..328f9a8611 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -36,6 +36,8 @@ static inline void vesa_init(void) {};
 void apply_xen_cmdline(char *cmdline);
 int construct_domain(struct boot_domain *bd);
 
+int dom_construct_pv(struct boot_domain *bd);
+
 void setup_io_bitmap(struct domain *d);
 
 unsigned long initial_images_nrpages(nodeid_t node);
diff --git a/xen/arch/x86/pv/Makefile b/xen/arch/x86/pv/Makefile
index 6cda354cc4..d06a3c1de1 100644
--- a/xen/arch/x86/pv/Makefile
+++ b/xen/arch/x86/pv/Makefile
@@ -15,5 +15,5 @@ obj-$(CONFIG_PV_SHIM) += shim.o
 obj-$(CONFIG_TRACEBUFFER) += trace.o
 obj-y += traps.o
 
-obj-bin-y += dom0_build.init.o
+obj-bin-y += domain_builder.init.o
 obj-bin-y += gpr_switch.o
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/domain_builder.c
similarity index 92%
rename from xen/arch/x86/pv/dom0_build.c
rename to xen/arch/x86/pv/domain_builder.c
index ff5c93fa14..2ecf1b0ae3 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/domain_builder.c
@@ -1,5 +1,5 @@
 /******************************************************************************
- * pv/dom0_build.c
+ * pv/domain_builder.c
  *
  * Copyright (c) 2002-2005, K A Fraser
  */
@@ -8,6 +8,7 @@
 #include <xen/bootinfo.h>
 #include <xen/console.h>
 #include <xen/domain.h>
+#include <xen/domain_builder.h>
 #include <xen/domain_page.h>
 #include <xen/init.h>
 #include <xen/libelf.h>
@@ -296,7 +297,7 @@ static struct page_info * __init alloc_chunk(struct domain *d,
     return page;
 }
 
-int __init dom0_construct_pv(struct boot_domain *bd)
+int __init dom_construct_pv(struct boot_domain *bd)
 {
     int i, rc, order, machine;
     bool compatible, compat;
@@ -350,7 +351,7 @@ int __init dom0_construct_pv(struct boot_domain *bd)
     /* Machine address of next candidate page-table page. */
     paddr_t mpt_alloc;
 
-    printk(XENLOG_INFO "*** Building a PV Dom%d ***\n", d->domain_id);
+    printk(XENLOG_INFO "*** Constructing a PV Dom%d ***\n", d->domain_id);
 
     d->max_pages = ~0U;
 
@@ -362,7 +363,7 @@ int __init dom0_construct_pv(struct boot_domain *bd)
     if ( (rc = elf_init(&elf, image_start, image_len)) != 0 )
         return rc;
 
-    if ( opt_dom0_verbose )
+    if ( builder_is_ctldom(bd) && opt_dom0_verbose )
         elf_set_verbose(&elf);
 
     elf_parse_binary(&elf);
@@ -384,7 +385,8 @@ int __init dom0_construct_pv(struct boot_domain *bd)
         {
             if ( unlikely(rc = switch_compat(d)) )
             {
-                printk("Dom0 failed to switch to compat: %d\n", rc);
+                printk("Dom%d failed to switch to compat: %d\n",
+                        d->domain_id, rc);
                 return rc;
             }
 
@@ -404,22 +406,23 @@ int __init dom0_construct_pv(struct boot_domain *bd)
     if ( elf_msb(&elf) )
         compatible = false;
 
-    printk(" Dom0 kernel: %s-bit%s, %s, paddr %#" PRIx64 " -> %#" PRIx64 "\n",
-           elf_64bit(&elf) ? "64" : elf_32bit(&elf) ? "32" : "??",
+    printk(" Dom%d kernel: %s-bit%s, %s, paddr %#" PRIx64 " -> %#" PRIx64 "\n",
+           d->domain_id, elf_64bit(&elf) ? "64" : elf_32bit(&elf) ? "32" : "??",
            parms.pae       ? ", PAE" : "",
            elf_msb(&elf)   ? "msb"   : "lsb",
            elf.pstart, elf.pend);
     if ( elf.bsd_symtab_pstart )
-        printk(" Dom0 symbol map %#" PRIx64 " -> %#" PRIx64 "\n",
-               elf.bsd_symtab_pstart, elf.bsd_symtab_pend);
+        printk(" Dom%d symbol map %#" PRIx64 " -> %#" PRIx64 "\n",
+               d->domain_id, elf.bsd_symtab_pstart, elf.bsd_symtab_pend);
 
     if ( !compatible )
     {
-        printk("Mismatch between Xen and DOM0 kernel\n");
+        printk("Mismatch between Xen and DOM%d kernel\n", d->domain_id);
         return -EINVAL;
     }
 
-    if ( parms.elf_notes[XEN_ELFNOTE_SUPPORTED_FEATURES].type != XEN_ENT_NONE )
+    if ( builder_is_initdom(bd) &&
+         parms.elf_notes[XEN_ELFNOTE_SUPPORTED_FEATURES].type != XEN_ENT_NONE )
     {
         if ( !pv_shim && !test_bit(XENFEAT_dom0, parms.f_supported) )
         {
@@ -443,7 +446,8 @@ int __init dom0_construct_pv(struct boot_domain *bd)
 
             if ( value > __HYPERVISOR_COMPAT_VIRT_START )
             {
-                printk("Dom0 expects too high a hypervisor start address\n");
+                printk("Dom%d expects too high a hypervisor start address\n",
+                       d->domain_id);
                 return -ERANGE;
             }
             HYPERVISOR_COMPAT_VIRT_START(d) =
@@ -487,7 +491,7 @@ int __init dom0_construct_pv(struct boot_domain *bd)
     vstartinfo_start = round_pgup(vphysmap_end);
     vstartinfo_end   = vstartinfo_start + sizeof(struct start_info);
 
-    if ( pv_shim )
+    if ( pv_shim || ! builder_is_initdom(bd) )
     {
         vxenstore_start  = round_pgup(vstartinfo_end);
         vxenstore_end    = vxenstore_start + PAGE_SIZE;
@@ -578,8 +582,8 @@ int __init dom0_construct_pv(struct boot_domain *bd)
     }
 
     printk("PHYSICAL MEMORY ARRANGEMENT:\n"
-           " Dom0 alloc.:   %"PRIpaddr"->%"PRIpaddr,
-           pfn_to_paddr(alloc_spfn), pfn_to_paddr(alloc_epfn));
+           " Dom%d alloc.:   %"PRIpaddr"->%"PRIpaddr,
+           d->domain_id, pfn_to_paddr(alloc_spfn), pfn_to_paddr(alloc_epfn));
     if ( domain_tot_pages(d) < nr_pages )
         printk(" (%lu pages to be allocated)",
                nr_pages - domain_tot_pages(d));
@@ -596,7 +600,7 @@ int __init dom0_construct_pv(struct boot_domain *bd)
         printk(" Init. ramdisk: %p->%p\n", _p(vinitrd_start), _p(vinitrd_end));
     printk(" Phys-Mach map: %p->%p\n", _p(vphysmap_start), _p(vphysmap_end));
     printk(" Start info:    %p->%p\n", _p(vstartinfo_start), _p(vstartinfo_end));
-    if ( pv_shim )
+    if ( pv_shim || ! builder_is_initdom(bd) )
     {
         printk(" Xenstore ring: %p->%p\n", _p(vxenstore_start), _p(vxenstore_end));
         printk(" Console ring:  %p->%p\n", _p(vconsole_start), _p(vconsole_end));
@@ -617,7 +621,7 @@ int __init dom0_construct_pv(struct boot_domain *bd)
          ? v_end > HYPERVISOR_COMPAT_VIRT_START(d)
          : (v_start < HYPERVISOR_VIRT_END) && (v_end > HYPERVISOR_VIRT_START) )
     {
-        printk("DOM0 image overlaps with Xen private area.\n");
+        printk("DOM%d image overlaps with Xen private area.\n", d->domain_id);
         return -EINVAL;
     }
 
@@ -768,9 +772,6 @@ int __init dom0_construct_pv(struct boot_domain *bd)
         init_hypercall_page(d, _p(parms.virt_hypercall));
     }
 
-    /* Free temporary buffers. */
-    discard_initial_images();
-
     /* Set up start info area. */
     si = (start_info_t *)vstartinfo_start;
     clear_page(si);
@@ -778,7 +779,7 @@ int __init dom0_construct_pv(struct boot_domain *bd)
 
     si->shared_info = virt_to_maddr(d->shared_info);
 
-    if ( !pv_shim )
+    if ( !pv_shim && builder_is_ctldom(bd) )
         si->flags    = SIF_PRIVILEGED | SIF_INITDOMAIN;
     if ( !vinitrd_start && initrd_len )
         si->flags   |= SIF_MOD_START_PFN;
@@ -789,6 +790,19 @@ int __init dom0_construct_pv(struct boot_domain *bd)
     snprintf(si->magic, sizeof(si->magic), "xen-3.0-x86_%d%s",
              elf_64bit(&elf) ? 64 : 32, parms.pae ? "p" : "");
 
+    if ( !builder_is_initdom(bd) )
+    {
+        si->store_mfn = ((vxenstore_start - v_start) >> PAGE_SHIFT)
+                        + alloc_spfn;
+        bd->store.mfn = si->store_mfn;
+        si->store_evtchn = bd->store.evtchn;
+
+        si->console.domU.mfn = ((vconsole_start - v_start) >> PAGE_SHIFT)
+                               + alloc_spfn;
+        bd->console.mfn = si->console.domU.mfn;
+        si->console.domU.evtchn = bd->console.evtchn;
+    }
+
     count = domain_tot_pages(d);
 
     /* Set up the phys->machine table if not part of the initial mapping. */
@@ -871,23 +885,24 @@ int __init dom0_construct_pv(struct boot_domain *bd)
                 sizeof(si->cmd_line));
 
 #ifdef CONFIG_VIDEO
-    if ( !pv_shim && fill_console_start_info((void *)(si + 1)) )
-    {
-        si->console.dom0.info_off  = sizeof(struct start_info);
-        si->console.dom0.info_size = sizeof(struct dom0_vga_console_info);
-    }
+    if ( builder_is_hwdom(bd) )
+        if ( !pv_shim && fill_console_start_info((void *)(si + 1)) )
+        {
+            si->console.dom0.info_off  = sizeof(struct start_info);
+            si->console.dom0.info_size = sizeof(struct dom0_vga_console_info);
+        }
 #endif
 
     /*
      * TODO: provide an empty stub for fill_console_start_info in the
      * !CONFIG_VIDEO case so the logic here can be simplified.
      */
-    if ( pv_shim )
+    if ( builder_is_hwdom(bd) && pv_shim )
         pv_shim_setup_dom(d, l4start, v_start, vxenstore_start, vconsole_start,
                           vphysmap_start, si);
 
 #ifdef CONFIG_COMPAT
-    if ( compat )
+    if ( builder_is_hwdom(bd) && compat )
         xlat_start_info(si, pv_shim ? XLAT_start_info_console_domU
                                     : XLAT_start_info_console_dom0);
 #endif
@@ -926,15 +941,18 @@ int __init dom0_construct_pv(struct boot_domain *bd)
     if ( test_bit(XENFEAT_supervisor_mode_kernel, parms.f_required) )
         panic("Dom0 requires supervisor-mode execution\n");
 
-    rc = dom0_setup_permissions(d);
-    BUG_ON(rc != 0);
+    if ( builder_is_hwdom(bd) )
+    {
+        rc = dom0_setup_permissions(d);
+        BUG_ON(rc != 0);
+    }
 
     if ( d->domain_id == hardware_domid )
         iommu_hwdom_init(d);
 
 #ifdef CONFIG_SHADOW_PAGING
     /* Fill the shadow pool if necessary. */
-    if ( opt_dom0_shadow || opt_pv_l1tf_hwdom )
+    if ( builder_is_hwdom(bd) && (opt_dom0_shadow || opt_pv_l1tf_hwdom) )
     {
         bool preempted;
 
@@ -948,7 +966,7 @@ int __init dom0_construct_pv(struct boot_domain *bd)
     }
 
     /* Activate shadow mode, if requested.  Reuse the pv_l1tf tasklet. */
-    if ( opt_dom0_shadow )
+    if ( builder_is_hwdom(bd) && opt_dom0_shadow )
     {
         printk("Switching dom0 to using shadow paging\n");
         tasklet_schedule(&d->arch.paging.shadow.pv_l1tf_tasklet);
@@ -960,8 +978,8 @@ int __init dom0_construct_pv(struct boot_domain *bd)
 
 out:
     if ( elf_check_broken(&elf) )
-        printk(XENLOG_WARNING "Dom0 kernel broken ELF: %s\n",
-               elf_check_broken(&elf));
+        printk(XENLOG_WARNING "Dom%d kernel broken ELF: %s\n",
+               d->domain_id, elf_check_broken(&elf));
 
     return rc;
 }
diff --git a/xen/common/domain-builder/Kconfig b/xen/common/domain-builder/Kconfig
index 893038cab3..0232e1ed8a 100644
--- a/xen/common/domain-builder/Kconfig
+++ b/xen/common/domain-builder/Kconfig
@@ -12,4 +12,14 @@ config BUILDER_FDT
 
 	  If unsure, say N.
 
+config MULTIDOM_BUILDER
+	bool "Multidomain building (UNSUPPORTED)" if UNSUPPORTED
+	depends on BUILDER_FDT
+	---help---
+	  Enables the domain builder to construct multiple domains.
+
+	  This feature is currently experimental.
+
+	  If unsure, say N.
+
 endmenu
diff --git a/xen/common/domain-builder/core.c b/xen/common/domain-builder/core.c
index b030b07d71..c6a268eb96 100644
--- a/xen/common/domain-builder/core.c
+++ b/xen/common/domain-builder/core.c
@@ -1,6 +1,7 @@
 #include <xen/bootdomain.h>
 #include <xen/bootinfo.h>
 #include <xen/domain_builder.h>
+#include <xen/event.h>
 #include <xen/init.h>
 #include <xen/types.h>
 
@@ -60,37 +61,144 @@ void __init builder_init(struct boot_info *info)
         d->kernel->string.kind = BOOTSTR_CMDLINE;
 }
 
+static bool __init build_domain(struct boot_info *info, struct boot_domain *bd)
+{
+    if ( bd->constructed == true )
+        return true;
+
+    if ( bd->kernel == NULL )
+        return false;
+
+    printk(XENLOG_INFO "*** Building Dom%d ***\n", bd->domid);
+
+    arch_create_dom(info, bd);
+    if ( bd->domain )
+    {
+        bd->constructed = true;
+        return true;
+    }
+
+    return false;
+}
+
 uint32_t __init builder_create_domains(struct boot_info *info)
 {
     uint32_t build_count = 0, functions_built = 0;
+    struct boot_domain *bd;
     int i;
 
+    if ( IS_ENABLED(CONFIG_MULTIDOM_BUILDER) )
+    {
+        bd = builder_dom_by_function(info, BUILD_FUNCTION_XENSTORE);
+        if ( build_domain(info, bd) )
+        {
+            functions_built |= bd->functions;
+            build_count++;
+        }
+        else
+            printk(XENLOG_WARNING "Xenstore build failed, system may be unusable\n");
+
+        bd = builder_dom_by_function(info, BUILD_FUNCTION_CONSOLE);
+        if ( build_domain(info, bd) )
+        {
+            functions_built |= bd->functions;
+            build_count++;
+        }
+        else
+            printk(XENLOG_WARNING "Console build failed, system may be unusable\n");
+    }
+
     for ( i = 0; i < info->builder->nr_doms; i++ )
     {
-        struct boot_domain *d = &info->builder->domains[i];
+        bd = &info->builder->domains[i];
 
         if ( ! IS_ENABLED(CONFIG_MULTIDOM_BUILDER) &&
-             ! builder_is_initdom(d) &&
+             ! builder_is_initdom(bd) &&
              functions_built & BUILD_FUNCTION_INITIAL_DOM )
             continue;
 
-        if ( d->kernel == NULL )
+        if ( !build_domain(info, bd) )
         {
-            if ( builder_is_initdom(d) )
+            if ( builder_is_initdom(bd) )
                 panic("%s: intial domain missing kernel\n", __func__);
 
-            printk(XENLOG_ERR "%s:Dom%d definiton has no kernel\n", __func__,
-                    d->domid);
+            printk(XENLOG_WARNING "Dom%d build failed, skipping\n", bd->domid);
             continue;
         }
 
-        arch_create_dom(info, d);
-        if ( d->domain )
+        functions_built |= bd->functions;
+        build_count++;
+    }
+
+    if ( IS_ENABLED(CONFIG_X86) )
+        /* Free temporary buffers. */
+        discard_initial_images();
+
+    return build_count;
+}
+
+domid_t __init get_next_domid(void)
+{
+    static domid_t __initdata last_domid = 0;
+    domid_t next;
+
+    for ( next = last_domid + 1; next < DOMID_FIRST_RESERVED; next++ )
+    {
+        struct domain *d;
+
+        if ( (d = rcu_lock_domain_by_id(next)) == NULL )
         {
-            functions_built |= d->functions;
-            build_count++;
+            last_domid = next;
+            return next;
         }
+
+        rcu_unlock_domain(d);
     }
 
-    return build_count;
+    return 0;
+}
+
+int __init alloc_system_evtchn(
+    const struct boot_info *info, struct boot_domain *bd)
+{
+    evtchn_alloc_unbound_t evtchn_req;
+    struct boot_domain *c = builder_dom_by_function(info,
+                                                    BUILD_FUNCTION_CONSOLE);
+    struct boot_domain *s = builder_dom_by_function(info,
+                                                    BUILD_FUNCTION_XENSTORE);
+    int rc;
+
+    evtchn_req.dom = bd->domid;
+
+    if ( c != NULL && c != bd && c->constructed )
+    {
+        evtchn_req.remote_dom = c->domid;
+
+        rc = evtchn_alloc_unbound(&evtchn_req);
+        if ( rc )
+        {
+            printk("Failed allocating console event channel for domain %d\n",
+                   bd->domid);
+            return rc;
+        }
+
+        bd->console.evtchn = evtchn_req.port;
+    }
+
+    if ( s != NULL && s != bd && s->constructed )
+    {
+        evtchn_req.remote_dom = s->domid;
+
+        rc = evtchn_alloc_unbound(&evtchn_req);
+        if ( rc )
+        {
+            printk("Failed allocating xenstore event channel for domain %d\n",
+                   bd->domid);
+            return rc;
+        }
+
+        bd->store.evtchn = evtchn_req.port;
+    }
+
+    return 0;
 }
diff --git a/xen/include/xen/bootdomain.h b/xen/include/xen/bootdomain.h
index b172d16f4e..9c5d4d385e 100644
--- a/xen/include/xen/bootdomain.h
+++ b/xen/include/xen/bootdomain.h
@@ -47,6 +47,12 @@ struct boot_domain {
     struct boot_module *configs[BUILD_MAX_CONF_MODS];
 
     struct domain *domain;
+    struct {
+        xen_pfn_t mfn;
+        unsigned int evtchn;
+    } store, console;
+    bool constructed;
+
 };
 
 #endif
diff --git a/xen/include/xen/domain_builder.h b/xen/include/xen/domain_builder.h
index c0d997f7bd..f9e43c9689 100644
--- a/xen/include/xen/domain_builder.h
+++ b/xen/include/xen/domain_builder.h
@@ -34,6 +34,22 @@ static inline bool builder_is_hwdom(struct boot_domain *bd)
             bd->permissions & BUILD_PERMISSION_HARDWARE );
 }
 
+static inline struct boot_domain *builder_dom_by_function(
+    const struct boot_info *info, uint32_t func)
+{
+    int i;
+
+    for ( i = 0; i < info->builder->nr_doms; i++ )
+    {
+        struct boot_domain *bd = &info->builder->domains[i];
+
+        if ( bd->functions & func )
+            return bd;
+    }
+
+    return NULL;
+}
+
 static inline struct domain *builder_get_hwdom(struct boot_info *info)
 {
     int i;
@@ -51,6 +67,9 @@ static inline struct domain *builder_get_hwdom(struct boot_info *info)
 
 void builder_init(struct boot_info *info);
 uint32_t builder_create_domains(struct boot_info *info);
+domid_t get_next_domid(void);
+int alloc_system_evtchn(
+    const struct boot_info *info, struct boot_domain *bd);
 void arch_create_dom(const struct boot_info *bi, struct boot_domain *bd);
 
 #endif /* XEN_DOMAIN_BUILDER_H */
-- 
2.20.1


