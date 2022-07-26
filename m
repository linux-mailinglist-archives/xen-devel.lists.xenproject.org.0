Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBF9580FE0
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 11:28:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375110.607411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGGqI-0004Sg-Sw; Tue, 26 Jul 2022 09:27:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375110.607411; Tue, 26 Jul 2022 09:27:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGGqI-0004Pt-QE; Tue, 26 Jul 2022 09:27:06 +0000
Received: by outflank-mailman (input) for mailman id 375110;
 Tue, 26 Jul 2022 09:27:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zoO2=X7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oGGqG-0004Pn-HZ
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 09:27:04 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a8f96e2-0cc5-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 11:27:02 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id DE2475C00D7;
 Tue, 26 Jul 2022 05:27:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 26 Jul 2022 05:27:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Jul 2022 05:26:58 -0400 (EDT)
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
X-Inumbo-ID: 1a8f96e2-0cc5-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1658827620; x=
	1658914020; bh=+wJoavldm8HPsBPIDP3IZJuPjs0jO0zNoXJY/2Atyyc=; b=9
	x6GUa48GKH6etSj4gMO3imx8w2jKRiDhX+Fa/56So6sBLWuMMVAVndo/VtmxPPgl
	5bRTy+o26EiOtv6s6jZjOo59Y/X9clJmuxNuXq1J8C0STvlZ9viArJAf5Jws1PO+
	iKXj839TMDf4IqZ/C+EzJ6lWByOAFc/UuvIv+Ry1aS69dF7LEO2rRUngLBXTwqIf
	gWEO3XGxpaxNyfsZvUMz+vUbBpooxR+UXwFXQ8DSlHz1oGHpHSiANMf6eKz7iT3O
	haZKOEGdVR1pdt6QCtWM1m+rXAhakp6of42PoFCDyF69w4E+ECnY1hQdUnhuRLxb
	0YYN4g4Cgg9TjtxbfkC4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658827620; x=1658914020; bh=+wJoavldm8HPsBPIDP3IZJuPjs0j
	O0zNoXJY/2Atyyc=; b=HAe7oFSuPJVtWKEL6zcAar7WRN0PYLyWZEyxJqfcoBl3
	C5eK/u7Psgun26c04fN3u/Yp3w7KCq+ZW+Xsc3DCTL0bkX2WQLJ9MiqfIUm+KBLo
	voLb1zD4frNAZDjNs4IrDgIi3LYXPOD5J+oX+0Zw6Gals2ukPe5CQHwRF8iB+EeK
	ZPEsRWcDeQ8Z4OG5of6DK4EX86HShM0GKG5qjT3CA1fL1TphD1Bb590HBei6O2HW
	8qj6ZiSBh8nUiplbB60YULhRWucYaVbxLsPIgaQI8FL9f2W2kQ94zQgl5pGbmvNz
	oCs9UMilbaWTwlsswY5qlRiOARCvolzFb5eheUOc2g==
X-ME-Sender: <xms:ZLPfYq8SdIMeqDqSHGPh7uT85sClFCaWGd3uWnlldcAyvq456MBq5Q>
    <xme:ZLPfYqtKf4Qkq7Voh12q2onpCDVBSLroCzkVdhfEy8BKlQDEZo7MPTgtC57_mANLF
    XW-52eIa1vmGA>
X-ME-Received: <xmr:ZLPfYgDFTN6eg8do51b3GlkXsMz0Hb-DOfsbC2UvzMdhM0CT2j8YlhCsLDtvT0i2VcyZHvAHyc85kxB-hDA0io2DJ1f1cGDrB8s->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddutddgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueek
    teetgefggfekudehteegieeljeejieeihfejgeevhfetgffgteeuteetueetnecuffhomh
    grihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:ZLPfYidNkYBAI1dJKixtrG05ZJ6LqQw6158SrguFVmc4D5JjVvJ5AA>
    <xmx:ZLPfYvOnZne5OjC7mGe17t_Qrp2cCBXfFtQes5EQo_tGX1stxHUHnQ>
    <xmx:ZLPfYslwhCDFa05IQA9S3o4ku6duZOZ2z98XgWlpBrrGUZGpS8Tj_Q>
    <xmx:ZLPfYojttoZPb53Got34tYlLBD_6ordA3_Nhax17b4psIhPAOlWjNQ>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 26 Jul 2022 11:26:55 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>,
	Connor Davis <connojdavis@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 00/10] Add Xue - console over USB 3 Debug Capability
Message-ID: <Yt+zX1UhPc3Fnh0J@mail-itl>
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <49d7ee9e-effd-6385-c46d-2218f84e6ba3@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xK4aUJW9n77/dsBk"
Content-Disposition: inline
In-Reply-To: <49d7ee9e-effd-6385-c46d-2218f84e6ba3@suse.com>


--xK4aUJW9n77/dsBk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 Jul 2022 11:26:55 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>,
	Connor Davis <connojdavis@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 00/10] Add Xue - console over USB 3 Debug Capability

On Tue, Jul 26, 2022 at 08:18:40AM +0200, Jan Beulich wrote:
> On 26.07.2022 05:23, Marek Marczykowski-G=C3=B3recki wrote:
> > This is integration of https://github.com/connojd/xue into mainline Xen.
> > This patch series includes several patches that I made in the process, =
some are
> > very loosely related.
> >=20
> > The driver developed by Connor supports console via USB3 debug capabili=
ty. The
> > capability is designed to operate mostly independently of normal XHCI d=
river,
> > so this patch series allows dom0 to drive standard USB3 controller part=
, while
> > Xen uses DbC for console output.
> >=20
> > Changes since RFC:
> >  - move the driver to xue.c, remove non-Xen parts, remove now unneeded =
abstraction
> >  - adjust for Xen code style
> >  - build for x86 only
> >  - drop patch hidding the device from dom0
> > Changes since v1:
> >  - drop ehci patch - already applied
> >  - adjust for review comments from Jan (see changelogs in individual pa=
tches)
> > Changes since v2:
> >  - add runtime option to share (or not) the controller with dom0 or oth=
er domains
> >  - add RX support
> >  - several smaller changes according to review comments
> >=20
> > Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> > Cc: George Dunlap <george.dunlap@citrix.com>
> > Cc: Jan Beulich <jbeulich@suse.com>
> > Cc: Julien Grall <julien@xen.org>
> > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > Cc: Wei Liu <wl@xen.org>
> > Cc: "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>
> > Cc: Paul Durrant <paul@xen.org>
> > Cc: Kevin Tian <kevin.tian@intel.com>
> > Cc: Connor Davis <connojdavis@gmail.com>
> >=20
> > Connor Davis (1):
> >   drivers/char: Add support for USB3 DbC debugger
>=20
> I notice this patch was sent twice, about 4 min ahead of the full set.
> I take it that the set having come close together is the definitive
> one, and that one extra copy is the one to be ignored.

Yes, I noticed too late I forgot to drop Connor's broken address, that's
the only difference.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--xK4aUJW9n77/dsBk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLfs18ACgkQ24/THMrX
1yxoLwf7BrVKT67S+E+qRnigw+W2MeJsY9GtioTqQtYyuluj7a2wP4tR9DGfIlLd
WxbCoGVhWhaz8LZCsZ3GQU8n53mYqTgqajR5MgFtHom2qt3oChJeaUMEqky8snVZ
Ze5s2yGVE3dQJKt5j/QXY/MaUbXyBoTySZZDsBvX3uvmlcxyW/JhshtKJwYksG44
S46f3zJuJfkFgVvEUyktPxwJFvyXBqGVGAVORArzQDiV2wgxTr3AxQExec+DgiVO
jmWN0PHfoXz80fFJyD+iC50v+KPVZsttLOoCzaXGLvwaeyBCMhPnQJaj5S8xOSrU
H3k35ClgP8Wve9OfxkQsJSI4M9BbSQ==
=Pwpe
-----END PGP SIGNATURE-----

--xK4aUJW9n77/dsBk--

