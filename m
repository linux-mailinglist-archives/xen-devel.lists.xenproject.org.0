Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F12F848559
	for <lists+xen-devel@lfdr.de>; Sat,  3 Feb 2024 12:42:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675365.1050743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWEPG-0003Gw-7g; Sat, 03 Feb 2024 11:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675365.1050743; Sat, 03 Feb 2024 11:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWEPG-0003FO-4v; Sat, 03 Feb 2024 11:41:58 +0000
Received: by outflank-mailman (input) for mailman id 675365;
 Sat, 03 Feb 2024 11:41:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JBn0=JM=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rWEPE-0003FG-1y
 for xen-devel@lists.xenproject.org; Sat, 03 Feb 2024 11:41:56 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a9dbc38-c289-11ee-8a45-1f161083a0e0;
 Sat, 03 Feb 2024 12:41:54 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-55c2cf644f3so3638441a12.1
 for <xen-devel@lists.xenproject.org>; Sat, 03 Feb 2024 03:41:54 -0800 (PST)
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
X-Inumbo-ID: 3a9dbc38-c289-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1706960514; x=1707565314; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+qu75hMXPYuPHwIGXQ06nMziFKRnaeLPjJHX+4ptT4=;
        b=BLfWxqv02FsNR+GQbUKLQFlrnmoXwBp6gaUThS4NgPBpmiJHBoper1ZZ5ii5seKzj4
         jbm/D+oGzoMXTEHeW4IEzdvB/2xKzEdblJqWOXzlRzKTB9hE4aqEPvt8pN02jie+8ro4
         5ZU/QZWTXx3Dm51DWXjDOyqKQ75NWB5eUnOFlj0/LoZFgYELctp3+N3+9NXbQShX3w70
         R8llKsv0xokmPez4L/NdhW1XgCYjc1e4tJH7F3oqVaY3pwjFfky9Vl3s2gOrkTfZtW23
         1xzdRz0lAHQGZ9iMnFg7gqws+TgRvUJwgEXoaANWXjjghs8YHKQkyvSJsaN6X7kw9RJX
         0FRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706960514; x=1707565314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+qu75hMXPYuPHwIGXQ06nMziFKRnaeLPjJHX+4ptT4=;
        b=UZBxyu3p9kgmWlN2Q6fXSih6rU+RRqBCtkTBSmwAey+AB1lRaFK3lzQD+dSoV89z0G
         B6AA/gCWsUp8PkDAApTC/FiCWi5CHKTJCxM3IdM00mj4YeXKllD/cAjR+Z76A26s3wFK
         Vy7ByCjv240EtiCE4UGCFkHsT3fPmxk5flDDUluNFvSBROUF95Bp8gb+ff6N7ftHVm5t
         e5h25RJz5QZBdVIJzkwwvHofAYPXb6GZc8NOjYkiZ+78q4bABlVt2DNrj6V6A2LGolyN
         z6lUSBtjLZ6vK1OejUuHGwTTSzT9zBnh55lrKyQI7Q4zZvfwr0jmHlJMMw/4+irqCnuq
         m2ww==
X-Gm-Message-State: AOJu0Yw2xVCznqZvk4SCRaOace4ug+5tMiKCFurKYqJm5kWKWrh5slI0
	wh4h3XlDu/724dL1J91UcC/5k6Ley5wxlPycupDy+2ZCagTvwgY4LWOBUxbqpzzpIZCdcnWurPd
	YTjkmeKDSgkNfZWtffobjLVjV+fSjftkEKtLOCQ==
X-Google-Smtp-Source: AGHT+IEgX/70d8LGDrSJM8Lac3vjz6z98BriOFQm8mt3amQz/TJb0/25tEufKK1J8IqWzTWz7wj9lSXkh+diwcMjM8U=
X-Received: by 2002:a50:bb48:0:b0:560:14c4:58fe with SMTP id
 y66-20020a50bb48000000b0056014c458femr1108926ede.29.1706960514068; Sat, 03
 Feb 2024 03:41:54 -0800 (PST)
MIME-Version: 1.0
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-6-carlo.nonato@minervasys.tech> <49827753-14f1-42cc-8791-27c5400e6e50@suse.com>
In-Reply-To: <49827753-14f1-42cc-8791-27c5400e6e50@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Sat, 3 Feb 2024 12:41:43 +0100
Message-ID: <CAG+AhRUGdkqhoSL-ihiCGZctH2mkSOi+ap+=a_kKLzJRGugCbw@mail.gmail.com>
Subject: Re: [PATCH v6 05/15] xen: extend domctl interface for cache coloring
To: Jan Beulich <jbeulich@suse.com>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Thu, Feb 1, 2024 at 2:51=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 29.01.2024 18:18, Carlo Nonato wrote:
> > @@ -858,6 +859,16 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t=
) u_domctl)
> >                  __HYPERVISOR_domctl, "h", u_domctl);
> >          break;
> >
> > +    case XEN_DOMCTL_set_llc_colors:
> > +        if ( !llc_coloring_enabled )
> > +            break;
>
> With "ret" still being 0, this amounts to "successfully ignored". Ought
> to be -EOPNOTSUPP, I guess.

Yep.

> > +        ret =3D domain_set_llc_colors_domctl(d, &op->u.set_llc_colors)=
;
> > +        if ( ret =3D=3D -EEXIST )
> > +            printk(XENLOG_ERR
> > +                   "Can't set LLC colors on an already created domain\=
n");
>
> If at all a dprintk(). But personally I think even that's too much - we
> don't do so elsewhere, I don't think.

I'm going to drop the printk.

> > --- a/xen/common/llc-coloring.c
> > +++ b/xen/common/llc-coloring.c
> > @@ -4,6 +4,7 @@
> >   *
> >   * Copyright (C) 2022 Xilinx Inc.
> >   */
> > +#include <xen/guest_access.h>
> >  #include <xen/keyhandler.h>
> >  #include <xen/llc-coloring.h>
> >  #include <xen/param.h>
> > @@ -229,6 +230,30 @@ int __init dom0_set_llc_colors(struct domain *d)
> >      return domain_check_colors(d);
> >  }
> >
> > +int domain_set_llc_colors_domctl(struct domain *d,
> > +                                 const struct xen_domctl_set_llc_color=
s *config)
>
> What purpose has the "domctl" in the function name?

To signal that it's called from domctl. Do you suggest leaving it out?

> > +{
> > +    unsigned int *colors;
> > +
> > +    if ( d->num_llc_colors )
> > +        return -EEXIST;
> > +
> > +    if ( !config->num_llc_colors )
> > +        return domain_set_default_colors(d);
> > +
> > +    colors =3D alloc_colors(config->num_llc_colors);
> > +    if ( !colors )
> > +        return -ENOMEM;
>
> Hmm, I see here you call the function without first having bounds checked
> the input. But in case of too big a value, -ENOMEM is inappropriate, so
> such a check wants adding up front anyway.

Yeah, ok.

> > +    if ( copy_from_guest(colors, config->llc_colors, config->num_llc_c=
olors) )
> > +        return -EFAULT;
>
> There again wants to be a check that the pointed to values are the same,
> or at least of the same size. Else you'd need to do element-wise copy.
>
> > +    d->llc_colors =3D colors;
> > +    d->num_llc_colors =3D config->num_llc_colors;
> > +
> > +    return domain_check_colors(d);
>
> And if this fails, you leave the domain with the bad settings? Shouldn't
> you check and only then store pointer and count?

Yes. I'm gonna change it.

Thanks.

> > --- a/xen/include/public/domctl.h
> > +++ b/xen/include/public/domctl.h
> > @@ -1190,6 +1190,13 @@ struct xen_domctl_vmtrace_op {
> >  typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
> >  DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
> >
> > +struct xen_domctl_set_llc_colors {
> > +    /* IN LLC coloring parameters */
> > +    uint32_t num_llc_colors;
> > +    uint32_t padding;
>
> I see you've added padding, but: You don't check it to be zero. Plus
> the overwhelming majority of padding fields is named "pad".
>
> Jan

