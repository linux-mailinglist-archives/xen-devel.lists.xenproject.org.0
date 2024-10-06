Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3249E9921D2
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:56:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811366.1224020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZEq-0003q8-Ux; Sun, 06 Oct 2024 21:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811366.1224020; Sun, 06 Oct 2024 21:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZEq-0003jr-JN; Sun, 06 Oct 2024 21:56:28 +0000
Received: by outflank-mailman (input) for mailman id 811366;
 Sun, 06 Oct 2024 21:56:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZA0-00051E-4H
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:51:28 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21f21c74-842d-11ef-99a2-01e77a169b0f;
 Sun, 06 Oct 2024 23:51:26 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251414777363.47999883098566;
 Sun, 6 Oct 2024 14:50:14 -0700 (PDT)
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
X-Inumbo-ID: 21f21c74-842d-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728251416; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QtOx3JlBaNesHvtITNP5YdRA+QcUMh2LxsUf3cj2vO/0om4McBZnVdDzDJo7ix84ZnOVa8gtjpIUqNUJRwgOjndW3ABNf1gfu049YbPDaValK/gARz2aqLkp4Mf4p5mQx6Ggkw1hOh2bDiuOFhCwjy5RFnllZbaGSYfBYRZavKo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251416; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Y+YFqvG91BoEhUMPMtE6Kyra9a+npi8misIshir3lQ0=; 
	b=KP/ngO2WXnRS7rSVzcQGsIZkJlVfYbWj11XuBL3az1C3GbomlReQV5LdQaMo0q6l+DAIym2kkOu3dC9nlkvqxJaOlIW2tBu1kCxZDk9S6i0HqcyjSdy2LQHe4QRXBqviaoHW8GXKAz6Ty3OGfAED/JqsGPQWcxrMzFaecb5lI94=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251416;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Y+YFqvG91BoEhUMPMtE6Kyra9a+npi8misIshir3lQ0=;
	b=ZQ8AWXZXqMbNDwrC12Vd851S24nqi8Cb1cvihhO9cxwofGqvpjLZjf98juAkzc84
	69d4bIwTUpNyI7ksM9x1vAmTM9SAC2QrQpUCJv8zywK1MDZMWvt3R8jz+ZffnzgXyTg
	IRv4RqmSYV2pnVc6XbHWI8YA9MSOu0WAdmbO6VUQ=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 09/44] x86/boot: introduce boot module types
Date: Sun,  6 Oct 2024 17:49:20 -0400
Message-Id: <20241006214956.24339-10-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit introduces module types of xen, kernel, and ramdisk to allow boot
module detect code to tag the purpose of a boot module. This reduces the need
for hard coded order assumptions and global variables to be used by consumers
of boot modules, such as domain construction.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootinfo.h | 9 +++++++++
 xen/arch/x86/setup.c                | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index c7e6b4ebf0da..6941a8975ea6 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -14,6 +14,14 @@
 /* Max number of boot modules a bootloader can provide in addition to Xen */
 #define MAX_NR_BOOTMODS 63
 
+/* Boot module binary type / purpose */
+enum bootmod_type {
+    BOOTMOD_UNKNOWN,
+    BOOTMOD_XEN,
+    BOOTMOD_KERNEL,
+    BOOTMOD_RAMDISK,
+};
+
 struct boot_module {
     /* Transitionary only */
     module_t *mod;
@@ -22,6 +30,7 @@ struct boot_module {
      * reserved, into which it will be decompressed.
      */
     unsigned long headroom;
+    enum bootmod_type type;
 };
 
 /*
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index ba4bee6b93af..69c45f115523 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -311,6 +311,10 @@ static struct boot_info __init *multiboot_fill_boot_info(unsigned long mbi_p)
     for ( i = 0; i <= bi->nr_modules; i++ )
         bi->mods[i].mod = &mods[i];
 
+    /* map the last mb module for xen entry */
+    bi->mods[bi->nr_modules].type = BOOTMOD_XEN;
+    bi->mods[bi->nr_modules].mod = &mods[bi->nr_modules];
+
     return bi;
 }
 
@@ -1171,6 +1175,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     bitmap_fill(module_map, bi->nr_modules);
     __clear_bit(0, module_map); /* Dom0 kernel is always first */
+    bi->mods[0].type = BOOTMOD_KERNEL;
 
     if ( pvh_boot )
     {
@@ -2058,6 +2063,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
            cpu_has_nx ? "" : "not ");
 
     initrdidx = find_first_bit(module_map, bi->nr_modules);
+    bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
     if ( bitmap_weight(module_map, bi->nr_modules) > 1 )
         printk(XENLOG_WARNING
                "Multiple initrd candidates, picking module #%u\n",
-- 
2.30.2


