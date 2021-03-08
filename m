Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D761330C81
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 12:36:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94805.178549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJEBW-0007S8-8F; Mon, 08 Mar 2021 11:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94805.178549; Mon, 08 Mar 2021 11:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJEBW-0007Rj-4l; Mon, 08 Mar 2021 11:36:26 +0000
Received: by outflank-mailman (input) for mailman id 94805;
 Mon, 08 Mar 2021 11:36:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C5Iz=IG=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lJEBV-0007Rb-AZ
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 11:36:25 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 43f93126-dfc4-4871-ac97-580dbff9d0bb;
 Mon, 08 Mar 2021 11:36:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71A6ED6E;
 Mon,  8 Mar 2021 03:36:23 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7AE0D3F73C;
 Mon,  8 Mar 2021 03:36:22 -0800 (PST)
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
X-Inumbo-ID: 43f93126-dfc4-4871-ac97-580dbff9d0bb
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Prevent Dom0 to be loaded when using dom0less
Date: Mon,  8 Mar 2021 11:36:04 +0000
Message-Id: <20210308113604.12961-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

This patch prevents the dom0 to be loaded skipping its
building and going forward to build domUs when the dom0
kernel is not found and at least one domU is present.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Change-Id: Ieb9630b80cc7be7688d7d5fff3f839958f142ac0
---
 xen/arch/arm/setup.c | 83 +++++++++++++++++++++++++++++++-------------
 1 file changed, 59 insertions(+), 24 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 2532ec9739..6d169ff6ce 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -794,6 +794,35 @@ static void __init setup_mm(void)
 }
 #endif
 
+static bool __init is_dom0less_mode(void)
+{
+    struct bootmodules *mods = &bootinfo.modules;
+    struct bootmodule *mod;
+    unsigned int i;
+    bool dom0found = false;
+    bool domUfound = false;
+
+    /* Look into the bootmodules */
+    for ( i = 0 ; i < mods->nr_mods ; i++ )
+    {
+        mod = &mods->module[i];
+        /* Find if dom0 and domU kernels are present */
+        if ( mod->kind == BOOTMOD_KERNEL )
+        {
+            if ( mod->domU == false )
+                dom0found = true;
+            else
+                domUfound = true;
+        }
+    }
+
+    /*
+     * If there is no dom0 kernel but at least one domU, then we are in
+     * dom0less mode
+     */
+    return ( !dom0found && domUfound );
+}
+
 size_t __read_mostly dcache_line_bytes;
 
 /* C entry point for boot CPU */
@@ -804,7 +833,7 @@ void __init start_xen(unsigned long boot_phys_offset,
     int cpus, i;
     const char *cmdline;
     struct bootmodule *xen_bootmodule;
-    struct domain *dom0;
+    struct domain *dom0 = NULL;
     struct xen_domctl_createdomain dom0_cfg = {
         .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
         .max_evtchn_port = -1,
@@ -964,28 +993,33 @@ void __init start_xen(unsigned long boot_phys_offset,
     apply_alternatives_all();
     enable_errata_workarounds();
 
-    /* Create initial domain 0. */
-    /* The vGIC for DOM0 is exactly emulating the hardware GIC */
-    dom0_cfg.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
-    /*
-     * Xen vGIC supports a maximum of 992 interrupt lines.
-     * 32 are substracted to cover local IRQs.
-     */
-    dom0_cfg.arch.nr_spis = min(gic_number_lines(), (unsigned int) 992) - 32;
-    if ( gic_number_lines() > 992 )
-        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
-    dom0_cfg.arch.tee_type = tee_get_type();
-    dom0_cfg.max_vcpus = dom0_max_vcpus();
-
-    if ( iommu_enabled )
-        dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
-
-    dom0 = domain_create(0, &dom0_cfg, true);
-    if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
-        panic("Error creating domain 0\n");
-
-    if ( construct_dom0(dom0) != 0)
-        panic("Could not set up DOM0 guest OS\n");
+    if ( !is_dom0less_mode() )
+    {
+        /* Create initial domain 0. */
+        /* The vGIC for DOM0 is exactly emulating the hardware GIC */
+        dom0_cfg.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
+        /*
+        * Xen vGIC supports a maximum of 992 interrupt lines.
+        * 32 are substracted to cover local IRQs.
+        */
+        dom0_cfg.arch.nr_spis = min(gic_number_lines(), (unsigned int) 992) - 32;
+        if ( gic_number_lines() > 992 )
+            printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
+        dom0_cfg.arch.tee_type = tee_get_type();
+        dom0_cfg.max_vcpus = dom0_max_vcpus();
+
+        if ( iommu_enabled )
+            dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
+
+        dom0 = domain_create(0, &dom0_cfg, true);
+        if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
+            panic("Error creating domain 0\n");
+
+        if ( construct_dom0(dom0) != 0)
+            panic("Could not set up DOM0 guest OS\n");
+    }
+    else
+        printk(XENLOG_INFO "Xen dom0less mode detected\n");
 
     heap_init_late();
 
@@ -1003,7 +1037,8 @@ void __init start_xen(unsigned long boot_phys_offset,
     if ( acpi_disabled )
         create_domUs();
 
-    domain_unpause_by_systemcontroller(dom0);
+    if ( dom0 )
+        domain_unpause_by_systemcontroller(dom0);
 
     /* Switch on to the dynamically allocated stack for the idle vcpu
      * since the static one we're running on is about to be freed. */
-- 
2.17.1


