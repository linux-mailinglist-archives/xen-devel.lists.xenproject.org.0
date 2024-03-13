Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A6F87A96A
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 15:27:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692456.1079623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkPZC-0003zn-Pu; Wed, 13 Mar 2024 14:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692456.1079623; Wed, 13 Mar 2024 14:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkPZC-0003x4-M9; Wed, 13 Mar 2024 14:26:50 +0000
Received: by outflank-mailman (input) for mailman id 692456;
 Wed, 13 Mar 2024 14:26:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M9/O=KT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rkPZA-0003iP-GP
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 14:26:48 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8fa6dd5-e145-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 15:26:47 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-512bde3d197so5790762e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 07:26:46 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b15-20020a170906194f00b00a4665f829a9sm159681eje.90.2024.03.13.07.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 07:26:44 -0700 (PDT)
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
X-Inumbo-ID: b8fa6dd5-e145-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710340005; x=1710944805; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXVQ+Dqyc78LR6Ra+wwAzbMl89ontQsPF8SkdAS3z1w=;
        b=t51o/givEajLPkvwof0HL6ErCeyMP9BmTW7/P6FgX47PLkos1Hs+M0sVihzoVmpD13
         GtPvwkEDyRrUhUj1j+PQc/3x/PoBGl6kJHAMaDEp9MZZhubQR4HdT1HJv5tXObsAYSde
         hUjBRbW9nUzWMsmkUBoxK36Vkwp3AkdslwkHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710340005; x=1710944805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nXVQ+Dqyc78LR6Ra+wwAzbMl89ontQsPF8SkdAS3z1w=;
        b=B00/vCdmMqpMjh+X9SL7wU+Edo4WMMMvIQf5GvhG2Nfw1aIM0YvFUAUgDcDTO+8U6s
         N7bmSXqKQX9KBK4zy3mQze2CaDDbqjDbQjqipERIDzI9AQmjV3WjmCl20b2EeBod/X+R
         PIbY1k96/ANXRHEY3ZcGX05coEtASrDb7p3v86RcyfFP00QdY/JvydKdn7uH1SV6FW4l
         MGddQYvPgzP/kO7ueFWvfUHI9vBvn0fhrHbpaKiF/5zjUnLuLlmESKIJ58nQuIGJiYPz
         55zzpFWGlar8ung4RoWiIZug60M5GSy3uVtWPyiufTFNdPXc7CmpT6OEYFSupQmo8ztA
         l37A==
X-Gm-Message-State: AOJu0YzIGqyfJV5ugqFIFDYolAsvsue1N02QS9e5zK7LIqnt59LNNC+N
	ighOTv1mrPJOuo3vsGP0F8aheSO8jhbN/DMBliOBA9CboMC2TcgOGywPLM2doAQpPckxJHdLkDS
	i
X-Google-Smtp-Source: AGHT+IFEPQpjfCqBquDUOKQ25b+Y0k4nn9j6cItZnIX349LqilO1ebgxQxDtOd7IeiVurWP0nATcNA==
X-Received: by 2002:a19:7715:0:b0:513:a2b1:6291 with SMTP id s21-20020a197715000000b00513a2b16291mr6760022lfc.7.1710340005393;
        Wed, 13 Mar 2024 07:26:45 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] x86/entry: Introduce POP_GPRS
Date: Wed, 13 Mar 2024 14:26:40 +0000
Message-Id: <20240313142641.2150302-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240313142641.2150302-1-andrew.cooper3@citrix.com>
References: <20240313142641.2150302-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The macro named RESTORE_ALL has several problems.  It adjusts the stack
pointer despite this not being clear to the caller.  It also goes against
recommendations in the optimisation guides because of trying to do too many
things at once.  (i.e. there's a reason why compilers don't emit code looking
like this.)

Introduce a new POP_GPRS macro which only POPs GPRs.  Use it for the HVM paths
which are already using POPs.

Also use it for restore_all_{xen,guest}().  This saves most of a cacheline
worth of code from two fastpaths:

  add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-99 (-99)
  Function                                     old     new   delta
  restore_all_guest                            378     330     -48
  restore_all_xen                              165     114     -51

but it also avoids having an explicit modification to the stack pointer
between %rsp-relative accesses, which avoids stalls in the stack-engine
optimisations in some microarchitectures.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/svm/entry.S         | 17 ++---------------
 xen/arch/x86/hvm/vmx/entry.S         | 16 +---------------
 xen/arch/x86/include/asm/asm_defns.h | 23 +++++++++++++++++++++++
 xen/arch/x86/x86_64/asm-offsets.c    |  1 +
 xen/arch/x86/x86_64/entry.S          | 12 ++++++------
 5 files changed, 33 insertions(+), 36 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index 60b0b00ed0af..305f9466096a 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -74,22 +74,9 @@ __UNLIKELY_END(nsvm_hap)
         ALTERNATIVE "", svm_vmentry_spec_ctrl, X86_FEATURE_SC_MSR_HVM
         ALTERNATIVE "", DO_SPEC_CTRL_DIV, X86_FEATURE_SC_DIV
 
-        pop  %r15
-        pop  %r14
-        pop  %r13
-        pop  %r12
-        pop  %rbp
         mov  VCPU_svm_vmcb_pa(%rbx),%rax
-        pop  %rbx
-        pop  %r11
-        pop  %r10
-        pop  %r9
-        pop  %r8
-        pop  %rcx /* Skip %rax: restored by VMRUN. */
-        pop  %rcx
-        pop  %rdx
-        pop  %rsi
-        pop  %rdi
+
+        POP_GPRS rax=%rcx /* Skip %rax.  It's restored by VMRUN. */
 
         sti
         vmrun
diff --git a/xen/arch/x86/hvm/vmx/entry.S b/xen/arch/x86/hvm/vmx/entry.S
index 1bead826caa3..92d8b919198c 100644
--- a/xen/arch/x86/hvm/vmx/entry.S
+++ b/xen/arch/x86/hvm/vmx/entry.S
@@ -115,21 +115,7 @@ UNLIKELY_END(realmode)
         and  $SCF_verw, %eax
         or   %eax, %ecx
 
-        pop  %r15
-        pop  %r14
-        pop  %r13
-        pop  %r12
-        pop  %rbp
-        pop  %rbx
-        pop  %r11
-        pop  %r10
-        pop  %r9
-        pop  %r8
-        pop  %rax
-        pop  %rcx
-        pop  %rdx
-        pop  %rsi
-        pop  %rdi
+        POP_GPRS
 
         jpe  .L_skip_verw
         /* VERW clobbers ZF, but preserves all others, including SF. */
diff --git a/xen/arch/x86/include/asm/asm_defns.h b/xen/arch/x86/include/asm/asm_defns.h
index a69fae78b123..ec10a8e1dfc6 100644
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -314,6 +314,29 @@ static always_inline void stac(void)
         subq  $-(UREGS_error_code-UREGS_r15+\adj), %rsp
 .endm
 
+/*
+ * POP GPRs from a UREGS_* frame on the stack.  Does not modify flags.
+ *
+ * @rax: Alternative destination for the %rax value on the stack.
+ */
+.macro POP_GPRS rax=%rax
+        pop   %r15
+        pop   %r14
+        pop   %r13
+        pop   %r12
+        pop   %rbp
+        pop   %rbx
+        pop   %r11
+        pop   %r10
+        pop   %r9
+        pop   %r8
+        pop   \rax
+        pop   %rcx
+        pop   %rdx
+        pop   %rsi
+        pop   %rdi
+.endm
+
 #ifdef CONFIG_PV32
 #define CR4_PV32_RESTORE                               \
     ALTERNATIVE_2 "",                                  \
diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index d8903a3ce9c7..944f49a82171 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -59,6 +59,7 @@ void __dummy__(void)
     DEFINE(sym, offsetof(struct cpu_user_regs, mem) -                   \
                 offsetof(struct cpu_user_regs, error_code) __VA_ARGS__)
 
+    OFFSET_EF(EFRAME_error_code,      error_code);
     OFFSET_EF(EFRAME_entry_vector,    entry_vector);
     OFFSET_EF(EFRAME_rip,             rip);
     OFFSET_EF(EFRAME_cs,              cs);
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 7d686b762807..9280216a5436 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -186,7 +186,8 @@ FUNC_LOCAL(restore_all_guest)
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
         SPEC_CTRL_EXIT_TO_PV    /* Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: cd */
 
-        RESTORE_ALL
+        POP_GPRS
+
         BUILD_BUG_ON(TRAP_syscall & 0xff)
         testb $TRAP_syscall >> 8, EFRAME_entry_vector + 1(%rsp)
         jz    iret_exit_to_guest
@@ -696,20 +697,19 @@ UNLIKELY_END(exit_cr3)
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
         SPEC_CTRL_EXIT_TO_XEN /* Req: %r12=ist_exit %r14=end %rsp=regs, Clob: abcd */
 
-        RESTORE_ALL adj=8
+        POP_GPRS
 
         /*
          * When the CPU pushed this exception frame, it zero-extended eflags.
          * For an IST exit, SPEC_CTRL_EXIT_TO_XEN stashed shadow copies of
          * spec_ctrl_flags and ver_sel above eflags, as we can't use any GPRs,
          * and we're at a random place on the stack, not in a CPUFINFO block.
-         *
-         * Account for ev/ec having already been popped off the stack.
          */
         SPEC_CTRL_COND_VERW \
-            scf=STK_REL(EFRAME_shadow_scf, EFRAME_rip), \
-            sel=STK_REL(EFRAME_shadow_sel, EFRAME_rip)
+            scf=STK_REL(EFRAME_shadow_scf, EFRAME_error_code), \
+            sel=STK_REL(EFRAME_shadow_sel, EFRAME_error_code)
 
+        add   $8, %rsp
         iretq
 END(restore_all_xen)
 
-- 
2.30.2


