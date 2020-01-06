Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC31131634
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 17:39:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioVNy-0001Ou-Oj; Mon, 06 Jan 2020 16:37:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tjc+=23=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1ioVNw-0001OT-TM
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 16:37:44 +0000
X-Inumbo-ID: d83d4ac2-30a2-11ea-a914-bc764e2007e4
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d83d4ac2-30a2-11ea-a914-bc764e2007e4;
 Mon, 06 Jan 2020 16:37:36 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 62A4A4D6;
 Mon,  6 Jan 2020 11:37:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Mon, 06 Jan 2020 11:37:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5ie3pM
 BTqEFdxwrKZZh0f1Pggf29bfngttCUrILrAyc=; b=rgoBkwB8yICNyGY2on9ncl
 toVEWWxZf+MZSRCe1B28CKbrN2AtlrKcC5QEAfHCzKInnr/dA1iq6U3N2qYZ8aL/
 oa4HJTDBvjg/49h0GYDer5Z3Mr5EQyKNMVnYvYqRbzEi8JggWKTCBtKevqIWOJZI
 /Kn1QEnUPIJ4ywvezEIwCrQu0aVALR2oDhc+NPHnHvq4XUwOmwaxV3FmfNGlx30c
 qqQeVADG+vCnkaJ3JDZDx0qsDz+m05vd+JpryYHuGMoAHnILrdfBY7pSfGXmzEXN
 uRtO08FbofhxPG8+n3wB9FsWFylPEyC9+c6EpFKgaZFZCYBNKIf7JZOxznhNQn5Q
 ==
X-ME-Sender: <xms:TmITXjWIRmcIG61m8uPuLzF4P5UzO8QcZGr_TUUuNjR_PxvygOGhUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehtddgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:TmITXvhb-nksHEMmALGmU36z3yJ0-7GZy811RZeFAET6Hq6mIHYvFw>
 <xmx:TmITXj-v0LpheFyXl0LDNhMpjA1OmevZMkV7jaOtTK2Q41qe-dTPRQ>
 <xmx:TmITXmRBB07-YiTJGG_pn-AL-2TOup4btjh2byqslZHC4SAtdgyHiw>
 <xmx:T2ITXqRta4BoUArG2VvWN_HK1GctIDzjVrBbpqje267rIdikpAbskA>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 338D380059;
 Mon,  6 Jan 2020 11:37:34 -0500 (EST)
Date: Mon, 6 Jan 2020 17:37:31 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200106163731.GM1314@mail-itl>
References: <20200104010759.GA2507@mail-itl>
 <b40c6f0d-374e-b771-1463-74c40bf4a340@suse.com>
 <20200106140418.GH1314@mail-itl>
 <a044a991-0a28-6b64-8046-2338b40172d6@suse.com>
MIME-Version: 1.0
In-Reply-To: <a044a991-0a28-6b64-8046-2338b40172d6@suse.com>
Subject: Re: [Xen-devel] Broken PCI device passthrough, after XSA-302 fix?
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============4719322671196137531=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4719322671196137531==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MzdA25v054BPvyZa"
Content-Disposition: inline


--MzdA25v054BPvyZa
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Broken PCI device passthrough, after XSA-302 fix?

On Mon, Jan 06, 2020 at 03:38:46PM +0100, Jan Beulich wrote:
> On 06.01.2020 15:04, Marek Marczykowski-G=C3=B3recki wrote:
> > Is the patch from your other message still relevant?
>=20
> ... what this patch deals with. The answer to your question is "yes",
> also in light of your subsequent replies, albeit I still wouldn't be
> able to tell why things did work for you before.

With your patch applied the domain starts now, regardless of
LIBXL_RDM_RESERVE_POLICY_RELAXED set or not.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--MzdA25v054BPvyZa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4TYksACgkQ24/THMrX
1yw15wf/bt/otZR0fDFkHC2W6uKqy4ZLBgzspEEsHYZd3dYdUnO1ojSxzHc/2RKQ
a/uR7gJ4GO3g9aneISrRLsajqsXulGUjRzPgo8lsIwe1jOL3NzWC3UONut0Vi4Hy
+eutrvf3D7z64LMyQrbjYG6rP4jIZLlIIOW3k67/NW56XwvQA8aVf3ITC7E7t5xd
Rccjgh+y/YnjFMgHQU4RczWRTAQ4jkNXPmbUo/dMR/yC1UHyq/qkNEbfg915aln/
XDb4xxuNu6Bk+3Kd7kcSQi1VcyjA4m41R+ENUYrT6YuEidCpUmESulQ3rnky2/Ew
YyiIm9txG+2X5PU+7fbK4khwApUY+w==
=MP0c
-----END PGP SIGNATURE-----

--MzdA25v054BPvyZa--


--===============4719322671196137531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4719322671196137531==--

