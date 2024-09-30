Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AE198A173
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 14:07:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807339.1218726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svFAh-0003GS-Ka; Mon, 30 Sep 2024 12:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807339.1218726; Mon, 30 Sep 2024 12:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svFAh-0003E0-Hr; Mon, 30 Sep 2024 12:06:35 +0000
Received: by outflank-mailman (input) for mailman id 807339;
 Mon, 30 Sep 2024 12:06:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Bw3=Q4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1svFAf-0003C7-Qw
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 12:06:33 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f17fde1-7f24-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 14:06:33 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c42e7adbddso6219058a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 05:06:33 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2947a3csm523597966b.133.2024.09.30.05.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 05:06:31 -0700 (PDT)
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
X-Inumbo-ID: 6f17fde1-7f24-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727697992; x=1728302792; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGGrxqicQVSXCHfRVWcyTh3sJpfhpUvmWFFfp1PKEg0=;
        b=BTGk/9XljdRsmxjM8Jm/GqISi00PPD3MQrI11vJwOzHv+k6BL0fuS32I3t2V0aOhxW
         r7AKAobWaljdyYcFf7AxY/hVNWGAFesn6B0W2/b4ZsdHjIBvgGlirlrb4rp49vluJidm
         rVfxkHsAoixXWGEVA+k0oLhbp217EuNv6aslE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697992; x=1728302792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mGGrxqicQVSXCHfRVWcyTh3sJpfhpUvmWFFfp1PKEg0=;
        b=f1BHjZLu00e8e3Uc5rN2XetV4TwZYp57pj85pj+cqlBhKi3YRcprwUeG1vfCFBrHQr
         FjY4YucyUjSettDCwoIgGFEm66MzCYmArAJtpg3EU7PrVRBQzoG44McaqB7TT/lBDtEm
         rmOVMRbegLJANirvGFt3Sy3bSqUrWoMshutFKmUKbNBe9eu7ugbuc/nfQmy/a3S0ASfo
         ze+doJ8Px3WmDKnvQMtwKe9c43ZjP2O0qbpDqV5GtyvEa1LgkmEnR9bbjsy3N25/lOSI
         29+7PZJFNTOcDnN7D+Jeilhk2YRrcTK5zUzD0uX2itxivViznKB6pD76zAJu0/+Hq+zl
         WGhQ==
X-Gm-Message-State: AOJu0YzQXUMozsJju00uEAc5Q3You4Y1atx5qsAj8NM+nDmRXcDBTewb
	hK2/p4nqxDoxmhzMx5+b4L2NTymlfk3sU323RpfLLnPgErbA0CnjWDRkE7bS3uW1sMgFttcpFiB
	hI+k=
X-Google-Smtp-Source: AGHT+IG5bI+aopNvuxLIWHO0qY9ZSSFM6FVmJdWmncFKXpGdUvUCAC/d8ln1p+vcOZMe0gl6FWg/lw==
X-Received: by 2002:a17:907:3d91:b0:a7d:a680:23b5 with SMTP id a640c23a62f3a-a93c492a5a1mr1229195566b.33.1727697992009;
        Mon, 30 Sep 2024 05:06:32 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Daniel Smith <dpsmith@apertussolutions.com>
Subject: [PATCH RFC] x86/boot: Call efi_multiboot2() at it's linked address
Date: Mon, 30 Sep 2024 13:06:28 +0100
Message-Id: <20240930120628.1072839-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240819142953.415817-1-frediano.ziglio@cloud.com>
References: <20240819142953.415817-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When entering via MB2+EFI, the early EFI code hasn't been relocated down to
it's load address.  As a consequence, efi_multboot2() is still expecting to
run at high address.

To set this up, we need Xen's high mappings, while also retaining the EFI
physical-mode mappings in the low half.  Introduce a new efi_l4_bootmap[] for
the purpose.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Daniel Smith <dpsmith@apertussolutions.com>

Very RFC, compile tested only.
---
 xen/arch/x86/boot/head.S   | 69 +++++++++++++++++++++++++++++++++++++-
 xen/arch/x86/boot/x86_64.S |  4 +++
 2 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index e0901ee40044..ef07f30d13da 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -344,6 +344,66 @@ __efi64_mb2_start:
         lea     .Lmb2_no_ih(%rip),%r15
         jz      x86_32_switch
 
+        push    %rax
+        push    %rcx
+        push    %rdx
+        push    %rsi
+        push    %rdi
+
+        /* Merge lower half of EFI pagtables with upper half of Xen pagetables */
+        mov     %cr3, %rsi
+        lea     efi_l4_bootmap(%rip), %rdi
+        mov     $L4_PAGETABLE_ENTRIES / 2, %ecx
+        rep movsq
+        lea     ((L4_PAGETABLE_ENTRIES / 2) * 8) + idle_pg_table(%rip), %rsi
+        mov     $L4_PAGETABLE_ENTRIES / 2, %ecx
+        rep movsq
+
+        /* Switch to merged pagetables */
+        lea     efi_l4_bootmap(%rip), %rax
+        mov     %rax, %cr3
+
+        lea     __image_base__(%rip), %esi
+
+        /* Map Xen into the higher mappings using 2M superpages. */
+        lea     _PAGE_PSE + PAGE_HYPERVISOR_RWX + sym_esi(_start), %eax
+        mov     $sym_offs(_start),   %ecx   /* %eax = PTE to write ^      */
+        mov     $sym_offs(_end - 1), %edx
+        shr     $L2_PAGETABLE_SHIFT, %ecx   /* %ecx = First slot to write */
+        shr     $L2_PAGETABLE_SHIFT, %edx   /* %edx = Final slot to write */
+
+1:      mov     %eax, sym_offs(l2_xenmap)(%esi, %ecx, 8)
+        add     $1, %ecx
+        add     $1 << L2_PAGETABLE_SHIFT, %eax
+
+        cmp     %edx, %ecx
+        jbe     1b
+
+        /*
+         * Map Xen into the directmap (needed for early-boot pagetable
+         * handling/walking), and identity map Xen into bootmap (needed for
+         * the transition into long mode), using 2M superpages.
+         */
+        lea     sym_esi(_start), %ecx
+        lea     -1 + sym_esi(_end), %edx
+        lea     _PAGE_PSE + PAGE_HYPERVISOR_RWX(%ecx), %eax /* PTE to write. */
+        shr     $L2_PAGETABLE_SHIFT, %ecx                   /* First slot to write. */
+        shr     $L2_PAGETABLE_SHIFT, %edx                   /* Final slot to write. */
+
+1:      mov     %eax, sym_offs(l2_bootmap)  (%esi, %ecx, 8)
+        mov     %eax, sym_offs(l2_directmap)(%esi, %ecx, 8)
+        add     $1, %ecx
+        add     $1 << L2_PAGETABLE_SHIFT, %eax
+
+        cmp     %edx, %ecx
+        jbe     1b
+
+        pop     %rdi
+        pop     %rsi
+        pop     %rdx
+        pop     %rcx
+        pop     %rax
+
         /* Save Multiboot2 magic on the stack. */
         push    %rax
 
@@ -354,8 +414,15 @@ __efi64_mb2_start:
          * efi_multiboot2() is called according to System V AMD64 ABI:
          *   - IN:  %rdi - EFI ImageHandle, %rsi - EFI SystemTable,
          *          %rdx - MB2 cmdline
+         *
+         * Call via the high mappings
          */
-        call    efi_multiboot2
+        lea     __image_base__(%rip), %r10
+        lea     efi_multiboot2(%rip), %rax
+        sub     %r10, %rax
+        mov     $__XEN_VIRT_START, %r10
+        addq    %r10, %rax
+        call    *%rax
 
         /* Just pop an item from the stack. */
         pop     %rax
diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
index 04bb62ae8680..93938d0b03f8 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -206,3 +206,7 @@ GLOBAL(l2_bootmap)
 GLOBAL(l3_bootmap)
         .fill L3_PAGETABLE_ENTRIES, 8, 0
         .size l3_bootmap, . - l3_bootmap
+
+efi_l4_bootmap:
+        .fill L4_PAGETABLE_ENTRIES, 8, 0
+        .size efi_l4_bootmap, . - efi_l4_bootmap

base-commit: 457052167b4dbcda59e06300039302479cc1debf
-- 
2.39.5


