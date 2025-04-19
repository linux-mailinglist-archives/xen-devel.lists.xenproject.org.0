Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C149A945B2
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:11:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960069.1352196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GOi-0002Nx-KK; Sat, 19 Apr 2025 22:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960069.1352196; Sat, 19 Apr 2025 22:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GOi-0002IR-Ew; Sat, 19 Apr 2025 22:10:52 +0000
Received: by outflank-mailman (input) for mailman id 960069;
 Sat, 19 Apr 2025 22:10:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GOh-0007X1-2C
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:10:51 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25938261-1d6b-11f0-9ffb-bf95429c2676;
 Sun, 20 Apr 2025 00:10:49 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100530188877.5400344244114;
 Sat, 19 Apr 2025 15:08:50 -0700 (PDT)
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
X-Inumbo-ID: 25938261-1d6b-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1745100532; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=g2Pty8YVcaCEnfAg1/dz3RvPZ7/hjg2PgeRXvbCMmoSFR6cqrupwYcaTrShMGVWJe9of+kO4+h2i2bCi7uv+2rz/lGo2iVBYtPBV9OKGFDKOBV6ccWScp5iqw1J/jm77q9GGHKy70ePfp6rEPH2BFRYFo1HwgfDZYCrYoIMgDag=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100532; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=i4cmCekFDOf6Zqqnx0QnwPpbFO/VkKVHyAi01YfF4U4=; 
	b=K3l7lNjDShe/rNzSGfKEyZTyV9H78ALvN/bnGuY5yFqxDZBwG7TEvL5gLFR+l/97WzIXYWVR3DBu0faBjusakgb/ZxkYa9m+4VCQ3kyVBxvbAQJY5mAS0HZT4BNUGVCKmJBszm3HzJk/XoH6AtRUZbaf3OJfrS1IJXaZxWqsdoM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100532;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=i4cmCekFDOf6Zqqnx0QnwPpbFO/VkKVHyAi01YfF4U4=;
	b=nD6ofalYGXbAilkE31f+IR6dgUepXRRFNVBg418gQk+LJ8Ezg+Vi22WKzSxgNf1x
	gQMrGGTG5cFV0Lub/za+lLG22Qe6NxKomzIXHrvbVzbNWqLTwkHh3+jgUNaawRlzSJ9
	HNMafPhADieMims7WfdoM3p2zvWYonht7us32saI=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 13/38] x86/hyperlaunch: move page computation to domain builder
Date: Sat, 19 Apr 2025 18:07:55 -0400
Message-Id: <20250419220820.4234-14-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The function dom_compute_nr_pages() is being moved to the domain builder. For
this to happen, the variable dom0_nodes, and the functions
calculate_dom0_pages() and dom0_pv_restrict_pages() must be exported.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/dom0_build.c                 | 75 +----------------------
 xen/arch/x86/domain-builder/domain.c      | 70 +++++++++++++++++++++
 xen/arch/x86/include/asm/dom0_build.h     |  4 +-
 xen/arch/x86/include/asm/domain-builder.h |  5 ++
 4 files changed, 81 insertions(+), 73 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 53ab1afbaa1f..e488a204372b 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -209,7 +209,7 @@ static int __init cf_check parse_dom0_nodes(const char *s)
 custom_param("dom0_nodes", parse_dom0_nodes);
 
 cpumask_t __initdata dom0_cpus;
-static nodemask_t __initdata dom0_nodes;
+nodemask_t __initdata dom0_nodes;
 
 unsigned int __init dom0_max_vcpus(void)
 {
@@ -315,8 +315,7 @@ static unsigned long __init default_nr_pages(unsigned long avail)
                             : min(avail / 16, 128UL << (20 - PAGE_SHIFT)));
 }
 
-static void __init calculate_dom0_pages(
-    struct boot_domain *bd, unsigned long avail)
+void __init calculate_dom0_pages(struct boot_domain *bd, unsigned long avail)
 {
     unsigned long nr_pages = bd->mem_pages ?: default_nr_pages(avail);
 
@@ -338,7 +337,7 @@ static void __init calculate_dom0_pages(
     bd->mem_pages = nr_pages;
 }
 
-static void __init dom0_pv_restrict_pages(
+void __init dom0_pv_restrict_pages(
     struct boot_domain *bd, struct elf_dom_parms *parms)
 {
     if ( (parms->p2m_base == UNSET_ADDR) && !memsize_gt_zero(&dom0_size) &&
@@ -377,74 +376,6 @@ static void __init dom0_pv_restrict_pages(
     }
 }
 
-unsigned long __init dom_compute_nr_pages(
-    struct boot_domain *bd, struct elf_dom_parms *parms)
-{
-    nodeid_t node;
-    nodemask_t nodes = { 0 };
-    struct domain *d = bd->d;
-    unsigned long avail = 0, iommu_pages = 0;
-
-    nodes_or(nodes, nodes, node_online_map);
-
-    /* If building dom0 or hwdom, apply command line restriction. */
-    if ( bd->capabilities & (BUILD_CAPS_CONTROL | BUILD_CAPS_HARDWARE) )
-        nodes_and(nodes, nodes, dom0_nodes);
-
-    ASSERT(nodes_weight(nodes) != 0);
-
-    for_each_node_mask ( node, nodes )
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
-    if ( is_hardware_domain(d) && is_iommu_enabled(d)
-         && !iommu_hwdom_passthrough )
-    {
-        unsigned int s;
-
-        for ( s = 9; s < BITS_PER_LONG; s += 9 )
-            iommu_pages += max_pdx >> s;
-
-        avail -= iommu_pages;
-    }
-
-    if ( paging_mode_enabled(d) || opt_dom0_shadow || opt_pv_l1tf_hwdom )
-    {
-        unsigned long cpu_pages;
-
-        /*
-         * Clamp according to min/max limits and available memory
-         * (preliminary).
-         */
-        calculate_dom0_pages(bd, avail);
-
-        cpu_pages = dom_paging_pages(bd, bd->mem_pages);
-
-        if ( !iommu_use_hap_pt(d) )
-            avail -= cpu_pages;
-        else if ( cpu_pages > iommu_pages )
-            avail -= cpu_pages - iommu_pages;
-    }
-
-    /* Clamp according to min/max limits and available memory (final). */
-    calculate_dom0_pages(bd, avail);
-
-    if ( is_pv_domain(d) )
-        dom0_pv_restrict_pages(bd, parms);
-
-    d->max_pages = min_t(unsigned long, bd->max_pages, UINT_MAX);
-
-    return bd->mem_pages;
-}
-
 static void __init process_dom0_ioports_disable(struct domain *dom0)
 {
     unsigned long io_from, io_to;
diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/domain-builder/domain.c
index 87f538ae26c5..bdb4d9745ff2 100644
--- a/xen/arch/x86/domain-builder/domain.c
+++ b/xen/arch/x86/domain-builder/domain.c
@@ -6,6 +6,8 @@
 #include <xen/cpumask.h>
 #include <xen/domain.h>
 #include <xen/init.h>
+#include <xen/libelf.h>
+#include <xen/nodemask.h>
 #include <xen/sched.h>
 
 #include <asm/bootinfo.h>
@@ -31,6 +33,74 @@ unsigned long __init dom_paging_pages(
     return DIV_ROUND_UP(memkb, 1024) << (20 - PAGE_SHIFT);
 }
 
+unsigned long __init dom_compute_nr_pages(
+    struct boot_domain *bd, struct elf_dom_parms *parms)
+{
+    nodeid_t node;
+    nodemask_t nodes = { 0 };
+    struct domain *d = bd->d;
+    unsigned long avail = 0, iommu_pages = 0;
+
+    nodes_or(nodes, nodes, node_online_map);
+
+    /* If building dom0 or hwdom, apply command line restriction. */
+    if ( bd->capabilities & (BUILD_CAPS_CONTROL | BUILD_CAPS_HARDWARE) )
+        nodes_and(nodes, nodes, dom0_nodes);
+
+    ASSERT(nodes_weight(nodes) != 0);
+
+    for_each_node_mask ( node, nodes )
+        avail += avail_domheap_pages_region(node, 0, 0) +
+                 initial_images_nrpages(node);
+
+    /* Reserve memory for further dom0 vcpu-struct allocations... */
+    avail -= (d->max_vcpus - 1UL)
+             << get_order_from_bytes(sizeof(struct vcpu));
+    /* ...and compat_l4's, if needed. */
+    if ( is_pv_32bit_domain(d) )
+        avail -= d->max_vcpus - 1;
+
+    /* Reserve memory for iommu_dom0_init() (rough estimate). */
+    if ( is_hardware_domain(d) && is_iommu_enabled(d)
+         && !iommu_hwdom_passthrough )
+    {
+        unsigned int s;
+
+        for ( s = 9; s < BITS_PER_LONG; s += 9 )
+            iommu_pages += max_pdx >> s;
+
+        avail -= iommu_pages;
+    }
+
+    if ( paging_mode_enabled(d) || opt_dom0_shadow || opt_pv_l1tf_hwdom )
+    {
+        unsigned long cpu_pages;
+
+        /*
+         * Clamp according to min/max limits and available memory
+         * (preliminary).
+         */
+        calculate_dom0_pages(bd, avail);
+
+        cpu_pages = dom_paging_pages(bd, bd->mem_pages);
+
+        if ( !iommu_use_hap_pt(d) )
+            avail -= cpu_pages;
+        else if ( cpu_pages > iommu_pages )
+            avail -= cpu_pages - iommu_pages;
+    }
+
+    /* Clamp according to min/max limits and available memory (final). */
+    calculate_dom0_pages(bd, avail);
+
+    if ( is_pv_domain(d) )
+        dom0_pv_restrict_pages(bd, parms);
+
+    d->max_pages = min_t(unsigned long, bd->max_pages, UINT_MAX);
+
+    return bd->mem_pages;
+}
+
 unsigned int __init dom_max_vcpus(struct boot_domain *bd)
 {
     unsigned int limit = bd->mode & BUILD_MODE_PARAVIRT ?
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index 7275bcf9ba6b..43a402af15b7 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -7,13 +7,15 @@
 #include <asm/setup.h>
 
 extern unsigned int dom0_memflags;
+extern nodemask_t dom0_nodes;
 
 void dom0_set_affinity(struct domain *dom0);
 
 int dom0_setup_permissions(struct domain *d);
 
 struct boot_domain;
-unsigned long dom_compute_nr_pages(
+void calculate_dom0_pages(struct boot_domain *bd, unsigned long avail);
+void dom0_pv_restrict_pages(
     struct boot_domain *bd, struct elf_dom_parms *parms);
 
 int dom0_construct_pv(struct boot_domain *bd);
diff --git a/xen/arch/x86/include/asm/domain-builder.h b/xen/arch/x86/include/asm/domain-builder.h
index 8b0b224eba41..f9b11e06ceb8 100644
--- a/xen/arch/x86/include/asm/domain-builder.h
+++ b/xen/arch/x86/include/asm/domain-builder.h
@@ -11,6 +11,11 @@ void builder_init(struct boot_info *bi);
 
 unsigned long dom_paging_pages(
     const struct boot_domain *d, unsigned long nr_pages);
+
+struct elf_dom_parms;
+unsigned long dom_compute_nr_pages(
+    struct boot_domain *bd, struct elf_dom_parms *parms);
+
 unsigned int dom_max_vcpus(struct boot_domain *bd);
 struct vcpu *alloc_dom_vcpu0(struct boot_domain *bd);
 
-- 
2.30.2


