Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AFE9921E9
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:57:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811411.1224219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFk-0005mq-M4; Sun, 06 Oct 2024 21:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811411.1224219; Sun, 06 Oct 2024 21:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFk-0005jw-GH; Sun, 06 Oct 2024 21:57:24 +0000
Received: by outflank-mailman (input) for mailman id 811411;
 Sun, 06 Oct 2024 21:57:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZCa-0007Zk-7R
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:54:08 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81de1d2d-842d-11ef-a0bb-8be0dac302b0;
 Sun, 06 Oct 2024 23:54:07 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251439293836.8451746381855;
 Sun, 6 Oct 2024 14:50:39 -0700 (PDT)
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
X-Inumbo-ID: 81de1d2d-842d-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728251441; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=f7uPFxnNxNSwS5iGpHo5I392MgLtFiItLuV6jVa9yt/nZ98gGC97UyCPtoKwXqUtY9B2nqS7Fr+EhFdut2+kgbL/weoMWMeAsPDAdDkvMEgmDwPdyMsbmRUZjjUDaC0j836VJrc/Hh8DSPc49+DGlXb+aZRuiLWT22Sqy9eML2I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251441; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xkaiW9OjgWPFU0BNzVKSQC1ectLOUlTK2xVwSMDZnWo=; 
	b=GX8CLeUxgYtdzfLIdTRoQNixNxpkzINuW8Zh3oIegqvqbrybiFwY346I1QZ7otYvIvGO39pL9ZkBr5K6ilu/jE4iKpfhM/8QgEy/KjZC3dlDGwsVw7/ieAuCygyHIcpW64FqkZUR5W41zdcjlV1Kg4fTEhxB6oFgBo56KthT5Eg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251441;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=xkaiW9OjgWPFU0BNzVKSQC1ectLOUlTK2xVwSMDZnWo=;
	b=XcRbXHzbJsjP4VxUjD09sKr0MASD6YuZNtPsTEOsl6uGp6P3qBN4xjeTmvatswo8
	NLfZg84GZwqSsf7gLmpQ8WSet1KgN6CV2chNzZmw9kYyM8D0zE/3ZBznQfEcAF7a7Kl
	nBzuh1QsH8DL5OWxn9p4ajju2PnVASO5doAPmnAw=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 30/44] x86/boot: convert dom0_construct_pv initrd param to struct boot_module
Date: Sun,  6 Oct 2024 17:49:41 -0400
Message-Id: <20241006214956.24339-31-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This changes the type for the initrd parameter of dom0_construct_pv to be struct
boot_module. This conversion requires several adjustments throughout dom0_construct_pv
to account for the type change. Removes the usage of early_mod field for ramdisk module.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
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
index 7b6afe64d799..16b8c1e40998 100644
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
+    mfn_t  initrd_mfn = { 0 };
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


