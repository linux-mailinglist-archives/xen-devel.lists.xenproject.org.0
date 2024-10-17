Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A929A2ABC
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:20:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821038.1234845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UAu-0005iH-By; Thu, 17 Oct 2024 17:20:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821038.1234845; Thu, 17 Oct 2024 17:20:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UAu-0005en-5D; Thu, 17 Oct 2024 17:20:36 +0000
Received: by outflank-mailman (input) for mailman id 821038;
 Thu, 17 Oct 2024 17:20:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1TyG-00014B-Ow
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:07:32 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a73a28b-8caa-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:07:30 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184649380155.40519092477825;
 Thu, 17 Oct 2024 10:04:09 -0700 (PDT)
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
X-Inumbo-ID: 4a73a28b-8caa-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729184651; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Wpe+oEVSbYV3IhV6IBjYPlx3kNNAazLZxGPKXgbAFTVtxCHAg/uvodXXUT/rWOCuD19nIC5W8lVQmZx5Ts1f+Bv5N1XqfQ2gsBsvjMIhyKab5SJRbseFJZO/rILifvLmjtEQhi+tY7xpgyaH+1f8J/KXnG4AHUdZYzxOT57/V5I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184651; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=m7ZLsFa0scaQr3iKRnGjSr9xOOYoJU1g28IpOugO1dA=; 
	b=fKe7VX5oXbm9z9WyEMvAegXBpNfFZ2Hse/EWr6Ch9WPR84VWTOHGyApauOUNWW39+4VAo1j0hgIELO/vScTBytZJQd5Lhv2W4dYORyFTz6kB31RO5leLk0hsJHKTOsAACHFZFRDBtIUGY/ixRxiasV7ZoRfgVkkq5DGapym7r7w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184651;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=m7ZLsFa0scaQr3iKRnGjSr9xOOYoJU1g28IpOugO1dA=;
	b=hPMDsb+3XYBveCTZ/4OUIthAHB6gh8TRBAWsQR+H7lvmIEYMvuFTlIg+5krCZaHr
	atgYbglbip2cXpVnKto59kHe+ApwYH80LZ8NjvUuMe0dQhDf5Ub9WL4ehXnOIRPALE1
	Wh47WspqpHO/viBaxPtIhxshp6Zi3YbkLbwK8qNE=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 27/44] x86/boot: relocate kextra into boot info
Date: Thu, 17 Oct 2024 13:03:07 -0400
Message-Id: <20241017170325.3842-28-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
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
index 8b63eb27d6dd..8dcda42b3400 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -57,6 +57,7 @@ struct boot_module {
 struct boot_info {
     const char *loader;
     const char *cmdline;
+    const char *kextra;
 
     paddr_t memmap_addr;
     size_t memmap_length;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index e7573bc3f40b..2574d2f1fdb4 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -945,8 +945,7 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
     return n;
 }
 
-static struct domain *__init create_dom0(struct boot_info *bi,
-                                         const char *kextra)
+static struct domain *__init create_dom0(struct boot_info *bi)
 {
     static char __initdata cmdline[MAX_GUEST_CMDLINE];
 
@@ -1000,15 +999,15 @@ static struct domain *__init create_dom0(struct boot_info *bi,
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
@@ -1102,6 +1101,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
         *kextra = '\0';
         kextra += 3;
         while ( kextra[1] == ' ' ) kextra++;
+        bi->kextra = kextra;
     }
     cmdline_parse(bi->cmdline);
 
@@ -2114,7 +2114,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
-    dom0 = create_dom0(bi, kextra);
+    dom0 = create_dom0(bi);
     if ( !dom0 )
         panic("Could not set up DOM0 guest OS\n");
 
-- 
2.30.2


