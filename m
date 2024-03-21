Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA01885B76
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 16:11:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696442.1087383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnK50-0005Yn-87; Thu, 21 Mar 2024 15:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696442.1087383; Thu, 21 Mar 2024 15:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnK50-0005WS-4e; Thu, 21 Mar 2024 15:11:42 +0000
Received: by outflank-mailman (input) for mailman id 696442;
 Thu, 21 Mar 2024 15:11:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5xA2=K3=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rnK4y-0005WM-5K
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 15:11:40 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5059ae92-e795-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 16:11:38 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a46cc947929so154684466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 08:11:38 -0700 (PDT)
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
X-Inumbo-ID: 5059ae92-e795-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1711033897; x=1711638697; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCwDUGaPeMyFiB1CUk8FbxJ0O95IDAcfx5IQJ0Y4GEs=;
        b=R6JRLiwX9nDRNtsUbEhFWh+qajlfne0/bCgE2RLOK0xfZpRWtkzFyE1UUpZ7g43Ofy
         WA11/xnMzHsDpfm6Hw2fWXKVC81XOmq0IM1DpVXyi5LlbcV+lPkAUkYru1/Gaq3z8XLh
         TUOcocKIn3FB8xBaA8zDr/x9ottxgxSAo9S1dtlZ5eLK3+qKDy2asYk8rt5cUOKv4ZVH
         kteJp/KuWbP82lDbypN2Oj9oziL4lB9IBdqbmHtEe5MkHfH9uSbXKvOAsi488H0RoLXt
         y+OAmo8yCpn4G7uzjx99FiaS1WyEcmX06ZomjGUssUazioHRdA5r9TCmPQYJ7G+mMdTf
         gMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711033897; x=1711638697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCwDUGaPeMyFiB1CUk8FbxJ0O95IDAcfx5IQJ0Y4GEs=;
        b=KSgEwnmN9xbgwSjcEkTsWFoe3dlezJbk3pjxRXojrgACHjedBpM2zx8IlpKIbYS8Gq
         aAIYypuftt42ZoTyXCEa6hgsYETX1HLzsIEoh4Vuo08BlGNc9+KMeDfmSz3CgPngy+ea
         p09t6VTrQjQBrMNfh+Hzd7MdXx79ZGynlmUSMadDH4xOt2dpaeVP64Sdsz/N1XFEsaK2
         g7DRnVFH1oZc+5vjPG7ZUTw1S4JrL9xypjjFSYLPTmQGtRzaWr3bV/6tJQRw47gqy7H4
         AS+pO2E/kBl6y3LS442ZGPiX4yC5jScfoxFpF+Gv3bsGopWAdCh7Se5R9FhV5FvxY82v
         9bRw==
X-Forwarded-Encrypted: i=1; AJvYcCW9UiAMNA+vt//o6uAKG0HW+wsITF/5JDWf7B1h0sjBdhGV4mgPqTiBJ+l1W53aScUN8OVYKwpGCGczL5y7lPYF0yojN88LU7O1JEMVakE=
X-Gm-Message-State: AOJu0YxVeOEBDbhl1N+Rn9AQTXtWbhzrVuTt1YACRba09qWqIPsD8vR5
	H24cW092VAHnwZdXVrSlhNqcgteZrdvsQIiV6smTuj1vCHxXtHse0V9TSsRdKMx1YgTaHGA/crT
	NEqqgKHecGEkCJ5h5o/D4LvZQlFWpYFPUZ5Bu7A==
X-Google-Smtp-Source: AGHT+IHm3grAGohzksOvVuroHCiu8cuC2dN8SsQhJ6X0CMDMCNWhneMU9FC/ciN0JpoVIaj1WQZCwHdFMGzFKeUDZdQ=
X-Received: by 2002:a17:907:78c7:b0:a46:cc87:12f3 with SMTP id
 kv7-20020a17090778c700b00a46cc8712f3mr3732213ejc.75.1711033897580; Thu, 21
 Mar 2024 08:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-6-carlo.nonato@minervasys.tech> <f934db54-3233-4330-9573-f3df3af389a1@suse.com>
In-Reply-To: <f934db54-3233-4330-9573-f3df3af389a1@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Thu, 21 Mar 2024 16:11:27 +0100
Message-ID: <CAG+AhRX5HYc608gYgSk=EdJrK2V30=ZMN=1oEbTPJ1-0UKyNNw@mail.gmail.com>
Subject: Re: [PATCH v7 05/14] xen: extend domctl interface for cache coloring
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Tue, Mar 19, 2024 at 4:37=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 15.03.2024 11:58, Carlo Nonato wrote:
> > @@ -219,6 +220,39 @@ void domain_llc_coloring_free(struct domain *d)
> >      xfree(__va(__pa(d->llc_colors)));
> >  }
> >
> > +int domain_set_llc_colors(struct domain *d,
> > +                          const struct xen_domctl_set_llc_colors *conf=
ig)
> > +{
> > +    unsigned int *colors;
> > +
> > +    if ( d->num_llc_colors )
> > +        return -EEXIST;
> > +
> > +    if ( !config->num_llc_colors )
> > +        return domain_set_default_colors(d);
> > +
> > +    if ( config->num_llc_colors > max_nr_colors || config->pad )
>
> The check of "pad" wants carrying out in all cases; I expect it wants
> moving to the caller.

Ok.

> > +        return -EINVAL;
> > +
> > +    colors =3D xmalloc_array(unsigned int, config->num_llc_colors);
> > +    if ( !colors )
> > +        return -ENOMEM;
> > +
> > +    if ( copy_from_guest(colors, config->llc_colors, config->num_llc_c=
olors) )
> > +        return -EFAULT;
>
> You're leaking "colors" when taking this or ...
>
> > +    if ( !check_colors(colors, config->num_llc_colors) )
> > +    {
> > +        printk(XENLOG_ERR "Bad LLC color config for %pd\n", d);
> > +        return -EINVAL;
>
> ... this error path.

You're right.

> Jan

Thanks.

On Tue, Mar 19, 2024 at 4:37=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 15.03.2024 11:58, Carlo Nonato wrote:
> > @@ -219,6 +220,39 @@ void domain_llc_coloring_free(struct domain *d)
> >      xfree(__va(__pa(d->llc_colors)));
> >  }
> >
> > +int domain_set_llc_colors(struct domain *d,
> > +                          const struct xen_domctl_set_llc_colors *conf=
ig)
> > +{
> > +    unsigned int *colors;
> > +
> > +    if ( d->num_llc_colors )
> > +        return -EEXIST;
> > +
> > +    if ( !config->num_llc_colors )
> > +        return domain_set_default_colors(d);
> > +
> > +    if ( config->num_llc_colors > max_nr_colors || config->pad )
>
> The check of "pad" wants carrying out in all cases; I expect it wants
> moving to the caller.
>
> > +        return -EINVAL;
> > +
> > +    colors =3D xmalloc_array(unsigned int, config->num_llc_colors);
> > +    if ( !colors )
> > +        return -ENOMEM;
> > +
> > +    if ( copy_from_guest(colors, config->llc_colors, config->num_llc_c=
olors) )
> > +        return -EFAULT;
>
> You're leaking "colors" when taking this or ...
>
> > +    if ( !check_colors(colors, config->num_llc_colors) )
> > +    {
> > +        printk(XENLOG_ERR "Bad LLC color config for %pd\n", d);
> > +        return -EINVAL;
>
> ... this error path.
>
> Jan

