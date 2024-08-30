Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2B8966B8C
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:51:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786715.1196406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9WC-0004T2-Vw; Fri, 30 Aug 2024 21:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786715.1196406; Fri, 30 Aug 2024 21:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9WC-0004Q9-Si; Fri, 30 Aug 2024 21:50:56 +0000
Received: by outflank-mailman (input) for mailman id 786715;
 Fri, 30 Aug 2024 21:50:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9WB-0002pb-5E
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:50:55 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed3756ba-6719-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 23:50:53 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1725054487065771.3540805061515;
 Fri, 30 Aug 2024 14:48:07 -0700 (PDT)
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
X-Inumbo-ID: ed3756ba-6719-11ef-a0b1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1725054489; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RwM36eY5ndlANJvGlJ0eLycvYhep4L+JHBT2OQ10GwM4BWVcyagKcezER0btgNhQqDCTixPnC90sk7zXQqs1Rl0gKC0vgvB8lMKGEd5M7G+sdFxHm8/7yPsjMc+Pr6uAp+TdkYCMcHFHDzUxJwZsxugaCHIdx7Dz4S09miNu/GI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054489; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ys18ftsSkLmnP3FGqbLMZshx9Vb7hKAbenYbX5oGr+w=; 
	b=FrdO7+lXLw8G6ysgq0pzXR020mdz7cIsmcyHkAwq7dfUfTDcMTxNu+6dtIX5W+6TgmlqE0uTmI87IgZOvs2dZv4SMDWcHvLn5Jrr/iV336Fl9KLnP10lBGtuHJkz9Lq7FID/fCW9vZrdfheqefj4QkFrTob2Nw0PBDPcOADgHns=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054489;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=ys18ftsSkLmnP3FGqbLMZshx9Vb7hKAbenYbX5oGr+w=;
	b=DHLyREtRAhlEVRDnPbdhTi+PYXcBI8/qPzw9pewwZ7lTVdEJbGuayFw7jjdPLqB7
	eBUUAEdpbCQ8gCHvfZpJnFo3XBeGJqkqfCz7Uoqt5j77z+jj5BbIjttDqb2OJqnDNYv
	vaRKqhSPaLfFYSCz2GBCMQlV2XZnh43a/i6muMbk=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 25/44] x86/boot: convert create_dom0 to use boot info
Date: Fri, 30 Aug 2024 17:47:10 -0400
Message-Id: <20240830214730.1621-26-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit changes create_dom0 to no longer take the individual components and
take struct boot_info instead. Internally, it is changed to locate the kernel
and ramdisk details from struct boot_info.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/setup.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 5f42d1049110..6a613c4847b0 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -946,10 +946,8 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
     return n;
 }
 
-static struct domain *__init create_dom0(const module_t *image,
-                                         unsigned long headroom,
-                                         module_t *initrd, const char *kextra,
-                                         const char *loader)
+static struct domain *__init create_dom0(const struct boot_info *bi,
+                                         const char *kextra)
 {
     static char __initdata cmdline[MAX_GUEST_CMDLINE];
 
@@ -964,9 +962,21 @@ static struct domain *__init create_dom0(const module_t *image,
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
         },
     };
+    int headroom, mod_idx = first_boot_module_index(bi, BOOTMOD_RAMDISK);
+    module_t *image, *initrd;
     struct domain *d;
     domid_t domid;
 
+    /* Map boot_module to mb1 module for dom0 */
+    image = bi->mods[0].early_mod;
+    headroom = bi->mods[0].headroom;
+
+    /* Map boot_module to mb1 module for initrd */
+    if ( mod_idx < 0 )
+        initrd = NULL;
+    else
+        initrd = bi->mods[mod_idx].early_mod;
+
     if ( opt_dom0_pvh )
     {
         dom0_cfg.flags |= (XEN_DOMCTL_CDF_hvm |
@@ -995,7 +1005,8 @@ static struct domain *__init create_dom0(const module_t *image,
     if ( image->string || kextra )
     {
         if ( image->string )
-            safe_strcpy(cmdline, cmdline_cook(__va(image->string), loader));
+            safe_strcpy(cmdline, cmdline_cook(__va(image->string),
+                        bi->boot_loader_name));
 
         if ( kextra )
             /* kextra always includes exactly one leading space. */
@@ -2121,10 +2132,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
-    dom0 = create_dom0(boot_info->mods[0].early_mod, boot_info->mods[0].headroom,
-                       (initrdidx >= 0 && initrdidx < boot_info->nr_mods) ?
-                            boot_info->mods[initrdidx].early_mod : NULL,
-                       kextra, boot_info->boot_loader_name);
+    dom0 = create_dom0(boot_info, kextra);
     if ( !dom0 )
         panic("Could not set up DOM0 guest OS\n");
 
-- 
2.30.2


