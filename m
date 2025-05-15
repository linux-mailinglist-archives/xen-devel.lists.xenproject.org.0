Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF13FAB87C7
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:20:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985353.1371328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYVx-0006lM-HH; Thu, 15 May 2025 13:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985353.1371328; Thu, 15 May 2025 13:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYVx-0006hC-3q; Thu, 15 May 2025 13:20:45 +0000
Received: by outflank-mailman (input) for mailman id 985353;
 Thu, 15 May 2025 13:20:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYUo-0001J6-Ky
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:19:34 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d113bde-318f-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 15:19:33 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 174731509630273.38398534579699;
 Thu, 15 May 2025 06:18:16 -0700 (PDT)
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
X-Inumbo-ID: 3d113bde-318f-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1747315098; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OJxzRQrjwDkpNugjFrZKyKIogbqfB3eoPGxzfBg4VBD9pKOlMZSF5Nl7Xb3+7iqHt8JVgAwWUNgdW9Vkt1t5SGJ77+lrkOFcUSkp6orPfBGF54/75MD23LyrpsvRU22/FAEZQ9Jth3ukVuLfG4MQNf16I2EEgtC1kxbojjXSufk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315098; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eXY38uR+ClozR264xARbkqWPGdDGpnoE2oYFJfosS80=; 
	b=foyKZW9cbPwtaGzUO6Om5IKo8/xKw8+7GQziRl+fF3Szr6YFhoc8qptUijGPDTFecgZbF8FYPwlA7xUQMdurXAecwLW12g1rOJlgcpA9XVUlJf0BX1jZKAea9GvqcmY/0gSZEIzZSz2+haG2ka9bndWSokktF4OnNdVN31ltg84=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315098;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=eXY38uR+ClozR264xARbkqWPGdDGpnoE2oYFJfosS80=;
	b=ElGpb5Hk32Rs5F+tPD9XHQhEoDvDRO1iK5IYXK6Fu0StBJgm2nule59YKp/64S0B
	eT/rJAvPeIFS0jvSVe1qve1209D9QC9gKZ1KtexQQ6/X3gDSqPLDraAu8jI8bW++mAR
	cnR8P0cBdUTLLyDSWQX9LN3cRVFI1uqWzE9imyq0=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFCv2 10/38] x86/boot: generalize paging pages calculation
Date: Thu, 15 May 2025 09:17:16 -0400
Message-Id: <20250515131744.3843-11-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131744.3843-1-dpsmith@apertussolutions.com>
References: <20250515131744.3843-1-dpsmith@apertussolutions.com>
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
index a72064fbae80..0bcdfcb97e6c 100644
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
index 0512dde54746..a2e5807b60a5 100644
--- a/xen/arch/x86/domain-builder/domain.c
+++ b/xen/arch/x86/domain-builder/domain.c
@@ -12,6 +12,8 @@
 
 #include <asm/bootinfo.h>
 #include <asm/dom0_build.h>
+#include <asm/paging.h>
+#include <asm/spec_ctrl.h>
 
 unsigned int __init dom_max_vcpus(struct boot_domain *bd)
 {
@@ -40,6 +42,24 @@ struct vcpu *__init domain_vcpu0_create(struct boot_domain *bd)
     return vcpu_create(bd->d, 0);
 }
 
+unsigned long __init dom_paging_pages(
+    const struct boot_domain *bd, unsigned long nr_pages)
+{
+    /* Keep in sync with libxl__get_required_paging_memory(). */
+    unsigned long memkb = bd->mem_pages * (PAGE_SIZE / 1024);
+    unsigned long factor = 0;
+
+    if ( has_dom0_caps(bd) )
+        factor = is_pv_domain(bd->d) ? opt_dom0_shadow || opt_pv_l1tf_hwdom
+                                     : 1 + opt_dom0_shadow;
+    else
+        factor = !is_pv_domain(bd->d) + !paging_mode_hap(bd->d);
+
+    memkb = 4 * (256 * bd->d->max_vcpus + (factor * (memkb / 1024)));
+
+    return DIV_ROUND_UP(memkb, 1024) << (20 - PAGE_SHIFT);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 1f229d7bded1..3f0d157f82c8 100644
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
index dd429fc9ff8b..c5a71fae5ccb 100644
--- a/xen/arch/x86/include/asm/domain-builder.h
+++ b/xen/arch/x86/include/asm/domain-builder.h
@@ -3,6 +3,9 @@
 
 struct boot_domain;
 
+unsigned long dom_paging_pages(
+    const struct boot_domain *d, unsigned long nr_pages);
+
 int dom_construct_pvh(struct boot_domain *bd);
 
 #endif
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


