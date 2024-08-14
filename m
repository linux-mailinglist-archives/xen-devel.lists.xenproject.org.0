Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5B39516AD
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 10:35:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776850.1187054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9TB-0004NK-Ml; Wed, 14 Aug 2024 08:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776850.1187054; Wed, 14 Aug 2024 08:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9TB-0004G8-Fm; Wed, 14 Aug 2024 08:35:01 +0000
Received: by outflank-mailman (input) for mailman id 776850;
 Wed, 14 Aug 2024 08:35:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jxPN=PN=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1se9TA-0002t1-3f
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 08:35:00 +0000
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [2607:f8b0:4864:20::e2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 175b8caa-5a18-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 10:34:59 +0200 (CEST)
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-492a01bce97so2246922137.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 01:34:59 -0700 (PDT)
Received: from fziglio-xenia-fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a4c7e05595sm407786785a.122.2024.08.14.01.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2024 01:34:58 -0700 (PDT)
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
X-Inumbo-ID: 175b8caa-5a18-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723624498; x=1724229298; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hx6AIwlEbMHavC5DjEjakTrNbCVEjBb0SKVNkWMFXTc=;
        b=hN5Oh2eW3WaDyDtMkMUKMYqhlwsaIHHRbPiZFw1qmF8JftzGcJ30bax86QiFXOG4sW
         x2pJkGIlTsv5lfb/NDrJgUhMx5SqswPWpEfUiNE+9LlkID12mXA350jl59UbgKy+ytWD
         xkXSqfCUeczJYMi+2B1HME+acSCyJovlXJn/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723624498; x=1724229298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hx6AIwlEbMHavC5DjEjakTrNbCVEjBb0SKVNkWMFXTc=;
        b=j6IktMvRA45hviFyWD9sPur/l+oA/6BMKCHA8OIM8+3YMsD8MK+BG9Zw/21HoqF0oF
         30YAA3eL3e0oP92EF7bUb6HHrufGvb5JlRKGyfYUb59g99Dt6wEi8m/A0ch47njjdUYv
         2kayIYQuSvLq9IK0xo9xRFtIqQjnTIFjNfvuCnDrdQFrgSf3BS76LiYiAeD7NeM4/1UK
         /PHqyY+TvFcpxPjbavorYzmeeAtz5wLTtM+nuKmrgQ/ZSlB5Gw+1l4jzkK0yIVPNTx+f
         NuZH7AZ2hUTp9qVpT46eqIP5ffWYxhZO3Y5jyTAcOzWu2a3cnLAWLScE6JNojrJdRFs8
         FqCQ==
X-Gm-Message-State: AOJu0YyqjeHFMYwAtJTHMcTepqFN5Qj2R8nwI2Po8rXPvvGyyOKNQgXC
	sBhEKC1GkuT0cqonOI0Idu0rjFErLoX93okUynAIbpekd34uwQycSBofuzoLfdfykMx57wrmwYp
	K
X-Google-Smtp-Source: AGHT+IFL70GY1qUxURIAZQ+mo6txlE+c+ln237y0PC4cC3hmxTtF9rJyDjIROcbYWReJ7g4d9xoUaQ==
X-Received: by 2002:a05:6102:3593:b0:48f:89cc:dd2b with SMTP id ada2fe7eead31-4975992d5efmr2467012137.11.1723624498219;
        Wed, 14 Aug 2024 01:34:58 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 3/5] x86: Force proper gdt_boot_base setting
Date: Wed, 14 Aug 2024 09:34:12 +0100
Message-ID: <20240814083428.3012-4-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240814083428.3012-1-frediano.ziglio@cloud.com>
References: <20240814083428.3012-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of relocate the value at that position compute it
entirely and write it.
During EFI boots sym_offs(SYMBOL) are potentially relocated
causing the values to be corrupted.
For PVH and BIOS the change won't be necessary but keep the
code consistent.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/head.S | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index af598a60bf..666e341bc5 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -132,8 +132,7 @@ multiboot2_header:
 gdt_boot_descr:
         .word   .Ltrampoline_gdt_end - trampoline_gdt - 1
 gdt_boot_base:
-        .long   sym_offs(trampoline_gdt)
-        .long   0 /* Needed for 64-bit lgdt */
+        .quad   0 /* Needed for 64-bit lgdt */
 
 vga_text_buffer:
         .long   0xb8000
@@ -373,15 +372,16 @@ __efi64_mb2_start:
 x86_32_switch:
         mov     %r15,%rdi
 
-        /* Store Xen image load base address in place accessible for 32-bit code. */
-        lea     __image_base__(%rip),%esi
-
         cli
 
         /* Initialize GDTR. */
-        add     %esi,gdt_boot_base(%rip)
+        lea     trampoline_gdt(%rip), %esi
+        mov     %esi, gdt_boot_base(%rip)
         lgdt    gdt_boot_descr(%rip)
 
+        /* Store Xen image load base address in place accessible for 32-bit code. */
+        lea     __image_base__(%rip),%esi
+
         /* Reload code selector. */
         pushq   $BOOT_CS32
         lea     cs32_switch(%rip),%edx
@@ -439,7 +439,8 @@ __pvh_start:
         movb    $-1, sym_esi(opt_console_xen)
 
         /* Prepare gdt and segments */
-        add     %esi, sym_esi(gdt_boot_base)
+        lea     sym_esi(trampoline_gdt), %ecx
+        mov     %ecx, sym_esi(gdt_boot_base)
         lgdt    sym_esi(gdt_boot_descr)
 
         mov     $BOOT_DS, %ecx
@@ -543,7 +544,8 @@ trampoline_bios_setup:
          *
          * Initialize GDTR and basic data segments.
          */
-        add     %esi,sym_esi(gdt_boot_base)
+        lea     sym_esi(trampoline_gdt), %ecx
+        mov     %ecx, sym_esi(gdt_boot_base)
         lgdt    sym_esi(gdt_boot_descr)
 
         mov     $BOOT_DS,%ecx
-- 
2.45.2


