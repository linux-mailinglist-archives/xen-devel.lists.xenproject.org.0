Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C82AA67B0F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 18:36:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919612.1324038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuarb-000731-Vr; Tue, 18 Mar 2025 17:36:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919612.1324038; Tue, 18 Mar 2025 17:36:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuarb-000700-SG; Tue, 18 Mar 2025 17:36:27 +0000
Received: by outflank-mailman (input) for mailman id 919612;
 Tue, 18 Mar 2025 17:36:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuarZ-0005mN-Pu
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 17:36:25 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82cd6eb2-041f-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 18:36:24 +0100 (CET)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-224100e9a5cso115688115ad.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 10:36:24 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-7371167e17fsm10144622b3a.104.2025.03.18.10.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 10:36:21 -0700 (PDT)
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
X-Inumbo-ID: 82cd6eb2-041f-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742319382; x=1742924182; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9KhreOqQURS5ztJK6NNrxpVchE7gIrRKS/GcpRSMP/k=;
        b=tfOaVlIMzKNSqtgl/jbRRmak2Xwv3h9JGkXX8vwmuN6XiNmGgCza5Ab+SjSzb52U/R
         bv9sJXK+H36EPHBZ3bNZvQ//fR4KmHqEL+CHNemeCx/zGg27gBAGvT/AaqQCW/eCuprV
         taKVOHHZNGp6favUPdg80ZwOF09Hh3Yc6Gtkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742319382; x=1742924182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9KhreOqQURS5ztJK6NNrxpVchE7gIrRKS/GcpRSMP/k=;
        b=lvD2ZyJO77QTW1Vxu7Au0IADmAdu4f3ruYJ5lYEGoq9N3oCZbBtW3sAe/poZT9yuBs
         1ictJJFL03KnZG19IjjM9Wx+mkyE5XHDMgFk0y6DNrvaaItb9r9YURFFngn3Ic/SRsWw
         wMANJ1eO9l8tJX3s7gnQ31sCf5aSfcnOoX2YhDSw8xeUfyMuCSz/7pzsPz+bZ6uFgZBa
         6TwuvL+iv7VmKXxijjxdHTrgMsKrIjVMgTaII43WjFT/XAFRR0acMJUKx1a//RU4+eYh
         eKpqRZl1SEsKLHP4Rp44/gIz8JTOiyO5ZX5bXf4Z1B4G/dynlYHh/ZW7lXP1ODSi9g24
         ncxA==
X-Gm-Message-State: AOJu0YxezHCMRrANCOKBH/prOxKWLgSXCVN02CoWR7gy72tJlL5vtcr/
	n7iuQltEwm+NFtbxm2Tx59zi/B3mWLvlyRYt+yg2Hk26mJXEnq9pkxPDOazvr2X9TX3iHdl1x6e
	r
X-Gm-Gg: ASbGncsAipvmiFH/gQZff26hvlhiAeB6TeRJRTBcMFKIvUdTabNLZB8+uMPxcK1aEcy
	ATA5RsVySlh1abaDM9452WmJiJhAYH/yRY9snuRF3qHpo2Rp0ng0VYCobECW0TEvXSs184yclf6
	ftpPvnEx19CAyTyPuMK2/0Mj1kP0k990wngHJ93nVpNUOeMKeEvnKs4Gm6/d2WFVk3fVrIs6xSQ
	gQm13H0zX51pIo7o3+MTm8UlzIRS9fMcYOqB155LkaYNDRrftmaX7RAyusqhUSzXcsGA62aUwpb
	/pemsiRAJlfqZ5MQdG2KQECOEZW159L7/HaAapwxRnWLOW8D9A==
X-Google-Smtp-Source: AGHT+IHDH8lpZJUcCK8W5dngcQSp989Qg7KHwHuCrLVEBR91aX9cw7ot+dlbwpRmSr8inDbPaZiTYg==
X-Received: by 2002:a05:6a00:14cc:b0:732:5611:cbb5 with SMTP id d2e1a72fcca58-73722399d9fmr16971960b3a.11.1742319382219;
        Tue, 18 Mar 2025 10:36:22 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 4/7] x86/boot: apply trampoline relocations at destination position
Date: Tue, 18 Mar 2025 18:35:44 +0100
Message-ID: <20250318173547.59475-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318173547.59475-1-roger.pau@citrix.com>
References: <20250318173547.59475-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Change the order relocations are applied.  Currently the trampoline is
patched for relocations before being copied to the low 1MB region.  Change
the order and instead copy the trampoline first to the low 1MB region and
then apply the relocations.

This will allow making .init.text section read-only (so read and execute
permissions only), which is relevant when Xen is built as a PE image.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/boot/build32.lds.S      |  1 +
 xen/arch/x86/boot/head.S             |  6 +++---
 xen/arch/x86/boot/reloc-trampoline.c | 16 ++++++++--------
 xen/arch/x86/efi/efi-boot.h          | 15 ++++++---------
 4 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/boot/build32.lds.S b/xen/arch/x86/boot/build32.lds.S
index 1e59732edd6e..92dc320b7380 100644
--- a/xen/arch/x86/boot/build32.lds.S
+++ b/xen/arch/x86/boot/build32.lds.S
@@ -50,6 +50,7 @@ SECTIONS
         DECLARE_IMPORT(__trampoline_seg_start);
         DECLARE_IMPORT(__trampoline_seg_stop);
         DECLARE_IMPORT(trampoline_phys);
+        DECLARE_IMPORT(trampoline_start);
         DECLARE_IMPORT(boot_vid_info);
         . = . + GAP;
         *(.text)
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 59a2b5005cf6..3f81b21b5a7f 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -679,9 +679,6 @@ trampoline_setup:
         shr     $PAGE_SHIFT, %ecx                /* %ecx = Slot to write */
         mov     %edx, sym_offs(l1_bootmap)(%esi, %ecx, 8)
 
-        /* Apply relocations to bootstrap trampoline. */
-        call    reloc_trampoline32
-
         /* Do not parse command line on EFI platform here. */
         cmpb    $0, sym_esi(efi_platform)
         jnz     1f
@@ -709,6 +706,9 @@ trampoline_setup:
         mov     $((trampoline_end - trampoline_start) / 4),%ecx
         rep movsl
 
+        /* Apply relocations to bootstrap trampoline. */
+        call    reloc_trampoline32
+
         /* Jump into the relocated trampoline. */
         lret
 
diff --git a/xen/arch/x86/boot/reloc-trampoline.c b/xen/arch/x86/boot/reloc-trampoline.c
index e35e7c78aa86..ac54aef14eaf 100644
--- a/xen/arch/x86/boot/reloc-trampoline.c
+++ b/xen/arch/x86/boot/reloc-trampoline.c
@@ -20,19 +20,19 @@ void reloc_trampoline64(void)
     uint32_t phys = trampoline_phys;
     const int32_t *trampoline_ptr;
 
-    /*
-     * Apply relocations to trampoline.
-     *
-     * This modifies the trampoline in place within Xen, so that it will
-     * operate correctly when copied into place.
-     */
+    /* Apply relocations to trampoline after copy to destination. */
+#define RELA_TARGET(ptr, bits) \
+    *(uint ## bits ## _t *)(phys + *ptr + (long)ptr - (long)trampoline_start)
+
     for ( trampoline_ptr = __trampoline_rel_start;
           trampoline_ptr < __trampoline_rel_stop;
           ++trampoline_ptr )
-        *(uint32_t *)(*trampoline_ptr + (long)trampoline_ptr) += phys;
+        RELA_TARGET(trampoline_ptr, 32) += phys;
 
     for ( trampoline_ptr = __trampoline_seg_start;
           trampoline_ptr < __trampoline_seg_stop;
           ++trampoline_ptr )
-        *(uint16_t *)(*trampoline_ptr + (long)trampoline_ptr) = phys >> 4;
+        RELA_TARGET(trampoline_ptr, 16) = phys >> 4;
+
+#undef RELA_TARGET
 }
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 1d8902a9a724..e4ed8639b9ac 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -105,10 +105,8 @@ static void __init efi_arch_relocate_image(unsigned long delta)
     }
 }
 
-static void __init relocate_trampoline(unsigned long phys)
+static void __init relocate_trampoline(void)
 {
-    trampoline_phys = phys;
-
     if ( !efi_enabled(EFI_LOADER) )
         return;
 
@@ -213,6 +211,8 @@ static void __init efi_arch_process_memory_map(EFI_SYSTEM_TABLE *SystemTable,
         }
     }
 
+    if ( !trampoline_phys )
+        trampoline_phys = cfg.addr;
 }
 
 static void *__init efi_arch_allocate_mmap_buffer(UINTN map_size)
@@ -223,11 +223,7 @@ static void *__init efi_arch_allocate_mmap_buffer(UINTN map_size)
 static void __init efi_arch_pre_exit_boot(void)
 {
     if ( !trampoline_phys )
-    {
-        if ( !cfg.addr )
-            blexit(L"No memory for trampoline");
-        relocate_trampoline(cfg.addr);
-    }
+        blexit(L"No memory for trampoline");
 }
 
 static void __init noreturn efi_arch_post_exit_boot(void)
@@ -236,6 +232,7 @@ static void __init noreturn efi_arch_post_exit_boot(void)
 
     efi_arch_relocate_image(__XEN_VIRT_START - xen_phys_start);
     memcpy(_p(trampoline_phys), trampoline_start, cfg.size);
+    relocate_trampoline();
 
     /*
      * We're in physical mode right now (i.e. identity map), so a regular
@@ -638,7 +635,7 @@ static void __init efi_arch_memory_setup(void)
     status = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
                                    PFN_UP(cfg.size), &cfg.addr);
     if ( status == EFI_SUCCESS )
-        relocate_trampoline(cfg.addr);
+        trampoline_phys = cfg.addr;
     else
     {
         cfg.addr = 0;
-- 
2.48.1


