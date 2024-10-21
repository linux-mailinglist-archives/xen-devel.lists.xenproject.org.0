Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 820529A585A
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:57:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823025.1237071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gjS-0007Eg-08; Mon, 21 Oct 2024 00:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823025.1237071; Mon, 21 Oct 2024 00:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gjR-00076r-PL; Mon, 21 Oct 2024 00:57:13 +0000
Received: by outflank-mailman (input) for mailman id 823025;
 Mon, 21 Oct 2024 00:57:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gcF-0001i1-1E
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:49:47 +0000
Received: from sender3-of-o58.zoho.com (sender3-of-o58.zoho.com
 [136.143.184.58]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d3c98f9-8f46-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 02:49:46 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471614074580.9912900787891;
 Sun, 20 Oct 2024 17:46:54 -0700 (PDT)
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
X-Inumbo-ID: 5d3c98f9-8f46-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729471616; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Rh1pfFOh/ZaLbVfmXmkN8JvQ1BP/bKVNJPhIe+6B6jfb2wMticdqY1bNxcoaABWgCK+3xujsR72yzXeo5tOM31oGk9962xxdSnkgvNG7ye3p0jlQELzRdXXnvU236Bk25EIw9ZFVQWoq+fgspjPDauSbvvJ/vR1OLeoEMmtjA9w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471616; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8l/A5uTX2SajRrK9csx9oFSHA7WUVR/YgCRfUTZ06cw=; 
	b=l2bMvlqYqkBzD7ur+Bwz+73Kqdz/Bbn7GZhuOTfNlDkV+ruazlWjeml58PCeRH0GSmq0AJ28j/geGbeZ0ppa6aTmJ8Ek1szaQL4X6S/5KXvKO1JTpUCTYQ1U6SYbH3Ay+h3eG9lK/Z3uYeLbQNgUu+5XjQAW0Hm4OQ0hiB30BT8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471616;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=8l/A5uTX2SajRrK9csx9oFSHA7WUVR/YgCRfUTZ06cw=;
	b=By/WpDgqmji2sfwMOYkHAH2S/rjv1GqBVDprm5hLT69o0VmYCmm0fPy/Bt1aNwJu
	69ViJFj+c5kuZUA7beejUnL9BpLhIRub+Enh5Mp+7mIEPUjvUgrgqYye476NSHgNUnO
	AhH9ZUT9fpZBb3aepolJ9mqExTJBcTEZsGztZZqg=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 26/38] x86/boot: convert pvh_load_kernel to struct boot_module
Date: Sun, 20 Oct 2024 20:46:01 -0400
Message-Id: <20241021004613.18793-27-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
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
index 0fe63f040936..211f4e3e772e 100644
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
@@ -1346,8 +1345,8 @@ int __init dom0_construct_pvh(struct domain *d, const struct boot_module *image,
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


