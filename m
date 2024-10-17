Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 911EE9A2ABB
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:20:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821027.1234825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UAf-0004lZ-O7; Thu, 17 Oct 2024 17:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821027.1234825; Thu, 17 Oct 2024 17:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UAf-0004jN-KZ; Thu, 17 Oct 2024 17:20:21 +0000
Received: by outflank-mailman (input) for mailman id 821027;
 Thu, 17 Oct 2024 17:20:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1Tyu-00014B-LM
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:08:12 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61c44785-8caa-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 19:08:09 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184655620990.0465556999607;
 Thu, 17 Oct 2024 10:04:15 -0700 (PDT)
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
X-Inumbo-ID: 61c44785-8caa-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729184657; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dbwr3om9PZ4En8gFJd9v1mNrb/XPwezxwWfc4fiSUCNZ8f7LvijJJRsUkzu1WDfgERsE+TCBvensIXC+4wAiIZDUNkpuU756buzHgDNmR5CudHfWLT/cnkDLoiRaC9/yHIDsgNEgmwx4RWMhX4CCjWmowULHFILKHa07fasUFAs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184657; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NBDtInGp9YJQJOeasJO8noI67YJSFGQINY+XLRHfqCo=; 
	b=J2aljjfyPDne7TpLJ9XyqIZQjXyWhLlE4XRZmWShk+k/98iBec89enAqplSBsyedkKaFS7/yKtdbO+mB9KunSLURI08q7xPuTsaB0l6N7Y6pPcaaA4WlqT1+eDe4W11Da92ROCCD21TKhEkDD8BFCsZknuZH2bDyQkI3gDu4YbQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184657;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=NBDtInGp9YJQJOeasJO8noI67YJSFGQINY+XLRHfqCo=;
	b=Y1txQgXlBFhJcdfypqPQmk4164USOHXRiQqzkaLVEZDVogw2V51hQK7iqt9qrOoA
	7Yp6hD1vkM874W9+A4ZVxch2iKrEgBuwbVOmRxDgvaFDec3m0QreqXeqn8yzb/bkX7D
	6rRNexlNk1iI2Bl8hnaYQ1VoSLNLSn01btDvQI2E=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 32/44] x86/boot: convert pvh_load_kernel to struct boot_module
Date: Thu, 17 Oct 2024 13:03:12 -0400
Message-Id: <20241017170325.3842-33-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This changes both the kernel and ramdisk parameters over to struct boot_module.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/hvm/dom0_build.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index beaa1d492077..a3fd5e762dc4 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -642,15 +642,14 @@ static bool __init check_and_adjust_load_address(
     return true;
 }
 
-static int __init pvh_load_kernel(struct domain *d, const module_t *image,
-                                  unsigned long image_headroom,
-                                  module_t *initrd, void *image_base,
-                                  const char *cmdline, paddr_t *entry,
-                                  paddr_t *start_info_addr)
+static int __init pvh_load_kernel(
+    struct domain *d, const struct boot_module *image,
+    struct boot_module *initrd, void *image_base,
+    const char *cmdline, paddr_t *entry, paddr_t *start_info_addr)
 {
-    void *image_start = image_base + image_headroom;
-    unsigned long image_len = image->mod_end;
-    unsigned long initrd_len = initrd ? initrd->mod_end : 0;
+    void *image_start = image_base + image->headroom;
+    unsigned long image_len = image->size;
+    unsigned long initrd_len = initrd ? initrd->size : 0;
     struct elf_binary elf;
     struct elf_dom_parms parms;
     paddr_t last_addr;
@@ -725,7 +724,7 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
 
     if ( initrd != NULL )
     {
-        rc = hvm_copy_to_guest_phys(last_addr, mfn_to_virt(initrd->mod_start),
+        rc = hvm_copy_to_guest_phys(last_addr, maddr_to_virt(initrd->start),
                                     initrd_len, v);
         if ( rc )
         {
@@ -736,9 +735,9 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
         mod.paddr = last_addr;
         mod.size = initrd_len;
         last_addr += ROUNDUP(initrd_len, elf_64bit(&elf) ? 8 : 4);
-        if ( initrd->string )
+        if ( initrd->cmdline )
         {
-            char *str = __va(initrd->string);
+            char *str = __va((unsigned long)initrd->cmdline);
             size_t len = strlen(str) + 1;
 
             rc = hvm_copy_to_guest_phys(last_addr, str, len, v);
@@ -1346,8 +1345,8 @@ int __init dom0_construct_pvh(
         return rc;
     }
 
-    rc = pvh_load_kernel(d, image->mod, image->headroom, initrd->mod,
-                         bootstrap_map_bm(image), cmdline, &entry, &start_info);
+    rc = pvh_load_kernel(d, image, initrd, bootstrap_map_bm(image), cmdline,
+                         &entry, &start_info);
     if ( rc )
     {
         printk("Failed to load Dom0 kernel\n");
-- 
2.30.2


