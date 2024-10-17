Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 105D59A2ABD
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:20:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821036.1234835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UAt-0005Pa-1b; Thu, 17 Oct 2024 17:20:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821036.1234835; Thu, 17 Oct 2024 17:20:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UAs-0005Mk-Ts; Thu, 17 Oct 2024 17:20:34 +0000
Received: by outflank-mailman (input) for mailman id 821036;
 Thu, 17 Oct 2024 17:20:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1U0E-0008TH-Mg
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:09:34 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93ddd747-8caa-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 19:09:34 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184669125634.2300346641034;
 Thu, 17 Oct 2024 10:04:29 -0700 (PDT)
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
X-Inumbo-ID: 93ddd747-8caa-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729184672; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WEKpKvDtClHHQBu0BzpCfBAD/yVFbIu4CI12tll1MvaPJ8DbqPizvrdLlArqNVtruizHVLfyQUaBL2/hn/D0mMnD/6yRx75Sv7VxQYtuVxjCsTaQ3nyEmjmR5jAAIn3uR1+xbIVNGkbH9LF6nml7RqU+/N1cDEQ+/FYjgvh+kc8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184672; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9+B4OzBQ7rw57Cecbw8dku0IeEJ1zavf5a/aaymJkgU=; 
	b=bAQQDiTx4fZoQDKLiUIW212k+LBPbbQQ4d/2n4gKHKyz7WmT29Lf01/ItbAvk2JkQvYkXUORGuLZ+996sJgHjbSTzsulyZEZg/rktdvt/xjMLPXmpgb/pP5WNir0qCNih2MGS3fIJtdBg05VY39FnqpGCR5en1fVEh8+oAbp04M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184672;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=9+B4OzBQ7rw57Cecbw8dku0IeEJ1zavf5a/aaymJkgU=;
	b=qjgxSDaDZaunxPeasAy4mEYRX7fljKd0+/lWyCl/lSYWT1T77eG47a998ine8WsD
	gHt+mqRDzkZV2gJ4aoivpI4W//04DWBCkSHRa4uNwspWAa81t09IAeqBAK89g6CyFmr
	wF4wWc8uc7vbhtwBlEZ01/h44sOpEAmuwqtwL9+A=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 43/44] x86/boot: convert dom0_construct_pv to struct boot_domain
Date: Thu, 17 Oct 2024 13:03:23 -0400
Message-Id: <20241017170325.3842-44-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

With construct_dom0 consuming struct boot_domain, continue passing the
structure down to dom0_construct_pv.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v5:
- reverted back *v d->vcpu[0]
---
 xen/arch/x86/dom0_build.c             |  2 +-
 xen/arch/x86/include/asm/dom0_build.h |  5 ++--
 xen/arch/x86/pv/dom0_build.c          | 41 ++++++++++++---------------
 3 files changed, 21 insertions(+), 27 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 34b4943de3b1..96cd1154b037 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -612,7 +612,7 @@ int __init construct_dom0(struct boot_domain *bd)
     if ( is_hvm_domain(d) )
         rc = dom0_construct_pvh(bd->d, bd->kernel, bd->ramdisk, bd->cmdline);
     else if ( is_pv_domain(d) )
-        rc = dom0_construct_pv(bd->d, bd->kernel, bd->ramdisk, bd->cmdline);
+        rc = dom0_construct_pv(bd);
     else
         panic("Cannot construct Dom0. No guest interface available\n");
 
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index 8f7b37f3d308..60e9cb21f14d 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -4,6 +4,7 @@
 #include <xen/libelf.h>
 #include <xen/sched.h>
 
+#include <asm/bootinfo.h>
 #include <asm/setup.h>
 
 extern unsigned int dom0_memflags;
@@ -13,9 +14,7 @@ unsigned long dom0_compute_nr_pages(struct domain *d,
                                     unsigned long initrd_len);
 int dom0_setup_permissions(struct domain *d);
 
-int dom0_construct_pv(
-    struct domain *d, const struct boot_module *image,
-    struct boot_module *initrd, const char *cmdline);
+int dom0_construct_pv(struct boot_domain *bd);
 
 int dom0_construct_pvh(
     struct domain *d, const struct boot_module *image,
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 5e7b543d0cbe..53c34b7cf358 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -354,10 +354,7 @@ static struct page_info * __init alloc_chunk(struct domain *d,
     return page;
 }
 
-static int __init dom0_construct(struct domain *d,
-                                 const struct boot_module *image,
-                                 struct boot_module *initrd,
-                                 const char *cmdline)
+static int __init dom0_construct(struct boot_domain *bd)
 {
     int i, rc, order, machine;
     bool compatible, compat;
@@ -373,11 +370,12 @@ static int __init dom0_construct(struct domain *d,
     struct page_info *page = NULL;
     unsigned int flush_flags = 0;
     start_info_t *si;
+    struct domain *d = bd->d;
     struct vcpu *v = d->vcpu[0];
-    void *image_base = bootstrap_map_bm(image);
-    unsigned long image_len = image->size;
-    void *image_start = image_base + image->headroom;
-    unsigned long initrd_len = initrd ? initrd->size : 0;
+    void *image_base = bootstrap_map_bm(bd->kernel);
+    unsigned long image_len = bd->kernel->size;
+    void *image_start = image_base + bd->kernel->headroom;
+    unsigned long initrd_len = bd->ramdisk ? bd->ramdisk->size : 0;
     l4_pgentry_t *l4tab = NULL, *l4start = NULL;
     l3_pgentry_t *l3tab = NULL, *l3start = NULL;
     l2_pgentry_t *l2tab = NULL, *l2start = NULL;
@@ -613,7 +611,7 @@ static int __init dom0_construct(struct domain *d,
         initrd_pfn = vinitrd_start ?
                      (vinitrd_start - v_start) >> PAGE_SHIFT :
                      domain_tot_pages(d);
-        initrd_mfn = maddr_to_mfn(initrd->start);
+        initrd_mfn = maddr_to_mfn(bd->ramdisk->start);
         mfn = mfn_x(initrd_mfn);
         count = PFN_UP(initrd_len);
         if ( d->arch.physaddr_bitsize &&
@@ -629,13 +627,13 @@ static int __init dom0_construct(struct domain *d,
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
             initrd_mfn = page_to_mfn(page);
-            initrd->start = mfn_to_maddr(initrd_mfn);
+            bd->ramdisk->start = mfn_to_maddr(initrd_mfn);
         }
         else
         {
@@ -643,7 +641,7 @@ static int __init dom0_construct(struct domain *d,
                 if ( assign_pages(mfn_to_page(_mfn(mfn++)), 1, d, 0) )
                     BUG();
         }
-        initrd->size = 0;
+        bd->ramdisk->size = 0;
 
         iommu_memory_setup(d, "initrd", mfn_to_page(initrd_mfn),
                            PFN_UP(initrd_len), &flush_flags);
@@ -655,9 +653,9 @@ static int __init dom0_construct(struct domain *d,
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
@@ -885,7 +883,7 @@ static int __init dom0_construct(struct domain *d,
         if ( pfn >= initrd_pfn )
         {
             if ( pfn < initrd_pfn + PFN_UP(initrd_len) )
-                mfn = paddr_to_pfn(initrd->start) + (pfn - initrd_pfn);
+                mfn = paddr_to_pfn(bd->ramdisk->start) + (pfn - initrd_pfn);
             else
                 mfn -= PFN_UP(initrd_len);
         }
@@ -955,8 +953,8 @@ static int __init dom0_construct(struct domain *d,
     }
 
     memset(si->cmd_line, 0, sizeof(si->cmd_line));
-    if ( cmdline != NULL )
-        strlcpy((char *)si->cmd_line, cmdline, sizeof(si->cmd_line));
+    if ( bd->cmdline[0] != '\0' )
+        strlcpy((char *)si->cmd_line, bd->cmdline, sizeof(si->cmd_line));
 
 #ifdef CONFIG_VIDEO
     if ( !pv_shim && fill_console_start_info((void *)(si + 1)) )
@@ -1053,10 +1051,7 @@ out:
     return rc;
 }
 
-int __init dom0_construct_pv(struct domain *d,
-                             const struct boot_module *image,
-                             struct boot_module *initrd,
-                             const char *cmdline)
+int __init dom0_construct_pv(struct boot_domain *bd)
 {
     int rc;
 
@@ -1073,7 +1068,7 @@ int __init dom0_construct_pv(struct domain *d,
         write_cr4(read_cr4() & ~X86_CR4_SMAP);
     }
 
-    rc = dom0_construct(d, image, initrd, cmdline);
+    rc = dom0_construct(bd);
 
     if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
     {
-- 
2.30.2


