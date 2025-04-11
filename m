Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE1DA867ED
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 23:12:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947998.1345542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Lg3-0002Qj-KJ; Fri, 11 Apr 2025 21:12:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947998.1345542; Fri, 11 Apr 2025 21:12:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Lg3-0002O4-HB; Fri, 11 Apr 2025 21:12:43 +0000
Received: by outflank-mailman (input) for mailman id 947998;
 Fri, 11 Apr 2025 21:12:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pnkk=W5=google.com=jmattson@srs-se1.protection.inumbo.net>)
 id 1u3Lg1-0002Ny-TA
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 21:12:42 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3be32ec-1719-11f0-9eae-5ba50f476ded;
 Fri, 11 Apr 2025 23:12:40 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5e5cbd8b19bso1084a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 14:12:40 -0700 (PDT)
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
X-Inumbo-ID: b3be32ec-1719-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744405960; x=1745010760; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5s9O/8O6xeMVl0tLPF60JEEeubmLlBJjqtBbS0i9ciQ=;
        b=sKTYbyasrC3gynRUNnI3QCDzFBLm3x4jka0lFChbn1ljsADBaMb51jq+auFl3emX8d
         qNo+ICXFllQKY2pGdH/2iCtaXsxjNHHHOACnt9kjSaid1qMpwJ/6geUIsOBUmWqgQEOH
         uNJM5JG+RcPawhu9L7icY489GF7JWujkXeDJiNxh4FpKuyjwC/IfBx75yDWe6jUSskh9
         jpcG+dXgTO2kJooKGS4Xy4XXnSymBKyEY8yT9NqisaJ6SOAMvCHZtepe7Ga+A9CfyFi2
         m4ctQM/Eed5FM4hWlHHFOfbvwxX17l2pCpI87iSg/MO4elvWCkt08bIs43yURUCYXijf
         e9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744405960; x=1745010760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5s9O/8O6xeMVl0tLPF60JEEeubmLlBJjqtBbS0i9ciQ=;
        b=lOnKU9Ddg01gKV/Wwc1QVSuewJ0V44YzNK4xH1p+12FzlvDL6n62JPTrUV/PWWcG/i
         lvi6SbaykObEEjewoQZ5luboe89us1rDjp5pwVCxhaBQhBm2S+Fh9iIBY+XGGVbtcLBf
         2IMjqr0ReXuH9FiimULkingpkoyzxBhdli68bK7XJM6fA1jR+ARHZ/X684Uk0s3Ss7q5
         bgz4Fd9hz6JsG7ukVusUdTBkXHZ7uPJsoGfnh1wH59iBk8ZgtlG3b2IwRNJL0188CaRK
         FfAVz7Rm6TIbox0VMAVEZD4RwhPyz1fFkJse92A39aI0j2D6pW3gEPOeq6bTkwZl6k1x
         u4Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUUddUQX86ibOXNhLALyWl1Hq258zIoVvBxhxZUhiBlivNcsDbDavpGNGopZmhVUHbr82gWBWg6+O4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yze8n/hxwrJZYaE5pQQsYmsKjfNDQfPWi2ecMT6bTDsyB86Vdvd
	0o4pFD9fTqlhV5CVEWiAulCov3WtffueP0tpWHS0g3fZ809E/6mL/+GS7jQpN78VMNzDTPB9s6H
	LftCCOoevBc3j+QkiuLbWHK2V5vvK3c3tNfSn
X-Gm-Gg: ASbGncsJ5b2EnoXwhinEquZy8I0Wl06un7OJeNiPl+j3XNrrxOdZfkHvJIPf6KZYBD2
	EB0QPNBWTyIlMB7XYltM82vzSkA9hnXSjBLi1oMtmMJvx+C+HY+AGIZUYcNZx9qFD9dGbIT32YB
	wAqBkcMWPE4BE5UTsjADn2Ow==
X-Google-Smtp-Source: AGHT+IG84lvI3gcXlEPRkJRlkOu8tneyZgmJwr3mqViY4ItysXFcNimZTO7gtwpNKCM01C6d/tdsOPRrFemjcCrBnfs=
X-Received: by 2002:aa7:cfd6:0:b0:5ec:13d0:4505 with SMTP id
 4fb4d7f45d1cf-5f3ea1e2b1dmr6826a12.5.1744405959793; Fri, 11 Apr 2025 14:12:39
 -0700 (PDT)
MIME-Version: 1.0
References: <20250331082251.3171276-1-xin@zytor.com> <20250331082251.3171276-11-xin@zytor.com>
 <Z_hTI8ywa3rTxFaz@google.com>
In-Reply-To: <Z_hTI8ywa3rTxFaz@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 11 Apr 2025 14:12:27 -0700
X-Gm-Features: ATxdqUHkE9VKKw2s7zj6-Bzo7sFhtVG2VPQmJwr2UovOBmetGvqQ1ElvaKggsjw
Message-ID: <CALMp9eRJkzA2YXf1Dfxt3ONP+P9aTA=WPraOPJPJ6C6j677+6Q@mail.gmail.com>
Subject: Re: [RFC PATCH v1 10/15] KVM: VMX: Use WRMSRNS or its immediate form
 when available
To: Sean Christopherson <seanjc@google.com>
Cc: "Xin Li (Intel)" <xin@zytor.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-edac@vger.kernel.org, 
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-ide@vger.kernel.org, linux-pm@vger.kernel.org, bpf@vger.kernel.org, 
	llvm@lists.linux.dev, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, jgross@suse.com, 
	andrew.cooper3@citrix.com, peterz@infradead.org, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, wei.liu@kernel.org, ajay.kaher@broadcom.com, 
	alexey.amakhalov@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	tony.luck@intel.com, pbonzini@redhat.com, vkuznets@redhat.com, 
	luto@kernel.org, boris.ostrovsky@oracle.com, kys@microsoft.com, 
	haiyangz@microsoft.com, decui@microsoft.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 4:24=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Mon, Mar 31, 2025, Xin Li (Intel) wrote:
> > Signed-off-by: Xin Li (Intel) <xin@zytor.com>
> > ---
> >  arch/x86/include/asm/msr-index.h |  6 ++++++
> >  arch/x86/kvm/vmx/vmenter.S       | 28 ++++++++++++++++++++++++----
> >  2 files changed, 30 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/ms=
r-index.h
> > index e6134ef2263d..04244c3ba374 100644
> > --- a/arch/x86/include/asm/msr-index.h
> > +++ b/arch/x86/include/asm/msr-index.h
> > @@ -1226,4 +1226,10 @@
> >                                               * a #GP
> >                                               */
> >
> > +/* Instruction opcode for WRMSRNS supported in binutils >=3D 2.40 */
> > +#define ASM_WRMSRNS          _ASM_BYTES(0x0f,0x01,0xc6)
> > +
> > +/* Instruction opcode for the immediate form RDMSR/WRMSRNS */
> > +#define ASM_WRMSRNS_RAX              _ASM_BYTES(0xc4,0xe7,0x7a,0xf6,0x=
c0)
> > +
> >  #endif /* _ASM_X86_MSR_INDEX_H */
> > diff --git a/arch/x86/kvm/vmx/vmenter.S b/arch/x86/kvm/vmx/vmenter.S
> > index f6986dee6f8c..9fae43723c44 100644
> > --- a/arch/x86/kvm/vmx/vmenter.S
> > +++ b/arch/x86/kvm/vmx/vmenter.S
> > @@ -64,6 +64,29 @@
> >       RET
> >  .endm
> >
> > +/*
> > + * Write EAX to MSR_IA32_SPEC_CTRL.
> > + *
> > + * Choose the best WRMSR instruction based on availability.
> > + *
> > + * Replace with 'wrmsrns' and 'wrmsrns %rax, $MSR_IA32_SPEC_CTRL' once=
 binutils support them.
> > + */
> > +.macro WRITE_EAX_TO_MSR_IA32_SPEC_CTRL
> > +     ALTERNATIVE_2 __stringify(mov $MSR_IA32_SPEC_CTRL, %ecx;         =
       \
> > +                               xor %edx, %edx;                        =
       \
> > +                               mov %edi, %eax;                        =
       \
> > +                               ds wrmsr),                             =
       \
> > +                   __stringify(mov $MSR_IA32_SPEC_CTRL, %ecx;         =
       \
> > +                               xor %edx, %edx;                        =
       \
> > +                               mov %edi, %eax;                        =
       \
> > +                               ASM_WRMSRNS),                          =
       \
> > +                   X86_FEATURE_WRMSRNS,                               =
       \
> > +                   __stringify(xor %_ASM_AX, %_ASM_AX;                =
       \
> > +                               mov %edi, %eax;                        =
       \
> > +                               ASM_WRMSRNS_RAX; .long MSR_IA32_SPEC_CT=
RL),   \
> > +                   X86_FEATURE_MSR_IMM
> > +.endm
>
> This is quite hideous.  I have no objection to optimizing __vmx_vcpu_run(=
), but
> I would much prefer that a macro like this live in generic code, and that=
 it be
> generic.  It should be easy enough to provide an assembly friendly equiva=
lent to
> __native_wrmsr_constant().

Surely, any CPU that has WRMSRNS also supports "Virtualize
IA32_SPEC_CTRL," right? Shouldn't we be using that feature rather than
swapping host and guest values with some form of WRMSR?

> > +
> >  .section .noinstr.text, "ax"
> >
> >  /**
> > @@ -123,10 +146,7 @@ SYM_FUNC_START(__vmx_vcpu_run)
> >       movl PER_CPU_VAR(x86_spec_ctrl_current), %esi
> >       cmp %edi, %esi
> >       je .Lspec_ctrl_done
> > -     mov $MSR_IA32_SPEC_CTRL, %ecx
> > -     xor %edx, %edx
> > -     mov %edi, %eax
> > -     wrmsr
> > +     WRITE_EAX_TO_MSR_IA32_SPEC_CTRL
> >
> >  .Lspec_ctrl_done:
> >
> > --
> > 2.49.0
> >
>

