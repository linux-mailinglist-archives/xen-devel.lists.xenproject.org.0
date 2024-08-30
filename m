Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E59966BB6
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:57:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786847.1196662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9c2-00033m-8F; Fri, 30 Aug 2024 21:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786847.1196662; Fri, 30 Aug 2024 21:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9c2-0002sW-1z; Fri, 30 Aug 2024 21:56:58 +0000
Received: by outflank-mailman (input) for mailman id 786847;
 Fri, 30 Aug 2024 21:56:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9Wm-0000Zf-CF
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:51:32 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 032ce5b5-671a-11ef-99a1-01e77a169b0f;
 Fri, 30 Aug 2024 23:51:30 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054492373987.601800935306;
 Fri, 30 Aug 2024 14:48:12 -0700 (PDT)
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
X-Inumbo-ID: 032ce5b5-671a-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1725054494; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JuHcrUfitLx/+Erxf4iWnnj0eub3kVaT0caTtDwSooGvJGSdrl7DdCq8KuCW+Nl8oum3LT10RfhomYGH1UD7iMEW9MO9mmYFaN5RxzgqV6OSVGLMLh3w1uX7JW4gcj1cf2XkcyEoAouyx5E7V9bKgQhYAXwB7HdIwmhJPJWFV6o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054494; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Uco3P2nZt+b7+Lgo/+TlzWVF3igUfsGLOahtS9BrSXY=; 
	b=C/4A7iLKTQX1xnrQLTHGlBwd4vTHtIHOSz3isZVxXR09a+sH61okdKgPQUI4AQ8oRZRThtE7KsowLlQG+T7rPvIhVN3g+avuUsbl/+TGD2KlZ28eGT3OlpjTKG/2G78eakoaGvGR72Fm9jfVtwhZCYyAlj5EoScKTSYu2vHJT/A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054494;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Uco3P2nZt+b7+Lgo/+TlzWVF3igUfsGLOahtS9BrSXY=;
	b=AD9sgbWVjCjLa0y/0Oa6d5wKkUO6C8X54qDNS/S4/j8bmT42MipbVvTaTgQQHSNL
	5mlFsdxRAYabaOJUhKO8XABaqmym0bRVa/y4m86HBEQC8PCNjIN8lBQO9WpRxAFG1gM
	ws+1Z5mjj2c6r57Y6RVfDad8G4WbHmAWYKE8If+s=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 30/44] x86/boot: convert dom0_construct_pv initrd param to struct boot_module
Date: Fri, 30 Aug 2024 17:47:15 -0400
Message-Id: <20240830214730.1621-31-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
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
 xen/arch/x86/pv/dom0_build.c          | 19 ++++++++++---------
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 42043230faff..c39588b346b0 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -612,7 +612,7 @@ int __init construct_dom0(struct domain *d, const struct boot_module *image,
     if ( is_hvm_domain(d) )
         rc = dom0_construct_pvh(d, image->early_mod, image->headroom, initrd->early_mod, cmdline);
     else if ( is_pv_domain(d) )
-        rc = dom0_construct_pv(d, image, initrd->early_mod, cmdline);
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
index db908ddb78b5..dce62d76e41e 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -356,7 +356,7 @@ static struct page_info * __init alloc_chunk(struct domain *d,
 
 int __init dom0_construct_pv(struct domain *d,
                              const struct boot_module *image,
-                             module_t *initrd,
+                             struct boot_module *initrd,
                              const char *cmdline)
 {
     int i, rc, order, machine;
@@ -376,7 +376,7 @@ int __init dom0_construct_pv(struct domain *d,
     void *image_base = bootstrap_map_bm(image);
     unsigned long image_len = image->size;
     void *image_start = image_base + image->headroom;
-    unsigned long initrd_len = initrd ? initrd->mod_end : 0;
+    unsigned long initrd_len = initrd ? initrd->size : 0;
     l4_pgentry_t *l4tab = NULL, *l4start = NULL;
     l3_pgentry_t *l3tab = NULL, *l3start = NULL;
     l2_pgentry_t *l2tab = NULL, *l2start = NULL;
@@ -612,7 +612,7 @@ int __init dom0_construct_pv(struct domain *d,
         initrd_pfn = vinitrd_start ?
                      (vinitrd_start - v_start) >> PAGE_SHIFT :
                      domain_tot_pages(d);
-        initrd_mfn = mfn = initrd->mod_start;
+        initrd_mfn = mfn = initrd->start >> PAGE_SHIFT;
         count = PFN_UP(initrd_len);
         if ( d->arch.physaddr_bitsize &&
              ((mfn + count - 1) >> (d->arch.physaddr_bitsize - PAGE_SHIFT)) )
@@ -627,12 +627,13 @@ int __init dom0_construct_pv(struct domain *d,
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
+            initrd_mfn = mfn_x(page_to_mfn(page));
+            initrd->start = initrd_mfn << PAGE_SHIFT;
         }
         else
         {
@@ -640,7 +641,7 @@ int __init dom0_construct_pv(struct domain *d,
                 if ( assign_pages(mfn_to_page(_mfn(mfn++)), 1, d, 0) )
                     BUG();
         }
-        initrd->mod_end = 0;
+        initrd->size = initrd->early_mod->mod_end = 0;
 
         iommu_memory_setup(d, "initrd", mfn_to_page(_mfn(initrd_mfn)),
                            PFN_UP(initrd_len), &flush_flags);
@@ -654,7 +655,7 @@ int __init dom0_construct_pv(struct domain *d,
                nr_pages - domain_tot_pages(d));
     if ( initrd )
     {
-        mpt_alloc = (paddr_t)initrd->mod_start << PAGE_SHIFT;
+        mpt_alloc = initrd->start;
         printk("\n Init. ramdisk: %"PRIpaddr"->%"PRIpaddr,
                mpt_alloc, mpt_alloc + initrd_len);
     }
@@ -882,7 +883,7 @@ int __init dom0_construct_pv(struct domain *d,
         if ( pfn >= initrd_pfn )
         {
             if ( pfn < initrd_pfn + PFN_UP(initrd_len) )
-                mfn = initrd->mod_start + (pfn - initrd_pfn);
+                mfn = (initrd->start >> PAGE_SHIFT) + (pfn - initrd_pfn);
             else
                 mfn -= PFN_UP(initrd_len);
         }
-- 
2.30.2


