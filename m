Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D8F966B97
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:53:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786736.1196466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9YY-0007k6-MA; Fri, 30 Aug 2024 21:53:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786736.1196466; Fri, 30 Aug 2024 21:53:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9YY-0007gn-HP; Fri, 30 Aug 2024 21:53:22 +0000
Received: by outflank-mailman (input) for mailman id 786736;
 Fri, 30 Aug 2024 21:53:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9YW-0005aM-N4
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:53:20 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43f67f7e-671a-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 23:53:19 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054508269777.6559146284596;
 Fri, 30 Aug 2024 14:48:28 -0700 (PDT)
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
X-Inumbo-ID: 43f67f7e-671a-11ef-a0b1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1725054510; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=F8GDSqvtfe8sJGYcYxWphnjze9dEx9bE/zadr8JX5NVSXkAQhinY0XWCWka4Ek15zQDVUuMX6EUN9/HQqtDyfomKjBeGlFQJt4oE+IYPNqDfaT+5ObFh7MRoDtvjARGEA46ihAa31MELBPSzOl3c9TD+/pIzFaD/0tCU1RInw94=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054510; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KS82AUYRZGk7W9Pk3CIfd4vp+4qfK/g7l4LYGblZ46w=; 
	b=N0RFq2bGoZ/6Tp7lh2CY6T6WanyroSB87ZR1BvHqh5PcluVV5ZgIiGvWp9jfmAWa35mNXyVLiCLfvk8j4pjZB04YmopVUB1xheHGlcT3YSYmQCzMrvrroytJUd34EEuGbMCHpQapW1ufx22t58AiWWNLg59lHeVj+Y1QBvUm1Mk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054510;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=KS82AUYRZGk7W9Pk3CIfd4vp+4qfK/g7l4LYGblZ46w=;
	b=ei25+HbYtoU4V9y9fHjO2Jal2Ep9aNv4ViQcn5+wcA9OrxyDi/LplUmi16AjAN+E
	TNV6bNnFASva7Ak/4eC6BxaCLNRYT8H9wRekpIn2VSSkAwknPVfgtbR1NjY77Ds9dU7
	ImpxIBcpsghkPP7WYjwIfj4VTfx9HbbAXiD4sF/Y=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 44/44] x86/boot: convert dom0_construct_pvh to struct boot_domain
Date: Fri, 30 Aug 2024 17:47:29 -0400
Message-Id: <20240830214730.1621-45-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

With construct_dom0 consuming struct boot_domain, continue passing the
structure down to dom0_construct_pvh.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/dom0_build.c             |  2 +-
 xen/arch/x86/hvm/dom0_build.c         | 31 +++++++++++++--------------
 xen/arch/x86/include/asm/dom0_build.h |  4 +---
 3 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 8beb33032940..6a21fd46d5a3 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -609,7 +609,7 @@ int __init construct_dom0(struct boot_domain *bd)
     process_pending_softirqs();
 
     if ( is_hvm_domain(bd->d) )
-        rc = dom0_construct_pvh(bd->d, bd->kernel, bd->ramdisk, bd->cmdline);
+        rc = dom0_construct_pvh(bd);
     else if ( is_pv_domain(bd->d) )
         rc = dom0_construct_pv(bd);
     else
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index b359f3d98376..13e17550efa5 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -1284,25 +1284,23 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
     }
 }
 
-int __init dom0_construct_pvh(
-    struct domain *d, const struct boot_module *image,
-    struct boot_module *initrd, const char *cmdline)
+int __init dom0_construct_pvh(const struct boot_domain *bd)
 {
     paddr_t entry, start_info;
     int rc;
 
-    printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
+    printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", bd->domid);
 
-    if ( is_hardware_domain(d) )
+    if ( is_hardware_domain(bd->d) )
     {
         /*
          * Setup permissions early so that calls to add MMIO regions to the
          * p2m as part of vPCI setup don't fail due to permission checks.
          */
-        rc = dom0_setup_permissions(d);
+        rc = dom0_setup_permissions(bd->d);
         if ( rc )
         {
-            printk("%pd unable to setup permissions: %d\n", d, rc);
+            printk("%pd unable to setup permissions: %d\n", bd->d, rc);
             return rc;
         }
     }
@@ -1312,25 +1310,26 @@ int __init dom0_construct_pvh(
      * initialization so the iommu code can fetch the MMCFG regions used by the
      * domain.
      */
-    pvh_setup_mmcfg(d);
+    pvh_setup_mmcfg(bd->d);
 
     /*
      * Craft dom0 physical memory map and set the paging allocation. This must
      * be done before the iommu initializion, since iommu initialization code
      * will likely add mappings required by devices to the p2m (ie: RMRRs).
      */
-    pvh_init_p2m(d);
+    pvh_init_p2m(bd->d);
 
-    iommu_hwdom_init(d);
+    iommu_hwdom_init(bd->d);
 
-    rc = pvh_populate_p2m(d);
+    rc = pvh_populate_p2m(bd->d);
     if ( rc )
     {
         printk("Failed to setup Dom0 physical memory map\n");
         return rc;
     }
 
-    rc = pvh_load_kernel(d, image, initrd, bootstrap_map_bm(image), cmdline,
+    rc = pvh_load_kernel(bd->d, bd->kernel, bd->ramdisk,
+                         bootstrap_map_bm(bd->kernel), bd->cmdline,
                          &entry, &start_info);
     if ( rc )
     {
@@ -1338,14 +1337,14 @@ int __init dom0_construct_pvh(
         return rc;
     }
 
-    rc = pvh_setup_cpus(d, entry, start_info);
+    rc = pvh_setup_cpus(bd->d, entry, start_info);
     if ( rc )
     {
         printk("Failed to setup Dom0 CPUs: %d\n", rc);
         return rc;
     }
 
-    rc = pvh_setup_acpi(d, start_info);
+    rc = pvh_setup_acpi(bd->d, start_info);
     if ( rc )
     {
         printk("Failed to setup Dom0 ACPI tables: %d\n", rc);
@@ -1354,8 +1353,8 @@ int __init dom0_construct_pvh(
 
     if ( opt_dom0_verbose )
     {
-        printk("Dom%u memory map:\n", d->domain_id);
-        print_e820_memory_map(d->arch.e820, d->arch.nr_e820);
+        printk("Dom%u memory map:\n", bd->domid);
+        print_e820_memory_map(bd->d->arch.e820, bd->d->arch.nr_e820);
     }
 
     return 0;
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index 60e9cb21f14d..adbe90bfd034 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -16,9 +16,7 @@ int dom0_setup_permissions(struct domain *d);
 
 int dom0_construct_pv(struct boot_domain *bd);
 
-int dom0_construct_pvh(
-    struct domain *d, const struct boot_module *image,
-    struct boot_module *initrd, const char *cmdline);
+int dom0_construct_pvh(const struct boot_domain *bd);
 
 unsigned long dom0_paging_pages(const struct domain *d,
                                 unsigned long nr_pages);
-- 
2.30.2


