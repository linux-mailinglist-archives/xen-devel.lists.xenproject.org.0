Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKMtJRKmFGrJPAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 21:42:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC2C5CE0F2
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 21:42:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319462.1587053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRbAd-00030D-OD; Mon, 25 May 2026 19:41:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319462.1587053; Mon, 25 May 2026 19:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRbAd-0002xV-Kf; Mon, 25 May 2026 19:41:03 +0000
Received: by outflank-mailman (input) for mailman id 1319462;
 Mon, 25 May 2026 19:41:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wRbAc-0002xP-FM
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 19:41:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRbAb-00G1a2-SH
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 21:41:01 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a14a58e-bab6-0a2a0a5309dd-0a2a450cb95a-48
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 21:41:01 +0200
Received: from [209.85.208.178] (helo=mail-lj1-f178.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a14a5cd-62f1-0a2a450c0019-d155d0b2c162-3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 21:41:01 +0200
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-393a44854d2so87381711fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 12:41:01 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1779738061; cv=none;
        d=google.com; s=arc-20240605;
        b=OOH7VHqevKKM2Ct3eaO6cHuHtemZkRMY1Nn1ys+M82/Bwzcq0hx8kX35+GeEe4/U6K
         qlab/bZ+y1qmJ7raXgDpLg/Q8wru5S9CAoa/g0aZtWpVChCo+bgQSZ3K7wRNcavQmHsG
         YuJ4WG9xiavnrNSLpiy2iYtZMFeB1FhTI3LZ9fVbLNbg3RHUr4V7ZOJ3FE0I4y7WS1ch
         PaUzT53KuZOSwZaJ2W9nxnKGWLKM+yNwEkZ5mtlOG4/dPLzSJR2l1Z90BvKoW47TEqgW
         jFrzIE4exGGDcZlLM7DLWwauRZlR3cIr12Hgb5YiinmXHG+e1Fm6PAIisgNpOaRyYwV+
         i8Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7GscdMGa5JwV06hUGhNhA9wTPcL7ZJx0M5oTmeCkk5g=;
        fh=zL8KVAj6rSaYbk/102rEWeOa69wm5cw+i9nXMzeM8z8=;
        b=iFjZXhUsi2atABRI8V/nirNEs1xtBPZgx/fl42u/ZTUf3p3udOQUEYx/T3oudmpe+t
         Hmd9ISOLUwg6A+jW7nejX0ZHhjyw5J0tLbr5rQlK4HUSSOfkFHu7I5poTEsOc5S+FE4p
         ztOfWrZDtwTW/ErTB6KhYPabMgOkiLiQfWEDtVyzdgfgqll5eoqea6zfdGliTIwdypTX
         H9Hp2bvPzSf76MmOXcJ/L+Q/Z06Wcl3ZGBLf2wWO/x8AK0yCtTdEgMnWd3Bd5GNJyX4G
         8v/8do/nDvPRAV1JWHpgdXdsemDbWoSj7QnJbqTB8f0W/MFbRYDSpaFKDe6gIRHS3xFx
         KRfw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779738061; x=1780342861; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GscdMGa5JwV06hUGhNhA9wTPcL7ZJx0M5oTmeCkk5g=;
        b=UhTsgyVya1+zZJ1sNSH6oe8P/AzyhwVWA9jS9m55vHz+TMQ0fm+edbXFOakOlmUvJF
         tsClgpNRQzf/fVmpIOxRl6tuC63r/nEKpEEHN7dg5l0GQ8an5oK4GWL1LAWQ+4Zs/GSq
         /5CRL4ridUfdIBkEn17V08/ah0GQbbChZJS1t9uPCO+NJ3E0MBz/ENzbAbFlgDlBcB0b
         9p9vlzhLQHkuzHgdqoYrJPVWg24BiWIgn7CGbnGZL3hepTi1QaRilzdQPCfedIPubjNK
         EgMzS4oLUBRXcPqF0oAV+A5NIzWKktVCSAEx9tJwj05mNHuYZTfVi7dsLNTLfn8lTcyL
         ZZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779738061; x=1780342861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7GscdMGa5JwV06hUGhNhA9wTPcL7ZJx0M5oTmeCkk5g=;
        b=eHtarnOuPN7UQyFfpSBGiNk6HP+4ZeZsVJnNfGEVwMMpc786/QyhvPvXt7/iIy4m95
         AODh2OP68s8Z5uby1T/G63+YS7/3pqEArHdWdHRXHlIC38HXA3DkSNaG9ElrtZQHVHgH
         cf9dPdwPTEcZ5TqsAAA3Pm9Rq/wAtgDUI1xGLnO5L5m8w4VrvqWQdC3r6aClM2s3qCT/
         fgZhEHIBbnHzhggNmwYxome5THbdmuV2dY6GYI+zKEgn+id07kJM/T30vRdNlfPGXC78
         mtxHyN+i1oOaf9WA9r5muCq1lUzS6CSo+XZ4QsnaeICsgFk7q8Ce3yy0W0EILS+9mXfj
         rTug==
X-Gm-Message-State: AOJu0YxG5x7vdOJ0IAhT0Yd2M2efX3EI4crqyPYGUbxFMUNrk1W13xWQ
	eEYMtP2RjFuOvxaFePnU8cX2gtzy8MtLXrftwRqeQJYWuFrD4xqtXQd4eB4nzBZBeu7jqCM/uh9
	oWbhSU021AV3JOcub3OZLgffukOPusCY=
X-Gm-Gg: Acq92OHDt93cJETYxyR5Ioqv3sEWT5pMvH1EJB644ek3MrPcN3RAA6FYupgWYFXzK6y
	s/HuDSZR072KkxdcPA8rlRX7XimxCAlB9TF0aPj5Qdkh6NVYHTkQOg8DNt9mcDlF38PaOPHhulj
	wdZkP7VujzeVUDXJak6bneG+nZ/eh9vWBIDsOaY5LIjKFytx63ad2ylOl1I4aEX/HKpqtbEwXf8
	M6hgl8MhdPLBHBVYcgfpK0QFNJxyZDW/D/I7U4aH84YRqqZBfcQT0TjkADAfpoRL+SNd0vXmziX
	IQmk
X-Received: by 2002:a2e:b6d3:0:b0:38e:8902:7a7f with SMTP id
 38308e7fff4ca-395d8c8b744mr34451731fa.13.1779738060804; Mon, 25 May 2026
 12:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1779430299.git.mykola_kvach@epam.com> <f9a0308092deb2135d32ad9fc2c5ccafc8a7320e.1779430299.git.mykola_kvach@epam.com>
 <eaf40a4c-ce82-4a34-91f1-9cdd0bbff7fb@amd.com>
In-Reply-To: <eaf40a4c-ce82-4a34-91f1-9cdd0bbff7fb@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 25 May 2026 22:40:49 +0300
X-Gm-Features: AVHnY4IpZECPXVca0UxkIBpYLixfHn2roSQ0hIoNclny7N5u0nyev8Z1K6BOY2s
Message-ID: <CAGeoDV8Hy9+GpoZ8-JmW=qCrg0We18t47T-PJksJ9D9sbr+ANA@mail.gmail.com>
Subject: Re: [PATCH 1/2] xen/arm: propagate vGIC vCPU init failures
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d25034/1779738061-E1161CF5-6F67D538/0/0
X-purgate-type: clean
X-purgate-size: 6639
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,epam.com:email,amd.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: EEC2C5CE0F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

Thank you for the feedback.

On Mon, May 25, 2026 at 12:46=E2=80=AFPM Orzel, Michal <michal.orzel@amd.co=
m> wrote:
>
>
>
> On 22-May-26 08:18, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > The vGIC per-vCPU init callback can fail. In particular, GICv3 rejects
> > a vCPU when the domain's redistributor layout has no MMIO slot covering
> > that vCPU. However, the generic vGIC init path ignored the callback
> > return value, so vcpu_create() could succeed with an invalid vGICv3
> > per-vCPU state.
> >
> > This can be reproduced on FVP Base RevC by exposing a 2 MiB GICv3
> > redistributor region to Dom0 and booting Xen with:
> >
> >     maxcpus=3D1 dom0_max_vcpus=3D64
> >
> > The host GICv3 redistributor range is:
> >
> >     region 0: 0x0000002f100000 - 0x0000002f300000
> >
> > With Xen's guest redistributor frame size of 128 KiB, that range covers
> > 16 guest redistributors. vCPU16 and above have no corresponding
> > redistributor slot.
> >
> > Before this fix, Xen detected the missing redistributors:
> >
> >     d0: Unable to find a re-distributor for VCPU 16
> >     ...
> >     d0: Unable to find a re-distributor for VCPU 63
> >
> > but ignored the error and continued as if the secondary vCPUs had been
> > created correctly. Dom0 then saw 64 possible CPUs and could hang during
> > secondary CPU bring-up:
> >
> >     smp: Bringing up secondary CPUs ...
> >     d0v15: vGICR: SGI: unhandled word write ... to ICACTIVER0
> >
> > Propagate the vGIC vcpu_init() error so the caller can stop creating
> > secondary vCPUs. With this fix, Dom0 construction reports:
> >
> >     d0: Unable to find a re-distributor for VCPU 16
> >     Failed to allocate d0v16
> >
> > and the guest continues booting with the vCPUs created before the
> > failure:
> >
> >     smp: Brought up 1 node, 16 CPUs
> >
> > Free the private IRQ rank allocated by vcpu_vgic_init() on this error
> > path. The caller will still run the generic vCPU creation cleanup, but
> > XFREE() clears the pointer so that cleanup remains idempotent.
> >
> > Also fix the host-layout redistributor region count for the case where
> > the requested vCPU count is larger than the capacity of all host
> > redistributor regions. The old code always stored i + 1 after the loop.
> > That is correct when the loop stops inside a valid region because the
> > requested vCPU count is covered. If the loop exits after consuming all
> > hardware regions, i is already equal to the number of allocated regions=
,
> > so i + 1 records one region too many.
> >
> > In the same FVP setup, that off-by-one made Xen describe host-layout
> > GICR state beyond the populated redistributor region list. Dom0 then
> > accessed the GICR MMIO window described in its device tree, but Xen cou=
ld
> > not match the access to a valid emulated redistributor frame. During
> > debugging this was seen as an unexpected vGICR access followed by a
> > guest panic:
> >
> >     d0v0: vGICR: unknown gpa read address 000000002f10ffe8
> >     pc : gic_iterate_rdists+0x4c/0x104
> >     Kernel panic - not syncing: Attempted to kill the idle task!
> >
> > Keep the existing best-effort Dom0 policy: a failure to create a
> > secondary vCPU stops the secondary vCPU creation loop, but does not fai=
l
> > the whole Dom0 boot.
> This is the construct_domain() policy that is used for both dom0 and dom0=
less
> domUs. I must say I don't really like this policy and it's against our *g=
eneric*
> Arm policy to fail the domain creation on any error especially if this be=
longs
> to unsatisfied user requests. This is not really related to your series, =
but I
> would like to ask other Arm maintainers about their opinion.

Yes, I agree this is a broader construct_domain() policy question. I kept
the existing behaviour in this patch, but I am fine with adjusting it if
the maintainers decide that domain creation should fail in this case.

In any case, I will reword the commit message so it does not describe
this as a Dom0-only policy, since the same construct_domain() path is
also used for dom0less domains.

>
> >
> > Fixes: ea37fd21110b ("xen/arm: split vgic driver into generic and vgic-=
v2 driver")
> > Fixes: 54ec59f6b0b3 ("xen/arm: vgic-v3: Don't create empty re-distribut=
or regions")
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> >  xen/arch/arm/vgic-v3.c |  3 ++-
> >  xen/arch/arm/vgic.c    | 10 +++++++---
> >  2 files changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> > index 77517c3030..360778eb32 100644
> > --- a/xen/arch/arm/vgic-v3.c
> > +++ b/xen/arch/arm/vgic-v3.c
> > @@ -1834,7 +1834,8 @@ static int vgic_v3_domain_init(struct domain *d)
> >           * not match the number of pCPUs). Update the number of region=
s to
> >           * avoid exposing unused region as they will not get emulated.
> >           */
> > -        d->arch.vgic.nr_regions =3D i + 1;
> > +        d->arch.vgic.nr_regions =3D (i =3D=3D vgic_v3_hw.nr_rdist_regi=
ons) ?
> > +                                   i : i + 1;
> Wouldn't min(i+1,vgic_v3_hw.nr_rdist_regions) be cleaner?

Ack, I will change this in v2.

>
> >
> >          d->arch.vgic.intid_bits =3D vgic_v3_hw.intid_bits;
> >      }
> > diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> > index 6647071ad4..e55e484493 100644
> > --- a/xen/arch/arm/vgic.c
> > +++ b/xen/arch/arm/vgic.c
> > @@ -368,7 +368,7 @@ void domain_vgic_free(struct domain *d)
> >
> >  int vcpu_vgic_init(struct vcpu *v)
> >  {
> > -    int i;
> > +    int i, ret;
> >
> >      v->arch.vgic.private_irqs =3D xzalloc(struct vgic_irq_rank);
> >      if ( v->arch.vgic.private_irqs =3D=3D NULL )
> > @@ -377,7 +377,12 @@ int vcpu_vgic_init(struct vcpu *v)
> >      /* SGIs/PPIs are always routed to this VCPU */
> >      vgic_rank_init(v->arch.vgic.private_irqs, 0, v->vcpu_id);
> >
> > -    v->domain->arch.vgic.handler->vcpu_init(v);
> > +    ret =3D v->domain->arch.vgic.handler->vcpu_init(v);
> > +    if ( ret )
> > +    {
> > +        XFREE(v->arch.vgic.private_irqs);
> > +        return ret;
> > +    }
> >
> >      memset(&v->arch.vgic.pending_irqs, 0, sizeof(v->arch.vgic.pending_=
irqs));
> >      for (i =3D 0; i < 32; i++)
> > @@ -944,4 +949,3 @@ void vgic_check_inflight_irqs_pending(struct vcpu *=
v, unsigned int rank, uint32_
> >   * indent-tabs-mode: nil
> >   * End:
> >   */
> > -
> Stray change, please drop.

Ack.

Best regards,
Mykola

