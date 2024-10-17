Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6469A2ACD
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:23:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821087.1234934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UD3-0002yu-80; Thu, 17 Oct 2024 17:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821087.1234934; Thu, 17 Oct 2024 17:22:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UD3-0002vs-4r; Thu, 17 Oct 2024 17:22:49 +0000
Received: by outflank-mailman (input) for mailman id 821087;
 Thu, 17 Oct 2024 17:22:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1Txw-00014B-BO
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:07:12 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e59ac53-8caa-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:07:10 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184646961494.5555495958281;
 Thu, 17 Oct 2024 10:04:06 -0700 (PDT)
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
X-Inumbo-ID: 3e59ac53-8caa-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729184649; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VB+bghv1DBQjUSk6ujnGUFjyWy7/8DtSUjB1NYK7UJdnn/0ZN/KOflLsCNqflpF1P4VZ+xydvKkSUnQPoK0Ybxu5XiJ6j5QcBvUblWAip2UJfHctY4BUX1Pv8+oGs1pfEpzrXtetcy0x8JuMgHoEazs4VtrAvU5b3NEd5NfQNzo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184649; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aspkH3LwBaiSwnG3lvyv34jbI4VkIKf8lSHUsreXCUg=; 
	b=m2lyBFLaShauw3nSRXIaG7+9vbEsLffItwmRIGGKsZva3hr5iNUAb+hitv+mW+Gdz2g3Gdv2SaIAFN2SVesusRWIPVVoQSTmsC6Ids1bgAnbd9buBzf8WCgcfrhin+ERIFC96/YV9xss8bgI1qPBggp+lCzdXRYNKkKL4awEbZw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184649;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=aspkH3LwBaiSwnG3lvyv34jbI4VkIKf8lSHUsreXCUg=;
	b=QPCRMfutIMbiye7CYv0bzR8+gm7BqarP4IB0ntvYD+sjukUu/SthYCBCIlO3mRiM
	d0JEyPs7Qwr5Mh1NVR1FiZE5Lj4txUdSs1TpTzMtAwTlwx8VN2g6M9gFvcMvqPJI7MF
	3MNhBYPPa9vCx3FFXr6MU9EXLb75t+ZCvptM7kT4=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 25/44] x86/boot: convert create_dom0 to use boot info
Date: Thu, 17 Oct 2024 13:03:05 -0400
Message-Id: <20241017170325.3842-26-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit changes create_dom0 to no longer take the individual components and
take struct boot_info instead. Internally, it is changed to locate the kernel
and ramdisk details from struct boot_info.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v5:
- change headroom back to unsigned long
- make mod_idx unsigned int
---
 xen/arch/x86/setup.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 08319f871a5d..5bc667b8b4d4 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -945,10 +945,8 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
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
 
@@ -963,9 +961,22 @@ static struct domain *__init create_dom0(const module_t *image,
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
         },
     };
+    unsigned long headroom;
+    unsigned int mod_idx = first_boot_module_index(bi, BOOTMOD_RAMDISK);
+    module_t *image, *initrd;
     struct domain *d;
     domid_t domid;
 
+    /* Map boot_module to mb1 module for dom0 */
+    image = bi->mods[0].mod;
+    headroom = bi->mods[0].headroom;
+
+    /* Map boot_module to mb1 module for initrd */
+    if ( mod_idx < 0 )
+        initrd = NULL;
+    else
+        initrd = bi->mods[mod_idx].mod;
+
     if ( opt_dom0_pvh )
     {
         dom0_cfg.flags |= (XEN_DOMCTL_CDF_hvm |
@@ -994,7 +1005,7 @@ static struct domain *__init create_dom0(const module_t *image,
     if ( image->string || kextra )
     {
         if ( image->string )
-            safe_strcpy(cmdline, cmdline_cook(__va(image->string), loader));
+            safe_strcpy(cmdline, cmdline_cook(__va(image->string), bi->loader));
 
         if ( kextra )
             /* kextra always includes exactly one leading space. */
@@ -2104,10 +2115,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
-    dom0 = create_dom0(bi->mods[0].mod, bi->mods[0].headroom,
-                       initrdidx < bi->nr_modules ? bi->mods[initrdidx].mod
-                                                  : NULL,
-                       kextra, bi->loader);
+    dom0 = create_dom0(bi, kextra);
     if ( !dom0 )
         panic("Could not set up DOM0 guest OS\n");
 
-- 
2.30.2


