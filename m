Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E15F997016
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 17:57:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814874.1228571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZ3t-0007YW-AU; Wed, 09 Oct 2024 15:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814874.1228571; Wed, 09 Oct 2024 15:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZ3t-0007W2-74; Wed, 09 Oct 2024 15:57:17 +0000
Received: by outflank-mailman (input) for mailman id 814874;
 Wed, 09 Oct 2024 15:57:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hyzk=RF=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1syZ3r-0007Sl-4I
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 15:57:15 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 263b9b13-8657-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 17:57:13 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a9960371b62so334850566b.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 08:57:13 -0700 (PDT)
Received: from localhost ([52.166.251.127]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9944839974sm555298266b.218.2024.10.09.08.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 08:57:12 -0700 (PDT)
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
X-Inumbo-ID: 263b9b13-8657-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728489433; x=1729094233; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYXNhzNRG73AjlXGRl78NU1q3MK86m6SRgnKz+EvApg=;
        b=eESdirQmeYWN0wXUX4bbPrauirFcBmO6RtM6TVcNeSFs841SR+5lP2E6txinx8EAe8
         l/Cq3qaQIFD5NcI3MW8jg9/w9sCnJIOppquwCr93oK04upyySOOapUoAyQDd029ft29b
         rphUr8Ki6aTjAwkkWrwuGroO/A3nhop+0KTjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728489433; x=1729094233;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sYXNhzNRG73AjlXGRl78NU1q3MK86m6SRgnKz+EvApg=;
        b=qeQwT4at10m5ityyjkfP6Adc1pzmd2uySPfSEarVQaEjAcOBjW8dzPDB/iiHXjbbW1
         pQND1e+QcPZaubnVBedI0OgCD6CAYQWKo5bW73+o4FKsfmsm5fa5tOBxIMlteeCVcHs7
         i7/LBSVZIZK0jD/yL6xl2eO+bDPzlxxSD/qKYwy/LivbT1RBexcI7BobwZDGVZUjtDXF
         9DtJMTl9n0wbybzstFNqv31gQ9mUZ9aAOE/y1pDmQSV0HAwOcVWmPXEYFlRzveL+Lz8Z
         OGlRvOmaTAmW4R8nLaQTZphrGxbXZeZNtYURz4d4h5I5x93rgWRSj9PGgrbeqC/ySsp0
         GhhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3WIutxTIB5JoTB1KMTjHqtj0jXdrvNA0dZadtO1QPn3cd8L4Iz3pKikbiWWcZmCaiub95BL0qGOs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpY15u1ds28Tks1c2m97EoPQ4hBCghaCeK39Xd1KN3waaV+fU2
	kQcSBEIG0LLlr21K2SLtOV6MQ0iDghOBFmOTWIBVXLmKmIojBzTRuc/LH0Xe/Ck=
X-Google-Smtp-Source: AGHT+IHFZJHe8ZLs0SxvXR97gzHVbytjnh2uk0hJP81YWcbk4O8KTQCfc7GHkvR+GO0SjhOXhl6rJw==
X-Received: by 2002:a17:907:e29c:b0:a99:5629:b3ac with SMTP id a640c23a62f3a-a998d1e4d95mr296123166b.26.1728489432881;
        Wed, 09 Oct 2024 08:57:12 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Oct 2024 16:57:11 +0100
Message-Id: <D4RED6YCM7AH.1QVPIV4K9SB5O@cloud.com>
Cc: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 01/11] lib/x86: Relax checks about policy
 compatibility
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>
X-Mailer: aerc 0.18.2
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
 <20241001123807.605-2-alejandro.vallejo@cloud.com>
 <1a57c4c9-baa9-44b4-8a3f-0f821d8c2484@suse.com>
In-Reply-To: <1a57c4c9-baa9-44b4-8a3f-0f821d8c2484@suse.com>

Hi,

On Wed Oct 9, 2024 at 10:40 AM BST, Jan Beulich wrote:
> On 01.10.2024 14:37, Alejandro Vallejo wrote:
> > --- a/xen/lib/x86/policy.c
> > +++ b/xen/lib/x86/policy.c
> > @@ -15,7 +15,16 @@ int x86_cpu_policies_are_compatible(const struct cpu=
_policy *host,
> >  #define FAIL_MSR(m) \
> >      do { e.msr =3D (m); goto out; } while ( 0 )
> > =20
> > -    if ( guest->basic.max_leaf > host->basic.max_leaf )
> > +    /*
> > +     * Old AMD hardware doesn't expose topology information in leaf 0x=
b. We
> > +     * want to emulate that leaf with credible information because it =
must be
> > +     * present on systems in which we emulate the x2APIC.
> > +     *
> > +     * For that reason, allow the max basic guest leaf to be larger th=
an the
> > +     * hosts' up until 0xb.
> > +     */
> > +    if ( guest->basic.max_leaf > 0xb &&
> > +         guest->basic.max_leaf > host->basic.max_leaf )
> >          FAIL_CPUID(0, NA);
> > =20
> >      if ( guest->feat.max_subleaf > host->feat.max_subleaf )
>
> I'm concerned by this in multiple ways:
>
> 1) It's pretty ad hoc, and hence doesn't make clear how to deal with simi=
lar
> situations in the future.

I agree. I don't have a principled suggestion for how to deal with other ca=
ses
where we might have to bump the max leaf. It may be safe (as is here becasu=
e
everything below it is either used or unimplemnted), but AFAIU some leaves
might be problematic to expose, even as zeroes. I suspect that's the proble=
m
you hint at later on about AMX and AVX10?

>
> 2) Why would we permit going up to leaf 0xb when x2APIC is off in the res=
pective
> leaf?

I assume you mean when the x2APIC is not emulated? One reason is to avoid a
migration barrier, as otherwise we can't migrate VMs created in "leaf
0xb"-capable hardware to non-"leaf 0xb"-capable even though the migration i=
s
perfectly safe.

Also, it's benign and simplifies everything. Otherwise we have to find out
during early creation not only whether the host has leaf 0xb, but also whet=
her
we're emulating an x2APIC or not.

Furthermore, not doing this would actively prevent emulating an x2APIC on A=
MD
Lisbon-like silicon even though it's fine to do so. Note that we have a bro=
ken
invariant in existing code where the x2APIC is emulated and leaf 0xb is not
exposed at all; not even to show the x2APIC IDs.

>
> 3) We similarly force a higher extended leaf in order to accommodate the =
LFENCE-
> is-dispatch-serializing bit. Yet there's no similar extra logic there in =
the
> function here.

That's done on the host policy though, so there's no clash.

In calculate_host_policy()...

```
      /*
       * For AMD/Hygon hardware before Zen3, we unilaterally modify LFENCE =
to be
       * dispatch serialising for Spectre mitigations.  Extend max_extd_lea=
f
       * beyond what hardware supports, to include the feature leaf contain=
ing
       * this information.
       */
      if ( cpu_has_lfence_dispatch )
          max_extd_leaf =3D max(max_extd_leaf, 0x80000021U);
```

One could imagine doing the same for leaf 0xb and dropping this patch, but =
then
we'd have to synthesise something on that leaf for hardware that doesn't ha=
ve
it, which is a lot more annoying.

>
> 4) While there the guest vs host check won't matter, the situation with A=
MX and
> AVX10 leaves imo still wants considering here right away. IOW (taken toge=
ther
> with at least 3) above) I think we need to first settle on a model for
> collectively all max (sub)leaf handling. That in particular needs to prop=
erly
> spell out who's responsible for what (tool stack vs Xen).

I'm not sure I follow. What's the situation with AMX and AVX10 that you ref=
er
to? I'd assume that making ad-hoc decisions on this is pretty much unavoida=
ble,
but maybe the solution to the problem you mention would highlight a more
general approach.

>
> Jan

Cheers,
Alejandro

