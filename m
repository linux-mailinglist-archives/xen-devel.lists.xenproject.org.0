Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 889FD7CC8CD
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 18:28:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618303.961795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsmvu-00071K-Ol; Tue, 17 Oct 2023 16:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618303.961795; Tue, 17 Oct 2023 16:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsmvu-0006xM-KY; Tue, 17 Oct 2023 16:28:38 +0000
Received: by outflank-mailman (input) for mailman id 618303;
 Tue, 17 Oct 2023 16:28:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QyJ2=F7=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1qsmvs-0006TK-MO
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 16:28:36 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 386344da-6d0a-11ee-98d4-6d05b1d4d9a1;
 Tue, 17 Oct 2023 18:28:35 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-53e855d7dacso5458224a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Oct 2023 09:28:35 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
 by smtp.gmail.com with ESMTPSA id
 b42-20020a509f2d000000b0053e43492ef1sm1515759edf.65.2023.10.17.09.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 09:28:35 -0700 (PDT)
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
X-Inumbo-ID: 386344da-6d0a-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697560115; x=1698164915; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wd8+uivnFNjs5ojARqpzKIhd4CLZvYGC8SduRH3wwns=;
        b=kxdTIuJaIxwTj1s56hcO5ngaX8pCDYJPENFgGbH7OSAwTjU7/xmlRhIzfgKk835UOY
         8InkykWBusnFEb/rBA+9fvjH0BqF5ZSM98HEmzslrVu40cg1CDkouIdK/Dw1cqP/PL6W
         LpiJlvq4cID84Fb8AGcu4f2PqC1mAYFEB9b5yoc2U2HLHdzd/mpY9Vu3qscAEhMNGC3S
         dAOZQC0IvNoeIj8OnrWN5znl6S1/4fV0cL1s2N07lE2ztj9G8PES/e0owrFeikHmGtQ2
         CSx90aXsYJno/qpLaAAKtrYpZwKDBq22sojL6Q/VFwfw+6cJJJhYmYibC9cb74B62nBn
         scAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697560115; x=1698164915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wd8+uivnFNjs5ojARqpzKIhd4CLZvYGC8SduRH3wwns=;
        b=dXWn8Z499Po0Ghq95V5L50l5PyFPvFCSSgT5/U28F0uYU7+AByoQqZfXw5A34f9tcK
         croj07hriCiiPcNGkKowSi3asQFhp+qOEJ0oQcKwWzmBZScOIKu8ey2iPJbw2jF8S39N
         MjxTGLlKl8JX67mtzaY1ydkH426qWxdKq2zSJRmrNqkQzS+g4yeDSpgII8Ds4DgyqbYN
         V1Qy+xlFuypQDtMqCyxe1tSjbEKQmpI6SiA/4gG8VBatZwqvzj4JoLn27+N1I7gRKJZa
         jSe9sGKXba/fGZ4OwXbEDSSlbcHUsBtxq1Qf0I0s+hKDYXvbb+kylfGoSoTGnLW6Nk5S
         l6vg==
X-Gm-Message-State: AOJu0YwFDe6ezg3gKhZ3XjUhzhBkNovsD0yGog/U0OB+T/t4HoljqgdV
	HmT/mvr/XRDyZj3W66sCC3U=
X-Google-Smtp-Source: AGHT+IExRfgqF0ar4Uw/lTAoo37yoBstxFb3XX7ZSKhbmacQBwgsvAn76tNJe1OaOZAOL02C479skw==
X-Received: by 2002:a05:6402:26d4:b0:53e:37d1:a31f with SMTP id x20-20020a05640226d400b0053e37d1a31fmr2427959edd.28.1697560115437;
        Tue, 17 Oct 2023 09:28:35 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH -tip v3 3/3] x86/percpu: Introduce %rip-relative addressing to PER_CPU_VAR
Date: Tue, 17 Oct 2023 18:27:34 +0200
Message-ID: <20231017162811.200569-3-ubizjak@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231017162811.200569-1-ubizjak@gmail.com>
References: <20231017162811.200569-1-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce x86_64 %rip-relative addressing to PER_CPU_VAR macro.
Instructions using %rip-relative address operand are one byte shorter
than their absolute address counterparts and are also compatible with
position independent executable (-fpie) build. The patch reduces
code size of a test kernel build by 150 bytes.

PER_CPU_VAR macro is intended to be applied to a symbol and should
not be used with register operands. Introduce new __percpu macro and
use it in cmpxchg{8,16}b_emu.S instead.

Also add a missing function comment to this_cpu_cmpxchg8b_emu.

No functional changes intended.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
--
v2: Introduce PER_CPU_ARG macro to conditionally enable
    segment registers in cmpxchg{8,16}b_emu.S for CONFIG_SMP.
v3: Introduce __percpu macro instead of PER_CPU_ARG (hpa).
---
 arch/x86/include/asm/percpu.h | 12 ++++++++----
 arch/x86/lib/cmpxchg16b_emu.S | 12 ++++++------
 arch/x86/lib/cmpxchg8b_emu.S  | 30 +++++++++++++++++++++---------
 3 files changed, 35 insertions(+), 19 deletions(-)

diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percpu.h
index 54746903b8c3..02f1780f02f5 100644
--- a/arch/x86/include/asm/percpu.h
+++ b/arch/x86/include/asm/percpu.h
@@ -4,17 +4,21 @@
 
 #ifdef CONFIG_X86_64
 #define __percpu_seg		gs
+#define __percpu_rel		(%rip)
 #else
 #define __percpu_seg		fs
+#define __percpu_rel
 #endif
 
 #ifdef __ASSEMBLY__
 
 #ifdef CONFIG_SMP
-#define PER_CPU_VAR(var)	%__percpu_seg:var
-#else /* ! SMP */
-#define PER_CPU_VAR(var)	var
-#endif	/* SMP */
+#define __percpu		%__percpu_seg:
+#else
+#define __percpu
+#endif
+
+#define PER_CPU_VAR(var)	__percpu(var)__percpu_rel
 
 #ifdef CONFIG_X86_64_SMP
 #define INIT_PER_CPU_VAR(var)  init_per_cpu__##var
diff --git a/arch/x86/lib/cmpxchg16b_emu.S b/arch/x86/lib/cmpxchg16b_emu.S
index 6962df315793..4fb44894ad87 100644
--- a/arch/x86/lib/cmpxchg16b_emu.S
+++ b/arch/x86/lib/cmpxchg16b_emu.S
@@ -23,14 +23,14 @@ SYM_FUNC_START(this_cpu_cmpxchg16b_emu)
 	cli
 
 	/* if (*ptr == old) */
-	cmpq	PER_CPU_VAR(0(%rsi)), %rax
+	cmpq	__percpu (%rsi), %rax
 	jne	.Lnot_same
-	cmpq	PER_CPU_VAR(8(%rsi)), %rdx
+	cmpq	__percpu 8(%rsi), %rdx
 	jne	.Lnot_same
 
 	/* *ptr = new */
-	movq	%rbx, PER_CPU_VAR(0(%rsi))
-	movq	%rcx, PER_CPU_VAR(8(%rsi))
+	movq	%rbx, __percpu (%rsi)
+	movq	%rcx, __percpu 8(%rsi)
 
 	/* set ZF in EFLAGS to indicate success */
 	orl	$X86_EFLAGS_ZF, (%rsp)
@@ -42,8 +42,8 @@ SYM_FUNC_START(this_cpu_cmpxchg16b_emu)
 	/* *ptr != old */
 
 	/* old = *ptr */
-	movq	PER_CPU_VAR(0(%rsi)), %rax
-	movq	PER_CPU_VAR(8(%rsi)), %rdx
+	movq	__percpu (%rsi), %rax
+	movq	__percpu 8(%rsi), %rdx
 
 	/* clear ZF in EFLAGS to indicate failure */
 	andl	$(~X86_EFLAGS_ZF), (%rsp)
diff --git a/arch/x86/lib/cmpxchg8b_emu.S b/arch/x86/lib/cmpxchg8b_emu.S
index 873e4ef23e49..1c96be769adc 100644
--- a/arch/x86/lib/cmpxchg8b_emu.S
+++ b/arch/x86/lib/cmpxchg8b_emu.S
@@ -24,12 +24,12 @@ SYM_FUNC_START(cmpxchg8b_emu)
 	pushfl
 	cli
 
-	cmpl	0(%esi), %eax
+	cmpl	(%esi), %eax
 	jne	.Lnot_same
 	cmpl	4(%esi), %edx
 	jne	.Lnot_same
 
-	movl	%ebx, 0(%esi)
+	movl	%ebx, (%esi)
 	movl	%ecx, 4(%esi)
 
 	orl	$X86_EFLAGS_ZF, (%esp)
@@ -38,7 +38,7 @@ SYM_FUNC_START(cmpxchg8b_emu)
 	RET
 
 .Lnot_same:
-	movl	0(%esi), %eax
+	movl	(%esi), %eax
 	movl	4(%esi), %edx
 
 	andl	$(~X86_EFLAGS_ZF), (%esp)
@@ -53,18 +53,30 @@ EXPORT_SYMBOL(cmpxchg8b_emu)
 
 #ifndef CONFIG_UML
 
+/*
+ * Emulate 'cmpxchg8b %fs:(%rsi)'
+ *
+ * Inputs:
+ * %esi : memory location to compare
+ * %eax : low 32 bits of old value
+ * %edx : high 32 bits of old value
+ * %ebx : low 32 bits of new value
+ * %ecx : high 32 bits of new value
+ *
+ * Notably this is not LOCK prefixed and is not safe against NMIs
+ */
 SYM_FUNC_START(this_cpu_cmpxchg8b_emu)
 
 	pushfl
 	cli
 
-	cmpl	PER_CPU_VAR(0(%esi)), %eax
+	cmpl	__percpu (%esi), %eax
 	jne	.Lnot_same2
-	cmpl	PER_CPU_VAR(4(%esi)), %edx
+	cmpl	__percpu 4(%esi), %edx
 	jne	.Lnot_same2
 
-	movl	%ebx, PER_CPU_VAR(0(%esi))
-	movl	%ecx, PER_CPU_VAR(4(%esi))
+	movl	%ebx, __percpu (%esi)
+	movl	%ecx, __percpu 4(%esi)
 
 	orl	$X86_EFLAGS_ZF, (%esp)
 
@@ -72,8 +84,8 @@ SYM_FUNC_START(this_cpu_cmpxchg8b_emu)
 	RET
 
 .Lnot_same2:
-	movl	PER_CPU_VAR(0(%esi)), %eax
-	movl	PER_CPU_VAR(4(%esi)), %edx
+	movl	__percpu (%esi), %eax
+	movl	__percpu 4(%esi), %edx
 
 	andl	$(~X86_EFLAGS_ZF), (%esp)
 
-- 
2.41.0


