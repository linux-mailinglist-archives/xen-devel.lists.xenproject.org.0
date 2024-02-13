Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD63F8537CC
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 18:29:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680101.1057961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZwaw-0003wq-Ft; Tue, 13 Feb 2024 17:29:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680101.1057961; Tue, 13 Feb 2024 17:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZwaw-0003tx-C1; Tue, 13 Feb 2024 17:29:22 +0000
Received: by outflank-mailman (input) for mailman id 680101;
 Tue, 13 Feb 2024 17:29:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+p2Q=JW=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rZwau-0003tr-O1
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 17:29:20 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a6a19c7-ca95-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 18:29:18 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-55a5e7fa471so6062771a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 09:29:18 -0800 (PST)
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
X-Inumbo-ID: 6a6a19c7-ca95-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1707845357; x=1708450157; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muIebV+W/RdZ27uw8bvqR+a4qPrA/i3ZssrE3Qct38I=;
        b=wrSWeN23NZLJahgIqlbFN5CLe0TvK7Rcn1eYCyHXAk6uPwB9sz/rt0aX4EFycKuWgX
         bcZrD2aG1Ps8+w0nx6ijtLY+396qSiLnTrlYR/SYeD4aAjROZpS7D1kiblOFhcs3XpBZ
         pV6WAbyvl32aodtZ1qXywMZWyHUj6weSi8O0hO3G8z/SsL/kQZ5VaTIeyIShsZg+hYaK
         9jKRZBe2UC65y4SJ9p+NtynhUa/jiLnlVyrjYacVj50c2nypOReDZnSgyv6ry1Eq3Bv8
         E9k0EAPo9Nrwwogc05dHV7GTq1UrDqwpCwwhoMyzl+7dDTUythClGaCFuahQVOSW2x8v
         UzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707845357; x=1708450157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muIebV+W/RdZ27uw8bvqR+a4qPrA/i3ZssrE3Qct38I=;
        b=VmYTqLTqfFf0dsQ1XupvV78QU84DclUoX3GBYKeRSBak4upeq2C2h5pMpUdpLhwQ7c
         oaTeWYWhEUXyG4dMHed9G6mjXTvRThvrSkTSJ/EneNCcFbwtK+bEJO7WxpulGKzPgk5e
         4LbUG4+oejTkhHOVstXW7VPHBw8WmNceHqCkcyuZ+AGz7+L1kgy3NlL5ifUMz9SNglmu
         FOO7Y7qsenHI1sVHEykKhcTbFmqJrboK3gTFKkW1GoGp5oQULmA+uYYNgI9O7dveEUPs
         QmemPimNQnjamupAl9CkbYfiXI/usfbxeA9P+KdD33P9VEo58kChGsj7HNDQBtkSxkqc
         C0Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUZsku4JeXq1vVS/sJ84geOgKX1wzdfEDXfP+KI2bH5fjzoCj9T8x4pibMnqvtW7E+owz9gz6k/u6ymC53U6CazvDl9vkn4dpFPmjdCyNQ=
X-Gm-Message-State: AOJu0YwUsMUpsVIOkGOankHrACU8W7f2+TXDZ9IkAlvrOvhhonDk1Urt
	7mbJn0UZC/0uGDfwQcPr5uo1al76+vjpOLuU99jRs3POF7iGxfvGcYNyHiIRUqpb5Iud6Y0NyIr
	88sFa1BqtDLTaF/x4iSU7HjllN1bXZXGJEWZpsw==
X-Google-Smtp-Source: AGHT+IHP0agWiBWig7PXo8/j41xPowJvxfMpGGOdBeAE7QxRcWvzJFwcKyI63AV7GDDKpSXkkYCLX6w/TO0sphSD9s4=
X-Received: by 2002:a05:6402:88c:b0:561:8918:9f5f with SMTP id
 e12-20020a056402088c00b0056189189f5fmr232398edy.24.1707845357478; Tue, 13 Feb
 2024 09:29:17 -0800 (PST)
MIME-Version: 1.0
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-15-carlo.nonato@minervasys.tech> <a66e3131-1de1-49cb-9b26-5fb1fd77bc20@suse.com>
In-Reply-To: <a66e3131-1de1-49cb-9b26-5fb1fd77bc20@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Tue, 13 Feb 2024 18:29:06 +0100
Message-ID: <CAG+AhRWv5MazB-txmPkcb3CAuWFQvM97HH3D-_bn6r3kdB360A@mail.gmail.com>
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

On Tue, Feb 13, 2024 at 4:25=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 29.01.2024 18:18, Carlo Nonato wrote:
> > @@ -218,9 +230,44 @@ static void xen_pt_enforce_wnx(void)
> >      flush_xen_tlb_local();
> >  }
> >
> > +static void __init create_llc_coloring_mappings(void)
> > +{
> > +    lpae_t pte;
> > +    unsigned int i;
> > +    struct bootmodule *xen_bootmodule =3D boot_module_find_by_kind(BOO=
TMOD_XEN);
> > +    mfn_t mfn =3D maddr_to_mfn(xen_bootmodule->start);
> > +
> > +    for_each_xen_colored_mfn( mfn, i )
>
> Nit: Either you consider the construct a pseudo-keyword, then
>
>     for_each_xen_colored_mfn ( mfn, i )
>
> or you don't, then
>
>     for_each_xen_colored_mfn(mfn, i)
>
> please.
>
> > --- a/xen/common/llc-coloring.c
> > +++ b/xen/common/llc-coloring.c
> > @@ -29,6 +29,8 @@ static unsigned int __ro_after_init xen_num_colors;
> >
> >  #define mfn_color_mask              (max_nr_colors - 1)
> >  #define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)
> > +#define mfn_set_color(mfn, color)   (_mfn((mfn_x(mfn) & ~mfn_color_mas=
k) | \
> > +                                     (color)))
>
> Nit: The wrapped line wants further indenting, such that it becomes
> immediately clear what parentheses are still open. Alternatively:
>
> #define mfn_set_color(mfn, color) \
>     (_mfn((mfn_x(mfn) & ~mfn_color_mask) | (color)))
>
> This is certainly an "interesting" construct: I, for one, wouldn't expect
> that setting the color actually changes the MFN.

Would something like mfn_with_color() be a better name? I need something th=
at
expresses clearly that something will be returned. Maybe colored_mfn() is e=
ven
better?

> > @@ -316,6 +318,27 @@ unsigned int get_max_nr_llc_colors(void)
> >      return max_nr_colors;
> >  }
> >
> > +paddr_t __init xen_colored_map_size(void)
> > +{
> > +    return ROUNDUP((_end - _start) * max_nr_colors, XEN_PADDR_ALIGN);
> > +}
> > +
> > +mfn_t __init xen_colored_mfn(mfn_t mfn)
> > +{
> > +    unsigned int i, color =3D mfn_to_color(mfn);
> > +
> > +    for( i =3D 0; i < xen_num_colors; i++ )
>
> Nit: Missing blank.
>
> > +    {
> > +        if ( color =3D=3D xen_colors[i] )
> > +            return mfn;
> > +        else if ( color < xen_colors[i] )
> > +            return mfn_set_color(mfn, xen_colors[i]);
>
> How do you know that this or ...
>
> > +    }
> > +
> > +    /* Jump to next color space (max_nr_colors mfns) and use the first=
 color */
> > +    return mfn_set_color(mfn_add(mfn, max_nr_colors), xen_colors[0]);
>
> ... this MFN are actually valid and in (available) RAM?

Xen must be relocated in a valid and available physically colored space.
In arm we do that by searching in RAM for a contiguous region that can cont=
ain
the colored version of Xen (including "holes" of memory that is skipped due=
 to
coloring). So we know that if mfn is in this region then the computed color=
ed
MFN is in the same valid region as well. I should ASSERT that somehow.
This should be something like virt_to_mfn(_start) < mfn < virt_to_mfn(_end)
(abusing a bit of syntax), but the problem is that this function is called
also when page tables are still not set so I can't count on virt_to_mfn().

> > --- a/xen/include/xen/llc-coloring.h
> > +++ b/xen/include/xen/llc-coloring.h
> > @@ -24,6 +24,17 @@ static inline void domain_llc_coloring_free(struct d=
omain *d) {}
> >  static inline void domain_dump_llc_colors(const struct domain *d) {}
> >  #endif
> >
> > +/**
> > + * Iterate over each Xen mfn in the colored space.
> > + * @mfn:    the current mfn. The first non colored mfn must be provide=
d as the
> > + *          starting point.
> > + * @i:      loop index.
> > + */
> > +#define for_each_xen_colored_mfn(mfn, i)        \
> > +    for ( i =3D 0, mfn =3D xen_colored_mfn(mfn);    \
> > +          i < (_end - _start) >> PAGE_SHIFT;    \
> > +          i++, mfn =3D xen_colored_mfn(mfn_add(mfn, 1)) )
>
> While the comment mentions it, I still consider it problematic that
> - unlike other for_each_* constructs we have - this requires one of
> the iteration variables to be set up front. Question is why it needs
> to be that way: Isn't it the MFN underlying _start which you mean to
> start from?

As said above, this is used also when page tables setup isn't complete
so I can't easily find the first MFN.

Thanks.

> Jan

