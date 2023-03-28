Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B23A6CBE9A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 14:07:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515738.798874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph86r-0000eQ-3q; Tue, 28 Mar 2023 12:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515738.798874; Tue, 28 Mar 2023 12:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph86r-0000bU-0n; Tue, 28 Mar 2023 12:07:29 +0000
Received: by outflank-mailman (input) for mailman id 515738;
 Tue, 28 Mar 2023 12:07:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B75i=7U=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ph86p-0000bI-L5
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 12:07:27 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1aaaf452-cd61-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 14:07:26 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id EFFEE5C012A;
 Tue, 28 Mar 2023 08:07:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 28 Mar 2023 08:07:25 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Mar 2023 08:07:24 -0400 (EDT)
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
X-Inumbo-ID: 1aaaf452-cd61-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1680005245; x=1680091645; bh=GwPQfU/1OdNZDH0514UzlX2nnEEw76zTzl7
	0uQOSdcU=; b=HHenlbhd1k7rT1iN862qfCchuOQip+gQ6J4s1riad9DjEM7UmgR
	MAyRokdVvRKg9iWwtwQcbAKNsRCFHesbC1JExT7eaCfS/fxIG7Kz5STGfxhJSnte
	fcQ8CgbOlgQcAOEund5TiXMcCGgjpVHE+V9yTdlIlJiDSUYnCMHXswPTFduVUiLi
	uWPyDQSSXt3gdp+OauudO2g5N+B4wP4zl0V3VlccYEZ/8KdfFMvrSn/SjwpFLozX
	2EgyBfJ/G3WOkOKYk69imInARaE+WafN6NERr7PKe3hbntf5AeiHZAcini0u4EGr
	oN7lGV2aRlqBP0mdpQtrUaU9PSW2vO9zMxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680005245; x=1680091645; bh=GwPQfU/1OdNZD
	H0514UzlX2nnEEw76zTzl70uQOSdcU=; b=BWPTp9IEab5ci5DWYvOmkzBNkRZju
	YysJ7XYmYd7Hia7lddpD7S4e8TIffgwGDlUu6OE6LOd0YS0qc0L7zg+D9SSIFpOj
	sBZ2H1HZRdR//2gTkicxB4hrGwKpQNX9lKzPOzOf30EhY7QYv8LvXH3kfr0a05R8
	bJ4Jmspk1mzmjwKjdm/1WMksybRWgVWxGx/vWOjhf8RNlED6Yr+eBLnhtiNEyVov
	3X/2EJsM1x/qkYZgugsfyhIFZ8W9DNO9Tcdtl1PHC7qPsA4AySdhdBLHDSn8Bhh0
	SrBXFZnhShBaMcQKn5USrh7aAUOWKSdAieESAyltYK9RUkCERMyv//gRQ==
X-ME-Sender: <xms:fdgiZPetMCd9TDTXFftIh4-tK6MvYPsdxs9NAkI3WJj5UMJEbsFhAA>
    <xme:fdgiZFMYsEX8DzKV_ckEsywMLTNp8C_Ou9Z5VYx2R4Ou8l8gGtP22R0BcoJwQ8oow
    nn_HvjGEm4ilQ>
X-ME-Received: <xmr:fdgiZIhFuT9dtbtOl3pl_XH--8HHoYoW8EcRUhusFpNgwaVaxCO6Ltx--MClVHlUjVrHu3ThRdUmF67wjvA5oCEnEX6vZF-SJtQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehgedggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:fdgiZA83nuRTCFOLQ8bNqiEBr7pyL_DJopSxg9uH066jc34Nz9KN-w>
    <xmx:fdgiZLuv7HywvOcvmBjK9_lL8D3QIOxWdgW5J-Xo-w9qpF49WyMafQ>
    <xmx:fdgiZPFw84EGnVgY6gqZ2s3JlG1YMkPJbBvpnzCqbUDYY4UeNj6nxA>
    <xmx:fdgiZE7ZeWMHIyNePDjLEcAHAi5jgwU3FjPwXMhEy18jkM5fqqF5nQ>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 28 Mar 2023 14:07:22 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 3/3] x86/msi: clear initial MSI-X state on boot
Message-ID: <ZCLYe94PE3WXYnU5@mail-itl>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <20230325024924.882883-3-marmarek@invisiblethingslab.com>
 <ZCLRap2GJE0xwBCN@Air-de-Roger>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HoIGlTicOpUPWFzV"
Content-Disposition: inline
In-Reply-To: <ZCLRap2GJE0xwBCN@Air-de-Roger>


--HoIGlTicOpUPWFzV
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Mar 2023 14:07:22 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 3/3] x86/msi: clear initial MSI-X state on boot

On Tue, Mar 28, 2023 at 01:37:14PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Sat, Mar 25, 2023 at 03:49:24AM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Some firmware/devices are found to not reset MSI-X properly, leaving
> > MASKALL set. Xen relies on initial state being both disabled.
>=20
> The 'both' in this sentence seems out of context, as you just mention
> MASKALL in the previous sentence.
>=20
> > Especially, pci_reset_msix_state() assumes if MASKALL is set, it was Xen
> > setting it due to msix->host_maskall or msix->guest_maskall. Clearing
> > just MASKALL might be unsafe if ENABLE is set, so clear them both.
> >=20
> > Reported-by: Jason Andryuk <jandryuk@gmail.com>
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > v2:
> >  - new patch
> > ---
> >  xen/drivers/passthrough/msi.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/xen/drivers/passthrough/msi.c b/xen/drivers/passthrough/ms=
i.c
> > index ce1a450f6f4a..60adad47e379 100644
> > --- a/xen/drivers/passthrough/msi.c
> > +++ b/xen/drivers/passthrough/msi.c
> > @@ -48,6 +48,13 @@ int pdev_msi_init(struct pci_dev *pdev)
> >          ctrl =3D pci_conf_read16(pdev->sbdf, msix_control_reg(pos));
> >          msix->nr_entries =3D msix_table_size(ctrl);
> > =20
> > +        /*
> > +         * Clear both ENABLE and MASKALL, pci_reset_msix_state() relie=
s on this
> > +         * initial state.
> > +         */
> > +        ctrl &=3D ~(PCI_MSIX_FLAGS_ENABLE|PCI_MSIX_FLAGS_MASKALL);
> > +        pci_conf_write16(pdev->sbdf, msix_control_reg(pos), ctrl);
>=20
> Should you make this conditional to them being set in the first place:
>=20
> if ( ctrl & (PCI_MSIX_FLAGS_ENABLE | PCI_MSIX_FLAGS_MASKALL) )
> {
>     ...
>=20
> We should avoid the extra access if possible (specially if it's to
> write the same value that has been read).
>=20
> I would even move this before the msix_table_size() call, so the
> handling of ctrl is closer together.
>=20
> Would it also be worth to print a debug message that the initial
> device state seems inconsistent?

That may make sense. XENLOG_WARNING? XENLOG_DEBUG?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--HoIGlTicOpUPWFzV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQi2HoACgkQ24/THMrX
1ywkKAf/cohYwgU975KIK3B73OnhFRF+E9GOexJJYm/Ru41ClX2AimK2lS69S12T
M51Jf5x/ZEPkUC/o5VjlkpymXneQNXQA2f8W2pVZwGdb0BUJ+h0xCZapAYG6ZyKI
1V9STOydzZXJBm+xlH5NBbjbsjJwrzeid2F/HAwfTaXFq9Yz30MmuSym4UBW4zgg
/V6kSS+Q1zp8HLiIRTGyqCtvj+AnjXCNr47qSwNrWaiVbbeKYaAFhM3Z81FQdqJj
HSnHGI56c/WKxRHbb8cMB7dKgTbifvPkdMCl6A3SlknPRSZSs9aXtHzsjJxWpYkw
W0qa52ujrcIqheyALVCbiIj2LvDYiQ==
=2pX+
-----END PGP SIGNATURE-----

--HoIGlTicOpUPWFzV--

