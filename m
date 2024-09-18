Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5B797BCBF
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2024 15:06:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800285.1210220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1squNi-0006dK-PK; Wed, 18 Sep 2024 13:06:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800285.1210220; Wed, 18 Sep 2024 13:06:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1squNi-0006bo-MZ; Wed, 18 Sep 2024 13:06:06 +0000
Received: by outflank-mailman (input) for mailman id 800285;
 Wed, 18 Sep 2024 13:06:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ios2=QQ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1squNh-0006bi-Q3
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2024 13:06:05 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c04eb5dc-75be-11ef-99a2-01e77a169b0f;
 Wed, 18 Sep 2024 15:06:00 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so1053176766b.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Sep 2024 06:06:00 -0700 (PDT)
Received: from mewpvdipd1023.corp.cloud.com ([52.174.59.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9061320b9asm585730266b.189.2024.09.18.06.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 06:05:58 -0700 (PDT)
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
X-Inumbo-ID: c04eb5dc-75be-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726664759; x=1727269559; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FHAq0V0VPgfwbPhb3xa0d5bxEv65dtBujskC53RS7N0=;
        b=d+uMfl3bsNdXXuewl2pv1ZlUNoatoRyuaXQW/h7m+mLgV0iPRfMqO8GPUQFxti1An6
         nIehf9D/VZ6v5bNFBnw9tMSI2of0AzpnNyChbso4BtwhWvOJ31AhnnK/scmcxLLU2iTy
         ZfU5F/NuyQ2tkcE2qm0qrQ1tRDveiiDPRSXMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726664759; x=1727269559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHAq0V0VPgfwbPhb3xa0d5bxEv65dtBujskC53RS7N0=;
        b=Kp17Bb5eRb3rdhJpiKFxgyAZ3B8JLzGvCZtmete4BVog3WD9lVqOFi/nSlhpMY39Z4
         EYqdMIoN5x5QoUo4capZaB0+B9M3YS1909OwQMF3oYuUGqM2tU5Q6ngollqI3bXUzuF4
         FGMRAO7bqNr7u8dZh0elg4XI2ScF/ZrKxGiNSVOe2iFGd2F3zmNA6wA3dOV+UCWpmqyG
         z0KZS1unVWjHMPnoJL7VwMToh6Kuderxywv1pSeAIjhKZpAavwnibp0d6FZzZakiqlVM
         luUEfKrsZl3vwuseX2W5SiaJ9Bw57sIMHxJ0xchWwID3wzo8ZCoevAfdYu0Ksqqg7/72
         kGnw==
X-Gm-Message-State: AOJu0Yzd5fHG2AJVo0WmW2ncSE9/KUCK49mfoD+tfuU3oC3k1DDWqwpy
	4p3um9UsUA1YSXHXelxK+1khQgk0BOGsxuVa+jsMpeQgd7/jPlvgZWJTAG2fnUfxCAYFSdnCi7W
	tQqE=
X-Google-Smtp-Source: AGHT+IFCQlRrxdOeKbLSe9RepfUrBviExjzLbuc2pGfCH2VDi51bcefsn1vYKCg35kxt5e39RSWeRg==
X-Received: by 2002:a17:907:6096:b0:a8b:6ee7:ba26 with SMTP id a640c23a62f3a-a90294a88d5mr2546159566b.1.1726664759121;
        Wed, 18 Sep 2024 06:05:59 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] x86/traps: Re-enable interrupts after reading cr2 in the #PF handler
Date: Wed, 18 Sep 2024 14:05:54 +0100
Message-ID: <20240918130554.97345-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moves sti directly after the cr2 read and immediately after the #PF
handler.

While in the area, remove redundant q suffix to a movq in entry.S

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
Got lost alongside other patches. Here's the promised v2.

pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/1458699639
v1: https://lore.kernel.org/xen-devel/20240911145823.12066-1-alejandro.vallejo@cloud.com/

v2:
  * (cosmetic), add whitespace after comma
  * Added ASSERT(local_irq_is_enabled()) to do_page_fault()
  * Only re-enable interrupts if they were enabled in the interrupted
    context.
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
index b8482de8ee5b..218e5ea85efb 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -844,9 +844,9 @@ handle_exception_saved:
 #elif !defined(CONFIG_PV)
         ASSERT_CONTEXT_IS_XEN
 #endif /* CONFIG_PV */
-        sti
-1:      movq  %rsp,%rdi
-        movzbl UREGS_entry_vector(%rsp),%eax
+.Ldispatch_handlers:
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
+        jz    .Ldispatch_handlers
         movq  %rax,UREGS_rip(%rsp)      # fixup regular stack
 
 #ifdef CONFIG_XEN_SHSTK
-- 
2.46.0


