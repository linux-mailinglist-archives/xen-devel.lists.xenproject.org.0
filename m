Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A21FC84855B
	for <lists+xen-devel@lfdr.de>; Sat,  3 Feb 2024 12:44:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675368.1050752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWERA-0003qM-JM; Sat, 03 Feb 2024 11:43:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675368.1050752; Sat, 03 Feb 2024 11:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWERA-0003ng-GP; Sat, 03 Feb 2024 11:43:56 +0000
Received: by outflank-mailman (input) for mailman id 675368;
 Sat, 03 Feb 2024 11:43:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JBn0=JM=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rWER9-0003na-08
 for xen-devel@lists.xenproject.org; Sat, 03 Feb 2024 11:43:55 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 812aeecf-c289-11ee-98f5-efadbce2ee36;
 Sat, 03 Feb 2024 12:43:52 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-51117bfd452so5068164e87.3
 for <xen-devel@lists.xenproject.org>; Sat, 03 Feb 2024 03:43:52 -0800 (PST)
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
X-Inumbo-ID: 812aeecf-c289-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1706960632; x=1707565432; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwaSY2p3h1mRDxMHMFJXzP8ZbV1sm8YiOVuurOA3qn4=;
        b=GDaGGzuHLPrO/LMlsKf0Ua0lEoLr2rPKW9Mx89DeS9LqapsyGHYWFfyVB56sUGRMIe
         3hgqqPyyOKyXzmv7SY079iEJo2ED8rTMrHPQ8TAY7HQGZL0Hx24LNwR8l7yGz3HI2kRg
         5TI7zZjk7XWUIKWM279GWx0gFmvMUIWWbzeer5yaRyooe8rMh+acEVOtbFqk2/xb6wpv
         Cidi4zSIufYZqyYqymzfK+jSYS9N4+w1cBATqLiWjPPH1yZTkqXZVjJnN/d7AOQfkYba
         HwYEdt03zg20WFUHc+okOK6Uv1BTZw+OSPc6suzd9KF1gljDd85f7RDjxGraleUeTpGh
         sp7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706960632; x=1707565432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwaSY2p3h1mRDxMHMFJXzP8ZbV1sm8YiOVuurOA3qn4=;
        b=k+0dfo0Wi3GCuyP9bES/ZvImaaZRIyjvhfwsa0wVim6KWG/tPj/vh3KsHd/5hd1NN9
         HjOr4dqy24UsbIaPf4Gg1Yz0aRlYWEGQrEY5rMa15J6AFt+9XFFHsbFbCEk/RxVlmlAy
         tjOwfzpvVrhrPVjQpcluYBZeAcd4XXfr/8oNuLbvFM5rIxcAtQmoumv9gkepeY0baQ4I
         vlPOzNFHvrI+yVBfxRfqOeXDAPcB45siZib/u7F2WcCsqLYTGhmpv/GjMkNPahzgDsxI
         swAOyWOVui2DLzUYPuqcgdfZCYZb+vcIbktTUVxxGhGBwfd5nx5jI4Gm0UXE3Q2NBxhE
         fC6w==
X-Gm-Message-State: AOJu0Yy+fQcPRaWurw33SUTvgxCOPXxrpegdU121yqIqZ+EldfWyac+p
	RDtMDR0u37szT2enkHSASoCtPuekgbXUHjNHQIzd0uFxBZb+mkVv+koanUq2UTpUTj9uhCjZQHY
	us8pG1j2Hh2QlN3i3qDdtKa9qRcas4etpeWstvQ==
X-Google-Smtp-Source: AGHT+IFOmHuKGzl4AA28PwKv37wNKQEc5eexygy3Ozekw29jrH2WEICYF77aFF75gSdJjwzZSpHNtZb/akmUMeBbU6c=
X-Received: by 2002:a05:6512:308d:b0:511:2f20:3c55 with SMTP id
 z13-20020a056512308d00b005112f203c55mr6685812lfd.12.1706960632357; Sat, 03
 Feb 2024 03:43:52 -0800 (PST)
MIME-Version: 1.0
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-8-carlo.nonato@minervasys.tech> <a6ffb4a5-cd83-4c04-9e5a-12d605863b5d@suse.com>
In-Reply-To: <a6ffb4a5-cd83-4c04-9e5a-12d605863b5d@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Sat, 3 Feb 2024 12:43:41 +0100
Message-ID: <CAG+AhRUG8nNF0cTtFYLu1TrV4fWEbix57Ah_-Zsz=U2yRWcGpw@mail.gmail.com>
Subject: Re: [PATCH v6 07/15] xen/arm: add support for cache coloring
 configuration via device-tree
To: Jan Beulich <jbeulich@suse.com>
Cc: andrea.bastoni@minervasys.tech, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Thu, Feb 1, 2024 at 3:19=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 29.01.2024 18:18, Carlo Nonato wrote:
> > @@ -950,6 +951,11 @@ void __init create_domUs(void)
> >  #endif
> >          }
> >
> > +        dt_property_read_string(node, "llc-colors", &llc_colors_str);
> > +        if ( !llc_coloring_enabled && llc_colors_str)
> > +            printk(XENLOG_WARNING
> > +                   "'llc-colors' found, but LLC coloring is disabled\n=
");
>
> Why's this just a warning, when ...

This informs the user that this configuration will be ignored, but the DomU=
 can
be constructed anyway...

> > @@ -960,6 +966,11 @@ void __init create_domUs(void)
> >              panic("Error creating domain %s (rc =3D %ld)\n",
> >                    dt_node_name(node), PTR_ERR(d));
> >
> > +        if ( llc_coloring_enabled &&
> > +             (rc =3D domain_set_llc_colors_from_str(d, llc_colors_str)=
) )
> > +            panic("Error initializing LLC coloring for domain %s (rc =
=3D %d)\n",
> > +                  dt_node_name(node), rc);
>
> ... this results in panic()?

... while here we can't continue because there's some error in the
configuration and the DomU can't be constructed. Domains must have a valid
coloring configuration.

> > --- a/xen/common/llc-coloring.c
> > +++ b/xen/common/llc-coloring.c
> > @@ -254,6 +254,29 @@ int domain_set_llc_colors_domctl(struct domain *d,
> >      return domain_check_colors(d);
> >  }
> >
> > +int domain_set_llc_colors_from_str(struct domain *d, const char *str)
>
> __init ?

Yes.

Thanks.

> > +{
> > +    int err;
> > +    unsigned int *colors;
> > +
> > +    if ( !str )
> > +        return domain_set_default_colors(d);
> > +
> > +    colors =3D alloc_colors(max_nr_colors);
> > +    if ( !colors )
> > +        return -ENOMEM;
> > +
> > +    err =3D parse_color_config(str, colors, max_nr_colors, &d->num_llc=
_colors);
> > +    if ( err )
> > +    {
> > +        printk(XENLOG_ERR "Error parsing LLC color configuration.");
>
> Nit: No full stop at the end of log messages please.
>
> > +        return err;
> > +    }
> > +    d->llc_colors =3D colors;
> > +
> > +    return domain_check_colors(d);
>
> Same ordering issue as in the earlier patch, I think.
>
> Jan

