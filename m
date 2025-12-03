Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D74F8C9EF2E
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 13:14:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176699.1501164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQlji-0000VB-Iq; Wed, 03 Dec 2025 12:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176699.1501164; Wed, 03 Dec 2025 12:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQlji-0000S8-G7; Wed, 03 Dec 2025 12:13:34 +0000
Received: by outflank-mailman (input) for mailman id 1176699;
 Wed, 03 Dec 2025 12:13:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1EAn=6J=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vQljg-0000S2-UQ
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 12:13:33 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b7dfebf-d041-11f0-9d1a-b5c5bf9af7f9;
 Wed, 03 Dec 2025 13:13:31 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-37a415a22ecso8399581fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Dec 2025 04:13:31 -0800 (PST)
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
X-Inumbo-ID: 7b7dfebf-d041-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764764011; x=1765368811; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PTApX7PqTX0x3z2ts5Hkh82xuUbt3IG9TwxGNUSC4U=;
        b=APsC1qn+wK1/He/S8jRlFOzO+x6SnhIwYzQEAdNBX6U2gDaRsbHNSG1P0kjxyawUK+
         IdDFOUhH+ik/Bz626nDfb4+Ytw3WzL+qceT0wJs+QN5ToJzzRzdTtzQhA0x8ohZGnaze
         1KE9DNStgTNcb14Te0SWwLgdsPe/H/JJycIi+IP2m1Gm7ov74x+ScZaEuGDOeOb1PK3+
         y4p0hzgwFkJ+tI2PtNQQFK/1x8VV66LNHopTNVKJQtdr8js191hTg7cUK1NTGJgWqXDJ
         NEVOrThQHprIbs8FRECHdF9mqQ8b/iMFW+EZDsR6dOWuSyTaBnPfEePwbrhsw4bPm1lV
         kSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764764011; x=1765368811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0PTApX7PqTX0x3z2ts5Hkh82xuUbt3IG9TwxGNUSC4U=;
        b=jjehL259yOyMX3NR+RVbDj9ilt7NZBivfHs8B2wquMIKbmHA+UlcM5yPaYAWUSQQDc
         YgDf0qWCRsUW5bXzqwKcAmSdgFqJpziEZny4Rnu8FnJQG+RGG36bLT3vtygOYuqSw85J
         xzaHEjmB88zg2lNPlyCx9R5Hcs1kRXlfPAuxasC5PWuvzm5TTakS69o2uB2d6mEhJS8H
         KArO02xj/0LCyNcaBTEd2K2di80qGMys+6EGvuJBrdBFDFtUDt7YGkBub2C8Bfg3XTUc
         NWYsQ8n9PwSEKfRfGXUbela8L/jRqKQgJohKGdswM4oFt5q8JEM1swVnl8To5zXhF4Pn
         dH2g==
X-Forwarded-Encrypted: i=1; AJvYcCVBELeiE9p7Z7m6HM7VnQFZXqhrXFXzu0X2qb6tqYka42T5gR3TplRc1znZEciWtHM241h+jeFuq8A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywk+MaxGteLo7I1Qftm9R6pc7bjgE9WrTKcXCbZXOJTXnV8lGEO
	/986OZZXKTMEe/6HLM/+8MA0SLEq5zvYqO7OChPR2VlkmhT2imfZ1s4IpWusQtC2dmtOjjWh86C
	GLMl+8aQxKZuPUIZfGPXKwC4sgD9mO3A=
X-Gm-Gg: ASbGnctv7d3c1tr7dkbOwXR2z+qKZmCSW2CwKIQDC4PgjXJ+OPWP2e9wCStwRCV9H9m
	LH9tkiEyL+L+wdpWXKN6Npxf4KQ/GwKS6o6SBv6CeOzwD/wiWpi0P97cDX1IwORwUKd5h1IWsfX
	83CHoM4KID3YIdQSBJMJyZ1FmENIrUkY5qGH9446/gdFbJwaChC3KQ1KtY1hy8a6o2GMs6bWiIR
	A761fsEcPoe2Q08fhPDo5ChNOBMYKT9/8DSyLDLEAjhU+4dYlO0X6I072IG37w0oygqlcQ=
X-Google-Smtp-Source: AGHT+IHktBYvHbZebiSd1KVCAgtriP+d5+b1kO3mKLYqLvu/pbK9kTsVOvltAi3+GxhpPaCEOGhuQACmR/OZ1K6xPuU=
X-Received: by 2002:a05:651c:1b84:b0:37a:582b:9ae3 with SMTP id
 38308e7fff4ca-37e58e87d9fmr18348151fa.17.1764764010427; Wed, 03 Dec 2025
 04:13:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764755558.git.xakep.amatop@gmail.com> <f05ece00c276187d764c7539142f29ee3c48987c.1764755558.git.xakep.amatop@gmail.com>
 <63ed70d8-ab4c-4b9e-8884-954f8f8194e4@suse.com>
In-Reply-To: <63ed70d8-ab4c-4b9e-8884-954f8f8194e4@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 3 Dec 2025 14:13:19 +0200
X-Gm-Features: AWmQ_bm0WhAlwghdYhAotWRE5XuunpiRmRWkKMY_YdYzOx0P-6DI0Velyo0jgOg
Message-ID: <CAGeoDV8zjwZ5YMLG4RKO6NCOwjeiS85mW5=yRP5E8MRYwgNESw@mail.gmail.com>
Subject: Re: [PATCH v15 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

Thank you for the review.

On Wed, Dec 3, 2025 at 12:11=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 03.12.2025 10:57, Mykola Kvach wrote:
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -26,6 +26,7 @@
> >  #include <xen/hypercall.h>
> >  #include <xen/delay.h>
> >  #include <xen/shutdown.h>
> > +#include <xen/suspend.h>
> >  #include <xen/percpu.h>
> >  #include <xen/multicall.h>
> >  #include <xen/rcupdate.h>
> > @@ -1363,6 +1364,9 @@ void domain_resume(struct domain *d)
> >
> >      spin_lock(&d->shutdown_lock);
> >
> > +    if ( arch_domain_resume(d) )
> > +        goto fail;
>
> In case I didn't ask before: You're after a boolean result here, yet ...
>
> > --- /dev/null
> > +++ b/xen/include/xen/suspend.h
> > @@ -0,0 +1,25 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +#ifndef XEN_SUSPEND_H
> > +#define XEN_SUSPEND_H
> > +
> > +#if __has_include(<asm/suspend.h>)
> > +#include <asm/suspend.h>
> > +#else
> > +static inline int arch_domain_resume(struct domain *d)
> > +{
> > +    return 0;
> > +}
> > +#endif
>
> ... int is being returned. Why?

Would you prefer I switch arch_domain_resume() to bool, or is keeping
int acceptable?

I lean toward keeping int: the generic call site is shared by all arches,
so future arches could inspect/handle specific error codes, and this matche=
s
other arch hooks (e.g. arch_domain_teardown()) that are only checked for
"rc !=3D 0" before bailing.

With int, I'll store the result and gate the rest:

    rc =3D arch_domain_resume(d);
    if (rc)
        goto fail;

If int works for you, I=E2=80=99ll keep it; otherwise I can flip to bool.

>
> Jan

Best regards,
Mykola

