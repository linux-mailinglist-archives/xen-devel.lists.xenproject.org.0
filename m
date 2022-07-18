Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E368B5780E3
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 13:36:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369683.601173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDP2K-0004nw-Nl; Mon, 18 Jul 2022 11:35:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369683.601173; Mon, 18 Jul 2022 11:35:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDP2K-0004lm-KC; Mon, 18 Jul 2022 11:35:40 +0000
Received: by outflank-mailman (input) for mailman id 369683;
 Mon, 18 Jul 2022 11:35:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Ov/=XX=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oDP2K-0004lg-4C
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 11:35:40 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf04d9af-068d-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 13:35:38 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 018B65C0105;
 Mon, 18 Jul 2022 07:35:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 18 Jul 2022 07:35:38 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Jul 2022 07:35:37 -0400 (EDT)
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
X-Inumbo-ID: bf04d9af-068d-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1658144137; x=
	1658230537; bh=0HqKLmJGSnaIm61y6IqoYDb1CsR3FlBGazWv2JPT6W4=; b=q
	fHyL31nPM3t0P6JuU/bMnYNz7IQq4UPZuw2Hd7Yl6ZboFAHNJgA0DPqHOKazxydL
	pj6aGc+f7YUjcbGHSB1LDCOiuKDFo5xfDKTqs8EZ/i0Lg7zYOFAW4FyXKfXM54km
	dgK+wKgnctqZEhYv6ix3GiXJp4c9Gpw6iva8fJwFL/NJCKAB1/5e2x/PRvDgtExi
	Vq2jUI5KsVBz2cWiqDHvoYhUATxvqE1crzUidO6znZBnaDhJaT0vn8GaD4XlLM9u
	dcwgo2PZqcYBplzcRlBDcILyfSMnGtYG2H3TaQOEkBxd8hURQPpGgKqYRT0kh1Ah
	Xz5hFf4d2MY1wKdpl0EFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658144137; x=1658230537; bh=0HqKLmJGSnaIm61y6IqoYDb1CsR3
	FlBGazWv2JPT6W4=; b=GBGme8el+RDW1zONBfzcRw27UnW0TTzrMUfFnTSN6XNN
	ivmAq0WRRiFA5QqYxMnuIK9lCC2wwComqWr9dSxPJ73P82uaIizKhNFeMOp+sfQV
	a6v9qVR52wFOjNjygbYBCgn4b6D//WVaHiSoCgber5tkf06niGLEXeLUOsW5hsK7
	ZvhZ4Mn0RjboCEacSExjgyCVeg8KyJHEfSRjk3b6uU3EK0HzHEr5bEeyt77PzDjf
	X4/wAex1Dm0TxYNhVH0TjlMNSKpOTum6r9hkMES8SEQexDQShA+oNeQJFfgFHvg+
	3Drva2Fo/LZJMhhgsMj0Y8A3lNishZygXnkrUi7IdA==
X-ME-Sender: <xms:iUXVYgIUv5-m0pqohbXtktW1VZ3Nt2X-MC6q3-lEsZb0Myon2pKKTw>
    <xme:iUXVYgJtIyY_FE3cVcbPicN-pUvlM4_voLTn99TSp1QhWc_6R8ZoPJZpwhEriqsMw
    dW722m7V_nCKg>
X-ME-Received: <xmr:iUXVYguOPULwtrYaF_ZV-GXWcARSHHiR_dl3E2mgGORmwfz7c9kJhkJJEM58qg-2BRxedBrgYwedGHNeSYei-jbGHbVNr7n9_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekkedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptdet
    vdfhkedutedvleffgeeutdektefhtefhfffhfeetgefhieegledvtddtkedtnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:iUXVYtbI2kLokbYiRf3S03IGhSMnIIh2Whg-IThwCAdElyy1qpVgDg>
    <xmx:iUXVYnaLI_2W8UsxVBGcOmmELp2zsY845JFh_aclgSoViUTiRqHj_Q>
    <xmx:iUXVYpABHR3Y65-QeFQsuexWeKa2ekGRwfZsjzobxjSTiE9RjaUfBA>
    <xmx:iUXVYoBBDEo9TvEFh_7UhSel10_ImxEt6iqDGwRl4Df80zWSaI5HjA>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 18 Jul 2022 13:35:34 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 7/9] IOMMU/AMD: wire common device reserved memory API
Message-ID: <YtVFhljIHQBhHQPt@mail-itl>
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <457056cbc6dcc00958b1f4e0cad35121e0cd1557.1657121519.git-series.marmarek@invisiblethingslab.com>
 <00c64c2e-a007-8188-469e-08e8c8cd25e1@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0J8ImBKga4SBTFMo"
Content-Disposition: inline
In-Reply-To: <00c64c2e-a007-8188-469e-08e8c8cd25e1@suse.com>


--0J8ImBKga4SBTFMo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 Jul 2022 13:35:34 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 7/9] IOMMU/AMD: wire common device reserved memory API

On Thu, Jul 14, 2022 at 12:22:36PM +0200, Jan Beulich wrote:
> On 06.07.2022 17:32, Marek Marczykowski-G=C3=B3recki wrote:
> > --- a/xen/drivers/passthrough/amd/iommu_acpi.c
> > +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
> > @@ -1078,6 +1078,20 @@ static inline bool_t is_ivmd_block(u8 type)
> >              type =3D=3D ACPI_IVRS_TYPE_MEMORY_IOMMU);
> >  }
> > =20
> > +static int __init cf_check add_one_extra_ivmd(xen_pfn_t start, xen_ulo=
ng_t nr, u32 id, void *ctxt)
> > +{
> > +    struct acpi_ivrs_memory ivmd;
> > +
> > +    ivmd.start_address =3D start << PAGE_SHIFT;
> > +    ivmd.memory_length =3D nr << PAGE_SHIFT;
>=20
> Aren't these at risk of truncation on 32-bit architectures? We have
> suitable wrappers for such conversions, avoiding such issues.

Well, this (and the vtd equivalent) is x86-only, so it's always 64-bit.
Anyway, what are those wrappers?

> > +    ivmd.header.flags =3D ACPI_IVMD_UNITY |
> > +                        ACPI_IVMD_READ | ACPI_IVMD_WRITE;
> > +    ivmd.header.length =3D sizeof(ivmd);
> > +    ivmd.header.device_id =3D id;
> > +    ivmd.header.type =3D ACPI_IVRS_TYPE_MEMORY_ONE;
>=20
> Please make these the variable's initializer.
>=20
> Jan

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--0J8ImBKga4SBTFMo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLVRYYACgkQ24/THMrX
1yz/vgf+PWn4F5Grx2ZPVmEOqhFiQfNKTjbRDj1GOeQIjTZl+OTfdwHHFamuV6TS
qv7IpAX6IJOMI3FOEtTVZhLGBDr/ThAS3pMLW9uAUZe4reyE5BApnRrQBIuBzzrl
RN12+rjntZ2DPTmdlbOJ+6MDLgkHZ7Hv0Mq6JkSCdsrIdW1ZMUDpDWwwz8hnH3Ln
tnZS1Si/dt51fM/W61eje1nGdlZ7mowcHUud+lJgdjo3bRSJ0O/TQ+6NN90Nu3+5
yD0k4XU42asAFvY4QSnZhuI3yAf1ylZu7SifMnAJ4wINOJRNoQd4O9tSpGMjcQ6I
h87xb9mw9QvLGUwpn6HGDJdNhjhdvw==
=X6eJ
-----END PGP SIGNATURE-----

--0J8ImBKga4SBTFMo--

