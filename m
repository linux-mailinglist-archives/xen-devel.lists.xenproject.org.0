Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F5D9A2A8E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:17:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820943.1234695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U7f-0004id-Pi; Thu, 17 Oct 2024 17:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820943.1234695; Thu, 17 Oct 2024 17:17:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1U7f-0004gH-Mt; Thu, 17 Oct 2024 17:17:15 +0000
Received: by outflank-mailman (input) for mailman id 820943;
 Thu, 17 Oct 2024 17:17:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1TzY-0008TH-14
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:08:52 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a61aa24-8caa-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 19:08:51 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184661673704.2726553863293;
 Thu, 17 Oct 2024 10:04:21 -0700 (PDT)
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
X-Inumbo-ID: 7a61aa24-8caa-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729184664; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FGaplFOEg0rWI0UwXkCA+tRto+W1AeKjKp/IK1sImY8OaZ0tt2Hwb3CBRrNcwNVSewTgRHEPOPlRZFPQOswlI+1dYOfuxLrEw6PMzvJZsYhV3TDfsOIEq9pxwprgNN2P8NLChp7FSWcHs0+bdZ6xyEd9Ljm+asRWKTH/Eqmo2A8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184664; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=t8mwfgj0+AG9djRszVKShE80Ero/zF+/yhs316UwKJo=; 
	b=WauNIwkoJRLSMZUi9LAolyhJZfXfdMN1GuLam2sWYVV4151l5t33HuKcCNqIdgohaiwEJ6OEW6DjjJZUBclRbNC6ucxcH7u7HQZsGU3rdmgBWuHT8X9/Ebo4m9EBG2uoto6W06+FLiZOuFcv51LblVaYTNfyCV0CKiFDt6klqrc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184664;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=t8mwfgj0+AG9djRszVKShE80Ero/zF+/yhs316UwKJo=;
	b=V/XPjZlOPZgdAHyA7bfz3i0WTSD1qZbB+lW7Mi6BUdIyPL8JTejU6Ixn8DiCqQxW
	Nq6v5VZ8gQZfDhceAcmaSmSaq8g6yIMr+YkjrA820OeUKHtaWugOxLvPXze+TRJHhHP
	y3d1OCR2oN89UagNAVviywYA7jmq0z/iwLBWphB4=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 37/44] x86/boot: remove mod from struct boot_module
Date: Thu, 17 Oct 2024 13:03:17 -0400
Message-Id: <20241017170325.3842-38-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

With all references to mod field removed, remove the mod field from struct
boot_module.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/include/asm/bootinfo.h | 3 ---
 xen/arch/x86/setup.c                | 2 --
 2 files changed, 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 24c2f37c7b11..b65b55c0a2c2 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -8,7 +8,6 @@
 #ifndef __XEN_X86_BOOTINFO_H__
 #define __XEN_X86_BOOTINFO_H__
 
-#include <xen/multiboot.h>
 #include <xen/types.h>
 
 /* Max number of boot modules a bootloader can provide in addition to Xen */
@@ -25,8 +24,6 @@ enum bootmod_type {
 };
 
 struct boot_module {
-    /* Transitionary only */
-    module_t *mod;
     /*
      * A boot module may contain a compressed kernel that will require
      * additional space, before the module data, into which the kernel will be
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 5ae82f3abcb5..ae027667eb82 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -308,8 +308,6 @@ static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
      */
     for ( i = 0; i <= bi->nr_modules; i++ )
     {
-        bi->mods[i].mod = &mods[i];
-
         bi->mods[i].cmdline = (paddr_t)mods[i].string;
 
         bi->mods[i].start = (paddr_t)mods[i].mod_start;
-- 
2.30.2


