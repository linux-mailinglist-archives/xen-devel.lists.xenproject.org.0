Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7FF357FE1
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 11:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107103.204710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lURH8-0004Wv-3k; Thu, 08 Apr 2021 09:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107103.204710; Thu, 08 Apr 2021 09:48:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lURH7-0004WV-Ue; Thu, 08 Apr 2021 09:48:33 +0000
Received: by outflank-mailman (input) for mailman id 107103;
 Thu, 08 Apr 2021 09:48:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0/ag=JF=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lURH6-0004WL-Mv
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 09:48:32 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id aaa26d65-9060-46f9-8271-5e5f6ea52be3;
 Thu, 08 Apr 2021 09:48:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBD10106F;
 Thu,  8 Apr 2021 02:48:30 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD9843F694;
 Thu,  8 Apr 2021 02:48:29 -0700 (PDT)
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
X-Inumbo-ID: aaa26d65-9060-46f9-8271-5e5f6ea52be3
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/4] xen/arm: Move dom0 creation in domain_build.c
Date: Thu,  8 Apr 2021 10:48:15 +0100
Message-Id: <20210408094818.8173-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210408094818.8173-1-luca.fancellu@arm.com>
References: <20210408094818.8173-1-luca.fancellu@arm.com>

Move dom0 creation and start from setup.c to domain_build.c
on a dedicate function.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/domain_build.c | 36 ++++++++++++++++++++++++++++++++++++
 xen/arch/arm/setup.c        | 29 +----------------------------
 xen/include/asm-arm/setup.h |  1 +
 3 files changed, 38 insertions(+), 28 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 374bf655ee..d7c9c7f4d1 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -21,6 +21,7 @@
 #include <asm/device.h>
 #include <asm/kernel.h>
 #include <asm/setup.h>
+#include <asm/tee/tee.h>
 #include <asm/platform.h>
 #include <asm/psci.h>
 #include <asm/setup.h>
@@ -2520,6 +2521,41 @@ void __init create_domUs(void)
     }
 }
 
+struct domain* __init create_dom0(void)
+{
+    struct domain *dom0;
+    struct xen_domctl_createdomain dom0_cfg = {
+        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
+        .max_evtchn_port = -1,
+        .max_grant_frames = gnttab_dom0_frames(),
+        .max_maptrack_frames = -1,
+    };
+
+    /* The vGIC for DOM0 is exactly emulating the hardware GIC */
+    dom0_cfg.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
+    /*
+     * Xen vGIC supports a maximum of 992 interrupt lines.
+     * 32 are substracted to cover local IRQs.
+     */
+    dom0_cfg.arch.nr_spis = min(gic_number_lines(), (unsigned int) 992) - 32;
+    if ( gic_number_lines() > 992 )
+        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
+    dom0_cfg.arch.tee_type = tee_get_type();
+    dom0_cfg.max_vcpus = dom0_max_vcpus();
+
+    if ( iommu_enabled )
+        dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
+
+    dom0 = domain_create(0, &dom0_cfg, true);
+    if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
+        panic("Error creating domain 0\n");
+
+    if ( construct_dom0(dom0) != 0)
+        panic("Could not set up DOM0 guest OS\n");
+
+    return dom0;
+}
+
 int __init construct_dom0(struct domain *d)
 {
     struct kernel_info kinfo = {};
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 2532ec9739..b405f58996 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -51,7 +51,6 @@
 #include <asm/platform.h>
 #include <asm/procinfo.h>
 #include <asm/setup.h>
-#include <asm/tee/tee.h>
 #include <xsm/xsm.h>
 #include <asm/acpi.h>
 
@@ -805,12 +804,6 @@ void __init start_xen(unsigned long boot_phys_offset,
     const char *cmdline;
     struct bootmodule *xen_bootmodule;
     struct domain *dom0;
-    struct xen_domctl_createdomain dom0_cfg = {
-        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
-        .max_evtchn_port = -1,
-        .max_grant_frames = gnttab_dom0_frames(),
-        .max_maptrack_frames = -1,
-    };
     int rc;
 
     dcache_line_bytes = read_dcache_line_bytes();
@@ -965,27 +958,7 @@ void __init start_xen(unsigned long boot_phys_offset,
     enable_errata_workarounds();
 
     /* Create initial domain 0. */
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
+    dom0 = create_dom0();
 
     heap_init_late();
 
diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
index 28bf622aa1..e5f5c7ebc6 100644
--- a/xen/include/asm-arm/setup.h
+++ b/xen/include/asm-arm/setup.h
@@ -95,6 +95,7 @@ int acpi_make_efi_nodes(void *fdt, struct membank tbl_add[]);
 
 int construct_dom0(struct domain *d);
 void create_domUs(void);
+struct domain* create_dom0(void);
 
 void discard_initial_modules(void);
 void fw_unreserved_regions(paddr_t s, paddr_t e,
-- 
2.17.1


