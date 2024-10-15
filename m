Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B0499EBA5
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 15:09:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819188.1232478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0hIB-0008MY-OS; Tue, 15 Oct 2024 13:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819188.1232478; Tue, 15 Oct 2024 13:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0hIB-0008KL-Km; Tue, 15 Oct 2024 13:08:51 +0000
Received: by outflank-mailman (input) for mailman id 819188;
 Tue, 15 Oct 2024 13:08:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GjeK=RL=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t0hIA-0008KF-3K
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 13:08:50 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d726a26-8af6-11ef-99a2-01e77a169b0f;
 Tue, 15 Oct 2024 15:08:48 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c96b2a11e7so3645532a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Oct 2024 06:08:48 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c98d5093f3sm691820a12.55.2024.10.15.06.08.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Oct 2024 06:08:46 -0700 (PDT)
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
X-Inumbo-ID: 9d726a26-8af6-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728997727; x=1729602527; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfSF5ZDNP06rKpw0Ac2Nx5ynXOi0FYyQceSCYulUZkw=;
        b=HzgODUdrShUlWKzhScLmKs4WvY4ejF7sZnmZHxnHVT4Vi87wO5RUf+9qClT8y31vFr
         UvHHNAK04BS4TIy9wrTWBYb6ZLVyu07yQZ0j8u14lRIiJL7DGFqn8pjXCPtCyQdq0ifz
         y+PvbsToXlmzuELF/3mBOdT40FvL1qYHHlSTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728997727; x=1729602527;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sfSF5ZDNP06rKpw0Ac2Nx5ynXOi0FYyQceSCYulUZkw=;
        b=M9ElewRMm7rQ+qVlIl/Nufjud9kfdTC6BfI3FT75LjiRPI+INBQ4LJpXb0oXBj3NYt
         ChQKKEn1f77FrbyMNZuaLEIbhRV089Po9J9qvBIO/bmTNF+/D/hsAHTY+llOodNPI3ZJ
         SmdhzBrTCTl76FDSkGvD7wkNfQJsktfvyMZkpp7NxuJ2HeIrGFmlsE023fJ8uIs5Iflj
         tjAfai2adKT0PUfJzLFdqKd5hzUIZTSVvy7qN3g/H6wy0xq1BLW+JXGbX2THzVMjebtR
         /8AesCz9y1MmyHphbDFD+Lb735+qts6wZdYdFD72eeGaUObfQ2nQI0HmoQtJn4rZCDxz
         m5GA==
X-Forwarded-Encrypted: i=1; AJvYcCXUZ4CZL7TXoTgxzsXFi7Cb/7XyZoU6g8CBcNxlQ3gRK2goZn/0bAnSiNv/rUjDugMkOsQHBIu8OvQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxESqprlJ+YMOW5O9RnM35SCc2xazvC7zvIbPTjBA6/a3Wvmsia
	+KJAvVgTmxjFDrbuSmV19Y7FaAWXVNbOsBzKpUCPXp2vyau0z8LspBV7P/j/bDk=
X-Google-Smtp-Source: AGHT+IHHv1Ow1o4m4nzH+h1oOQta43CiqY9XPSXCVmUjXWhUblDpCeJvtgNkG6SZy8GuO/TEpFavyw==
X-Received: by 2002:a50:cb88:0:b0:5c9:5a96:2863 with SMTP id 4fb4d7f45d1cf-5c95ac1582emr7425406a12.13.1728997727509;
        Tue, 15 Oct 2024 06:08:47 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Oct 2024 14:08:41 +0100
Message-Id: <D4WEJFWKCPNO.1H8D6FJBX979I@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Xen-devel" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 08/11] xen/lib: Add topology generator for x86
X-Mailer: aerc 0.18.2
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
 <20241001123807.605-9-alejandro.vallejo@cloud.com>
 <7595b3ab-0891-42f7-81b0-5666651046b9@suse.com>
 <D4RGXLJZQ6MA.1B1ND4RWZESBE@cloud.com>
 <b6eb6268-9155-48cd-9b00-bc34f8d4a01b@suse.com>
In-Reply-To: <b6eb6268-9155-48cd-9b00-bc34f8d4a01b@suse.com>

On Thu Oct 10, 2024 at 8:54 AM BST, Jan Beulich wrote:
> On 09.10.2024 19:57, Alejandro Vallejo wrote:
> > On Wed Oct 9, 2024 at 3:45 PM BST, Jan Beulich wrote:
> >> On 01.10.2024 14:38, Alejandro Vallejo wrote:
> >>> --- a/xen/lib/x86/policy.c
> >>> +++ b/xen/lib/x86/policy.c
> >>> @@ -2,6 +2,94 @@
> >>> =20
> >>>  #include <xen/lib/x86/cpu-policy.h>
> >>> =20
> >>> +static unsigned int order(unsigned int n)
> >>> +{
> >>> +    ASSERT(n); /* clz(0) is UB */
> >>> +
> >>> +    return 8 * sizeof(n) - __builtin_clz(n);
> >>> +}
> >>> +
> >>> +int x86_topo_from_parts(struct cpu_policy *p,
> >>> +                        unsigned int threads_per_core,
> >>> +                        unsigned int cores_per_pkg)
> >>> +{
> >>> +    unsigned int threads_per_pkg =3D threads_per_core * cores_per_pk=
g;
> >>
> >> What about the (admittedly absurd) case of this overflowing?
> >=20
> > Each of them individually could overflow the fields in which they are u=
sed.
> >=20
> > Does returning EINVAL if either threads_per_core or cores_per_pkg overf=
low the
> > INTEL structure j
>
> The sentence looks unfinished, so I can only vaguely say that my answer t=
o
> the question would likely be "yes".

It was indeed. Regardless, the number of bits available in Intel's cache
subleaves is rather limited, so I'll be clipping those to the maximum on
overflow and...

>
> >>> +    switch ( p->x86_vendor )
> >>> +    {
> >>> +    case X86_VENDOR_INTEL: {
> >>> +        struct cpuid_cache_leaf *sl =3D p->cache.subleaf;
> >>> +
> >>> +        for ( size_t i =3D 0; sl->type &&
> >>> +                            i < ARRAY_SIZE(p->cache.raw); i++, sl++ =
)
> >>> +        {
> >>> +            sl->cores_per_package =3D cores_per_pkg - 1;
> >>> +            sl->threads_per_cache =3D threads_per_core - 1;
> >>> +            if ( sl->type =3D=3D 3 /* unified cache */ )
> >>> +                sl->threads_per_cache =3D threads_per_pkg - 1;
> >>
> >> I wasn't able to find documentation for this, well, anomaly. Can you p=
lease
> >> point me at where this is spelled out?
> >=20
> > That's showing all unified caches as caches covering the whole package.=
 We
> > could do it the other way around (but I don't want to reverse engineer =
what the
> > host policy says because that's irrelevant). There's nothing in the SDM=
 (AFAIK)
> > forcing L2 or L3 to behave one way or another, so we get to choose. I t=
hought
> > it more helpful to make all unified caches unified across the package. =
to give
> > more information in the leaf.
> >=20
> > My own system exposes 2 unified caches (data trimmed for space):
> >=20
> > ``` cpuid
> >=20
> >    deterministic cache parameters (4):
> >       --- cache 0 ---
> >       cache type                         =3D data cache (1)
> >       cache level                        =3D 0x1 (1)
> >       maximum IDs for CPUs sharing cache =3D 0x1 (1)
> >       maximum IDs for cores in pkg       =3D 0xf (15)
> >       --- cache 1 ---
> >       cache type                         =3D instruction cache (2)
> >       cache level                        =3D 0x1 (1)
> >       maximum IDs for CPUs sharing cache =3D 0x1 (1)
> >       maximum IDs for cores in pkg       =3D 0xf (15)
> >       --- cache 2 ---
> >       cache type                         =3D unified cache (3)
> >       cache level                        =3D 0x2 (2)
> >       maximum IDs for CPUs sharing cache =3D 0x1 (1)
>
> Note how this is different ...
>
> >       maximum IDs for cores in pkg       =3D 0xf (15)
> >       --- cache 3 ---
> >       cache type                         =3D unified cache (3)
> >       cache level                        =3D 0x3 (3)
> >       maximum IDs for CPUs sharing cache =3D 0x1f (31)
>
> ... from this, whereas your code would make it the same.
>
> Especially if this is something you do beyond / outside the spec, it imo
> needs reasoning about in fair detail in the description.

... given the risk of clipping, I'll get rid of that conditional too to mak=
e it
easier for a non-clipped number to be reported.

I'll write in the commit message the behaviour on overflow for these leaves=
.

>
> Jan

Cheers,
Alejandro

