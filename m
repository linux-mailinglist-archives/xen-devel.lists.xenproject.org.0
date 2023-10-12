Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DAE7C77C5
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 22:18:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616004.957672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr288-0006hl-T4; Thu, 12 Oct 2023 20:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616004.957672; Thu, 12 Oct 2023 20:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr288-0006c3-Na; Thu, 12 Oct 2023 20:18:00 +0000
Received: by outflank-mailman (input) for mailman id 616004;
 Thu, 12 Oct 2023 20:17:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qqh1=F2=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1qr286-000668-6M
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 20:17:58 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6dcea540-693c-11ee-9b0e-b553b5be7939;
 Thu, 12 Oct 2023 22:17:55 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9936b3d0286so230654366b.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Oct 2023 13:17:55 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a1709064ec300b00997d7aa59fasm11692552ejv.14.2023.10.12.13.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 13:17:54 -0700 (PDT)
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
X-Inumbo-ID: 6dcea540-693c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697141875; x=1697746675; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dP3aL79sYs1c4BQa/blYah2PDJJ2vnSgtty8PYNApno=;
        b=k3Ts3T4x/777fdwyVtE44EAZIoybirBYtdpc0zmZ+uEm2pS8nVoXL1M3Yx1JJrpIXH
         pc8e7qW6Zm5Lle9rpf9AVWfO9KbCyPQTmeMOxb3ZmqV0E6KfFmzWsjQkVShzJToxI7xe
         Zea84028NANMIYBTosdd0Bb+smrcmVwtaeXvHc9+rN2vO+1fmCDjTG9sQsA6i1u4XDHC
         G1OYiCdtwJxaBkNi7g9qH7NoX5McQNGJalvgBMxrihHxvi8DJiUK/zy2XRuVmOxmK0Sa
         Q192VUiJfaC2KQN1fxrWhJ7n8SEpygTCjJRp+7nQ0cR5OgEiR2ulUCrSHixSlxGvlHj1
         1R1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697141875; x=1697746675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dP3aL79sYs1c4BQa/blYah2PDJJ2vnSgtty8PYNApno=;
        b=PKydG79fdr5W+3bhMUi9VQpw9wz7UJw7beFMUI/1A+6sML4+WTuLr4fDnbvxBAz0ZR
         lgNq5QIar5aygd8tFn9U387EtZhO/AyfHgrDy4MFRYpt3eY4ng5YH7yWIKbVFSqtgljq
         ML5UjYK7dKwJfYez1YHQ0TeDmErpUJBePxhaZreg4PTPqrNw3+McHnp5b7KsNZxECdZC
         /QJqs0TkvzS5BMoEvd/jwtR1sX0ywy7H9zB4Cd+LNFSgp89Nl7Hm7RkQcBPEWebi6S+Q
         n4FCD986hVkPPg7bZw1OWuixyROxHHFvBehnA3fCyLpHgKSCXLJBIjLW72m+qm7vDLdR
         IWmg==
X-Gm-Message-State: AOJu0YwZmmy1LO3vRzwxUy5wrtI6vVWM/VcspKXnyvUlWdRhWU5mt9fe
	POitHbBri3Skxeyba6k1BKc=
X-Google-Smtp-Source: AGHT+IELD/QO6fBcwqkcTgyrHC0COQGBYhxDdLfdbjk87Rjg0EnZvIr/K2PKpKW7JQhrL4PcCINltg==
X-Received: by 2002:a17:907:c205:b0:9a5:c54f:da1c with SMTP id ti5-20020a170907c20500b009a5c54fda1cmr22823408ejc.47.1697141874988;
        Thu, 12 Oct 2023 13:17:54 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v2 1/4] x86/percpu: Introduce PER_CPU_ARG and use it in cmpxchg{8,16}b_emu.S
Date: Thu, 12 Oct 2023 22:12:04 +0200
Message-ID: <20231012201743.292149-2-ubizjak@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012201743.292149-1-ubizjak@gmail.com>
References: <20231012201743.292149-1-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PER_CPU_VAR macro is intended to be applied to a symbol and should not
be used with general operands. Introduce new PER_CPU_ARG macro and
use it in cmpxchg{8,16}b_emu.S instead.

PER_CPU_VAR macro will be repurposed for %rip-relative addressing.

Also add a missing function comment to this_cpu_cmpxchg8b_emu.

No functional changes intended.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
--
v2: Introduce PER_CPU_ARG macro to conditionally enable
    segment registers in cmpxchg{8,16}b_emu.S for CONFIG_SMP.
---
 arch/x86/include/asm/percpu.h |  2 ++
 arch/x86/lib/cmpxchg16b_emu.S | 12 ++++++------
 arch/x86/lib/cmpxchg8b_emu.S  | 24 ++++++++++++++++++------
 3 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percpu.h
index 34734d730463..83e6a4bcea38 100644
--- a/arch/x86/include/asm/percpu.h
+++ b/arch/x86/include/asm/percpu.h
@@ -11,8 +11,10 @@
 #ifdef __ASSEMBLY__
 
 #ifdef CONFIG_SMP
+#define PER_CPU_ARG(arg)	%__percpu_seg:arg
 #define PER_CPU_VAR(var)	%__percpu_seg:var
 #else /* ! SMP */
+#define PER_CPU_ARG(arg)	arg
 #define PER_CPU_VAR(var)	var
 #endif	/* SMP */
 
diff --git a/arch/x86/lib/cmpxchg16b_emu.S b/arch/x86/lib/cmpxchg16b_emu.S
index 6962df315793..b6b942d07a00 100644
--- a/arch/x86/lib/cmpxchg16b_emu.S
+++ b/arch/x86/lib/cmpxchg16b_emu.S
@@ -23,14 +23,14 @@ SYM_FUNC_START(this_cpu_cmpxchg16b_emu)
 	cli
 
 	/* if (*ptr == old) */
-	cmpq	PER_CPU_VAR(0(%rsi)), %rax
+	cmpq	PER_CPU_ARG(0(%rsi)), %rax
 	jne	.Lnot_same
-	cmpq	PER_CPU_VAR(8(%rsi)), %rdx
+	cmpq	PER_CPU_ARG(8(%rsi)), %rdx
 	jne	.Lnot_same
 
 	/* *ptr = new */
-	movq	%rbx, PER_CPU_VAR(0(%rsi))
-	movq	%rcx, PER_CPU_VAR(8(%rsi))
+	movq	%rbx, PER_CPU_ARG(0(%rsi))
+	movq	%rcx, PER_CPU_ARG(8(%rsi))
 
 	/* set ZF in EFLAGS to indicate success */
 	orl	$X86_EFLAGS_ZF, (%rsp)
@@ -42,8 +42,8 @@ SYM_FUNC_START(this_cpu_cmpxchg16b_emu)
 	/* *ptr != old */
 
 	/* old = *ptr */
-	movq	PER_CPU_VAR(0(%rsi)), %rax
-	movq	PER_CPU_VAR(8(%rsi)), %rdx
+	movq	PER_CPU_ARG(0(%rsi)), %rax
+	movq	PER_CPU_ARG(8(%rsi)), %rdx
 
 	/* clear ZF in EFLAGS to indicate failure */
 	andl	$(~X86_EFLAGS_ZF), (%rsp)
diff --git a/arch/x86/lib/cmpxchg8b_emu.S b/arch/x86/lib/cmpxchg8b_emu.S
index 49805257b125..9a0a7feeaf7c 100644
--- a/arch/x86/lib/cmpxchg8b_emu.S
+++ b/arch/x86/lib/cmpxchg8b_emu.S
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
+	cmpl	PER_CPU_ARG(0(%esi)), %eax
 	jne	.Lnot_same2
-	cmpl	PER_CPU_VAR(4(%esi)), %edx
+	cmpl	PER_CPU_ARG(4(%esi)), %edx
 	jne	.Lnot_same2
 
-	movl	%ebx, PER_CPU_VAR(0(%esi))
-	movl	%ecx, PER_CPU_VAR(4(%esi))
+	movl	%ebx, PER_CPU_ARG(0(%esi))
+	movl	%ecx, PER_CPU_ARG(4(%esi))
 
 	orl	$X86_EFLAGS_ZF, (%esp)
 
@@ -72,8 +84,8 @@ SYM_FUNC_START(this_cpu_cmpxchg8b_emu)
 	RET
 
 .Lnot_same2:
-	movl	PER_CPU_VAR(0(%esi)), %eax
-	movl	PER_CPU_VAR(4(%esi)), %edx
+	movl	PER_CPU_ARG(0(%esi)), %eax
+	movl	PER_CPU_ARG(4(%esi)), %edx
 
 	andl	$(~X86_EFLAGS_ZF), (%esp)
 
-- 
2.41.0


