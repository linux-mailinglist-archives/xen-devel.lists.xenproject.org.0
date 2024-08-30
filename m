Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2B5966BA2
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:56:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786756.1196507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bS-0002fY-5l; Fri, 30 Aug 2024 21:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786756.1196507; Fri, 30 Aug 2024 21:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bR-0002cX-VD; Fri, 30 Aug 2024 21:56:21 +0000
Received: by outflank-mailman (input) for mailman id 786756;
 Fri, 30 Aug 2024 21:56:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9X0-0000Zf-W1
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:51:46 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bea60a2-671a-11ef-99a1-01e77a169b0f;
 Fri, 30 Aug 2024 23:51:45 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 172505449453355.86826546005;
 Fri, 30 Aug 2024 14:48:14 -0700 (PDT)
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
X-Inumbo-ID: 0bea60a2-671a-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1725054496; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kRWghNc2F5sPVQ5+qzb7H8DQVUJNT8NJBljwX7Z9CzrlbUmFyh2Ft/QvGKXqbknxOISJ8sZJg1gJnjO7Qwnh+h1K7VA7T+/3Bp5WCjsDUatXkZsTzgpIP1GatTBH6+wP2NniEcRcOnD0Tis0INikyeG49vQL+IW04EzQjLfTRMc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054496; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=e/jZPWMKnu3Xz391hq0lPvFpid72gh7AyHIhBUi4faY=; 
	b=OZyFK80p65oqo4Ii7KoSnlpeiyCNDLvCwT9u9C/+ylHjTtpK/oQicRPRJArPOhPIQ+BhXPQ39sw0WlV9JESlqB3k9r6odG+PSk8x84pwgxZH/EvHQ36go5l6JaLyOYkzF3O/bgTKmn5MkBTNcmv5ccRmvB+T4PNNQKqR1sIXN/A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054496;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=e/jZPWMKnu3Xz391hq0lPvFpid72gh7AyHIhBUi4faY=;
	b=AKjnzuNyRb3yNdo7f2glmUqBQS3oQghijs1A4zbpenqkwz9M8x5GmABZOqvwt5mT
	Oo7af5neTsiQ3hK9+4kkmVcM1TYto19tNM5ixt2u5rsLgYnfbItVuC8oC+GkKyiW7h2
	8FzcAuPbbFcsYr3wD8r/N8YeGYJDM+Ikid6RsYLc=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 32/44] x86/boot: convert pvh_load_kernel to struct boot_module
Date: Fri, 30 Aug 2024 17:47:17 -0400
Message-Id: <20240830214730.1621-33-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This changes both the kernel and ramdisk parameters over to struct boot_module.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/hvm/dom0_build.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 1579034ebfc0..b359f3d98376 100644
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
@@ -1331,8 +1330,8 @@ int __init dom0_construct_pvh(
         return rc;
     }
 
-    rc = pvh_load_kernel(d, image->early_mod, image->headroom, initrd->early_mod,
-                         bootstrap_map_bm(image), cmdline, &entry, &start_info);
+    rc = pvh_load_kernel(d, image, initrd, bootstrap_map_bm(image), cmdline,
+                         &entry, &start_info);
     if ( rc )
     {
         printk("Failed to load Dom0 kernel\n");
-- 
2.30.2


