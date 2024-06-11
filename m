Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E5990396C
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 13:01:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738283.1144996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGzF4-0001LU-Kb; Tue, 11 Jun 2024 11:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738283.1144996; Tue, 11 Jun 2024 11:00:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGzF4-0001IY-Gv; Tue, 11 Jun 2024 11:00:42 +0000
Received: by outflank-mailman (input) for mailman id 738283;
 Tue, 11 Jun 2024 11:00:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H2Xh=NN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sGzF2-0001IS-VY
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 11:00:41 +0000
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com
 [103.168.172.150]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5852f22-27e1-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 13:00:38 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailfout.nyi.internal (Postfix) with ESMTP id 0015A13801CB;
 Tue, 11 Jun 2024 07:00:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 11 Jun 2024 07:00:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Jun 2024 07:00:35 -0400 (EDT)
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
X-Inumbo-ID: d5852f22-27e1-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718103636;
	 x=1718190036; bh=i54ZzkY4GG39UCWRf8HO44rFoz7nuZMFD/2hx/uPmfw=; b=
	Ps2BKSMq55JT2j/zRerg6+E8zgQaaqODxqMPCTGllTtamckrWajPtoXo+rtLVWUM
	cvIjdRop1ZC6MMGABOCUkzd3LhbRWJfQzigTzHmqrAtUsttjwlr+oIWBaCdzVXdf
	8wfzFluATkYmHBa0Z5UeObbL9LF9WFfEBcLFZC2+at9iNohaH8CAuAuUkpVz90Mc
	LFirZive77sttZOBBlx8YesixpTEnupMk+QQpbHgOSMJ2LFTTKSqOaEaAp6uD/ZS
	KZaFCTnXwLaRUgPBjsjwau5T2DNNOtO7Jz0fOoSNc0bfsYtHT6ox1g6ZsY4FlmXI
	pOHSsGYocW/KP9/DVDv0KA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718103636; x=1718190036; bh=i54ZzkY4GG39UCWRf8HO44rFoz7n
	uZMFD/2hx/uPmfw=; b=WRwYTaKMKYjv05d5mflmS9JUGl4Nty7qQZwt6NVpziuR
	O84ulCZuddIaHycY9IdrDYbCxp+XnZ12gGLzza+bz14AVKgg8uINTC/4BJrYclaZ
	80O/rep90RRjWlaxoqaP86lSWHBZRj77p/JMlFZ1E8BBr+hCv/MPKQiucppg9eUV
	4qD7m78Bx7SSHRSn1iz/xaH+KAG7alAkbK9uat5kUt4ixuna+Os8dJaFVwhR8329
	UxLEG8ExDrV4KT3kJTSK5tHwXSl8M0bb1YOFcUjKk5mUNpoP1S8ERAqaE5tIMXWv
	VuUAAm3ePW3lnGpbg3BAdp7QMp4K1GfIfqDYKKteSw==
X-ME-Sender: <xms:VC5oZpez32FjW-YjZX0tOkVEHfWZH5ET92dcXY-vP3KHSuVy0bKYwQ>
    <xme:VC5oZnM9w3CUk7wOCvCIKBmEFeghf-5CY9sMYkAMElAUnZLYK-1nsBQ5s28oYTUPI
    2nDJMu4GYj3lg>
X-ME-Received: <xmr:VC5oZijUusMzaPdwz7euDeefr3EdiAL82-Awpfr2GfP6Zd5QQP4vSoIakrvS6hWX8iRh6N_Ytcrk4KPcv-qqwus9-latZ-WRhw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduvddgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:VC5oZi-x67odXBvIGFjupn0TbgU6vCLpLWyRLVC30JTQCeHZYpNDmQ>
    <xmx:VC5oZltvIq3OwZj7WWId2dYx27swdrwuK5OuZboouFYplYm3o5Cqzg>
    <xmx:VC5oZhHIf7pjCiVdMphYd0H5UOyehn1sGkljdXCAYx8S9BCkH1XlwA>
    <xmx:VC5oZsMGcdZI76Mn4s9XlxAMtiln6Y2o4dLDRMkWrPtVBKmlgiSnqQ>
    <xmx:VC5oZtK-2MbP5GZDff9iFm0hFBS72gRcfVCvayfotSwnz_Ll2P0_DeD2>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 11 Jun 2024 13:00:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 1/2] x86/mm: add API for marking only part of a MMIO
 page read only
Message-ID: <ZmguUCL4Ggb66wxL@mail-itl>
References: <cover.68462f37276d69ab6e268be94d049f866a321f73.1716392340.git-series.marmarek@invisiblethingslab.com>
 <30562c807ff2e434731a76d7110d48614a58884b.1716392340.git-series.marmarek@invisiblethingslab.com>
 <d2ce1c48-fd95-47f9-b821-8e01d5006e8e@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Wol1ROn3KyGiQtoL"
Content-Disposition: inline
In-Reply-To: <d2ce1c48-fd95-47f9-b821-8e01d5006e8e@suse.com>


--Wol1ROn3KyGiQtoL
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Jun 2024 13:00:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 1/2] x86/mm: add API for marking only part of a MMIO
 page read only

On Fri, Jun 07, 2024 at 09:01:25AM +0200, Jan Beulich wrote:
> On 22.05.2024 17:39, Marek Marczykowski-G=C3=B3recki wrote:
> > --- a/xen/arch/x86/include/asm/mm.h
> > +++ b/xen/arch/x86/include/asm/mm.h
> > @@ -522,9 +522,34 @@ extern struct rangeset *mmio_ro_ranges;
> >  void memguard_guard_stack(void *p);
> >  void memguard_unguard_stack(void *p);
> > =20
> > +/*
> > + * Add more precise r/o marking for a MMIO page. Range specified here
> > + * will still be R/O, but the rest of the page (not marked as R/O via =
another
> > + * call) will have writes passed through.
> > + * The start address and the size must be aligned to MMIO_RO_SUBPAGE_G=
RAN.
> > + *
> > + * This API cannot be used for overlapping ranges, nor for pages alrea=
dy added
> > + * to mmio_ro_ranges separately.
> > + *
> > + * Since there is currently no subpage_mmio_ro_remove(), relevant devi=
ce should
> > + * not be hot-unplugged.
>=20
> Yet there are no guarantees whatsoever. I think we should refuse
> hot-unplug attempts (not just here, but also e.g. for an EHCI
> controller that we use the debug feature of), but doing so would
> likely require coordination with Dom0. Nothing to be done right
> here, of course.
>=20
> > + * Return values:
> > + *  - negative: error
> > + *  - 0: success
> > + */
> > +#define MMIO_RO_SUBPAGE_GRAN 8
> > +int subpage_mmio_ro_add(paddr_t start, size_t size);
> > +#ifdef CONFIG_HVM
> > +bool subpage_mmio_write_accept(mfn_t mfn, unsigned long gla);
> > +#endif
>=20
> I'd suggest to omit the #ifdef here. The declaration alone doesn't
> hurt, and the #ifdef harms readability (if only a bit).

Ok.


> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -150,6 +150,17 @@ bool __read_mostly machine_to_phys_mapping_valid;
> > =20
> >  struct rangeset *__read_mostly mmio_ro_ranges;
> > =20
> > +/* Handling sub-page read-only MMIO regions */
> > +struct subpage_ro_range {
> > +    struct list_head list;
> > +    mfn_t mfn;
> > +    void __iomem *mapped;
> > +    DECLARE_BITMAP(ro_elems, PAGE_SIZE / MMIO_RO_SUBPAGE_GRAN);
> > +};
> > +
> > +static LIST_HEAD(subpage_ro_ranges);
>=20
> With modifications all happen from __init code, this likely wants
> to be LIST_HEAD_RO_AFTER_INIT() (which would need introducing, to
> parallel LIST_HEAD_READ_MOSTLY()).

Makes sense. And then I would be comfortable with dropping the spinlock
as Roger suggested.
I tried to make this API a bit more generic than I currently need, but
indeed it can be simplified for this particular use case.

> > +int __init subpage_mmio_ro_add(
> > +    paddr_t start,
> > +    size_t size)
> > +{
> > +    mfn_t mfn_start =3D maddr_to_mfn(start);
> > +    paddr_t end =3D start + size - 1;
> > +    mfn_t mfn_end =3D maddr_to_mfn(end);
> > +    unsigned int offset_end =3D 0;
> > +    int rc;
> > +    bool subpage_start, subpage_end;
> > +
> > +    ASSERT(IS_ALIGNED(start, MMIO_RO_SUBPAGE_GRAN));
> > +    ASSERT(IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN));
> > +    if ( !IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN) )
> > +        size =3D ROUNDUP(size, MMIO_RO_SUBPAGE_GRAN);
>=20
> I'm puzzled: You first check suitable alignment and then adjust size
> to have suitable granularity. Either it is a mistake to call the
> function with a bad size, or it is not. If it's a mistake, the
> release build alternative to the assertion would be to return an
> error. If it's not a mistake, the assertion ought to go away.
>=20
> If the assertion is to stay, then I'll further question why the
> other one doesn't also have release build safety fallback logic.

For some reason I read your earlier comment as a request to (try to)
continue safely in this case. But indeed an error is a better option, it
isn't supposed to happen anyway.

> > +    if ( !size )
> > +        return 0;
> > +
> > +    if ( mfn_eq(mfn_start, mfn_end) )
> > +    {
> > +        /* Both starting and ending parts handled at once */
> > +        subpage_start =3D PAGE_OFFSET(start) || PAGE_OFFSET(end) !=3D =
PAGE_SIZE - 1;
> > +        subpage_end =3D false;
> > +    }
> > +    else
> > +    {
> > +        subpage_start =3D PAGE_OFFSET(start);
> > +        subpage_end =3D PAGE_OFFSET(end) !=3D PAGE_SIZE - 1;
> > +    }
>=20
> Since you calculate "end" before adjusting "size", the logic here
> depends on there being the assertion further up.
>=20
> Jan

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Wol1ROn3KyGiQtoL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmZoLlAACgkQ24/THMrX
1yzr0Qf+K2Yv3CcKbg/CIDEiJbtsrpk1QksUKHST6p4+OQvLRvMC5OYq1pLe2l5o
92nBhuciOoCChB7Vrj809TBOP0pNRYanhiw+G6uS9AKEQL61iN3bcHN2JDPFR6x8
Af0AyQRaopkN8l2yTV7NXw2RGlSMYjcAEFOOu4g8QwJ0YyJExXyJN/59UGqVfwAr
21B4XG7ilGnszIoLb0rXKmu4ovKUhHzj5pgUbCuv/tsfnBj+Di4TbpjoCFjF9Rkd
ZPBJfN+Z54iXqC9Nz2ywDjttauLqFoZHUQKAA0Xw3aMMHypsOM46zM3rY3a1ZD8Q
pO/qjD8ly/EvBu9m62gEbhVEbOLHVA==
=aJAV
-----END PGP SIGNATURE-----

--Wol1ROn3KyGiQtoL--

