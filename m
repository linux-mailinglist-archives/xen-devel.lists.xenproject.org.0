Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B8D966BA1
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:56:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786758.1196512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bS-0002k6-Dd; Fri, 30 Aug 2024 21:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786758.1196512; Fri, 30 Aug 2024 21:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bS-0002gq-8o; Fri, 30 Aug 2024 21:56:22 +0000
Received: by outflank-mailman (input) for mailman id 786758;
 Fri, 30 Aug 2024 21:56:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9WQ-0000Zf-1T
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:51:10 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5ba0d87-6719-11ef-99a1-01e77a169b0f;
 Fri, 30 Aug 2024 23:51:08 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054489185157.27284103749457;
 Fri, 30 Aug 2024 14:48:09 -0700 (PDT)
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
X-Inumbo-ID: f5ba0d87-6719-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1725054491; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EuGnOBmt9m/VVYVXJTTFa3ILqf+v+luBtSr/jYRWgoh8BFZkKOBZ0ap57WAC/aNKuOurd30kGqdZ9EuYnseqMH7rKzOzhUeL4idjUxaTYSk3eafIe80ACX1b8QZBIWyjzu28oVLNviDbftLcjVUe1btwkij8OWUhxRFiwYzOAuw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054491; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1CoQkH+lHv+L/z16JNTEDasfAHp/vM4gE3D+btk1VDg=; 
	b=ApXX6ZRn8dM9UjlWhKXCgfsNkuikD8zlP76mpYsNvozKvLthiyTMcfz0mNwV/BIhlh0rdCe2rk4WflwHK2xFQYw2gnuEPP2ELZpjxvNEJ4yi9hIvsp5hq1Vy+CWNO5eptrw6z7V+WBuvLFczIUUNUyel6zROCk2eM6ujy3xnBHA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054491;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=1CoQkH+lHv+L/z16JNTEDasfAHp/vM4gE3D+btk1VDg=;
	b=Qe5pJZwkJOmCZy2ZS+NXw1udAcRDK9I0V59Rpd1tHSvGIgVlTExzNueQMF45/t47
	qzV9GFdiVg4+b0tzqP1/yRCL/qtu+x4fr+R4zKASf03pC0KKyk1rWEPwa88KBQyN3Q8
	vcDIrEN7oM075KBPt9/0a6/G71m6l3ThlhMTeC/0=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 27/44] x86/boot: relocate kextra into boot info
Date: Fri, 30 Aug 2024 17:47:12 -0400
Message-Id: <20240830214730.1621-28-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Move kextra into struct boot_info, thus no longer needed to be passed as a
parameter to create_dom0.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootinfo.h |  2 ++
 xen/arch/x86/setup.c                | 12 ++++++------
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 1a325f66b3ba..06b3ecaf7bec 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -41,6 +41,8 @@ struct boot_info {
     const char *boot_loader_name;
     const char *cmdline;
 
+    const char *kextra;
+
     paddr_t mmap_addr;
     uint32_t mmap_length;
 };
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index f58eb21d00d7..76f25e9d620c 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -946,8 +946,7 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
     return n;
 }
 
-static struct domain *__init create_dom0(const struct boot_info *bi,
-                                         const char *kextra)
+static struct domain *__init create_dom0(const struct boot_info *bi)
 {
     static char __initdata cmdline[MAX_GUEST_CMDLINE];
 
@@ -1001,15 +1000,15 @@ static struct domain *__init create_dom0(const struct boot_info *bi,
         panic("Error creating d%uv0\n", domid);
 
     /* Grab the DOM0 command line. */
-    if ( image->early_mod->string || kextra )
+    if ( image->early_mod->string || bi->kextra )
     {
         if ( image->early_mod->string )
             safe_strcpy(cmdline, cmdline_cook(__va(image->early_mod->string),
                         bi->boot_loader_name));
 
-        if ( kextra )
+        if ( bi->kextra )
             /* kextra always includes exactly one leading space. */
-            safe_strcat(cmdline, kextra);
+            safe_strcat(cmdline, bi->kextra);
 
         /* Append any extra parameters. */
         if ( skip_ioapic_setup && !strstr(cmdline, "noapic") )
@@ -1119,6 +1118,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         *kextra = '\0';
         kextra += 3;
         while ( kextra[1] == ' ' ) kextra++;
+        boot_info->kextra = kextra;
     }
     cmdline_parse(boot_info->cmdline);
 
@@ -2131,7 +2131,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
-    dom0 = create_dom0(boot_info, kextra);
+    dom0 = create_dom0(boot_info);
     if ( !dom0 )
         panic("Could not set up DOM0 guest OS\n");
 
-- 
2.30.2


