Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3E09A583D
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:47:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822880.1236804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gZY-0008Ul-Lt; Mon, 21 Oct 2024 00:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822880.1236804; Mon, 21 Oct 2024 00:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gZY-0008S6-IW; Mon, 21 Oct 2024 00:47:00 +0000
Received: by outflank-mailman (input) for mailman id 822880;
 Mon, 21 Oct 2024 00:46:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gZW-000738-OH
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:46:58 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f90525c6-8f45-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 02:46:58 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471588434168.99853711437606;
 Sun, 20 Oct 2024 17:46:28 -0700 (PDT)
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
X-Inumbo-ID: f90525c6-8f45-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729471589; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BXZsbouImeuGsUjuRGIu2CdEllsZmH12CZS4CxQ4p+IRXDXTbjcX1V5IXGcNms8RBImFHrNMksLu7oCNu+DmQonnx8aklfJyexKUAWJ23ipDlJJGygGGuH/oqRrc2w5L8yIBDO3obY+g9/FQt9E87DHTbT05aOaR8agKZwwbh8k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471589; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0hf/GPWorDxYmQn+gugUE/WDMvvSA827DeL6H9WXctU=; 
	b=RJlHBziQUaOFTrEREf8DjJ8jz52wdMkS88PSomo/hbXZ/K0ON3ohMarJUtXR3jdGnkWf9MtfIlS2lj2IbzXdkE7k0odZu14GXtORhRRwANl4ddOrzBTBqSyYIQunTA3D4RFp9eV1wjMLliVDwgkzRkIIGsPimY0rUwNFUsUENHk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471589;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=0hf/GPWorDxYmQn+gugUE/WDMvvSA827DeL6H9WXctU=;
	b=eFGrbTJAYWMY95Rdi5DkjzkE8UI8f3HGYTgT1NhY7lau/bZByvUgTl5X87SsX96v
	9sRzLazkd6dL10ikAh98SlqpJskgmWqOdTnOqr+l6mqq09Iy55j2KO+BkOTHXpiacNH
	YfBPrI6cwK05wYtMvZKj8tHjW9eQ+dGeyIltbjaY=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 04/38] x86/boot: convert mod refs to boot_module mod
Date: Sun, 20 Oct 2024 20:45:39 -0400
Message-Id: <20241021004613.18793-5-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

To allow a slow conversion of x86 over to struct boot_module, start with
replacing all references to module_t mod, only in setup.c, to the mod element
of struct boot_module. These serves twofold, first to allow the incremental
transition from module_t fields to struct boot_module fields. The second is to
allow the conversion of function definitions from taking module_t parameters to
accepting struct boot_module as needed when a transitioned field will be
accessed.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v6:
- code style
- switched to a local ref

Changes since v5:
- rewrote commit message
- coding style changes
- added comment for initial_images assignment
---
 xen/arch/x86/setup.c | 62 +++++++++++++++++++++++++-------------------
 1 file changed, 35 insertions(+), 27 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 48809aa94451..b6d688f8fe5e 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1364,15 +1364,19 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     set_kexec_crash_area_size((u64)nr_pages << PAGE_SHIFT);
     kexec_reserve_area();
 
-    initial_images = mod;
+    /*
+     * The field bi->mods[0].mod points to the first element of the module_t
+     * array.
+     */
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
@@ -1383,6 +1387,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     if ( xen_phys_start )
     {
+        unsigned int xen = bi->nr_modules;
         relocated = true;
 
         /*
@@ -1390,8 +1395,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
          * respective reserve_e820_ram() invocation below. No need to
          * query efi_boot_mem_unused() here, though.
          */
-        mod[bi->nr_modules].mod_start = virt_to_mfn(_stext);
-        mod[bi->nr_modules].mod_end = __2M_rwdata_end - _stext;
+        bi->mods[xen].mod->mod_start = virt_to_mfn(_stext);
+        bi->mods[xen].mod->mod_end = __2M_rwdata_end - _stext;
     }
 
     bi->mods[0].headroom =
@@ -1483,9 +1488,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
              * move mod[0], we incorporate this as extra space at the start.
              */
             struct boot_module *bm = &bi->mods[j];
-            unsigned long size = PAGE_ALIGN(bm->headroom + mod[j].mod_end);
+            unsigned long size = PAGE_ALIGN(bm->headroom + bm->mod->mod_end);
 
-            if ( mod[j].reserved )
+            if ( bm->mod->reserved )
                 continue;
 
             /* Don't overlap with other modules (or Xen itself). */
@@ -1497,14 +1502,14 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
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
 
@@ -1530,13 +1535,14 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 #endif
     }
 
-    if ( bi->mods[0].headroom && !mod->reserved )
+    if ( bi->mods[0].headroom && !bi->mods[0].mod->reserved )
         panic("Not enough memory to relocate the dom0 kernel image\n");
     for ( i = 0; i < bi->nr_modules; ++i )
     {
-        uint64_t s = (uint64_t)mod[i].mod_start << PAGE_SHIFT;
+        uint64_t s = (uint64_t)bi->mods[i].mod->mod_start << PAGE_SHIFT;
 
-        reserve_e820_ram(&boot_e820, s, s + PAGE_ALIGN(mod[i].mod_end));
+        reserve_e820_ram(&boot_e820, s,
+                         s + PAGE_ALIGN(bi->mods[i].mod->mod_end));
     }
 
     if ( !xen_phys_start )
@@ -1614,8 +1620,8 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
                 map_e = boot_e820.map[j].addr + boot_e820.map[j].size;
                 for ( j = 0; j < bi->nr_modules; ++j )
                 {
-                    uint64_t end = pfn_to_paddr(mod[j].mod_start) +
-                                   mod[j].mod_end;
+                    uint64_t end = pfn_to_paddr(bi->mods[j].mod->mod_start) +
+                                   bi->mods[j].mod->mod_end;
 
                     if ( map_e < end )
                         map_e = end;
@@ -1689,11 +1695,12 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     for ( i = 0; i < bi->nr_modules; ++i )
     {
-        set_pdx_range(mod[i].mod_start,
-                      mod[i].mod_start + PFN_UP(mod[i].mod_end));
-        map_pages_to_xen((unsigned long)mfn_to_virt(mod[i].mod_start),
-                         _mfn(mod[i].mod_start),
-                         PFN_UP(mod[i].mod_end), PAGE_HYPERVISOR);
+        set_pdx_range(bi->mods[i].mod->mod_start,
+                      bi->mods[i].mod->mod_start +
+                          PFN_UP(bi->mods[i].mod->mod_end));
+        map_pages_to_xen((unsigned long)mfn_to_virt(bi->mods[i].mod->mod_start),
+                         _mfn(bi->mods[i].mod->mod_start),
+                         PFN_UP(bi->mods[i].mod->mod_end), PAGE_HYPERVISOR);
     }
 
 #ifdef CONFIG_KEXEC
@@ -2082,8 +2089,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
-    dom0 = create_dom0(mod, bi->mods[0].headroom,
-                       initrdidx < bi->nr_modules ? mod + initrdidx : NULL,
+    dom0 = create_dom0(bi->mods[0].mod, bi->mods[0].headroom,
+                       initrdidx < bi->nr_modules ? bi->mods[initrdidx].mod
+                                                  : NULL,
                        kextra, bi->loader);
     if ( !dom0 )
         panic("Could not set up DOM0 guest OS\n");
-- 
2.30.2


