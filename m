Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 169B59C3C6A
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 11:49:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833506.1248668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tARyr-0004sU-PR; Mon, 11 Nov 2024 10:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833506.1248668; Mon, 11 Nov 2024 10:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tARyr-0004qV-Mp; Mon, 11 Nov 2024 10:49:13 +0000
Received: by outflank-mailman (input) for mailman id 833506;
 Mon, 11 Nov 2024 10:49:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mW2F=SG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tARyq-0004qP-M4
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 10:49:12 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9299be9d-a01a-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 11:49:06 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-539f58c68c5so7274781e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 02:49:06 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0def48csm575533266b.155.2024.11.11.02.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2024 02:49:04 -0800 (PST)
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
X-Inumbo-ID: 9299be9d-a01a-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmQiLCJoZWxvIjoibWFpbC1sZjEteDEyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjkyOTliZTlkLWEwMWEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzIyMTQ2LjI2MDgxMiwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731322145; x=1731926945; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dNwJ2AToIEHIwEkCvp6Pq87mMK1+byPsYYAF0h0wiDw=;
        b=WWqfhPzQ3XbRU1gnKUGaM2WS38FuZeXYnUfWpa+3llb/3/HnoRC48NLNxD/JAnh+Wx
         KoezUB8q6V5J5ggkNTHWVC8sbD175H0L+mD172T1DknH8rnbBmFaJyxJsrvZO14NKwEv
         YORaeIuNJln7gi5G2jxSp+6QTbuQy4m2hOeYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731322145; x=1731926945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNwJ2AToIEHIwEkCvp6Pq87mMK1+byPsYYAF0h0wiDw=;
        b=dGP6iYiP32fxtmFXLqWj5xh/m4jfF+NC2alRm1/Zq/JBGcc2Axe/t/Bs0WSyakt3W9
         q1bTAbsmdxBzU5hsPyvCs2Yg/uifgkojoe/i7NOkYzip5oVovfPHXYiuZ3pMKzasGkJQ
         /jQNoUMvME6aLMQOL3g5xvqg2uwX53X/VpyREpt6A09MsXbNBDFSdF/UDSeMSO+mWtYE
         p6R/GrPEDzxpxZcUDlH5ny7c2bW3RpOw6RAUME7ibsdbbLAF+2DYdA/A37GTvhJRINQY
         tIxonNmDiiBo5W+kHDYPQKer1YXwX3d9H/oLNiSsa7Uiseg0Zb0SyiHVVNpf+tkn2ubK
         Uc+A==
X-Gm-Message-State: AOJu0Yy7L/6ON++XPjUPnkt09zim7lO566KUG1weoVQ41Ew9eNxGUpoX
	YYlx7DAh43z8Z9lvJmP6wccmzv3yzK+oWXiaAKECYtxty9Owhu/87Tc9E/i9mfYYTWYVJKFlTpK
	c
X-Google-Smtp-Source: AGHT+IH/14pheofl01b1r6SX5TiQ8MtbbOqlFs8QITX9yYBeDJRTOSU+Rav90+jMK/T1tg2Dj/sMKA==
X-Received: by 2002:a05:6512:1594:b0:539:8f68:e036 with SMTP id 2adb3069b0e04-53d862cd727mr7341297e87.34.1731322145080;
        Mon, 11 Nov 2024 02:49:05 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: [PATCH] x86/trampoline: Change type of trampoline_phys to uint32_t
Date: Mon, 11 Nov 2024 10:49:02 +0000
Message-Id: <20241111104902.985611-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As now documented, this variable holds a page aligned value less than 1M.

However, head.S fills it using 4-byte stores, and reloc_trampoline() is
compiled for both 32bit and 64bit, where unsigned long is a different size.

This happens to work because of the range of the value, but switch to uint32_t
to make it explicit.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>

Bloat-o-meter reports a marginal code-gen improvement:

  add/remove: 0/0 grow/shrink: 5/7 up/down: 26/-85 (-59)
  Function                                     old     new   delta
  enter_state_helper.cold                     1091    1100      +9
  __start_xen                                 8827    8835      +8
  __cpu_up.cold                                199     204      +5
  intel_unlock_cpuid_leaves                    102     104      +2
  acpi_enter_sleep_state                       397     399      +2
  efi_arch_memory_setup                        538     537      -1
  arch_init_memory                             632     631      -1
  trampoline_phys                                8       4      -4
  do_platform_op                              5439    5431      -8
  compat_platform_op                          5450    5442      -8
  reloc_trampoline64                           137     122     -15
  __cpu_up                                    1513    1465     -48
---
 xen/arch/x86/boot/reloc-trampoline.c  | 2 +-
 xen/arch/x86/efi/efi-boot.h           | 2 +-
 xen/arch/x86/include/asm/trampoline.h | 2 +-
 xen/arch/x86/smpboot.c                | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/boot/reloc-trampoline.c b/xen/arch/x86/boot/reloc-trampoline.c
index 0a74c1e75a4c..d5548eb08f85 100644
--- a/xen/arch/x86/boot/reloc-trampoline.c
+++ b/xen/arch/x86/boot/reloc-trampoline.c
@@ -15,7 +15,7 @@ void reloc_trampoline64(void)
 #error Unknown architecture
 #endif
 {
-    unsigned long phys = trampoline_phys;
+    uint32_t phys = trampoline_phys;
     const int32_t *trampoline_ptr;
 
     /*
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 3133985c88f8..7930b7c73892 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -235,7 +235,7 @@ static void __init noreturn efi_arch_post_exit_boot(void)
     u64 cr4 = XEN_MINIMAL_CR4 & ~X86_CR4_PGE, efer;
 
     efi_arch_relocate_image(__XEN_VIRT_START - xen_phys_start);
-    memcpy((void *)trampoline_phys, trampoline_start, cfg.size);
+    memcpy(_p(trampoline_phys), trampoline_start, cfg.size);
 
     /*
      * We're in physical mode right now (i.e. identity map), so a regular
diff --git a/xen/arch/x86/include/asm/trampoline.h b/xen/arch/x86/include/asm/trampoline.h
index 838c2f0b6fcd..8c1e0b48c2c9 100644
--- a/xen/arch/x86/include/asm/trampoline.h
+++ b/xen/arch/x86/include/asm/trampoline.h
@@ -52,7 +52,7 @@ extern char trampoline_start[], trampoline_end[];
  * the 1M boundary (as the trampoline contains 16-bit code), and must be 4k
  * aligned (SIPI requirement for APs).
  */
-extern unsigned long trampoline_phys;
+extern uint32_t trampoline_phys;
 
 /*
  * Calculate the physical address of a symbol in the trampoline.
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 9e79c1a6d6e6..7f0f57bb8ffe 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -39,7 +39,7 @@
 #include <irq_vectors.h>
 #include <mach_apic.h>
 
-unsigned long __read_mostly trampoline_phys;
+uint32_t __ro_after_init trampoline_phys;
 enum ap_boot_method __read_mostly ap_boot_method = AP_BOOT_NORMAL;
 
 /* representing HT siblings of each logical CPU */
-- 
2.39.5


