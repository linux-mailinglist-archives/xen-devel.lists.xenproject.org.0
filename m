Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2129921DA
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:57:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811368.1224050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZEv-0004vo-Ny; Sun, 06 Oct 2024 21:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811368.1224050; Sun, 06 Oct 2024 21:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZEv-0004ri-IM; Sun, 06 Oct 2024 21:56:33 +0000
Received: by outflank-mailman (input) for mailman id 811368;
 Sun, 06 Oct 2024 21:56:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZCD-0007Zk-7f
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:53:45 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74144c94-842d-11ef-a0bb-8be0dac302b0;
 Sun, 06 Oct 2024 23:53:44 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251435852741.2371065758415;
 Sun, 6 Oct 2024 14:50:35 -0700 (PDT)
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
X-Inumbo-ID: 74144c94-842d-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728251437; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fpE4iWnG7MRWvMIXDZu0+C/SbbBTjIpEDh1IDmCnGPkCU1sscwmqpb/64Ekm2yrqwMxSqr/360Fp0v+xyuE+/teI3DEHSCLnGmd5tQ/VbXVo+L99LaX/zot6gBuOJg4s9yIhOVeDBd3TmD05LB+Fq7+WU5Fstg+wXH2KbZoWmuw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251437; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=U0epSQBbEatFgMV9a6wGUqA/KCfapTC+zhJG3oyewHg=; 
	b=BEd3jpvoPde7X5zkhKaKripcFM27MfHK29nhrsTBtrPQhNAD+NQTMpoKpNgdrq8/0BDihi5WpBlPhKNmomFOtMGw+NsA3C7ruzO6/hAt1WLQL8/6i2khX0sxpxbGgmlv7gcqjHGWViNwmzIRhf44dUzq22mPM8D26EccMDVL6vk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251437;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=U0epSQBbEatFgMV9a6wGUqA/KCfapTC+zhJG3oyewHg=;
	b=Nk22mfqK65/2UbA74b+aYyxLns0LP+Keh6/mmfHzt40FKiDNJt05syTMzhtgXYZV
	gItpS95yeFBYQjLHo6PKBj42MlsLV8IupcYSGSygaq83JJ4Avhd97orqhQgbwjGpbzb
	sjV2k4LXuRkKvkk8Q60Bv+VuAaXta9oWpVfC0ZiI=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 27/44] x86/boot: relocate kextra into boot info
Date: Sun,  6 Oct 2024 17:49:38 -0400
Message-Id: <20241006214956.24339-28-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Move kextra into struct boot_info, thus no longer needed to be passed as a
parameter to create_dom0.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootinfo.h |  1 +
 xen/arch/x86/setup.c                | 12 ++++++------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 5cbd1cbbbccd..9ed260629012 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -49,6 +49,7 @@ struct boot_module {
 struct boot_info {
     const char *loader;
     const char *cmdline;
+    const char *kextra;
 
     paddr_t memmap_addr;
     size_t memmap_length;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 135bd6591c1c..aed0837902c4 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -946,8 +946,7 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
     return n;
 }
 
-static struct domain *__init create_dom0(struct boot_info *bi,
-                                         const char *kextra)
+static struct domain *__init create_dom0(struct boot_info *bi)
 {
     static char __initdata cmdline[MAX_GUEST_CMDLINE];
 
@@ -1001,15 +1000,15 @@ static struct domain *__init create_dom0(struct boot_info *bi,
         panic("Error creating d%uv0\n", domid);
 
     /* Grab the DOM0 command line. */
-    if ( image->mod->string || kextra )
+    if ( image->mod->string || bi->kextra )
     {
         if ( image->mod->string )
             safe_strcpy(cmdline, cmdline_cook(__va(image->mod->string),
                         bi->loader));
 
-        if ( kextra )
+        if ( bi->kextra )
             /* kextra always includes exactly one leading space. */
-            safe_strcat(cmdline, kextra);
+            safe_strcat(cmdline, bi->kextra);
 
         /* Append any extra parameters. */
         if ( skip_ioapic_setup && !strstr(cmdline, "noapic") )
@@ -1103,6 +1102,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         *kextra = '\0';
         kextra += 3;
         while ( kextra[1] == ' ' ) kextra++;
+        bi->kextra = kextra;
     }
     cmdline_parse(bi->cmdline);
 
@@ -2116,7 +2116,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
-    dom0 = create_dom0(bi, kextra);
+    dom0 = create_dom0(bi);
     if ( !dom0 )
         panic("Could not set up DOM0 guest OS\n");
 
-- 
2.30.2


