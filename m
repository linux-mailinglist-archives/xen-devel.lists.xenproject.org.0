Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD602966BB7
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:57:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786848.1196679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9c4-0003mi-PG; Fri, 30 Aug 2024 21:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786848.1196679; Fri, 30 Aug 2024 21:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9c4-0003g7-Gi; Fri, 30 Aug 2024 21:57:00 +0000
Received: by outflank-mailman (input) for mailman id 786848;
 Fri, 30 Aug 2024 21:56:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9WX-0000Zf-8B
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:51:17 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa2e6891-6719-11ef-99a1-01e77a169b0f;
 Fri, 30 Aug 2024 23:51:15 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054490245563.5309767248942;
 Fri, 30 Aug 2024 14:48:10 -0700 (PDT)
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
X-Inumbo-ID: fa2e6891-6719-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1725054492; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ghvdmCfKW1U3wg9sVOKivTQYdsa4a+eHSWZbKhe1gp+AXBzi0edi04NBOH3kYlmAri4dAD5BPM0ldjJ8uripVNYruJja0N/j8dff+YEZ4nPSAj5x5YxvD3Gdeu07RMiRMJkuUIOp6b/RedOvoRDGWOdXRDkwIIuW+6+cS9X6s4k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054492; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hWh29eRgG/vTUY/4IatoM48RmM3sftffSEOld+XbhDI=; 
	b=Tr+i9P/YXYznZyn71L/95qgtkaHyFBTrLY5OPGGgqsgCjPWE42b96OHPGF88kO3q0fejsa4/Xep2LeNDBkARAUzTee+22PZ+BawUKpYDCdERtsAP0OH0mqzkqkiQFsfIPthO5Jf1Y+/JfqU/u07zo2sCy2LWgsdoAtOr7Fn90Zo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054492;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=hWh29eRgG/vTUY/4IatoM48RmM3sftffSEOld+XbhDI=;
	b=Yd1s04nq0GCD9bo1FakYxpkA6AFbm7mrguZ6tktaABvdGIbhO2M/s1BdhdPhy8Jl
	aFciKfh2G7AQ9SkyDMPbHCvtLxxEwst0oBOIDVSjf39ouV78sQw3BITvniN9iRJ23pL
	2Wf6q5yomLNCQlbmtzdoBWP58apA1yxQ+8LS9PIo=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 28/44] x86/boot: add cmdline to struct boot_module
Date: Fri, 30 Aug 2024 17:47:13 -0400
Message-Id: <20240830214730.1621-29-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add a char pointer field, cmdline, to struct boot_module to hold the address
pointed to by the string field of struct mod. This removes the need to use the
early_mod field to get to the dom0 kernel command line.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootinfo.h | 2 ++
 xen/arch/x86/setup.c                | 9 ++++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 06b3ecaf7bec..edd5c435d032 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -30,6 +30,8 @@ struct boot_module {
 #define BOOTMOD_FLAG_X86_RELOCATED     (1U << 0)
 #define BOOTMOD_FLAG_X86_CONSUMED      (1U << 1)
 
+    const char *cmdline;
+
     paddr_t start;
     size_t size;
 };
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 76f25e9d620c..8ba32c6b6bfa 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -314,6 +314,8 @@ static void __init multiboot_to_bootinfo(multiboot_info_t *mbi, module_t *mods)
     {
         boot_mods[i].early_mod = &mods[i];
 
+        boot_mods[i].cmdline = (char *)(paddr_t)mods[i].string;
+
         boot_mods[i].start = (paddr_t)mods[i].mod_start;
         boot_mods[i].size = mods[i].mod_end - mods[i].mod_start;
     }
@@ -1000,10 +1002,11 @@ static struct domain *__init create_dom0(const struct boot_info *bi)
         panic("Error creating d%uv0\n", domid);
 
     /* Grab the DOM0 command line. */
-    if ( image->early_mod->string || bi->kextra )
+    if ( image->cmdline || bi->kextra )
     {
-        if ( image->early_mod->string )
-            safe_strcpy(cmdline, cmdline_cook(__va(image->early_mod->string),
+        if ( image->cmdline )
+            safe_strcpy(cmdline,
+                        cmdline_cook(__va((unsigned long)image->cmdline),
                         bi->boot_loader_name));
 
         if ( bi->kextra )
-- 
2.30.2


