Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B87BA569427
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 23:19:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362613.592742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CQA-0006V8-Sj; Wed, 06 Jul 2022 21:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362613.592742; Wed, 06 Jul 2022 21:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CQA-0006SB-Oq; Wed, 06 Jul 2022 21:18:54 +0000
Received: by outflank-mailman (input) for mailman id 362613;
 Wed, 06 Jul 2022 21:18:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJEZ=XL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1o9CFv-0003HV-PX
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 21:08:20 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1896274-fd6f-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 23:08:18 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1657141521883800.3456952982841;
 Wed, 6 Jul 2022 14:05:21 -0700 (PDT)
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
X-Inumbo-ID: c1896274-fd6f-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; t=1657141523; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bAdaahGy4J37SFBsKk5H8bc+Y1NpSUjAYPOdZs9WMqgWUmz/Zwvvrfzy5TTzr8DH/vQKwczjCFpIjtRXMcqYkGwHNYpYwt+WN8h5//jorw4xFY3eOXvmHEFZyYVTIyzbpCA3DoXgNMrx4Qui1HqXSp5WQrY3T7PZgkLJCFn17oo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1657141523; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=5yZIw87G7JzBKuFzenXeWr5cm81sZ/kPE47Ov9/J3Yw=; 
	b=VrsMbbhs0gZbthX97HQSVVe0xHZ3BGb5gaYIJGs6PRAj8r/ktQ9r4WyNOplBTDVjiChPHg4tMWOiVsSlw2jA2DM/IOMt1Pd1ZftGRgg7MfZsFvaRjepWBVrgDZy3OoY6EHLmk4y1ByEUEq8hTShEyWcDjntlW82YCItpAWVYcVk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1657141523;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=5yZIw87G7JzBKuFzenXeWr5cm81sZ/kPE47Ov9/J3Yw=;
	b=HcH8j7DdN//CuLxUG8WR8URHxc2t0ESQHkc/VOm3waVqk4MQwx5E/uRU6qfE/Z7v
	spXjlI0NNzYSAseOlfEFUr0W4Gu7VaHq/KjJglaRkpzeVTQ5y1MpnSSH5Or5pu8uapp
	R1Fz8xz23VqlfKM4K9aHk8so8nv4sLtp1f5I172g=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	Wei Liu <wl@xen.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	christopher.clark@starlab.io,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 12/18] x86: convert dom0 creation to domain builder
Date: Wed,  6 Jul 2022 17:04:47 -0400
Message-Id: <20220706210454.30096-13-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220706210454.30096-1-dpsmith@apertussolutions.com>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit begins the transtion over to domain builder by coverting
the dom0 creation logic into a generalized domain creation logic.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
---
 xen/arch/x86/Makefile            |   1 +
 xen/arch/x86/domain_builder.c    | 128 +++++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/setup.h |   1 +
 xen/arch/x86/setup.c             | 109 +++-----------------------
 4 files changed, 141 insertions(+), 98 deletions(-)
 create mode 100644 xen/arch/x86/domain_builder.c

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 177a2ff742..2d5d398551 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -27,6 +27,7 @@ obj-y += desc.o
 obj-bin-y += dmi_scan.init.o
 obj-y += domain.o
 obj-bin-y += dom0_build.init.o
+obj-bin-y += domain_builder.init.o
 obj-y += domain_page.o
 obj-y += e820.o
 obj-y += emul-i8254.o
diff --git a/xen/arch/x86/domain_builder.c b/xen/arch/x86/domain_builder.c
new file mode 100644
index 0000000000..308e1a1c67
--- /dev/null
+++ b/xen/arch/x86/domain_builder.c
@@ -0,0 +1,128 @@
+#include <xen/bootdomain.h>
+#include <xen/bootinfo.h>
+#include <xen/domain.h>
+#include <xen/domain_builder.h>
+#include <xen/err.h>
+#include <xen/grant_table.h>
+#include <xen/iommu.h>
+#include <xen/sched.h>
+
+#include <asm/pv/shim.h>
+#include <asm/setup.h>
+
+extern unsigned long cr4_pv32_mask;
+
+static unsigned int __init dom_max_vcpus(struct boot_domain *bd)
+{
+    unsigned int limit;
+
+    if ( builder_is_initdom(bd) )
+        return dom0_max_vcpus();
+
+    limit = bd->mode & BUILD_MODE_PARAVIRTUALIZED ?
+                MAX_VIRT_CPUS : HVM_MAX_VCPUS;
+
+    if ( bd->ncpus > limit )
+        return limit;
+    else
+        return bd->ncpus;
+}
+
+void __init arch_create_dom(
+    const struct boot_info *bi, struct boot_domain *bd)
+{
+    struct xen_domctl_createdomain dom_cfg = {
+        .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
+        .max_evtchn_port = -1,
+        .max_grant_frames = -1,
+        .max_maptrack_frames = -1,
+        .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
+        .max_vcpus = dom_max_vcpus(bd),
+        .arch = {
+            .misc_flags = bd->functions & BUILD_FUNCTION_INITIAL_DOM &&
+                           opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
+        },
+    };
+    unsigned int is_privileged = 0;
+    char *cmdline;
+
+    if ( bd->kernel == NULL )
+        panic("Error creating d%uv0\n", bd->domid);
+
+    /* mask out PV and device model bits, if 0 then the domain is PVH */
+    if ( !(bd->mode &
+           (BUILD_MODE_PARAVIRTUALIZED|BUILD_MODE_ENABLE_DEVICE_MODEL)) )
+    {
+        dom_cfg.flags |= (XEN_DOMCTL_CDF_hvm |
+                         (hvm_hap_supported() ? XEN_DOMCTL_CDF_hap : 0));
+
+        /*
+         * If shadow paging is enabled for the initial domain, mask out
+         * HAP if it was just enabled.
+         */
+        if ( builder_is_initdom(bd) )
+            if ( opt_dom0_shadow )
+                dom_cfg.flags |= ~XEN_DOMCTL_CDF_hap;
+
+        /* TODO: review which flags should be present */
+        dom_cfg.arch.emulation_flags |=
+            XEN_X86_EMU_LAPIC | XEN_X86_EMU_IOAPIC | XEN_X86_EMU_VPCI;
+    }
+
+    if ( iommu_enabled && builder_is_hwdom(bd) )
+        dom_cfg.flags |= XEN_DOMCTL_CDF_iommu;
+
+    if ( !pv_shim && builder_is_ctldom(bd) )
+        is_privileged = CDF_privileged;
+
+    /* Create initial domain.  Not d0 for pvshim. */
+    bd->domid = get_initial_domain_id();
+    bd->domain = domain_create(bd->domid, &dom_cfg, is_privileged);
+    if ( IS_ERR(bd->domain) )
+        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(bd->domain));
+
+    init_dom0_cpuid_policy(bd->domain);
+
+    if ( alloc_dom0_vcpu0(bd->domain) == NULL )
+        panic("Error creating d%uv0\n", bd->domid);
+
+    /* Grab the DOM0 command line. */
+    cmdline = (bd->kernel->string.kind == BOOTSTR_CMDLINE) ?
+              bd->kernel->string.bytes : NULL;
+    if ( cmdline || bi->arch->kextra )
+    {
+        char dom_cmdline[MAX_GUEST_CMDLINE];
+
+        cmdline = arch_prepare_cmdline(cmdline, bi->arch);
+        strlcpy(dom_cmdline, cmdline, MAX_GUEST_CMDLINE);
+
+        if ( bi->arch->kextra )
+            /* kextra always includes exactly one leading space. */
+            strlcat(dom_cmdline, bi->arch->kextra, MAX_GUEST_CMDLINE);
+
+        apply_xen_cmdline(dom_cmdline);
+
+        strlcpy(bd->kernel->string.bytes, dom_cmdline, MAX_GUEST_CMDLINE);
+    }
+
+    /*
+     * Temporarily clear SMAP in CR4 to allow user-accesses in construct_dom0().
+     * This saves a large number of corner cases interactions with
+     * copy_from_user().
+     */
+    if ( cpu_has_smap )
+    {
+        cr4_pv32_mask &= ~X86_CR4_SMAP;
+        write_cr4(read_cr4() & ~X86_CR4_SMAP);
+    }
+
+    if ( construct_domain(bd) != 0 )
+        panic("Could not construct domain 0\n");
+
+    if ( cpu_has_smap )
+    {
+        write_cr4(read_cr4() | X86_CR4_SMAP);
+        cr4_pv32_mask |= X86_CR4_SMAP;
+    }
+}
+
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index f9c1468fcc..6f53623fb3 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -33,6 +33,7 @@ void vesa_init(void);
 static inline void vesa_init(void) {};
 #endif
 
+void apply_xen_cmdline(char *cmdline);
 int construct_domain(struct boot_domain *bd);
 
 void setup_io_bitmap(struct domain *d);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 860b9e3d64..479b9fa149 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -8,6 +8,7 @@
 #include <xen/param.h>
 #include <xen/sched.h>
 #include <xen/domain.h>
+#include <xen/domain_builder.h>
 #include <xen/serial.h>
 #include <xen/softirq.h>
 #include <xen/acpi.h>
@@ -745,109 +746,21 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
     return n;
 }
 
-static struct domain *__init create_dom0(
-    const struct boot_info *bi, struct boot_domain *bd)
+void __init apply_xen_cmdline(char *cmdline)
 {
-    struct xen_domctl_createdomain dom0_cfg = {
-        .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
-        .max_evtchn_port = -1,
-        .max_grant_frames = -1,
-        .max_maptrack_frames = -1,
-        .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
-        .max_vcpus = dom0_max_vcpus(),
-        .arch = {
-            .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
-        },
-    };
-    char *cmdline;
-
-    if ( bd->kernel == NULL )
-        panic("Error creating d%uv0\n", bd->domid);
-
-    if ( opt_dom0_pvh )
-    {
-        dom0_cfg.flags |= (XEN_DOMCTL_CDF_hvm |
-                           ((hvm_hap_supported() && !opt_dom0_shadow) ?
-                            XEN_DOMCTL_CDF_hap : 0));
-
-        dom0_cfg.arch.emulation_flags |=
-            XEN_X86_EMU_LAPIC | XEN_X86_EMU_IOAPIC | XEN_X86_EMU_VPCI;
-    }
-
-    if ( iommu_enabled )
-        dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
-
-    /* Create initial domain.  Not d0 for pvshim. */
-    bd->domid = get_initial_domain_id();
-    bd->domain = domain_create(bd->domid, &dom0_cfg, pv_shim ?
-                               0 : CDF_privileged);
-    if ( IS_ERR(bd->domain) )
-        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(bd->domain));
-
-    init_dom0_cpuid_policy(bd->domain);
-
-    if ( alloc_dom0_vcpu0(bd->domain) == NULL )
-        panic("Error creating d%uv0\n", bd->domid);
-
-    /* Grab the DOM0 command line. */
-    cmdline = (bd->kernel->string.kind == BOOTSTR_CMDLINE) ?
-              bd->kernel->string.bytes : NULL;
-    if ( cmdline || bi->arch->kextra )
-    {
-        char dom0_cmdline[MAX_GUEST_CMDLINE];
-
-        cmdline = arch_prepare_cmdline(cmdline, bi->arch);
-        strlcpy(dom0_cmdline, cmdline, MAX_GUEST_CMDLINE);
-
-        if ( bi->arch->kextra )
-            /* kextra always includes exactly one leading space. */
-            strlcat(dom0_cmdline, bi->arch->kextra, MAX_GUEST_CMDLINE);
-
-        /* Append any extra parameters. */
-        if ( skip_ioapic_setup && !strstr(dom0_cmdline, "noapic") )
-            strlcat(dom0_cmdline, " noapic", MAX_GUEST_CMDLINE);
-        if ( (strlen(acpi_param) == 0) && acpi_disabled )
-        {
-            printk("ACPI is disabled, notifying Domain 0 (acpi=off)\n");
-            strlcpy(acpi_param, "off", sizeof(acpi_param));
-        }
-        if ( (strlen(acpi_param) != 0) && !strstr(dom0_cmdline, "acpi=") )
-        {
-            strlcat(dom0_cmdline, " acpi=", MAX_GUEST_CMDLINE);
-            strlcat(dom0_cmdline, acpi_param, MAX_GUEST_CMDLINE);
-        }
-
-        strlcpy(bd->kernel->string.bytes, dom0_cmdline, MAX_GUEST_CMDLINE);
-    }
-
-    /*
-     * Temporarily clear SMAP in CR4 to allow user-accesses in construct_dom0().
-     * This saves a large number of corner cases interactions with
-     * copy_from_user().
-     */
-    if ( cpu_has_smap )
+    if ( skip_ioapic_setup && !strstr(cmdline, "noapic") )
+        strlcat(cmdline, " noapic", MAX_GUEST_CMDLINE);
+    if ( (strlen(acpi_param) == 0) && acpi_disabled )
     {
-        cr4_pv32_mask &= ~X86_CR4_SMAP;
-        write_cr4(read_cr4() & ~X86_CR4_SMAP);
+        printk("ACPI is disabled, notifying Domain 0 (acpi=off)\n");
+        strlcpy(acpi_param, "off", sizeof(acpi_param));
     }
-
-    if ( construct_domain(bd) != 0 )
-        panic("Could not construct domain 0\n");
-
-    if ( cpu_has_smap )
+    if ( (strlen(acpi_param) != 0) &&
+         !strstr(cmdline, "acpi=") )
     {
-        write_cr4(read_cr4() | X86_CR4_SMAP);
-        cr4_pv32_mask |= X86_CR4_SMAP;
+        strlcat(cmdline, " acpi=", MAX_GUEST_CMDLINE);
+        strlcat(cmdline, acpi_param, MAX_GUEST_CMDLINE);
     }
-
-    return bd->domain;
-}
-
-void __init arch_create_dom(
-    const struct boot_info *bi, struct boot_domain *bd)
-{
-    if ( builder_is_initdom(bd) )
-        create_dom0(bi, bd);
 }
 
 /* How much of the directmap is prebuilt at compile time. */
-- 
2.20.1


