Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 225169A2ACC
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:22:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821084.1234924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UD1-0002i4-W0; Thu, 17 Oct 2024 17:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821084.1234924; Thu, 17 Oct 2024 17:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UD1-0002gY-TB; Thu, 17 Oct 2024 17:22:47 +0000
Received: by outflank-mailman (input) for mailman id 821084;
 Thu, 17 Oct 2024 17:22:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1Tyd-00014B-Kw
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:07:55 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58218783-8caa-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:07:53 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184653228647.9822276705668;
 Thu, 17 Oct 2024 10:04:13 -0700 (PDT)
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
X-Inumbo-ID: 58218783-8caa-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729184655; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Jld2HDSz4LYuX9nEW6HUuGh4+nl1b+M4vtjnzZJX6kqQvNPTjxuJPrjUw3/bC4nuF8SiiEjOB72ejNwFlwp+qc40eeadiuImnIAOtTwGO86x46ORGtbsWWjn0YyQVK/pT2pZNkuYu/Jp6Cw5MwqMZtPODq9Ai5SONtrfomgssJs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184655; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/WocqNvqWMovNBKSHYsx06yhaw6uzqBVu1livQAQNWE=; 
	b=GtY7Fy0eheiLwmG68C3oilhZ/IrCfd5rZ2SC+9E3QmxsHEvZrJntySo/8BN4Zy/bfGuM5nLJc2QocODobdHomG0aA7FWh+mgkG6vowaSfrbG416+s0ukE/bTHtihXLvV1A/i22ED5t/TV0x/gq+u5Z8m5OP2F8jR8QrblRlIlgg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184655;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=/WocqNvqWMovNBKSHYsx06yhaw6uzqBVu1livQAQNWE=;
	b=TftWHWDt5PjjLKEvUeJw+DLFHVsXNW7/WDUktKsLLJ1QiLmExiQ3RgXqSJnK4y4J
	64z7HcX5gmoMdbw5ALEiKCM3WuB/+20jOAsSWjQP1pKlUS6VxkDTOBzSayeS+6SZy4R
	BQRjJDBJfmw2s1CGNwNYCZ7Q2WSrDQrOlbfPiI2U=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 30/44] x86/boot: convert dom0_construct_pv initrd param to struct boot_module
Date: Thu, 17 Oct 2024 13:03:10 -0400
Message-Id: <20241017170325.3842-31-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This changes the type for the initrd parameter of dom0_construct_pv to be struct
boot_module. This conversion requires several adjustments throughout dom0_construct_pv
to account for the type change. Removes the usage of early_mod field for ramdisk module.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v5:
- changed initrd_mfn initialization to _mfn(0)
---
 xen/arch/x86/dom0_build.c             |  2 +-
 xen/arch/x86/include/asm/dom0_build.h |  2 +-
 xen/arch/x86/pv/dom0_build.c          | 29 +++++++++++++++------------
 3 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 54db578dd29f..1d05ee53a6d8 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -613,7 +613,7 @@ int __init construct_dom0(struct domain *d, const struct boot_module *image,
         rc = dom0_construct_pvh(d, image->mod, image->headroom, initrd->mod,
                                 cmdline);
     else if ( is_pv_domain(d) )
-        rc = dom0_construct_pv(d, image, initrd->mod, cmdline);
+        rc = dom0_construct_pv(d, image, initrd, cmdline);
     else
         panic("Cannot construct Dom0. No guest interface available\n");
 
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index a1f36f7d360d..2ce5ea3851af 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -15,7 +15,7 @@ int dom0_setup_permissions(struct domain *d);
 
 int dom0_construct_pv(
     struct domain *d, const struct boot_module *image,
-    module_t *initrd, const char *cmdline);
+    struct boot_module *initrd, const char *cmdline);
 
 int dom0_construct_pvh(struct domain *d, const module_t *image,
                        unsigned long image_headroom,
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index f59597e50a11..5e7b543d0cbe 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -356,7 +356,7 @@ static struct page_info * __init alloc_chunk(struct domain *d,
 
 static int __init dom0_construct(struct domain *d,
                                  const struct boot_module *image,
-                                 module_t *initrd,
+                                 struct boot_module *initrd,
                                  const char *cmdline)
 {
     int i, rc, order, machine;
@@ -367,7 +367,8 @@ static int __init dom0_construct(struct domain *d,
     unsigned long nr_pt_pages;
     unsigned long alloc_spfn;
     unsigned long alloc_epfn;
-    unsigned long initrd_pfn = -1, initrd_mfn = 0;
+    unsigned long initrd_pfn = -1;
+    mfn_t  initrd_mfn = _mfn(0);
     unsigned long count;
     struct page_info *page = NULL;
     unsigned int flush_flags = 0;
@@ -376,7 +377,7 @@ static int __init dom0_construct(struct domain *d,
     void *image_base = bootstrap_map_bm(image);
     unsigned long image_len = image->size;
     void *image_start = image_base + image->headroom;
-    unsigned long initrd_len = initrd ? initrd->mod_end : 0;
+    unsigned long initrd_len = initrd ? initrd->size : 0;
     l4_pgentry_t *l4tab = NULL, *l4start = NULL;
     l3_pgentry_t *l3tab = NULL, *l3start = NULL;
     l2_pgentry_t *l2tab = NULL, *l2start = NULL;
@@ -612,7 +613,8 @@ static int __init dom0_construct(struct domain *d,
         initrd_pfn = vinitrd_start ?
                      (vinitrd_start - v_start) >> PAGE_SHIFT :
                      domain_tot_pages(d);
-        initrd_mfn = mfn = initrd->mod_start;
+        initrd_mfn = maddr_to_mfn(initrd->start);
+        mfn = mfn_x(initrd_mfn);
         count = PFN_UP(initrd_len);
         if ( d->arch.physaddr_bitsize &&
              ((mfn + count - 1) >> (d->arch.physaddr_bitsize - PAGE_SHIFT)) )
@@ -627,12 +629,13 @@ static int __init dom0_construct(struct domain *d,
                     free_domheap_pages(page, order);
                     page += 1UL << order;
                 }
-            memcpy(page_to_virt(page), mfn_to_virt(initrd->mod_start),
+            memcpy(page_to_virt(page), maddr_to_virt(initrd->start),
                    initrd_len);
-            mpt_alloc = (paddr_t)initrd->mod_start << PAGE_SHIFT;
+            mpt_alloc = initrd->start;
             init_domheap_pages(mpt_alloc,
                                mpt_alloc + PAGE_ALIGN(initrd_len));
-            initrd->mod_start = initrd_mfn = mfn_x(page_to_mfn(page));
+            initrd_mfn = page_to_mfn(page);
+            initrd->start = mfn_to_maddr(initrd_mfn);
         }
         else
         {
@@ -640,9 +643,9 @@ static int __init dom0_construct(struct domain *d,
                 if ( assign_pages(mfn_to_page(_mfn(mfn++)), 1, d, 0) )
                     BUG();
         }
-        initrd->mod_end = 0;
+        initrd->size = 0;
 
-        iommu_memory_setup(d, "initrd", mfn_to_page(_mfn(initrd_mfn)),
+        iommu_memory_setup(d, "initrd", mfn_to_page(initrd_mfn),
                            PFN_UP(initrd_len), &flush_flags);
     }
 
@@ -654,7 +657,7 @@ static int __init dom0_construct(struct domain *d,
                nr_pages - domain_tot_pages(d));
     if ( initrd )
     {
-        mpt_alloc = (paddr_t)initrd->mod_start << PAGE_SHIFT;
+        mpt_alloc = initrd->start;
         printk("\n Init. ramdisk: %"PRIpaddr"->%"PRIpaddr,
                mpt_alloc, mpt_alloc + initrd_len);
     }
@@ -763,7 +766,7 @@ static int __init dom0_construct(struct domain *d,
         if ( count < initrd_pfn || count >= initrd_pfn + PFN_UP(initrd_len) )
             mfn = pfn++;
         else
-            mfn = initrd_mfn++;
+            mfn = mfn_x(initrd_mfn) + 1;
         *l1tab = l1e_from_pfn(mfn, compat ? COMPAT_L1_PROT : L1_PROT);
         l1tab++;
 
@@ -882,7 +885,7 @@ static int __init dom0_construct(struct domain *d,
         if ( pfn >= initrd_pfn )
         {
             if ( pfn < initrd_pfn + PFN_UP(initrd_len) )
-                mfn = initrd->mod_start + (pfn - initrd_pfn);
+                mfn = paddr_to_pfn(initrd->start) + (pfn - initrd_pfn);
             else
                 mfn -= PFN_UP(initrd_len);
         }
@@ -1052,7 +1055,7 @@ out:
 
 int __init dom0_construct_pv(struct domain *d,
                              const struct boot_module *image,
-                             module_t *initrd,
+                             struct boot_module *initrd,
                              const char *cmdline)
 {
     int rc;
-- 
2.30.2


