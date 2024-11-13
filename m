Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E699C6B83
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 10:31:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835154.1250996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB9iP-0008JB-2m; Wed, 13 Nov 2024 09:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835154.1250996; Wed, 13 Nov 2024 09:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB9iO-0008EP-Un; Wed, 13 Nov 2024 09:31:08 +0000
Received: by outflank-mailman (input) for mailman id 835154;
 Wed, 13 Nov 2024 09:31:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gr6F=SI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tB9iN-0007YE-BZ
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 09:31:07 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 013e22a6-a1a2-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 10:31:05 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a99fa009adcso441029266b.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 01:31:05 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03bb7530sm6929630a12.43.2024.11.13.01.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 01:31:03 -0800 (PST)
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
X-Inumbo-ID: 013e22a6-a1a2-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmQiLCJoZWxvIjoibWFpbC1lajEteDYyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjAxM2UyMmE2LWExYTItMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDkwMjY1LjA5NzkzNSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731490264; x=1732095064; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9O53tsUH9KI5NmtcGog/gKO969NUIAyapBgZEp49gQ=;
        b=f6K3wvzeg1Bp9OpNbZbz3bgsxrlb9ZvNgRV1/u6FlDPhUGysEfFgxgyDaxZnmYOg4T
         Y0ae5uEqkZDy43OIDXnJ5KLJfN4GAgbt7UIn64ffijkhIF7kj6llkvody2vPswPBuiYh
         KOhPThBK4TdBStoZ5f+wkF+g9WVKcTiR+UKMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731490264; x=1732095064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9O53tsUH9KI5NmtcGog/gKO969NUIAyapBgZEp49gQ=;
        b=i0Pp58PMznHMAaG2EfzKCUULBDytF/6mVG52xSD3Qag/eEv89q2oSV+4f6tP58Dl/s
         Gw03trzdWyzd806hiYYUSCklmHJb/MMd4bL+LQ87u8PBFjPG7RUtlMRf9obGyUfUH//I
         MReOacN4wzvmQanmde9CpMEawAQ9c3kGhypnKsWrkMoik9iP5D4iTGyBLB8FLVDfIYEk
         VhVzKpX19VmlB0SBzIAxqJi0i2O2L4v2e+sl1j5FAT6iF70dQeEYvN8veXXmE44yNXT/
         5lmlbbEJPKF21O22qTfV4TuHq0LDgHC4qIynA5kGMiPYPHkeqA5RphgNrdx+iM0f3FHK
         0mWw==
X-Gm-Message-State: AOJu0Yyt7XxQyLpYv2ENVl8Mxz1NVZpUxNOjftSTGni/zJ+vJ3bI7Zeb
	qHDzySMa73zGRKTqjpq1Etu1mvHm2Z6yClLHBIgqurd97f+99nHHUUcA9JIRXy1cOWGTxR3O/K0
	V
X-Google-Smtp-Source: AGHT+IHuBv0pvJp20rHG2r+QXP/gVZ5tZwxn4lKkF4ZW6jyudMS8KM2jb1ZYyNxOOBF1egs+drrIog==
X-Received: by 2002:a05:6402:510f:b0:5c9:44bc:f9b3 with SMTP id 4fb4d7f45d1cf-5cf0a31116amr23492905a12.11.1731490264093;
        Wed, 13 Nov 2024 01:31:04 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH 2/2] x86/trampoline: Rationalise the constants to describe the size
Date: Wed, 13 Nov 2024 09:30:58 +0000
Message-Id: <20241113093058.1562447-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241113093058.1562447-1-andrew.cooper3@citrix.com>
References: <20241113093058.1562447-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The logic is far more sane to follow with a total size, and the position of
the end of the heap.  Remove or fix the the remaining descriptions of how the
trampoline is laid out.

No functional change.  The compiled binary is identical.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/boot/head.S          | 21 ++-------------------
 xen/arch/x86/boot/reloc.c         |  5 ++---
 xen/arch/x86/efi/efi-boot.h       |  2 +-
 xen/arch/x86/include/asm/config.h |  5 +++--
 xen/arch/x86/xen.lds.S            |  2 +-
 5 files changed, 9 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index dcda91cfda49..b31cf83758c1 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -494,7 +494,7 @@ trampoline_bios_setup:
 
 2:
         /* Reserve memory for the trampoline and the low-memory stack. */
-        sub     $((TRAMPOLINE_SPACE+TRAMPOLINE_STACK_SPACE)>>4),%ecx
+        sub     $TRAMPOLINE_SIZE >> 4, %ecx
 
         /* From arch/x86/smpboot.c: start_eip had better be page-aligned! */
         xor     %cl, %cl
@@ -525,23 +525,6 @@ trampoline_setup:
         mov     %eax, sym_esi(multiboot_ptr)
 2:
 
-        /*
-         * Now trampoline_phys points to the following structure (lowest address
-         * is at the bottom):
-         *
-         * +------------------------+
-         * | TRAMPOLINE_STACK_SPACE |
-         * +------------------------+
-         * |     Data (MBI / PVH)   |
-         * +- - - - - - - - - - - - +
-         * |    TRAMPOLINE_SPACE    |
-         * +------------------------+
-         *
-         * Data grows downwards from the highest address of TRAMPOLINE_SPACE
-         * region to the end of the trampoline. The rest of TRAMPOLINE_SPACE is
-         * reserved for trampoline code and data.
-         */
-
         /* Interrogate CPU extended features via CPUID. */
         mov     $1, %eax
         cpuid
@@ -713,7 +696,7 @@ trampoline_setup:
 1:
         /* Switch to low-memory stack which lives at the end of trampoline region. */
         mov     sym_esi(trampoline_phys), %edi
-        lea     TRAMPOLINE_SPACE+TRAMPOLINE_STACK_SPACE(%edi),%esp
+        lea     TRAMPOLINE_SIZE(%edi), %esp
         lea     trampoline_boot_cpu_entry-trampoline_start(%edi),%eax
         pushl   $BOOT_CS32
         push    %eax
diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index e50e161b2740..1f47e10f7fa6 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -65,7 +65,7 @@ typedef struct memctx {
     /*
      * Simple bump allocator.
      *
-     * It starts from the base of the trampoline and allocates downwards.
+     * It starts from end of of the trampoline heap and allocates downwards.
      */
     uint32_t ptr;
 } memctx;
@@ -349,8 +349,7 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, memctx *ctx)
 /* SAF-1-safe */
 void *reloc(uint32_t magic, uint32_t in)
 {
-    /* Get bottom-most low-memory stack address. */
-    memctx ctx = { trampoline_phys + TRAMPOLINE_SPACE };
+    memctx ctx = { trampoline_phys + TRAMPOLINE_HEAP_END };
 
     switch ( magic )
     {
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 7930b7c73892..9d3f2b71447e 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -633,7 +633,7 @@ static void __init efi_arch_memory_setup(void)
     if ( efi_enabled(EFI_LOADER) )
         cfg.size = trampoline_end - trampoline_start;
     else
-        cfg.size = TRAMPOLINE_SPACE + TRAMPOLINE_STACK_SPACE;
+        cfg.size = TRAMPOLINE_SIZE;
 
     status = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
                                    PFN_UP(cfg.size), &cfg.addr);
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index f8a5a4913b07..20141ede31a1 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -51,8 +51,9 @@
 
 #define IST_SHSTK_SIZE 1024
 
-#define TRAMPOLINE_STACK_SPACE  PAGE_SIZE
-#define TRAMPOLINE_SPACE        (KB(64) - TRAMPOLINE_STACK_SPACE)
+/* See asm/trampoline.h */
+#define TRAMPOLINE_SIZE         KB(64)
+#define TRAMPOLINE_HEAP_END     (TRAMPOLINE_SIZE - PAGE_SIZE)
 #define WAKEUP_STACK_MIN        3072
 
 #define MBI_SPACE_MIN           (2 * PAGE_SIZE)
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 35693f6e3380..e7d93d1f4ac3 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -410,7 +410,7 @@ ASSERT(!SIZEOF(.plt),      ".plt non-empty")
 ASSERT(!SIZEOF(.rela),     "leftover relocations")
 #endif
 
-ASSERT((trampoline_end - trampoline_start) < TRAMPOLINE_SPACE - MBI_SPACE_MIN,
+ASSERT((trampoline_end - trampoline_start) < TRAMPOLINE_HEAP_END - MBI_SPACE_MIN,
     "not enough room for trampoline and mbi data")
 ASSERT((wakeup_stack - wakeup_stack_start) >= WAKEUP_STACK_MIN,
     "wakeup stack too small")
-- 
2.39.5


