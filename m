Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 998078AE9E5
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 16:56:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710744.1110162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHZG-0002zF-9L; Tue, 23 Apr 2024 14:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710744.1110162; Tue, 23 Apr 2024 14:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHZG-0002wv-5y; Tue, 23 Apr 2024 14:56:22 +0000
Received: by outflank-mailman (input) for mailman id 710744;
 Tue, 23 Apr 2024 14:56:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6olb=L4=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1rzHZE-0002vM-PD
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 14:56:20 +0000
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [2607:f8b0:4864:20::c29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a399e498-0181-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 16:56:18 +0200 (CEST)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-5af2d0a53f5so534170eaf.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 07:56:18 -0700 (PDT)
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
X-Inumbo-ID: a399e498-0181-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713884177; x=1714488977; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BJRmR5O6zt8JFb8eq3u2PJtEjkEhAJOUkV1zBxcWX0=;
        b=q/pPuwu4DhSJUTL8KRPumJfXrEXobqbLmtyfI529OjcwOYNFN5toU0yrwZNjPXj1QU
         o9+h6FvjgcUM8MEmJggXbnpSZryHCaTLJXhhmHaOO/wGEGSFp+M5e6quesfWCoVilt6Q
         AJQhfJLrj1TaMcwhtVqi1kQF7F1eI3j+ma9LeWTyG0ErWdexf6e7frGxAaEMKdZ5D2/w
         R/iw3o5eft7fCj49PpzuX33Cqxg1lPscYNrL70rDLpAT3aETkdPcP4wK33yeEBDL3GKx
         5twr1prE8au/ZzQ2qb+LJBLdweyhui+IAe6m261mbNTcXJKWweV2PAnKEztyHISD55SJ
         DxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713884177; x=1714488977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9BJRmR5O6zt8JFb8eq3u2PJtEjkEhAJOUkV1zBxcWX0=;
        b=pDKiqKqQvq6VOAdc7xvscOjxJf5u6Pu1e604sVvIuj2z/H8XnGqpc47aZdOBgdSFTI
         1009nHjyV2n0btjkygxToQDQcTdLOBIVT2XFdv79rKpxNcUP4tDYiIypVvKeSANdYxJG
         N5mvMJ0rwlxTZAA+iB4ThGUp+lEIGDcnN3ZpRg+NxNUbfMhckC3Uh4WS/ImAmGkNlIVO
         CgjDnShsxgKFL2IFyCbTcSFQumR1cIYNa+j1cGkvWBvJVOdFUQgunO7WbTdP1OdelgAW
         s5JEkhiTh/YsysNdWXd9swkauBnffyB5JHSK+EiJsjjMaVhkiHcnLCiG8BVIP9rJiLWf
         cbfA==
X-Gm-Message-State: AOJu0YzB8elkCLtXCd5OsBqmvyUeO811JGDF55C41J4GstWq4220VQVm
	dgVI/gFueKO4bbXn5MYTLRUmaXJZth15KE0Jnpk/u+pz6WnqzDt6BftJECTx4m5/WDqZWI39Vbk
	L5iClp7hK93lcBfbtQnEdN8SxA9SafQaVbMsXag==
X-Google-Smtp-Source: AGHT+IEQ5/2gkXNRDpWyezKzOPVBVyRsbgetd9tctveo9J6e/obX+sfaO7ui9jV2F7UlAzpkEhxEZ9OkVLROMW76L6U=
X-Received: by 2002:a05:6820:280a:b0:5aa:6b6a:62c with SMTP id
 dm10-20020a056820280a00b005aa6b6a062cmr1214824oob.2.1713884177424; Tue, 23
 Apr 2024 07:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240422073708.3663529-1-jens.wiklander@linaro.org>
 <20240422073708.3663529-5-jens.wiklander@linaro.org> <89d268cc-bc49-4e22-b4e9-2e8dbe73124c@xen.org>
 <CAHUa44GAbBtczbVohVjC=66tqzjgeGLx44k9ddodDJL13KwVEQ@mail.gmail.com> <205a95f2-fdf6-4f38-b2e0-31e4fff9348b@xen.org>
In-Reply-To: <205a95f2-fdf6-4f38-b2e0-31e4fff9348b@xen.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 23 Apr 2024 16:56:06 +0200
Message-ID: <CAHUa44FbUDRkha9tCfTjFPU-X4xiNepZfWMrtBNP4d_U-_hp3g@mail.gmail.com>
Subject: Re: [XEN PATCH v2 4/5] xen/arm: allow dynamically assigned SGI handlers
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, patches@linaro.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 1:05=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
>
>
> On 23/04/2024 10:35, Jens Wiklander wrote:
> > Hi Julien,
>
> Hi Jens,
>
> > On Mon, Apr 22, 2024 at 12:57=E2=80=AFPM Julien Grall <julien@xen.org> =
wrote:
> >>
> >> Hi Jens,
> >>
> >> On 22/04/2024 08:37, Jens Wiklander wrote:
> >>> Updates so request_irq() can be used with a dynamically assigned SGI =
irq
> >>> as input. This prepares for a later patch where an FF-A schedule
> >>> receiver interrupt handler is installed for an SGI generated by the
> >>> secure world.
> >>
> >> I would like to understand the use-case a bit more. Who is responsible
> >> to decide the SGI number? Is it Xen or the firmware?
> >>
> >> If the later, how can we ever guarantee the ID is not going to clash
> >> with what the OS/hypervisor is using? Is it described in a
> >> specification? If so, please give a pointer.
> >
> > The firmware decides the SGI number. Given that the firmware doesn't
> > know which SGIs Xen is using it typically needs to donate one of the
> > secure SGIs, but that is transparent to Xen.
>
> Right this is my concern. The firmware decides the number, but at the
> same time Xen thinks that all the SGIs are available (AFAIK there is
> only one set).
>
> What I would like to see is some wording from a spec indicating that the
> SGIs ID reserved by the firmware will not be clashing with the one used
> by Xen.
>
> >
> >
> >>
> >>>
> >>> gic_route_irq_to_xen() don't gic_set_irq_type() for SGIs since they a=
re
> >>> always edge triggered.
> >>>
> >>> gic_interrupt() is updated to route the dynamically assigned SGIs to
> >>> do_IRQ() instead of do_sgi(). The latter still handles the statically
> >>> assigned SGI handlers like for instance GIC_SGI_CALL_FUNCTION.
> >>>
> >>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> >>> ---
> >>> v1->v2
> >>> - Update patch description as requested
> >>> ---
> >>>    xen/arch/arm/gic.c | 5 +++--
> >>>    xen/arch/arm/irq.c | 7 +++++--
> >>
> >> I am not sure where to write the comment. But I think the comment on t=
op
> >> of irq_set_affinity() in setup_irq() should also be updated.
> >>
> >>>    2 files changed, 8 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> >>> index 44c40e86defe..e9aeb7138455 100644
> >>> --- a/xen/arch/arm/gic.c
> >>> +++ b/xen/arch/arm/gic.c
> >>> @@ -117,7 +117,8 @@ void gic_route_irq_to_xen(struct irq_desc *desc, =
unsigned int priority)
> >>>
> >>>        desc->handler =3D gic_hw_ops->gic_host_irq_type;
> >>>
> >>> -    gic_set_irq_type(desc, desc->arch.type);
> >>> +    if ( desc->irq >=3D NR_GIC_SGI)
> >>> +        gic_set_irq_type(desc, desc->arch.type);
> >>
> >> So above, you say that the SGIs are always edge-triggered interrupt. S=
o
> >> I assume desc->arch.type. So are you skipping the call because it is
> >> unnessary or it could do the wrong thing?
> >>
> >> Ideally, the outcome of the answer be part of the comment on top of th=
e
> >> check.
> >
> > gic_set_irq_type() has an assert "ASSERT(type !=3D IRQ_TYPE_INVALID)"
> > which is triggered without this check.
> > So it's both unnecessary and wrong. I suppose we could update the
> > bookkeeping of all SGIs to be edge-triggered instead of
> > IRQ_TYPE_INVALID. It would still be unnecessary though. What do you
> > suggest?
>
> I would rather prefer if we update the book-keeping for all the SGIs.

I'll update the code.

>
> [...]
>
> >>
> >>>            {
> >>>                isb();
> >>>                do_IRQ(regs, irq, is_fiq);
> >>> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> >>> index bcce80a4d624..fdb214560978 100644
> >>> --- a/xen/arch/arm/irq.c
> >>> +++ b/xen/arch/arm/irq.c
> >>> @@ -224,9 +224,12 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned=
 int irq, int is_fiq)
> >>>
> >>>        perfc_incr(irqs);
> >>>
> >>> -    ASSERT(irq >=3D 16); /* SGIs do not come down this path */
> >>> +    /* Statically assigned SGIs do not come down this path */
> >>> +    ASSERT(irq >=3D GIC_SGI_MAX);
> >>
> >>
> >> With this change, I think the path with vgic_inject_irq() now needs to
> >> gain an ASSERT(irq >=3D NR_GIC_SGI) because the path is not supposed t=
o be
> >> taken for SGIs.
> >
> > I'm sorry, I don't see the connection. If I add
> > ASSERT(virq >=3D NR_GIC_SGI);
> > at the top of vgic_inject_irq() it will panic when injecting a
> > Schedule Receiver or Notification Pending Interrupt for a guest.
>
> If you look at do_IRQ(), we have the following code:
>
>      if ( test_bit(_IRQ_GUEST, &desc->status) )
>      {
>          struct irq_guest *info =3D irq_get_guest_info(desc);
>
>          perfc_incr(guest_irqs);
>          desc->handler->end(desc);
>
>          set_bit(_IRQ_INPROGRESS, &desc->status);
>
>          /*
>           * The irq cannot be a PPI, we only support delivery of SPIs to
>           * guests.
>           */
>          vgic_inject_irq(info->d, NULL, info->virq, true);
>          goto out_no_end;
>      }
>
> What I suggesting is to add an ASSERT(irq >=3D NR_GIC_SGI) just before th=
e
> call because now do_IRQ() can be called with SGIs yet we don't allow HW
> SGIs to assigned to a guest.

Got it, thanks for the explanation. I'll add the assert.

Thanks,
Jens

