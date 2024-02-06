Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A1684B3EA
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 12:47:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676830.1053132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXJuk-00018Q-Eq; Tue, 06 Feb 2024 11:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676830.1053132; Tue, 06 Feb 2024 11:46:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXJuk-00016s-Bj; Tue, 06 Feb 2024 11:46:58 +0000
Received: by outflank-mailman (input) for mailman id 676830;
 Tue, 06 Feb 2024 11:46:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JoWx=JP=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rXJui-000164-Su
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 11:46:56 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c90067a-c4e5-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 12:46:54 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-55a90a0a1a1so6950090a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 03:46:54 -0800 (PST)
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
X-Inumbo-ID: 6c90067a-c4e5-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1707220014; x=1707824814; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8/oMxMR+vfjnyX3RtwcY6FGZAgbqksWkgFNdCxGN/Y=;
        b=EQ5WZs7JcdFtBZNvzSmBX3/hRBHC5C5LACW2/LhhBs60kqkT0pOsfvTzvFewiRk82I
         7wcGoT1vTHISg9DvgLoAptggzDwSJOmStroas1ECsUS4ZJH1Avn2VvI+gyH2yCheouMK
         zyKqD1n09LWklp6KfsvQP+Ms9mWm4+d9B11N78pM57W0q9g38UACGTMKhlctLQbdQRkQ
         QNo8liJpYoGnyhoKArVB0gm9FlvxvcUCKd0i5p6cQd3R7WRCRj87uJo04KknBLW/jfG+
         8dKYuRHgdpbQMsSvZEtFQ1fWsaTQFQLQBBUX6X4n2C056wMLAeMwywk2IcIhnKaCI8xz
         YPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707220014; x=1707824814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8/oMxMR+vfjnyX3RtwcY6FGZAgbqksWkgFNdCxGN/Y=;
        b=aegREF0jhLUCT4TrVXv6Oc2FM8SexKXyMB+Q0kb7QaJfoEgtLaox0tavPiQNKJrgRu
         iWlOwbLAPtZqepxg7Vi76cBN2K9jx9xpLDzbjtsj6uWTcfsFWYSlAVgOI2B7K9lYpbIS
         7NyJW5WAR+GieKTcCL0WvJB7bECvWjM7vieuLkspCfFZueIjSsPUNjtOXmLXlS1H24ep
         XJN5ppl4nWpX75CVTTw8T8E/z55WX5aeYO2Xq9Z3Z9eKK8+K7Su59E9qOntU9GmeJTeB
         rLEZ0BZGs0M8O6nHHHI3IsMYFhr7Sqw/FvySkcAN5nWdlMHEt96lJjFQ3b1j8u2IvVIg
         7qUQ==
X-Gm-Message-State: AOJu0Yy77FyB//GWJAAraFkpyPy24V97PtlwBB7iob+NifFyDWi5LBDF
	jyGevRe4tOdP5jzqFLVMEkjhq87hhKz2DXR2cn+310zN7v8GylgVrcy+NpyNkDqPOXaCHMNgZF3
	Y0kZffhm2g2nmNuPsGwhUblC/11i+eJDMwlnVOw==
X-Google-Smtp-Source: AGHT+IG6CgiBWyW3Ari4+zP/yA0q67PInJczVKi7aOcOSsudE+rjN7rZMBSBjfm339oApfWkXUMJqgcEExwDjHTI9qQ=
X-Received: by 2002:aa7:d643:0:b0:55f:fba9:de8c with SMTP id
 v3-20020aa7d643000000b0055ffba9de8cmr1418413edr.21.1707220014002; Tue, 06 Feb
 2024 03:46:54 -0800 (PST)
MIME-Version: 1.0
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-6-carlo.nonato@minervasys.tech> <49827753-14f1-42cc-8791-27c5400e6e50@suse.com>
In-Reply-To: <49827753-14f1-42cc-8791-27c5400e6e50@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Tue, 6 Feb 2024 12:46:43 +0100
Message-ID: <CAG+AhRX82h40t53LB2h91A6N0fCVafyaCGQn7Pwmn6GZ+RM+mQ@mail.gmail.com>
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
>
> > +        ret =3D domain_set_llc_colors_domctl(d, &op->u.set_llc_colors)=
;
> > +        if ( ret =3D=3D -EEXIST )
> > +            printk(XENLOG_ERR
> > +                   "Can't set LLC colors on an already created domain\=
n");
>
> If at all a dprintk(). But personally I think even that's too much - we
> don't do so elsewhere, I don't think.
>
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
>
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
>
> > +    if ( copy_from_guest(colors, config->llc_colors, config->num_llc_c=
olors) )
> > +        return -EFAULT;
>
> There again wants to be a check that the pointed to values are the same,
> or at least of the same size. Else you'd need to do element-wise copy.

Sorry to bring this back again, but I've just noticed copy_from_guest()
already checks for type compatibility. For what regards the size I don't th=
ink
I understood what to check. colors is defined to be of the same size of
config->llc_colors.

Thanks.

> > +    d->llc_colors =3D colors;
> > +    d->num_llc_colors =3D config->num_llc_colors;
> > +
> > +    return domain_check_colors(d);
>
> And if this fails, you leave the domain with the bad settings? Shouldn't
> you check and only then store pointer and count?
>
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

