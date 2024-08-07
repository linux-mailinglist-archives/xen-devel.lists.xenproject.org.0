Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A0C94A8F0
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2024 15:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773502.1183974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbh20-00068w-8d; Wed, 07 Aug 2024 13:48:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773502.1183974; Wed, 07 Aug 2024 13:48:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbh20-00067o-3T; Wed, 07 Aug 2024 13:48:48 +0000
Received: by outflank-mailman (input) for mailman id 773502;
 Wed, 07 Aug 2024 13:48:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nE80=PG=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sbh1x-0005AI-Tx
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2024 13:48:45 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3d58bc4-54c3-11ef-bc04-fd08da9f4363;
 Wed, 07 Aug 2024 15:48:45 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5bb8e62570fso2684663a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2024 06:48:45 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b83960f353sm7017710a12.15.2024.08.07.06.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 06:48:43 -0700 (PDT)
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
X-Inumbo-ID: c3d58bc4-54c3-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723038524; x=1723643324; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0P2O0so3M3+faOWsBdEY2/POlgK4yVIXKMk2Q6OuFU=;
        b=iAoiPvx3eMS3A+aZnAIzNn02TKhWoTZGBKy4BjNlv1A0OApXKCZzVuHnzS1hxN54ad
         exjUozp6ApvCoRNNLG3ue40u4U00SIUCpUXvtq6xZ/sAaeMKj3BLB8X5t9n7TWGpkHd0
         vlX5Uzm5z24KUryTXGQBoCBLbFOJgmCFiwyPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723038524; x=1723643324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0P2O0so3M3+faOWsBdEY2/POlgK4yVIXKMk2Q6OuFU=;
        b=Vo895biDKg1Ejz9G/nKeGRzdJF1jFMY8BoouipR5nqg5BC+oj6Gt16iF0GYblCE5dp
         2lpn0zw80ArKrrGHa94OyAcUVkp4Hu567291Qbj+Sq9nC08MMrbSWplcCCMSXaQZMwp6
         z/8iIsGPbYRl7VZ67gEpS3UkQDs8RKEXlwmrBPDkSiCdXgNCl35JrZ8qQktd80cYNlg9
         oBb4oMSGisZe45sPJ3HdGM3KBAWrPks7k/DybJ8/AKm8SJ71nnLNgJKYafo8P5kXYfQG
         zwAd5QPqj4ZVoytIvbO7mFmQpOHL7LnnVj0QqpdSwMA5iTnMvcxO/+kPtcwVKMA8XW46
         iRsw==
X-Gm-Message-State: AOJu0YwKvGetLtxhO2K4BXnYfr9uH0PR5ch2rvHZGZq1Xl9GaDrF7u6z
	5ciP+E99vVoOvOtZJPEGdcNh9F/wYhwldBb/Mr0Vd+9QaVrrtXrs2R4shdp4RrMfu/hg1fUfzux
	K
X-Google-Smtp-Source: AGHT+IFxiUbA4aqh8QoSftI9J0K9AalqflVdBk2c6Kh9BR0drMFevjsJzg2bcxaav/UmEHj0VqlgvA==
X-Received: by 2002:aa7:c3cc:0:b0:5a0:e62c:61bd with SMTP id 4fb4d7f45d1cf-5b7f5413b5cmr12727946a12.29.1723038524429;
        Wed, 07 Aug 2024 06:48:44 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 5/5] x86: Rollback relocation in case of EFI multiboot
Date: Wed,  7 Aug 2024 14:48:19 +0100
Message-ID: <20240807134819.8987-6-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
References: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case EFI not multiboot rolling back relocation is done in
efi_arch_post_exit_boot, called by efi_start however this is
not done in multiboot code path.
Do it also for this path to make it work correctly.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/head.S  | 29 +++++++++++++++---
 xen/arch/x86/boot/reloc.c | 63 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 87 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index abfa3d82f7..75ac74a589 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -352,6 +352,7 @@ __efi64_mb2_start:
         and     $~15,%rsp
 
         /* Save Multiboot2 magic on the stack. */
+        shlq    $32, %rax
         push    %rax
 
         /* Save EFI ImageHandle on the stack. */
@@ -382,11 +383,24 @@ __efi64_mb2_start:
         /* Just pop an item from the stack. */
         pop     %rax
 
-        /* Restore Multiboot2 magic. */
-        pop     %rax
+        /* Prepare stack for relocation call */
+        subq    $16, %rsp
+        lea     l2_bootmap(%rip), %ecx
+        movl    %ecx, 16(%rsp)
+        lea     l3_bootmap(%rip), %ecx
+        movl    %ecx, 12(%rsp)
+        lea     __base_relocs_end(%rip), %ecx
+        movl    %ecx, 8(%rsp)
+        lea     __base_relocs_start(%rip), %ecx
+        movl    %ecx, 4(%rsp)
+        lea     __image_base__(%rip),%rsi
+        movl    %esi, (%rsp)
+        movabsq $__XEN_VIRT_START, %rcx
+        subq    %rsi, %rcx
+        push    %rcx
 
-        /* Jump to trampoline_setup after switching CPU to x86_32 mode. */
-        lea     trampoline_setup(%rip),%r15
+        /* Jump to trampoline_efi_setup after switching CPU to x86_32 mode. */
+        lea     trampoline_efi_setup(%rip),%r15
 
 x86_32_switch:
         mov     %r15,%rdi
@@ -557,6 +571,12 @@ __start:
         and     $~(MULTIBOOT2_TAG_ALIGN-1),%ecx
         jmp     .Lmb2_tsize
 
+trampoline_efi_setup:
+        movb    $1, %al
+        call    reloc
+        pop     %eax
+        jmp     trampoline_setup
+
 trampoline_bios_setup:
         /*
          * Called on legacy BIOS platforms only.
@@ -627,6 +647,7 @@ trampoline_setup:
         push    %ecx                /* Bottom-most low-memory stack address. */
         push    %ebx                /* Multiboot / PVH information address. */
         push    %eax                /* Magic number. */
+        movb    $0, %al
         call    reloc
 #ifdef CONFIG_PVH_GUEST
         cmpb    $0, sym_esi(pvh_boot)
diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index 4033557481..3aa97a99d0 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -23,7 +23,9 @@ asm (
     "    .text                         \n"
     "    .globl _start                 \n"
     "_start:                           \n"
-    "    jmp  reloc                    \n"
+    "    cmpb $0, %al                  \n"
+    "    je   reloc                    \n"
+    "    jmp  reloc_pe_back            \n"
     );
 
 #include "defs.h"
@@ -375,6 +377,65 @@ void *__stdcall reloc(uint32_t magic, uint32_t in, uint32_t trampoline,
     }
 }
 
+struct pe_base_relocs {
+    u32 rva;
+    u32 size;
+    u16 entries[];
+};
+
+#define PE_BASE_RELOC_ABS      0
+#define PE_BASE_RELOC_HIGHLOW  3
+#define PE_BASE_RELOC_DIR64   10
+
+void __stdcall reloc_pe_back(long long delta,
+                             uint32_t xen_phys_start,
+                             const struct pe_base_relocs *__base_relocs_start,
+                             const struct pe_base_relocs *__base_relocs_end,
+                             char *l3_bootmap, char *l2_bootmap)
+{
+    const struct pe_base_relocs *base_relocs;
+
+    for ( base_relocs = __base_relocs_start; base_relocs < __base_relocs_end; )
+    {
+        unsigned int i = 0, n;
+
+        n = (base_relocs->size - sizeof(*base_relocs)) /
+            sizeof(*base_relocs->entries);
+
+        /*
+         * Relevant l{2,3}_bootmap entries get initialized explicitly in
+         * efi_arch_memory_setup(), so we must not apply relocations there.
+         * l2_directmap's first slot, otoh, should be handled normally, as
+         * efi_arch_memory_setup() won't touch it (xen_phys_start should
+         * never be zero).
+         */
+        if ( xen_phys_start + base_relocs->rva == (unsigned long)l3_bootmap ||
+             xen_phys_start + base_relocs->rva == (unsigned long)l2_bootmap )
+            i = n;
+
+        for ( ; i < n; ++i )
+        {
+            unsigned long addr = xen_phys_start + base_relocs->rva +
+                                 (base_relocs->entries[i] & 0xfff);
+
+            switch ( base_relocs->entries[i] >> 12 )
+            {
+            case PE_BASE_RELOC_ABS:
+                break;
+            case PE_BASE_RELOC_HIGHLOW:
+                if ( delta )
+                    *(u32 *)addr += delta;
+                break;
+            case PE_BASE_RELOC_DIR64:
+                if ( delta )
+                    *(u64 *)addr += delta;
+                break;
+            }
+        }
+        base_relocs = (const void *)(base_relocs->entries + i + (i & 1));
+    }
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.45.2


