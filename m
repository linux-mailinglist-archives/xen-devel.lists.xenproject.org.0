Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5181B3ED40
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 19:17:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105229.1456172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut8A0-0006nL-Eu; Mon, 01 Sep 2025 17:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105229.1456172; Mon, 01 Sep 2025 17:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut8A0-0006kO-Ab; Mon, 01 Sep 2025 17:17:40 +0000
Received: by outflank-mailman (input) for mailman id 1105229;
 Mon, 01 Sep 2025 17:17:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pPXY=3M=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ut89y-0006kI-Rq
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 17:17:38 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e8f28a1-8757-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 19:17:37 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-336b908cbaaso28185851fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 10:17:37 -0700 (PDT)
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
X-Inumbo-ID: 8e8f28a1-8757-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756747057; x=1757351857; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UkIp5FBOplvRNED16mH/L/IUQT2gNT5m6KSv0hGQEeo=;
        b=Lv/q/6e3IgjSITHgUiL2eBoXWfwmzEFFAwzDQUvuhMYlHi3f7j1sOZRFCarVFkP7VH
         Dq+7SarVJ95AX4wSb6eCxPKZrLtLb/YoGQdDK6yEfoZdv0hcMe0ReUQBMNpYlEjJAgjS
         4nAT0YdHumOj57B+YgVVK8O4JzqTPBiUqQDP19a7tOST73qdXtbnOA8M3g7tjLiU2Gvs
         +E/zrZqHfsQJGm7aVRJxg5zmLuGm7LiCkLK8JkAmrOkfi37GD7weyMmCfGiRagW8786j
         Ws7+N9NjfNQpXrwhPmKp8Ob/gHcKLHERXcirI1oC09F9hyDuPflojza7/tAN14Cq5Oes
         pthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756747057; x=1757351857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UkIp5FBOplvRNED16mH/L/IUQT2gNT5m6KSv0hGQEeo=;
        b=GUTvdHqCkhuS61CVASrcKt05v+Mxro1CVS8C/BT3ycB/0RFWJA7vw5N6oP2HaxAHy1
         A3MENJQC6n7VWGN04AGPGo3/pN8JQAH4GOA3zuH4paXslMX0BQ5ruRa3y5mXLdZ5lZlJ
         2qLlU6xfpr/H/TvK2e9fUDho4NAiHRg6NANN3v3fWXnTZWU3hkWeMR67t3UhwOva0ES5
         Gq3vt61UAUx5NBCJpUndiR9HJG5L0zuVGyyFtAV8zCQ9qOa9mfLO2IBCbe4vHlv+/w4k
         Nqj0dmL2369/BxJIF3dsX8g6nz3jm215KU1zby7PErKVNT16CERP3Ltfgh8d4LKvbEa9
         noHw==
X-Forwarded-Encrypted: i=1; AJvYcCU7lnIBkHIn7D2mFJp8k7PYddnXYnb3IdKQGgl8DmApN5s609LJPof8XSiU1lRdsMIS6+ymvyyQwLc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwhJ7jFQuOskGFOO1Vec4RP0/ZNTzkYoqeZ66FGLQawAv3AdcSj
	0VNnMnrUDZAXhbDJu+g0nArRXhVM/tqe+QyYuZAQ+TDEJbP2uMnDe4U8Q+GzhjBzXbD6IkqCDR+
	EbBjMbQR7Vz7ZJOYfIr3xlpEEmJw4dFo=
X-Gm-Gg: ASbGncv5Wq1v7yeDhgUCbQ4s/hsZo74zYmPzDk1VpxZgD9mV4XZ8/S8pai3t+9cuZqw
	ehhfgbi3aRcoxL7vTHVsrOKqWV9S0yuNdHRBKhPErCRSnBG7ov3dznMufvaLA8YIQyHzHHo2475
	rCKE2CWHSAqvMlWBqG8hPtxzWW98ci/jEtuzVrnNjk24oK4bEdatjc2LjfB/2MMGW1FrzAD/SGi
	RqICw==
X-Google-Smtp-Source: AGHT+IFo9af4hG7bQ4c7ZfB7Owzw2fmDVXcUkqMJrewTn3jGnI1yHdArdYdS4N+ZGnTQZofHZ+UDgDphVu3A0a/kLuk=
X-Received: by 2002:a05:651c:2122:b0:336:dfab:51b6 with SMTP id
 38308e7fff4ca-336dfab5cc3mr14866691fa.23.1756747056475; Mon, 01 Sep 2025
 10:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756586648.git.mykola_kvach@epam.com> <244e5c2bcebad9563595ac7564ffa105d5f568d3.1756586648.git.mykola_kvach@epam.com>
 <80c8dbfe-5240-441d-84fc-603e9c5f9812@suse.com> <CAGeoDV8Jjri+EhJDvxuZED9gm_b5JGcCouSeHqdBF=xR6VZw+w@mail.gmail.com>
In-Reply-To: <CAGeoDV8Jjri+EhJDvxuZED9gm_b5JGcCouSeHqdBF=xR6VZw+w@mail.gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 1 Sep 2025 20:17:23 +0300
X-Gm-Features: Ac12FXy_C9A6C8odzYjv7qIFykvGdYAWymZh3JegwkbsWtenB7H_YSK-3NhE1v8
Message-ID: <CAGeoDV_5856nbOA6_H00yxGvBD=+YG3XOAObw6dCMesb00ZiTg@mail.gmail.com>
Subject: Re: [PATCH v12 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Connor Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 8:02=E2=80=AFPM Mykola Kvach <xakep.amatop@gmail.com=
> wrote:
>
> Hi Jan,
>
> On Mon, Sep 1, 2025 at 5:29=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
> >
> > On 31.08.2025 00:10, Mykola Kvach wrote:
> > > --- a/xen/arch/ppc/stubs.c
> > > +++ b/xen/arch/ppc/stubs.c
> > > @@ -224,6 +224,11 @@ void arch_domain_creation_finished(struct domain=
 *d)
> > >      BUG_ON("unimplemented");
> > >  }
> > >
> > > +int arch_domain_resume(struct domain *d)
> > > +{
> > > +    return 0;
> > > +}
> > > +
> > >  int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c)
> > >  {
> > >      BUG_ON("unimplemented");
> > > diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
> > > index 1a8c86cd8d..52532ae14d 100644
> > > --- a/xen/arch/riscv/stubs.c
> > > +++ b/xen/arch/riscv/stubs.c
> > > @@ -198,6 +198,11 @@ void arch_domain_creation_finished(struct domain=
 *d)
> > >      BUG_ON("unimplemented");
> > >  }
> > >
> > > +int arch_domain_resume(struct domain *d)
> > > +{
> > > +    return 0;
> > > +}
> > > +
> > >  int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c)
> > >  {
> > >      BUG_ON("unimplemented");
> > > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> > > index 19fd86ce88..94a06bc697 100644
> > > --- a/xen/arch/x86/domain.c
> > > +++ b/xen/arch/x86/domain.c
> > > @@ -1138,6 +1138,11 @@ void arch_domain_creation_finished(struct doma=
in *d)
> > >          hvm_domain_creation_finished(d);
> > >  }
> > >
> > > +int arch_domain_resume(struct domain *d)
> > > +{
> > > +    return 0;
> > > +}
> > > +
> > >  #ifdef CONFIG_COMPAT
> > >  #define xen_vcpu_guest_context vcpu_guest_context
> > >  #define fpu_ctxt fpu_ctxt.x
> >
> > I definitely don't like this redundancy, and even less so that you intr=
oduce out-
> > of-line calls.
>
> Thank you for your feedback.
> I followed the existing pattern used in other architecture stubs.

... while I understand your concern about redundancy and out-of-line
calls, I would appreciate more specific technical reasoning for why
this approach is undesirable.
Code review is most effective when it is based on objective criteria
and project guidelines, rather than personal preferences.
This helps contributors understand the rationale and make improvements
that benefit the whole project.

>
> >
> > > --- a/xen/include/xen/domain.h
> > > +++ b/xen/include/xen/domain.h
> > > @@ -109,6 +109,8 @@ int arch_domain_soft_reset(struct domain *d);
> > >
> > >  void arch_domain_creation_finished(struct domain *d);
> > >
> > > +int arch_domain_resume(struct domain *d);
> >
> > I think this wants to move to a per-arch header, presence of which is c=
hecked by
> > has_include(), with an inline fallback define once centrally here.
>
> Would it be acceptable to use a weak function as the default
> implementation instead? This way, architectures needing a real
> implementation could override it, while others would use the weak
> default.
>
> >
> > Jan
>
> Best regards,
> Mykola

