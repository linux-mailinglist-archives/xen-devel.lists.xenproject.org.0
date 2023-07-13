Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F30E7518AB
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 08:14:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562928.879716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJpaq-0005ii-JO; Thu, 13 Jul 2023 06:14:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562928.879716; Thu, 13 Jul 2023 06:14:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJpaq-0005gY-GT; Thu, 13 Jul 2023 06:14:24 +0000
Received: by outflank-mailman (input) for mailman id 562928;
 Thu, 13 Jul 2023 06:14:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3bWA=C7=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qJpao-0005gO-W8
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 06:14:23 +0000
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80e32cde-2144-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 08:14:21 +0200 (CEST)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-7679d75940fso37992485a.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jul 2023 23:14:20 -0700 (PDT)
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
X-Inumbo-ID: 80e32cde-2144-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689228859; x=1691820859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W7D0WxEsVMHRDc8fyrvqHBYuZzwAEnOozUda4fV0nPs=;
        b=LHMaEaw0n5HxtTEE7HtnW01fcg5n5MaA8rNH8z6/qgVVYr1ev/yMM/4Xdv8xMFUGGU
         osuHkr/b3i7SIt/Jmp/RFUpc9uCcbgGtaNZJVSO31Je2sk66rHMji9bQmZ36tQi7BO+G
         00NwALkSyTJPYnG5p3EXS3NGVLmJAvkN3QKupKq6hNxn8s9tDL/pb3GTVtHsxPD8g6Pf
         82UweFTrJGBo/TOAVILHMagIFd/nyWFUy6GBLF/m2Tbe+Ay4XsumK7By4qsY2/+rXZfn
         nRTzvsfpGSroK+7X09pFb5DlKYEANL0/3y8/Se6dcXymt5/PHUQAMjBDOIkbRD7ITsAt
         OmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689228859; x=1691820859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7D0WxEsVMHRDc8fyrvqHBYuZzwAEnOozUda4fV0nPs=;
        b=jHfq+MoQcbDJomshrbMKvw++jLvYV6ekG+AAk8EwTo6EXEllSspD+dkBrWjTzWz+Zz
         e94J7xOIKlu3qJgFP+qV1S2dHOXRE8DGTAsgFbgNOWea18aucNJhXqaY9pr4O/BQL0D6
         mGoZpU1YNRX/uYI5X+eBmlqEk5ZON2HA1Q0jhqtI1CDYLtDnxQcLWjFdoGdtKedHs0LG
         gj7THDKAHw9BnpZNTI0Fhe99d87NvOpISFSpvj4jH7RA6JGHByDtvazAM6zPSD58H5I7
         yR1Q6ia4au0M8ZEi+kcS5JoHyy7oIEhyU5HCZ5mE13/apU5ltgmY8iYgHYm/Znh8jEBQ
         XOMQ==
X-Gm-Message-State: ABy/qLZ/O7SLhwFXBk3QjMF16xOxuld62eApsOuxS+iTisVAsXSNH+o1
	p/rDFDEqFGkS1Ls5E+s0VzRzamiqeOApM+bKDZU2XQ==
X-Google-Smtp-Source: APBJJlH8aiFIV24pou68ahVwbiG3Vlz8L40+ewtNEHVC/wiUcNZeJp0yc/2vbyi47iAdXJ/OXktqXNrTE4itxQjGzqs=
X-Received: by 2002:a05:620a:2587:b0:765:83e8:d990 with SMTP id
 x7-20020a05620a258700b0076583e8d990mr511388qko.75.1689228859441; Wed, 12 Jul
 2023 23:14:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
 <20230705093433.2514898-3-jens.wiklander@linaro.org> <826c2ff0-79d3-9544-5ce3-7f49905a353c@citrix.com>
In-Reply-To: <826c2ff0-79d3-9544-5ce3-7f49905a353c@citrix.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 13 Jul 2023 08:14:08 +0200
Message-ID: <CAHUa44FxWv1DhLvQ_tRycKG0zZ9y5AHpQAHiQLKScAnKXFOnkA@mail.gmail.com>
Subject: Re: [XEN PATCH v9 02/24] xen/arm: add TEE teardown to arch_domain_teardown()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand.Marquis@arm.com, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, 
	Marc Bonnici <marc.bonnici@arm.com>, Achin Gupta <achin.gupta@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 12, 2023 at 10:31=E2=80=AFAM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 05/07/2023 10:34 am, Jens Wiklander wrote:
> > diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> > index 15d9709a97d2..18171decdc66 100644
> > --- a/xen/arch/arm/domain.c
> > +++ b/xen/arch/arm/domain.c
> > @@ -795,6 +795,42 @@ fail:
> >
> >  int arch_domain_teardown(struct domain *d)
> >  {
> > +    int ret =3D 0;
> > +
> > +    BUG_ON(!d->is_dying);
> > +
> > +    /* See domain_teardown() for an explanation of all of this magic. =
*/
> > +    switch ( d->teardown.arch_val )
> > +    {
> > +#define PROGRESS(x)                             \
> > +        d->teardown.arch_val =3D PROG_ ## x;      \
> > +        fallthrough;                            \
> > +    case PROG_ ## x
> > +
> > +        enum {
> > +            PROG_none,
> > +            PROG_tee,
> > +            PROG_done,
> > +        };
> > +
> > +    case PROG_none:
> > +        BUILD_BUG_ON(PROG_none !=3D 0);
> > +
> > +    PROGRESS(tee):
> > +        ret =3D tee_domain_teardown(d);
> > +        if ( ret )
> > +            return ret;
> > +        break;
>
> This unconditional break isn't correct.
>
> The logic functions right now (because upon hitting return 0, you don't
> re-enter this function), but will cease working when you add a new
> PROG_*, or when the calling code gets more complicated.
>
> > +
> > +    PROGRESS(done):
> > +        break;
>
> This needs to be the only break in the switch statement, for it to
> behave in the intended manner.

Got it, thanks for the explanation. I'll fix it in the next version.

Thanks,
Jens

>
> ~Andrew

