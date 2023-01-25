Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A82A67B6B6
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 17:19:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484458.751040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKiTg-0001e2-FE; Wed, 25 Jan 2023 16:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484458.751040; Wed, 25 Jan 2023 16:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKiTg-0001ay-CV; Wed, 25 Jan 2023 16:18:24 +0000
Received: by outflank-mailman (input) for mailman id 484458;
 Wed, 25 Jan 2023 16:18:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lDzi=5W=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1pKiTe-0001as-Qp
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 16:18:23 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e13eabab-9ccb-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 17:18:19 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id hw16so48963377ejc.10
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jan 2023 08:18:19 -0800 (PST)
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
X-Inumbo-ID: e13eabab-9ccb-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bqRwAxYb38Rra289y0CJ69vKEaXm7dY70FgkG0q6CeA=;
        b=clWIstxGC/XBTSYAkXI3NB6fdw6wEV6W3ztYzSSBFBZRdZhvOS1y1VyurXa1D5e6YS
         P4bxHj3/piOLJ15+0flyc4s+Xp9Y/cfKH4VuCIUZtrC2pIujbKtvRcDD5V18jUU9bAol
         1mC3dYptus1dULDc21ZHWl2LrJsQcpJpZ+sroVdZLxklNzv1hZ18Vw0UtIiA+aqxX0zl
         mJiCdc5KfU7Pv9irYarA8ADk8VZoA2LQE6u+Q8PKbRKcMbnYTOmDroBDxN7rV4jS83ot
         WmpUXoZ96jkYHSIxlkbzIgCG1Bu4KFmeOfTW6JYQ1i54H+1O4aFBvkpubCC8mlqfYLla
         PvMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bqRwAxYb38Rra289y0CJ69vKEaXm7dY70FgkG0q6CeA=;
        b=NXF/ziwzQloCoGdG7uZF0qPQgjOJnGSZkUeD/zak0IHNomjDWmVjtHXs4LWorLBLQq
         5US39T1Mnzq7+q7rmt1FrprtkYk/77O+VyldPGAj0yXKippvptNl6X1mAJYhmCNAnz57
         PusqnoPO9aG7fhDQKQMPeR1l8FuS+pmUYl89+40pUWlAImAdK3XZphbgwH0Nbw053d+1
         3rYnRzUZhb2F8LGXYvcscEqLninChJYx3sx3zvlMHGGuyQrs513rJ8lPR5RgbvyHW9G1
         Kt9tTVb8Pz+tdfRQG+9PEBdDO7cX8SUOsLM/Tw2BmfBv48UmXGY7bc9fRCn6tODfvGKQ
         D1zQ==
X-Gm-Message-State: AFqh2kr5JsspezesvL0341Yh7Qxiy7w9Atl1TxqBANws7QyPAsQu4BhU
	V2qYfYi3ySYCCNOfmT/AffYX7B1Y9lvlTqYxpoJS6w==
X-Google-Smtp-Source: AMrXdXuJ+Dd+putufdCXRUhJ0xotbP9SUcd8vZE5AnE+VGSO7DwmBS7WnZcAk9I7oeFolV91DPuzKpSZar6J9ceRf3w=
X-Received: by 2002:a17:906:340b:b0:7ad:a2ef:c62 with SMTP id
 c11-20020a170906340b00b007ada2ef0c62mr4232687ejb.126.1674663499162; Wed, 25
 Jan 2023 08:18:19 -0800 (PST)
MIME-Version: 1.0
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
 <20230123154735.74832-2-carlo.nonato@minervasys.tech> <a470be46-ab6e-3970-2b04-6f4035adf1cb@suse.com>
 <CAG+AhRX9DVW5EfXKQoDG9hmcE0FORydTZd0pNm-0uqwddaN9NQ@mail.gmail.com> <6c952571-6a8d-e4fc-36ec-b5b79dac40f6@suse.com>
In-Reply-To: <6c952571-6a8d-e4fc-36ec-b5b79dac40f6@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Wed, 25 Jan 2023 17:18:08 +0100
Message-ID: <CAG+AhRUOBgPsT9yU3EtqSPj5VX70H1DsUL_dOWguapC+u3iSvw@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] xen/common: add cache coloring common code
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org, 
	Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 25, 2023 at 2:10 PM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 25.01.2023 12:18, Carlo Nonato wrote:
> > On Tue, Jan 24, 2023 at 5:37 PM Jan Beulich <jbeulich@suse.com> wrote:
> >> On 23.01.2023 16:47, Carlo Nonato wrote:
> >>> --- /dev/null
> >>> +++ b/xen/include/xen/llc_coloring.h
> >>> @@ -0,0 +1,54 @@
> >>> +/* SPDX-License-Identifier: GPL-2.0 */
> >>> +/*
> >>> + * Last Level Cache (LLC) coloring common header
> >>> + *
> >>> + * Copyright (C) 2022 Xilinx Inc.
> >>> + *
> >>> + * Authors:
> >>> + *    Carlo Nonato <carlo.nonato@minervasys.tech>
> >>> + */
> >>> +#ifndef __COLORING_H__
> >>> +#define __COLORING_H__
> >>> +
> >>> +#include <xen/sched.h>
> >>> +#include <public/domctl.h>
> >>> +
> >>> +#ifdef CONFIG_HAS_LLC_COLORING
> >>> +
> >>> +#include <asm/llc_coloring.h>
> >>> +
> >>> +extern bool llc_coloring_enabled;
> >>> +
> >>> +int domain_llc_coloring_init(struct domain *d, unsigned int *colors,
> >>> +                             unsigned int num_colors);
> >>> +void domain_llc_coloring_free(struct domain *d);
> >>> +void domain_dump_llc_colors(struct domain *d);
> >>> +
> >>> +#else
> >>> +
> >>> +#define llc_coloring_enabled (false)
> >>
> >> While I agree this is needed, ...
> >>
> >>> +static inline int domain_llc_coloring_init(struct domain *d,
> >>> +                                           unsigned int *colors,
> >>> +                                           unsigned int num_colors)
> >>> +{
> >>> +    return 0;
> >>> +}
> >>> +static inline void domain_llc_coloring_free(struct domain *d) {}
> >>> +static inline void domain_dump_llc_colors(struct domain *d) {}
> >>
> >> ... I don't think you need any of these. Instead the declarations above
> >> simply need to be visible unconditionally (to be visible to the compiler
> >> when processing consuming code). We rely on DCE to remove such references
> >> in many other places.
> >
> > So this is true for any other stub function that I used in the series, right?
>
> Likely. I didn't look at most of the Arm-only pieces.
>
> >>> --- a/xen/include/xen/sched.h
> >>> +++ b/xen/include/xen/sched.h
> >>> @@ -602,6 +602,9 @@ struct domain
> >>>
> >>>      /* Holding CDF_* constant. Internal flags for domain creation. */
> >>>      unsigned int cdf;
> >>> +
> >>> +    unsigned int *llc_colors;
> >>> +    unsigned int num_llc_colors;
> >>>  };
> >>
> >> Why outside of any #ifdef, and why not in struct arch_domain?
> >
> > Moving this in sched.h seemed like the natural continuation of the common +
> > arch specific split. Notice that this split is also because Julien pointed
> > out (as you did in some earlier revision) that cache coloring can be used
> > by other arch in the future (even if x86 is excluded). Having two maintainers
> > saying the same thing sounded like a good reason to do that.
>
> If you mean this to be usable by other arch-es as well (which I would
> welcome, as I think I had expressed on an earlier version), then I think
> more pieces want to be in common code. But putting the fields here and all
> users of them in arch-specific code (which I think is the way I saw it)
> doesn't look very logical to me. IOW to me there exist only two possible
> approaches: As much as possible in common code, or common code being
> disturbed as little as possible.

This means having a llc-coloring.c in common where to put the common
implementation, right?
Anyway right now there is also another user of such fields in common:
page_alloc.c.

> > The missing #ifdef comes from a discussion I had with Julien in v2 about
> > domctl interface where he suggested removing it
> > (https://marc.info/?l=xen-devel&m=166151802002263).
>
> I went about five levels deep in the replies, without finding any such reply
> from Julien. Can you please be more specific with the link, so readers don't
> need to endlessly dig?

https://marc.info/?l=xen-devel&m=166669617917298

quote (me and then Julien):
>> We can also think of moving the coloring fields from this
>> struct to the common one (xen_domctl_createdomain) protecting them with
>> the proper #ifdef (but we are targeting only arm64...).

> Your code is targeting arm64 but fundamentally this is an arm64 specific
> feature. IOW, this could be used in the future on other arch. So I think
> it would make sense to define it in common without the #ifdef.

> Jan
>
> > We were talking about
> > a different struct, but I thought the principle was the same. Anyway I would
> > like the #ifdef too.
> >
> > So @Jan, @Julien, can you help me fix this once for all?
> >
> > Thanks.
> >
> > - Carlo Nonato
>

