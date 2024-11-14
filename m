Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C97999C85A3
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 10:08:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836113.1252022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBVpz-0004xh-Aa; Thu, 14 Nov 2024 09:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836113.1252022; Thu, 14 Nov 2024 09:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBVpz-0004vP-6K; Thu, 14 Nov 2024 09:08:27 +0000
Received: by outflank-mailman (input) for mailman id 836113;
 Thu, 14 Nov 2024 09:08:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3TDs=SJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tBVpy-0003tk-4l
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 09:08:26 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff9d46c9-a267-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 10:08:22 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a9ed7d8c86cso67320066b.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 01:08:22 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e046ea8sm38491166b.169.2024.11.14.01.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 01:08:18 -0800 (PST)
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
X-Inumbo-ID: ff9d46c9-a267-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmYiLCJoZWxvIjoibWFpbC1lajEteDYyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZmOWQ0NmM5LWEyNjctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTc1MzAyLjcyOTE2LCJzZW5kZXIiOiJhbmRyZXcuY29vcGVyQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731575300; x=1732180100; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzhC3CskSAYSceEJrXwog7riTboPPINw/IB+Rl7oKhQ=;
        b=u3HBvDtSLa60U0ewO92D+YXUtdDWk/aYPv2INQ7VVoTVNnmET0NcGn2Yn8GtdyEv9m
         XqlJM4aJ5OQ+LO7Ecp9Lcrzh9QlUjC7pKbdwU5krkM7awmtA262AS6x1xBi0NUhbU97r
         wLw355rHKcysRqQQ6kpV2dOwL6AQFyaLGKZkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731575300; x=1732180100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzhC3CskSAYSceEJrXwog7riTboPPINw/IB+Rl7oKhQ=;
        b=o/hQDOWivXO1CxaF8Vfkw1DJ3xufGamJYDTfcOYABV9VjeaPCsWHeK6G1d68uvY0c9
         CBm7YMU3nrNfCmF3wU+F/8oalWQWbVYYVfGKwnqAwuVLP4HUm8dWxKGHifBrDJ8AqhAa
         lkAPPL0ADdDQ36oQ0ezq+zAoZzvn/gFd2MGzFU4JW1B7C+Xr9KRyweu/+RhutI/MykNv
         nI8Uf30zZUSBmFTokHEPwTQiNcY6pKqTnXLByB+6lX9c7w1HIcDASFjvg0wPSf4q+mf9
         LmnCAUk0r1KZjAeXhifbrw4YlKqYRU3d46GXHUfmYs/4pH542wSi+OCBktu/mRgET79F
         fnjQ==
X-Gm-Message-State: AOJu0YzB1X+GgUiR15neXECUG0Brdm64N9asFIgwgNg4k/cWevQeZApq
	/6kxn7wTQVVIc7kaB5wXdH2d3DEO8IpHVJ/i5HbOgrjFW5PRpr+iCKPflpHtDZnsgeC2GEJFQGC
	6
X-Google-Smtp-Source: AGHT+IGy4EuJZwRq5bc/7ApZUcEBGKmle0oLQ/NfTck0CKaeiRQyx/m9zDmYBW9ih+vPq0IMEKeLmg==
X-Received: by 2002:a17:906:99c4:b0:a99:caf5:c897 with SMTP id a640c23a62f3a-aa1f805886emr570186566b.20.1731575299947;
        Thu, 14 Nov 2024 01:08:19 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v2 4/4] x86/trampoline: Rationalise the constants to describe the size
Date: Thu, 14 Nov 2024 09:08:10 +0000
Message-Id: <20241114090810.1961175-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241114090810.1961175-1-andrew.cooper3@citrix.com>
References: <20241114090810.1961175-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The logic is far more sane to follow with a total size, and the position of
the end of the heap.  Remove or fix the remaining descriptions of how the
trampoline is laid out.

Move the relevant constants into trampoline.h, which requires making the
header safe to include in assembly files.

No functional change.  The compiled binary is identical.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>

v2:
 * Fix typos
 * Rebase over removal of WAKEUP_STACK_MIN
 * Move constants into trampoline.h
---
 xen/arch/x86/boot/head.S              | 23 ++++-------------------
 xen/arch/x86/boot/reloc.c             |  5 ++---
 xen/arch/x86/efi/efi-boot.h           |  2 +-
 xen/arch/x86/include/asm/config.h     |  4 ----
 xen/arch/x86/include/asm/trampoline.h |  8 ++++++++
 xen/arch/x86/xen.lds.S                |  3 ++-
 6 files changed, 17 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index dcda91cfda49..1b3bd16fe575 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -8,6 +8,8 @@
 #include <asm/processor.h>
 #include <asm/msr-index.h>
 #include <asm/cpufeature.h>
+#include <asm/trampoline.h>
+
 #include <public/elfnote.h>
 
 #define ENTRY(name)                             \
@@ -494,7 +496,7 @@ trampoline_bios_setup:
 
 2:
         /* Reserve memory for the trampoline and the low-memory stack. */
-        sub     $((TRAMPOLINE_SPACE+TRAMPOLINE_STACK_SPACE)>>4),%ecx
+        sub     $TRAMPOLINE_SIZE >> 4, %ecx
 
         /* From arch/x86/smpboot.c: start_eip had better be page-aligned! */
         xor     %cl, %cl
@@ -525,23 +527,6 @@ trampoline_setup:
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
@@ -713,7 +698,7 @@ trampoline_setup:
 1:
         /* Switch to low-memory stack which lives at the end of trampoline region. */
         mov     sym_esi(trampoline_phys), %edi
-        lea     TRAMPOLINE_SPACE+TRAMPOLINE_STACK_SPACE(%edi),%esp
+        lea     TRAMPOLINE_SIZE(%edi), %esp
         lea     trampoline_boot_cpu_entry-trampoline_start(%edi),%eax
         pushl   $BOOT_CS32
         push    %eax
diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index e50e161b2740..7a375ad41c1c 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -65,7 +65,7 @@ typedef struct memctx {
     /*
      * Simple bump allocator.
      *
-     * It starts from the base of the trampoline and allocates downwards.
+     * It starts from end of the trampoline heap and allocates downwards.
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
index 84696e0a7db5..19746f956ec3 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -51,10 +51,6 @@
 
 #define IST_SHSTK_SIZE 1024
 
-#define TRAMPOLINE_STACK_SPACE  PAGE_SIZE
-#define TRAMPOLINE_SPACE        (KB(64) - TRAMPOLINE_STACK_SPACE)
-#define MBI_SPACE_MIN           (2 * PAGE_SIZE)
-
 /* Primary stack is restricted to 8kB by guard pages. */
 #define PRIMARY_STACK_SIZE 8192
 
diff --git a/xen/arch/x86/include/asm/trampoline.h b/xen/arch/x86/include/asm/trampoline.h
index 559111d2ccfc..cb3e3d06c7bc 100644
--- a/xen/arch/x86/include/asm/trampoline.h
+++ b/xen/arch/x86/include/asm/trampoline.h
@@ -90,6 +90,13 @@
  */
 
 #include <xen/compiler.h>
+
+#define TRAMPOLINE_SIZE         KB(64)
+#define TRAMPOLINE_HEAP_END     (TRAMPOLINE_SIZE - PAGE_SIZE)
+#define MBI_SPACE_MIN           (2 * PAGE_SIZE)
+
+#ifndef __ASSEMBLY__
+
 #include <xen/types.h>
 
 /*
@@ -160,4 +167,5 @@ extern uint8_t kbd_shift_flags;
 extern uint16_t boot_edid_caps;
 extern uint8_t boot_edid_info[128];
 
+#endif /* !__ASSEMBLY__ */
 #endif /* X86_ASM_TRAMPOLINE_H */
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 224b46771d0c..42217eaf2485 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -9,6 +9,7 @@
 #endif
 #include <xen/xen.lds.h>
 #include <asm/page.h>
+#include <asm/trampoline.h>
 
 #ifdef EFI
 
@@ -420,5 +421,5 @@ ASSERT(!SIZEOF(.rela),     "leftover relocations")
 ASSERT((trampoline_perm_end - trampoline_start) <= 1024,
        "Permentant trampoline too large")
 
-ASSERT((trampoline_end - trampoline_start) < TRAMPOLINE_SPACE - MBI_SPACE_MIN,
+ASSERT((trampoline_end - trampoline_start) < TRAMPOLINE_HEAP_END - MBI_SPACE_MIN,
     "not enough room for trampoline and mbi data")
-- 
2.39.5


