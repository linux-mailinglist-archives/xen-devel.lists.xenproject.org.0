Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2790A966B82
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:48:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786680.1196328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9U7-0007qB-Jy; Fri, 30 Aug 2024 21:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786680.1196328; Fri, 30 Aug 2024 21:48:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9U7-0007mX-Gj; Fri, 30 Aug 2024 21:48:47 +0000
Received: by outflank-mailman (input) for mailman id 786680;
 Fri, 30 Aug 2024 21:48:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9U5-00065G-RD
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:48:45 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a038ab1a-6719-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 23:48:44 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 172505446851348.39122552142521;
 Fri, 30 Aug 2024 14:47:48 -0700 (PDT)
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
X-Inumbo-ID: a038ab1a-6719-11ef-a0b1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1725054470; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ETp14un5/oRlpw59XDSha+sLCsPX7dzvMDm6v/B7GqUW/ai3XLcyLu9VlqpQz0FLlPwTAMuR31saMVgpnMG7tGcTffPRfVYvbl0HdiqMRONVF3bViygDQjaiS5UkH6VGz3EaAbBz42ueYxMvhbD8EnY1GSK1/FBJjZ/Wf0X4Giw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054470; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bHmAH7Z09uDCvq9Lv4ibJKqcWjY/D6qrWQ62O+CCfoc=; 
	b=hy/WDeoEtxLbSTVg1Y/K8RabOYXbLJTQs5snF3J8mwJtPiQrZYi85HgcKfyqJVQzEY80BD03AbuFnKxVozodPxvEDhSWeDf1jVFW1eo4erv4sBYU7tM3TlLHqjqaQ0Ymk8XTrng8ZPln9aLN8FUbB7rKZUYf0BZVVn0r1HK3IMY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054470;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=bHmAH7Z09uDCvq9Lv4ibJKqcWjY/D6qrWQ62O+CCfoc=;
	b=vWIFzzwO5EKR5BbYzso1Z775SxcdDEpJVFG4Jllb+38PeR2RIWaO8nofWBvRSmQV
	LXeJL5myJc/YX+175AdpzdModS4G4fpDYGvAon/4d9gClKDo/bxCWd8QhoevMIuYYJi
	4ZnIM2bZg8v5wfOHJtX31khvPjxBKqUasTk7ZzhE=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 08/44] x86/boot: convert setup.c mod refs to early_mod
Date: Fri, 30 Aug 2024 17:46:53 -0400
Message-Id: <20240830214730.1621-9-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

To allow a slow conversion of x86 over to struct boot_module, start with
replacing all references to struct mod to the early_mod element of struct
boot_module. These serves twofold, first to allow the incremental transition
from struct mod fields to struct boot_module fields.  The second is to allow
the conversion of function definitions from taking struct mod parameters to
accepting struct boot_module as needed when a transitioned field will be
accessed.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/setup.c | 61 ++++++++++++++++++++++++--------------------
 1 file changed, 34 insertions(+), 27 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index fd6cc7fac907..82a4375683d2 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1360,15 +1360,15 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     set_kexec_crash_area_size((u64)nr_pages << PAGE_SHIFT);
     kexec_reserve_area();
 
-    initial_images = mod;
+    initial_images = boot_info->mods[0].early_mod;
 
     for ( i = 0; !efi_enabled(EFI_LOADER) && i < boot_info->nr_mods; i++ )
     {
-        if ( mod[i].mod_start & (PAGE_SIZE - 1) )
+        if ( boot_info->mods[i].early_mod->mod_start & (PAGE_SIZE - 1) )
             panic("Bootloader didn't honor module alignment request\n");
-        mod[i].mod_end -= mod[i].mod_start;
-        mod[i].mod_start >>= PAGE_SHIFT;
-        mod[i].reserved = 0;
+        boot_info->mods[i].early_mod->mod_end -= boot_info->mods[i].early_mod->mod_start;
+        boot_info->mods[i].early_mod->mod_start >>= PAGE_SHIFT;
+        boot_info->mods[i].early_mod->reserved = 0;
     }
 
     /*
@@ -1379,6 +1379,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     if ( xen_phys_start )
     {
+        int idx = boot_info->nr_mods;
         relocated = true;
 
         /*
@@ -1386,8 +1387,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
          * respective reserve_e820_ram() invocation below. No need to
          * query efi_boot_mem_unused() here, though.
          */
-        mod[boot_info->nr_mods].mod_start = virt_to_mfn(_stext);
-        mod[boot_info->nr_mods].mod_end = __2M_rwdata_end - _stext;
+        boot_info->mods[idx].early_mod->mod_start = virt_to_mfn(_stext);
+        boot_info->mods[idx].early_mod->mod_end = __2M_rwdata_end - _stext;
     }
 
     boot_info->mods[0].headroom = bzimage_headroom(
@@ -1480,9 +1481,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
             struct boot_module *bm = &boot_info->mods[j];
             unsigned long size;
 
-            size = PAGE_ALIGN(bm->headroom + mod[j].mod_end);
+            size = PAGE_ALIGN(bm->headroom + bm->early_mod->mod_end);
 
-            if ( mod[j].reserved )
+            if ( boot_info->mods[j].early_mod->reserved )
                 continue;
 
             /* Don't overlap with other modules (or Xen itself). */
@@ -1494,14 +1495,14 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
             if ( s < end &&
                  (bm->headroom ||
-                  ((end - size) >> PAGE_SHIFT) > mod[j].mod_start) )
+                  ((end - size) >> PAGE_SHIFT) > bm->early_mod->mod_start) )
             {
                 move_memory(end - size + bm->headroom,
-                            (uint64_t)mod[j].mod_start << PAGE_SHIFT,
-                            mod[j].mod_end);
-                mod[j].mod_start = (end - size) >> PAGE_SHIFT;
-                mod[j].mod_end += bm->headroom;
-                mod[j].reserved = 1;
+                            (uint64_t)bm->early_mod->mod_start << PAGE_SHIFT,
+                            bm->early_mod->mod_end);
+                bm->early_mod->mod_start = (end - size) >> PAGE_SHIFT;
+                bm->early_mod->mod_end += bm->headroom;
+                bm->early_mod->reserved = 1;
             }
         }
 
@@ -1527,13 +1528,15 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 #endif
     }
 
-    if ( boot_info->mods[0].headroom && !mod->reserved )
+    if ( boot_info->mods[0].headroom && !boot_info->mods[0].early_mod->reserved )
         panic("Not enough memory to relocate the dom0 kernel image\n");
     for ( i = 0; i < boot_info->nr_mods; ++i )
     {
-        uint64_t s = (uint64_t)mod[i].mod_start << PAGE_SHIFT;
+        uint64_t s = (uint64_t)boot_info->mods[i].early_mod->mod_start
+                        << PAGE_SHIFT;
 
-        reserve_e820_ram(&boot_e820, s, s + PAGE_ALIGN(mod[i].mod_end));
+        reserve_e820_ram(&boot_e820, s,
+                         s + PAGE_ALIGN(boot_info->mods[i].early_mod->mod_end));
     }
 
     if ( !xen_phys_start )
@@ -1611,8 +1614,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
                 map_e = boot_e820.map[j].addr + boot_e820.map[j].size;
                 for ( j = 0; j < boot_info->nr_mods; ++j )
                 {
-                    uint64_t end = pfn_to_paddr(mod[j].mod_start) +
-                                   mod[j].mod_end;
+                    uint64_t end = pfn_to_paddr(
+                                   boot_info->mods[j].early_mod->mod_start) +
+                                   boot_info->mods[j].early_mod->mod_end;
 
                     if ( map_e < end )
                         map_e = end;
@@ -1686,11 +1690,13 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     for ( i = 0; i < boot_info->nr_mods; ++i )
     {
-        set_pdx_range(mod[i].mod_start,
-                      mod[i].mod_start + PFN_UP(mod[i].mod_end));
-        map_pages_to_xen((unsigned long)mfn_to_virt(mod[i].mod_start),
-                         _mfn(mod[i].mod_start),
-                         PFN_UP(mod[i].mod_end), PAGE_HYPERVISOR);
+        set_pdx_range(boot_info->mods[i].early_mod->mod_start,
+                      boot_info->mods[i].early_mod->mod_start +
+                      PFN_UP(boot_info->mods[i].early_mod->mod_end));
+        map_pages_to_xen(
+            (unsigned long)mfn_to_virt(boot_info->mods[i].early_mod->mod_start),
+            _mfn(boot_info->mods[i].early_mod->mod_start),
+            PFN_UP(boot_info->mods[i].early_mod->mod_end), PAGE_HYPERVISOR);
     }
 
 #ifdef CONFIG_KEXEC
@@ -2081,8 +2087,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
-    dom0 = create_dom0(mod, boot_info->mods[0].headroom,
-                       initrdidx < boot_info->nr_mods ? mod + initrdidx : NULL,
+    dom0 = create_dom0(boot_info->mods[0].early_mod, boot_info->mods[0].headroom,
+                       initrdidx < boot_info->nr_mods ?
+                            boot_info->mods[initrdidx].early_mod : NULL,
                        kextra, boot_info->boot_loader_name);
     if ( !dom0 )
         panic("Could not set up DOM0 guest OS\n");
-- 
2.30.2


