Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5039F9A5852
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:56:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822976.1236975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2giu-0001fM-3j; Mon, 21 Oct 2024 00:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822976.1236975; Mon, 21 Oct 2024 00:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2git-0001eU-SW; Mon, 21 Oct 2024 00:56:39 +0000
Received: by outflank-mailman (input) for mailman id 822976;
 Mon, 21 Oct 2024 00:56:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gbd-0003Iq-Ha
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:49:09 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 458ada27-8f46-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 02:49:06 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471608242129.3516752909568;
 Sun, 20 Oct 2024 17:46:48 -0700 (PDT)
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
X-Inumbo-ID: 458ada27-8f46-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729471610; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TT+LCxtpTpaxwA4CjDxX6dIo1aDWZEc6eRSY+ov/NFY8IK0awNGO2R3SnmEX9PaFcfrUMfmTyLgZY6QEj4Yh7hZhiimvLbNIis9uiiKNNSMgdm88Sd/h0v6iN6ZXHSAWJmPQJEK20WZjDcOOpgdnhZH9x/5MhhGbad3Eek7ooOs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471610; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uzzoAQRXv4hKDmaKTHKSRZqXTQp1Xcv7fYKLtSvFAac=; 
	b=Isnqm0WXmGSjcVq7mIMjkjMNw8IAS9ZdKYHSc1ORQYJuTYlL50T3sg8l/0Ryd3qAAlx6tsR7/WjWFFq+mvdS2fmVfNxzKSzEZCi0JxVeFPaDWE0n4Cz4tX8S4qwQ/Zq1CepE//svlNQcFIchUCyS3Y1BEB53j4WlXtIHODYXHgA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471610;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=uzzoAQRXv4hKDmaKTHKSRZqXTQp1Xcv7fYKLtSvFAac=;
	b=kn14O1BQxrWNU5Cv6zh1/xBPtB0vpXcSzhe+ei/1s125KGtvD+JCMn8oamgQ9aZZ
	VWMiSttqUXUkrJEW15JR1dZ+EKFWBpd/wl1lmE/S7GXRqRDU1LcdbjRwFLn0jnua5uQ
	EYhzBiAK4hIjtlzmLyPUDN7hvKBiV3aVfaAeAQNU=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 21/38] x86/boot: relocate kextra into boot info
Date: Sun, 20 Oct 2024 20:45:56 -0400
Message-Id: <20241021004613.18793-22-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Move kextra into struct boot_info, thus no longer needed to be passed as a
parameter to create_dom0.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/include/asm/bootinfo.h |  1 +
 xen/arch/x86/setup.c                | 12 ++++++------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 3ca56454c4d7..9bd0e6336b4a 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -63,6 +63,7 @@ struct boot_module {
 struct boot_info {
     const char *loader;
     const char *cmdline;
+    const char *kextra;
 
     paddr_t memmap_addr;
     size_t memmap_length;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index d7f03225bd5a..6f953edd7521 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -962,8 +962,7 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
     return n;
 }
 
-static struct domain *__init create_dom0(struct boot_info *bi,
-                                         const char *kextra)
+static struct domain *__init create_dom0(struct boot_info *bi)
 {
     static char __initdata cmdline[MAX_GUEST_CMDLINE];
 
@@ -1017,15 +1016,15 @@ static struct domain *__init create_dom0(struct boot_info *bi,
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
@@ -1121,6 +1120,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         *kextra = '\0';
         kextra += 3;
         while ( kextra[1] == ' ' ) kextra++;
+        bi->kextra = kextra;
     }
     cmdline_parse(bi->cmdline);
 
@@ -2133,7 +2133,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
-    dom0 = create_dom0(bi, kextra);
+    dom0 = create_dom0(bi);
     if ( !dom0 )
         panic("Could not set up DOM0 guest OS\n");
 
-- 
2.30.2


