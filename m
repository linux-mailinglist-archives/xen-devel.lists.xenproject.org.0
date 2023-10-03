Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AB57B7278
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 22:27:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612342.952241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnlyg-0003Jv-Ir; Tue, 03 Oct 2023 20:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612342.952241; Tue, 03 Oct 2023 20:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnlyg-0003Gv-F1; Tue, 03 Oct 2023 20:26:46 +0000
Received: by outflank-mailman (input) for mailman id 612342;
 Tue, 03 Oct 2023 20:26:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=USMC=FR=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1qnlye-0003Gp-8r
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 20:26:44 +0000
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28f2e0a9-622b-11ee-98d2-6d05b1d4d9a1;
 Tue, 03 Oct 2023 22:26:42 +0200 (CEST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177]) by mx.zohomail.com
 with SMTPS id 1696364796038774.0653044161322;
 Tue, 3 Oct 2023 13:26:36 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-d865685f515so197146276.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Oct 2023 13:26:35 -0700 (PDT)
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
X-Inumbo-ID: 28f2e0a9-622b-11ee-98d2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; t=1696364798; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OGItTpy/Z4/F2CpucYNowFuiAoltFlLFP6xBkzZ0l4RP7JcE2owVqgH1O8ij1WWINbna0nWrM4DhrLtqeAHKoq2It4veg9n53NgfJJMFTr+aKFBg089tbnaPZyNgeLrYAvHf8zgjjbXWE9OpR19d3qrQmRCaC3xfJuhRxLSXZ/Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1696364798; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PlJGpjgUFMIPaggujCT0JPVq7amItrPnzF/7gSJVLcg=; 
	b=iOyt9c7v0Wr82E9ZJ3ieH99KSE6o172SyC+RSbm/QYUtlCul9Iplg6qKz8Zd71NYypn38kskACAs5pLsPU5iQNF8ni4PTGm0Z/aDGDnD3qsqAPEr0bHNXQTqAZrnjRBlRYSi3/uu0j0jYeBA3LR9ekZSSRP2EZ0Fkq4euOjRe0U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1696364798;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=PlJGpjgUFMIPaggujCT0JPVq7amItrPnzF/7gSJVLcg=;
	b=RZ0ngUnFxvzZkj9KNw/7nZc8+nZzakMDp0p7W4rbWWNAIp2DKRVMaEgGkZO3JUze
	6goZb4SH2F8rT8PekDp2rXlB7fHfSVXJMStLo+t5eWfqDrsxdwMm/ATptvdE9xtK3L9
	WH4f1pcx7v3uyBdCoP00OxPHZ8SCpBwKdBGj6WWw=
X-Gm-Message-State: AOJu0Yyqm7dQRhJ6VIgXA094/n6tMfxDctb4Z98mCke+7mwoT2JO53au
	QAMAGPo58RXGV8a2Ax5xuyXlWgIWwDvPt/8EfC8=
X-Google-Smtp-Source: AGHT+IE4jnpH7xqV1mIA9Ca4jQTwmjdfzOsGZPm4EH1N/Ubjymuy38aIGxobh30keR4q8f3zE13mAZrWYe8S82cQn0o=
X-Received: by 2002:a25:9906:0:b0:d86:4342:290 with SMTP id
 z6-20020a259906000000b00d8643420290mr217963ybn.21.1696364795076; Tue, 03 Oct
 2023 13:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <20231002151127.71020-1-roger.pau@citrix.com> <20231002151127.71020-7-roger.pau@citrix.com>
 <CABfawhnHg3KrGP-hp4_Q8GvSf2nVSVSyK24HKqAGuWp_AtD8-A@mail.gmail.com>
 <ZRwlXls8xRyc8AX4@MacBookPdeRoger> <8ee8d70b-5b69-4834-b7e3-572e96effa5c@xen.org>
In-Reply-To: <8ee8d70b-5b69-4834-b7e3-572e96effa5c@xen.org>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 3 Oct 2023 16:25:58 -0400
X-Gmail-Original-Message-ID: <CABfawhn0vH6rS8-SJQJVZtto2HA61By1bCG3w9bJMJR3x+rXsg@mail.gmail.com>
Message-ID: <CABfawhn0vH6rS8-SJQJVZtto2HA61By1bCG3w9bJMJR3x+rXsg@mail.gmail.com>
Subject: Re: [PATCH v5 06/10] x86/mem-sharing: copy GADDR based shared guest areas
To: Julien Grall <julien@xen.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org, henry.wang@arm.com, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 3, 2023 at 11:07=E2=80=AFAM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Roger,
>
> On 03/10/2023 15:29, Roger Pau Monn=C3=A9 wrote:
> > On Tue, Oct 03, 2023 at 09:53:11AM -0400, Tamas K Lengyel wrote:
>
> Tamas, somehow your e-mails don't show up in my inbox (even if I am
> CCed) or even on lore.kernel.org/xen-devel. It is not even in my SPAM
> folder.

Thanks, I've switched mailservers, hopefully that resolves the issue.

>
> >> On Mon, Oct 2, 2023 at 11:13=E2=80=AFAM Roger Pau Monne <roger.pau@cit=
rix.com> wrote:
> >>>
> >>> From: Jan Beulich <jbeulich@suse.com>
> >>>
> >>> In preparation of the introduction of new vCPU operations allowing to
> >>> register the respective areas (one of the two is x86-specific) by
> >>> guest-physical address, add the necessary fork handling (with the
> >>> backing function yet to be filled in).
> >>>
> >>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >>> ---
> >>> Changes since v4:
> >>>   - Rely on map_guest_area() to populate the child p2m if necessary.
> >>> ---
> >>>   xen/arch/x86/mm/mem_sharing.c | 31 +++++++++++++++++++++++++++++++
> >>>   xen/common/domain.c           |  7 +++++++
> >>>   2 files changed, 38 insertions(+)
> >>>
> >>> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_shar=
ing.c
> >>> index 5f8f1fb4d871..99cf001fd70f 100644
> >>> --- a/xen/arch/x86/mm/mem_sharing.c
> >>> +++ b/xen/arch/x86/mm/mem_sharing.c
> >>> @@ -1641,6 +1641,24 @@ static void copy_vcpu_nonreg_state(struct vcpu=
 *d_vcpu, struct vcpu *cd_vcpu)
> >>>       hvm_set_nonreg_state(cd_vcpu, &nrs);
> >>>   }
> >>>
> >>> +static int copy_guest_area(struct guest_area *cd_area,
> >>> +                           const struct guest_area *d_area,
> >>> +                           struct vcpu *cd_vcpu,
> >>> +                           const struct domain *d)
> >>> +{
> >>> +    unsigned int offset;
> >>> +
> >>> +    /* Check if no area to map, or already mapped. */
> >>> +    if ( !d_area->pg || cd_area->pg )
> >>> +        return 0;
> >>> +
> >>> +    offset =3D PAGE_OFFSET(d_area->map);
> >>> +    return map_guest_area(cd_vcpu, gfn_to_gaddr(
> >>> +                                       mfn_to_gfn(d, page_to_mfn(d_a=
rea->pg))) +
> >>> +                                   offset,
> >>> +                          PAGE_SIZE - offset, cd_area, NULL);
> >>> +}
> >>> +
> >>>   static int copy_vpmu(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
> >>>   {
> >>>       struct vpmu_struct *d_vpmu =3D vcpu_vpmu(d_vcpu);
> >>> @@ -1709,6 +1727,16 @@ static int copy_vcpu_settings(struct domain *c=
d, const struct domain *d)
> >>>                   return ret;
> >>>           }
> >>>
> >>> +        /* Same for the (physically registered) runstate and time in=
fo areas. */
> >>> +        ret =3D copy_guest_area(&cd_vcpu->runstate_guest_area,
> >>> +                              &d_vcpu->runstate_guest_area, cd_vcpu,=
 d);
> >>> +        if ( ret )
> >>> +            return ret;
> >>> +        ret =3D copy_guest_area(&cd_vcpu->arch.time_guest_area,
> >>> +                              &d_vcpu->arch.time_guest_area, cd_vcpu=
, d);
> >>> +        if ( ret )
> >>> +            return ret;
> >>> +
> >>>           ret =3D copy_vpmu(d_vcpu, cd_vcpu);
> >>>           if ( ret )
> >>>               return ret;
> >>> @@ -1950,7 +1978,10 @@ int mem_sharing_fork_reset(struct domain *d, b=
ool reset_state,
> >>>
> >>>    state:
> >>>       if ( reset_state )
> >>> +    {
> >>>           rc =3D copy_settings(d, pd);
> >>> +        /* TBD: What to do here with -ERESTART? */
> >>
> >> There is no situation where we get an -ERESTART here currently. Is
> >> map_guest_area expected to run into situations where it fails with
> >> that rc?
> >
> > Yes, there's a spin_trylock() call that will result in
> > map_guest_area() returning -ERESTART.
> >
> >> If yes we might need a lock in place so we can block until it
> >> can succeed.
> >
> > I'm not sure whether returning -ERESTART can actually happen in
> > map_guest_area() for the fork case: the child domain is still paused
> > at this point, so there can't be concurrent guest hypercalls that
> > would also cause the domain hypercall_deadlock_mutex to be acquired.

Perhaps turning it into an ASSERT(rc !=3D -ERESTART) is the way to go at
this point. If we run into any cases where it trips we can reason it
out.

> hypercall_deadlock_mutex is also acquired by domctls. So, I believe,
> -ERESTART could be returned if the toolstack is also issuing domclt
> right at the same time as forking.

That's not a concern in this path, only toolstack can start the reset
so we can assume it can coordinate not to have another toolstack
messing with the fork at the same time.

Thanks,
Tamas

