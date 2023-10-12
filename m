Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E1A7C7537
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 19:55:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615964.957556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqztR-0008U6-Jx; Thu, 12 Oct 2023 17:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615964.957556; Thu, 12 Oct 2023 17:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqztR-0008Qk-H6; Thu, 12 Oct 2023 17:54:41 +0000
Received: by outflank-mailman (input) for mailman id 615964;
 Thu, 12 Oct 2023 17:54:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qqh1=F2=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1qqztQ-0008Qd-Hp
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 17:54:40 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6934aea0-6928-11ee-9b0e-b553b5be7939;
 Thu, 12 Oct 2023 19:54:38 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-503397ee920so1616239e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Oct 2023 10:54:38 -0700 (PDT)
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
X-Inumbo-ID: 6934aea0-6928-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697133277; x=1697738077; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2zaxolSorn5dIFC/Mbb3yIOz4fwasgFCXiOEAUO2GQ=;
        b=eEpLvJe+t5aiRJItbdTSxjQ36SlbFd+IHBCamWxfa83KB2eKDZNSTpIGB8Rusx1GT8
         nafQzWWASXFWpPrQluaCEAjLVeGwUq7s4cN+ppEatSOZBAz/Q9ADXzPzCpSt37viJl9J
         FG1TnZXXHRfdv2OiY3CZD4V5WwsKyVOLt8uMDi/i0snn8MksVR4pgn5to/SB+LpInOQ7
         0S8xS113Hiid8HsFJ7azlYoYkX90YnMi+klFGdFl3hdxVoTJ+eNu52Cv1sJf5YTFXHEL
         uzPdvIVIIRa427DKO1BTMw0VT0fIALLYpEiuJbxwmFIvCWPIbSOjnE2O2e9aGySBHDOT
         fjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697133277; x=1697738077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c2zaxolSorn5dIFC/Mbb3yIOz4fwasgFCXiOEAUO2GQ=;
        b=FYRi7Jy39npNGN/W6KjMTCRbT87KKg58vNMIlOGijIv/fA3lxFJ415boexygDaIwuo
         3fsYiG4Q8Zt838JGO0QerHmDe5ZaE07vpjdPaFEeE49HGsKqhtjQI+aB4EGrBX7YiKCU
         UVNGhIyCHE4kLYoAMj5NfddMycflITa0ZuaaUOgzOfMGBWg1VxHj8tkm6rPgtQ9TpTcE
         4gDXBczr4wESL2w7UnU/YN+jVOWiHtEOBQwU0uuoXeVJCNsPSGZoCrM7idkEsHa3YvtF
         Rz96GvjzppdabO90UQal8J3jGghrjeblpIuFPz1LIjrqAv7T8shspCjQCdwL+pQsaQsr
         T5AQ==
X-Gm-Message-State: AOJu0Yz3gTyD9cpc9YRw1XJmdXm65Q3upUKssi1vEkq/U79pEJVT87/Z
	3M0IhoMBmp5cpR5ooNGiJikugRm+89ok0s0P42Q=
X-Google-Smtp-Source: AGHT+IGzmlQaPUD4kujeCmNthDxgJnArN5Fz+FLBt1PRSFtjHsWik4OC+uhr8ul09D9evf1f5jP9iyxLn0vFztyjBuQ=
X-Received: by 2002:a05:6512:280d:b0:501:bee7:487b with SMTP id
 cf13-20020a056512280d00b00501bee7487bmr23794858lfb.11.1697133277207; Thu, 12
 Oct 2023 10:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20231012161237.114733-1-ubizjak@gmail.com> <20231012161237.114733-2-ubizjak@gmail.com>
 <CAMzpN2ii5qMr36PSw8RzNuVB-9KhoQgyfet=FpPtT5F3hOmLmQ@mail.gmail.com>
In-Reply-To: <CAMzpN2ii5qMr36PSw8RzNuVB-9KhoQgyfet=FpPtT5F3hOmLmQ@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 12 Oct 2023 19:54:26 +0200
Message-ID: <CAFULd4ZVvRvssyj--un6vrLU5M816ysEkc4xpXnGSN=hyhTTFQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] x86/percpu: Use explicit segment registers in lib/cmpxchg{8,16}b_emu.S
To: Brian Gerst <brgerst@gmail.com>
Cc: x86@kernel.org, xen-devel@lists.xenproject.org, 
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 7:45=E2=80=AFPM Brian Gerst <brgerst@gmail.com> wro=
te:
>
> On Thu, Oct 12, 2023 at 12:13=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> =
wrote:
> >
> > PER_CPU_VAR macro is intended to be applied to a symbol, it is not
> > intended to be used as a selector between %fs and %gs segment
> > registers for general operands.
> >
> > The address to these emulation functions is passed in a register, so
> > use explicit segment registers to access percpu variable instead.
> >
> > Also add a missing function comment to this_cpu_cmpxchg8b_emu.
> >
> > No functional changes intended.
> >
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Ingo Molnar <mingo@redhat.com>
> > Cc: Borislav Petkov <bp@alien8.de>
> > Cc: Dave Hansen <dave.hansen@linux.intel.com>
> > Cc: "H. Peter Anvin" <hpa@zytor.com>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> > ---
> >  arch/x86/lib/cmpxchg16b_emu.S | 12 ++++++------
> >  arch/x86/lib/cmpxchg8b_emu.S  | 30 +++++++++++++++++++++---------
> >  2 files changed, 27 insertions(+), 15 deletions(-)
> >
> > diff --git a/arch/x86/lib/cmpxchg16b_emu.S b/arch/x86/lib/cmpxchg16b_em=
u.S
> > index 6962df315793..2bd8b89bce75 100644
> > --- a/arch/x86/lib/cmpxchg16b_emu.S
> > +++ b/arch/x86/lib/cmpxchg16b_emu.S
> > @@ -23,14 +23,14 @@ SYM_FUNC_START(this_cpu_cmpxchg16b_emu)
> >         cli
> >
> >         /* if (*ptr =3D=3D old) */
> > -       cmpq    PER_CPU_VAR(0(%rsi)), %rax
> > +       cmpq    %gs:(%rsi), %rax
> >         jne     .Lnot_same
> > -       cmpq    PER_CPU_VAR(8(%rsi)), %rdx
> > +       cmpq    %gs:8(%rsi), %rdx
> >         jne     .Lnot_same
> >
> >         /* *ptr =3D new */
> > -       movq    %rbx, PER_CPU_VAR(0(%rsi))
> > -       movq    %rcx, PER_CPU_VAR(8(%rsi))
> > +       movq    %rbx, %gs:(%rsi)
> > +       movq    %rcx, %gs:8(%rsi)
> >
> >         /* set ZF in EFLAGS to indicate success */
> >         orl     $X86_EFLAGS_ZF, (%rsp)
> > @@ -42,8 +42,8 @@ SYM_FUNC_START(this_cpu_cmpxchg16b_emu)
> >         /* *ptr !=3D old */
> >
> >         /* old =3D *ptr */
> > -       movq    PER_CPU_VAR(0(%rsi)), %rax
> > -       movq    PER_CPU_VAR(8(%rsi)), %rdx
> > +       movq    %gs:(%rsi), %rax
> > +       movq    %gs:8(%rsi), %rdx
> >
> >         /* clear ZF in EFLAGS to indicate failure */
> >         andl    $(~X86_EFLAGS_ZF), (%rsp)
> > diff --git a/arch/x86/lib/cmpxchg8b_emu.S b/arch/x86/lib/cmpxchg8b_emu.=
S
> > index 49805257b125..b7d68d5e2d31 100644
> > --- a/arch/x86/lib/cmpxchg8b_emu.S
> > +++ b/arch/x86/lib/cmpxchg8b_emu.S
> > @@ -24,12 +24,12 @@ SYM_FUNC_START(cmpxchg8b_emu)
> >         pushfl
> >         cli
> >
> > -       cmpl    0(%esi), %eax
> > +       cmpl    (%esi), %eax
> >         jne     .Lnot_same
> >         cmpl    4(%esi), %edx
> >         jne     .Lnot_same
> >
> > -       movl    %ebx, 0(%esi)
> > +       movl    %ebx, (%esi)
> >         movl    %ecx, 4(%esi)
> >
> >         orl     $X86_EFLAGS_ZF, (%esp)
> > @@ -38,7 +38,7 @@ SYM_FUNC_START(cmpxchg8b_emu)
> >         RET
> >
> >  .Lnot_same:
> > -       movl    0(%esi), %eax
> > +       movl    (%esi), %eax
> >         movl    4(%esi), %edx
> >
> >         andl    $(~X86_EFLAGS_ZF), (%esp)
> > @@ -53,18 +53,30 @@ EXPORT_SYMBOL(cmpxchg8b_emu)
> >
> >  #ifndef CONFIG_UML
> >
> > +/*
> > + * Emulate 'cmpxchg8b %fs:(%esi)'
> > + *
> > + * Inputs:
> > + * %esi : memory location to compare
> > + * %eax : low 32 bits of old value
> > + * %edx : high 32 bits of old value
> > + * %ebx : low 32 bits of new value
> > + * %ecx : high 32 bits of new value
> > + *
> > + * Notably this is not LOCK prefixed and is not safe against NMIs
> > + */
> >  SYM_FUNC_START(this_cpu_cmpxchg8b_emu)
> >
> >         pushfl
> >         cli
> >
> > -       cmpl    PER_CPU_VAR(0(%esi)), %eax
> > +       cmpl    %fs:(%esi), %eax
> >         jne     .Lnot_same2
> > -       cmpl    PER_CPU_VAR(4(%esi)), %edx
> > +       cmpl    %fs:4(%esi), %edx
> >         jne     .Lnot_same2
> >
> > -       movl    %ebx, PER_CPU_VAR(0(%esi))
> > -       movl    %ecx, PER_CPU_VAR(4(%esi))
> > +       movl    %ebx, %fs:(%esi)
> > +       movl    %ecx, %fs:4(%esi)
> >
> >         orl     $X86_EFLAGS_ZF, (%esp)
> >
> > @@ -72,8 +84,8 @@ SYM_FUNC_START(this_cpu_cmpxchg8b_emu)
> >         RET
> >
> >  .Lnot_same2:
> > -       movl    PER_CPU_VAR(0(%esi)), %eax
> > -       movl    PER_CPU_VAR(4(%esi)), %edx
> > +       movl    %fs:(%esi), %eax
> > +       movl    %fs:4(%esi), %edx
> >
> >         andl    $(~X86_EFLAGS_ZF), (%esp)
> >
> > --
> > 2.41.0
> >
>
> This will break on !SMP builds, where per-cpu variables are just
> regular data and not accessed with a segment prefix.

Ugh, indeed. Let me rethink this a bit.

Thanks,
Uros.

