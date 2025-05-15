Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D966CAB8814
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:34:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985547.1371507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYjO-0002o6-Qj; Thu, 15 May 2025 13:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985547.1371507; Thu, 15 May 2025 13:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYjO-0002h3-Ng; Thu, 15 May 2025 13:34:38 +0000
Received: by outflank-mailman (input) for mailman id 985547;
 Thu, 15 May 2025 13:34:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYXK-0006hT-P5
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:22:10 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9923e92f-318f-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 15:22:08 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1747315170626583.7198539212203;
 Thu, 15 May 2025 06:19:30 -0700 (PDT)
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
X-Inumbo-ID: 9923e92f-318f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1747315174; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GeZrkLgy9Z+TEccRyIq7edi4Snl86Jz1BJ4K6B289ZoCZOaahk8PNMDVt72ZuBeKwZYMwcj9E6MTRNHte1WEsQml5dCpVJSzczi1qGnobPkmYIft8DqWn0rbKjK1pfpAx3nZoasCFDHYrMM/yEw4tVXy4DXs3Win5eZE/j4awwQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315174; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pe3ywFf454HRDAAca+YGTm4pcdc3mvF9zfiQ+NSlMjk=; 
	b=n3sLr9u/ol/2zfN2a1rbYciH65vi8x6M4KJJ/xZRP0u8op8JMOBv2r0OD5XOYE3DVXNy5nzKZnNjYVaktvp4CfnQmnR3487Wfz0kNm+SBEwF0sPxLNmosi/Ike9ywHUji8O8LUCi+yApocl7fBQszqSg5bYNBLIjOD/gxCI2lGg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315174;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=pe3ywFf454HRDAAca+YGTm4pcdc3mvF9zfiQ+NSlMjk=;
	b=tvalZ1wNMULr3vq3Onr+LL6N0kweIOaIGI78b8w0q5X/dvBMOYYtc4VEU54JfNze
	NbKuDvLfPthn88Dp8lPHBzOmNlpbVagD0/+Cj1iYc5jf6XuVzB1uzKzTEsdGXPC/I40
	+oSgSw+7ZfFExsCgd/BoxFAUrBWQut+DXT2m+YVc=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: [RFCv2 24/38] x86/hyperlaunch: convert create_dom0 to arch_create_dom
Date: Thu, 15 May 2025 09:19:07 -0400
Message-Id: <20250515131912.5019-5-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131912.5019-1-dpsmith@apertussolutions.com>
References: <20250515131912.5019-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The only consumer of the function domain_cmdline_size() and the acpi_param
parameter is create_dom(). It is therefore reasonable to move
domain_cmdline_size() and the acpi_param parameter along with its parsing code
at the same time as create_dom0() is moved under the domain builder. While
moving create_dom0(), rename it to arch_create_dom() as the function is now
generalized.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/domain-builder/Makefile |   2 +-
 xen/arch/x86/domain-builder/domain.c | 180 +++++++++++++++++++++++++++
 xen/arch/x86/setup.c                 | 174 +-------------------------
 xen/include/xen/domain-builder.h     |   3 +
 4 files changed, 185 insertions(+), 174 deletions(-)

diff --git a/xen/arch/x86/domain-builder/Makefile b/xen/arch/x86/domain-builder/Makefile
index 0c2e7085e21b..69a7c574a8d8 100644
--- a/xen/arch/x86/domain-builder/Makefile
+++ b/xen/arch/x86/domain-builder/Makefile
@@ -1 +1 @@
-obj-y += domain.init.o
+obj-y += domain.o
diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/domain-builder/domain.c
index d934b240229f..0a7b40c9a746 100644
--- a/xen/arch/x86/domain-builder/domain.c
+++ b/xen/arch/x86/domain-builder/domain.c
@@ -5,17 +5,25 @@
 
 #include <xen/cpumask.h>
 #include <xen/domain.h>
+#include <xen/domain-builder.h>
+#include <xen/err.h>
+#include <xen/grant_table.h>
 #include <xen/init.h>
 #include <xen/lib.h> /* get types.h for libefl.h */
 #include <xen/libelf.h>
 #include <xen/nodemask.h>
+#include <xen/param.h>
 #include <xen/sched.h>
 
 #include <public/bootfdt.h>
 
 #include <asm/bootinfo.h>
+#include <asm/cpu-policy.h>
 #include <asm/dom0_build.h>
+#include <asm/domain-builder.h>
+#include <asm/io_apic.h>
 #include <asm/paging.h>
+#include <asm/pv/shim.h>
 #include <asm/spec_ctrl.h>
 
 unsigned int __init dom_max_vcpus(struct boot_domain *bd)
@@ -55,6 +63,48 @@ void __init domain_vcpus_create(struct domain *d)
     domain_update_node_affinity(d);
 }
 
+bool __read_mostly acpi_disabled;
+bool __initdata acpi_force;
+static char __initdata acpi_param[10] = "";
+
+static int __init cf_check parse_acpi_param(const char *s)
+{
+    /* Interpret the parameter for use within Xen. */
+    if ( !parse_bool(s, NULL) )
+    {
+        disable_acpi();
+    }
+    else if ( !strcmp(s, "force") )
+    {
+        acpi_force = true;
+        acpi_ht = 1;
+        acpi_disabled = false;
+    }
+    else if ( !strcmp(s, "ht") )
+    {
+        if ( !acpi_force )
+            disable_acpi();
+        acpi_ht = 1;
+    }
+    else if ( !strcmp(s, "noirq") )
+    {
+        acpi_noirq_set();
+    }
+    else if ( !strcmp(s, "verbose") )
+    {
+        opt_acpi_verbose = true;
+        return 0;
+    }
+    else
+        return -EINVAL;
+
+    /* Save the parameter so it can be propagated to domain0. */
+    safe_strcpy(acpi_param, s);
+
+    return 0;
+}
+custom_param("acpi", parse_acpi_param);
+
 unsigned long __init dom_paging_pages(
     const struct boot_domain *bd, unsigned long nr_pages)
 {
@@ -141,6 +191,136 @@ unsigned long __init dom_compute_nr_pages(
     return bd->mem_pages;
 }
 
+static size_t __init domain_cmdline_size(const struct boot_info *bi,
+                                         const struct boot_domain *bd)
+{
+    size_t s = bi->kextra ? strlen(bi->kextra) : 0;
+
+
+    /*
+     * Bootloader cmdline takes precedence and replaces the DT provided one.
+     *
+     * In that case, fdt_cmdline is not be populated at all.
+     */
+    if ( bd->kernel->fdt_cmdline )
+    {
+        BUG_ON(!IS_ENABLED(CONFIG_DOMAIN_BUILDER));
+        s += builder_get_cmdline_size(bi, bd->kernel->cmdline_pa);
+    }
+    else if ( bd->kernel->cmdline_pa )
+        s += strlen(__va(bd->kernel->cmdline_pa));
+
+    if ( s == 0 )
+        return s;
+
+    /*
+     * Certain parameters from the Xen command line may be added to the dom0
+     * command line. Add additional space for the possible cases along with one
+     * extra char to hold \0.
+     */
+    s += strlen(" noapic") + strlen(" acpi=") + sizeof(acpi_param) + 1;
+
+    return s;
+}
+
+struct domain *__init arch_create_dom(
+    struct boot_info *bi, struct boot_domain *bd)
+{
+    char *cmdline = NULL;
+    size_t cmdline_size;
+    struct xen_domctl_createdomain dom0_cfg = {
+        .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
+        .max_evtchn_port = -1,
+        .max_grant_frames = -1,
+        .max_maptrack_frames = -1,
+        .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
+        .max_vcpus = dom_max_vcpus(bd),
+        .arch = {
+            .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
+        },
+    };
+    struct domain *d;
+
+    if ( opt_dom0_pvh ||
+         (bi->hyperlaunch_enabled && !(bd->mode & BUILD_MODE_PARAVIRT)) )
+    {
+        dom0_cfg.flags |= (XEN_DOMCTL_CDF_hvm |
+                           ((hvm_hap_supported() && !opt_dom0_shadow) ?
+                            XEN_DOMCTL_CDF_hap : 0));
+
+        dom0_cfg.arch.emulation_flags |=
+            XEN_X86_EMU_LAPIC | XEN_X86_EMU_IOAPIC | XEN_X86_EMU_VPCI;
+    }
+
+    if ( iommu_enabled && (bd->capabilities & DOMAIN_CAPS_HARDWARE) )
+        dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
+
+    if ( bd->domid == DOMID_INVALID )
+        /* Create initial domain.  Not d0 for pvshim. */
+        bd->domid = get_initial_domain_id();
+    d = domain_create(bd->domid, &dom0_cfg,
+            ((bd->capabilities & DOMAIN_CAPS_CONTROL)  ? CDF_privileged : 0) |
+            ((bd->capabilities & DOMAIN_CAPS_HARDWARE) ? CDF_hardware   : 0));
+    if ( IS_ERR(d) )
+        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
+
+    bd->d = d;
+
+    if ( has_dom0_caps(bd) )
+        init_dom0_cpuid_policy(bd->d);
+
+    if ( domain_vcpu0_create(bd) == NULL )
+        panic("Error creating %pdv0\n", d);
+
+    cmdline_size = domain_cmdline_size(bi, bd);
+    if ( cmdline_size )
+    {
+        if ( !(cmdline = xzalloc_array(char, cmdline_size)) )
+            panic("Error allocating cmdline buffer for %pd\n", d);
+
+        if ( bd->kernel->fdt_cmdline )
+        {
+            BUG_ON(!IS_ENABLED(CONFIG_DOMAIN_BUILDER));
+            builder_get_cmdline(
+                bi, bd->kernel->cmdline_pa, cmdline, cmdline_size);
+        }
+        else if ( bd->kernel->cmdline_pa )
+            strlcpy(cmdline,
+                    cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loader),
+                    cmdline_size);
+
+        if ( bi->kextra )
+            /* kextra always includes exactly one leading space. */
+            strlcat(cmdline, bi->kextra, cmdline_size);
+
+        /* Append any extra parameters. */
+        if ( skip_ioapic_setup && !strstr(cmdline, "noapic") )
+            strlcat(cmdline, " noapic", cmdline_size);
+
+        if ( (strlen(acpi_param) == 0) && acpi_disabled )
+        {
+            printk("ACPI is disabled, notifying Domain 0 (acpi=off)\n");
+            safe_strcpy(acpi_param, "off");
+        }
+
+        if ( (strlen(acpi_param) != 0) && !strstr(cmdline, "acpi=") )
+        {
+            strlcat(cmdline, " acpi=", cmdline_size);
+            strlcat(cmdline, acpi_param, cmdline_size);
+        }
+        bd->kernel->cmdline_pa = 0;
+        bd->cmdline = cmdline;
+    }
+
+    if ( construct_dom0(bd) != 0 )
+        panic("Could not construct domain 0\n");
+
+    bd->cmdline = NULL;
+    xfree(cmdline);
+
+    return d;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index b03284428bb3..2458a43902e6 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -251,48 +251,6 @@ static int __init cf_check parse_smap_param(const char *s)
 }
 custom_param("smap", parse_smap_param);
 
-bool __read_mostly acpi_disabled;
-bool __initdata acpi_force;
-static char __initdata acpi_param[10] = "";
-
-static int __init cf_check parse_acpi_param(const char *s)
-{
-    /* Interpret the parameter for use within Xen. */
-    if ( !parse_bool(s, NULL) )
-    {
-        disable_acpi();
-    }
-    else if ( !strcmp(s, "force") )
-    {
-        acpi_force = true;
-        acpi_ht = 1;
-        acpi_disabled = false;
-    }
-    else if ( !strcmp(s, "ht") )
-    {
-        if ( !acpi_force )
-            disable_acpi();
-        acpi_ht = 1;
-    }
-    else if ( !strcmp(s, "noirq") )
-    {
-        acpi_noirq_set();
-    }
-    else if ( !strcmp(s, "verbose") )
-    {
-        opt_acpi_verbose = true;
-        return 0;
-    }
-    else
-        return -EINVAL;
-
-    /* Save the parameter so it can be propagated to domain0. */
-    safe_strcpy(acpi_param, s);
-
-    return 0;
-}
-custom_param("acpi", parse_acpi_param);
-
 struct boot_info __initdata xen_boot_info = {
     .loader = "unknown",
     .cmdline = "",
@@ -982,136 +940,6 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
     return n;
 }
 
-static size_t __init domain_cmdline_size(const struct boot_info *bi,
-                                         const struct boot_domain *bd)
-{
-    size_t s = bi->kextra ? strlen(bi->kextra) : 0;
-
-
-    /*
-     * Bootloader cmdline takes precedence and replaces the DT provided one.
-     *
-     * In that case, fdt_cmdline is not be populated at all.
-     */
-    if ( bd->kernel->fdt_cmdline )
-    {
-        BUG_ON(!IS_ENABLED(CONFIG_DOMAIN_BUILDER));
-        s += builder_get_cmdline_size(bi, bd->kernel->cmdline_pa);
-    }
-    else if ( bd->kernel->cmdline_pa )
-        s += strlen(__va(bd->kernel->cmdline_pa));
-
-    if ( s == 0 )
-        return s;
-
-    /*
-     * Certain parameters from the Xen command line may be added to the dom0
-     * command line. Add additional space for the possible cases along with one
-     * extra char to hold \0.
-     */
-    s += strlen(" noapic") + strlen(" acpi=") + sizeof(acpi_param) + 1;
-
-    return s;
-}
-
-static struct domain *__init create_dom0(struct boot_info *bi)
-{
-    char *cmdline = NULL;
-    size_t cmdline_size;
-    struct boot_domain *bd = &bi->domains[0];
-    struct xen_domctl_createdomain dom0_cfg = {
-        .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
-        .max_evtchn_port = -1,
-        .max_grant_frames = -1,
-        .max_maptrack_frames = -1,
-        .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
-        .max_vcpus = dom_max_vcpus(bd),
-        .arch = {
-            .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
-        },
-    };
-    struct domain *d;
-
-    if ( opt_dom0_pvh ||
-         (bi->hyperlaunch_enabled && !(bd->mode & BUILD_MODE_PARAVIRT)) )
-    {
-        dom0_cfg.flags |= (XEN_DOMCTL_CDF_hvm |
-                           ((hvm_hap_supported() && !opt_dom0_shadow) ?
-                            XEN_DOMCTL_CDF_hap : 0));
-
-        dom0_cfg.arch.emulation_flags |=
-            XEN_X86_EMU_LAPIC | XEN_X86_EMU_IOAPIC | XEN_X86_EMU_VPCI;
-    }
-
-    if ( iommu_enabled && (bd->capabilities & DOMAIN_CAPS_HARDWARE) )
-        dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
-
-    if ( bd->domid == DOMID_INVALID )
-        /* Create initial domain.  Not d0 for pvshim. */
-        bd->domid = get_initial_domain_id();
-    d = domain_create(bd->domid, &dom0_cfg,
-            ((bd->capabilities & DOMAIN_CAPS_CONTROL)  ? CDF_privileged : 0) |
-            ((bd->capabilities & DOMAIN_CAPS_HARDWARE) ? CDF_hardware   : 0));
-    if ( IS_ERR(d) )
-        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
-
-    bd->d = d;
-
-    if ( has_dom0_caps(bd) )
-        init_dom0_cpuid_policy(bd->d);
-
-    if ( domain_vcpu0_create(bd) == NULL )
-        panic("Error creating %pdv0\n", d);
-
-    cmdline_size = domain_cmdline_size(bi, bd);
-    if ( cmdline_size )
-    {
-        if ( !(cmdline = xzalloc_array(char, cmdline_size)) )
-            panic("Error allocating cmdline buffer for %pd\n", d);
-
-        if ( bd->kernel->fdt_cmdline )
-        {
-            BUG_ON(!IS_ENABLED(CONFIG_DOMAIN_BUILDER));
-            builder_get_cmdline(
-                bi, bd->kernel->cmdline_pa, cmdline, cmdline_size);
-        }
-        else if ( bd->kernel->cmdline_pa )
-            strlcpy(cmdline,
-                    cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loader),
-                    cmdline_size);
-
-        if ( bi->kextra )
-            /* kextra always includes exactly one leading space. */
-            strlcat(cmdline, bi->kextra, cmdline_size);
-
-        /* Append any extra parameters. */
-        if ( skip_ioapic_setup && !strstr(cmdline, "noapic") )
-            strlcat(cmdline, " noapic", cmdline_size);
-
-        if ( (strlen(acpi_param) == 0) && acpi_disabled )
-        {
-            printk("ACPI is disabled, notifying Domain 0 (acpi=off)\n");
-            safe_strcpy(acpi_param, "off");
-        }
-
-        if ( (strlen(acpi_param) != 0) && !strstr(cmdline, "acpi=") )
-        {
-            strlcat(cmdline, " acpi=", cmdline_size);
-            strlcat(cmdline, acpi_param, cmdline_size);
-        }
-        bd->kernel->cmdline_pa = 0;
-        bd->cmdline = cmdline;
-    }
-
-    if ( construct_dom0(bd) != 0 )
-        panic("Could not construct domain 0\n");
-
-    bd->cmdline = NULL;
-    xfree(cmdline);
-
-    return d;
-}
-
 /* How much of the directmap is prebuilt at compile time. */
 #define PREBUILT_MAP_LIMIT (1 << L2_PAGETABLE_SHIFT)
 
@@ -2198,7 +2026,7 @@ void asmlinkage __init noreturn __start_xen(void)
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
-    dom0 = create_dom0(bi);
+    dom0 = arch_create_dom(bi, &bi->domains[0]);
     if ( !dom0 )
         panic("Could not set up DOM0 guest OS\n");
 
diff --git a/xen/include/xen/domain-builder.h b/xen/include/xen/domain-builder.h
index 79e4c50ddf85..a9df326682ac 100644
--- a/xen/include/xen/domain-builder.h
+++ b/xen/include/xen/domain-builder.h
@@ -40,4 +40,7 @@ unsigned int dom_max_vcpus(struct boot_domain *bd);
 struct vcpu *domain_vcpu0_create(struct boot_domain *bd);
 void domain_vcpus_create(struct domain *d);
 
+struct domain *arch_create_dom(
+    struct boot_info *bi, struct boot_domain *bd);
+
 #endif /* __XEN_DOMAIN_BUILDER_H__ */
-- 
2.30.2


