Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD74826C75
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 12:20:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663393.1033267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMnfJ-0002bg-LN; Mon, 08 Jan 2024 11:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663393.1033267; Mon, 08 Jan 2024 11:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMnfJ-0002ZH-Ia; Mon, 08 Jan 2024 11:19:33 +0000
Received: by outflank-mailman (input) for mailman id 663393;
 Mon, 08 Jan 2024 11:19:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pvth=IS=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rMnfH-0002ZB-VH
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 11:19:31 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cae7fe9b-ae17-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 12:19:30 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a294295dda3so178963466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 03:19:30 -0800 (PST)
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
X-Inumbo-ID: cae7fe9b-ae17-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704712770; x=1705317570; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGZrQ1BhlmoTRwHX5XTE35g8md+oz/4o7UKvFd0wdwM=;
        b=lBX8Bvw9mO8bjQc7EOGmN572Mb+p8J8GO6LI370gRzlTBeK/dE3ApJ9FzlwOhd4yPo
         1jFifv77LH3GS6kJ+i5khzwlPwKPN36jwBn/f4EZYrMiMSgaC0OTDjH23LKYQpahTk5y
         ywfGYDk/U8N09k0dcu3X1XR/ewBCviHyy0A+Swy89TIS/q4rXmmCkYRBKFB4Fi+sYJ8s
         1yxkWUQMWV+VGcbUJWrIRRzqtEUowJ4MRGug91smroi2vXQypCk7zv7kHTQTRzohd1bs
         U3Eq1mxJDz8wphqz6yZv+OxImhFLDW+Qq3V7S08LDVG9seJ0F79uFmbkSOkz07q2PAlG
         heVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704712770; x=1705317570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGZrQ1BhlmoTRwHX5XTE35g8md+oz/4o7UKvFd0wdwM=;
        b=M15/eAtVTADsBKH0sXXlZpIvdIYohjp6rViRCqYfdJchqwGKdxfIFVjOE4kQJ/YWUv
         4YKPknkJnOTGLF7piqS068rwqwkFPtTDBLRToV5syBrEPEuByKO3NGYhXbxWghyz50kK
         hZHH8Lz2VzNEKgY7UmO8XJQA9eDIIq97oCQPHNDCoYD36h5/x98dS8buoX7fVPUWewP0
         2Z8tcSCQYzm45DbwJZ73AmAcCkCGi7boyr5nBeCO4yV5fViLitV+ww1eA+vPtsKO4heU
         3+9JPIMgOxkW0JAuNntpRW96clVagg483CGtLPTcNekq9EhTYuVlJdiTlH68TzSa9mA1
         ld+A==
X-Gm-Message-State: AOJu0YyDSR3OjNkvZkAIhF3lNBNtTTcm3oZAWA+WneEalxIj/CuoIrTx
	p/L3FjYJCaNsFNRwQZvUGx3ckxYlXisK2wbfiYzcRDaNviSQkg==
X-Google-Smtp-Source: AGHT+IHA/WsCKJizn5OjlDd9buQ/1y45psWKhGGVbquL3tCcSilyM9R2yxnzLQnzRaCEL5bBFsgGQXscJ3tM+t1YaMs=
X-Received: by 2002:a17:906:73c6:b0:a2a:3751:8c51 with SMTP id
 n6-20020a17090673c600b00a2a37518c51mr585090ejl.99.1704712770276; Mon, 08 Jan
 2024 03:19:30 -0800 (PST)
MIME-Version: 1.0
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-5-carlo.nonato@minervasys.tech> <99295edf-6c9c-4d06-ba20-86db67100561@xen.org>
 <CAG+AhRWd9E5sQPY-sxN+WGTSWtvRXGN2FnZC2Vy6LPyynKGLcQ@mail.gmail.com> <4675a541-b9dc-476a-a6ff-0247a4403292@xen.org>
In-Reply-To: <4675a541-b9dc-476a-a6ff-0247a4403292@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 8 Jan 2024 12:19:19 +0100
Message-ID: <CAG+AhRX6Y2U6A1v=27KgUeWip115R1o+csEWcyCCooxE2Tac6w@mail.gmail.com>
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

Hi Julien,

On Mon, Jan 8, 2024 at 12:01=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Carlo,
>
> On 08/01/2024 10:27, Carlo Nonato wrote:
> > On Fri, Jan 5, 2024 at 6:26=E2=80=AFPM Julien Grall <julien@xen.org> wr=
ote:
> >> On 02/01/2024 09:51, Carlo Nonato wrote:
> >>> This commit updates the domctl interface to allow the user to set cac=
he
> >>> coloring configurations from the toolstack.
> >>> It also implements the functionality for arm64.
> >>>
> >>> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> >>>
> >>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> >>> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> >>> ---
> >>> v5:
> >>> - added a new hypercall to set colors
> >>> - uint for the guest handle
> >>> v4:
> >>> - updated XEN_DOMCTL_INTERFACE_VERSION
> >>> ---
> >>>    xen/arch/arm/llc-coloring.c    | 17 +++++++++++++++++
> >>>    xen/common/domctl.c            | 11 +++++++++++
> >>>    xen/include/public/domctl.h    | 10 +++++++++-
> >>>    xen/include/xen/llc-coloring.h |  3 +++
> >>>    4 files changed, 40 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.=
c
> >>> index 5ce58aba70..a08614ec36 100644
> >>> --- a/xen/arch/arm/llc-coloring.c
> >>> +++ b/xen/arch/arm/llc-coloring.c
> >>> @@ -9,6 +9,7 @@
> >>>     *    Carlo Nonato <carlo.nonato@minervasys.tech>
> >>>     */
> >>>    #include <xen/errno.h>
> >>> +#include <xen/guest_access.h>
> >>>    #include <xen/keyhandler.h>
> >>>    #include <xen/llc-coloring.h>
> >>>    #include <xen/param.h>
> >>> @@ -278,6 +279,22 @@ int dom0_set_llc_colors(struct domain *d)
> >>>        return domain_check_colors(d);
> >>>    }
> >>>
> >>> +int domain_set_llc_colors_domctl(struct domain *d,
> >>> +                                 const struct xen_domctl_set_llc_col=
ors *config)
> >>> +{
> >>> +    if ( d->num_llc_colors )
> >>> +        return -EEXIST;
> >>> +
> >>> +    if ( domain_alloc_colors(d, config->num_llc_colors) )
> >>
> >> domain_alloc_colors() doesn't sanity check config->num_llc_colors befo=
re
> >> allocating the array. You want a check the size before so we would not
> >> try to allocate an arbitrary amount of memory.
> >>
> >>> +        return -ENOMEM;
> >>> +
> >>> +    if ( copy_from_guest(d->llc_colors, config->llc_colors,
> >>> +                         config->num_llc_colors) )
> >>> +        return -EFAULT;
> >>> +
> >>> +    return domain_check_colors(d);
> >>> +}
> >>> +
> >>>    /*
> >>>     * Local variables:
> >>>     * mode: C
> >>> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> >>> index f5a71ee5f7..b6867d0602 100644
> >>> --- a/xen/common/domctl.c
> >>> +++ b/xen/common/domctl.c
> >>> @@ -8,6 +8,7 @@
> >>>
> >>>    #include <xen/types.h>
> >>>    #include <xen/lib.h>
> >>> +#include <xen/llc-coloring.h>
> >>>    #include <xen/err.h>
> >>>    #include <xen/mm.h>
> >>>    #include <xen/sched.h>
> >>> @@ -858,6 +859,16 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl=
_t) u_domctl)
> >>>                    __HYPERVISOR_domctl, "h", u_domctl);
> >>>            break;
> >>>
> >>> +    case XEN_DOMCTL_set_llc_colors:
> >>> +        if ( !llc_coloring_enabled )
> >>> +            break;
> >>> +
> >>> +        ret =3D domain_set_llc_colors_domctl(d, &op->u.set_llc_color=
s);
> >>> +        if ( ret =3D=3D -EEXIST )
> >>> +            printk(XENLOG_ERR
> >>> +                   "Can't set LLC colors on an already created domai=
n\n");
> >>
> >> To me, the message doesn't match the check in
> >> domain_set_llc_colors_domctl(). But I think you want to check that no
> >> memory was yet allocated to the domain. Otherwise, you coloring will b=
e
> >> wrong.
> >>
> >> Also, it is a bit unclear why you print a message for -EEXIST but not
> >> the others. In this instance, I would consider to print nothing at all=
.
> >
> > The problem here is that we don't support recoloring. When a domain is
> > created it receives a coloring configuration and it can't change. If th=
is
> > hypercall is called twice I have to stop the second time somehow.
> Looking at your check what you prevent is a toolstack updating the array
> twice. But that would be ok (/!\ I am not saying we should allow it) so
> long no memory has been allocated to the domain.
>
> But I also consider we would re-color once we started to allocate memory
> for the domain (either RAM or P2M). This seems to be missed out in your
> check.

So you want to be able to change colors if no memory has yet been allocated=
?
I don't know what to check that.

> Cheers,
>
> --
> Julien Grall

