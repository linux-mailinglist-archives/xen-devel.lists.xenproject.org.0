Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2337C785C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 23:06:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616039.957726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr2sT-0001aa-Gd; Thu, 12 Oct 2023 21:05:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616039.957726; Thu, 12 Oct 2023 21:05:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr2sT-0001Xd-DK; Thu, 12 Oct 2023 21:05:53 +0000
Received: by outflank-mailman (input) for mailman id 616039;
 Thu, 12 Oct 2023 21:05:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qqh1=F2=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1qr2sS-0001XX-1I
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 21:05:52 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f926e5e-6943-11ee-98d4-6d05b1d4d9a1;
 Thu, 12 Oct 2023 23:05:51 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5333fb34be3so2447798a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Oct 2023 14:05:50 -0700 (PDT)
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
X-Inumbo-ID: 1f926e5e-6943-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697144750; x=1697749550; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmYbDLi462mhz/h94tn+FuQJl/K+QQJOfQDRUT1QidM=;
        b=h4PiPjzilLV1XTQa04iQ3M99iVMlC/cQM1A8r2X54cVOMoxogRXRkTumMmbmfE8oBS
         En/lstiXoJ2GuIwm5g+8RDfpTJftuYnfKzGeoe/Ccr1PQfkGeufPOs9BsJz4xwnC5eeX
         58gwQW9VvcC4w6YCnE/u+hUu6Y+g4XTf+iQMUjH7RtmSWkTHViNjJP66AnbOMbl/bdcP
         WmWMPmoDluSaQRiP+Lo8fU5B8OJ/KBjd7oUVjvZVwuVricNXuw7aoOcclk2WlfMZU9N5
         tsxdBmhf25MusiH/KQGzS+7Q5nNrB9vgk+MYuhZimJx92ukkhn9fX5OoU/I0tOv5KPBS
         Glfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697144750; x=1697749550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DmYbDLi462mhz/h94tn+FuQJl/K+QQJOfQDRUT1QidM=;
        b=qD22rR+d4s8kwHZerqImpSoiL7zFprs75thPTy6JAS8nllZZQESzZt5gZnGAkRiAUW
         daS+x4JmBIg8TVFtO80HLpBS+HT1skNEIgEgryuIJm6vZOh5WEOnuTccgguQzdxIlhN5
         Webp+ZQWYSt3UfxNJ/wzE9Fu/BZU/EypSQQOMVrj1J8+A3tlFHIPF3ogWB+XhISE7+8o
         PO26/8vWrkXT6hI/Fd2UAManBCk6T85b0fSkihw5XU8K4UeDSwMegqAVhiLR9cSxvWVI
         5ctUnZKgdWxWs3fgWHEKKy6thb892zj1x6+fIgciWhszP4mmVNkYn827mliyns9dubWf
         QgNg==
X-Gm-Message-State: AOJu0Yy+DcpB0YA7eTeCDAuVaibRsuzXoNKXyM5fIxyF3aY/cFsvcaXM
	hJafqHywFK1sBF93J0nOdwcZ/bEvqXTRrnXXEx0=
X-Google-Smtp-Source: AGHT+IEt2n0n2zZH9B3GUR1cImxXZzuqugVwxdUIpE6C3qgF95LQqZgOxgXHebB4KGlgQKyBRgxQUDBeeZp+2AHZaZw=
X-Received: by 2002:a05:6402:2314:b0:53e:1741:d76b with SMTP id
 l20-20020a056402231400b0053e1741d76bmr1943019eda.39.1697144750412; Thu, 12
 Oct 2023 14:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <20231012161237.114733-1-ubizjak@gmail.com> <20231012161237.114733-2-ubizjak@gmail.com>
 <E2A4E3BD-10C1-43F7-AD6D-1037C7106F8B@zytor.com>
In-Reply-To: <E2A4E3BD-10C1-43F7-AD6D-1037C7106F8B@zytor.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 12 Oct 2023 23:05:39 +0200
Message-ID: <CAFULd4brKzOJCU7Koc7gyMt5QNAznRr=a-TwP7k+gXT2B2S7=g@mail.gmail.com>
Subject: Re: [PATCH 1/4] x86/percpu: Use explicit segment registers in lib/cmpxchg{8,16}b_emu.S
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org, xen-devel@lists.xenproject.org, 
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 11:02=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wro=
te:
>
> On October 12, 2023 9:10:36 AM PDT, Uros Bizjak <ubizjak@gmail.com> wrote=
:
> >PER_CPU_VAR macro is intended to be applied to a symbol, it is not
> >intended to be used as a selector between %fs and %gs segment
> >registers for general operands.
> >
> >The address to these emulation functions is passed in a register, so
> >use explicit segment registers to access percpu variable instead.
> >
> >Also add a missing function comment to this_cpu_cmpxchg8b_emu.
> >
> >No functional changes intended.
> >
> >Cc: Thomas Gleixner <tglx@linutronix.de>
> >Cc: Ingo Molnar <mingo@redhat.com>
> >Cc: Borislav Petkov <bp@alien8.de>
> >Cc: Dave Hansen <dave.hansen@linux.intel.com>
> >Cc: "H. Peter Anvin" <hpa@zytor.com>
> >Cc: Peter Zijlstra <peterz@infradead.org>
> >Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> >---
> > arch/x86/lib/cmpxchg16b_emu.S | 12 ++++++------
> > arch/x86/lib/cmpxchg8b_emu.S  | 30 +++++++++++++++++++++---------
> > 2 files changed, 27 insertions(+), 15 deletions(-)
> >
> >diff --git a/arch/x86/lib/cmpxchg16b_emu.S b/arch/x86/lib/cmpxchg16b_emu=
.S
> >index 6962df315793..2bd8b89bce75 100644
> >--- a/arch/x86/lib/cmpxchg16b_emu.S
> >+++ b/arch/x86/lib/cmpxchg16b_emu.S
> >@@ -23,14 +23,14 @@ SYM_FUNC_START(this_cpu_cmpxchg16b_emu)
> >       cli
> >
> >       /* if (*ptr =3D=3D old) */
> >-      cmpq    PER_CPU_VAR(0(%rsi)), %rax
> >+      cmpq    %gs:(%rsi), %rax
> >       jne     .Lnot_same
> >-      cmpq    PER_CPU_VAR(8(%rsi)), %rdx
> >+      cmpq    %gs:8(%rsi), %rdx
> >       jne     .Lnot_same
> >
> >       /* *ptr =3D new */
> >-      movq    %rbx, PER_CPU_VAR(0(%rsi))
> >-      movq    %rcx, PER_CPU_VAR(8(%rsi))
> >+      movq    %rbx, %gs:(%rsi)
> >+      movq    %rcx, %gs:8(%rsi)
> >
> >       /* set ZF in EFLAGS to indicate success */
> >       orl     $X86_EFLAGS_ZF, (%rsp)
> >@@ -42,8 +42,8 @@ SYM_FUNC_START(this_cpu_cmpxchg16b_emu)
> >       /* *ptr !=3D old */
> >
> >       /* old =3D *ptr */
> >-      movq    PER_CPU_VAR(0(%rsi)), %rax
> >-      movq    PER_CPU_VAR(8(%rsi)), %rdx
> >+      movq    %gs:(%rsi), %rax
> >+      movq    %gs:8(%rsi), %rdx
> >
> >       /* clear ZF in EFLAGS to indicate failure */
> >       andl    $(~X86_EFLAGS_ZF), (%rsp)
> >diff --git a/arch/x86/lib/cmpxchg8b_emu.S b/arch/x86/lib/cmpxchg8b_emu.S
> >index 49805257b125..b7d68d5e2d31 100644
> >--- a/arch/x86/lib/cmpxchg8b_emu.S
> >+++ b/arch/x86/lib/cmpxchg8b_emu.S
> >@@ -24,12 +24,12 @@ SYM_FUNC_START(cmpxchg8b_emu)
> >       pushfl
> >       cli
> >
> >-      cmpl    0(%esi), %eax
> >+      cmpl    (%esi), %eax
> >       jne     .Lnot_same
> >       cmpl    4(%esi), %edx
> >       jne     .Lnot_same
> >
> >-      movl    %ebx, 0(%esi)
> >+      movl    %ebx, (%esi)
> >       movl    %ecx, 4(%esi)
> >
> >       orl     $X86_EFLAGS_ZF, (%esp)
> >@@ -38,7 +38,7 @@ SYM_FUNC_START(cmpxchg8b_emu)
> >       RET
> >
> > .Lnot_same:
> >-      movl    0(%esi), %eax
> >+      movl    (%esi), %eax
> >       movl    4(%esi), %edx
> >
> >       andl    $(~X86_EFLAGS_ZF), (%esp)
> >@@ -53,18 +53,30 @@ EXPORT_SYMBOL(cmpxchg8b_emu)
> >
> > #ifndef CONFIG_UML
> >
> >+/*
> >+ * Emulate 'cmpxchg8b %fs:(%esi)'
> >+ *
> >+ * Inputs:
> >+ * %esi : memory location to compare
> >+ * %eax : low 32 bits of old value
> >+ * %edx : high 32 bits of old value
> >+ * %ebx : low 32 bits of new value
> >+ * %ecx : high 32 bits of new value
> >+ *
> >+ * Notably this is not LOCK prefixed and is not safe against NMIs
> >+ */
> > SYM_FUNC_START(this_cpu_cmpxchg8b_emu)
> >
> >       pushfl
> >       cli
> >
> >-      cmpl    PER_CPU_VAR(0(%esi)), %eax
> >+      cmpl    %fs:(%esi), %eax
> >       jne     .Lnot_same2
> >-      cmpl    PER_CPU_VAR(4(%esi)), %edx
> >+      cmpl    %fs:4(%esi), %edx
> >       jne     .Lnot_same2
> >
> >-      movl    %ebx, PER_CPU_VAR(0(%esi))
> >-      movl    %ecx, PER_CPU_VAR(4(%esi))
> >+      movl    %ebx, %fs:(%esi)
> >+      movl    %ecx, %fs:4(%esi)
> >
> >       orl     $X86_EFLAGS_ZF, (%esp)
> >
> >@@ -72,8 +84,8 @@ SYM_FUNC_START(this_cpu_cmpxchg8b_emu)
> >       RET
> >
> > .Lnot_same2:
> >-      movl    PER_CPU_VAR(0(%esi)), %eax
> >-      movl    PER_CPU_VAR(4(%esi)), %edx
> >+      movl    %fs:(%esi), %eax
> >+      movl    %fs:4(%esi), %edx
> >
> >       andl    $(~X86_EFLAGS_ZF), (%esp)
> >
>
> %fs??

Yes, 32-bit targets default to %fs. Please also note a new version
(v2) of the patch that reimplements this part.

Uros.

