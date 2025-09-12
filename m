Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D7AB557E4
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 22:49:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122532.1466151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxAhh-00070P-Sn; Fri, 12 Sep 2025 20:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122532.1466151; Fri, 12 Sep 2025 20:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxAhh-0006xc-Pb; Fri, 12 Sep 2025 20:49:09 +0000
Received: by outflank-mailman (input) for mailman id 1122532;
 Fri, 12 Sep 2025 20:49:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vvzg=3X=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uxAhg-0006xW-Ox
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 20:49:08 +0000
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [2001:4860:4864:20::2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea2e8856-9019-11f0-9809-7dc792cee155;
 Fri, 12 Sep 2025 22:49:03 +0200 (CEST)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-31d6dcb5894so1511679fac.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Sep 2025 13:49:03 -0700 (PDT)
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
X-Inumbo-ID: ea2e8856-9019-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757710142; x=1758314942; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80vY5q580AGu5oGDR0XEBwrWoQUsrpekyF9nEI2MzhU=;
        b=IWBaym0EGLi6so5+rQCgyYhzaG0qCYePam66Z1eGZzCwUZVpQlrBZeNtwC+EU7c+Ph
         443y0+Je7/isrByYDnFZa4BBU4ouP5B/3RsncNXh7vatIwEudNMoLQ/z6oi2w/sWVTJp
         +NgbBquySDRMaNiPs5GIDc4cd2JsGxLO6A3ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757710142; x=1758314942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80vY5q580AGu5oGDR0XEBwrWoQUsrpekyF9nEI2MzhU=;
        b=hzewf00e/jq/Bt+f99lLeLyM9/c9YaWxMcYCyhmliWVevp/KwzUzZUY0zBfSmOGQEI
         Gns+sGrPjmlEtTU6efYoZc/mm90+SNwgzAlD4QDNAhGbST8k/Vlb0xC9qd2bYoB0+REh
         WAt89XELDkhlxyoEOj3qkPax35q+2Ez5oTTFebPLnfLTOqH7CwOPzOkrYZ1EJx8FLzET
         1Vz4fR7/QPWEDLoMt8UU3Q3a5pHUaclpXPoqZzZNIEpiMy2N3TL/sR48Xf4SzKKQ0ZlU
         foZlxSFiPYeWcV6JxziQr/89o0cH8XE4mZXJXS0Rvv2fjckU3LNBL7qprmcbzyc6X7XX
         TjAg==
X-Gm-Message-State: AOJu0YzEROpL0+CEKPB0Wxg+ngAE4w3IiiISbIfsLXcEe6MMiIK79kzz
	rf99w7XReBTGgEVoRSB86VH18ZDMlvC4KzSgoN9f0PnGSfhxKEEkRD+Xqe0Zgy8SmssMZYxFGyv
	8ZO+8xEy5rrYxdrgulN2yCu9N4zqWJx9ETrWdcIx9MQ==
X-Gm-Gg: ASbGncv16hufu0rxunQyRJfVL4STfpgRSwO40TfiQwlO15BwCH2+Fnr+6tmbdrsvX2Q
	F+l4X71k5B4SqYzXjYORU9/l9AaLcYde2FWwZCWgzlTU2rN9a+4vmWNLY7OXmN0IZurn7sHwnGM
	xaHxj6u44NFBGMS9Ncg17WYukl2b4jcu5e9pPx2wNguU4pLEFzoOPO9iJAivBq83TQbU2rF/ML6
	zQVYRU=
X-Google-Smtp-Source: AGHT+IFfWaAq2iJp3XBFzZ5NfCTXZtmbtVwB56IqCJcdt98i3fqoUavP1vQPh+noLTKJU2+QsFzgavZ5t+wVSsw+kVA=
X-Received: by 2002:a05:6870:b28f:b0:2ea:87d7:5a35 with SMTP id
 586e51a60fabf-32e58970d28mr2200477fac.36.1757710141815; Fri, 12 Sep 2025
 13:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250912095744.99181-1-frediano.ziglio@cloud.com> <152377b3-075f-46f1-a17d-eb2aa82c1e82@citrix.com>
In-Reply-To: <152377b3-075f-46f1-a17d-eb2aa82c1e82@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 12 Sep 2025 21:48:49 +0100
X-Gm-Features: Ac12FXxUx923MAvSwEJZULl3skfIRtIxM35aEQC8TOfz_yemD_mJ1v05d3O3OAI
Message-ID: <CACHz=Zh2d0KJgUNOwST2QkcQdPRjuDi48fLxUFe9OF9LS3pDZg@mail.gmail.com>
Subject: Re: [PATCH v3] tools/libs: Use superpages where possible on migrate/resume
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 7:01=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 12/09/2025 10:57 am, Frediano Ziglio wrote:
> > Try to allocate larger order pages.
> > With some test memory program stressing TLB (many small random
> > memory accesses) you can get 15% performance improves.

Checker is suggesting "improvements" instead of "improves" here. Can
you also update this ?

> > On the first memory iteration the sender is currently sending
> > memory in 4mb aligned chunks which allows the receiver to
> > allocate most pages as 2mb superpages instead of single 4kb pages.
> > This works even for HVM where the first 2mb contains some holes.
> > This change does not handle 1gb superpages as this will require
> > change in the protocol to preallocate space.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> Thanks, this is far easier to follow.  A couple of minor things.
>
> > ---
> > Changes since v1:
> > - updated commit message and subject;
> > - change the implementation detecting possible 2mb pages inside
> >   the packet sent allowing more 2mb superpages.
> >
> > Changes since v2:
> > - change implementation simplifying detecting and allocations
> >   of 2mb pages.
> > ---
> >  tools/libs/guest/xg_sr_restore.c | 45 +++++++++++++++++++++++++++++---
> >  1 file changed, 42 insertions(+), 3 deletions(-)
> >
> > diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_=
restore.c
> > index 06231ca826..ea5a137612 100644
> > --- a/tools/libs/guest/xg_sr_restore.c
> > +++ b/tools/libs/guest/xg_sr_restore.c
> > @@ -129,6 +129,30 @@ static int pfn_set_populated(struct xc_sr_context =
*ctx, xen_pfn_t pfn)
> >      return 0;
> >  }
> >
> > +#if defined(__i386__) || defined(__x86_64__)
> > +/* Order of the smallest superpage */
> > +#define SMALL_SUPERPAGE_ORDER 9
> > +#else
> > +#error Define SMALL_SUPERPAGE_ORDER for this platform
> > +#endif
> > +
> > +static bool populate_small_superpage(struct xc_sr_context *ctx, xen_pf=
n_t pfn)
>
> I know the terminology is terrible (this work was what prompted some of
> my clean-up attempts in Xen).
>
> I think we want to s/pfn/gfn/ all across this function.
>
> > +{
> > +    xen_pfn_t mfn =3D pfn;
> > +
> > +    if ( xc_domain_populate_physmap_exact(
> > +         ctx->xch, ctx->domid, 1, SMALL_SUPERPAGE_ORDER, 0, &mfn) )
>
> This needs a comment.
>
> /* XENMEM_populate_physmap has no coherent error semantics.  Assume a
> failure here is ENOMEM, and fall back to allocating small pages. */
>
> (Yes, the physmap hypercalls are insane.  The only error feedback is "I
> completed this many before something went wrong", and libxenctrl chooses
> EBUSY for want of anything better.)
>
> > +        return false;
> > +
> > +    if ( mfn =3D=3D INVALID_MFN )
> > +        return false;
> > +
> > +    for ( size_t i =3D 0; i < (1 << SMALL_SUPERPAGE_ORDER); ++i )
> > +        ctx->restore.ops.set_gfn(ctx, pfn + i, mfn + i);
> > +
> > +    return true;
> > +}
> > +
> >  /*
> >   * Given a set of pfns, obtain memory from Xen to fill the physmap for=
 the
> >   * unpopulated subset.  If types is NULL, no page type checking is per=
formed
> > @@ -142,6 +166,9 @@ int populate_pfns(struct xc_sr_context *ctx, unsign=
ed int count,
> >          *pfns =3D malloc(count * sizeof(*pfns));
> >      unsigned int i, nr_pfns =3D 0;
> >      int rc =3D -1;
> > +    xen_pfn_t prev =3D 0;
> > +    unsigned num_contiguous =3D 0;
> > +    xen_pfn_t mask =3D ~((~(xen_pfn_t)0) << SMALL_SUPERPAGE_ORDER);
>
> (1ULL << SMALL_SUPERPAGE_ORDER) - 1; is the more normal way of writing th=
is.
>
> >
> >      if ( !mfns || !pfns )
> >      {
> > @@ -152,14 +179,26 @@ int populate_pfns(struct xc_sr_context *ctx, unsi=
gned int count,
> >
> >      for ( i =3D 0; i < count; ++i )
> >      {
> > +        xen_pfn_t pfn =3D original_pfns[i];
> > +
> >          if ( (!types || page_type_to_populate(types[i])) &&
> > -             !pfn_is_populated(ctx, original_pfns[i]) )
> > +             !pfn_is_populated(ctx, pfn) )
> >          {
> > -            rc =3D pfn_set_populated(ctx, original_pfns[i]);
> > +            rc =3D pfn_set_populated(ctx, pfn);
> >              if ( rc )
> >                  goto err;
> > -            pfns[nr_pfns] =3D mfns[nr_pfns] =3D original_pfns[i];
> > +            pfns[nr_pfns] =3D mfns[nr_pfns] =3D pfn;
> >              ++nr_pfns;
>
> /* For x86 HVM guests in the first pass, PAGE_DATA records contain
> metadata about 4M aligned chunks of GFN space.  Reconstruct 2M
> superpages where possible. */
>
> I'm happy to fix these all on commit, if you're happy?
>

Yes, fine with all changes.
> ~Andrew
>

Frediano

