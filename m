Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91575192EDE
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 18:03:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH9Ob-00069K-EY; Wed, 25 Mar 2020 17:00:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OrPJ=5K=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jH9OZ-00069D-HO
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 17:00:47 +0000
X-Inumbo-ID: 2ba5cc34-6eba-11ea-bec1-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ba5cc34-6eba-11ea-bec1-bc764e2007e4;
 Wed, 25 Mar 2020 17:00:46 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id u59so3306070edc.12
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2020 10:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2NkAdeGyKju1lGc7nvVGLBASQEDGOllt9WWCJ/ibjzs=;
 b=zQXyJ75C5mYuec7Ylc/+JluV9xJKfd8gwJG7itwVRsrOv0zcglN2DqDrhbyieyN5DC
 g1yq1dPmkgm8xqIXdyiFUtqdSW+47YLbp0G3oRv4GBnOjbLfRptfWP8gJZBkOj623+7Z
 t1XThCirKqxo035tbcLZPCbfPeOlKN8oh1udcepw7ucUimowbILnAn3o64kuPNJnQde+
 CK0BXhZxPdj2n3oXFjhcxHNjouSYCcEA+HISWqLBNL+27fymqq69rbsJNYfzh9J9dAXD
 spfwqBib3UKGRMHObsHaRZVTrGzHRRo5bQeikpjd7Uxegf2QcS9xFRGE39q9UHLZdc2w
 adZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2NkAdeGyKju1lGc7nvVGLBASQEDGOllt9WWCJ/ibjzs=;
 b=V44QusyQaHfhVYt9Vtf7fG/YtmKTaEChaLP7gttZ+Y6mvbIClA/VT0aLJX/eydRIIe
 3g1TAiZs0fhkcB0jMUVCYGxuYxl3JEpF1ETpyMKH6n1TdTX/PumbWR2HJSF6wPQ0ZuhF
 82F/HwiKSm7kQRiVmhpu3WpwaobvqgZw8h1Q+7fuNWlDzABBqj6uRuOtNTK0lzFJaZVG
 XDMqcu64uPeIiWRoVAwKfasaQD4RqHtJ4QZgJfOzQasxJV6hW8/WV6ZO1whilLv4xS8+
 MyAvO1n62140fmeP6TUREHQ0GtmltQsC6qQr7gnUfGv3OUyZkwZQTQ1vk8GxqAaFc4mg
 1r7A==
X-Gm-Message-State: ANhLgQ3I7Bp87u1Xq4lXk25MciJPPI0+d8SMStfNHBO09Y2r5a+9RqeC
 11T1M0OSdj2ceWMRHje/ivZzrLw61Ak=
X-Google-Smtp-Source: ADFU+vuc8UmoisNhe7wtrtpoSiz1xqp3fGfsTgumpCczqayJb7Od6w6IwtSW7fhqWFjHRsc5iAWY7Q==
X-Received: by 2002:aa7:cf1a:: with SMTP id a26mr3971528edy.12.1585155645496; 
 Wed, 25 Mar 2020 10:00:45 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42])
 by smtp.gmail.com with ESMTPSA id s4sm844843edw.19.2020.03.25.10.00.41
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2020 10:00:42 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id h9so4072701wrc.8
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2020 10:00:41 -0700 (PDT)
X-Received: by 2002:a5d:640a:: with SMTP id z10mr4683256wru.301.1585155641540; 
 Wed, 25 Mar 2020 10:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584981438.git.tamas.lengyel@intel.com>
 <a8cf8742054d04760f2f5060cfeef5bef1edbd6f.1584981438.git.tamas.lengyel@intel.com>
 <20200325154702.GD28601@Air-de-Roger>
 <CABfawhnQ_LTG8oses9EWatJ63bEZFctp7uARBjN==twV7c4xqw@mail.gmail.com>
 <ce6b0e2b-b135-8ee6-fc0c-fe190685b237@xen.org>
 <CABfawhkieTA-480tKbQKdYrEs0QSaSmreC2xD3cngGExG=nj6Q@mail.gmail.com>
 <95a7c1bf-9b2f-f0e8-1463-3cf8afb74041@xen.org>
In-Reply-To: <95a7c1bf-9b2f-f0e8-1463-3cf8afb74041@xen.org>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 25 Mar 2020 11:00:05 -0600
X-Gmail-Original-Message-ID: <CABfawh=VFH6t3++-zn0PdANcpev=Utop1f5xLDNH44oxUbGpXA@mail.gmail.com>
Message-ID: <CABfawh=VFH6t3++-zn0PdANcpev=Utop1f5xLDNH44oxUbGpXA@mail.gmail.com>
To: Julien Grall <julien@xen.org>
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
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Mar 25, 2020 at 10:52 AM Julien Grall <julien@xen.org> wrote:
>
>
>
> On 25/03/2020 16:47, Tamas K Lengyel wrote:
> > On Wed, Mar 25, 2020 at 10:42 AM Julien Grall <julien@xen.org> wrote:
> >>
> >> Hi,
> >>
> >> On 25/03/2020 16:34, Tamas K Lengyel wrote:
> >>>>> diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
> >>>>> index 9f51370327..1ed7d13084 100644
> >>>>> --- a/xen/arch/x86/mm/p2m.c
> >>>>> +++ b/xen/arch/x86/mm/p2m.c
> >>>>> @@ -509,6 +509,12 @@ mfn_t __get_gfn_type_access(struct p2m_domain =
*p2m, unsigned long gfn_l,
> >>>>>
> >>>>>        mfn =3D p2m->get_entry(p2m, gfn, t, a, q, page_order, NULL);
> >>>>>
> >>>>> +    /* Check if we need to fork the page */
> >>>>> +    if ( (q & P2M_ALLOC) && p2m_is_hole(*t) &&
> >>>>> +         !mem_sharing_fork_page(p2m->domain, gfn, q & P2M_UNSHARE)=
 )
> >>>>> +        mfn =3D p2m->get_entry(p2m, gfn, t, a, q, page_order, NULL=
);
> >>>>> +
> >>>>> +    /* Check if we need to unshare the page */
> >>>>>        if ( (q & P2M_UNSHARE) && p2m_is_shared(*t) )
> >>>>>        {
> >>>>>            ASSERT(p2m_is_hostp2m(p2m));
> >>>>> @@ -588,7 +594,8 @@ struct page_info *p2m_get_page_from_gfn(
> >>>>>                return page;
> >>>>>
> >>>>>            /* Error path: not a suitable GFN at all */
> >>>>> -        if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(=
*t) )
> >>>>> +        if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(=
*t) &&
> >>>>> +             !mem_sharing_is_fork(p2m->domain) )
> >>>>>                return NULL;
> >>>>>        }
> >>>>>
> >>>>> diff --git a/xen/common/domain.c b/xen/common/domain.c
> >>>>> index b4eb476a9c..62aed53a16 100644
> >>>>> --- a/xen/common/domain.c
> >>>>> +++ b/xen/common/domain.c
> >>>>> @@ -1270,6 +1270,9 @@ int map_vcpu_info(struct vcpu *v, unsigned lo=
ng gfn, unsigned offset)
> >>>>>
> >>>>>        v->vcpu_info =3D new_info;
> >>>>>        v->vcpu_info_mfn =3D page_to_mfn(page);
> >>>>> +#ifdef CONFIG_MEM_SHARING
> >>>>> +    v->vcpu_info_offset =3D offset;
> >>>>
> >>>> There's no need to introduce this field, you can just use v->vcpu_in=
fo
> >>>> & ~PAGE_MASK AFAICT.
> >>>
> >>> Just doing what you suggest above results in:
> >>>
> >>> mem_sharing.c:1603:55: error: invalid operands to binary & (have
> >>> =E2=80=98vcpu_info_t * const=E2=80=99 {aka =E2=80=98union <anonymous>=
 * const=E2=80=99} and =E2=80=98long
> >>> int=E2=80=99)
> >>>                                        d_vcpu->vcpu_info & ~PAGE_MASK=
);
> >>>
> >>> I can of course cast the vcpu_info pointer to (long int), it's just a
> >>> bit ugly. Thoughts?
> >>
> >> FWIW, I will also need the offset for liveupdate. I have used (unsigne=
d
> >> long)v->vcpu_info & ~PAGE_MASK so far but this is not really pretty.
> >>
> >> So I am all for either a new field or a macro hiding this uglyness.
> >
> > A macro sounds like a good way to go, no need for an extra field if we
> > can calculate it based on the currently existing one. How about
> >
> > #define VCPU_INFO_OFFSET(v) (((unsigned long)v->vcpu_info) & ~PAGE_MASK=
)
>
> I was more thinking a generic macro to find the offset in a page.
>
> PAGE_OFFSET(ptr) ((unsigned long)(ptr) & ~PAGE_MASK)

LGTM. Should we stuff this into xen/sched.h or asm/page.h?

Tamas

