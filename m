Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B920F96C172
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 16:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790440.1200225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slrRU-00029c-8j; Wed, 04 Sep 2024 14:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790440.1200225; Wed, 04 Sep 2024 14:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slrRU-00026Q-54; Wed, 04 Sep 2024 14:57:08 +0000
Received: by outflank-mailman (input) for mailman id 790440;
 Wed, 04 Sep 2024 14:57:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S0IR=QC=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1slrRS-0001Be-Gf
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 14:57:06 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f34c1b29-6acd-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 16:57:05 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c2561e8041so4116224a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 07:57:05 -0700 (PDT)
Received: from fziglio-xenia-fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc56c501sm18862a12.52.2024.09.04.07.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 07:57:04 -0700 (PDT)
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
X-Inumbo-ID: f34c1b29-6acd-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725461825; x=1726066625; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcvMYN+jr5XUIeIsxJiT1pxAH2bfq4XVsUerM53EAdk=;
        b=L4e7st1QpUWX4pmJIfdMBnSCXb3EylFZ13rP0epa5667CvkWjsRmoCTrFSK5rW7TWM
         vCbweW1k7GRZrH2CefiVtiECp6KKFMUrwahc+w3AgCxI40TFQmgsWrnjk4NVnJQg/xv+
         GBPuRr4CbaU0KhEgAVsy2KZKYFXXARnDBXO+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725461825; x=1726066625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZcvMYN+jr5XUIeIsxJiT1pxAH2bfq4XVsUerM53EAdk=;
        b=dS052MyKXb27l18F0ldSXn38H+MinUORQuhlJC7CRyDRoMK6AaZYVkQCTyCa1j1BhG
         Z7qpKE6RJm8YwenI8bKnhcXoocBDtuiEzcKk46BLG26u9PryjYuQXxRudoRWHbMssKnP
         9Go9EFG6KUuCyK8IakFp4LnDrHF7zw/DmtkWi3l0jUrhEzgK9QpAbmRjD5TQ7XDcFX0E
         MHo3hChcWnIR2/EU8XLPDIDEjcxr8xkUHigDBq8sFxcZiPyuAdic6CDnV61X4JoJap93
         VMXs9MJuu2sJQFUYG5HS9ufGSdK3GNQlekq6kTXQrT7hIgameaoxs+Z5Gb+61ljmsDGA
         /t6g==
X-Gm-Message-State: AOJu0YxzFSPTpEk/q3/NZNmikqI7SB58L6+mnNvJl+vTVwtva6rnxBnm
	7ezo8UdGpBC1zT/Twv97X+z4y76s4Xf6W/ArGb2HhOkmGrbuIquA9/kdYqt9D3WYAAQLMW/eUJq
	r
X-Google-Smtp-Source: AGHT+IHTEBuxpy+UIZ/UjSONvgdj+wUsgOu58Nz4vjPcQQTv/Tufa8zRgvnXdsmUUxOdHP0H0GcFyw==
X-Received: by 2002:a05:6402:3506:b0:5c2:6e5f:3bf9 with SMTP id 4fb4d7f45d1cf-5c26e5f3d09mr3653500a12.28.1725461824588;
        Wed, 04 Sep 2024 07:57:04 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 5/5] setup mapping for trampoline in setup_pagesXX
Date: Wed,  4 Sep 2024 15:56:48 +0100
Message-ID: <20240904145648.33707-6-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904145648.33707-1-frediano.ziglio@cloud.com>
References: <20240904145648.33707-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reduce assembly code, make boot page mappings more similar between
multiple paths (direct EFI and not).

---
 xen/arch/x86/boot/build32.lds.S |  2 ++
 xen/arch/x86/boot/head.S        | 10 ----------
 xen/arch/x86/boot/setup-pages.c | 25 ++++++++++++++++++-------
 xen/arch/x86/boot/x86_64.S      |  2 +-
 xen/arch/x86/include/asm/page.h |  3 ++-
 5 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/boot/build32.lds.S b/xen/arch/x86/boot/build32.lds.S
index 3796f9603b..aca747eb1d 100644
--- a/xen/arch/x86/boot/build32.lds.S
+++ b/xen/arch/x86/boot/build32.lds.S
@@ -49,11 +49,13 @@ SECTIONS
         DECLARE_IMPORT(__trampoline_seg_stop);
         DECLARE_IMPORT(l2_xenmap);
         DECLARE_IMPORT(l2_directmap);
+        DECLARE_IMPORT(l1_bootmap);
         DECLARE_IMPORT(l2_bootmap);
         DECLARE_IMPORT(l3_bootmap);
         DECLARE_IMPORT(_start);
         DECLARE_IMPORT(_end);
         DECLARE_IMPORT(xen_phys_start);
+        DECLARE_IMPORT(trampoline_phys);
         //DECLARE_IMPORT();
         . = . + GAP;
         *(.text)
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 5ae0c2009e..84d3c469de 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -765,16 +765,6 @@ trampoline_setup:
 
         call    setup_pages32
 
-        /* Map l1_bootmap[] into l2_bootmap[0]. */
-        lea     __PAGE_HYPERVISOR + sym_esi(l1_bootmap), %eax
-        mov     %eax, sym_esi(l2_bootmap)
-
-        /* Map the permanent trampoline page into l1_bootmap[]. */
-        mov     sym_esi(trampoline_phys), %ecx
-        lea     __PAGE_HYPERVISOR_RX(%ecx), %edx /* %edx = PTE to write  */
-        shr     $PAGE_SHIFT, %ecx                /* %ecx = Slot to write */
-        mov     %edx, sym_offs(l1_bootmap)(%esi, %ecx, 8)
-
         /* Apply relocations to bootstrap trampoline. */
         mov     sym_esi(trampoline_phys), %eax
         call    reloc_trampoline32
diff --git a/xen/arch/x86/boot/setup-pages.c b/xen/arch/x86/boot/setup-pages.c
index 0961282a01..f74734c036 100644
--- a/xen/arch/x86/boot/setup-pages.c
+++ b/xen/arch/x86/boot/setup-pages.c
@@ -9,8 +9,10 @@
 
 #pragma GCC visibility push(hidden)
 extern char _start[], _end[];
-extern uint64_t l2_xenmap[512], l3_bootmap[512], l2_directmap[512], l2_bootmap[512];
+extern uint64_t l2_xenmap[512], l2_directmap[512],
+	l3_bootmap[512], l2_bootmap[512], l1_bootmap[512];
 extern unsigned long xen_phys_start;
+extern unsigned long trampoline_phys;
 #pragma GCC visibility pop
 
 #define _PAGE_PRESENT 0x001
@@ -19,12 +21,11 @@ extern unsigned long xen_phys_start;
 #define _PAGE_DIRTY 0x040
 #define _PAGE_PSE 0x080
 #define _PAGE_GLOBAL 0x100
+#define _PAGE_NX (1LLU << 63)
 
 #define PAGE_HYPERVISOR       PAGE_HYPERVISOR_RW
 #define PAGE_HYPERVISOR_RW    (__PAGE_HYPERVISOR_RW | _PAGE_GLOBAL)
 #define __PAGE_HYPERVISOR_RW  (__PAGE_HYPERVISOR_RO | _PAGE_DIRTY | _PAGE_RW)
-// TODO
-#define _PAGE_NX 0
 #define __PAGE_HYPERVISOR_RO  (_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_NX)
 #define PAGE_HYPERVISOR_RWX   (__PAGE_HYPERVISOR | _PAGE_GLOBAL)
 #define __PAGE_HYPERVISOR     (__PAGE_HYPERVISOR_RX | _PAGE_DIRTY | _PAGE_RW)
@@ -33,14 +34,16 @@ extern unsigned long xen_phys_start;
 #define L2_PAGETABLE_SHIFT 21
 #define L2_PAGETABLE_ENTRIES 512
 #define PAGE_SIZE 4096
+#define PAGE_SHIFT 12
 #define l2_table_offset(a) (((a) >> L2_PAGETABLE_SHIFT) & (L2_PAGETABLE_ENTRIES - 1))
-#define l2e_from_paddr(a,f) ((a) | put_pte_flags(f))
-#define l3e_from_paddr(a,f) ((a) | put_pte_flags(f))
+#define l1e_from_paddr(a, flags) ((a) | put_pte_flags(flags))
+#define l2e_from_paddr(a, flags) ((a) | put_pte_flags(flags))
+#define l3e_from_paddr(a, flags) ((a) | put_pte_flags(flags))
 #define l2e_add_flags(x, flags)    (x |= put_pte_flags(flags))
 typedef uint64_t l2_pgentry_t;
-static inline int64_t put_pte_flags(unsigned int x)
+static inline uint64_t put_pte_flags(uint64_t x)
 {
-    return (((int64_t)x & ~0xfff) << 40) | (x & 0xfff);
+    return x;
 }
 
 void __attribute__((__stdcall__)) setup_pages32(void)
@@ -102,4 +105,12 @@ void setup_pages64(void)
         l2_directmap[i] = pte;
     }
 #undef l2_4G_offset
+
+    /* Map l1_bootmap[] into l2_bootmap[0]. */
+    l2_bootmap[0] = l2e_from_paddr((unsigned long)l1_bootmap,
+                                   __PAGE_HYPERVISOR);
+
+    /* Map the permanent trampoline page into l1_bootmap[]. */
+    l1_bootmap[(unsigned long)trampoline_phys >> PAGE_SHIFT] =
+        l1e_from_paddr((unsigned long)trampoline_phys, __PAGE_HYPERVISOR_RX);
 }
diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
index 04bb62ae86..230ae6e2fb 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -195,7 +195,7 @@ GLOBAL(__page_tables_end)
         .section .init.data, "aw", @progbits
         .align PAGE_SIZE, 0
 
-l1_bootmap:
+GLOBAL(l1_bootmap)
         .fill L1_PAGETABLE_ENTRIES, 8, 0
         .size l1_bootmap, . - l1_bootmap
 
diff --git a/xen/arch/x86/include/asm/page.h b/xen/arch/x86/include/asm/page.h
index e01af28916..7e8c506dbc 100644
--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -286,7 +286,8 @@ extern l2_pgentry_t l2_xenmap[L2_PAGETABLE_ENTRIES],
     l2_bootmap[4*L2_PAGETABLE_ENTRIES];
 extern l3_pgentry_t l3_bootmap[L3_PAGETABLE_ENTRIES];
 extern l2_pgentry_t l2_directmap[4*L2_PAGETABLE_ENTRIES];
-extern l1_pgentry_t l1_fixmap[L1_PAGETABLE_ENTRIES];
+extern l1_pgentry_t l1_fixmap[L1_PAGETABLE_ENTRIES],
+    l1_bootmap[L1_PAGETABLE_ENTRIES];
 void paging_init(void);
 void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e);
 #endif /* !defined(__ASSEMBLY__) */
-- 
2.46.0


