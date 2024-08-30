Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD8A966B96
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:53:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786734.1196456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9YR-0007HB-CK; Fri, 30 Aug 2024 21:53:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786734.1196456; Fri, 30 Aug 2024 21:53:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9YR-0007E6-8k; Fri, 30 Aug 2024 21:53:15 +0000
Received: by outflank-mailman (input) for mailman id 786734;
 Fri, 30 Aug 2024 21:53:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9YQ-0005aM-5r
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:53:14 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 402f402e-671a-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 23:53:13 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054507201417.3403256954641;
 Fri, 30 Aug 2024 14:48:27 -0700 (PDT)
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
X-Inumbo-ID: 402f402e-671a-11ef-a0b1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1725054509; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nYIvBOw7bKH/+LTjSG8e20u+CSkjctNMf9HleaCaqR6l2qNThdczixIpcUgA/XfkJ3GuEIAyCqdi/KODOQZ3aIe1jS7/FbKRIADjLdNH49Nwo8ezRIaEWLjsl69pmVsLeMI1tUmLLe6TxVDYuRZip3cihISNHkQa24UAeMX5c70=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054509; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=om7y5y0WMnQkQrCTabtNb0cenhPENJfwq9EcVkz9EkM=; 
	b=koMQ8ITrLNawDlvka1CS5H4GERurOgdHGfKt0qJCmkR2uBoC7e3Z2Nz5T6K3EDgbQN9BgSQHJOhidJGM0+OyNVthBIGnBwywVUwe7dbkY968H0NIUAOMPy2aYxAOm3b4braEt//Ea2R7n/+E9qpfDbQ9Msq01o+xC+XrlkujOvA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054509;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=om7y5y0WMnQkQrCTabtNb0cenhPENJfwq9EcVkz9EkM=;
	b=rUJdJuo9pANssvynRbE4/1h9ESWuAPhuE46FQPQzjN5tiwXjHgUalWu0LOgaWODW
	uqtZfApEHBqMIl5ceBXVbDGLCiCR5IixqUYLZEwmy3/CEyQ2XOjeMHmmGaYEpJ5DlOO
	qZ178oei70C03G1GS86eIboiIHi/YUAmtWDs5L+s=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 43/44] x86/boot: convert dom0_construct_pv to struct boot_domain
Date: Fri, 30 Aug 2024 17:47:28 -0400
Message-Id: <20240830214730.1621-44-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

With construct_dom0 consuming struct boot_domain, continue passing the
structure down to dom0_construct_pv.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/dom0_build.c             |  2 +-
 xen/arch/x86/include/asm/dom0_build.h |  5 ++--
 xen/arch/x86/pv/dom0_build.c          | 36 +++++++++++++--------------
 3 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index e552f2e9abef..8beb33032940 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -611,7 +611,7 @@ int __init construct_dom0(struct boot_domain *bd)
     if ( is_hvm_domain(bd->d) )
         rc = dom0_construct_pvh(bd->d, bd->kernel, bd->ramdisk, bd->cmdline);
     else if ( is_pv_domain(bd->d) )
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
index a403e23b2f93..82dc0c379f27 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -354,10 +354,7 @@ static struct page_info * __init alloc_chunk(struct domain *d,
     return page;
 }
 
-int __init dom0_construct_pv(struct domain *d,
-                             const struct boot_module *image,
-                             struct boot_module *initrd,
-                             const char *cmdline)
+int __init dom0_construct_pv(struct boot_domain *bd)
 {
     int i, rc, order, machine;
     bool compatible, compat;
@@ -372,11 +369,12 @@ int __init dom0_construct_pv(struct domain *d,
     struct page_info *page = NULL;
     unsigned int flush_flags = 0;
     start_info_t *si;
-    struct vcpu *v = d->vcpu[0];
-    void *image_base = bootstrap_map_bm(image);
-    unsigned long image_len = image->size;
-    void *image_start = image_base + image->headroom;
-    unsigned long initrd_len = initrd ? initrd->size : 0;
+    struct domain *d = bd->d;
+    struct vcpu *v = bd->d->vcpu[0];
+    void *image_base = bootstrap_map_bm(bd->kernel);
+    unsigned long image_len = bd->kernel->size;
+    void *image_start = image_base + bd->kernel->headroom;
+    unsigned long initrd_len = bd->ramdisk ? bd->ramdisk->size : 0;
     l4_pgentry_t *l4tab = NULL, *l4start = NULL;
     l3_pgentry_t *l3tab = NULL, *l3start = NULL;
     l2_pgentry_t *l2tab = NULL, *l2start = NULL;
@@ -612,7 +610,7 @@ int __init dom0_construct_pv(struct domain *d,
         initrd_pfn = vinitrd_start ?
                      (vinitrd_start - v_start) >> PAGE_SHIFT :
                      domain_tot_pages(d);
-        initrd_mfn = mfn = initrd->start >> PAGE_SHIFT;
+        initrd_mfn = mfn = bd->ramdisk->start >> PAGE_SHIFT;
         count = PFN_UP(initrd_len);
         if ( d->arch.physaddr_bitsize &&
              ((mfn + count - 1) >> (d->arch.physaddr_bitsize - PAGE_SHIFT)) )
@@ -627,13 +625,13 @@ int __init dom0_construct_pv(struct domain *d,
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
             initrd_mfn = mfn_x(page_to_mfn(page));
-            initrd->start = initrd_mfn << PAGE_SHIFT;
+            bd->ramdisk->start = initrd_mfn << PAGE_SHIFT;
         }
         else
         {
@@ -641,7 +639,7 @@ int __init dom0_construct_pv(struct domain *d,
                 if ( assign_pages(mfn_to_page(_mfn(mfn++)), 1, d, 0) )
                     BUG();
         }
-        initrd->size = 0;
+        bd->ramdisk->size = 0;
 
         iommu_memory_setup(d, "initrd", mfn_to_page(_mfn(initrd_mfn)),
                            PFN_UP(initrd_len), &flush_flags);
@@ -653,9 +651,9 @@ int __init dom0_construct_pv(struct domain *d,
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
@@ -883,7 +881,7 @@ int __init dom0_construct_pv(struct domain *d,
         if ( pfn >= initrd_pfn )
         {
             if ( pfn < initrd_pfn + PFN_UP(initrd_len) )
-                mfn = (initrd->start >> PAGE_SHIFT) + (pfn - initrd_pfn);
+                mfn = (bd->ramdisk->start >> PAGE_SHIFT) + (pfn - initrd_pfn);
             else
                 mfn -= PFN_UP(initrd_len);
         }
@@ -953,8 +951,8 @@ int __init dom0_construct_pv(struct domain *d,
     }
 
     memset(si->cmd_line, 0, sizeof(si->cmd_line));
-    if ( cmdline != NULL )
-        strlcpy((char *)si->cmd_line, cmdline, sizeof(si->cmd_line));
+    if ( bd->cmdline[0] != '\0' )
+        strlcpy((char *)si->cmd_line, bd->cmdline, sizeof(si->cmd_line));
 
 #ifdef CONFIG_VIDEO
     if ( !pv_shim && fill_console_start_info((void *)(si + 1)) )
-- 
2.30.2


