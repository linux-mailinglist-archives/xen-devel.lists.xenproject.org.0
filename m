Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B7D966B7C
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:48:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786653.1196277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9TW-00059A-41; Fri, 30 Aug 2024 21:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786653.1196277; Fri, 30 Aug 2024 21:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9TW-00056i-0L; Fri, 30 Aug 2024 21:48:10 +0000
Received: by outflank-mailman (input) for mailman id 786653;
 Fri, 30 Aug 2024 21:48:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9TU-0004BO-Qk
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:48:08 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89e4a070-6719-11ef-99a1-01e77a169b0f;
 Fri, 30 Aug 2024 23:48:07 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054463025557.548854351013;
 Fri, 30 Aug 2024 14:47:43 -0700 (PDT)
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
X-Inumbo-ID: 89e4a070-6719-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1725054465; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kZfzSBiAOcWM1nNWw8G6aWDYpPkIo63VSHznsMdZ2tqCKj39rJ5gHMuBO18irh/KNd7mnxlzwXRgiMzhsOOTs/FPMtu497XfFgODVZAmSVjeCYoNseK5XEWWbfM0FinWWFw+vvzBmdhXaNeUAvjiF+CePNUbqszKR0tCF4sblEY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054465; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Qexd3Ieo0x5aB7CkcPEqhzSRdIxc4KHzWNUKGdjfDMk=; 
	b=L8nQ3JmrkA4ybkEhwkoZFrMqtzpmqd8nXSww2zkjd2cp3Wi9cCR8ny91f6MqwV1v/7+lkj+2DUCgLXYEjVmBsh9RkbHQIY0WZ/yiK1apwAiDkTyuNvQrVaVB9VUH1fnPS6ltTzCQhWfdSWXA/egn1z7/HY2P95RKHv6Vvyp3Uk4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054465;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Qexd3Ieo0x5aB7CkcPEqhzSRdIxc4KHzWNUKGdjfDMk=;
	b=kKDzBb+ZDpO2+u840lmHk+yzp84/29Qyboj/exo/kudo2h9Ieg65aP9GRtqhDxzJ
	07MU7U9q62rJim9GQL4XzZ91lUKyL8HpU799r2HDgAa8e18oHwI3EjZTddjgDofF6IO
	TrmJmuTTm6OuTZkg0VhLOg1bE2qVgI7i+I7Pgi+A=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 03/44] x86/boot: move cmdline to boot info
Date: Fri, 30 Aug 2024 17:46:48 -0400
Message-Id: <20240830214730.1621-4-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Transition Xen's command line to being held in struct boot_info.

No functional change intended.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootinfo.h |  1 +
 xen/arch/x86/setup.c                | 21 +++++++++++++--------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index e69feb1bb8be..d2ca077d2356 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -12,6 +12,7 @@ struct boot_info {
     unsigned int nr_mods;
 
     const char *boot_loader_name;
+    const char *cmdline;
 };
 
 #endif
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 432b7d1701e4..a945fa10555f 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -276,6 +276,8 @@ static int __init cf_check parse_acpi_param(const char *s)
 }
 custom_param("acpi", parse_acpi_param);
 
+static const char *cmdline_cook(const char *p, const char *loader_name);
+
 static const module_t *__initdata initial_images;
 static struct boot_info __initdata *boot_info;
 
@@ -288,6 +290,13 @@ static void __init multiboot_to_bootinfo(multiboot_info_t *mbi)
     info.boot_loader_name = (mbi->flags & MBI_LOADERNAME) ?
                             __va(mbi->boot_loader_name) : "unknown";
 
+    /* Parse the command-line options. */
+    if ( mbi->flags & MBI_CMDLINE )
+        info.cmdline = cmdline_cook(__va(mbi->cmdline),
+                                    info.boot_loader_name);
+    else
+        info.cmdline = "";
+
     boot_info = &info;
 }
 
@@ -996,7 +1005,7 @@ static struct domain *__init create_dom0(const module_t *image,
 
 void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 {
-    const char *memmap_type = NULL, *cmdline = "";
+    const char *memmap_type = NULL;
     char *kextra;
     void *bsp_stack;
     struct cpu_info *info = get_cpu_info(), *bsp_info;
@@ -1049,11 +1058,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     multiboot_to_bootinfo(mbi);
 
-    /* Parse the command-line options. */
-    if ( mbi->flags & MBI_CMDLINE )
-        cmdline = cmdline_cook(__va(mbi->cmdline), boot_info->boot_loader_name);
-
-    if ( (kextra = strstr(cmdline, " -- ")) != NULL )
+    if ( (kextra = strstr(boot_info->cmdline, " -- ")) != NULL )
     {
         /*
          * Options after ' -- ' separator belong to dom0.
@@ -1064,7 +1069,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         kextra += 3;
         while ( kextra[1] == ' ' ) kextra++;
     }
-    cmdline_parse(cmdline);
+    cmdline_parse(boot_info->cmdline);
 
     /* Must be after command line argument parsing and before
      * allocing any xenheap structures wanted in lower memory. */
@@ -1094,7 +1099,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     printk("Bootloader: %s\n", boot_info->boot_loader_name);
 
-    printk("Command line: %s\n", cmdline);
+    printk("Command line: %s\n", boot_info->cmdline);
 
     printk("Xen image load base address: %#lx\n", xen_phys_start);
     if ( hypervisor_name )
-- 
2.30.2


