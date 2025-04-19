Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BC1A945A9
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:10:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960051.1352105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GOL-0007Zd-8C; Sat, 19 Apr 2025 22:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960051.1352105; Sat, 19 Apr 2025 22:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GOL-0007XG-4U; Sat, 19 Apr 2025 22:10:29 +0000
Received: by outflank-mailman (input) for mailman id 960051;
 Sat, 19 Apr 2025 22:10:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GOJ-0007X1-SK
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:10:27 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 178494b0-1d6b-11f0-9ffb-bf95429c2676;
 Sun, 20 Apr 2025 00:10:25 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100528528400.89376689653477;
 Sat, 19 Apr 2025 15:08:48 -0700 (PDT)
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
X-Inumbo-ID: 178494b0-1d6b-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1745100530; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ORXGvRwhMA+cRRSbGW6WP9V7iTovf9ucdJ2qBGNyvnobMVFSHjUc2X5qPyEJqJ5VxY+oXjDhPOnXcEcmVeDIpN776Pu2QR47zkqM1u8cPm+xICk3q8MlYQJNuUiJteYFOGKM3f5ouWvLnzgLB0OAGbZbZkpcLp/KA4ZK8awQ8Vk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100530; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gnnQ4e6BcNj4dPgTJVIEZjw47epf9LWkmO1rTgme/Dc=; 
	b=Ot7ULMDnjFSMdI3OUmbgLKOOELPXn+4XSUHAI3XF4xV4sk1h8OwF0drqCo6cYeadsEmXomuFfmFjpP35eyHFU52IrTs/a5FNfUdMsVnDGHIfAJxAfPpUTXih63oEaq+mxb2h5xmd/gYFTjqOSQvDz0W5q8fdI8hs1QUBMWv18d0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100530;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=gnnQ4e6BcNj4dPgTJVIEZjw47epf9LWkmO1rTgme/Dc=;
	b=TaQdMbOA4rSXg7aANGudfA0WbLaPjaZqWGj+SgzDvaGeX0y/cEfD89SsQmjbg4tN
	G9+A03qun6d9pkg0WN4g1S/IkBevjeVvLF1OBwoW64irA06zLagg9ulhGhXXh4i8QLK
	jQjRATdeL+xHS4F4mrrqOuCHTHXCKRcpIUjRX1C4=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 11/38] x86/boot: generalize paging pages calculation
Date: Sat, 19 Apr 2025 18:07:53 -0400
Message-Id: <20250419220820.4234-12-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Modeling after libxl__get_required_paging_memory(), refactor
dom0_paging_pages() to calculate the number of paging pages required for a
domain that is not the control or hardware domain. As the function is being
refactored, rename to dom_paging_pages() and move under the domain builder.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/dom0_build.c                 | 17 +----------------
 xen/arch/x86/domain-builder/domain.c      | 20 ++++++++++++++++++++
 xen/arch/x86/hvm/dom0_build.c             |  3 ++-
 xen/arch/x86/include/asm/dom0_build.h     |  3 ---
 xen/arch/x86/include/asm/domain-builder.h |  3 +++
 xen/arch/x86/pv/dom0_build.c              |  3 ++-
 6 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index a007e424bbe3..1413e8c634a7 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -305,21 +305,6 @@ boolean_param("ro-hpet", ro_hpet);
 
 unsigned int __initdata dom0_memflags = MEMF_no_dma|MEMF_exact_node;
 
-unsigned long __init dom0_paging_pages(const struct domain *d,
-                                       unsigned long nr_pages)
-{
-    /* Keep in sync with libxl__get_required_paging_memory(). */
-    unsigned long memkb = nr_pages * (PAGE_SIZE / 1024);
-
-    memkb = 4 * (256 * d->max_vcpus +
-                 (is_pv_domain(d) ? opt_dom0_shadow || opt_pv_l1tf_hwdom
-                                  : 1 + opt_dom0_shadow) *
-                 (memkb / 1024));
-
-    return DIV_ROUND_UP(memkb, 1024) << (20 - PAGE_SHIFT);
-}
-
-
 /*
  * If allocation isn't specified, reserve 1/16th of available memory for
  * things like DMA buffers. This reservation is clamped to a maximum of 128MB.
@@ -431,7 +416,7 @@ unsigned long __init dom0_compute_nr_pages(
          */
         calculate_dom0_pages(bd, avail);
 
-        cpu_pages = dom0_paging_pages(d, bd->mem_pages);
+        cpu_pages = dom_paging_pages(bd, bd->mem_pages);
 
         if ( !iommu_use_hap_pt(d) )
             avail -= cpu_pages;
diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/domain-builder/domain.c
index 619d36ea0b87..87f538ae26c5 100644
--- a/xen/arch/x86/domain-builder/domain.c
+++ b/xen/arch/x86/domain-builder/domain.c
@@ -10,6 +10,26 @@
 
 #include <asm/bootinfo.h>
 #include <asm/dom0_build.h>
+#include <asm/paging.h>
+#include <asm/spec_ctrl.h>
+
+unsigned long __init dom_paging_pages(
+    const struct boot_domain *bd, unsigned long nr_pages)
+{
+    /* Keep in sync with libxl__get_required_paging_memory(). */
+    unsigned long memkb = bd->mem_pages * (PAGE_SIZE / 1024);
+    unsigned long factor = 0;
+
+    if ( bd->capabilities & (BUILD_CAPS_CONTROL | BUILD_CAPS_HARDWARE) )
+        factor = is_pv_domain(bd->d) ? opt_dom0_shadow || opt_pv_l1tf_hwdom
+                                     : 1 + opt_dom0_shadow;
+    else
+        factor = !is_pv_domain(bd->d) + !paging_mode_hap(bd->d);
+
+    memkb = 4 * (256 * bd->d->max_vcpus + (factor * (memkb / 1024)));
+
+    return DIV_ROUND_UP(memkb, 1024) << (20 - PAGE_SHIFT);
+}
 
 unsigned int __init dom_max_vcpus(struct boot_domain *bd)
 {
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index a818a9a772ed..d3ad90348a1f 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -19,6 +19,7 @@
 #include <asm/bootinfo.h>
 #include <asm/bzimage.h>
 #include <asm/dom0_build.h>
+#include <asm/domain-builder.h>
 #include <asm/hvm/support.h>
 #include <asm/io_apic.h>
 #include <asm/p2m.h>
@@ -406,7 +407,7 @@ static void __init pvh_init_p2m(struct boot_domain *bd)
     pvh_setup_e820(bd->d, nr_pages);
     do {
         preempted = false;
-        paging_set_allocation(bd->d, dom0_paging_pages(bd->d, nr_pages),
+        paging_set_allocation(bd->d, dom_paging_pages(bd, nr_pages),
                               &preempted);
         process_pending_softirqs();
     } while ( preempted );
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index dcf71c032a17..81717b49b4ae 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -19,9 +19,6 @@ unsigned long dom0_compute_nr_pages(
 int dom0_construct_pv(struct boot_domain *bd);
 int dom0_construct_pvh(struct boot_domain *bd);
 
-unsigned long dom0_paging_pages(const struct domain *d,
-                                unsigned long nr_pages);
-
 void dom0_update_physmap(bool compat, unsigned long pfn,
                          unsigned long mfn, unsigned long vphysmap_s);
 
diff --git a/xen/arch/x86/include/asm/domain-builder.h b/xen/arch/x86/include/asm/domain-builder.h
index ccfa4bd82acd..8b0b224eba41 100644
--- a/xen/arch/x86/include/asm/domain-builder.h
+++ b/xen/arch/x86/include/asm/domain-builder.h
@@ -8,6 +8,9 @@ int __init builder_get_cmdline(
     struct boot_info *bi, int offset, char *cmdline, size_t size);
 
 void builder_init(struct boot_info *bi);
+
+unsigned long dom_paging_pages(
+    const struct boot_domain *d, unsigned long nr_pages);
 unsigned int dom_max_vcpus(struct boot_domain *bd);
 struct vcpu *alloc_dom_vcpu0(struct boot_domain *bd);
 
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 350a60b1e8fd..f8844b858082 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -17,6 +17,7 @@
 #include <asm/bootinfo.h>
 #include <asm/bzimage.h>
 #include <asm/dom0_build.h>
+#include <asm/domain-builder.h>
 #include <asm/guest.h>
 #include <asm/page.h>
 #include <asm/pv/mm.h>
@@ -1043,7 +1044,7 @@ static int __init dom0_construct(struct boot_domain *bd)
     {
         bool preempted;
 
-        nr_pt_pages = dom0_paging_pages(d, nr_pages);
+        nr_pt_pages = dom_paging_pages(bd, nr_pages);
 
         do {
             preempted = false;
-- 
2.30.2


