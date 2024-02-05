Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2338497A8
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 11:21:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675759.1051196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWw5z-0001aI-Fp; Mon, 05 Feb 2024 10:20:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675759.1051196; Mon, 05 Feb 2024 10:20:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWw5z-0001YU-Cv; Mon, 05 Feb 2024 10:20:59 +0000
Received: by outflank-mailman (input) for mailman id 675759;
 Mon, 05 Feb 2024 10:20:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GYrN=JO=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rWw5x-0001YO-Od
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 10:20:57 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f17d1d4-c410-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 11:20:55 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-557dcb0f870so5482646a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 02:20:55 -0800 (PST)
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
X-Inumbo-ID: 3f17d1d4-c410-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1707128455; x=1707733255; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFSvxJvVHBhNYhugdUop+64G9e1+rgXM4OFSzDZShnk=;
        b=epyJ5G3CP1dHDKzCH480BLwKoaBFxSOy/CJq/hZg5HkTTYiJI53qNvXjZ+qTTujA0c
         qjFTs6aeuHmfHC6h/q87HcRshF30jO2QoEqmtuiTyh+L+u5RD7wXpfxsss4mR1R2d8aw
         gHuBijXVj1sUA3o9/jKC2BUgEoOd2U4gy0sDT3QVrAOCZyECbX14mvlYnO58S86em2h+
         fZAPgVH93SJQQ5/b8g4TLdWWhn2Bc1p4KMTx4KYrwHsOXdU4QhfEKgKNeqrK43XFIpiw
         FlQ7hWEPFTnvq84AemrQPrNcoHWMer0gnDWZCuOMPptiEwbiSfLdovaedQJMAxBoenqy
         iwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707128455; x=1707733255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFSvxJvVHBhNYhugdUop+64G9e1+rgXM4OFSzDZShnk=;
        b=BeB0KA5+xFCgevT1aZ5LXa62bJegYyhVfgB2yulW8/JgYtA2qUlEgeL1kMkB+qU+9+
         UqB0PI/xd+Ad7S//3oV0MtfGg4vp5VJp6SUDu5RZ2EzsTWz1ZnGgqi3XMDRJq8sngPbc
         20Yd9zXoeaPxY5FiWT1i7du25E4O1D5CGi33lOoUQn6qmU/S9IgGmYCSMlEhtEIK3uY3
         1pxubvxe+zAfGB7vpx4jl3Qx6rqyd0Osm4H+1qXxPlIC4TFlzobsXjk9XoTktRm42qF7
         QxOTNKE2vhSW78ayFnn/fhkChazmE1qhcfeGivBZW6UxUND4qlqC8s7SWQ/NeI4ftNRQ
         o4ag==
X-Gm-Message-State: AOJu0YzSpRTjLuUnDryP29DH9sy75Yh/ypPr++sP6xQ6N1pWr6SgkF/A
	8x1n/Ht73Q18RDc5Rcg96KwESooHcZTXAftlVpuKuS8DbPL6vBH7EhXVuPGM13dsQ2RbCeTyG8u
	oaqxcojDi35RDgpmQO3nWxivArCgOe/HZ/omd4Q==
X-Google-Smtp-Source: AGHT+IFoMjpt0lJmyJWTNcLsN9OjnM2LLpneZg7//GnpHtSmZhIn1tnXmpwZ4yGZ4ZnYKgucmiej022il7YZKi43MAM=
X-Received: by 2002:aa7:d804:0:b0:55f:fed8:ea2f with SMTP id
 v4-20020aa7d804000000b0055ffed8ea2fmr4169510edq.25.1707128454743; Mon, 05 Feb
 2024 02:20:54 -0800 (PST)
MIME-Version: 1.0
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-5-carlo.nonato@minervasys.tech> <cf23d8a8-7111-4014-adc7-93ecd5f110ec@suse.com>
 <CAG+AhRW4Ng7wkhB5f2H5ruCmYgium0YXZgA_bu7=T6HErUEg2A@mail.gmail.com> <82e01801-2fef-4a5b-b343-2cd4a99af016@suse.com>
In-Reply-To: <82e01801-2fef-4a5b-b343-2cd4a99af016@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 5 Feb 2024 11:20:43 +0100
Message-ID: <CAG+AhRUasNChBjPU5doEfbTHvY75yUt_NJ-p4PUo-RcjpFsnsA@mail.gmail.com>
Subject: Re: [PATCH v6 04/15] xen/arm: add Dom0 cache coloring support
To: Jan Beulich <jbeulich@suse.com>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Marco Solieri <marco.solieri@minervasys.tech>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Mon, Feb 5, 2024 at 10:35=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 03.02.2024 12:39, Carlo Nonato wrote:
> > On Thu, Feb 1, 2024 at 2:30=E2=80=AFPM Jan Beulich <jbeulich@suse.com> =
wrote:
> >> On 29.01.2024 18:18, Carlo Nonato wrote:
> >>> --- a/xen/common/llc-coloring.c
> >>> +++ b/xen/common/llc-coloring.c
> >>> @@ -17,6 +17,63 @@ size_param("llc-way-size", llc_way_size);
> >>>  /* Number of colors available in the LLC */
> >>>  static unsigned int __ro_after_init max_nr_colors =3D CONFIG_NR_LLC_=
COLORS;
> >>>
> >>> +static unsigned int __initdata dom0_colors[CONFIG_NR_LLC_COLORS];
> >>> +static unsigned int __initdata dom0_num_colors;
> >>> +
> >>> +/*
> >>> + * Parse the coloring configuration given in the buf string, followi=
ng the
> >>> + * syntax below.
> >>> + *
> >>> + * COLOR_CONFIGURATION ::=3D COLOR | RANGE,...,COLOR | RANGE
> >>> + * RANGE               ::=3D COLOR-COLOR
> >>> + *
> >>> + * Example: "0,2-6,15-16" represents the set of colors: 0,2,3,4,5,6,=
15,16.
> >>> + */
> >>> +static int parse_color_config(const char *buf, unsigned int *colors,
> >>> +                              unsigned int num_colors, unsigned int =
*num_parsed)
> >>
> >> Is this function going to be re-used? If not, it wants to be __init.
> >> If so, I wonder where the input string is going to come from ...
> >
> > You're right. It needs __init.
>
> Am I misremembering to have spotted a non-init use in a later patch?

The only usage of the function other than for parameter parsing is in
domain_set_llc_colors_from_str() which is in turn used in dom0less domain
creation, so from another __init function.

Thanks.

> >> Also "num_colors" looks to be misnamed - doesn't this specify an
> >> upper bound only?
> >
> > It's the real size of the colors array.
>
> Hence my remark: It is _not_ the number of colors.
>
> >>> +int __init dom0_set_llc_colors(struct domain *d)
> >>> +{
> >>> +    unsigned int *colors;
> >>> +
> >>> +    if ( !dom0_num_colors )
> >>> +        return domain_set_default_colors(d);
> >>> +
> >>> +    colors =3D alloc_colors(dom0_num_colors);
> >>> +    if ( !colors )
> >>> +        return -ENOMEM;
> >>> +
> >>> +    memcpy(colors, dom0_colors, sizeof(unsigned int) * dom0_num_colo=
rs);
> >>
> >> sizeof(*colors) or some such please. Plus a check that colors and
> >> dom0_colors are actually of the same type. Alternatively, how about
> >> making dom0_colors[] __ro_after_init? Is this too much of a waste?
> >
> > You mean an ASSERT on the two arrays type?
>
> I don't think you can use ASSERT() for such very well. It's runtime
> check, when here we want a build-time one. I'd therefore rather see
> it be something like
>
>    (void)(colors =3D=3D dom0_colors);
>
> Jan

