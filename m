Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DE896C173
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 16:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790441.1200232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slrRU-0002Ee-M5; Wed, 04 Sep 2024 14:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790441.1200232; Wed, 04 Sep 2024 14:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slrRU-00029d-F6; Wed, 04 Sep 2024 14:57:08 +0000
Received: by outflank-mailman (input) for mailman id 790441;
 Wed, 04 Sep 2024 14:57:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S0IR=QC=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1slrRS-0001Bm-IQ
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 14:57:06 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2e2bd8d-6acd-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 16:57:04 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2f3f90295a9so11247011fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 07:57:04 -0700 (PDT)
Received: from fziglio-xenia-fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc56c501sm18862a12.52.2024.09.04.07.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 07:57:03 -0700 (PDT)
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
X-Inumbo-ID: f2e2bd8d-6acd-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725461824; x=1726066624; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNu6Puv0e8keSxUHB/R0XRglCAGHnvUUM3m8vz4KfqY=;
        b=ME2VYo9VRnmQDG84sXhlVn8lGLMJaXDHck9lEaJMztISuRankIqVIbp/IMMvvfc04z
         lH1+nME6CJn7NjksPXvyNedff68qhAfwdCcI4Uj+CeRnNAxHEz0E4kcYUwg4R1uMGdzv
         KDzJ4CwrO99lWF27W4ZyA8P+nMd2qOKpqPIHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725461824; x=1726066624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNu6Puv0e8keSxUHB/R0XRglCAGHnvUUM3m8vz4KfqY=;
        b=eu+9P82zqanbFX6ZPBEL15ULmlxK1D5oPdbr06uDmt5n6WMWZM3BwzL2iRFjzrfb0p
         bEThDt0mKog7Ncd+8j/S+U/er4Xf8JY58c0UQ9eJ2wiwHYRwIdCBIIgvFKx12sK/Ata3
         u1tSRZFEuRg3ZV4j79dIc6bFfu0qvTbbTTk2fG5ue28QCiMKiALNDsG59GM6PehqeCdj
         /IIPRnFNSp7QpgCnQP4ZsR3kt4IL45T0U1WkcL4lF3AsAdOwZtCoRvJFXhgSZrvuHZqY
         Nvgj2BM5h4OCgiKcRAh52uDHD8ITjgvSNWGxiwrkW1nprMSuJZIXsEg7J6YbFckJ97gn
         ZLMQ==
X-Gm-Message-State: AOJu0YzpNC0HEDKP9Z9wnEHEm4sKGeWfLjNKD8W1BJsQVZzu7dco/7iw
	vCvqTCJyGLOZq69kgq7FWbdZFp73LK2eTVSJ1BkyvkckbKf7gyNLA7YMWdEt22mYOWW+OF2ITZH
	Q
X-Google-Smtp-Source: AGHT+IH2iajKc/hwuONm00Xthdi39I7xcd2vmSPFrzl9jPAPQquPu7z8zcJP7eybp3yRtJlFAwefgQ==
X-Received: by 2002:a2e:bc1a:0:b0:2f2:9a2e:c257 with SMTP id 38308e7fff4ca-2f651e5d42amr22342481fa.41.1725461823929;
        Wed, 04 Sep 2024 07:57:03 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [RFC 4/5] Remove duplication preparing pages
Date: Wed,  4 Sep 2024 15:56:47 +0100
Message-ID: <20240904145648.33707-5-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904145648.33707-1-frediano.ziglio@cloud.com>
References: <20240904145648.33707-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pretty hacky, headers are not that compatible 32/64 bits
---
 xen/arch/x86/boot/Makefile        |   6 +-
 xen/arch/x86/boot/build32.lds.S   |   8 +++
 xen/arch/x86/boot/head.S          |  43 +-----------
 xen/arch/x86/boot/setup-pages.c   | 105 ++++++++++++++++++++++++++++++
 xen/arch/x86/boot/setup-pages64.c |   1 +
 xen/arch/x86/efi/efi-boot.h       |  52 +--------------
 6 files changed, 121 insertions(+), 94 deletions(-)
 create mode 100644 xen/arch/x86/boot/setup-pages.c
 create mode 120000 xen/arch/x86/boot/setup-pages64.c

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 42fd1721de..23e40769eb 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -1,6 +1,6 @@
-obj-bin-y += head.o cbundle.o reloc-trampoline64.o
+obj-bin-y += head.o cbundle.o reloc-trampoline64.o setup-pages64.o
 
-head-bin-objs := cmdline.o reloc.o reloc-trampoline.o
+head-bin-objs := cmdline.o reloc.o reloc-trampoline.o setup-pages.o
 
 nocov-y   += $(head-bin-objs)
 noubsan-y += $(head-bin-objs)
@@ -43,7 +43,7 @@ $(obj)/cbundle.o: $(head-bin-objs) $(obj)/build32.other.lds $(obj)/build32.final
 	$(PYTHON) $(srctree)/tools/make_output \
 		--script $(obj)/build32.final.lds \
 		--bin1 $@.1.bin --bin2 $@.2.bin \
-		--map $(obj)/cbundle.map --exports cmdline_parse_early,reloc,reloc_trampoline32 \
+		--map $(obj)/cbundle.map --exports cmdline_parse_early,reloc,reloc_trampoline32,setup_pages32 \
 		--section-header '.section .init.text, "ax", @progbits' \
 		--output $(obj)/cbundle.s
 	$(CC) -c $(obj)/cbundle.s -o $@.tmp
diff --git a/xen/arch/x86/boot/build32.lds.S b/xen/arch/x86/boot/build32.lds.S
index 0b7341edeb..3796f9603b 100644
--- a/xen/arch/x86/boot/build32.lds.S
+++ b/xen/arch/x86/boot/build32.lds.S
@@ -47,6 +47,14 @@ SECTIONS
         DECLARE_IMPORT(__trampoline_rel_stop);
         DECLARE_IMPORT(__trampoline_seg_start);
         DECLARE_IMPORT(__trampoline_seg_stop);
+        DECLARE_IMPORT(l2_xenmap);
+        DECLARE_IMPORT(l2_directmap);
+        DECLARE_IMPORT(l2_bootmap);
+        DECLARE_IMPORT(l3_bootmap);
+        DECLARE_IMPORT(_start);
+        DECLARE_IMPORT(_end);
+        DECLARE_IMPORT(xen_phys_start);
+        //DECLARE_IMPORT();
         . = . + GAP;
         *(.text)
         *(.text.*)
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 8e35f2a791..5ae0c2009e 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -763,48 +763,7 @@ trampoline_setup:
         test    $(1 << L2_PAGETABLE_SHIFT) - 1, %eax
         jnz     .Lnot_aligned
 
-        /* Map Xen into the higher mappings using 2M superpages. */
-        lea     _PAGE_PSE + PAGE_HYPERVISOR_RWX + sym_esi(_start), %eax
-        mov     $sym_offs(_start),   %ecx   /* %eax = PTE to write ^      */
-        mov     $sym_offs(_end - 1), %edx
-        shr     $L2_PAGETABLE_SHIFT, %ecx   /* %ecx = First slot to write */
-        shr     $L2_PAGETABLE_SHIFT, %edx   /* %edx = Final slot to write */
-
-1:      mov     %eax, sym_offs(l2_xenmap)(%esi, %ecx, 8)
-        add     $1, %ecx
-        add     $1 << L2_PAGETABLE_SHIFT, %eax
-
-        cmp     %edx, %ecx
-        jbe     1b
-
-        /*
-         * Map Xen into the directmap (needed for early-boot pagetable
-         * handling/walking), and identity map Xen into bootmap (needed for
-         * the transition into long mode), using 2M superpages.
-         */
-        lea     sym_esi(_start), %ecx
-        lea     -1 + sym_esi(_end), %edx
-        lea     _PAGE_PSE + PAGE_HYPERVISOR_RWX(%ecx), %eax /* PTE to write. */
-        shr     $L2_PAGETABLE_SHIFT, %ecx                   /* First slot to write. */
-        shr     $L2_PAGETABLE_SHIFT, %edx                   /* Final slot to write. */
-
-1:      mov     %eax, sym_offs(l2_bootmap)  (%esi, %ecx, 8)
-        mov     %eax, sym_offs(l2_directmap)(%esi, %ecx, 8)
-        add     $1, %ecx
-        add     $1 << L2_PAGETABLE_SHIFT, %eax
-
-        cmp     %edx, %ecx
-        jbe     1b
-
-        /* Map 4x l2_bootmap[] into l3_bootmap[0...3] */
-        lea     __PAGE_HYPERVISOR + sym_esi(l2_bootmap), %eax
-        mov     %eax, 0  + sym_esi(l3_bootmap)
-        add     $PAGE_SIZE, %eax
-        mov     %eax, 8  + sym_esi(l3_bootmap)
-        add     $PAGE_SIZE, %eax
-        mov     %eax, 16 + sym_esi(l3_bootmap)
-        add     $PAGE_SIZE, %eax
-        mov     %eax, 24 + sym_esi(l3_bootmap)
+        call    setup_pages32
 
         /* Map l1_bootmap[] into l2_bootmap[0]. */
         lea     __PAGE_HYPERVISOR + sym_esi(l1_bootmap), %eax
diff --git a/xen/arch/x86/boot/setup-pages.c b/xen/arch/x86/boot/setup-pages.c
new file mode 100644
index 0000000000..0961282a01
--- /dev/null
+++ b/xen/arch/x86/boot/setup-pages.c
@@ -0,0 +1,105 @@
+#include <xen/stdint.h>
+#include <xen/compiler.h>
+#include <xen/config.h>
+#ifndef __i386__
+#include <xen/mm.h>
+#endif
+
+#if defined(__i386__)
+
+#pragma GCC visibility push(hidden)
+extern char _start[], _end[];
+extern uint64_t l2_xenmap[512], l3_bootmap[512], l2_directmap[512], l2_bootmap[512];
+extern unsigned long xen_phys_start;
+#pragma GCC visibility pop
+
+#define _PAGE_PRESENT 0x001
+#define _PAGE_RW 0x002
+#define _PAGE_ACCESSED 0x020
+#define _PAGE_DIRTY 0x040
+#define _PAGE_PSE 0x080
+#define _PAGE_GLOBAL 0x100
+
+#define PAGE_HYPERVISOR       PAGE_HYPERVISOR_RW
+#define PAGE_HYPERVISOR_RW    (__PAGE_HYPERVISOR_RW | _PAGE_GLOBAL)
+#define __PAGE_HYPERVISOR_RW  (__PAGE_HYPERVISOR_RO | _PAGE_DIRTY | _PAGE_RW)
+// TODO
+#define _PAGE_NX 0
+#define __PAGE_HYPERVISOR_RO  (_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_NX)
+#define PAGE_HYPERVISOR_RWX   (__PAGE_HYPERVISOR | _PAGE_GLOBAL)
+#define __PAGE_HYPERVISOR     (__PAGE_HYPERVISOR_RX | _PAGE_DIRTY | _PAGE_RW)
+#define __PAGE_HYPERVISOR_RX  (_PAGE_PRESENT | _PAGE_ACCESSED)
+
+#define L2_PAGETABLE_SHIFT 21
+#define L2_PAGETABLE_ENTRIES 512
+#define PAGE_SIZE 4096
+#define l2_table_offset(a) (((a) >> L2_PAGETABLE_SHIFT) & (L2_PAGETABLE_ENTRIES - 1))
+#define l2e_from_paddr(a,f) ((a) | put_pte_flags(f))
+#define l3e_from_paddr(a,f) ((a) | put_pte_flags(f))
+#define l2e_add_flags(x, flags)    (x |= put_pte_flags(flags))
+typedef uint64_t l2_pgentry_t;
+static inline int64_t put_pte_flags(unsigned int x)
+{
+    return (((int64_t)x & ~0xfff) << 40) | (x & 0xfff);
+}
+
+void setup_pages32(void)
+#elif defined (__x86_64__)
+void setup_pages64(void)
+#else
+#error Unknow architecture
+#endif
+{
+    unsigned int i;
+
+    /*
+     * Map Xen into the higher mappings, using 2M superpages.
+     *
+     * NB: We are currently in physical mode, so a RIP-relative relocation
+     * against _start/_end result in our arbitrary placement by the bootloader
+     * in memory, rather than the intended high mappings position.  Subtract
+     * xen_phys_start to get the appropriate slots in l2_xenmap[].
+     */
+    for ( i =  l2_table_offset((unsigned long)_start   - xen_phys_start);
+          i <= l2_table_offset((unsigned long)_end - 1 - xen_phys_start); ++i )
+        l2_xenmap[i] =
+            l2e_from_paddr(xen_phys_start + (i << L2_PAGETABLE_SHIFT),
+                           PAGE_HYPERVISOR_RWX | _PAGE_PSE);
+
+    /* Check that there is at least 4G of mapping space in l2_*map[] */
+#ifndef __i386__
+    BUILD_BUG_ON((sizeof(l2_bootmap)   / L2_PAGETABLE_ENTRIES) < 4);
+    BUILD_BUG_ON((sizeof(l2_directmap) / L2_PAGETABLE_ENTRIES) < 4);
+#endif
+
+    /* Initialize L3 boot-map page directory entries. */
+    for ( i = 0; i < 4; ++i )
+        l3_bootmap[i] = l3e_from_paddr((unsigned long)l2_bootmap + i * PAGE_SIZE,
+                                       __PAGE_HYPERVISOR);
+    /*
+     * Map Xen into the directmap (needed for early-boot pagetable
+     * handling/walking), and identity map Xen into bootmap (needed for the
+     * transition from the EFI pagetables to Xen), using 2M superpages.
+     *
+     * NB: We are currently in physical mode, so a RIP-relative relocation
+     * against _start/_end gets their real position in memory, which are the
+     * appropriate l2 slots to map.
+     */
+#define l2_4G_offset(a)                                                 \
+    (((a) >> L2_PAGETABLE_SHIFT) & (4 * L2_PAGETABLE_ENTRIES - 1))
+
+    for ( i  = l2_4G_offset((unsigned long)_start);
+          i <= l2_4G_offset((unsigned long)_end - 1); ++i )
+    {
+        l2_pgentry_t pte = l2e_from_paddr(i << L2_PAGETABLE_SHIFT,
+                                          __PAGE_HYPERVISOR | _PAGE_PSE);
+
+        l2_bootmap[i] = pte;
+
+        /* Bootmap RWX/Non-global.  Directmap RW/Global. */
+        l2e_add_flags(pte, PAGE_HYPERVISOR);
+
+        l2_directmap[i] = pte;
+    }
+#undef l2_4G_offset
+}
diff --git a/xen/arch/x86/boot/setup-pages64.c b/xen/arch/x86/boot/setup-pages64.c
new file mode 120000
index 0000000000..9a5cf52290
--- /dev/null
+++ b/xen/arch/x86/boot/setup-pages64.c
@@ -0,0 +1 @@
+setup-pages.c
\ No newline at end of file
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 87a7f8abcf..4291af0b3d 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -615,9 +615,10 @@ static void __init efi_arch_edid(EFI_HANDLE gop_handle)
 #endif
 }
 
+void setup_pages64(void);
+
 static void __init efi_arch_memory_setup(void)
 {
-    unsigned int i;
     EFI_STATUS status;
 
     /* Allocate space for trampoline (in first Mb). */
@@ -641,54 +642,7 @@ static void __init efi_arch_memory_setup(void)
     if ( !efi_enabled(EFI_LOADER) )
         return;
 
-    /*
-     * Map Xen into the higher mappings, using 2M superpages.
-     *
-     * NB: We are currently in physical mode, so a RIP-relative relocation
-     * against _start/_end result in our arbitrary placement by the bootloader
-     * in memory, rather than the intended high mappings position.  Subtract
-     * xen_phys_start to get the appropriate slots in l2_xenmap[].
-     */
-    for ( i =  l2_table_offset((UINTN)_start   - xen_phys_start);
-          i <= l2_table_offset((UINTN)_end - 1 - xen_phys_start); ++i )
-        l2_xenmap[i] =
-            l2e_from_paddr(xen_phys_start + (i << L2_PAGETABLE_SHIFT),
-                           PAGE_HYPERVISOR_RWX | _PAGE_PSE);
-
-    /* Check that there is at least 4G of mapping space in l2_*map[] */
-    BUILD_BUG_ON((sizeof(l2_bootmap)   / L2_PAGETABLE_ENTRIES) < 4);
-    BUILD_BUG_ON((sizeof(l2_directmap) / L2_PAGETABLE_ENTRIES) < 4);
-
-    /* Initialize L3 boot-map page directory entries. */
-    for ( i = 0; i < 4; ++i )
-        l3_bootmap[i] = l3e_from_paddr((UINTN)l2_bootmap + i * PAGE_SIZE,
-                                       __PAGE_HYPERVISOR);
-    /*
-     * Map Xen into the directmap (needed for early-boot pagetable
-     * handling/walking), and identity map Xen into bootmap (needed for the
-     * transition from the EFI pagetables to Xen), using 2M superpages.
-     *
-     * NB: We are currently in physical mode, so a RIP-relative relocation
-     * against _start/_end gets their real position in memory, which are the
-     * appropriate l2 slots to map.
-     */
-#define l2_4G_offset(a)                                                 \
-    (((a) >> L2_PAGETABLE_SHIFT) & (4 * L2_PAGETABLE_ENTRIES - 1))
-
-    for ( i  = l2_4G_offset((UINTN)_start);
-          i <= l2_4G_offset((UINTN)_end - 1); ++i )
-    {
-        l2_pgentry_t pte = l2e_from_paddr(i << L2_PAGETABLE_SHIFT,
-                                          __PAGE_HYPERVISOR | _PAGE_PSE);
-
-        l2_bootmap[i] = pte;
-
-        /* Bootmap RWX/Non-global.  Directmap RW/Global. */
-        l2e_add_flags(pte, PAGE_HYPERVISOR);
-
-        l2_directmap[i] = pte;
-    }
-#undef l2_4G_offset
+    setup_pages64();
 }
 
 static void __init efi_arch_handle_module(const struct file *file,
-- 
2.46.0


