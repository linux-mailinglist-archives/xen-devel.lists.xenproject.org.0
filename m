Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9571D9A585C
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:57:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823019.1237045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gjP-0006Ya-LR; Mon, 21 Oct 2024 00:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823019.1237045; Mon, 21 Oct 2024 00:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gjP-0006ST-HH; Mon, 21 Oct 2024 00:57:11 +0000
Received: by outflank-mailman (input) for mailman id 823019;
 Mon, 21 Oct 2024 00:57:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gda-0001i1-1z
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:51:10 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e57dc13-8f46-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 02:51:08 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471626606907.5806199234472;
 Sun, 20 Oct 2024 17:47:06 -0700 (PDT)
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
X-Inumbo-ID: 8e57dc13-8f46-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729471628; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UGl4CcdPM4nKzyzRg8g2MZsMS0SHNlqa1Ngq87fUNUy9l0ZIg0feoNz44a07z5NbfbLsUzCLF7nwBpbwXJjc+//Y2x5SePEbYcpNTQB+SwZcwXYgMFf3sM1ZSi/F+xfFPdWJITxhbaw3Emuii4TCu8CvZ4GaM8eiijUAWs7BOrc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471628; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7rvH6WBzxQb9IRNi1YOifSatMNkaZHAsSaJgeiL+WGk=; 
	b=fUMoFVEl22M+HotU5VGt1vYC22FqJMImju+zWCj7peCRnOaGX6z+jE++gBX3iPbwaydr/lNLRcCBb9As3j/morUe8xCjvYL6OGL+5XAdDgdWP46AlCOBCNOZr8vOw7Zkk9AiviQGF+GNIQ5qbpNd36eHSQhlWIhWl+En7Twm9xY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471628;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=7rvH6WBzxQb9IRNi1YOifSatMNkaZHAsSaJgeiL+WGk=;
	b=H+A0Rxi/Q7hfCBuQ3mu860Sh6YZFaKMlU/2bSEysxZWH+XUhwkL9QRcGGC9MtBFs
	FlUj0CzVdsrMzHFMbtS2IZgGusPgUz3Vhel/BLpeD0caC7Q2FgJk0ANDhERD1y3MKoh
	scQnMc8HRMljirszyGZscBl51eSw72cnDzGuJMSg=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 37/38] x86/boot: convert dom0_construct_pv to struct boot_domain
Date: Sun, 20 Oct 2024 20:46:12 -0400
Message-Id: <20241021004613.18793-38-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
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
index 5d0c4fd2639a..eafa741db16f 100644
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
 
-int dom0_construct_pv(struct domain *d, const struct boot_module *image,
-                      struct boot_module *initrd,
-                      const char *cmdline);
+int dom0_construct_pv(struct boot_domain *bd);
 
 int dom0_construct_pvh(struct domain *d, const struct boot_module *image,
                        struct boot_module *initrd,
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 45a386aa81f0..d9efef4f0599 100644
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
     unsigned long cr4 = read_cr4();
     int rc;
@@ -1074,7 +1069,7 @@ int __init dom0_construct_pv(struct domain *d,
         write_cr4(cr4 & ~X86_CR4_SMAP);
     }
 
-    rc = dom0_construct(d, image, initrd, cmdline);
+    rc = dom0_construct(bd);
 
     if ( cr4 & X86_CR4_SMAP )
     {
-- 
2.30.2


