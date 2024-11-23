Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A2C9D6AC4
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2024 19:22:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842130.1257566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEulP-0006zI-5y; Sat, 23 Nov 2024 18:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842130.1257566; Sat, 23 Nov 2024 18:21:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEulP-0006xl-22; Sat, 23 Nov 2024 18:21:47 +0000
Received: by outflank-mailman (input) for mailman id 842130;
 Sat, 23 Nov 2024 18:21:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=waGT=SS=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tEulN-0006MT-Oc
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2024 18:21:45 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c946c568-a9c7-11ef-a0cc-8be0dac302b0;
 Sat, 23 Nov 2024 19:21:42 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1732386056772694.2528303649441;
 Sat, 23 Nov 2024 10:20:56 -0800 (PST)
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
X-Inumbo-ID: c946c568-a9c7-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImM5NDZjNTY4LWE5YzctMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMzg2MTAyLjk1MjAxMywic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1732386061; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nI9yP9H+KknU1cIqdsrbidXbV1o40VvzQL3RE4LJI+Fr5xGAhl7MZWvJvgPIYKxSNfJipf9pA4qKnV0ux7TlWHJmMH4O7HN6pT3rJg2TAocrbNlhWUjGJMmda07mLANZOs0d4Ioe+xX2dlmTCh85cIk+8M4YuezMk/exDcwrT2U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732386061; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=I+F0axhJZN1WzppDStYP9VFrjwWkiiTOqoo1NlWCXfk=; 
	b=YiqmIjUKSJaCs2BEEjAkEfs99nKq0ZpZlq+pvoIFthNAWQ7EsPx6axFdGDc6Ltd9DGIHSNsZ6VEcAA3u4g4RjslLYG90ZhIYRZqEGCCyTawF55siXX+f+vggXRWNKp/E/e5xHGxmNTf2X9+owvq0jq4uUP/RYGH0MBZkmirTvJc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732386061;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=I+F0axhJZN1WzppDStYP9VFrjwWkiiTOqoo1NlWCXfk=;
	b=d6V8YTvs5eP4xhtYlkBLMJpwEM0w4OCwmAha/7+q2Y0nMvaSXAa54KvO+fhbeaWg
	QhB7WMkB6QV1/iLi3288NIdoBGXApKIOC6sfChEP4zoxYrqe9opynyY6O8ePBuGpbCv
	i6MPKMiFaSuN6Qc1g7vK/ghCOWKZpbETZqqf7EIo=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 03/15] x86/boot: add cmdline to struct boot_domain
Date: Sat, 23 Nov 2024 13:20:32 -0500
Message-Id: <20241123182044.30687-4-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241123182044.30687-1-dpsmith@apertussolutions.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
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
 xen/arch/x86/hvm/dom0_build.c         | 12 +++---
 xen/arch/x86/include/asm/bootdomain.h |  2 +
 xen/arch/x86/pv/dom0_build.c          |  4 +-
 xen/arch/x86/setup.c                  | 54 ++++++++++++++++++++++-----
 4 files changed, 54 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index a9384af14304..cbc365d678d2 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -644,9 +644,11 @@ static bool __init check_and_adjust_load_address(
 }
 
 static int __init pvh_load_kernel(
-    struct domain *d, struct boot_module *image, struct boot_module *initrd,
-    paddr_t *entry, paddr_t *start_info_addr)
+    struct boot_domain *bd, paddr_t *entry, paddr_t *start_info_addr)
 {
+    struct domain *d = bd->d;
+    struct boot_module *image = bd->kernel;
+    struct boot_module *initrd = bd->ramdisk;
     void *image_base = bootstrap_map_bm(image);
     void *image_start = image_base + image->headroom;
     unsigned long image_len = image->size;
@@ -1304,14 +1306,12 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
 int __init dom0_construct_pvh(struct boot_domain *bd)
 {
     paddr_t entry, start_info;
-    struct boot_module *image = bd->kernel;
-    struct boot_module *initrd = bd->ramdisk;
     struct domain *d = bd->d;
     int rc;
 
     printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
 
-    if ( image == NULL )
+    if ( bd->kernel == NULL )
         panic("Missing kernel boot module for %pd construction\n", d);
 
     if ( is_hardware_domain(d) )
@@ -1351,7 +1351,7 @@ int __init dom0_construct_pvh(struct boot_domain *bd)
         return rc;
     }
 
-    rc = pvh_load_kernel(d, image, initrd, &entry, &start_info);
+    rc = pvh_load_kernel(bd, &entry, &start_info);
     if ( rc )
     {
         printk("Failed to load Dom0 kernel\n");
diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
index bcbf36b13f25..ffda1509a63f 100644
--- a/xen/arch/x86/include/asm/bootdomain.h
+++ b/xen/arch/x86/include/asm/bootdomain.h
@@ -14,6 +14,8 @@ struct boot_module;
 struct domain;
 
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
index a2178d5e8cc5..e6580382d247 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -965,10 +965,29 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
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
+
+    return s;
+}
 
+static struct domain *__init create_dom0(struct boot_info *bi)
+{
+    char *cmdline = NULL;
     struct xen_domctl_createdomain dom0_cfg = {
         .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
         .max_evtchn_port = -1,
@@ -1008,19 +1027,30 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         panic("Error creating d%uv0\n", bd->domid);
 
     /* Grab the DOM0 command line. */
-    if ( bd->kernel->cmdline_pa || bi->kextra )
+    if ( (bd->kernel->cmdline_pa &&
+          ((char *)__va(bd->kernel->cmdline_pa))[0]) ||
+         bi->kextra )
     {
+        size_t cmdline_size = domain_cmdline_size(bi, bd);
+
+        if ( cmdline_size == 0 )
+            goto skip_cmdline;
+
+        if ( !(cmdline = xzalloc_array(char, cmdline_size)) )
+            panic("Error allocating cmdline buffer for %pd\n", d);
+
         if ( bd->kernel->cmdline_pa )
-            safe_strcpy(cmdline,
-                        cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loader));
+            strlcpy(cmdline,
+                    cmdline_cook(__va(bd->kernel->cmdline_pa),bi->loader),
+                    cmdline_size);
 
         if ( bi->kextra )
             /* kextra always includes exactly one leading space. */
-            safe_strcat(cmdline, bi->kextra);
+            strlcat(cmdline, bi->kextra, cmdline_size);
 
         /* Append any extra parameters. */
         if ( skip_ioapic_setup && !strstr(cmdline, "noapic") )
-            safe_strcat(cmdline, " noapic");
+            strlcat(cmdline, " noapic", cmdline_size);
 
         if ( (strlen(acpi_param) == 0) && acpi_disabled )
         {
@@ -1030,17 +1060,21 @@ static struct domain *__init create_dom0(struct boot_info *bi)
 
         if ( (strlen(acpi_param) != 0) && !strstr(cmdline, "acpi=") )
         {
-            safe_strcat(cmdline, " acpi=");
-            safe_strcat(cmdline, acpi_param);
+            strlcat(cmdline, " acpi=", cmdline_size);
+            strlcat(cmdline, acpi_param, cmdline_size);
         }
 
-        bd->kernel->cmdline_pa = __pa(cmdline);
+        bd->cmdline = cmdline;
     }
 
+ skip_cmdline:
     bd->d = d;
     if ( construct_dom0(bd) != 0 )
         panic("Could not construct domain 0\n");
 
+    if ( cmdline )
+        xfree(cmdline);
+
     return d;
 }
 
-- 
2.30.2


