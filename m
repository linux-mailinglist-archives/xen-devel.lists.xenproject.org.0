Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F37A5693E7
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 23:09:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362561.592688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CGT-0001nh-9y; Wed, 06 Jul 2022 21:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362561.592688; Wed, 06 Jul 2022 21:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CGT-0001kP-5k; Wed, 06 Jul 2022 21:08:53 +0000
Received: by outflank-mailman (input) for mailman id 362561;
 Wed, 06 Jul 2022 21:08:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJEZ=XL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1o9CGR-0007yd-FG
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 21:08:51 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d449487b-fd6f-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 23:08:50 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1657141525983954.9774962986977;
 Wed, 6 Jul 2022 14:05:25 -0700 (PDT)
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
X-Inumbo-ID: d449487b-fd6f-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1657141527; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jeWDZKBFeS35Z9RwtifusSZdaz0wVhsCakQYdv1hC4oUrttUSv33m2Y7yH0bD2P6QVUjqMXCmcOgTkxjv5x9t0fKUE97ORr9n01rm6rWasw+RXYc3BaSlKHRE+4fNWyKC7g7NkGv8UEwUdnws6FhBq+7V7W+aXRFvHwIm/+AZu4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1657141527; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=S145Tne13TWHR+Kbw2vROFs6IyEj+oY3nk3bfwwUXUQ=; 
	b=RoIBD+Zdh1XKu5+7HD8tGQnZfQopwwZc5FMABbKmX6p+j6GILN4HjaOtPwRGGFDSEesWd1WYT5MTYzalRFM1UVOnz3Cp/Z9LywO30LOU0ZHKzWgts0LwBkT5CKKp6RuRh6uG6BYXkd/01XPijhDq414neIFdFbFmSaEeEicwLTc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1657141527;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=S145Tne13TWHR+Kbw2vROFs6IyEj+oY3nk3bfwwUXUQ=;
	b=nWNxOPu9Um2DRf6axihFZiQAw/zxtqclsbSsukXxsvcWKO+i4ULxpEmdDK3sOIBO
	USrlVMoZSQbi6KtDGQedZxaT8w9mO8edn3A+OL2ULR0MAOoay6/CdSjzLSbOo8KXjEN
	ltSed0UtH5hymmAU40fuCOoTw7exZvZ5o+97Rj6o=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	Wei Liu <wl@xen.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	christopher.clark@starlab.io,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 15/18] x86: rework domain page allocation
Date: Wed,  6 Jul 2022 17:04:50 -0400
Message-Id: <20220706210454.30096-16-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220706210454.30096-1-dpsmith@apertussolutions.com>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This reworks all the dom0 page allocation functions for general domain
construction. Where possible, common logic between the two was split into a
separate function for reuse by the two functions.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
---
 xen/arch/x86/dom0_build.c             |  76 ++++++-------------
 xen/arch/x86/domain_builder.c         | 102 ++++++++++++++++++++++++++
 xen/arch/x86/hvm/dom0_build.c         |  11 +--
 xen/arch/x86/include/asm/dom0_build.h |  14 +++-
 xen/arch/x86/pv/dom0_build.c          |   2 +-
 5 files changed, 142 insertions(+), 63 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 216c9e3590..0600773b8f 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -320,69 +320,31 @@ static unsigned long __init default_nr_pages(unsigned long avail)
 }
 
 unsigned long __init dom0_compute_nr_pages(
-    struct domain *d, struct elf_dom_parms *parms, unsigned long initrd_len)
+    struct boot_domain *bd, struct elf_dom_parms *parms,
+    unsigned long initrd_len)
 {
-    nodeid_t node;
-    unsigned long avail = 0, nr_pages, min_pages, max_pages, iommu_pages = 0;
+    unsigned long avail, nr_pages, min_pages, max_pages;
 
     /* The ordering of operands is to work around a clang5 issue. */
     if ( CONFIG_DOM0_MEM[0] && !dom0_mem_set )
         parse_dom0_mem(CONFIG_DOM0_MEM);
 
-    for_each_node_mask ( node, dom0_nodes )
-        avail += avail_domheap_pages_region(node, 0, 0) +
-                 initial_images_nrpages(node);
-
-    /* Reserve memory for further dom0 vcpu-struct allocations... */
-    avail -= (d->max_vcpus - 1UL)
-             << get_order_from_bytes(sizeof(struct vcpu));
-    /* ...and compat_l4's, if needed. */
-    if ( is_pv_32bit_domain(d) )
-        avail -= d->max_vcpus - 1;
-
-    /* Reserve memory for iommu_dom0_init() (rough estimate). */
-    if ( is_iommu_enabled(d) && !iommu_hwdom_passthrough )
-    {
-        unsigned int s;
-
-        for ( s = 9; s < BITS_PER_LONG; s += 9 )
-            iommu_pages += max_pdx >> s;
-
-        avail -= iommu_pages;
-    }
+    avail = dom_avail_nr_pages(bd, dom0_nodes);
 
-    if ( paging_mode_enabled(d) || opt_dom0_shadow || opt_pv_l1tf_hwdom )
+    /* command line overrides configuration */
+    if (  dom0_mem_set )
     {
-        unsigned long cpu_pages;
-
-        nr_pages = get_memsize(&dom0_size, avail) ?: default_nr_pages(avail);
-
-        /*
-         * Clamp according to min/max limits and available memory
-         * (preliminary).
-         */
-        nr_pages = max(nr_pages, get_memsize(&dom0_min_size, avail));
-        nr_pages = min(nr_pages, get_memsize(&dom0_max_size, avail));
-        nr_pages = min(nr_pages, avail);
-
-        cpu_pages = dom0_paging_pages(d, nr_pages);
-
-        if ( !iommu_use_hap_pt(d) )
-            avail -= cpu_pages;
-        else if ( cpu_pages > iommu_pages )
-            avail -= cpu_pages - iommu_pages;
+        bd->meminfo.mem_size = dom0_size;
+        bd->meminfo.mem_min = dom0_min_size;
+        bd->meminfo.mem_max = dom0_max_size;
     }
 
-    nr_pages = get_memsize(&dom0_size, avail) ?: default_nr_pages(avail);
-    min_pages = get_memsize(&dom0_min_size, avail);
-    max_pages = get_memsize(&dom0_max_size, avail);
-
-    /* Clamp according to min/max limits and available memory (final). */
-    nr_pages = max(nr_pages, min_pages);
-    nr_pages = min(nr_pages, max_pages);
-    nr_pages = min(nr_pages, avail);
+    nr_pages = get_memsize(&bd->meminfo.mem_size, avail) ?
+               : default_nr_pages(avail);
+    min_pages = get_memsize(&bd->meminfo.mem_min, avail);
+    max_pages = get_memsize(&bd->meminfo.mem_max, avail);
 
-    if ( is_pv_domain(d) &&
+    if ( is_pv_domain(bd->domain) &&
          (parms->p2m_base == UNSET_ADDR) && !memsize_gt_zero(&dom0_size) &&
          (!memsize_gt_zero(&dom0_min_size) || (nr_pages > min_pages)) )
     {
@@ -395,7 +357,8 @@ unsigned long __init dom0_compute_nr_pages(
          * available between params.virt_base and the address space end.
          */
         unsigned long vstart, vend, end;
-        size_t sizeof_long = is_pv_32bit_domain(d) ? sizeof(int) : sizeof(long);
+        size_t sizeof_long = is_pv_32bit_domain(bd->domain) ?
+                             sizeof(int) : sizeof(long);
 
         vstart = parms->virt_base;
         vend = round_pgup(parms->virt_kend);
@@ -416,7 +379,12 @@ unsigned long __init dom0_compute_nr_pages(
         }
     }
 
-    d->max_pages = min_t(unsigned long, max_pages, UINT_MAX);
+    /* Clamp according to min/max limits and available memory (final). */
+    nr_pages = max(nr_pages, min_pages);
+    nr_pages = min(nr_pages, max_pages);
+    nr_pages = min(nr_pages, avail);
+
+    bd->domain->max_pages = min_t(unsigned long, max_pages, UINT_MAX);
 
     return nr_pages;
 }
diff --git a/xen/arch/x86/domain_builder.c b/xen/arch/x86/domain_builder.c
index 1a4a6b1ca7..d8babb1090 100644
--- a/xen/arch/x86/domain_builder.c
+++ b/xen/arch/x86/domain_builder.c
@@ -8,7 +8,9 @@
 #include <xen/sched.h>
 
 #include <asm/pv/shim.h>
+#include <asm/dom0_build.h>
 #include <asm/setup.h>
+#include <asm/spec_ctrl.h>
 
 extern unsigned long cr4_pv32_mask;
 
@@ -40,6 +42,106 @@ struct vcpu *__init alloc_dom_vcpu0(struct boot_domain *bd)
 }
 
 
+unsigned long __init dom_avail_nr_pages(
+    struct boot_domain *bd, nodemask_t nodes)
+{
+    unsigned long avail = 0, iommu_pages = 0;
+    bool is_ctldom = false, is_hwdom = false;
+    unsigned long nr_pages = bd->meminfo.mem_size.nr_pages;
+    nodeid_t node;
+
+    if ( builder_is_ctldom(bd) )
+        is_ctldom = true;
+    if ( builder_is_hwdom(bd) )
+        is_hwdom = true;
+
+    for_each_node_mask ( node, nodes )
+        avail += avail_domheap_pages_region(node, 0, 0) +
+                 initial_images_nrpages(node);
+
+    /* Reserve memory for further dom0 vcpu-struct allocations... */
+    avail -= (bd->domain->max_vcpus - 1UL)
+             << get_order_from_bytes(sizeof(struct vcpu));
+    /* ...and compat_l4's, if needed. */
+    if ( is_pv_32bit_domain(bd->domain) )
+        avail -= bd->domain->max_vcpus - 1;
+
+    /* Reserve memory for iommu_dom0_init() (rough estimate). */
+    if ( is_hwdom && is_iommu_enabled(bd->domain) && !iommu_hwdom_passthrough )
+    {
+        unsigned int s;
+
+        for ( s = 9; s < BITS_PER_LONG; s += 9 )
+            iommu_pages += max_pdx >> s;
+
+        avail -= iommu_pages;
+    }
+
+    if ( paging_mode_enabled(bd->domain) ||
+         (is_ctldom && opt_dom0_shadow) ||
+         (is_hwdom && opt_pv_l1tf_hwdom) )
+    {
+        unsigned long cpu_pages = dom0_paging_pages(bd->domain, nr_pages);
+
+        if ( !iommu_use_hap_pt(bd->domain) )
+            avail -= cpu_pages;
+        else if ( cpu_pages > iommu_pages )
+            avail -= cpu_pages - iommu_pages;
+    }
+
+    return avail;
+}
+
+unsigned long __init dom_compute_nr_pages(
+    struct boot_domain *bd, struct elf_dom_parms *parms,
+    unsigned long initrd_len)
+{
+    unsigned long avail, nr_pages = bd->meminfo.mem_size.nr_pages;
+
+    if ( builder_is_initdom(bd) )
+        return dom0_compute_nr_pages(bd, parms, initrd_len);
+
+    avail = dom_avail_nr_pages(bd, node_online_map);
+
+    if ( is_pv_domain(bd->domain) && (parms->p2m_base == UNSET_ADDR) )
+    {
+        /*
+         * Legacy Linux kernels (i.e. such without a XEN_ELFNOTE_INIT_P2M
+         * note) require that there is enough virtual space beyond the initial
+         * allocation to set up their initial page tables. This space is
+         * roughly the same size as the p2m table, so make sure the initial
+         * allocation doesn't consume more than about half the space that's
+         * available between params.virt_base and the address space end.
+         */
+        unsigned long vstart, vend, end;
+        size_t sizeof_long = is_pv_32bit_domain(bd->domain) ?
+                             sizeof(int) : sizeof(long);
+
+        vstart = parms->virt_base;
+        vend = round_pgup(parms->virt_kend);
+        if ( !parms->unmapped_initrd )
+            vend += round_pgup(initrd_len);
+        end = vend + nr_pages * sizeof_long;
+
+        if ( end > vstart )
+            end += end - vstart;
+        if ( end <= vstart ||
+             (sizeof_long < sizeof(end) && end > (1UL << (8 * sizeof_long))) )
+        {
+            end = sizeof_long >= sizeof(end) ? 0 : 1UL << (8 * sizeof_long);
+            nr_pages = (end - vend) / (2 * sizeof_long);
+            printk("Dom0 memory clipped to %lu pages\n", nr_pages);
+        }
+    }
+
+    /* Clamp according to available memory (final). */
+    nr_pages = min(nr_pages, avail);
+
+    bd->domain->max_pages = min_t(unsigned long, nr_pages, UINT_MAX);
+
+    return nr_pages;
+}
+
 void __init arch_create_dom(
     const struct boot_info *bi, struct boot_domain *bd)
 {
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index ae3ffc614d..e94392be07 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -412,15 +412,16 @@ static __init void pvh_setup_e820(struct domain *d, unsigned long nr_pages)
     ASSERT(cur_pages == nr_pages);
 }
 
-static void __init pvh_init_p2m(struct domain *d)
+static void __init pvh_init_p2m(struct boot_domain *bd)
 {
-    unsigned long nr_pages = dom0_compute_nr_pages(d, NULL, 0);
+    unsigned long nr_pages = dom_compute_nr_pages(bd, NULL, 0);
     bool preempted;
 
-    pvh_setup_e820(d, nr_pages);
+    pvh_setup_e820(bd->domain, nr_pages);
     do {
         preempted = false;
-        paging_set_allocation(d, dom0_paging_pages(d, nr_pages),
+        paging_set_allocation(bd->domain,
+                              dom0_paging_pages(bd->domain, nr_pages),
                               &preempted);
         process_pending_softirqs();
     } while ( preempted );
@@ -1239,7 +1240,7 @@ int __init dom0_construct_pvh(struct boot_domain *bd)
      * be done before the iommu initializion, since iommu initialization code
      * will likely add mappings required by devices to the p2m (ie: RMRRs).
      */
-    pvh_init_p2m(d);
+    pvh_init_p2m(bd);
 
     iommu_hwdom_init(d);
 
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index f30e4b860a..6c26ab0878 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -9,9 +9,17 @@
 
 extern unsigned int dom0_memflags;
 
-unsigned long dom0_compute_nr_pages(struct domain *d,
-                                    struct elf_dom_parms *parms,
-                                    unsigned long initrd_len);
+unsigned long dom_avail_nr_pages(
+    struct boot_domain *bd, nodemask_t nodes);
+
+unsigned long dom0_compute_nr_pages(
+    struct boot_domain *bd, struct elf_dom_parms *parms,
+    unsigned long initrd_len);
+
+unsigned long dom_compute_nr_pages(
+    struct boot_domain *bd, struct elf_dom_parms *parms,
+    unsigned long initrd_len);
+
 int dom0_setup_permissions(struct domain *d);
 
 int dom0_construct_pv(struct boot_domain *bd);
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 9d1c9fb8b0..ff5c93fa14 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -428,7 +428,7 @@ int __init dom0_construct_pv(struct boot_domain *bd)
         }
     }
 
-    nr_pages = dom0_compute_nr_pages(d, &parms, initrd_len);
+    nr_pages = dom_compute_nr_pages(bd, &parms, initrd_len);
 
     if ( parms.pae == XEN_PAE_EXTCR3 )
             set_bit(VMASST_TYPE_pae_extended_cr3, &d->vm_assist);
-- 
2.20.1


