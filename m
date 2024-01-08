Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E15448272D1
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 16:19:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663591.1033589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMrOZ-0004ay-Cx; Mon, 08 Jan 2024 15:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663591.1033589; Mon, 08 Jan 2024 15:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMrOZ-0004Xd-A6; Mon, 08 Jan 2024 15:18:31 +0000
Received: by outflank-mailman (input) for mailman id 663591;
 Mon, 08 Jan 2024 15:18:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pvth=IS=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rMrOX-0004XX-F1
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 15:18:29 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c6f1738-ae39-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 16:18:27 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a28da6285c1so340443766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 07:18:27 -0800 (PST)
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
X-Inumbo-ID: 2c6f1738-ae39-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704727107; x=1705331907; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhhPS+BI7rj18Qb+hHOqwWuPxvvOPZRfWUmrvJcJcQw=;
        b=gi5MAb0AVkl9iqsLXVdEPS2WwlcszOYwVULnENpEmb6zRlnY3NXWQQ3eS/mF8Ihg2b
         VmpSTUbF6r4fq6ucG8Nfc11XzyKQdZJEeJ6MdOOELKmlXcTaOCl2WSITGFxjEK6gQGcv
         QOQXn5rnBVC8J6yM1K/VM81KZC6AsSLE5t8TKB3JFhsubgBM1OW97/TT9XDxx2QMtzpJ
         QjvqBQLCNTgoTpUvu0Cky2sR4u1SCTIhi4mJE8p65qo9TfHCq26SXehID0I7iMEsYVEJ
         xx5GT6jKgXqYV7jJ9V9wWzR1ubjkhOBgvNOkrrgiFmQjbhXtDvqU1OxKnHRcgaVk1Hmr
         CrDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704727107; x=1705331907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhhPS+BI7rj18Qb+hHOqwWuPxvvOPZRfWUmrvJcJcQw=;
        b=iFHiBU/tnstBAkoiohcms6XXiGxfvdCdZ82TsGPhu6QseCoXUS0hpe4hVPcOrHQLOj
         g7zQ/udBNSttKk3JzA2sdSkVEEB8LbS1at/oA+orarJlDB/cvixUxutZniQlE53NC9sF
         IU0V1DzizqpjIW36+72EXgLTgXF6zeOJ0J+LE7R60e+rhttV3ymVz2NZbkPx5iZYm0OZ
         WF4/6GiuzR1faZ0p7elC762eF4tk+hz4mRbmUypRKrW2gdHQPXnrh8S593spui0ohPuX
         rWAjRVf3HL0bcXmSEoQWQ/1tnzldjU5VJNDRaoNxAKYDxEPOFzGkeLmd/CpXkNjtlLjy
         pQlg==
X-Gm-Message-State: AOJu0YyfQ6z6fdcFpk5QFiSfn+2vUkJvZR8KsZEGOBy2NKeekOxjJQsr
	VOt4Q8YhO55PSD7ZTYNH0Iyt1EZtCPfoIamxheYT7JZRUnMzww==
X-Google-Smtp-Source: AGHT+IE4s4APAmTLidt/WzmxSdcbgtBLrTssQDraiLy+Ka2UJO+9QC69i8aKmLD5AYS+wFCXlt8j+mAvL2mRhEnFJUU=
X-Received: by 2002:a17:906:c2d6:b0:a2a:a3dc:621b with SMTP id
 ch22-20020a170906c2d600b00a2aa3dc621bmr1612883ejb.4.1704727107184; Mon, 08
 Jan 2024 07:18:27 -0800 (PST)
MIME-Version: 1.0
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-5-carlo.nonato@minervasys.tech> <99295edf-6c9c-4d06-ba20-86db67100561@xen.org>
 <CAG+AhRWd9E5sQPY-sxN+WGTSWtvRXGN2FnZC2Vy6LPyynKGLcQ@mail.gmail.com>
 <4675a541-b9dc-476a-a6ff-0247a4403292@xen.org> <CAG+AhRX6Y2U6A1v=27KgUeWip115R1o+csEWcyCCooxE2Tac6w@mail.gmail.com>
 <33061994-0b49-4e4e-8698-d6901b9130dc@xen.org>
In-Reply-To: <33061994-0b49-4e4e-8698-d6901b9130dc@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 8 Jan 2024 16:18:16 +0100
Message-ID: <CAG+AhRXPt_e4+OUxbRLhf6W0reH1nmO7cC9-XoFKe_G8BVxt7w@mail.gmail.com>
Subject: Re: [PATCH v5 04/13] xen: extend domctl interface for cache coloring
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien

On Mon, Jan 8, 2024 at 12:36=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Carlo,
>
> On 08/01/2024 11:19, Carlo Nonato wrote:
> > Hi Julien,
> >
> > On Mon, Jan 8, 2024 at 12:01=E2=80=AFPM Julien Grall <julien@xen.org> w=
rote:
> >>
> >> Hi Carlo,
> >>
> >> On 08/01/2024 10:27, Carlo Nonato wrote:
> >>> On Fri, Jan 5, 2024 at 6:26=E2=80=AFPM Julien Grall <julien@xen.org> =
wrote:
> >>>> On 02/01/2024 09:51, Carlo Nonato wrote:
> >>>>> This commit updates the domctl interface to allow the user to set c=
ache
> >>>>> coloring configurations from the toolstack.
> >>>>> It also implements the functionality for arm64.
> >>>>>
> >>>>> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> >>>>>
> >>>>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> >>>>> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> >>>>> ---
> >>>>> v5:
> >>>>> - added a new hypercall to set colors
> >>>>> - uint for the guest handle
> >>>>> v4:
> >>>>> - updated XEN_DOMCTL_INTERFACE_VERSION
> >>>>> ---
> >>>>>     xen/arch/arm/llc-coloring.c    | 17 +++++++++++++++++
> >>>>>     xen/common/domctl.c            | 11 +++++++++++
> >>>>>     xen/include/public/domctl.h    | 10 +++++++++-
> >>>>>     xen/include/xen/llc-coloring.h |  3 +++
> >>>>>     4 files changed, 40 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-colorin=
g.c
> >>>>> index 5ce58aba70..a08614ec36 100644
> >>>>> --- a/xen/arch/arm/llc-coloring.c
> >>>>> +++ b/xen/arch/arm/llc-coloring.c
> >>>>> @@ -9,6 +9,7 @@
> >>>>>      *    Carlo Nonato <carlo.nonato@minervasys.tech>
> >>>>>      */
> >>>>>     #include <xen/errno.h>
> >>>>> +#include <xen/guest_access.h>
> >>>>>     #include <xen/keyhandler.h>
> >>>>>     #include <xen/llc-coloring.h>
> >>>>>     #include <xen/param.h>
> >>>>> @@ -278,6 +279,22 @@ int dom0_set_llc_colors(struct domain *d)
> >>>>>         return domain_check_colors(d);
> >>>>>     }
> >>>>>
> >>>>> +int domain_set_llc_colors_domctl(struct domain *d,
> >>>>> +                                 const struct xen_domctl_set_llc_c=
olors *config)
> >>>>> +{
> >>>>> +    if ( d->num_llc_colors )
> >>>>> +        return -EEXIST;
> >>>>> +
> >>>>> +    if ( domain_alloc_colors(d, config->num_llc_colors) )
> >>>>
> >>>> domain_alloc_colors() doesn't sanity check config->num_llc_colors be=
fore
> >>>> allocating the array. You want a check the size before so we would n=
ot
> >>>> try to allocate an arbitrary amount of memory.
> >>>>
> >>>>> +        return -ENOMEM;
> >>>>> +
> >>>>> +    if ( copy_from_guest(d->llc_colors, config->llc_colors,
> >>>>> +                         config->num_llc_colors) )
> >>>>> +        return -EFAULT;
> >>>>> +
> >>>>> +    return domain_check_colors(d);
> >>>>> +}
> >>>>> +
> >>>>>     /*
> >>>>>      * Local variables:
> >>>>>      * mode: C
> >>>>> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> >>>>> index f5a71ee5f7..b6867d0602 100644
> >>>>> --- a/xen/common/domctl.c
> >>>>> +++ b/xen/common/domctl.c
> >>>>> @@ -8,6 +8,7 @@
> >>>>>
> >>>>>     #include <xen/types.h>
> >>>>>     #include <xen/lib.h>
> >>>>> +#include <xen/llc-coloring.h>
> >>>>>     #include <xen/err.h>
> >>>>>     #include <xen/mm.h>
> >>>>>     #include <xen/sched.h>
> >>>>> @@ -858,6 +859,16 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domc=
tl_t) u_domctl)
> >>>>>                     __HYPERVISOR_domctl, "h", u_domctl);
> >>>>>             break;
> >>>>>
> >>>>> +    case XEN_DOMCTL_set_llc_colors:
> >>>>> +        if ( !llc_coloring_enabled )
> >>>>> +            break;
> >>>>> +
> >>>>> +        ret =3D domain_set_llc_colors_domctl(d, &op->u.set_llc_col=
ors);
> >>>>> +        if ( ret =3D=3D -EEXIST )
> >>>>> +            printk(XENLOG_ERR
> >>>>> +                   "Can't set LLC colors on an already created dom=
ain\n");
> >>>>
> >>>> To me, the message doesn't match the check in
> >>>> domain_set_llc_colors_domctl(). But I think you want to check that n=
o
> >>>> memory was yet allocated to the domain. Otherwise, you coloring will=
 be
> >>>> wrong.
> >>>>
> >>>> Also, it is a bit unclear why you print a message for -EEXIST but no=
t
> >>>> the others. In this instance, I would consider to print nothing at a=
ll.
> >>>
> >>> The problem here is that we don't support recoloring. When a domain i=
s
> >>> created it receives a coloring configuration and it can't change. If =
this
> >>> hypercall is called twice I have to stop the second time somehow.
> >> Looking at your check what you prevent is a toolstack updating the arr=
ay
> >> twice. But that would be ok (/!\ I am not saying we should allow it) s=
o
> >> long no memory has been allocated to the domain.
> >>
> >> But I also consider we would re-color once we started to allocate memo=
ry
> >> for the domain (either RAM or P2M). This seems to be missed out in you=
r
> >> check.
> >
> > So you want to be able to change colors if no memory has yet been alloc=
ated?
>
> No. I am saying that that we should not be able to allow changing the
> colors after the memory has been allocated. To give an example, your
> current code would allow:
>
>    1) Setup the P2M pools or allocate RAM
>    2) Set the color
>
> This would render the coloring configuration moot.
>
> Whether we want to allow changing the coloring before hand is a
> different question and as I wrote earlier on, I don't mind if you want
> to forbid that.

At the moment I'm relying on the toolstack in the sense that I know that it
will set colors right after domain creation and before memory allocation.
Calling alloc_domheap_pages() without a coloring configuration makes Xen
crash, so it's mandatory to have the configuration done before any allocati=
on.
I know that we shouldn't rely on the toolstack this much, but I didn't
find a better way. Given this assumption, looking for an already existing
color configuration of a domain is sufficient to avoid what you are saying.

Is it possible to enforce such a constraint with domctl?
I mean to be sure that this domctl will be called at a precise time.

Thanks.

> > I don't know what to check that.
>
> You can check the size of the P2M pool (d->arch.paging.p2m_total_pages)
> is still 0. I think for RAM, you can check d->tot_pages =3D=3D 0.
>
> Cheers,
>
> --
> Julien Grall

