Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE7B9CDFAD
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 14:13:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837583.1253528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBw8c-0001H3-C2; Fri, 15 Nov 2024 13:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837583.1253528; Fri, 15 Nov 2024 13:13:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBw8c-0001EE-8g; Fri, 15 Nov 2024 13:13:26 +0000
Received: by outflank-mailman (input) for mailman id 837583;
 Fri, 15 Nov 2024 13:13:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=54cC=SK=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tBw8b-00085h-1I
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 13:13:25 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6294ff26-a353-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 14:13:21 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1731676339398284.4595211557644;
 Fri, 15 Nov 2024 05:12:19 -0800 (PST)
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
X-Inumbo-ID: 6294ff26-a353-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg0LjU3IiwiaGVsbyI6InNlbmRlcjMtb2YtbzU3LnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjYyOTRmZjI2LWEzNTMtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjc2NDAyLjE3MzY2Nywic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1731676341; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ekj/4JnJS7AE9hySFZNQ5YbKSfJfC82Xap7g8WbBG7qxZ/HUINjh/CGf/DzCqZiGieK+RynOvrzGQS/9iM2+LlijRgKToesmWC8xB9ImiVqnmT1yuI2O5UvDLlgERzTsy5dE79IDuGYn4pCuNodJD3X7izkFMaqpobq7Qz/8IWc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731676341; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bSzO7sAd2L8LHq1LVIVbhwl38gEAx7Fm3b8FDdjS27I=; 
	b=AK/Lup5O62ylDiTjBIcBz0qiCw0NbbKKtQ5y16eW1Fc92a56qsoNYEPSuR70D2yUEGrwP1pjgR3gXjP+W4Lnb2fThoDeBRRALKiTZScmX97M1yR174ZqNpCYu2wwkJANwvAtIBSyLgKhuRUfAUonQxjap8FvE8cl32IgFo465CQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731676341;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=bSzO7sAd2L8LHq1LVIVbhwl38gEAx7Fm3b8FDdjS27I=;
	b=BVLxK7ijGhycuQynLiPH19qi/ivtF5NP7fPEFq7Spg5CShs0Ss5xe0dFFSI1IIwA
	pfI2NXMScZxNKuBiWiPfdR70Aw9S7RXuRfcYOQpbpXPGeKCQFU5uRicWIqgIEvOJcpd
	E6mTZkYHPagBazMfVRwQBLs116yOhVnW3Pg9DfMU=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v9 6/6] x86/boot: add cmdline to struct boot_domain
Date: Fri, 15 Nov 2024 08:12:04 -0500
Message-Id: <20241115131204.32135-7-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241115131204.32135-1-dpsmith@apertussolutions.com>
References: <20241115131204.32135-1-dpsmith@apertussolutions.com>
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
Changes since v8:
- switch to a dynamically allocated buffer
- dropped local cmdline var in pv dom0_construct()

Changes since v7:
- updated commit message to expand on intent and purpose
---
 xen/arch/x86/include/asm/bootdomain.h |  2 ++
 xen/arch/x86/include/asm/dom0_build.h |  1 +
 xen/arch/x86/pv/dom0_build.c          |  6 ++--
 xen/arch/x86/setup.c                  | 49 ++++++++++++++++++++++-----
 4 files changed, 45 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
index 3873f916f854..75e7c706d86e 100644
--- a/xen/arch/x86/include/asm/bootdomain.h
+++ b/xen/arch/x86/include/asm/bootdomain.h
@@ -12,6 +12,8 @@ struct boot_module;
 struct domain;
 
 struct boot_domain {
+    const char *cmdline;
+
     domid_t domid;
 
     struct boot_module *kernel;
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index 8c94e87dc576..6ca3ca7c8a43 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -4,6 +4,7 @@
 #include <xen/libelf.h>
 #include <xen/sched.h>
 
+#include <asm/bootinfo.h>
 #include <asm/setup.h>
 
 extern unsigned int dom0_memflags;
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index f42aeb031694..91bcce1542bc 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -379,7 +379,6 @@ static int __init dom0_construct(struct boot_domain *bd)
     unsigned long image_len;
     void *image_start;
     unsigned long initrd_len = initrd ? initrd->size : 0;
-    const char *cmdline;
     l4_pgentry_t *l4tab = NULL, *l4start = NULL;
     l3_pgentry_t *l3tab = NULL, *l3start = NULL;
     l2_pgentry_t *l2tab = NULL, *l2start = NULL;
@@ -422,7 +421,6 @@ static int __init dom0_construct(struct boot_domain *bd)
     image_base = bootstrap_map_bm(image);
     image_len = image->size;
     image_start = image_base + image->headroom;
-    cmdline = __va(image->cmdline_pa);
 
     d->max_pages = ~0U;
 
@@ -972,8 +970,8 @@ static int __init dom0_construct(struct boot_domain *bd)
     }
 
     memset(si->cmd_line, 0, sizeof(si->cmd_line));
-    if ( cmdline != NULL )
-        strlcpy((char *)si->cmd_line, cmdline, sizeof(si->cmd_line));
+    if ( bd->cmdline )
+        strlcpy((char *)si->cmd_line, bd->cmdline, sizeof(si->cmd_line));
 
 #ifdef CONFIG_VIDEO
     if ( !pv_shim && fill_console_start_info((void *)(si + 1)) )
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 533a1e2bbe05..b9ca9c486fe5 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -963,10 +963,31 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
     return n;
 }
 
-static struct domain *__init create_dom0(struct boot_info *bi)
+static size_t __init domain_cmdline_size(
+    struct boot_info *bi, struct boot_domain *bd)
 {
-    static char __initdata cmdline[MAX_GUEST_CMDLINE];
+    size_t s = 0;
+
+    s += bi->kextra ? strlen(bi->kextra) : 0;
+    s += bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa)) : 0;
 
+    /* Should only be called if one of extra or cmdline_pa are valid */
+    ASSERT(s > 0);
+
+    /*
+     * Add additional space for the following cases:
+     *  - 7 chars for " noapic"
+     *  - 13 chars for longest acpi opiton, " acpi=verbose"
+     *  - 1 char to hold \0
+     */
+    s += 7 + 13 + 1;
+
+    return s;
+}
+
+static struct domain *__init create_dom0(struct boot_info *bi)
+{
+    char *cmdline = NULL;
     struct xen_domctl_createdomain dom0_cfg = {
         .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
         .max_evtchn_port = -1,
@@ -1008,17 +1029,23 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     /* Grab the DOM0 command line. */
     if ( bd->kernel->cmdline_pa || bi->kextra )
     {
+        size_t cmdline_size = domain_cmdline_size(bi, bd);
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
@@ -1028,17 +1055,21 @@ static struct domain *__init create_dom0(struct boot_info *bi)
 
         if ( (strlen(acpi_param) != 0) && !strstr(cmdline, "acpi=") )
         {
-            safe_strcat(cmdline, " acpi=");
-            safe_strcat(cmdline, acpi_param);
+            strlcat(cmdline, " acpi=", cmdline_size);
+            strlcat(cmdline, acpi_param, cmdline_size);
         }
 
-        bd->kernel->cmdline_pa = __pa(cmdline);
+        bd->cmdline = cmdline;
+        bd->kernel->cmdline_pa = __pa(bd->cmdline);
     }
 
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


