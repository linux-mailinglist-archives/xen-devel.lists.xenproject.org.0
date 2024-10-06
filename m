Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 082FF9921D5
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:56:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811367.1224025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZEr-00042q-BS; Sun, 06 Oct 2024 21:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811367.1224025; Sun, 06 Oct 2024 21:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZEr-0003u9-72; Sun, 06 Oct 2024 21:56:29 +0000
Received: by outflank-mailman (input) for mailman id 811367;
 Sun, 06 Oct 2024 21:56:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZ9s-00051E-35
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:51:20 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d3ccea8-842d-11ef-99a2-01e77a169b0f;
 Sun, 06 Oct 2024 23:51:18 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251413620237.5379180699381;
 Sun, 6 Oct 2024 14:50:13 -0700 (PDT)
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
X-Inumbo-ID: 1d3ccea8-842d-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728251415; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LiTgnBWASsbRJ8trdYADGK6vgq6juSZECEm8QjL9CDCtsvxz3LF86FQ8sUdvGT3bffF6845ZEo6iQiSQF9G5g8e9a+i7jzo7aIDtWH5uZOxXfU3Pg2by6fxL7CZfnsaxyW5E5jhI74mct83KbwE0mTZINsh2FuXxfMgj/h6TtYQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251415; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=o7PLHsPZ6nr6p3qDw0hUE5j4XeSnSAA6iUDaBG5Wocg=; 
	b=MrrEi9TDekN30wVsKVzFUkfCSsekkzZpdQ4bQZB4WSxsTIrRqBlAcG1K+ASmSKn85Au1EE+5EyhhVyBtQIVaovvB+gdGH3emmGUrW3n9XaLzIwwIkQZgWmR/p1+qbe5Kp4NDKW2S1Oh/Oxmcp/tP0Jaeo0UO0jQDkChqGTunFzE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251415;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=o7PLHsPZ6nr6p3qDw0hUE5j4XeSnSAA6iUDaBG5Wocg=;
	b=GAcHTe3bsDi165kmB/hCP67EykYZBMdvJn5U7gNPgSZvkhsgO6U+QQ+565c6FhCv
	5O871ak0iktwez3LxxlfDP2JRd2HAyfnshVeovv8qB1NZ6wKS7DGxzHBCw/fhya1bl/
	hscw1eI5f2aYZGxPiH3cmlQvWIkeao7BN+4fC4fo=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 08/44] x86/boot: convert setup.c mod refs to early_mod
Date: Sun,  6 Oct 2024 17:49:19 -0400
Message-Id: <20241006214956.24339-9-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

To allow a slow conversion of x86 over to struct boot_module, start with
replacing all references to struct mod to the early_mod element of struct
boot_module. These serves twofold, first to allow the incremental transition
from struct mod fields to struct boot_module fields. The second is to allow
the conversion of function definitions from taking struct mod parameters to
accepting struct boot_module as needed when a transitioned field will be
accessed.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/setup.c | 61 ++++++++++++++++++++++++--------------------
 1 file changed, 34 insertions(+), 27 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index dd82ca3d43e2..ba4bee6b93af 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1341,15 +1341,15 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     set_kexec_crash_area_size((u64)nr_pages << PAGE_SHIFT);
     kexec_reserve_area();
 
-    initial_images = mod;
+    initial_images = bi->mods[0].mod;
 
     for ( i = 0; !efi_enabled(EFI_LOADER) && i < bi->nr_modules; i++ )
     {
-        if ( mod[i].mod_start & (PAGE_SIZE - 1) )
+        if ( bi->mods[i].mod->mod_start & (PAGE_SIZE - 1) )
             panic("Bootloader didn't honor module alignment request\n");
-        mod[i].mod_end -= mod[i].mod_start;
-        mod[i].mod_start >>= PAGE_SHIFT;
-        mod[i].reserved = 0;
+        bi->mods[i].mod->mod_end -= bi->mods[i].mod->mod_start;
+        bi->mods[i].mod->mod_start >>= PAGE_SHIFT;
+        bi->mods[i].mod->reserved = 0;
     }
 
     /*
@@ -1360,6 +1360,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     if ( xen_phys_start )
     {
+        unsigned int xen = bi->nr_modules;
         relocated = true;
 
         /*
@@ -1367,8 +1368,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
          * respective reserve_e820_ram() invocation below. No need to
          * query efi_boot_mem_unused() here, though.
          */
-        mod[bi->nr_modules].mod_start = virt_to_mfn(_stext);
-        mod[bi->nr_modules].mod_end = __2M_rwdata_end - _stext;
+        bi->mods[xen].mod->mod_start = virt_to_mfn(_stext);
+        bi->mods[xen].mod->mod_end = __2M_rwdata_end - _stext;
     }
 
     bi->mods[0].headroom =
@@ -1462,9 +1463,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
             struct boot_module *bm = &bi->mods[j];
             unsigned long size;
 
-            size = PAGE_ALIGN(bm->headroom + mod[j].mod_end);
+            size = PAGE_ALIGN(bm->headroom + bm->mod->mod_end);
 
-            if ( mod[j].reserved )
+            if ( bi->mods[j].mod->reserved )
                 continue;
 
             /* Don't overlap with other modules (or Xen itself). */
@@ -1476,14 +1477,14 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
             if ( s < end &&
                  (bm->headroom ||
-                  ((end - size) >> PAGE_SHIFT) > mod[j].mod_start) )
+                  ((end - size) >> PAGE_SHIFT) > bm->mod->mod_start) )
             {
                 move_memory(end - size + bm->headroom,
-                            (uint64_t)mod[j].mod_start << PAGE_SHIFT,
-                            mod[j].mod_end);
-                mod[j].mod_start = (end - size) >> PAGE_SHIFT;
-                mod[j].mod_end += bm->headroom;
-                mod[j].reserved = 1;
+                            (uint64_t)bm->mod->mod_start << PAGE_SHIFT,
+                            bm->mod->mod_end);
+                bm->mod->mod_start = (end - size) >> PAGE_SHIFT;
+                bm->mod->mod_end += bm->headroom;
+                bm->mod->reserved = 1;
             }
         }
 
@@ -1509,13 +1510,15 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 #endif
     }
 
-    if ( bi->mods[0].headroom && !mod->reserved )
+    if ( bi->mods[0].headroom && !bi->mods[0].mod->reserved )
         panic("Not enough memory to relocate the dom0 kernel image\n");
     for ( i = 0; i < bi->nr_modules; ++i )
     {
-        uint64_t s = (uint64_t)mod[i].mod_start << PAGE_SHIFT;
+        uint64_t s = (uint64_t)bi->mods[i].mod->mod_start
+                        << PAGE_SHIFT;
 
-        reserve_e820_ram(&boot_e820, s, s + PAGE_ALIGN(mod[i].mod_end));
+        reserve_e820_ram(&boot_e820, s,
+                         s + PAGE_ALIGN(bi->mods[i].mod->mod_end));
     }
 
     if ( !xen_phys_start )
@@ -1593,8 +1596,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
                 map_e = boot_e820.map[j].addr + boot_e820.map[j].size;
                 for ( j = 0; j < bi->nr_modules; ++j )
                 {
-                    uint64_t end = pfn_to_paddr(mod[j].mod_start) +
-                                   mod[j].mod_end;
+                    uint64_t end = pfn_to_paddr(
+                                   bi->mods[j].mod->mod_start) +
+                                   bi->mods[j].mod->mod_end;
 
                     if ( map_e < end )
                         map_e = end;
@@ -1668,11 +1672,13 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     for ( i = 0; i < bi->nr_modules; ++i )
     {
-        set_pdx_range(mod[i].mod_start,
-                      mod[i].mod_start + PFN_UP(mod[i].mod_end));
-        map_pages_to_xen((unsigned long)mfn_to_virt(mod[i].mod_start),
-                         _mfn(mod[i].mod_start),
-                         PFN_UP(mod[i].mod_end), PAGE_HYPERVISOR);
+        set_pdx_range(bi->mods[i].mod->mod_start,
+                      bi->mods[i].mod->mod_start +
+                      PFN_UP(bi->mods[i].mod->mod_end));
+        map_pages_to_xen(
+            (unsigned long)mfn_to_virt(bi->mods[i].mod->mod_start),
+            _mfn(bi->mods[i].mod->mod_start),
+            PFN_UP(bi->mods[i].mod->mod_end), PAGE_HYPERVISOR);
     }
 
 #ifdef CONFIG_KEXEC
@@ -2061,8 +2067,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
-    dom0 = create_dom0(mod, bi->mods[0].headroom,
-                       initrdidx < bi->nr_modules ? mod + initrdidx : NULL,
+    dom0 = create_dom0(bi->mods[0].mod, bi->mods[0].headroom,
+                       initrdidx < bi->nr_modules ?
+                            bi->mods[initrdidx].mod : NULL,
                        kextra, bi->loader);
     if ( !dom0 )
         panic("Could not set up DOM0 guest OS\n");
-- 
2.30.2


