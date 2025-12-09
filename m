Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 507C8CAFE80
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 13:22:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181553.1504584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSwj2-0006I3-57; Tue, 09 Dec 2025 12:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181553.1504584; Tue, 09 Dec 2025 12:21:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSwj2-0006Fu-2Z; Tue, 09 Dec 2025 12:21:52 +0000
Received: by outflank-mailman (input) for mailman id 1181553;
 Tue, 09 Dec 2025 12:21:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N5PS=6P=gmail.com=samaan.dehghan@srs-se1.protection.inumbo.net>)
 id 1vSwj0-0006Fm-EY
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 12:21:50 +0000
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [2607:f8b0:4864:20::102f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1835904-d4f9-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 13:21:48 +0100 (CET)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-3436a97f092so7072255a91.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 04:21:48 -0800 (PST)
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
X-Inumbo-ID: a1835904-d4f9-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765282906; x=1765887706; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1pr8v5ipCIdbqwlw0oS7MwdV0AzJfz/Gw26ur7eGEHA=;
        b=SLuhRBrUXtM4BCGEe6/vyE+zGPyEN3NaNZf6WL7RrD1mznJpU5eo5fdlAhVWl0FzoD
         mX2Rdj5N/T7d53h9fpxXBi+VojUas83mQd2VZBbvWMM35CM254TChcuEhFPKX9hFcGch
         rAbXb/mMdRpqB07EW2eBAF/LYptMUiiPKj7qO3NYnDm3PhqrvSp+A0sWgFG1RAwxdS1l
         4IFYfp8NRAGYv05QPjQHGRV0DYKxC/o1C8tdsG9UfX3ecJ0XsGj8KCHSso7zRkzgxf/v
         3UU0gtjJ4ne484YXoTnMW4CfCENtZ0aE2cs49Mwy3FYynnMzghNAfxpKbe6BxiGh6vJW
         tFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765282906; x=1765887706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1pr8v5ipCIdbqwlw0oS7MwdV0AzJfz/Gw26ur7eGEHA=;
        b=rmGD1jfbSmY0UgQ34wSzdiJCojPcyQO0v88NDz1G8I5Fcj5onphM8I2Ow50Yc6Re2J
         wY18UV5f17HqTn68TUgf1H0+06/7yNLTZmpIJ63ZxhK0PSC4Q861Nel2/ZOGgZqhD1IR
         gQe2UXtZUizmzPil++wQjOeNL+bylS5XCoAfvSWP05+SCXQ0ZBYYYld5UBGLqotL274h
         4JamuHzalPUlvl6OojI+3XcnX9INC9GLtz5dKi82LoMyBlDQ5JT1Ivd02TlBK9n/oPog
         CxW+1z2GicK6BY+Oi2LzA/4rYaPCJBbS8PJY5LS58X42BaNwf0rDU380L7oxDznMe90W
         71uw==
X-Forwarded-Encrypted: i=1; AJvYcCX5ENfqFt9Dm8CMPpb9K8FJRORC1shUw/hXYHunCRpG/UgXDaL9LGrV+BGVMZei4U6Z6NLX7oewP+U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEQNFYGc8WK4HHpW1W4J6yqtryKKesiqXxr2Au3RGSfAHbjHHl
	FSkTdysNWcg2ACxuFozFb9v6yoVoLdTFHmEW/FgFe6NeTZyzr9Q2tB915fWDmi23Mu/aG6thXmU
	I5Bn3moEfca/6rKQ8nXhKaJclALhnEQ==
X-Gm-Gg: AY/fxX7t3p4PdAFmzhIlyB3LXLe6P6LDeGZMn8uirvwIibdetRELBwBengFT4IXKBzg
	gKHcx7UE4bODkzjyG55sHCo8AtYJZK5wUREspYpz8bshz8umxDtziWufDCAZpIVAWk7Nthis3iI
	I/v4cV5WmoP8bt1Jo4GGgm4dfr3Cxcx4n51iTULyeuJkpgDjw3eRXk1tha8vMXJVowlGqn2n/Ky
	HUPa2pOqwauE3OHFqAkGjqf/qZRfeQXwWvHU++jmOd0Jj7d551BSTy+YGGO8FC52jlmeUcxfpLn
	BVUOBpSylUSQMgYjHYy2L762
X-Google-Smtp-Source: AGHT+IHscBjx2qyq04DgHhBKIWRoxJZ+kWY1kTYwJOut8lZjBT+X4vq8qMLTU7W42IcpT1OG/ZhIapVVvJKE2AA3XR4=
X-Received: by 2002:a17:90b:1d47:b0:33f:ee05:56e1 with SMTP id
 98e67ed59e1d1-349a253dc81mr8363817a91.2.1765282906371; Tue, 09 Dec 2025
 04:21:46 -0800 (PST)
MIME-Version: 1.0
References: <bd6686e7fc0756e929334792b94ddd66bde125c4.1765239102.git.samaan.dehghan@gmail.com>
 <0b6b23ab-c683-4cd4-a95c-6892a2c1f164@suse.com>
In-Reply-To: <0b6b23ab-c683-4cd4-a95c-6892a2c1f164@suse.com>
From: Saman Dehghan <samaan.dehghan@gmail.com>
Date: Tue, 9 Dec 2025 06:21:34 -0600
X-Gm-Features: AQt7F2pEE9QsyZ_tEQt5vZx8b_PUATdt6ZKs7MkZfXH-7mcvsD3bR3EQk72J-NM
Message-ID: <CAHFNDNjTX9Oj43H1oH=VEaj5vgYRUqe7Hj92kY1wn1JuSKqzUQ@mail.gmail.com>
Subject: Re: [PATCH] xen/arm64: Add support Clang build on arm64
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2025 at 1:49=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 09.12.2025 01:37, Saman Dehghan wrote:
> > This patch enables building Xen on arm64 architecture using the Clang c=
ompiler.
> > Changes include:
> > - Add explicit -march=3Darmv8 flag for arm64 builds.
> > - Add `__attribute__((target("fp-armv8")))` to `vfp_save_state` and
> >   `vfp_restore_state` functions when building with Clang to allow
> >   FP instructions despite `-mgeneral-regs-only`.
> >
> > Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
> > ---
> >  xen/arch/arm/arch.mk     | 1 +
> >  xen/arch/arm/arm64/vfp.c | 6 ++++++
> >  2 files changed, 7 insertions(+)
>
> Please also update ./README then accordingly.

Thank you, Jan, I will do that.

~Saman
>
> > --- a/xen/arch/arm/arm64/vfp.c
> > +++ b/xen/arch/arm/arm64/vfp.c
> > @@ -46,6 +46,9 @@ static inline void restore_state(const uint64_t *fpre=
gs)
> >                   : : "Q" (*fpregs), "r" (fpregs));
> >  }
> >
> > +#if defined(CONFIG_CC_IS_CLANG)
> > +__attribute__((target("fp-armv8")))
> > +#endif
> >  void vfp_save_state(struct vcpu *v)
> >  {
> >      if ( !cpu_has_fp )
> > @@ -62,6 +65,9 @@ void vfp_save_state(struct vcpu *v)
> >          v->arch.vfp.fpexc32_el2 =3D READ_SYSREG(FPEXC32_EL2);
> >  }
> >
> > +#if defined(CONFIG_CC_IS_CLANG)
> > +__attribute__((target("fp-armv8")))
> > +#endif
> >  void vfp_restore_state(struct vcpu *v)
> >  {
> >      if ( !cpu_has_fp )
>
> Aren't it save_state() and restore_state() which actually use FP register=
s?
> Applying such attributes in too wide a fashion risks the compiler using F=
P
> registers also for other purposes. On x86 we were hit by such when we
> suppressed use of SSE registers while not suppressing use of MMX ones. In
> some configuration, after many years of this having gone fine, the compil=
er
> chose to use MMX insns for some odd reason.
>
> Seeing that save_state() and restore_state() are a single asm() statement
> each, any reason not to actually have them in an assembly file, just like
> their SVE counterparts are?
>

On top of those, `READ_SYSREG(FPSR)`, `READ_SYSREG(FPCR)`,
`WRITE_SYSREG(v->arch.vfp.fpsr, FPSR)`and
`WRITE_SYSREG(v->arch.vfp.fpcr, FPCR)` using FP.
I think I cannot apply __attribute__ on statements.

~Saman

> Jan

