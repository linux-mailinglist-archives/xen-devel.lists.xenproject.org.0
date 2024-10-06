Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A6B9921C9
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:51:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811320.1223900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZ9C-00066B-QQ; Sun, 06 Oct 2024 21:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811320.1223900; Sun, 06 Oct 2024 21:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZ9C-00063l-Mp; Sun, 06 Oct 2024 21:50:38 +0000
Received: by outflank-mailman (input) for mailman id 811320;
 Sun, 06 Oct 2024 21:50:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZ9B-00051E-8F
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:50:37 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0382eaac-842d-11ef-99a2-01e77a169b0f;
 Sun, 06 Oct 2024 23:50:35 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251407684824.8538448252724;
 Sun, 6 Oct 2024 14:50:07 -0700 (PDT)
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
X-Inumbo-ID: 0382eaac-842d-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728251409; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bOooYAtv2R0jfUAshkSHKN1r2PAwmPs8odeWp3OFUyDh98JANeF6ugToKDwEE/QnhUpB4FC0CdqQaP4khQWGpPgz01fda3w/2dZjr63veCoelVsyTB6N1AxgnrHYrW3Jo15LwR/aIwKNZW5nSGzeXdf2j84uRY3K7coX2RlmLqQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251409; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+uni2D8IzNXNtxODgaLcie6Ece0kX1I6Od5Z1lNdP44=; 
	b=S+dOKMAUdFcxC2R6e1yGaWjCp3neuHSv008sJGOrbmyCnW7v5Ba6HaIckmNXETuSi2aQzckNmL2vMXkA/XtP4V8cTJFOayBBfhmetKWCtEqg86fTT+Ykc88Z/BtPsKsCZIA/jeeOyU2JErbBLfTTjK4RbbDFusEcZtbyQy+8DfE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251409;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=+uni2D8IzNXNtxODgaLcie6Ece0kX1I6Od5Z1lNdP44=;
	b=DJomWE9EHMgMJMnzE9RJE79vg3sH1zN2t6bw5z4mHPYXC+luiDPwvTV3RTkSQmWO
	wQdP8EPTAtAb+TFl82XCyEVr0MnZ7hFt8DF73tokzlzA6hx5bFGJInERtMMdE7EIJoU
	oVJlz2x91kxRx8F8NvnlzhiKsuQDkHJSQz3dHbLc=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 03/44] x86/boot: move cmdline to boot info
Date: Sun,  6 Oct 2024 17:49:14 -0400
Message-Id: <20241006214956.24339-4-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Transition Xen's command line to being held in struct boot_info.

No functional change intended.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 xen/arch/x86/include/asm/bootinfo.h |  1 +
 xen/arch/x86/setup.c                | 20 ++++++++++++--------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 98ba773c9bc5..327038465a44 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -16,6 +16,7 @@ struct boot_info {
     unsigned int nr_modules;
 
     const char *loader;
+    const char *cmdline;
 };
 
 #endif /* __XEN_X86_BOOTINFO_H__ */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index aafc098ca268..0921f296075f 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -274,6 +274,8 @@ static int __init cf_check parse_acpi_param(const char *s)
 }
 custom_param("acpi", parse_acpi_param);
 
+static const char *cmdline_cook(const char *p, const char *loader_name);
+
 static const module_t *__initdata initial_images;
 
 struct boot_info __initdata xen_boot_info;
@@ -288,6 +290,12 @@ static struct boot_info __init *multiboot_fill_boot_info(unsigned long mbi_p)
     bi->loader = (mbi->flags & MBI_LOADERNAME) ?
                             __va(mbi->boot_loader_name) : "unknown";
 
+    /* Parse the command-line options. */
+    if ( mbi->flags & MBI_CMDLINE )
+        bi->cmdline = cmdline_cook(__va(mbi->cmdline), bi->loader);
+    else
+        bi->cmdline = "";
+
     return bi;
 }
 
@@ -981,7 +989,7 @@ static struct domain *__init create_dom0(const module_t *image,
 
 void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 {
-    const char *memmap_type = NULL, *cmdline = "";
+    const char *memmap_type = NULL;
     char *kextra;
     void *bsp_stack;
     struct cpu_info *info = get_cpu_info(), *bsp_info;
@@ -1035,11 +1043,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     bi = multiboot_fill_boot_info(mbi_p);
 
-    /* Parse the command-line options. */
-    if ( mbi->flags & MBI_CMDLINE )
-        cmdline = cmdline_cook(__va(mbi->cmdline), bi->loader);
-
-    if ( (kextra = strstr(cmdline, " -- ")) != NULL )
+    if ( (kextra = strstr(bi->cmdline, " -- ")) != NULL )
     {
         /*
          * Options after ' -- ' separator belong to dom0.
@@ -1050,7 +1054,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         kextra += 3;
         while ( kextra[1] == ' ' ) kextra++;
     }
-    cmdline_parse(cmdline);
+    cmdline_parse(bi->cmdline);
 
     /* Must be after command line argument parsing and before
      * allocing any xenheap structures wanted in lower memory. */
@@ -1080,7 +1084,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     printk("Bootloader: %s\n", bi->loader);
 
-    printk("Command line: %s\n", cmdline);
+    printk("Command line: %s\n", bi->cmdline);
 
     printk("Xen image load base address: %#lx\n", xen_phys_start);
     if ( hypervisor_name )
-- 
2.30.2


