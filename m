Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A78BD5693E0
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 23:08:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362543.592622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CFq-0006mr-PV; Wed, 06 Jul 2022 21:08:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362543.592622; Wed, 06 Jul 2022 21:08:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CFq-0006kM-LX; Wed, 06 Jul 2022 21:08:14 +0000
Received: by outflank-mailman (input) for mailman id 362543;
 Wed, 06 Jul 2022 21:08:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJEZ=XL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1o9CEG-0003HV-HK
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 21:06:36 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8429ed03-fd6f-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 23:06:35 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1657141510464427.8856190700619;
 Wed, 6 Jul 2022 14:05:10 -0700 (PDT)
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
X-Inumbo-ID: 8429ed03-fd6f-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; t=1657141512; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Sj9GD3wXJe1li2qmx6rCzq1a5bPyg/IU4xYez+aVKX/fxmGBiqp1rKPXeyTsThr6aET3CADBk7qdBmJvg8yeJPITrq6RLI8RPsgUZtKTelNBNsmokrLWHNv2PnB5dCGAoY1t1QI6YeqkXndAtzbp16tMdjeN8KV1sJ+enU6D0P8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1657141512; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=AEMYHg/g52JmQvYb/2PyAV5djmhaoa0EO/NLhuQyF24=; 
	b=Cel0AKW74PFnVWaGk0Nr9FEYBuxI7D17IguiYiq+eJM+i+/zjT7YopKyKdE9jtBJ4eQD10vKCzyGYZfA5kSHsgXCbeZrzBRjTzPUz0SD2TK4py9oGvxsakGYUf8QIXwbkeN3+qy34KfaEFrZ10gzm2/41/MfCxlXOPews7YOc4w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1657141512;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=AEMYHg/g52JmQvYb/2PyAV5djmhaoa0EO/NLhuQyF24=;
	b=RPSyGPOqI3Ul6wYg6fIT7iqgt/RRDASbnvyhK7y64L0peQF7aP7hEsbWP1WL4xBQ
	KREuegYf57Bqj038i0OWJ0jMyNwKwKNBcG/EcgaLClt4w7VZPMP5CgwKIU7HPcXveeZ
	iPTS1mrz1yYkUGrzTXmYYUcav7Qo0vD2K44nIadw=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	Wei Liu <wl@xen.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	christopher.clark@starlab.io,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 05/18] x86: refactor xen cmdline into general framework
Date: Wed,  6 Jul 2022 17:04:40 -0400
Message-Id: <20220706210454.30096-6-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220706210454.30096-1-dpsmith@apertussolutions.com>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This refactors xen cmdline processing into a general framework
under the new boot info abstraction.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
---
 xen/arch/x86/include/asm/bootinfo.h | 49 ++++++++++++++++++++++++
 xen/arch/x86/setup.c                | 58 ++++-------------------------
 xen/include/xen/bootinfo.h          | 11 ++++++
 3 files changed, 68 insertions(+), 50 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index e5135e402b..2fcd576023 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -45,4 +45,53 @@ struct __packed mb_memmap {
     uint32_t type;
 };
 
+static inline bool loader_is_grub2(const char *loader_name)
+{
+    /* GRUB1="GNU GRUB 0.xx"; GRUB2="GRUB 1.xx" */
+    const char *p = strstr(loader_name, "GRUB ");
+    return (p != NULL) && (p[5] != '0');
+}
+
+static inline char *arch_prepare_cmdline(char *p, struct arch_boot_info *arch)
+{
+    p = p ? : "";
+
+    /* Strip leading whitespace. */
+    while ( *p == ' ' )
+        p++;
+
+    /* GRUB2 and PVH don't not include image name as first item on command line. */
+    if ( !(arch->xenguest || loader_is_grub2(arch->boot_loader_name)) )
+    {
+        /* Strip image name plus whitespace. */
+        while ( (*p != ' ') && (*p != '\0') )
+            p++;
+        while ( *p == ' ' )
+            p++;
+    }
+
+    return p;
+}
+
+static inline char *arch_bootinfo_prepare_cmdline(
+    char *cmdline, struct arch_boot_info *arch)
+{
+    if ( !cmdline )
+        return "";
+
+    if ( (arch->kextra = strstr(cmdline, " -- ")) != NULL )
+    {
+        /*
+         * Options after ' -- ' separator belong to dom0.
+         *  1. Orphan dom0's options from Xen's command line.
+         *  2. Skip all but final leading space from dom0's options.
+         */
+        *arch->kextra = '\0';
+        arch->kextra += 3;
+        while ( arch->kextra[1] == ' ' ) arch->kextra++;
+    }
+
+
+    return arch_prepare_cmdline(cmdline, arch);
+}
 #endif
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index ad37f4a658..e4060d6219 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -716,34 +716,6 @@ ignore_param("edid");
  */
 ignore_param("placeholder");
 
-static bool __init loader_is_grub2(const char *loader_name)
-{
-    /* GRUB1="GNU GRUB 0.xx"; GRUB2="GRUB 1.xx" */
-    const char *p = strstr(loader_name, "GRUB ");
-    return (p != NULL) && (p[5] != '0');
-}
-
-static char * __init cmdline_cook(char *p, const char *loader_name)
-{
-    p = p ? : "";
-
-    /* Strip leading whitespace. */
-    while ( *p == ' ' )
-        p++;
-
-    /* GRUB2 and PVH don't not include image name as first item on command line. */
-    if ( xen_guest || loader_is_grub2(loader_name) )
-        return p;
-
-    /* Strip image name plus whitespace. */
-    while ( (*p != ' ') && (*p != '\0') )
-        p++;
-    while ( *p == ' ' )
-        p++;
-
-    return p;
-}
-
 static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int limit)
 {
     unsigned int n = min(bootsym(bios_e820nr), limit);
@@ -754,8 +726,7 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
     return n;
 }
 
-static struct domain *__init create_dom0(
-    const struct boot_info *bi, const char *kextra, const char *loader)
+static struct domain *__init create_dom0(const struct boot_info *bi)
 {
     struct xen_domctl_createdomain dom0_cfg = {
         .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
@@ -804,16 +775,16 @@ static struct domain *__init create_dom0(
     /* Grab the DOM0 command line. */
     cmdline = (image->string.kind == BOOTSTR_CMDLINE) ?
               image->string.bytes : NULL;
-    if ( cmdline || kextra )
+    if ( cmdline || bi->arch->kextra )
     {
         static char __initdata dom0_cmdline[MAX_GUEST_CMDLINE];
 
-        cmdline = cmdline_cook(cmdline, loader);
+        cmdline = arch_prepare_cmdline(cmdline, bi->arch);
         safe_strcpy(dom0_cmdline, cmdline);
 
-        if ( kextra )
+        if ( bi->arch->kextra )
             /* kextra always includes exactly one leading space. */
-            safe_strcat(dom0_cmdline, kextra);
+            safe_strcat(dom0_cmdline, bi->arch->kextra);
 
         /* Append any extra parameters. */
         if ( skip_ioapic_setup && !strstr(dom0_cmdline, "noapic") )
@@ -861,7 +832,7 @@ static struct domain *__init create_dom0(
 void __init noreturn __start_xen(unsigned long bi_p)
 {
     char *memmap_type = NULL;
-    char *cmdline, *kextra, *loader;
+    char *cmdline, *loader;
     void *bsp_stack;
     struct cpu_info *info = get_cpu_info(), *bsp_info;
     unsigned int initrdidx, num_parked = 0;
@@ -929,20 +900,7 @@ void __init noreturn __start_xen(unsigned long bi_p)
         ? boot_info->arch->boot_loader_name : "unknown";
 
     /* Parse the command-line options. */
-    cmdline = cmdline_cook((boot_info->arch->flags & BOOTINFO_FLAG_X86_CMDLINE) ?
-                            boot_info->cmdline : NULL,
-                           loader);
-    if ( (kextra = strstr(cmdline, " -- ")) != NULL )
-    {
-        /*
-         * Options after ' -- ' separator belong to dom0.
-         *  1. Orphan dom0's options from Xen's command line.
-         *  2. Skip all but final leading space from dom0's options.
-         */
-        *kextra = '\0';
-        kextra += 3;
-        while ( kextra[1] == ' ' ) kextra++;
-    }
+    cmdline = bootinfo_prepare_cmdline(boot_info);
     cmdline_parse(cmdline);
 
     /* Must be after command line argument parsing and before
@@ -1951,7 +1909,7 @@ void __init noreturn __start_xen(unsigned long bi_p)
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
-    dom0 = create_dom0(boot_info, kextra, loader);
+    dom0 = create_dom0(boot_info);
     if ( !dom0 )
         panic("Could not set up DOM0 guest OS\n");
 
diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
index dde8202f62..477294dc10 100644
--- a/xen/include/xen/bootinfo.h
+++ b/xen/include/xen/bootinfo.h
@@ -53,6 +53,17 @@ struct __packed boot_info {
 
 extern struct boot_info *boot_info;
 
+static inline char *bootinfo_prepare_cmdline(struct boot_info *bi)
+{
+    bi->cmdline = arch_bootinfo_prepare_cmdline(bi->cmdline, bi->arch);
+
+    if ( *bi->cmdline == ' ' )
+        printk(XENLOG_WARNING "%s: leading whitespace left on cmdline\n",
+               __func__);
+
+    return bi->cmdline;
+}
+
 static inline unsigned long bootmodule_next_idx_by_kind(
     const struct boot_info *bi, bootmodule_kind kind, unsigned long start)
 {
-- 
2.20.1


