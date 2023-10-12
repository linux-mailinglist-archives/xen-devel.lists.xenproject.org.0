Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 410E47C722F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 18:13:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615913.957455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqyIs-0003BG-SE; Thu, 12 Oct 2023 16:12:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615913.957455; Thu, 12 Oct 2023 16:12:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqyIs-00039Z-PU; Thu, 12 Oct 2023 16:12:50 +0000
Received: by outflank-mailman (input) for mailman id 615913;
 Thu, 12 Oct 2023 16:12:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qqh1=F2=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1qqyIr-00039I-O4
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 16:12:49 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fc758d0-691a-11ee-98d4-6d05b1d4d9a1;
 Thu, 12 Oct 2023 18:12:48 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9adb9fa7200so234958266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Oct 2023 09:12:48 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
 by smtp.gmail.com with ESMTPSA id
 ci24-20020a170906c35800b009a2235ed496sm11414461ejb.141.2023.10.12.09.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 09:12:47 -0700 (PDT)
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
X-Inumbo-ID: 2fc758d0-691a-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697127168; x=1697731968; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQbyfobss6xeclCGhQMgW1ClZu9bZ4s/snJGfv9Jbpo=;
        b=GVk5TceC7qTadNwETNKYbj8wjoY+1e/GJhTe//ZWwYCERthPW+ENoQpvvpx5zaMsbn
         uZE6EbVGC+bDvbkDOD8VietIZ/6Ck1s41y+PDWRW6v/xIWOuAMl1hEnH2vKTu2+4lQzA
         W55wOZQbdNgaAMae9nIEDyy+SpRdL/yiuuREqzHlFufVJOOKGnqltGLdGXljA8ahBqxA
         /D/5nY/93S0ykaByooNGo6/WmvxlmhkylJCQBZJseX75iws38p8N2ZuLM3AhXy0keFMV
         Wc7KaOQUFMrd5iViMtY0jKUR8qrCJcNCxstBIh5fK5rQ+16qrwuLLsNNngfyxdaOcANZ
         Yz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697127168; x=1697731968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQbyfobss6xeclCGhQMgW1ClZu9bZ4s/snJGfv9Jbpo=;
        b=A5gEiO8L3WM79XseGOuC341sXzn/jxiLQFv2C8aDXVGWQxg5HkE0LO5jmvAoG/v9gy
         pXrFsB2ZEXipkVS7UWpesaNesgRUDU2cxlZe8CbNWIMx78akabapD7E4VPHHyQ6V5JNu
         2tM0bTZb2G2gpq6MjQrPfdmyj+YZ+/+Ou/knj17TTm038uknRHnTM577X0LwOErjP8o2
         FiACC7rTSGBbZdsPzP3ZhUUAZLaSpxXFK+IfqEOcf8wpNLOt2Xbi/bMzlKS5MQk0gI7N
         L92aDrjLprpp0SeTIl7HrDFAO+ZfUewq1V10pqVKTdgWPbynx/SwdnBMxspPblsWd/St
         XtCg==
X-Gm-Message-State: AOJu0Yx4czBNr76kZ7xzUTHvYdhCeoqvyxHR3nJY/uZcWswBpVwacYEi
	LJD9RR9IJEx1NVh0GnkZc2g=
X-Google-Smtp-Source: AGHT+IFcqbuNzLQmgxkQeiKP2KIso3r6ZxxKVuexp+Jb8ccabLciAyOXFrL77NO8rhOPn+oPIIJ4xw==
X-Received: by 2002:a17:906:99c5:b0:9ae:3768:f0ce with SMTP id s5-20020a17090699c500b009ae3768f0cemr20792970ejn.0.1697127167910;
        Thu, 12 Oct 2023 09:12:47 -0700 (PDT)
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
Subject: [PATCH 1/4] x86/percpu: Use explicit segment registers in lib/cmpxchg{8,16}b_emu.S
Date: Thu, 12 Oct 2023 18:10:36 +0200
Message-ID: <20231012161237.114733-2-ubizjak@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012161237.114733-1-ubizjak@gmail.com>
References: <20231012161237.114733-1-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PER_CPU_VAR macro is intended to be applied to a symbol, it is not
intended to be used as a selector between %fs and %gs segment
registers for general operands.

The address to these emulation functions is passed in a register, so
use explicit segment registers to access percpu variable instead.

Also add a missing function comment to this_cpu_cmpxchg8b_emu.

No functional changes intended.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/x86/lib/cmpxchg16b_emu.S | 12 ++++++------
 arch/x86/lib/cmpxchg8b_emu.S  | 30 +++++++++++++++++++++---------
 2 files changed, 27 insertions(+), 15 deletions(-)

diff --git a/arch/x86/lib/cmpxchg16b_emu.S b/arch/x86/lib/cmpxchg16b_emu.S
index 6962df315793..2bd8b89bce75 100644
--- a/arch/x86/lib/cmpxchg16b_emu.S
+++ b/arch/x86/lib/cmpxchg16b_emu.S
@@ -23,14 +23,14 @@ SYM_FUNC_START(this_cpu_cmpxchg16b_emu)
 	cli
 
 	/* if (*ptr == old) */
-	cmpq	PER_CPU_VAR(0(%rsi)), %rax
+	cmpq	%gs:(%rsi), %rax
 	jne	.Lnot_same
-	cmpq	PER_CPU_VAR(8(%rsi)), %rdx
+	cmpq	%gs:8(%rsi), %rdx
 	jne	.Lnot_same
 
 	/* *ptr = new */
-	movq	%rbx, PER_CPU_VAR(0(%rsi))
-	movq	%rcx, PER_CPU_VAR(8(%rsi))
+	movq	%rbx, %gs:(%rsi)
+	movq	%rcx, %gs:8(%rsi)
 
 	/* set ZF in EFLAGS to indicate success */
 	orl	$X86_EFLAGS_ZF, (%rsp)
@@ -42,8 +42,8 @@ SYM_FUNC_START(this_cpu_cmpxchg16b_emu)
 	/* *ptr != old */
 
 	/* old = *ptr */
-	movq	PER_CPU_VAR(0(%rsi)), %rax
-	movq	PER_CPU_VAR(8(%rsi)), %rdx
+	movq	%gs:(%rsi), %rax
+	movq	%gs:8(%rsi), %rdx
 
 	/* clear ZF in EFLAGS to indicate failure */
 	andl	$(~X86_EFLAGS_ZF), (%rsp)
diff --git a/arch/x86/lib/cmpxchg8b_emu.S b/arch/x86/lib/cmpxchg8b_emu.S
index 49805257b125..b7d68d5e2d31 100644
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
+ * Emulate 'cmpxchg8b %fs:(%esi)'
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
+	cmpl	%fs:(%esi), %eax
 	jne	.Lnot_same2
-	cmpl	PER_CPU_VAR(4(%esi)), %edx
+	cmpl	%fs:4(%esi), %edx
 	jne	.Lnot_same2
 
-	movl	%ebx, PER_CPU_VAR(0(%esi))
-	movl	%ecx, PER_CPU_VAR(4(%esi))
+	movl	%ebx, %fs:(%esi)
+	movl	%ecx, %fs:4(%esi)
 
 	orl	$X86_EFLAGS_ZF, (%esp)
 
@@ -72,8 +84,8 @@ SYM_FUNC_START(this_cpu_cmpxchg8b_emu)
 	RET
 
 .Lnot_same2:
-	movl	PER_CPU_VAR(0(%esi)), %eax
-	movl	PER_CPU_VAR(4(%esi)), %edx
+	movl	%fs:(%esi), %eax
+	movl	%fs:4(%esi), %edx
 
 	andl	$(~X86_EFLAGS_ZF), (%esp)
 
-- 
2.41.0


