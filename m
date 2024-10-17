Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FA99A2A46
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:08:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820894.1234602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Tyz-00073W-Rr; Thu, 17 Oct 2024 17:08:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820894.1234602; Thu, 17 Oct 2024 17:08:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Tyz-0006zY-P7; Thu, 17 Oct 2024 17:08:17 +0000
Received: by outflank-mailman (input) for mailman id 820894;
 Thu, 17 Oct 2024 17:08:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1Tuv-0006TN-3d
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:04:05 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cebfa7dd-8ca9-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:04:03 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184618449299.4483272125001;
 Thu, 17 Oct 2024 10:03:38 -0700 (PDT)
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
X-Inumbo-ID: cebfa7dd-8ca9-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729184621; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Jj69mog7FESSW+fvVP3+RCzMBMmqWmc3v0uPKmHRi8b263x7K6eX/88EhvivAybvDSZJa+Kwk8WgtHtneYbmvzcvenJNbaglQ/syLwxfUkCi3W2iddyWxMHn1+sEsDXlWJUSk0SoyD4hhDJzR/HlBk+1feG0SIXWvd/XQGZDPUE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184621; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Dr1jKzgUHAaiQbYekBVD6PQo4dQeZnEBKNdNITplfLE=; 
	b=TZkx8ohR4MO2a4uoshPcehr5lwl0XBEyWwM/xabNwAFb84nam0gObY5GPqStjoLYH/j9lxq21KdeAFDSCWsL2OkbdbuVDCwMf9E39nDkKiGpS93UmXu+6tblwaS4WhuSZg939o5wxD4Xv8W6y/hdsLAQuOfbocr2asoZ4AlAdRU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184621;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Dr1jKzgUHAaiQbYekBVD6PQo4dQeZnEBKNdNITplfLE=;
	b=GR6WiaXfoG7f/aZ+nKcXzYLlpEwLqBIDprZYcMvRlxkOu42PG34CwqjDnJScBtBX
	m7yW0hLY5gPRPTLFjrFfE8nsR/dALcfiMNM7IyHCxtM6k2K8yhPsIhyA1NMENl3QY0S
	ejNWVze6O2NbaMBbZMtJjPcKYoLU3t22/oaw9PUQ=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 03/44] x86/boot: move cmdline to boot info
Date: Thu, 17 Oct 2024 13:02:43 -0400
Message-Id: <20241017170325.3842-4-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Transition Xen's command line to being held in struct boot_info.

No functional change intended.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

---

Changes since v5:
- reorder struct boot_module fields
---
 xen/arch/x86/include/asm/bootinfo.h |  1 +
 xen/arch/x86/setup.c                | 20 ++++++++++++--------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index bec35e7c2f23..efbbd30cc514 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -14,6 +14,7 @@
  */
 struct boot_info {
     const char *loader;
+    const char *cmdline;
 
     unsigned int nr_modules;
 };
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index eac0954f42b8..037cdd17386c 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -274,6 +274,8 @@ static int __init cf_check parse_acpi_param(const char *s)
 }
 custom_param("acpi", parse_acpi_param);
 
+static const char *cmdline_cook(const char *p, const char *loader_name);
+
 static const module_t *__initdata initial_images;
 
 struct boot_info __initdata xen_boot_info;
@@ -288,6 +290,12 @@ static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
     bi->loader = (mbi->flags & MBI_LOADERNAME) ? __va(mbi->boot_loader_name)
                                                : "unknown";
 
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


