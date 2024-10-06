Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D91FD9921E0
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:57:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811389.1224129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFJ-0000hp-U2; Sun, 06 Oct 2024 21:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811389.1224129; Sun, 06 Oct 2024 21:56:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFJ-0000bL-OS; Sun, 06 Oct 2024 21:56:57 +0000
Received: by outflank-mailman (input) for mailman id 811389;
 Sun, 06 Oct 2024 21:56:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZDQ-0007Zk-VL
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:55:00 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a12a7fa3-842d-11ef-a0bb-8be0dac302b0;
 Sun, 06 Oct 2024 23:55:00 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 17282514472961014.7196473903033;
 Sun, 6 Oct 2024 14:50:47 -0700 (PDT)
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
X-Inumbo-ID: a12a7fa3-842d-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728251449; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Tsr6VNSaivJn2RLAfxpVSkPx/nM5xLWUJFWjCrYQTTA4BI6Jau0ib6xyH2CBI4qDtAqbHA+WdEaSQPAbP/AKNOOtgpGc56uFguoezQIPvivjyxpa0pgZB3UUZMDoOzET+SJBu0s+o1dcyLcHULR9fJN9wpNbl1lRYvDd9NK/vco=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251449; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=I5+jMetwK1mnjWjlCDImNyJTFTfOMPbGyVjb5LEAn64=; 
	b=CNE0X4BFUE8QnHnQyqlJmbbSZcDymhMnhDNqq4HQyIu4/BN6NSx201islFhmH7ILwh+BGkDeZi8KI0sMilDzXHB0FzEXzso8vWPFRK9ShXG2hM5/OMsaB1N6RatzMgl9EkncAtX0bd/ISxpKSb/yWEGBLIVq/u3jpCEOcepz93A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251449;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=I5+jMetwK1mnjWjlCDImNyJTFTfOMPbGyVjb5LEAn64=;
	b=WNKRC8v2MtqnWGSRRDumROkzc92d0lE+p6b77ZCKnZ5gij9wVdLWTVkpLbWW6mDC
	YB3qOsF1g3mMUgwNDSTE+RB+lXCFeHUTlrZ212xgsKB9EqlNohHjt6VF3rheFPn4jbB
	wtv+gZeslGCg3UkGVjtypudDCc5R5kfn8iddhxCE=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 37/44] x86/boot: remove mod from struct boot_module
Date: Sun,  6 Oct 2024 17:49:48 -0400
Message-Id: <20241006214956.24339-38-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

With all references to mod field removed, remove the mod field from struct
boot_module.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootinfo.h | 3 ---
 xen/arch/x86/setup.c                | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 3b6bfbe88770..4cb722e8ba0a 100644
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
      * A boot module may contain a compressed kernel that Xen will need space
      * reserved, into which it will be decompressed.
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 0ffe8d3ff8dd..3604c8fbe40a 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -308,8 +308,6 @@ static struct boot_info __init *multiboot_fill_boot_info(unsigned long mbi_p)
      */
     for ( i = 0; i <= bi->nr_modules; i++ )
     {
-        bi->mods[i].mod = &mods[i];
-
         bi->mods[i].cmdline = (char *)(paddr_t)mods[i].string;
 
         bi->mods[i].start = (paddr_t)mods[i].mod_start;
@@ -319,7 +317,6 @@ static struct boot_info __init *multiboot_fill_boot_info(unsigned long mbi_p)
     /* map the last mb module for xen entry */
     bi->mods[bi->nr_modules].type = BOOTMOD_XEN;
     bi->mods[bi->nr_modules].flags |= BOOTMOD_FLAG_X86_CONSUMED;
-    bi->mods[bi->nr_modules].mod = &mods[bi->nr_modules];
 
     return bi;
 }
-- 
2.30.2


