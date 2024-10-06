Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4892F9921EE
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:57:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811422.1224275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZG2-0000PW-F0; Sun, 06 Oct 2024 21:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811422.1224275; Sun, 06 Oct 2024 21:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZG2-0000Hd-7T; Sun, 06 Oct 2024 21:57:42 +0000
Received: by outflank-mailman (input) for mailman id 811422;
 Sun, 06 Oct 2024 21:57:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZCp-0007Zk-Iq
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:54:23 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8aee2ea4-842d-11ef-a0bb-8be0dac302b0;
 Sun, 06 Oct 2024 23:54:22 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251441612580.1270707109736;
 Sun, 6 Oct 2024 14:50:41 -0700 (PDT)
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
X-Inumbo-ID: 8aee2ea4-842d-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728251443; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fW3nCxrVxlJAABUPr8tk4DgH1UHsa2p7CIHqc/1BqtpXFFQ45MwsKwQI0vZWERsaZtCiuPOHaQoPh5DqU3zNyooPca61OCGwe+i/A5kxpEGmvs8m4XddwXEDu48c9R1OwyH06vOchMBKoDk0Cyuq7ZRXUMDm0pkmP7tqBfN4tTc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251443; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8fXOlbbmg64oLi+2VKa9EtSyLufW2pfIFApT44ZRUyU=; 
	b=EftjvZP3TkSYHLBi5Uz7Kx//7SDTVvcOMvepmT1CFwiBZaiKIdZvmoaQEfH1jPEWpMEaa5T1FkK5qjst9wD6ySjzALCny+KovUxQP13BDXSWqsir2y4c5Z7RFqHg4MvKFPYvseqtqyFLsHQD9PKxhr9w4eT/ILIVlpvrJw1HEQo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251443;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=8fXOlbbmg64oLi+2VKa9EtSyLufW2pfIFApT44ZRUyU=;
	b=ncgvaws9KT3pnIYEjMeB2+66d8tCjs7I3FWF3/6UNZ5/hASim5W0wXAl+u2JjzwN
	XEMQ3aVeUGHeAOzd/x/2fKKg5J4vIh86TvWXzRdtBjWZGm6HgcZ0AwbsbMVVGDaGnEv
	FHkeOcZQBSgKAOn/z9/LPQQZrlZzG1TcdTCwYhP0=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 32/44] x86/boot: convert pvh_load_kernel to struct boot_module
Date: Sun,  6 Oct 2024 17:49:43 -0400
Message-Id: <20241006214956.24339-33-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This changes both the kernel and ramdisk parameters over to struct boot_module.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
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


