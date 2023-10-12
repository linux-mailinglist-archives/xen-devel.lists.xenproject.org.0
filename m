Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C54737C7507
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 19:45:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615959.957545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqzk8-0005nR-KS; Thu, 12 Oct 2023 17:45:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615959.957545; Thu, 12 Oct 2023 17:45:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqzk8-0005kt-Ha; Thu, 12 Oct 2023 17:45:04 +0000
Received: by outflank-mailman (input) for mailman id 615959;
 Thu, 12 Oct 2023 17:45:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZCIp=F2=gmail.com=brgerst@srs-se1.protection.inumbo.net>)
 id 1qqzk7-0005kn-2b
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 17:45:03 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11ed38e3-6927-11ee-98d4-6d05b1d4d9a1;
 Thu, 12 Oct 2023 19:45:02 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5042bfb4fe9so1656853e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Oct 2023 10:45:02 -0700 (PDT)
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
X-Inumbo-ID: 11ed38e3-6927-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697132701; x=1697737501; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZnELMSWSCox5zkDrPZguBSaHcnzom5VtqzW5cdzO/Q=;
        b=KY7x6S9vgTk43FD5bclebFlp3edT007ptqduN3vsPBSz3Ma1YBKq/GzncNh8KXQBjr
         esbge3qt8Z8V9q9K3OA0F6HqJXJ0BMA74IBnqHR3IzL39kZc88WIX+N7E0d4keeoSDCm
         0qdGiFvGlGEwI3l2Lrq6jO9xHAl4wPwH9EIvFvGYn2b3HBSMh+XQtkunrIGeVIaBoH9f
         rkS0Tg8c6BoaGaY9qEYuFChlKZeuKzaZPfGfm9DdLD6IJj5VbMLlwN7pnpaRcvkoCsLO
         egKrDvezlzXTWr8LcSXt8IDx0J79yagahBarH1RhArMQDhaJenNH+9z3opbJvm6vzBdz
         r6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697132701; x=1697737501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZnELMSWSCox5zkDrPZguBSaHcnzom5VtqzW5cdzO/Q=;
        b=JtRJEfg+m+9eQwwtVzuLtrWX5s49dG3V4WOYSDRqIElI0nZzl4AymbliK+lnsw7U9E
         CULTkdKWc19xUOsmJl6K3P8m1bNvr61q8iLXZWbAWfA7aB3R7Y2hI2E9C2Ddrb94BPlA
         VKTFJCFWWhrlMrYV6QihR4A+D4m3jg+1dy7MXvfNKzxd5g0C+k9eAns0ToGVJRX2qff4
         M4Hvic4YAPnMPcEOt+xxtSJPwPyrXGtZArfT42sefAf64QN2sdlBH6LFFse2NBRl+NeN
         nZtpZ9hgpriL7W6tR3nyrOaay9z36tc3LU0LSEQTrM8VFFyJ0nSV6JdThEhvd/xFwokp
         hbtw==
X-Gm-Message-State: AOJu0Yy3kD5PqQ4V/D3Q8tQ/F9wpXbZy1xIz3MfPtLzjzIdcgZB5tSth
	LbbPFDceeu8hnQJc6lgoC38GGxltBBA3M8CjBA==
X-Google-Smtp-Source: AGHT+IHCwMbJjDnnhzCqZvqf2XCN/6lmwhJEjVZYkv3cpRaTckQgJSY7Ku92vcGVEH6JnTqXufQnmC4syQW08bO8lKw=
X-Received: by 2002:a05:6512:2821:b0:502:f2a8:d391 with SMTP id
 cf33-20020a056512282100b00502f2a8d391mr28965256lfb.45.1697132701302; Thu, 12
 Oct 2023 10:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231012161237.114733-1-ubizjak@gmail.com> <20231012161237.114733-2-ubizjak@gmail.com>
In-Reply-To: <20231012161237.114733-2-ubizjak@gmail.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Thu, 12 Oct 2023 13:44:49 -0400
Message-ID: <CAMzpN2ii5qMr36PSw8RzNuVB-9KhoQgyfet=FpPtT5F3hOmLmQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] x86/percpu: Use explicit segment registers in lib/cmpxchg{8,16}b_emu.S
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, xen-devel@lists.xenproject.org, 
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 12:13=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> wr=
ote:
>
> PER_CPU_VAR macro is intended to be applied to a symbol, it is not
> intended to be used as a selector between %fs and %gs segment
> registers for general operands.
>
> The address to these emulation functions is passed in a register, so
> use explicit segment registers to access percpu variable instead.
>
> Also add a missing function comment to this_cpu_cmpxchg8b_emu.
>
> No functional changes intended.
>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> ---
>  arch/x86/lib/cmpxchg16b_emu.S | 12 ++++++------
>  arch/x86/lib/cmpxchg8b_emu.S  | 30 +++++++++++++++++++++---------
>  2 files changed, 27 insertions(+), 15 deletions(-)
>
> diff --git a/arch/x86/lib/cmpxchg16b_emu.S b/arch/x86/lib/cmpxchg16b_emu.=
S
> index 6962df315793..2bd8b89bce75 100644
> --- a/arch/x86/lib/cmpxchg16b_emu.S
> +++ b/arch/x86/lib/cmpxchg16b_emu.S
> @@ -23,14 +23,14 @@ SYM_FUNC_START(this_cpu_cmpxchg16b_emu)
>         cli
>
>         /* if (*ptr =3D=3D old) */
> -       cmpq    PER_CPU_VAR(0(%rsi)), %rax
> +       cmpq    %gs:(%rsi), %rax
>         jne     .Lnot_same
> -       cmpq    PER_CPU_VAR(8(%rsi)), %rdx
> +       cmpq    %gs:8(%rsi), %rdx
>         jne     .Lnot_same
>
>         /* *ptr =3D new */
> -       movq    %rbx, PER_CPU_VAR(0(%rsi))
> -       movq    %rcx, PER_CPU_VAR(8(%rsi))
> +       movq    %rbx, %gs:(%rsi)
> +       movq    %rcx, %gs:8(%rsi)
>
>         /* set ZF in EFLAGS to indicate success */
>         orl     $X86_EFLAGS_ZF, (%rsp)
> @@ -42,8 +42,8 @@ SYM_FUNC_START(this_cpu_cmpxchg16b_emu)
>         /* *ptr !=3D old */
>
>         /* old =3D *ptr */
> -       movq    PER_CPU_VAR(0(%rsi)), %rax
> -       movq    PER_CPU_VAR(8(%rsi)), %rdx
> +       movq    %gs:(%rsi), %rax
> +       movq    %gs:8(%rsi), %rdx
>
>         /* clear ZF in EFLAGS to indicate failure */
>         andl    $(~X86_EFLAGS_ZF), (%rsp)
> diff --git a/arch/x86/lib/cmpxchg8b_emu.S b/arch/x86/lib/cmpxchg8b_emu.S
> index 49805257b125..b7d68d5e2d31 100644
> --- a/arch/x86/lib/cmpxchg8b_emu.S
> +++ b/arch/x86/lib/cmpxchg8b_emu.S
> @@ -24,12 +24,12 @@ SYM_FUNC_START(cmpxchg8b_emu)
>         pushfl
>         cli
>
> -       cmpl    0(%esi), %eax
> +       cmpl    (%esi), %eax
>         jne     .Lnot_same
>         cmpl    4(%esi), %edx
>         jne     .Lnot_same
>
> -       movl    %ebx, 0(%esi)
> +       movl    %ebx, (%esi)
>         movl    %ecx, 4(%esi)
>
>         orl     $X86_EFLAGS_ZF, (%esp)
> @@ -38,7 +38,7 @@ SYM_FUNC_START(cmpxchg8b_emu)
>         RET
>
>  .Lnot_same:
> -       movl    0(%esi), %eax
> +       movl    (%esi), %eax
>         movl    4(%esi), %edx
>
>         andl    $(~X86_EFLAGS_ZF), (%esp)
> @@ -53,18 +53,30 @@ EXPORT_SYMBOL(cmpxchg8b_emu)
>
>  #ifndef CONFIG_UML
>
> +/*
> + * Emulate 'cmpxchg8b %fs:(%esi)'
> + *
> + * Inputs:
> + * %esi : memory location to compare
> + * %eax : low 32 bits of old value
> + * %edx : high 32 bits of old value
> + * %ebx : low 32 bits of new value
> + * %ecx : high 32 bits of new value
> + *
> + * Notably this is not LOCK prefixed and is not safe against NMIs
> + */
>  SYM_FUNC_START(this_cpu_cmpxchg8b_emu)
>
>         pushfl
>         cli
>
> -       cmpl    PER_CPU_VAR(0(%esi)), %eax
> +       cmpl    %fs:(%esi), %eax
>         jne     .Lnot_same2
> -       cmpl    PER_CPU_VAR(4(%esi)), %edx
> +       cmpl    %fs:4(%esi), %edx
>         jne     .Lnot_same2
>
> -       movl    %ebx, PER_CPU_VAR(0(%esi))
> -       movl    %ecx, PER_CPU_VAR(4(%esi))
> +       movl    %ebx, %fs:(%esi)
> +       movl    %ecx, %fs:4(%esi)
>
>         orl     $X86_EFLAGS_ZF, (%esp)
>
> @@ -72,8 +84,8 @@ SYM_FUNC_START(this_cpu_cmpxchg8b_emu)
>         RET
>
>  .Lnot_same2:
> -       movl    PER_CPU_VAR(0(%esi)), %eax
> -       movl    PER_CPU_VAR(4(%esi)), %edx
> +       movl    %fs:(%esi), %eax
> +       movl    %fs:4(%esi), %edx
>
>         andl    $(~X86_EFLAGS_ZF), (%esp)
>
> --
> 2.41.0
>

This will break on !SMP builds, where per-cpu variables are just
regular data and not accessed with a segment prefix.

Brian Gerst

