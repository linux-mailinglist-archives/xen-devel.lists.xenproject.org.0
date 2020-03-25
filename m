Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F71D192FDC
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 18:51:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHA8A-0001FL-Fr; Wed, 25 Mar 2020 17:47:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OrPJ=5K=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jHA89-0001FG-4s
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 17:47:53 +0000
X-Inumbo-ID: bfdef046-6ec0-11ea-bec1-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bfdef046-6ec0-11ea-bec1-bc764e2007e4;
 Wed, 25 Mar 2020 17:47:52 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id i16so2660027edy.11
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2020 10:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Jlq3aSn1LLbtOLq22RUHlgaTqBIHopNWtX0qsj2oJIA=;
 b=pwMH/ryi8VM3ctGyqDLVHwNNgntGmhrSBRJZkm6LNEqbq/7gDHU8uRDBqAKcwX2Y5C
 0qW/KgwLTvWDXi2DASaZ84LfB5AJygHBW+0DsNd7na+qKNNeC4Oi90XR6nKy4AK0XQiL
 j2FY3H8zyczOVO0fdJzhp3gYqP9LSr0kOxoPFArc09x59G1Ui1r6EC0pq7+UrOfG4h+9
 AQD8tP1AbYs0/bXaB3vM+NOwG8OivlyZ6j0YLayA2xjzGyN6X4x3H79ZnDn+8NQ0vDw+
 sGVv4HDGZkZ7lJdgzfYc+akhlu3/eYc8pDgk41tNAv80qtoL/a7DUEIOhO/B9C1xgbXh
 Sy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Jlq3aSn1LLbtOLq22RUHlgaTqBIHopNWtX0qsj2oJIA=;
 b=nLn/qShipHZv+1Vaf8GOFulDwD+aRlENMavETnkf/32vFsYJ1K+rzI16KCvrmaYcPf
 PkpzJh2p9gP+Y/+vuNDW44S6KWiSzVHCcFXr5mYszndU3MtRyjwDeKHGiCp0Tj30mEKJ
 iahAme+awj9maXCbp977SzlBvRsbH2CKxEkGapSmtp++5b5QHt3RaV9MOADqD/M4JROC
 uwD/2ewoBfoOOl6tzzoZpMugRYo2P6ySkdg0hNvHDOBcIRLoO4Z138S1uhcCgOuDFxXO
 MkNpv0qhCkaqq2dqBs/5mC7oR/zyGyjMwwXpcJzEAKWn8gqdrTkpEf9vyolrvB+fRDa1
 q07g==
X-Gm-Message-State: ANhLgQ2NCXHBvpdggEvEEeB0VoBqmp+lpqutC6+Y6lqG2UFT4XAI682u
 xUwHtNVHIFs5iinMc73yxtjMCIYxg3o=
X-Google-Smtp-Source: ADFU+vsewS/Ab3L3A+x1Xg1rh6V00vYijah275SvYhF0yenLw1WUkbMkJKIw5L3zCZF3uGct9Iwt6g==
X-Received: by 2002:a17:906:ccdd:: with SMTP id
 ot29mr1471924ejb.144.1585158471191; 
 Wed, 25 Mar 2020 10:47:51 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47])
 by smtp.gmail.com with ESMTPSA id t24sm1637945edy.94.2020.03.25.10.47.48
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2020 10:47:49 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id 65so4340808wrl.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2020 10:47:48 -0700 (PDT)
X-Received: by 2002:a5d:640a:: with SMTP id z10mr4893863wru.301.1585158468376; 
 Wed, 25 Mar 2020 10:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584981438.git.tamas.lengyel@intel.com>
 <a8cf8742054d04760f2f5060cfeef5bef1edbd6f.1584981438.git.tamas.lengyel@intel.com>
 <20200325154702.GD28601@Air-de-Roger>
 <CABfawhnQ_LTG8oses9EWatJ63bEZFctp7uARBjN==twV7c4xqw@mail.gmail.com>
 <ce6b0e2b-b135-8ee6-fc0c-fe190685b237@xen.org>
 <CABfawhkieTA-480tKbQKdYrEs0QSaSmreC2xD3cngGExG=nj6Q@mail.gmail.com>
 <95a7c1bf-9b2f-f0e8-1463-3cf8afb74041@xen.org>
 <CABfawh=VFH6t3++-zn0PdANcpev=Utop1f5xLDNH44oxUbGpXA@mail.gmail.com>
 <20200325171627.GG28601@Air-de-Roger>
In-Reply-To: <20200325171627.GG28601@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 25 Mar 2020 11:47:11 -0600
X-Gmail-Original-Message-ID: <CABfawhkw_Pa6DFxGhJzpbueLt3DSE20AviYu=ScHC1vnztNXWQ@mail.gmail.com>
Message-ID: <CABfawhkw_Pa6DFxGhJzpbueLt3DSE20AviYu=ScHC1vnztNXWQ@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v12 1/3] xen/mem_sharing: VM forking
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Mar 25, 2020 at 11:16 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com=
> wrote:
>
> On Wed, Mar 25, 2020 at 11:00:05AM -0600, Tamas K Lengyel wrote:
> > On Wed, Mar 25, 2020 at 10:52 AM Julien Grall <julien@xen.org> wrote:
> > >
> > >
> > >
> > > On 25/03/2020 16:47, Tamas K Lengyel wrote:
> > > > On Wed, Mar 25, 2020 at 10:42 AM Julien Grall <julien@xen.org> wrot=
e:
> > > >>
> > > >> Hi,
> > > >>
> > > >> On 25/03/2020 16:34, Tamas K Lengyel wrote:
> > > >>>>> diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
> > > >>>>> index 9f51370327..1ed7d13084 100644
> > > >>>>> --- a/xen/arch/x86/mm/p2m.c
> > > >>>>> +++ b/xen/arch/x86/mm/p2m.c
> > > >>>>> @@ -509,6 +509,12 @@ mfn_t __get_gfn_type_access(struct p2m_dom=
ain *p2m, unsigned long gfn_l,
> > > >>>>>
> > > >>>>>        mfn =3D p2m->get_entry(p2m, gfn, t, a, q, page_order, NU=
LL);
> > > >>>>>
> > > >>>>> +    /* Check if we need to fork the page */
> > > >>>>> +    if ( (q & P2M_ALLOC) && p2m_is_hole(*t) &&
> > > >>>>> +         !mem_sharing_fork_page(p2m->domain, gfn, q & P2M_UNSH=
ARE) )
> > > >>>>> +        mfn =3D p2m->get_entry(p2m, gfn, t, a, q, page_order, =
NULL);
> > > >>>>> +
> > > >>>>> +    /* Check if we need to unshare the page */
> > > >>>>>        if ( (q & P2M_UNSHARE) && p2m_is_shared(*t) )
> > > >>>>>        {
> > > >>>>>            ASSERT(p2m_is_hostp2m(p2m));
> > > >>>>> @@ -588,7 +594,8 @@ struct page_info *p2m_get_page_from_gfn(
> > > >>>>>                return page;
> > > >>>>>
> > > >>>>>            /* Error path: not a suitable GFN at all */
> > > >>>>> -        if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_=
pod(*t) )
> > > >>>>> +        if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_=
pod(*t) &&
> > > >>>>> +             !mem_sharing_is_fork(p2m->domain) )
> > > >>>>>                return NULL;
> > > >>>>>        }
> > > >>>>>
> > > >>>>> diff --git a/xen/common/domain.c b/xen/common/domain.c
> > > >>>>> index b4eb476a9c..62aed53a16 100644
> > > >>>>> --- a/xen/common/domain.c
> > > >>>>> +++ b/xen/common/domain.c
> > > >>>>> @@ -1270,6 +1270,9 @@ int map_vcpu_info(struct vcpu *v, unsigne=
d long gfn, unsigned offset)
> > > >>>>>
> > > >>>>>        v->vcpu_info =3D new_info;
> > > >>>>>        v->vcpu_info_mfn =3D page_to_mfn(page);
> > > >>>>> +#ifdef CONFIG_MEM_SHARING
> > > >>>>> +    v->vcpu_info_offset =3D offset;
> > > >>>>
> > > >>>> There's no need to introduce this field, you can just use v->vcp=
u_info
> > > >>>> & ~PAGE_MASK AFAICT.
> > > >>>
> > > >>> Just doing what you suggest above results in:
> > > >>>
> > > >>> mem_sharing.c:1603:55: error: invalid operands to binary & (have
> > > >>> =E2=80=98vcpu_info_t * const=E2=80=99 {aka =E2=80=98union <anonym=
ous> * const=E2=80=99} and =E2=80=98long
> > > >>> int=E2=80=99)
> > > >>>                                        d_vcpu->vcpu_info & ~PAGE_=
MASK);
> > > >>>
> > > >>> I can of course cast the vcpu_info pointer to (long int), it's ju=
st a
> > > >>> bit ugly. Thoughts?
> > > >>
> > > >> FWIW, I will also need the offset for liveupdate. I have used (uns=
igned
> > > >> long)v->vcpu_info & ~PAGE_MASK so far but this is not really prett=
y.
> > > >>
> > > >> So I am all for either a new field or a macro hiding this uglyness=
.
> > > >
> > > > A macro sounds like a good way to go, no need for an extra field if=
 we
> > > > can calculate it based on the currently existing one. How about
> > > >
> > > > #define VCPU_INFO_OFFSET(v) (((unsigned long)v->vcpu_info) & ~PAGE_=
MASK)
> > >
> > > I was more thinking a generic macro to find the offset in a page.
> > >
> > > PAGE_OFFSET(ptr) ((unsigned long)(ptr) & ~PAGE_MASK)
> >
> > LGTM. Should we stuff this into xen/sched.h or asm/page.h?
>
> page.h would be better, albeit you will have to duplicate it for x86
> and Arm. There's xen/pfn.h which is not arch specific, but feels a bit
> weird to place it there.
>

I'll go with page.h, that allows us to use vaddr_t for the ARM macro.

Tamas

