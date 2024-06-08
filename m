Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7289013F1
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jun 2024 01:08:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736772.1142830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sG59R-0006tE-TI; Sat, 08 Jun 2024 23:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736772.1142830; Sat, 08 Jun 2024 23:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sG59R-0006qn-QT; Sat, 08 Jun 2024 23:07:09 +0000
Received: by outflank-mailman (input) for mailman id 736772;
 Sat, 08 Jun 2024 23:07:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ovq7=NK=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sG59Q-0006qh-HI
 for xen-devel@lists.xenproject.org; Sat, 08 Jun 2024 23:07:08 +0000
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [2001:4860:4864:20::2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d316d401-25eb-11ef-90a2-e314d9c70b13;
 Sun, 09 Jun 2024 01:07:07 +0200 (CEST)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-25488f4e55aso604342fac.0
 for <xen-devel@lists.xenproject.org>; Sat, 08 Jun 2024 16:07:07 -0700 (PDT)
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
X-Inumbo-ID: d316d401-25eb-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717888025; x=1718492825; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Spwh/GE+fNNbhje1XWBauuE++xKMkbCnuBE04umdjI=;
        b=dTdjB4JykwPv4F9aTdSVGFbkOZm79v4P9WG1s6u+W+euAXeX/OlOtX7RV9W92EqCoS
         QVBTQInu0IoyJEEh5/3HpJ7oquGury1ihKNvoEbPd38juow7x/Pry7KdrY8xVxXpVwjB
         Tg0UAWkK/fpY/wPSBaWPAm1tjQYKysdG/EfiVqtWFUAnQ2s8vC0q84Wk8Mf/la1AIUnz
         xU6D50jcVObTAXVMGhd+CWzaLkZhKdiwSaaSbzsCyt4Yqm+2nlYfiVZL4io/8ons6azk
         FwIkCUiA8JpbfAvsvcMWNxo5vQSiks5r8HN/iumZ2zSaumvuvtUkQiFse1n3eD1f0WO4
         UsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717888025; x=1718492825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Spwh/GE+fNNbhje1XWBauuE++xKMkbCnuBE04umdjI=;
        b=w6smnMJ12udhD+QdkGvh3cehAtzEn+SZXkOmCRe2zbHV2vVvbLroya5cYDyUMmt1aH
         Ej0MQA+76aW6mitwDfh0C44v0N1OPrGgmzv911KFGtULOgCLaZnfI6ffFd1Vc5d3fqIe
         nUeAM8QyqOBKSN4/W1QB2j4GlaKM0JRHqW6BToUS1G1P6/a0j6W7cufjHnBYNem6RDre
         O1DmUZU97wC4HjxGnstAhmXZP4H1QiyGGbD+Pgxphs8o97ITLSpqYIRrbfJC1r4HE8Jg
         jKvsj1JptENzC8IPK27uoQByBDmBaNeWCoBd6GqlPauqWKhBYOIxOxK45im/JAb18N0J
         jubg==
X-Forwarded-Encrypted: i=1; AJvYcCVLTsVVbAhrQyqiTsibbwMLeeD+z0t4TGw7KI/PcCcM/tJ4oyJmfpKtDX604wA619tnLfcfOkDnKdz0L8uLa+dvWrwY+i3zxKInCS9J12E=
X-Gm-Message-State: AOJu0Yzirq4j1c0efxnvC/6ixbtNNY4SjZhybJ+qTp6Mbt4lObym7g4C
	C1ikUYM2x5vcMoK9uwRzJf3lXh6Z0GwBzWFkVYk5nimFneeeMGvesovEDIN6QpyTs1zroV1HUCt
	Uf6XDxYyWopAXOXdUw25b5Y7+L/k=
X-Google-Smtp-Source: AGHT+IHdnCdp3e/T9uLZe5E15B2ImKKI3C0FZ31eLlDoSgaLf37Q3i1/ToYYau9ERtGnJ4gnRi/ALn76jd9er59deHI=
X-Received: by 2002:a05:6870:b491:b0:24f:d930:3cb0 with SMTP id
 586e51a60fabf-254648000c1mr6247789fac.43.1717888025325; Sat, 08 Jun 2024
 16:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1717356829.git.w1benny@gmail.com> <84794f97bc738add96a66790425a3aa5f5084a25.1717356829.git.w1benny@gmail.com>
 <22eabe14-10c3-4095-91d3-b63911908cb2@suse.com>
In-Reply-To: <22eabe14-10c3-4095-91d3-b63911908cb2@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Sun, 9 Jun 2024 01:06:54 +0200
Message-ID: <CAKBKdXhZ4HOqThPMkwaWB5ZhQOc6gE=xsKzkoL4_h+M6y33dcQ@mail.gmail.com>
Subject: Re: [PATCH for-4.19? v5 07/10] xen: Make the maximum number of altp2m
 views configurable for x86
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 9:24=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
> > @@ -122,7 +131,12 @@ int p2m_init_altp2m(struct domain *d)
> >      struct p2m_domain *hostp2m =3D p2m_get_hostp2m(d);
> >
> >      mm_lock_init(&d->arch.altp2m_list_lock);
> > -    for ( i =3D 0; i < MAX_ALTP2M; i++ )
> > +    d->arch.altp2m_p2m =3D xzalloc_array(struct p2m_domain *, d->nr_al=
tp2m);
> > +
> > +    if ( !d->arch.altp2m_p2m )
> > +        return -ENOMEM;
>
> This isn't really needed, is it? Both ...
>
> > +    for ( i =3D 0; i < d->nr_altp2m; i++ )
>
> ... this and ...
>
> >      {
> >          d->arch.altp2m_p2m[i] =3D p2m =3D p2m_init_one(d);
> >          if ( p2m =3D=3D NULL )
> > @@ -143,7 +157,10 @@ void p2m_teardown_altp2m(struct domain *d)
> >      unsigned int i;
> >      struct p2m_domain *p2m;
> >
> > -    for ( i =3D 0; i < MAX_ALTP2M; i++ )
> > +    if ( !d->arch.altp2m_p2m )
> > +        return;
> > +
> > +    for ( i =3D 0; i < d->nr_altp2m; i++ )
> >      {
> >          if ( !d->arch.altp2m_p2m[i] )
> >              continue;
> > @@ -151,6 +168,8 @@ void p2m_teardown_altp2m(struct domain *d)
> >          d->arch.altp2m_p2m[i] =3D NULL;
> >          p2m_free_one(p2m);
> >      }
> > +
> > +    XFREE(d->arch.altp2m_p2m);
> >  }
>
> ... this ought to be fine without?

Could you, please, elaborate? I honestly don't know what you mean here
(by "this isn't needed").

P.

