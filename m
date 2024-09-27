Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B571988786
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 16:49:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806340.1217668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suCGi-0005RY-1o; Fri, 27 Sep 2024 14:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806340.1217668; Fri, 27 Sep 2024 14:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suCGh-0005Pf-VH; Fri, 27 Sep 2024 14:48:27 +0000
Received: by outflank-mailman (input) for mailman id 806340;
 Fri, 27 Sep 2024 14:48:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lwNM=QZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1suCGh-0005PZ-5m
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 14:48:27 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ca16cd5-7cdf-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 16:48:25 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5398b589032so306206e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 07:48:25 -0700 (PDT)
Received: from mewpvdipd1023.corp.cloud.com ([52.174.59.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27c58e1sm142625666b.58.2024.09.27.07.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 07:48:23 -0700 (PDT)
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
X-Inumbo-ID: 8ca16cd5-7cdf-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727448504; x=1728053304; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZeXnWGkSfJrKVWToCCiBwAKBXIRPNqewnadfBa2N6OY=;
        b=MZA33gHiYxfTommSsCB/6Q8QQpCC4Zuqyk0u19j9OpI+NvelUD2nDPN0kOMDtp/OIm
         nVeZkjS5DHmGnR3Bdlhbb8pHl+A1JyppMSYLvCwP4b7gMy+hkRWLjf2XcMzvJVReXurq
         Hv5ULVcEVsI8NAQjzmjAclT3zsl7XzynVIHEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727448504; x=1728053304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZeXnWGkSfJrKVWToCCiBwAKBXIRPNqewnadfBa2N6OY=;
        b=J18uxtZoOg21xIwnYjuMM3WVzi6QtogbwcWXH2NOkC9fxfao3HO5jivExnuNKOXLka
         IV0nOYrzv+QYQAhzMxgmZb/3k4twkK0eBlBryZnPYHCoB3ITeXk0rTCnZbG3qY0Pcext
         oSVHRo1W3vZeHSDwe5XmkLUXOSoQhxto8WnuCC4vA5MALl5zzspYQF2jkLyZ36MvLWVt
         W3bsCW4/OuXFTVo1wUzv+OR8zHyMKMzKtGVnJh0i+1oEkME/9LzcyJ4ILVbHchwUBAec
         ri1OwhE/S5//qjlWg42VHvkb9qXr8kGPZU2wvFlFzuL6FTHhAkA7ZNJ0jQ5O4YnkHJOt
         Wvmg==
X-Gm-Message-State: AOJu0YzJzkM6ozjSxfCXIMUoGPLiZ6sf5XuVLdBmFmlGrofrslgx5Tb2
	rWXdMbTvthmMP4YQrQKKiknpVwglEduI2ZQ2/4luGAR+84647qcDmdPkwNvUz26uzVCJ70Tg/bt
	U5Kg=
X-Google-Smtp-Source: AGHT+IGB8c+q79IHtbrG+w/LfUZmxeiwAuteEISMaV0jlA8DGDvcUBWFl49PepHB7YAlYK0KbpsSMQ==
X-Received: by 2002:a05:6512:4025:b0:52c:d628:c77c with SMTP id 2adb3069b0e04-5389fc7d15bmr2906265e87.43.1727448504102;
        Fri, 27 Sep 2024 07:48:24 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3-resend] x86/traps: Re-enable interrupts after reading cr2 in the #PF handler
Date: Fri, 27 Sep 2024 15:48:20 +0100
Message-ID: <20240927144820.300553-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hitting a page fault clobbers %cr2, so if a page fault is handled while
handling a previous page fault then %cr2 will hold the address of the
latter fault rather than the former. In particular, if a debug key
handler happens to trigger during #PF and before %cr2 is read, and that
handler itself encounters a #PF, then %cr2 will be corrupt for the outer #PF
handler.

This patch makes the page fault path delay re-enabling IRQs until %cr2
has been read in order to ensure it stays consistent.

A similar argument holds in additional cases, but they happen to be safe:
    * %dr6 inside #DB: Safe because IST exceptions don't re-enable IRQs.
    * MSR_XFD_ERR inside #NM: Safe because AMX isn't used in #NM handler.

While in the area, remove redundant q suffix to a movq in entry.S and
the space after the comma.

Fixes: a4cd20a19073 ("[XEN] 'd' key dumps both host and guest state.")
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
v3:
  * s/dispatch_handlers/dispatch_exceptions/
  * Updated commit message, spelling out the state of #DB and #NM, and
    state an existing race with debug keys.
---
 xen/arch/x86/traps.c        |  8 ++++++++
 xen/arch/x86/x86_64/entry.S | 20 ++++++++++++++++----
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 708136f62558..a9c2c607eb08 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1600,6 +1600,14 @@ void asmlinkage do_page_fault(struct cpu_user_regs *regs)
 
     addr = read_cr2();
 
+    /*
+     * Don't re-enable interrupts if we were running an IRQ-off region when
+     * we hit the page fault, or we'll break that code.
+     */
+    ASSERT(!local_irq_is_enabled());
+    if ( regs->flags & X86_EFLAGS_IF )
+        local_irq_enable();
+
     /* fixup_page_fault() might change regs->error_code, so cache it here. */
     error_code = regs->error_code;
 
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index b8482de8ee5b..9b0cdb76408b 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -844,9 +844,9 @@ handle_exception_saved:
 #elif !defined(CONFIG_PV)
         ASSERT_CONTEXT_IS_XEN
 #endif /* CONFIG_PV */
-        sti
-1:      movq  %rsp,%rdi
-        movzbl UREGS_entry_vector(%rsp),%eax
+.Ldispatch_exceptions:
+        mov   %rsp, %rdi
+        movzbl UREGS_entry_vector(%rsp), %eax
 #ifdef CONFIG_PERF_COUNTERS
         lea   per_cpu__perfcounters(%rip), %rcx
         add   STACK_CPUINFO_FIELD(per_cpu_offset)(%r14), %rcx
@@ -866,7 +866,19 @@ handle_exception_saved:
         jmp   .L_exn_dispatch_done;    \
 .L_ ## vec ## _done:
 
+        /*
+         * IRQs kept off to derisk being hit by a nested interrupt before
+         * reading %cr2. Otherwise a page fault in the nested interrupt handler
+         * would corrupt %cr2.
+         */
         DISPATCH(X86_EXC_PF, do_page_fault)
+
+        /* Only re-enable IRQs if they were active before taking the fault */
+        testb $X86_EFLAGS_IF >> 8, UREGS_eflags + 1(%rsp)
+        jz    1f
+        sti
+1:
+
         DISPATCH(X86_EXC_GP, do_general_protection)
         DISPATCH(X86_EXC_UD, do_invalid_op)
         DISPATCH(X86_EXC_NM, do_device_not_available)
@@ -911,7 +923,7 @@ exception_with_ints_disabled:
         movq  %rsp,%rdi
         call  search_pre_exception_table
         testq %rax,%rax                 # no fixup code for faulting EIP?
-        jz    1b
+        jz    .Ldispatch_exceptions
         movq  %rax,UREGS_rip(%rsp)      # fixup regular stack
 
 #ifdef CONFIG_XEN_SHSTK
-- 
2.46.0


