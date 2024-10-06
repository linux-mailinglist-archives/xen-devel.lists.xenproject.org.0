Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7588D9921E6
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:57:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811408.1224206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFg-0004iI-9a; Sun, 06 Oct 2024 21:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811408.1224206; Sun, 06 Oct 2024 21:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZFf-0004cu-W5; Sun, 06 Oct 2024 21:57:19 +0000
Received: by outflank-mailman (input) for mailman id 811408;
 Sun, 06 Oct 2024 21:57:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZDJ-0007Zk-44
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:54:53 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ca37c2f-842d-11ef-a0bb-8be0dac302b0;
 Sun, 06 Oct 2024 23:54:52 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251446148991.8497668397073;
 Sun, 6 Oct 2024 14:50:46 -0700 (PDT)
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
X-Inumbo-ID: 9ca37c2f-842d-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728251448; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bNsgLn464aZeuv+ZYClJOH6gMVQinmTHfCyGViv40l3gEDafLIMtfgqdqgN/DawipepLWEFW0FV2lgaxh8FeuAKm+VGGeBCMD65VnDQ5vcj8CApG2kJgyd1G9ifizG0/DQkNQT6yJql8pYZbShWisn0kMO6t5WJCa1Htf0qgMJM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251448; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Jb2nZ+7HGkVeAJRXjrn8aAVl9GUxbiL1jFANEJYgSG0=; 
	b=g6cY5WkxXGcd7j5EbuC/Rlr5LpL7EXLdZ32PbuOjleyn1VHGQXGiKJ962CO9TaCho37OxeK1LdPmHdmNFxCMQ787sTW+96480Oset+KOxyH9XYnx7SoGXmqcVNQzSf9qY5EosmDlzFqCO4kQeEhilO1W9DSfPHpAGHM3RkK2+gY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251448;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Jb2nZ+7HGkVeAJRXjrn8aAVl9GUxbiL1jFANEJYgSG0=;
	b=fOWMkwhJlAAN6/oEmr96AMyxsKJnAOW0ssiGpmOniLF4SUUL7I7YWecBA0qtujvi
	ZYjxTlbSw5GAkOCigotOE1Wo2JggQD5V2X8ERk5CP5w2m0FJgjgy6eY386EUGnR7Ch+
	M31SmCeXKYz9cBd83tuM/1b+MxcALz+xKk6+dqqk=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 36/44] x86/boot: remove remaining early_mod references
Date: Sun,  6 Oct 2024 17:49:47 -0400
Message-Id: <20241006214956.24339-37-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Any direct usages of struct mod have been transitioned, remove the remaining
references to early_mod fields.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/setup.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index e9e3da3204f1..0ffe8d3ff8dd 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -334,9 +334,8 @@ unsigned long __init initial_images_nrpages(nodeid_t node)
 
     for ( nr = i = 0; i < bi->nr_modules; ++i )
     {
-        unsigned long start = bi->mods[i].mod->mod_start;
-        unsigned long end = start +
-                            PFN_UP(bi->mods[i].mod->mod_end);
+        unsigned long start = bi->mods[i].start;
+        unsigned long end = start + PFN_UP(bi->mods[i].size);
 
         if ( end > node_start && node_end > start )
             nr += min(node_end, end) - max(node_start, start);
@@ -664,8 +663,8 @@ static uint64_t __init consider_modules(
 
     for ( i = 0; i < nr_mods ; ++i )
     {
-        uint64_t start = (uint64_t)pfn_to_paddr(mods[i].mod->mod_start);
-        uint64_t end = start + PAGE_ALIGN(mods[i].mod->mod_end);
+        uint64_t start = (uint64_t)mods[i].start;
+        uint64_t end = start + PAGE_ALIGN(mods[i].size);
 
         if ( i == this_mod )
             continue;
@@ -1380,10 +1379,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     for ( i = 0; !efi_enabled(EFI_LOADER) && i < bi->nr_modules; i++ )
     {
-        if ( bi->mods[i].mod->mod_start & (PAGE_SIZE - 1) )
+        if ( bi->mods[i].start & (PAGE_SIZE - 1) )
             panic("Bootloader didn't honor module alignment request\n");
-        bi->mods[i].mod->mod_end -= bi->mods[i].mod->mod_start;
-        bi->mods[i].mod->mod_start >>= PAGE_SHIFT;
     }
 
     /*
@@ -1404,16 +1401,12 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
          */
         bi->mods[xen].start = virt_to_mfn(_stext);
         bi->mods[xen].size = __2M_rwdata_end - _stext;
-
-        bi->mods[xen].mod->mod_start = bi->mods[xen].start;
-        bi->mods[xen].mod->mod_end = bi->mods[xen].size;
     }
 
-    bi->mods[0].headroom =
-        bzimage_headroom(bootstrap_map(bi->mods[0].mod),
-                         bi->mods[0].mod->mod_end);
-
-    bootstrap_map(NULL);
+    bi->mods[0].headroom = bzimage_headroom(
+                        bootstrap_map_bm(&bi->mods[0]),
+                        bi->mods[0].size);
+    bootstrap_map_bm(NULL);
 
 #ifndef highmem_start
     /* Don't allow split below 4Gb. */
@@ -1518,9 +1511,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
             {
                 move_memory(end - size + bm->headroom, bm->start, bm->size);
                 bm->start = (end - size);
-                bm->mod->mod_start = paddr_to_pfn(bm->start);
                 bm->size += bm->headroom;
-                bm->mod->mod_end = bm->size;
                 bm->flags |= BOOTMOD_FLAG_X86_RELOCATED;
             }
         }
@@ -1708,8 +1699,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     for ( i = 0; i < bi->nr_modules; ++i )
     {
-        set_pdx_range(paddr_to_pfn(bi->mods[i].mod->mod_start),
-                      paddr_to_pfn(bi->mods[i].mod->mod_start) +
+        set_pdx_range(paddr_to_pfn(bi->mods[i].start),
+                      paddr_to_pfn(bi->mods[i].start) +
                       PFN_UP(bi->mods[i].size));
         map_pages_to_xen(
             (unsigned long)maddr_to_virt(bi->mods[i].start),
-- 
2.30.2


