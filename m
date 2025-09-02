Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18056B3F57A
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 08:30:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105688.1456542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utKWl-0007T6-3P; Tue, 02 Sep 2025 06:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105688.1456542; Tue, 02 Sep 2025 06:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utKWk-0007QC-Vf; Tue, 02 Sep 2025 06:29:58 +0000
Received: by outflank-mailman (input) for mailman id 1105688;
 Tue, 02 Sep 2025 06:29:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/no=3N=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utKWk-0007Q6-1B
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 06:29:58 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 397c411d-87c6-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 08:29:48 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-55f6aef1a7dso3444033e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 23:29:48 -0700 (PDT)
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
X-Inumbo-ID: 397c411d-87c6-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756794588; x=1757399388; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cjE7xFR7p96yq3ltRQjbzh9cdzevz1eMLuW8PVJ95o=;
        b=F625HtDIkgcdTM01PagbHlWqbZ/qYt68ccz3j4kpkelAJhWUO7f1PV9hwIjwf6jPe3
         JM+kOrGptCmzjzhmyaRM8Tkoa2+El7J1ytB42kZOU+hnB60EiObDNHf7DqiGLoNIg7Sv
         D7SrOQvR7fwV5coVxT69EZic7T5aCBLsJCYdApyI3Wu40wnFXEjxU3RwPv9a9BNeItuO
         wvs+mUePEUaRxltIttTMoBf1i+6/3IveQv0E1Ww3CZBzBwZtUyT8GoRIOJPVCDPFOpX9
         s0e2qCwkbhUoYf9PPHz+CdN12SWhf+qBvw+sLZQY8k0zGb23XfyNx6xpNejUOYpkcbMS
         JVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756794588; x=1757399388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5cjE7xFR7p96yq3ltRQjbzh9cdzevz1eMLuW8PVJ95o=;
        b=T71YJKKvokulYYhEFN4wv53D0HK6f0jZujFu9pbA9bLFmysbLRbpb00XWBog5JXam4
         taEtfup1Le6I6oZIvlurvZSIyyyiBrBzOoRWT7dfBSpWsiESnyNTPwctMT+7RWp70Dof
         tcw8hRYktNH8mzdjdMp6adrgNfK6YsPIYcaftmgjJOZlyUeaJS6OdGt7jeVMMWctaTHP
         qWqjC1c4Eoo+cy7mchs2vCNkmRLUCGtKKAt3Sp2+w8h5OqycaHV1wXPGKexRISIYDIZb
         unpd1jR0quo1/SjiI3WttA7ogzZ83Bng3BmfKqBQsGmSWz+KwG9tmlp16zECvSOtRURL
         LM8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWmZJpQOpjPVGeY41pBohQgfGiToNk+pjhr6FqT12x7AcgvWVZLHrqmLiPx3vQsZRDxsA0SKoTNHI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzhkccoXG4UEcB5aHcQfSVoGl8Y5Pe1EnMMxR7YyouYNKLH453Q
	ux6CuMN7aUGMN/+zZjwvYbeDuMj06uTdmc5Rxo1j8tNzxZtFsjyhmpgm1nlmqmAJMja3uIDOXus
	e1VdCY013o2TlCTqn2KbpD9FQtOz/rjs=
X-Gm-Gg: ASbGncuiNF3nGEtuUWCEeH9OzeFU5XIXXbuLeiVtNEUBAk8yECkwYFTciTu2OL2yQ3v
	a0oBmgfUorjUBic+sUJf5NHRsa1I05h9BH85rGx52ej9Mgbyc1NxpvoeEalVn5lbOBV8G6P6CXC
	1JDksegCs/JldVjW4WqsYxdqnuR0eNSq/QUAAxSsONi35Dx8dHCpWSNR3EPI5lhcFE7nZ08rVuU
	xbvRg==
X-Google-Smtp-Source: AGHT+IHGv95C8iiEM+/MfGqOem+SSSjlvfC/N2MarBpapnVzdaxxJqW+0Ymp5XYJTJqTkh7k8YvNfMe+iFoE3PsyGN0=
X-Received: by 2002:a05:6512:b88:b0:55f:4512:71f3 with SMTP id
 2adb3069b0e04-55f70995affmr3150946e87.33.1756794588064; Mon, 01 Sep 2025
 23:29:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756586648.git.mykola_kvach@epam.com> <244e5c2bcebad9563595ac7564ffa105d5f568d3.1756586648.git.mykola_kvach@epam.com>
 <80c8dbfe-5240-441d-84fc-603e9c5f9812@suse.com> <CAGeoDV8Jjri+EhJDvxuZED9gm_b5JGcCouSeHqdBF=xR6VZw+w@mail.gmail.com>
In-Reply-To: <CAGeoDV8Jjri+EhJDvxuZED9gm_b5JGcCouSeHqdBF=xR6VZw+w@mail.gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 2 Sep 2025 09:29:37 +0300
X-Gm-Features: Ac12FXy1_-tUQo7L6wu-oUe2Le2_XmAoiRd9ISDotrBgRKLyFLlQR_AahCWQf-8
Message-ID: <CAGeoDV_zfFhgKr1RMVB2rLnXJd3TrzD8nNr4z4uREeLyH_sGuQ@mail.gmail.com>
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

AFAIU, both your proposal and mine would violate MISRA C Dir 1.1 and
Rule 1.1 (also Rule 1.2 but it is acceptable). According to these
requirements, any use of compiler extensions should be documented and
understood. In the context of the Xen hypervisor, such extensions must
be listed in "docs/misra/C-language-toolchain.rst" as required by our
project guidelines.

>
> >
> > Jan
>
> Best regards,
> Mykola

Best regards,
Mykola

