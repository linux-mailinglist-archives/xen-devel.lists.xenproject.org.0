Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9065E885B77
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 16:13:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696444.1087393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnK6B-000653-HU; Thu, 21 Mar 2024 15:12:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696444.1087393; Thu, 21 Mar 2024 15:12:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnK6B-000632-EZ; Thu, 21 Mar 2024 15:12:55 +0000
Received: by outflank-mailman (input) for mailman id 696444;
 Thu, 21 Mar 2024 15:12:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5xA2=K3=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rnK69-00062s-M3
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 15:12:53 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7cf0cc4b-e795-11ee-afe0-a90da7624cb6;
 Thu, 21 Mar 2024 16:12:52 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a4675aaa2e8so151780566b.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 08:12:52 -0700 (PDT)
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
X-Inumbo-ID: 7cf0cc4b-e795-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1711033972; x=1711638772; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZsjC4BWr9j80CiGoYlcjaFvLnxbw82JJtssygaJkjQ=;
        b=eDQJl6U1la+uEKCPF4dlErhru7XP9dUrebBTATetVXU8qhW6Xx6ofIHYve/ScjlGg8
         aREtrA9XxnONU+K+ImZ1hZN1+wkCVtS8UcOEfssLhThud5oVGvRrcEKcBXJDLXBriPy1
         Uv8ab6djSMaEAPARWgNY4RhVKDTCgGgyXhec/qxuw4yxa8CEhw6J/lfe/fCjagxa9Z/G
         iB6gaI/xh9suBgmhZcqshB09isGX92qZg7ZkPbAILrwRLz6THDfCDEc903QTtMCuiHdM
         L3dCtCPe+5Fa3oglzzdi+EscNke86tdgJfOF8+IxJV7POUlG+YT6KGDighmCQpFyVx8R
         9nVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711033972; x=1711638772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZsjC4BWr9j80CiGoYlcjaFvLnxbw82JJtssygaJkjQ=;
        b=S38NWKqfBcU+wMgUdB2EKv75ZbHtm6ffhTtDNjqNdHzmjZ5CF8TwzSWsLNbHxINuha
         S32OdT5TBFQRJYpnStOyveQVdePTp+sXhGL3mM+wNDFIy1SlmMZdlwxHoHhdTuMiw/lV
         DQRi7QS09BvL5DMY/6HTQyMSUoSZWMR7AHxWeYRzwRBzL1bovJR6nTn62B2KD9ye4wXS
         Bkf9ebHFhmkbbzd/DC0txHcVlr+Qt/7GpkRkIFQA07p9LTYhaYFZIFaDX3N/3gWZpPgP
         LLEzNE4e8eoObOzhMQbtu6hsUmDPPeZ4GJ02FacfGHC9QLN8sxpVxB8l1lMIgGMGDQd4
         FhHA==
X-Forwarded-Encrypted: i=1; AJvYcCV5uq7VtE0+dZ9UpWUWAiJk5fmhpkRBxk8gdUlPq6Gl7shcDjU7R1OAPZXwStisc+6opWYh9PRA64q7nMrY5YoJDs0pvbvIjRSuTzRtu+s=
X-Gm-Message-State: AOJu0YwDCGH+GIVglGGKPdjiCxS0Yt7kWBFoMCg0vh0erCBjap5v3bFh
	C52v0xDB+oIK+ukPpUfi2XcxrWCjePgVInEIXs62lx9NkJXV76Kg49mMsct76LeeehTBjSHIOLl
	OCvLzAgyYRxqcV8vCa2VXmzJ/vpljGGYP/YVECA==
X-Google-Smtp-Source: AGHT+IF0gnp8xH4UfAB5ouXJ19aQpTRgdeuHIWDgQ6q01PKXePDjOMFhY8LwHdTohmX7cfXzCgy12eW+GAlUD1N8AOI=
X-Received: by 2002:a17:906:fa1b:b0:a3f:33b2:5ce2 with SMTP id
 lo27-20020a170906fa1b00b00a3f33b25ce2mr1617853ejb.35.1711033972423; Thu, 21
 Mar 2024 08:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-8-carlo.nonato@minervasys.tech> <8194d91a-a71a-44f2-a498-61297ac2ee29@suse.com>
In-Reply-To: <8194d91a-a71a-44f2-a498-61297ac2ee29@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Thu, 21 Mar 2024 16:12:41 +0100
Message-ID: <CAG+AhRUFu=cQe_j9e0nPFjj4pP=+tGp+ynnRKNDUo8dFDa4gFQ@mail.gmail.com>
Subject: Re: [PATCH v7 07/14] xen/arm: add support for cache coloring
 configuration via device-tree
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Tue, Mar 19, 2024 at 4:41=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 15.03.2024 11:58, Carlo Nonato wrote:
> > --- a/xen/common/llc-coloring.c
> > +++ b/xen/common/llc-coloring.c
> > @@ -253,6 +253,37 @@ int domain_set_llc_colors(struct domain *d,
> >      return 0;
> >  }
> >
> > +int __init domain_set_llc_colors_from_str(struct domain *d, const char=
 *str)
> > +{
> > +    int err;
> > +    unsigned int *colors, num_colors;
> > +
> > +    if ( !str )
> > +        return domain_set_default_colors(d);
> > +
> > +    colors =3D xmalloc_array(unsigned int, max_nr_colors);
> > +    if ( !colors )
> > +        return -ENOMEM;
> > +
> > +    err =3D parse_color_config(str, colors, max_nr_colors, &num_colors=
);
> > +    if ( err )
> > +    {
> > +        printk(XENLOG_ERR "Error parsing LLC color configuration");
> > +        return err;
> > +    }
> > +
> > +    if ( !check_colors(colors, num_colors) )
> > +    {
> > +        printk(XENLOG_ERR "Bad LLC color config for %pd\n", d);
> > +        return -EINVAL;
> > +    }
>
> "colors" is again leaked on the error paths.

Yep.

> > +    d->llc_colors =3D colors;
> > +    d->num_llc_colors =3D num_colors;
>
> num_colors may be quite a bit smaller than max_nr_colors; worth re-
> allocating the array to free up excess space?

Don't know if it's worth it, but it's a very small change so I think I can =
add
it.

> Jan

Thanks.

