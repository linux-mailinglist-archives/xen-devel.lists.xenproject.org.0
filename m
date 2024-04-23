Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4738AE120
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 11:36:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710485.1109730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzCZM-0006Ic-4M; Tue, 23 Apr 2024 09:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710485.1109730; Tue, 23 Apr 2024 09:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzCZM-0006Gc-1l; Tue, 23 Apr 2024 09:36:08 +0000
Received: by outflank-mailman (input) for mailman id 710485;
 Tue, 23 Apr 2024 09:36:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6olb=L4=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1rzCZL-0006GV-AN
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 09:36:07 +0000
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [2001:4860:4864:20::30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e72b868e-0154-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 11:36:04 +0200 (CEST)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-22fa7e4b0beso3079143fac.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 02:36:04 -0700 (PDT)
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
X-Inumbo-ID: e72b868e-0154-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713864963; x=1714469763; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FD3wHRHF/el1LymCWjpCJfgfQzZcS8uNwvtyguXnms=;
        b=UrMFzYjO83v0aOFywkBPXAbsSKRvbeWhkgIrQNNzJb4PJmPWFDwdSsDXBpsJmSZsKd
         a+rrYCQlT2quwtaLo3R8N47CK84zkROk/TdHUhRgjAKRiH05HXIyF5QHRBwDEqDSEdQU
         Xnx8fRss6X7+193Z6k0ewkS59Wx5xkQ3Io/iCo3Iopi4stPHYMSVAbC4CWb6HtUE8CRj
         hvgrCxAWv1Ww/W4kRKGKqPDnBFIq5KOPDjpk23fcsAFW+YP0Kb1c+TazFqtdTp/yoHW1
         ZaTts5HqDiRob9jAIB/6MVuX1sF1+inRepmTn8qGBH2nPv2mgYOFweS5/MH6bcfIdIH7
         92vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713864963; x=1714469763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FD3wHRHF/el1LymCWjpCJfgfQzZcS8uNwvtyguXnms=;
        b=UbwDfLWfPujXgidREFMT0luRjyA1WO1S/ZSp3OrKrZRApWx4z+LiUywOP3zL2VPhuD
         qnRMMXlK0HkH3/qqD+IxejuJz9pu4jtAhmB4kC9S0/JKE2O8uKcbOVBDer0wSzDbf2el
         sYOaXwrd9nmyuxLraDZZrGTSSDB6n/VHY/anlW35GvEuRR0YBZMlE7u2gkw1qtQHZ9o0
         1jndGANQaoN/K/v8w3xlOdfPSgX/K0mMYJNjQLAQ/Cw6i7DQ3Y1t4tK0IYnsw84IIZVx
         FBMCr2GzWOrfUJZDjTcq5n0wDHANJpTKRSjnHyHyqb0XWtWfn+k61eTU3h+aNA1Mlrxx
         e02A==
X-Gm-Message-State: AOJu0Yw7kxK9clSQ8vgIzZRe76L1BJMbO6gSB2qDBU/ojHZ5xQtiYaJv
	+ie5CFsjDV6LyjK1FR6ruQ6tRyGRLveSz746CJZ4I4OURUwIqKFK/Yrvu7wIu3tT/qW8SLcFPJl
	8Ha/22OI9XpZLtzolNlX/NNBbp5w2/0Vr4owYDA==
X-Google-Smtp-Source: AGHT+IF2lYnbr0K/fyabbUG2PjvnqjOn9drcYQJ8NGdD79DK90da2W1Fd41dRot37yPp+iXlTTEekSXTF5uJjeYcSPE=
X-Received: by 2002:a05:6871:339d:b0:22e:7a61:574a with SMTP id
 ng29-20020a056871339d00b0022e7a61574amr16299048oac.33.1713864963363; Tue, 23
 Apr 2024 02:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240422073708.3663529-1-jens.wiklander@linaro.org>
 <20240422073708.3663529-5-jens.wiklander@linaro.org> <89d268cc-bc49-4e22-b4e9-2e8dbe73124c@xen.org>
In-Reply-To: <89d268cc-bc49-4e22-b4e9-2e8dbe73124c@xen.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 23 Apr 2024 11:35:51 +0200
Message-ID: <CAHUa44GAbBtczbVohVjC=66tqzjgeGLx44k9ddodDJL13KwVEQ@mail.gmail.com>
Subject: Re: [XEN PATCH v2 4/5] xen/arm: allow dynamically assigned SGI handlers
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, patches@linaro.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Mon, Apr 22, 2024 at 12:57=E2=80=AFPM Julien Grall <julien@xen.org> wrot=
e:
>
> Hi Jens,
>
> On 22/04/2024 08:37, Jens Wiklander wrote:
> > Updates so request_irq() can be used with a dynamically assigned SGI ir=
q
> > as input. This prepares for a later patch where an FF-A schedule
> > receiver interrupt handler is installed for an SGI generated by the
> > secure world.
>
> I would like to understand the use-case a bit more. Who is responsible
> to decide the SGI number? Is it Xen or the firmware?
>
> If the later, how can we ever guarantee the ID is not going to clash
> with what the OS/hypervisor is using? Is it described in a
> specification? If so, please give a pointer.

The firmware decides the SGI number. Given that the firmware doesn't
know which SGIs Xen is using it typically needs to donate one of the
secure SGIs, but that is transparent to Xen.


>
> >
> > gic_route_irq_to_xen() don't gic_set_irq_type() for SGIs since they are
> > always edge triggered.
> >
> > gic_interrupt() is updated to route the dynamically assigned SGIs to
> > do_IRQ() instead of do_sgi(). The latter still handles the statically
> > assigned SGI handlers like for instance GIC_SGI_CALL_FUNCTION.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> > v1->v2
> > - Update patch description as requested
> > ---
> >   xen/arch/arm/gic.c | 5 +++--
> >   xen/arch/arm/irq.c | 7 +++++--
>
> I am not sure where to write the comment. But I think the comment on top
> of irq_set_affinity() in setup_irq() should also be updated.
>
> >   2 files changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> > index 44c40e86defe..e9aeb7138455 100644
> > --- a/xen/arch/arm/gic.c
> > +++ b/xen/arch/arm/gic.c
> > @@ -117,7 +117,8 @@ void gic_route_irq_to_xen(struct irq_desc *desc, un=
signed int priority)
> >
> >       desc->handler =3D gic_hw_ops->gic_host_irq_type;
> >
> > -    gic_set_irq_type(desc, desc->arch.type);
> > +    if ( desc->irq >=3D NR_GIC_SGI)
> > +        gic_set_irq_type(desc, desc->arch.type);
>
> So above, you say that the SGIs are always edge-triggered interrupt. So
> I assume desc->arch.type. So are you skipping the call because it is
> unnessary or it could do the wrong thing?
>
> Ideally, the outcome of the answer be part of the comment on top of the
> check.

gic_set_irq_type() has an assert "ASSERT(type !=3D IRQ_TYPE_INVALID)"
which is triggered without this check.
So it's both unnecessary and wrong. I suppose we could update the
bookkeeping of all SGIs to be edge-triggered instead of
IRQ_TYPE_INVALID. It would still be unnecessary though. What do you
suggest?

>
> >       gic_set_irq_priority(desc, priority);
> >   }
> >
> > @@ -375,7 +376,7 @@ void gic_interrupt(struct cpu_user_regs *regs, int =
is_fiq)
> >           /* Reading IRQ will ACK it */
> >           irq =3D gic_hw_ops->read_irq();
> >
> > -        if ( likely(irq >=3D 16 && irq < 1020) )
> > +        if ( likely(irq >=3D GIC_SGI_MAX && irq < 1020) )
>
> This check is now rather confusing as one could think that do_IRQ()
> would still not be reached for dynamic SGI. I think it would be clearer
> GIC_SGI_MAX needs to be renamed to GIC_SGI_STATIC_MAX and do_sgi() to
> do_static_sgi().

Thanks, I'll update.

>
> >           {
> >               isb();
> >               do_IRQ(regs, irq, is_fiq);
> > diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> > index bcce80a4d624..fdb214560978 100644
> > --- a/xen/arch/arm/irq.c
> > +++ b/xen/arch/arm/irq.c
> > @@ -224,9 +224,12 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned i=
nt irq, int is_fiq)
> >
> >       perfc_incr(irqs);
> >
> > -    ASSERT(irq >=3D 16); /* SGIs do not come down this path */
> > +    /* Statically assigned SGIs do not come down this path */
> > +    ASSERT(irq >=3D GIC_SGI_MAX);
>
>
> With this change, I think the path with vgic_inject_irq() now needs to
> gain an ASSERT(irq >=3D NR_GIC_SGI) because the path is not supposed to b=
e
> taken for SGIs.

I'm sorry, I don't see the connection. If I add
ASSERT(virq >=3D NR_GIC_SGI);
at the top of vgic_inject_irq() it will panic when injecting a
Schedule Receiver or Notification Pending Interrupt for a guest.


>
> >
> > -    if ( irq < 32 )
> > +    if ( irq < NR_GIC_SGI )
> > +        perfc_incr(ipis);
> > +    else if ( irq < NR_GIC_LOCAL_IRQS )
> >           perfc_incr(ppis);
> >       else
> >           perfc_incr(spis);
>

Thanks,
Jens

