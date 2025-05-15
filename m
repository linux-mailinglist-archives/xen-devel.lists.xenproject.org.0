Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B122AB87C3
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:20:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985343.1371300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYVt-0005xb-4T; Thu, 15 May 2025 13:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985343.1371300; Thu, 15 May 2025 13:20:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYVs-0005rs-UY; Thu, 15 May 2025 13:20:40 +0000
Received: by outflank-mailman (input) for mailman id 985343;
 Thu, 15 May 2025 13:20:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYUh-0001J6-8N
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:19:27 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3899edc5-318f-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 15:19:26 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1747315078938524.299577443265;
 Thu, 15 May 2025 06:17:58 -0700 (PDT)
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
X-Inumbo-ID: 3899edc5-318f-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1747315081; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H0kdt6vrxbF0nAS1/mnHJ+osvSfOYGegAgB7hDaoqx63epzKd98km1qYbZcwiBKKD/aHQCuYRU+9OWeQMxy1pmWkJ+Oo+iXIB9NmqnJLm+vyAMLwhgbCfgRp7BhnwtgVpypYWqrT0Gd+4e1CTYBtJTFBwnEwiSpo3KjsojSzUeg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315081; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=O7tpnN57teXG8tXpvkkoZVFgo7fwQyPiYThILjAm6aQ=; 
	b=UTR9UFqv3otjnFQztPiS3XVca7bMkxlKFmeAaz6RK91/U7tvbkeq5fqcUyRvZPRp4KE9v/HNgPhRucFsK8YTiqSZl4uJJezvk5Nq6ojTVfgniN8v6qma+9pgejb+Monc71pnpUXcxCyuoRDjrlTYXOgCpzh50Wht6Jrgk1wcIFA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315081;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=O7tpnN57teXG8tXpvkkoZVFgo7fwQyPiYThILjAm6aQ=;
	b=hTNsw0SMT1Cb0KRpxyJ15PQkKx5TPyBjgQva+ggAoNoZSm27Jk47mvIEoqCrqybp
	OtALBhxieYv126P44aJ54iaSzPDDvqFW8cnHfJLcALlBMXCe4CxvvXX+cgQHSRWF/to
	a8/Y7e3y4xzQSJgWddxGbfHru2zMl21bVkqu/sEM=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFCv2 08/38] x86/boot: convert dom0 page calculation to use boot domain
Date: Thu, 15 May 2025 09:17:14 -0400
Message-Id: <20250515131744.3843-9-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131744.3843-1-dpsmith@apertussolutions.com>
References: <20250515131744.3843-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit seeks to rework the dom0_compute_nr_pages() function to consume a
boot domain structure that may contain requested memory pages, min pages, max
pages, and the reference for the initrd. With the passing of the boot domain
struct, the initrd_size parameter is dropped. This takes into account the PVH
case, where the value 0 was passed, which is safe as initrd_size is only used
behind the is_pv_domain() check.

It introduces the calculate_dom0_pages() function that handles the command line
override of the memory pages, min pages, and max pages values. The function
also applies a clamping of memory pages to the min/max pages value.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/dom0_build.c             | 62 ++++++++++++++++-----------
 xen/arch/x86/hvm/dom0_build.c         | 12 +++---
 xen/arch/x86/include/asm/dom0_build.h | 10 ++---
 xen/arch/x86/pv/dom0_build.c          |  6 +--
 4 files changed, 51 insertions(+), 39 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 2cf6535ce190..02a3c2d249c3 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -330,16 +330,37 @@ static unsigned long __init default_nr_pages(unsigned long avail)
                             : min(avail / 16, 128UL << (20 - PAGE_SHIFT)));
 }
 
-unsigned long __init dom0_compute_nr_pages(
-    struct domain *d, struct elf_dom_parms *parms, unsigned long initrd_len)
+static void __init calculate_dom0_pages(
+    struct boot_domain *bd, unsigned long avail)
 {
-    nodeid_t node;
-    unsigned long avail = 0, nr_pages, min_pages, max_pages, iommu_pages = 0;
+    unsigned long nr_pages = bd->mem_pages ?: default_nr_pages(avail);
 
     /* The ordering of operands is to work around a clang5 issue. */
     if ( CONFIG_DOM0_MEM[0] && !dom0_mem_set )
         parse_dom0_mem(CONFIG_DOM0_MEM);
 
+    if ( dom0_mem_set )
+    {
+        nr_pages = get_memsize(&dom0_size, avail) ?: default_nr_pages(avail);
+        bd->min_pages = get_memsize(&dom0_min_size, avail);
+        bd->max_pages = get_memsize(&dom0_max_size, avail);
+    }
+
+    nr_pages = max(nr_pages, bd->min_pages);
+    nr_pages = min(nr_pages, bd->max_pages);
+    nr_pages = min(nr_pages, avail);
+
+    bd->mem_pages = nr_pages;
+}
+
+unsigned long __init dom0_compute_nr_pages(
+    struct boot_domain *bd, struct elf_dom_parms *parms)
+{
+    nodeid_t node;
+    struct domain *d = bd->d;
+    unsigned long initrd_len = bd->ramdisk ? bd->ramdisk->size : 0;
+    unsigned long avail = 0, iommu_pages = 0;
+
     for_each_node_mask ( node, dom0_nodes )
         avail += avail_domheap_pages_region(node, 0, 0) +
                  initial_images_nrpages(node);
@@ -366,17 +387,13 @@ unsigned long __init dom0_compute_nr_pages(
     {
         unsigned long cpu_pages;
 
-        nr_pages = get_memsize(&dom0_size, avail) ?: default_nr_pages(avail);
-
         /*
          * Clamp according to min/max limits and available memory
          * (preliminary).
          */
-        nr_pages = max(nr_pages, get_memsize(&dom0_min_size, avail));
-        nr_pages = min(nr_pages, get_memsize(&dom0_max_size, avail));
-        nr_pages = min(nr_pages, avail);
+        calculate_dom0_pages(bd, avail);
 
-        cpu_pages = dom0_paging_pages(d, nr_pages);
+        cpu_pages = dom0_paging_pages(d, bd->mem_pages);
 
         if ( !iommu_use_hap_pt(d) )
             avail -= cpu_pages;
@@ -384,18 +401,12 @@ unsigned long __init dom0_compute_nr_pages(
             avail -= cpu_pages - iommu_pages;
     }
 
-    nr_pages = get_memsize(&dom0_size, avail) ?: default_nr_pages(avail);
-    min_pages = get_memsize(&dom0_min_size, avail);
-    max_pages = get_memsize(&dom0_max_size, avail);
-
     /* Clamp according to min/max limits and available memory (final). */
-    nr_pages = max(nr_pages, min_pages);
-    nr_pages = min(nr_pages, max_pages);
-    nr_pages = min(nr_pages, avail);
+    calculate_dom0_pages(bd, avail);
 
     if ( is_pv_domain(d) &&
          (parms->p2m_base == UNSET_ADDR) && !memsize_gt_zero(&dom0_size) &&
-         (!memsize_gt_zero(&dom0_min_size) || (nr_pages > min_pages)) )
+         (!memsize_gt_zero(&dom0_min_size) || (bd->mem_pages > bd->min_pages)) )
     {
         /*
          * Legacy Linux kernels (i.e. such without a XEN_ELFNOTE_INIT_P2M
@@ -412,7 +423,7 @@ unsigned long __init dom0_compute_nr_pages(
         vend = round_pgup(parms->virt_kend);
         if ( !parms->unmapped_initrd )
             vend += round_pgup(initrd_len);
-        end = vend + nr_pages * sizeof_long;
+        end = vend + bd->mem_pages * sizeof_long;
 
         if ( end > vstart )
             end += end - vstart;
@@ -420,16 +431,17 @@ unsigned long __init dom0_compute_nr_pages(
              (sizeof_long < sizeof(end) && end > (1UL << (8 * sizeof_long))) )
         {
             end = sizeof_long >= sizeof(end) ? 0 : 1UL << (8 * sizeof_long);
-            nr_pages = (end - vend) / (2 * sizeof_long);
-            if ( memsize_gt_zero(&dom0_min_size) && nr_pages < min_pages )
-                nr_pages = min_pages;
-            printk("Dom0 memory clipped to %lu pages\n", nr_pages);
+            bd->mem_pages = (end - vend) / (2 * sizeof_long);
+            if ( memsize_gt_zero(&dom0_min_size) &&
+                 bd->mem_pages < bd->min_pages )
+                bd->mem_pages = bd->min_pages;
+            printk("Dom0 memory clipped to %lu pages\n", bd->mem_pages);
         }
     }
 
-    d->max_pages = min_t(unsigned long, max_pages, UINT_MAX);
+    d->max_pages = min_t(unsigned long, bd->max_pages, UINT_MAX);
 
-    return nr_pages;
+    return bd->mem_pages;
 }
 
 static void __init process_dom0_ioports_disable(struct domain *dom0)
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 4f2eb0f97aba..1f229d7bded1 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -398,15 +398,15 @@ static __init void pvh_setup_e820(struct domain *d, unsigned long nr_pages)
     ASSERT(cur_pages == nr_pages);
 }
 
-static void __init pvh_init_p2m(struct domain *d)
+static void __init pvh_init_p2m(struct boot_domain *bd)
 {
-    unsigned long nr_pages = dom0_compute_nr_pages(d, NULL, 0);
+    unsigned long nr_pages = dom0_compute_nr_pages(bd, NULL);
     bool preempted;
 
-    pvh_setup_e820(d, nr_pages);
+    pvh_setup_e820(bd->d, nr_pages);
     do {
         preempted = false;
-        paging_set_allocation(d, dom0_paging_pages(d, nr_pages),
+        paging_set_allocation(bd->d, dom0_paging_pages(bd->d, nr_pages),
                               &preempted);
         process_pending_softirqs();
     } while ( preempted );
@@ -1311,7 +1311,7 @@ static int __init pvh_setup_acpi(struct domain *d, paddr_t start_info)
     return 0;
 }
 
-int __init dom0_construct_pvh(const struct boot_domain *bd)
+int __init dom0_construct_pvh(struct boot_domain *bd)
 {
     paddr_t entry, start_info;
     struct domain *d = bd->d;
@@ -1322,7 +1322,7 @@ int __init dom0_construct_pvh(const struct boot_domain *bd)
      * be done before the iommu initializion, since iommu initialization code
      * will likely add mappings required by devices to the p2m (ie: RMRRs).
      */
-    pvh_init_p2m(d);
+    pvh_init_p2m(bd);
 
     iommu_hwdom_init(d);
 
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index 426def4115ce..dcf71c032a17 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -10,14 +10,14 @@ extern unsigned int dom0_memflags;
 
 void dom0_set_affinity(struct domain *dom0);
 
-unsigned long dom0_compute_nr_pages(struct domain *d,
-                                    struct elf_dom_parms *parms,
-                                    unsigned long initrd_len);
 int dom0_setup_permissions(struct domain *d);
 
 struct boot_domain;
-int dom0_construct_pv(const struct boot_domain *bd);
-int dom0_construct_pvh(const struct boot_domain *bd);
+unsigned long dom0_compute_nr_pages(
+    struct boot_domain *bd, struct elf_dom_parms *parms);
+
+int dom0_construct_pv(struct boot_domain *bd);
+int dom0_construct_pvh(struct boot_domain *bd);
 
 unsigned long dom0_paging_pages(const struct domain *d,
                                 unsigned long nr_pages);
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 3b2baf057b75..350a60b1e8fd 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -355,7 +355,7 @@ static struct page_info * __init alloc_chunk(struct domain *d,
     return page;
 }
 
-static int __init dom0_construct(const struct boot_domain *bd)
+static int __init dom0_construct(struct boot_domain *bd)
 {
     unsigned int i;
     int rc, order, machine;
@@ -503,7 +503,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
         }
     }
 
-    nr_pages = dom0_compute_nr_pages(d, &parms, initrd_len);
+    nr_pages = dom0_compute_nr_pages(bd, &parms);
 
 #ifdef CONFIG_PV32
     if ( elf_32bit(&elf) )
@@ -1070,7 +1070,7 @@ out:
     return rc;
 }
 
-int __init dom0_construct_pv(const struct boot_domain *bd)
+int __init dom0_construct_pv(struct boot_domain *bd)
 {
     unsigned long cr4 = read_cr4();
     int rc;
-- 
2.30.2


