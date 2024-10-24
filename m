Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8506F9AE8A0
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 16:27:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825351.1239599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3ynt-0005SG-4B; Thu, 24 Oct 2024 14:27:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825351.1239599; Thu, 24 Oct 2024 14:27:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3ynt-0005O8-0U; Thu, 24 Oct 2024 14:27:09 +0000
Received: by outflank-mailman (input) for mailman id 825351;
 Thu, 24 Oct 2024 14:27:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd6X=RU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3ynr-00048O-4m
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 14:27:07 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0afba90a-9214-11ef-99a3-01e77a169b0f;
 Thu, 24 Oct 2024 16:27:05 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c957d8bce2so510635a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 07:27:05 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c6b4e4sm5707409a12.61.2024.10.24.07.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 07:27:02 -0700 (PDT)
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
X-Inumbo-ID: 0afba90a-9214-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729780024; x=1730384824; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkGTFmIsU8uVl1vUxZAmxH9TN/jWgRT2CVKi7nypqKo=;
        b=kgCXbykcUw0gGRmGf6wSTmo6C8NZE0lXcwCsNn152Yv73OQOZPXePPzrhWNZ+VwzSu
         NPaM8x9oZeJj8Y5CPul11qgxwuEXzn3SKMq9POt8PD6ZhoRGN+OPRqakBw1iIxlGdiID
         jtM1jHs28nZv8Wu5AzLqgCsqTSlnxc9IX61fE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729780024; x=1730384824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkGTFmIsU8uVl1vUxZAmxH9TN/jWgRT2CVKi7nypqKo=;
        b=xVZD//rXhOc5H6Cu2Rfe+fujad2e2VGSjGe9hhpUct9RTytClrOOYhY1gOmgCjM8tP
         1WW/ai3nUQcHHsBPMyQMeNMIJD+3K3i7pl4KZsip8KNBAUJfsEEvqnP+vh5qe5AJbQ9q
         fBpGdZu7kuNmRKqGbioIn/MDrDMe2B/l6B2GPxczKxNaIhkyPoB1RUy84TUBtH3JB9Iq
         VGfRLpkGbECV0hYwUWVOhFsRw1bcm603ynZf9OtV8bPmZS5Aj07BFecl0U/59SPCWn1c
         ebncySXJBxmA2b/Z4wW8BAzWSxGbnhICmMwI47bxCQXWJILHoJ+kAtl+Ua0FaSrcFh0o
         D10A==
X-Gm-Message-State: AOJu0YyEeSaPXcSnBIqAlnOiUiIjqJsLnqv6Ggn2CcJRPO+IkgQvuXrY
	HXh+tI7roz+ch8srdJ3M8BXaIKXEH435ZVTEbhgoablU/0JIz/3qQ/6PMfnHX8w8LIAHRnHAePq
	a
X-Google-Smtp-Source: AGHT+IGFmhwnmNKSrxMQ2nLtOFpPT2TfElRIUQMDZRSNandfpDYCYSVT9qRaApu/eTcVnyxk677kEQ==
X-Received: by 2002:a05:6402:3489:b0:5c9:48df:713c with SMTP id 4fb4d7f45d1cf-5cb8af7defbmr6676395a12.2.1729780023866;
        Thu, 24 Oct 2024 07:27:03 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 4/5] x86/boot: Convert mod[] to bi->mods[] in __start_xen()
Date: Thu, 24 Oct 2024 15:26:53 +0100
Message-Id: <20241024142654.989980-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241024142654.989980-1-andrew.cooper3@citrix.com>
References: <20241024142654.989980-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

The former is about to disappear.

In some cases, introduce a local struct boot_module pointer.  Judgement on
where to do this, and on constness, is based on what creates least churn
overall.

No functional change.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

v7.5:
 * Rearranged from several later patches
---
 xen/arch/x86/setup.c | 59 +++++++++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index ee03725af380..5413e1c71be6 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1382,11 +1382,11 @@ void asmlinkage __init noreturn __start_xen(void)
 
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
@@ -1397,6 +1397,8 @@ void asmlinkage __init noreturn __start_xen(void)
 
     if ( xen_phys_start )
     {
+        struct boot_module *xen = &bi->mods[bi->nr_modules];
+
         relocated = true;
 
         /*
@@ -1404,8 +1406,8 @@ void asmlinkage __init noreturn __start_xen(void)
          * respective reserve_e820_ram() invocation below. No need to
          * query efi_boot_mem_unused() here, though.
          */
-        mod[bi->nr_modules].mod_start = virt_to_mfn(_stext);
-        mod[bi->nr_modules].mod_end = __2M_rwdata_end - _stext;
+        xen->mod->mod_start = virt_to_mfn(_stext);
+        xen->mod->mod_end   = __2M_rwdata_end - _stext;
     }
 
     modules_headroom =
@@ -1490,15 +1492,17 @@ void asmlinkage __init noreturn __start_xen(void)
         /* Is the region suitable for relocating the multiboot modules? */
         for ( j = bi->nr_modules - 1; j >= 0; j-- )
         {
+            struct boot_module *bm = &bi->mods[j];
+
             /*
              * 'headroom' is a guess for the decompressed size and
              * decompressor overheads of mod[0] (the dom0 kernel).  When we
              * move mod[0], we incorporate this as extra space at the start.
              */
             unsigned long headroom = j ? 0 : modules_headroom;
-            unsigned long size = PAGE_ALIGN(headroom + mod[j].mod_end);
+            unsigned long size = PAGE_ALIGN(headroom + bm->mod->mod_end);
 
-            if ( mod[j].reserved )
+            if ( bm->mod->reserved )
                 continue;
 
             /* Don't overlap with other modules (or Xen itself). */
@@ -1510,14 +1514,13 @@ void asmlinkage __init noreturn __start_xen(void)
 
             if ( s < end &&
                  (headroom ||
-                  ((end - size) >> PAGE_SHIFT) > mod[j].mod_start) )
+                  ((end - size) >> PAGE_SHIFT) > bm->mod->mod_start) )
             {
                 move_memory(end - size + headroom,
-                            (uint64_t)mod[j].mod_start << PAGE_SHIFT,
-                            mod[j].mod_end);
-                mod[j].mod_start = (end - size) >> PAGE_SHIFT;
-                mod[j].mod_end += headroom;
-                mod[j].reserved = 1;
+                            pfn_to_paddr(bm->mod->mod_start), bm->mod->mod_end);
+                bm->mod->mod_start = (end - size) >> PAGE_SHIFT;
+                bm->mod->mod_end += headroom;
+                bm->mod->reserved = 1;
             }
         }
 
@@ -1543,13 +1546,14 @@ void asmlinkage __init noreturn __start_xen(void)
 #endif
     }
 
-    if ( modules_headroom && !mod->reserved )
+    if ( modules_headroom && !bi->mods[0].mod->reserved )
         panic("Not enough memory to relocate the dom0 kernel image\n");
     for ( i = 0; i < bi->nr_modules; ++i )
     {
-        uint64_t s = (uint64_t)mod[i].mod_start << PAGE_SHIFT;
+        const struct boot_module *bm = &bi->mods[i];
+        uint64_t s = pfn_to_paddr(bm->mod->mod_start);
 
-        reserve_e820_ram(&boot_e820, s, s + PAGE_ALIGN(mod[i].mod_end));
+        reserve_e820_ram(&boot_e820, s, s + PAGE_ALIGN(bm->mod->mod_end));
     }
 
     if ( !xen_phys_start )
@@ -1627,8 +1631,8 @@ void asmlinkage __init noreturn __start_xen(void)
                 map_e = boot_e820.map[j].addr + boot_e820.map[j].size;
                 for ( j = 0; j < bi->nr_modules; ++j )
                 {
-                    uint64_t end = pfn_to_paddr(mod[j].mod_start) +
-                                   mod[j].mod_end;
+                    uint64_t end = pfn_to_paddr(bi->mods[j].mod->mod_start) +
+                                   bi->mods[j].mod->mod_end;
 
                     if ( map_e < end )
                         map_e = end;
@@ -1702,11 +1706,13 @@ void asmlinkage __init noreturn __start_xen(void)
 
     for ( i = 0; i < bi->nr_modules; ++i )
     {
-        set_pdx_range(mod[i].mod_start,
-                      mod[i].mod_start + PFN_UP(mod[i].mod_end));
-        map_pages_to_xen((unsigned long)mfn_to_virt(mod[i].mod_start),
-                         _mfn(mod[i].mod_start),
-                         PFN_UP(mod[i].mod_end), PAGE_HYPERVISOR);
+        const struct boot_module *bm = &bi->mods[i];
+
+        set_pdx_range(bm->mod->mod_start,
+                      bm->mod->mod_start + PFN_UP(bm->mod->mod_end));
+        map_pages_to_xen((unsigned long)mfn_to_virt(bm->mod->mod_start),
+                         _mfn(bm->mod->mod_start),
+                         PFN_UP(bm->mod->mod_end), PAGE_HYPERVISOR);
     }
 
 #ifdef CONFIG_KEXEC
@@ -2095,8 +2101,9 @@ void asmlinkage __init noreturn __start_xen(void)
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
-    dom0 = create_dom0(mod, modules_headroom,
-                       initrdidx < bi->nr_modules ? mod + initrdidx : NULL,
+    dom0 = create_dom0(bi->mods[0].mod, modules_headroom,
+                       initrdidx < bi->nr_modules ? bi->mods[initrdidx].mod
+                                                  : NULL,
                        kextra, bi->loader);
     if ( !dom0 )
         panic("Could not set up DOM0 guest OS\n");
-- 
2.39.5


