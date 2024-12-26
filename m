Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B13C9FCC08
	for <lists+xen-devel@lfdr.de>; Thu, 26 Dec 2024 17:58:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863245.1274679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrBl-0003CS-CG; Thu, 26 Dec 2024 16:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863245.1274679; Thu, 26 Dec 2024 16:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrBl-00039K-9U; Thu, 26 Dec 2024 16:58:21 +0000
Received: by outflank-mailman (input) for mailman id 863245;
 Thu, 26 Dec 2024 16:58:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vkhu=TT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tQrBj-00026T-AB
 for xen-devel@lists.xenproject.org; Thu, 26 Dec 2024 16:58:19 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a53d519-c3aa-11ef-a0da-8be0dac302b0;
 Thu, 26 Dec 2024 17:58:18 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1735232273654381.53674337156747;
 Thu, 26 Dec 2024 08:57:53 -0800 (PST)
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
X-Inumbo-ID: 9a53d519-c3aa-11ef-a0da-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1735232276; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UqsHOLVe0cuGQXX8CRglyebO2vkr0qM81gyNDvroZvGJAhAbpnl9HB2xtS1Gr3Tw2DOwRzFA2MGIUa3H9/nUutGmUQQ1Nu9FTffwlowtu8iqFTQrwhgiJq+A/RGmbt9mungBVp3gM8yCzPtemZjJNaEjcfGf4gujxRjQ9nVO3Wo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735232276; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fG1DwHOuY1y8Qw7V1e8eHce6xg4PlNOOzNk4YL76snY=; 
	b=cq6IaJCpcBseYLliQ/itw048FRybGhXj8IoV/Z7Jz0AZR9O9BaORPKRtob4pkIqEAoWnJ+28a4t8U/gkW5Nqm/M4FdKh/RPRFy+dAmWoub4e4hhEclRjHTRbSBBlP1jrjGGxfY7lGB4SuTQcRjlEBVDqMpGgN07MJXa3ZOR4/1M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735232276;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=fG1DwHOuY1y8Qw7V1e8eHce6xg4PlNOOzNk4YL76snY=;
	b=bZi0Q7nPT4qm7Ep7EOvW44uuj9xjEN8bb/YxnbLSzSVMcbUedatZcvWh7ZYp2GL2
	uvKzw94t4Rd4LLQzFngAanRxOmVAcLJrT9rdWbULsldZHFXROBUFaoWk/eCkTS/xKnR
	gA+ty1z302carQqk8muwzpng78NnfWgFj3YqrxRA=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 03/15] x86/boot: add cmdline to struct boot_domain
Date: Thu, 26 Dec 2024 11:57:28 -0500
Message-Id: <20241226165740.29812-4-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241226165740.29812-1-dpsmith@apertussolutions.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add a container for the "cooked" command line for a domain. This provides for
the backing memory to be directly associated with the domain being constructed.
This is done in anticipation that the domain construction path may need to be
invoked multiple times, thus ensuring each instance had a distinct memory
allocation.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since dom0 device tree v1:
- switched over to bd->cmdline in pvh_load_kernel
- moved cmdline processing under if, eliminating goto
- zero-ed cmdline_pa for kernel module after cmdline processing

Changes since v9 boot modules:
- convert pvh_load_kernel to boot domain to directly use cmdline
- adjustments to domain_cmdline_size
  - remove ASSERT and return 0 instead
  - use strlen() of values instead of hardcoded sizes
- update cmdline parsing check to inspect multiboot string and not just pointer
- add goto to skip cmdline processing if domain_cmdline_size returns 0
- drop updating cmdline_pa with dynamic buffer with change of its last consumer
  pvh_load_kernel

Changes since v8:
- switch to a dynamically allocated buffer
- dropped local cmdline var in pv dom0_construct()

Changes since v7:
- updated commit message to expand on intent and purpose
---
 xen/arch/x86/hvm/dom0_build.c         | 14 ++---
 xen/arch/x86/include/asm/bootdomain.h |  2 +
 xen/arch/x86/pv/dom0_build.c          |  4 +-
 xen/arch/x86/setup.c                  | 78 +++++++++++++++++++--------
 4 files changed, 66 insertions(+), 32 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index cbc365d678d2..47bc3e9ce858 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -653,7 +653,6 @@ static int __init pvh_load_kernel(
     void *image_start = image_base + image->headroom;
     unsigned long image_len = image->size;
     unsigned long initrd_len = initrd ? initrd->size : 0;
-    const char *cmdline = image->cmdline_pa ? __va(image->cmdline_pa) : NULL;
     struct elf_binary elf;
     struct elf_dom_parms parms;
     paddr_t last_addr;
@@ -717,9 +716,9 @@ static int __init pvh_load_kernel(
                             (initrd ? ROUNDUP(initrd_len, PAGE_SIZE) +
                                       sizeof(mod)
                                     : 0) +
-                            (cmdline ? ROUNDUP(strlen(cmdline) + 1,
-                                               elf_64bit(&elf) ? 8 : 4)
-                                     : 0));
+                            (bd->cmdline ? ROUNDUP(strlen(bd->cmdline) + 1,
+                                                   elf_64bit(&elf) ? 8 : 4)
+                                         : 0));
     if ( last_addr == INVALID_PADDR )
     {
         printk("Unable to find a memory region to load initrd and metadata\n");
@@ -759,9 +758,10 @@ static int __init pvh_load_kernel(
     /* Free temporary buffers. */
     free_boot_modules();
 
-    if ( cmdline != NULL )
+    if ( bd->cmdline != NULL )
     {
-        rc = hvm_copy_to_guest_phys(last_addr, cmdline, strlen(cmdline) + 1, v);
+        rc = hvm_copy_to_guest_phys(
+                last_addr, bd->cmdline, strlen(bd->cmdline) + 1, v);
         if ( rc )
         {
             printk("Unable to copy guest command line\n");
@@ -772,7 +772,7 @@ static int __init pvh_load_kernel(
          * Round up to 32/64 bits (depending on the guest kernel bitness) so
          * the modlist/start_info is aligned.
          */
-        last_addr += ROUNDUP(strlen(cmdline) + 1, elf_64bit(&elf) ? 8 : 4);
+        last_addr += ROUNDUP(strlen(bd->cmdline) + 1, elf_64bit(&elf) ? 8 : 4);
     }
     if ( initrd != NULL )
     {
diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
index 67be575fe781..101a0c643d74 100644
--- a/xen/arch/x86/include/asm/bootdomain.h
+++ b/xen/arch/x86/include/asm/bootdomain.h
@@ -11,6 +11,8 @@
 #define __XEN_X86_BOOTDOMAIN_H__
 
 struct boot_domain {
+    const char *cmdline;
+
     domid_t domid;
 
     struct boot_module *kernel;
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index e0709a1c1a7a..580f2703a154 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -972,8 +972,8 @@ static int __init dom0_construct(struct boot_domain *bd)
     }
 
     memset(si->cmd_line, 0, sizeof(si->cmd_line));
-    if ( image->cmdline_pa )
-        strlcpy((char *)si->cmd_line, __va(image->cmdline_pa), sizeof(si->cmd_line));
+    if ( bd->cmdline )
+        strlcpy((char *)si->cmd_line, bd->cmdline, sizeof(si->cmd_line));
 
 #ifdef CONFIG_VIDEO
     if ( !pv_shim && fill_console_start_info((void *)(si + 1)) )
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 27937a7f7aeb..a61131365477 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -975,10 +975,29 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
     return n;
 }
 
-static struct domain *__init create_dom0(struct boot_info *bi)
+static size_t __init domain_cmdline_size(
+    struct boot_info *bi, struct boot_domain *bd)
 {
-    static char __initdata cmdline[MAX_GUEST_CMDLINE];
+    size_t s = bi->kextra ? strlen(bi->kextra) : 0;
+
+    s += bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa)) : 0;
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
 
+    return s;
+}
+
+static struct domain *__init create_dom0(struct boot_info *bi)
+{
+    char *cmdline = NULL;
     struct xen_domctl_createdomain dom0_cfg = {
         .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
         .max_evtchn_port = -1,
@@ -1018,39 +1037,52 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         panic("Error creating d%uv0\n", bd->domid);
 
     /* Grab the DOM0 command line. */
-    if ( bd->kernel->cmdline_pa || bi->kextra )
+    if ( (bd->kernel->cmdline_pa &&
+          ((char *)__va(bd->kernel->cmdline_pa))[0]) ||
+         bi->kextra )
     {
-        if ( bd->kernel->cmdline_pa )
-            safe_strcpy(cmdline,
-                        cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loader));
+        size_t cmdline_size = domain_cmdline_size(bi, bd);
+
+        if ( cmdline_size )
+        {
+            if ( !(cmdline = xzalloc_array(char, cmdline_size)) )
+                panic("Error allocating cmdline buffer for %pd\n", d);
 
-        if ( bi->kextra )
-            /* kextra always includes exactly one leading space. */
-            safe_strcat(cmdline, bi->kextra);
+            if ( bd->kernel->cmdline_pa )
+                strlcpy(cmdline,
+                        cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loader),
+                        cmdline_size);
 
-        /* Append any extra parameters. */
-        if ( skip_ioapic_setup && !strstr(cmdline, "noapic") )
-            safe_strcat(cmdline, " noapic");
+            if ( bi->kextra )
+                /* kextra always includes exactly one leading space. */
+                strlcat(cmdline, bi->kextra, cmdline_size);
 
-        if ( (strlen(acpi_param) == 0) && acpi_disabled )
-        {
-            printk("ACPI is disabled, notifying Domain 0 (acpi=off)\n");
-            safe_strcpy(acpi_param, "off");
-        }
+            /* Append any extra parameters. */
+            if ( skip_ioapic_setup && !strstr(cmdline, "noapic") )
+                strlcat(cmdline, " noapic", cmdline_size);
 
-        if ( (strlen(acpi_param) != 0) && !strstr(cmdline, "acpi=") )
-        {
-            safe_strcat(cmdline, " acpi=");
-            safe_strcat(cmdline, acpi_param);
-        }
+            if ( (strlen(acpi_param) == 0) && acpi_disabled )
+            {
+                printk("ACPI is disabled, notifying Domain 0 (acpi=off)\n");
+                safe_strcpy(acpi_param, "off");
+            }
 
-        bd->kernel->cmdline_pa = __pa(cmdline);
+            if ( (strlen(acpi_param) != 0) && !strstr(cmdline, "acpi=") )
+            {
+                strlcat(cmdline, " acpi=", cmdline_size);
+                strlcat(cmdline, acpi_param, cmdline_size);
+            }
+            bd->kernel->cmdline_pa = 0;
+            bd->cmdline = cmdline;
+        }
     }
 
     bd->d = d;
     if ( construct_dom0(bd) != 0 )
         panic("Could not construct domain 0\n");
 
+    xfree(cmdline);
+
     return d;
 }
 
-- 
2.30.2


