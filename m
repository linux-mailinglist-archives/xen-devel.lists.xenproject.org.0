Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0698A9973DF
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 19:58:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815070.1228802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syawh-00046v-4C; Wed, 09 Oct 2024 17:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815070.1228802; Wed, 09 Oct 2024 17:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syawh-000446-13; Wed, 09 Oct 2024 17:57:59 +0000
Received: by outflank-mailman (input) for mailman id 815070;
 Wed, 09 Oct 2024 17:57:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hyzk=RF=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1syawf-00041L-1z
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 17:57:57 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 027bae9a-8668-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 19:57:54 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a994cd82a3bso12215666b.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 10:57:54 -0700 (PDT)
Received: from localhost ([52.174.59.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99399c6735sm641169366b.9.2024.10.09.10.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 10:57:53 -0700 (PDT)
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
X-Inumbo-ID: 027bae9a-8668-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728496674; x=1729101474; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxmrWvwuDGeOZGRzbQ+5ALcxHDIgzyvEYBIv0aaYrAs=;
        b=XpSMsy7fRyRGca3SBQhWUNKOeMfItzOTfPZHL/7LMQoMwZxLsOZn16LUhm7orINKlp
         /QC9hyYodVgIFysxsvG8TKGGpY2aTfz7lKoxAqzNoEuXm+VK0JdBoadBEV2Aub1d1Q5J
         oELOXJ0xFuKmH3+nsBqhgzJw4VRQOVPNlgEZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728496674; x=1729101474;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KxmrWvwuDGeOZGRzbQ+5ALcxHDIgzyvEYBIv0aaYrAs=;
        b=mL7jpNW687id202A4saOxOiRIwlLfS3nGAA8IbfENY2hCChhdvX97y+ObwpEauK4Tq
         tQxCFwHNcBwoVVQTZ3g51BSduHM4U7bRImmFimmu20+wjrKUdSYRJ07Zpb2QNOfF6TPI
         AvQJcUWKp/ZNw9wsueJ8Ax1mIbk9OStJhleP4eNlnBcw4C1s1WuO1nJzOKI4h5JyT4Ao
         w/TOiF9djPetftX50hpP0yzQoKYMP1p4/KaOaQ3cRhTEGE4MVyaZHzC5Tgxvxq6TSfnb
         QPX9o7oRNHCNUWiVaicd0qNcHeFvFU41tluEM85cFiaqXMD7SQLjCs25lYBRPnVqUP6q
         2Ttg==
X-Forwarded-Encrypted: i=1; AJvYcCULQpq7VYx7/Hjyu5UugQiOcUhlusTRXe+h9+9zfrN2dJJ97lST40ZgZRLUVf/Ag77epg90jQ09FY8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6bSjv/+qZYIOsW3FQ+3xWVkbC+sBGOAqp7iunRjNB/ou6kjt8
	Zc+L2n7+TisQvqpllO4IzKskJueNfomHRxMKJpZsNJ0KQ80S+AQdKeA1EMCMR9c=
X-Google-Smtp-Source: AGHT+IEgveE69ThRQ45ONzllu+WEsUMPsir1Lg/zmgCUTYDncwiSJ6NqpuxasQ79X2Bf1aKyN3zDEg==
X-Received: by 2002:a17:907:3faa:b0:a99:39ef:59fc with SMTP id a640c23a62f3a-a998d19fbb6mr326107666b.15.1728496674243;
        Wed, 09 Oct 2024 10:57:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Oct 2024 18:57:53 +0100
Message-Id: <D4RGXLJZQ6MA.1B1ND4RWZESBE@cloud.com>
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
In-Reply-To: <7595b3ab-0891-42f7-81b0-5666651046b9@suse.com>

On Wed Oct 9, 2024 at 3:45 PM BST, Jan Beulich wrote:
> On 01.10.2024 14:38, Alejandro Vallejo wrote:
> > --- a/xen/include/xen/lib/x86/cpu-policy.h
> > +++ b/xen/include/xen/lib/x86/cpu-policy.h
> > @@ -542,6 +542,22 @@ int x86_cpu_policies_are_compatible(const struct c=
pu_policy *host,
> >                                      const struct cpu_policy *guest,
> >                                      struct cpu_policy_errors *err);
> > =20
> > +/**
> > + * Synthesise topology information in `p` given high-level constraints
> > + *
> > + * Topology is given in various fields accross several leaves, some of
> > + * which are vendor-specific. This function uses the policy itself to
> > + * derive such leaves from threads/core and cores/package.
>
> Isn't it more like s/uses/fills/ (and the rest of the sentence then
> possibly adjust some to match)? The policy looks to be purely an output
> here (except for the vendor field).

Sure.

>
> > --- a/xen/lib/x86/policy.c
> > +++ b/xen/lib/x86/policy.c
> > @@ -2,6 +2,94 @@
> > =20
> >  #include <xen/lib/x86/cpu-policy.h>
> > =20
> > +static unsigned int order(unsigned int n)
> > +{
> > +    ASSERT(n); /* clz(0) is UB */
> > +
> > +    return 8 * sizeof(n) - __builtin_clz(n);
> > +}
> > +
> > +int x86_topo_from_parts(struct cpu_policy *p,
> > +                        unsigned int threads_per_core,
> > +                        unsigned int cores_per_pkg)
> > +{
> > +    unsigned int threads_per_pkg =3D threads_per_core * cores_per_pkg;
>
> What about the (admittedly absurd) case of this overflowing?

Each of them individually could overflow the fields in which they are used.

Does returning EINVAL if either threads_per_core or cores_per_pkg overflow =
the
INTEL structure j

>
> > +    unsigned int apic_id_size;
> > +
> > +    if ( !p || !threads_per_core || !cores_per_pkg )
> > +        return -EINVAL;
> > +
> > +    p->basic.max_leaf =3D MAX(0xb, p->basic.max_leaf);
>
> Better use the type-safe max() (and min() further down)?

Sure

>
> > +    memset(p->topo.raw, 0, sizeof(p->topo.raw));
> > +
> > +    /* thread level */
> > +    p->topo.subleaf[0].nr_logical =3D threads_per_core;
> > +    p->topo.subleaf[0].id_shift =3D 0;
> > +    p->topo.subleaf[0].level =3D 0;
> > +    p->topo.subleaf[0].type =3D 1;
> > +    if ( threads_per_core > 1 )
> > +        p->topo.subleaf[0].id_shift =3D order(threads_per_core - 1);
> > +
> > +    /* core level */
> > +    p->topo.subleaf[1].nr_logical =3D cores_per_pkg;
> > +    if ( p->x86_vendor =3D=3D X86_VENDOR_INTEL )
> > +        p->topo.subleaf[1].nr_logical =3D threads_per_pkg;
> > +    p->topo.subleaf[1].id_shift =3D p->topo.subleaf[0].id_shift;
> > +    p->topo.subleaf[1].level =3D 1;
> > +    p->topo.subleaf[1].type =3D 2;
> > +    if ( cores_per_pkg > 1 )
> > +        p->topo.subleaf[1].id_shift +=3D order(cores_per_pkg - 1);
> > +
> > +    apic_id_size =3D p->topo.subleaf[1].id_shift;
> > +
> > +    /*
> > +     * Contrary to what the name might seem to imply. HTT is an enable=
r for
> > +     * SMP and there's no harm in setting it even with a single vCPU.
> > +     */
> > +    p->basic.htt =3D true;
> > +    p->basic.lppp =3D MIN(0xff, threads_per_pkg);
> > +
> > +    switch ( p->x86_vendor )
> > +    {
> > +    case X86_VENDOR_INTEL: {
> > +        struct cpuid_cache_leaf *sl =3D p->cache.subleaf;
> > +
> > +        for ( size_t i =3D 0; sl->type &&
> > +                            i < ARRAY_SIZE(p->cache.raw); i++, sl++ )
> > +        {
> > +            sl->cores_per_package =3D cores_per_pkg - 1;
> > +            sl->threads_per_cache =3D threads_per_core - 1;
> > +            if ( sl->type =3D=3D 3 /* unified cache */ )
> > +                sl->threads_per_cache =3D threads_per_pkg - 1;
>
> I wasn't able to find documentation for this, well, anomaly. Can you plea=
se
> point me at where this is spelled out?

That's showing all unified caches as caches covering the whole package. We
could do it the other way around (but I don't want to reverse engineer what=
 the
host policy says because that's irrelevant). There's nothing in the SDM (AF=
AIK)
forcing L2 or L3 to behave one way or another, so we get to choose. I thoug=
ht
it more helpful to make all unified caches unified across the package. to g=
ive
more information in the leaf.

My own system exposes 2 unified caches (data trimmed for space):

``` cpuid

   deterministic cache parameters (4):
      --- cache 0 ---
      cache type                         =3D data cache (1)
      cache level                        =3D 0x1 (1)
      maximum IDs for CPUs sharing cache =3D 0x1 (1)
      maximum IDs for cores in pkg       =3D 0xf (15)
      --- cache 1 ---
      cache type                         =3D instruction cache (2)
      cache level                        =3D 0x1 (1)
      maximum IDs for CPUs sharing cache =3D 0x1 (1)
      maximum IDs for cores in pkg       =3D 0xf (15)
      --- cache 2 ---
      cache type                         =3D unified cache (3)
      cache level                        =3D 0x2 (2)
      maximum IDs for CPUs sharing cache =3D 0x1 (1)
      maximum IDs for cores in pkg       =3D 0xf (15)
      --- cache 3 ---
      cache type                         =3D unified cache (3)
      cache level                        =3D 0x3 (3)
      maximum IDs for CPUs sharing cache =3D 0x1f (31)
      maximum IDs for cores in pkg       =3D 0xf (15)
      --- cache 4 ---
      cache type                         =3D no more caches (0)
```

>
> Jan

Cheers,
Alejandro

