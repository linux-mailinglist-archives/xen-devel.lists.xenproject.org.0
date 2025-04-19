Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13702A945BD
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:21:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960214.1352296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GYi-0002TA-4f; Sat, 19 Apr 2025 22:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960214.1352296; Sat, 19 Apr 2025 22:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GYh-0002RH-Uq; Sat, 19 Apr 2025 22:21:11 +0000
Received: by outflank-mailman (input) for mailman id 960214;
 Sat, 19 Apr 2025 22:21:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GQh-0004yY-Rj
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:12:55 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70632971-1d6b-11f0-9eb0-5ba50f476ded;
 Sun, 20 Apr 2025 00:12:54 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100550463498.5819628185641;
 Sat, 19 Apr 2025 15:09:10 -0700 (PDT)
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
X-Inumbo-ID: 70632971-1d6b-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1745100554; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H5fkN4jq2ULvKJ9gyjiOV9wH1NLWdxyX1Q36QQ4vOI46xMR+gneHEtXCdQnGoF0bWfBkezYllrsbYAWYXChk9Y1NVN/rM2FkPFdD9Ri/IZfXg53jLYsiVl8OJ94XSBUK7ifsoWaj50RQy8fP2B4+yqfBexGeWpFayEau08/sSD0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100554; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XCB/veqLy59i1pjLF+gLDnpye6NGCF9wk7+O4Lczmd0=; 
	b=ZLaDLcflQpthWdkHn8Rl05tSFexhUHNsV+Pvkdms/icYAZM1ZOtbLql5ZTFHU92+V4gP6rl2oPt8wVVwHHscmMvR7rYfBUHWhAucd3cd2Xcn5paYYBsIv/DYYjmbkXsLufFQ6wIAGJyvfY+xtIBzKycm6dhNDi0z6ZbYQdzz4I8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100554;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=XCB/veqLy59i1pjLF+gLDnpye6NGCF9wk7+O4Lczmd0=;
	b=dF3rmo7VPvubptUCA4S8zkVCYu+4eUxLi7R8hp9GPzWm1iC4OmvmMq+vV7EOVTvQ
	uPLQEwPhLnHfT1j72XJDyiYQLp7j8Nnn7ioqSeAsrMUkEBh3CFX/PzcrsGEDzjdWesc
	wlvnhsyy04dECXKN9abDi/wvafFhLXHoQEitgkpo=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 25/38] x86/hyperlaunch: convert create_dom0 to arch_create_dom
Date: Sat, 19 Apr 2025 18:08:07 -0400
Message-Id: <20250419220820.4234-26-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
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
 xen/arch/x86/domain-builder/Makefile      |   2 +-
 xen/arch/x86/domain-builder/domain.c      | 172 ++++++++++++++++++++++
 xen/arch/x86/include/asm/domain-builder.h |   3 +
 xen/arch/x86/setup.c                      | 167 +--------------------
 4 files changed, 177 insertions(+), 167 deletions(-)

diff --git a/xen/arch/x86/domain-builder/Makefile b/xen/arch/x86/domain-builder/Makefile
index 67024b5cb213..cefe20abd2e6 100644
--- a/xen/arch/x86/domain-builder/Makefile
+++ b/xen/arch/x86/domain-builder/Makefile
@@ -1,3 +1,3 @@
 obj-$(CONFIG_DOMAIN_BUILDER) += fdt.init.o
 obj-y += core.init.o
-obj-y += domain.init.o
+obj-y += domain.o
diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/domain-builder/domain.c
index 764a1af4acd3..a82c02250b4c 100644
--- a/xen/arch/x86/domain-builder/domain.c
+++ b/xen/arch/x86/domain-builder/domain.c
@@ -5,16 +5,65 @@
 
 #include <xen/cpumask.h>
 #include <xen/domain.h>
+#include <xen/err.h>
+#include <xen/grant_table.h>
 #include <xen/init.h>
 #include <xen/libelf.h>
 #include <xen/nodemask.h>
+#include <xen/param.h>
 #include <xen/sched.h>
 
 #include <asm/bootinfo.h>
+#include <asm/cpu-policy.h>
 #include <asm/dom0_build.h>
+#include <asm/domain-builder.h>
+#include <asm/io_apic.h>
 #include <asm/paging.h>
+#include <asm/pv/shim.h>
 #include <asm/spec_ctrl.h>
 
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
@@ -138,6 +187,129 @@ void __init alloc_dom_vcpus(struct domain *d)
     domain_update_node_affinity(d);
 }
 
+static size_t __init domain_cmdline_size(
+    struct boot_info *bi, struct boot_domain *bd)
+{
+    size_t s = bi->kextra ? strlen(bi->kextra) : 0;
+
+    if ( bd->kernel->fdt_cmdline )
+        s += builder_get_cmdline_size(bi, bd->kernel->cmdline_pa);
+    else
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
+    unsigned int create_flags = 0;
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
+    if ( bd->capabilities & BUILD_CAPS_HARDWARE )
+    {
+        create_flags |= CDF_hardware;
+        if ( iommu_enabled )
+            dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
+    }
+
+    if ( bd->domid == DOMID_INVALID )
+        /* Create initial domain.  Not d0 for pvshim. */
+        bd->domid = get_initial_domain_id();
+    if ( bd->capabilities & BUILD_CAPS_CONTROL )
+        create_flags |= CDF_privileged | CDF_hardware;
+    d = domain_create(bd->domid, &dom0_cfg,
+                      pv_shim ? 0 : create_flags);
+    if ( IS_ERR(d) )
+        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
+
+    bd->d = d;
+
+    if ( bd->capabilities & BUILD_CAPS_CONTROL )
+        init_dom0_cpuid_policy(bd->d);
+
+    if ( alloc_dom_vcpu0(bd) == NULL )
+        panic("Error creating %pd vcpu 0\n", d);
+
+    cmdline_size = domain_cmdline_size(bi, bd);
+    if ( cmdline_size )
+    {
+        if ( !(cmdline = xzalloc_array(char, cmdline_size)) )
+            panic("Error allocating cmdline buffer for %pd\n", d);
+
+        if ( bd->kernel->fdt_cmdline )
+            builder_get_cmdline(
+                bi, bd->kernel->cmdline_pa, cmdline, cmdline_size);
+        else
+            strlcpy(cmdline,
+                    cmdline_cook(__va(bd->kernel->cmdline_pa),bi->loader),
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
+    XFREE(cmdline);
+
+    return d;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/domain-builder.h b/xen/arch/x86/include/asm/domain-builder.h
index ee91edc3c4d1..ccab02c3a1fd 100644
--- a/xen/arch/x86/include/asm/domain-builder.h
+++ b/xen/arch/x86/include/asm/domain-builder.h
@@ -9,6 +9,9 @@ int __init builder_get_cmdline(
 
 void builder_init(struct boot_info *bi);
 
+struct domain *arch_create_dom(
+    struct boot_info *bi, struct boot_domain *bd);
+
 int hvm_add_mem_range(
     struct domain *d, uint64_t s, uint64_t e, unsigned int type);
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 0c9f1cd98faa..8f956b6eca4f 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -249,48 +249,6 @@ static int __init cf_check parse_smap_param(const char *s)
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
@@ -980,129 +938,6 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
     return n;
 }
 
-static size_t __init domain_cmdline_size(
-    struct boot_info *bi, struct boot_domain *bd)
-{
-    size_t s = bi->kextra ? strlen(bi->kextra) : 0;
-
-    if ( bd->kernel->fdt_cmdline )
-        s += builder_get_cmdline_size(bi, bd->kernel->cmdline_pa);
-    else
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
-    unsigned int create_flags = 0;
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
-    if ( bd->capabilities & BUILD_CAPS_HARDWARE )
-    {
-        create_flags |= CDF_hardware;
-        if ( iommu_enabled )
-            dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
-    }
-
-    if ( bd->domid == DOMID_INVALID )
-        /* Create initial domain.  Not d0 for pvshim. */
-        bd->domid = get_initial_domain_id();
-    if ( bd->capabilities & BUILD_CAPS_CONTROL )
-        create_flags |= CDF_privileged | CDF_hardware;
-    d = domain_create(bd->domid, &dom0_cfg,
-                      pv_shim ? 0 : create_flags);
-    if ( IS_ERR(d) )
-        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
-
-    bd->d = d;
-
-    if ( bd->capabilities & BUILD_CAPS_CONTROL )
-        init_dom0_cpuid_policy(bd->d);
-
-    if ( alloc_dom_vcpu0(bd) == NULL )
-        panic("Error creating %pd vcpu 0\n", d);
-
-    cmdline_size = domain_cmdline_size(bi, bd);
-    if ( cmdline_size )
-    {
-        if ( !(cmdline = xzalloc_array(char, cmdline_size)) )
-            panic("Error allocating cmdline buffer for %pd\n", d);
-
-        if ( bd->kernel->fdt_cmdline )
-            builder_get_cmdline(
-                bi, bd->kernel->cmdline_pa, cmdline, cmdline_size);
-        else
-            strlcpy(cmdline,
-                    cmdline_cook(__va(bd->kernel->cmdline_pa),bi->loader),
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
-    XFREE(cmdline);
-
-    return d;
-}
-
 /* How much of the directmap is prebuilt at compile time. */
 #define PREBUILT_MAP_LIMIT (1 << L2_PAGETABLE_SHIFT)
 
@@ -2180,7 +2015,7 @@ void asmlinkage __init noreturn __start_xen(void)
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
-    dom0 = create_dom0(bi);
+    dom0 = arch_create_dom(bi, &bi->domains[0]);
     if ( !dom0 )
         panic("Could not set up DOM0 guest OS\n");
 
-- 
2.30.2


