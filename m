Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D1C86E4E5
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 17:03:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687748.1071529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg5KW-0002MA-Hf; Fri, 01 Mar 2024 16:01:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687748.1071529; Fri, 01 Mar 2024 16:01:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg5KW-0002JA-EL; Fri, 01 Mar 2024 16:01:48 +0000
Received: by outflank-mailman (input) for mailman id 687748;
 Fri, 01 Mar 2024 16:01:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+MAL=KH=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rg5KU-0002J4-P1
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 16:01:46 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00971bdd-d7e5-11ee-afd8-a90da7624cb6;
 Fri, 01 Mar 2024 17:01:45 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-563c595f968so3736716a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 01 Mar 2024 08:01:45 -0800 (PST)
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
X-Inumbo-ID: 00971bdd-d7e5-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1709308905; x=1709913705; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22goiwUKXnXos+NblU9baP8d3PaG2JHeNrBuLSf288Q=;
        b=LOfKiRUnvISDGAjaWzyfeonBxvC7eZZXAbjvYDe1J8o5IRxz71RzNSFWGG8j2u5WQo
         7A10VLjqFMdODKXIE+cp08i0yR4G7rHGa2fSOCkjZGMmT5iA9I/YIqr0bZoVciHYwuWt
         uixROJoBW8IvoD6kgFkDpm98NOYncKHZ4+WlzIK6HdB26JFj+hwM7kTFtj4bno20tvy+
         9mKHQyN7VBiLAhycNULY0l4u0HyhwBWfeJxYRZgrpxH3JuxrFXHXB7cGqffvW4JKizBD
         Af/8L6Q1JNMwM9EwSAiJtWjUB2bJxD+NIbyVXmG03Xtvsgpv5J6MSpUkxJrpJptEgdUx
         i58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709308905; x=1709913705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=22goiwUKXnXos+NblU9baP8d3PaG2JHeNrBuLSf288Q=;
        b=lzw/gITt20Gws7QFIc4Bprc3fUcASS+1OIhxbwJmemV3urqD36ZE0iSKmQwqUeRNUw
         duJmMe1n4s/6cgoGUbR5FhJfI7EfzwIcovuGdWOo4OFc23olUjQqOdbj6xcSYdCg3+8g
         f9/aniPZf4Tn4nr3VXfyfXvedadMV1OANAgokBwhcr/Obbk3j6PMLPEq81OgmjNxUvO1
         fKcTsd8FP4E2WwyUWCajr7TblWH5Ym1EfyWXxk54ODpmEILWp5AE1W/8MplwpaMBCTld
         2CdZ6x6dbh2S9UqkgugoZGpNANq8edof2ZQ0Xi7lWrrYlJHYKScXhN5Aj3nRaUXUKSms
         xISg==
X-Gm-Message-State: AOJu0Ywb6BHzQrI2M+EDxQAJ75z9Njh/uDs5IPclY6f59GciZjSQjVix
	j04jNq8ew+8KJHNpG8YGRz0dcQFfBiu4S5xcxg37VG85WM0GYAf/24bt/zmDTIj/3UqJA4q2XlV
	2J4p8VHRA8aVcCBfOIHmqpHl2JCCN/7CkbRovdQ==
X-Google-Smtp-Source: AGHT+IFZv0TSRLlipx3wNfelK/3PPDrzStQj9BbIJIgGxnjbLEcEcQubqJmyREr9tW8AV2Au0fU7oTdlfFSRJZJIf2Y=
X-Received: by 2002:a17:906:dce:b0:a3f:adcf:7f58 with SMTP id
 p14-20020a1709060dce00b00a3fadcf7f58mr1851607eji.21.1709308904552; Fri, 01
 Mar 2024 08:01:44 -0800 (PST)
MIME-Version: 1.0
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-7-carlo.nonato@minervasys.tech> <c8e1da62-eea0-4103-b9f7-f5bd05b90e30@perard>
In-Reply-To: <c8e1da62-eea0-4103-b9f7-f5bd05b90e30@perard>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Fri, 1 Mar 2024 17:01:33 +0100
Message-ID: <CAG+AhRXtGB5pDLmGppWr1=Te-iEiKO==U==K45+37mPV5gzSUQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/15] tools: add support for cache coloring configuration
To: Anthony PERARD <anthony.perard@cloud.com>
Cc: xen-devel@lists.xenproject.org, andrea.bastoni@minervasys.tech, 
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Anthony,

On Wed, Feb 28, 2024 at 7:05=E2=80=AFPM Anthony PERARD <anthony.perard@clou=
d.com> wrote:
>
> On Mon, Jan 29, 2024 at 06:18:02PM +0100, Carlo Nonato wrote:
> > diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> > index 2ef8b4e054..4b541fffd2 100644
> > --- a/tools/include/xenctrl.h
> > +++ b/tools/include/xenctrl.h
> > @@ -2653,6 +2653,15 @@ int xc_livepatch_replace(xc_interface *xch, char=
 *name, uint32_t timeout, uint32
> >  int xc_domain_cacheflush(xc_interface *xch, uint32_t domid,
> >                           xen_pfn_t start_pfn, xen_pfn_t nr_pfns);
> >
> > +/*
> > + * Set LLC colors for a domain.
> > + * This is an internal hypercall. It can only be used directly after d=
omain
>
> What is an "internal hypercall"? Can those even exist?

Bad naming from my side. I'll remove that piece from the comment.

> > + * creation. An attempt to use it afterwards will result in an error.
> > + */
> > +int xc_domain_set_llc_colors(xc_interface *xch, uint32_t domid,
> > +                             const unsigned int *llc_colors,
> > +                             unsigned int num_llc_colors);
> > +
> >  #if defined(__arm__) || defined(__aarch64__)
> >  int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
> >                    uint32_t overlay_fdt_size, uint8_t overlay_op);
> > diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
> > index f2d9d14b4d..ad02288659 100644
> > --- a/tools/libs/ctrl/xc_domain.c
> > +++ b/tools/libs/ctrl/xc_domain.c
> > @@ -2180,6 +2180,40 @@ int xc_domain_soft_reset(xc_interface *xch,
> >      domctl.domain =3D domid;
> >      return do_domctl(xch, &domctl);
> >  }
> > +
> > +int xc_domain_set_llc_colors(xc_interface *xch, uint32_t domid,
> > +                             const unsigned int *llc_colors,
> > +                             unsigned int num_llc_colors)
> > +{
> > +    struct xen_domctl domctl =3D {};
> > +    DECLARE_HYPERCALL_BUFFER(uint32_t, local);
> > +    int ret =3D -1;
> > +
> > +    if ( num_llc_colors )
> > +    {
> > +        size_t bytes =3D sizeof(uint32_t) * num_llc_colors;
>
> Isn't there a risk of overflow, maybe only on 32bit platform? Or maybe
> that doesn't matter because the hypervisor should be able to find out if
> the buffer is too short, right?

I'm not aware of a way to find out the actual buffer size in the hypervisor=
,
so to answer your question, yes there's a risk of overflow, but that would
require a huge number of colors, which would probably fail the allocation
or would fail the check on the platform supported number of color in the
hypervisor.
If you prefer I can add the check here anyway.

> > +        local =3D xc_hypercall_buffer_alloc(xch, local, bytes);
> > +        if ( local =3D=3D NULL )
> > +        {
> > +            PERROR("Could not allocate LLC colors for set_llc_colors")=
;
> > +            return -ENOMEM;
> > +        }
> > +        memcpy(local, llc_colors, bytes);
> > +        set_xen_guest_handle(domctl.u.set_llc_colors.llc_colors, local=
);
> > +    }
> > +
> > +    domctl.cmd =3D XEN_DOMCTL_set_llc_colors;
> > +    domctl.domain =3D domid;
> > +    domctl.u.set_llc_colors.num_llc_colors =3D num_llc_colors;
> > +
> > +    ret =3D do_domctl(xch, &domctl);
> > +
> > +    if ( local )
> > +        xc_hypercall_buffer_free(xch, local);
>
> It doesn't looks like you need to check if "local !=3D NULL" before
> calling xc_hypercall_buffer_free(), it should work even with
> local=3D=3DNULL. This is even used multiple time in xc_kexec.

Ok, thanks.

> > +
> > +    return ret;
> > +}
>
> Thanks,
>
> --
> Anthony PERARD

