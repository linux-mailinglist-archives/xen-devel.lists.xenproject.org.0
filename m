Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A48B854B51
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 15:20:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680836.1058996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raG7m-0003iR-4y; Wed, 14 Feb 2024 14:20:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680836.1058996; Wed, 14 Feb 2024 14:20:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raG7m-0003g5-0N; Wed, 14 Feb 2024 14:20:34 +0000
Received: by outflank-mailman (input) for mailman id 680836;
 Wed, 14 Feb 2024 14:20:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U0HE=JX=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1raG7k-0003eC-Go
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 14:20:32 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35063d27-cb44-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 15:20:30 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5638ae09ec1so683773a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 06:20:30 -0800 (PST)
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
X-Inumbo-ID: 35063d27-cb44-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1707920430; x=1708525230; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQOqQYiwVvevA4SrtadQQkQhVXKeL4AfeaO3c9Od7bg=;
        b=o/TsWxFM6leERX5swIRzzYAtcFf1wNYZ8Mv/C1wMWlw5VwRdaDNHdEKJRgF4ZmTwuy
         9pkItyrh2KdLe7uZXFcfrrttfMsWCRR0KLNdfQ95PGlaDzhZ+fVqBi1GPghiNCVEpgg6
         aXAULiH3O9dP/PYrl2dxZqpKcf51Wxa9z808JEJfYq3KP2qQ7khRGqAKrj+8RJ7rti1+
         b6uGcgAqYQXnblK4CwAz9UWSxCEhF3rA6hPYeBy/CAwHuGhFyx92h1v1RDhS/YPqQw+h
         r2O9lslawo09yGlURLUdFtxBsoHmCqXI1/zmuDelUMxJRFj8bPBZrWsHgM+asXEnN2cq
         8dKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707920430; x=1708525230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQOqQYiwVvevA4SrtadQQkQhVXKeL4AfeaO3c9Od7bg=;
        b=G14Q+rCPFnd1syA2ebQyCPzvY9GX7SxpzwT//LdtEM8kUOXMMXF22DggXJ2VNol1kC
         mdj/4FQiCLxM7MLHZdO0EteRfuvuh1PvtOCwKmDrgxfo2r58h7ual3tIIZDLbpMHqNgq
         2F3KAr1wgbtwSd8QQTAG2FGTawxQHn6/jmekAYNf5MdlXWOo3LsreBOHL1neAf0DcNgk
         jtJKa797fuCHZ66Po5MRwU5p9gAK2qrPkHuj7VwVafJK4lL3reuYZoPhXrVEH5G2yrZX
         2To4TegO0NXbAS3J5k+01Eieh4uDKzEeBNg2D39LqQCCgU8JS5Mgr7EJTzO5J8ETvOjk
         s/sg==
X-Forwarded-Encrypted: i=1; AJvYcCXArkL0ljF0zC3N4cwRbtLqeDBF9DDf7YCvQFnuQnGg7tEqjQcj/6Ru9SM93WVcUkrZTbMdcIGgz3X+UIMnfixLgV1393KMlZqQx+0QVuw=
X-Gm-Message-State: AOJu0YyWHvTVDfYTaI19GxU7mhcYXU+oV135M0qc3i7WksWVVcmrCxg0
	tTZtsPgY5EbZ/7x+CJGm1Z3EUHwPMpV/qlleXRDKDVEyqxzSo8vxrnifmkYrB2XUpEaCVBIE9AN
	5zTC844xhyvEG/FDqx1eeQqj8UQ43sJFI9VG7cMdYXQh7AzmOWiE=
X-Google-Smtp-Source: AGHT+IEy10UAcKZPzraZU2Omj/AkivtWdzVsN1J9VieFBGFIuiXzUlRy2hsXf2UkVocfOuvrm3TVzm6lDqE4s+0v5xg=
X-Received: by 2002:aa7:c1d8:0:b0:561:f7d9:d77e with SMTP id
 d24-20020aa7c1d8000000b00561f7d9d77emr1877818edp.10.1707920429896; Wed, 14
 Feb 2024 06:20:29 -0800 (PST)
MIME-Version: 1.0
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-15-carlo.nonato@minervasys.tech> <a66e3131-1de1-49cb-9b26-5fb1fd77bc20@suse.com>
 <CAG+AhRWv5MazB-txmPkcb3CAuWFQvM97HH3D-_bn6r3kdB360A@mail.gmail.com> <0feb6a90-2c3e-489f-90de-b4b2979997dd@suse.com>
In-Reply-To: <0feb6a90-2c3e-489f-90de-b4b2979997dd@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Wed, 14 Feb 2024 15:20:18 +0100
Message-ID: <CAG+AhRW-MGkGcXUA5=TtiMFqvDpsYmdGN1d2nCPfCPqXNKA9Gw@mail.gmail.com>
Subject: Re: [PATCH v6 14/15] xen/arm: add cache coloring support for Xen
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

On Wed, Feb 14, 2024 at 8:55=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 13.02.2024 18:29, Carlo Nonato wrote:
> > On Tue, Feb 13, 2024 at 4:25=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >> On 29.01.2024 18:18, Carlo Nonato wrote:
> >>> @@ -218,9 +230,44 @@ static void xen_pt_enforce_wnx(void)
> >>> --- a/xen/common/llc-coloring.c
> >>> +++ b/xen/common/llc-coloring.c
> >>> @@ -29,6 +29,8 @@ static unsigned int __ro_after_init xen_num_colors;
> >>>
> >>>  #define mfn_color_mask              (max_nr_colors - 1)
> >>>  #define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)
> >>> +#define mfn_set_color(mfn, color)   (_mfn((mfn_x(mfn) & ~mfn_color_m=
ask) | \
> >>> +                                     (color)))
> >>
> >> Nit: The wrapped line wants further indenting, such that it becomes
> >> immediately clear what parentheses are still open. Alternatively:
> >>
> >> #define mfn_set_color(mfn, color) \
> >>     (_mfn((mfn_x(mfn) & ~mfn_color_mask) | (color)))
> >>
> >> This is certainly an "interesting" construct: I, for one, wouldn't exp=
ect
> >> that setting the color actually changes the MFN.
> >
> > Would something like mfn_with_color() be a better name? I need somethin=
g that
> > expresses clearly that something will be returned. Maybe colored_mfn() =
is even
> > better?
>
> The latter reads as if it was a predicate, not a transformation. The form=
er
> or get_mfn_with_color() _may_ be okay. Without the get_ it's still a litt=
le
> predicate-like, while the get_ itself somewhat collides with other uses o=
f
> that prefix, specifically e.g. get_page{,_type}(). So I'm still not overl=
y
> happy, yet e.g. mfn_from_mfn_and_color() feels clumsy to me.

For the moment get_mfn_with_color() seems the best option.

> >>> --- a/xen/include/xen/llc-coloring.h
> >>> +++ b/xen/include/xen/llc-coloring.h
> >>> @@ -24,6 +24,17 @@ static inline void domain_llc_coloring_free(struct=
 domain *d) {}
> >>>  static inline void domain_dump_llc_colors(const struct domain *d) {}
> >>>  #endif
> >>>
> >>> +/**
> >>> + * Iterate over each Xen mfn in the colored space.
> >>> + * @mfn:    the current mfn. The first non colored mfn must be provi=
ded as the
> >>> + *          starting point.
> >>> + * @i:      loop index.
> >>> + */
> >>> +#define for_each_xen_colored_mfn(mfn, i)        \
> >>> +    for ( i =3D 0, mfn =3D xen_colored_mfn(mfn);    \
> >>> +          i < (_end - _start) >> PAGE_SHIFT;    \
> >>> +          i++, mfn =3D xen_colored_mfn(mfn_add(mfn, 1)) )
> >>
> >> While the comment mentions it, I still consider it problematic that
> >> - unlike other for_each_* constructs we have - this requires one of
> >> the iteration variables to be set up front. Question is why it needs
> >> to be that way: Isn't it the MFN underlying _start which you mean to
> >> start from?
> >
> > As said above, this is used also when page tables setup isn't complete
> > so I can't easily find the first MFN.
>
> Did you consider making the initial value a macro parameter then?

Yes, this is better.

Thanks.

> Jan

