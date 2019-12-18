Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC39125730
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 23:48:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihi5X-0008VJ-DC; Wed, 18 Dec 2019 22:46:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OBAf=2I=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1ihi5W-0008VE-3i
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 22:46:38 +0000
X-Inumbo-ID: 3b0d585a-21e8-11ea-b6f1-bc764e2007e4
Received: from out4-smtp.messagingengine.com (unknown [66.111.4.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b0d585a-21e8-11ea-b6f1-bc764e2007e4;
 Wed, 18 Dec 2019 22:46:29 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 6433121BF9;
 Wed, 18 Dec 2019 17:46:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 18 Dec 2019 17:46:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=poX/wd
 gMaEK00cariGxwDfVuyQg8peZXA2k7PJjgWCM=; b=j20ne90MuxHbefizlxV3oi
 loIgVguDyRqmnHNzJA8Iq8bofK75H78OFCuzPAQ6AmmlBOssAWXtUn4WNvandGr+
 BU47e4aai1f4JQM5uQUdsDzkbHso70mm6/Jx/xMlhXRcsl4SyMZpmuvq9X+jtCMU
 1AOzOmM4pG4UrXv2jW0+Uea1bf6oUMUDEKyNIsUXc1nXdF6eU0ZLpnTt5fhmqpGJ
 7mHV42hEDa94zM9gjAj3VChc/yNpCKbNQ+bs/ANVd24C8u3f5a+qDcWD53mdO2mI
 sfUFpqdLi9zxycXzAViynEvQKGSnkuCSvhExPpfIGUigFXgOQSVSIGrLxSQfFlRw
 ==
X-ME-Sender: <xms:Raz6Xb2_irH3z3AcUXUKH4eCz2IdoRGPTWqQ9wdQ5LXsrm8F_9oUYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddutdcutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
 rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
 gslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedrfeefnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthh
 hinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:Raz6XeVmuImVXXQKbF1SocdCtuuu0tKeFTUcuvdWQkaEbCs4xE-cPw>
 <xmx:Raz6XW56vILMbXOhRy-O5itQdqyuDAKlqbLk7ChJyUdCifunDXQxWw>
 <xmx:Raz6XVL-pVClv-elSoOJELYfSWJMjG3syv9CE9h75Sj7JjZOjCtG_w>
 <xmx:Raz6XTK_KtyxWN5F59dBQgIjn_orxzqLBPc18WT_qQL-6rD-p5YNWA>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 54BA7306030B;
 Wed, 18 Dec 2019 17:46:28 -0500 (EST)
Date: Wed, 18 Dec 2019 23:46:26 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191218224626.GI25235@mail-itl>
References: <20191218150522.8697-1-andrew.cooper3@citrix.com>
 <20191218222652.GA4238@mail-itl>
 <025d5b59-3355-03f4-e885-8dd99776c3c0@citrix.com>
MIME-Version: 1.0
In-Reply-To: <025d5b59-3355-03f4-e885-8dd99776c3c0@citrix.com>
Subject: Re: [Xen-devel] [PATCH] tools/python: Python 3 compatibility
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: multipart/mixed; boundary="===============7041928685482662747=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7041928685482662747==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bpVaumkpfGNUagdU"
Content-Disposition: inline


--bpVaumkpfGNUagdU
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH] tools/python: Python 3 compatibility

On Wed, Dec 18, 2019 at 10:32:47PM +0000, Andrew Cooper wrote:
> On 18/12/2019 22:26, Marek Marczykowski-G=C3=B3recki wrote:
> >> @@ -70,7 +73,7 @@ class VM(object):
> >> =20
> >>          # libxl
> >>          self.libxl =3D fmt =3D=3D "libxl"
> >> -        self.emu_xenstore =3D "" # NUL terminated key&val pairs from =
"toolstack" records
> >> +        self.emu_xenstore =3D b"" # NUL terminated key&val pairs from=
 "toolstack" records
> >> =20
> >>  def write_libxc_ihdr():
> >>      stream_write(pack(libxc.IHDR_FORMAT,
> > You also need to update write_record (string constants).
> > And few calls to it with string constants (write_libxl_end,
> > write_libxl_libxc_context, read_pv_tail, read_hvm_tail).
> > And blkid =3D=3D ... in read_pv_extended_info().
>=20
> Urgh - well spotted.
>=20
> Was this manual inspection, or something else?=C2=A0

Manual search for " and '.

> (I probably should
> complete and upstream write-legacy-stream for the purpose of dev-testing
> the convert-legacy-stream script now that 4.6 is waaay in the past.)
>=20
> ~Andrew

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--bpVaumkpfGNUagdU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl36rEEACgkQ24/THMrX
1yw5gwf/f9jfd9ff3stV0hK2mgzYFHIQONWG4U+aYYmejHAUioVb3X/ZfE8SXkzu
wXCwgiFMxpsloWQLAwZcul7s3DC/ngTwk+vVIb7vN43ZBk8tarTl5dVQ5pyCnhrh
pSddseNFB/DDdauvhxWAluB5VWrMkIc1YOm/PtPSGKCMNEzu0GUQR/fL9WRXpBCe
d51udBHoJPZHvPX/qM1L2ZonEq7Tg9stC0ZJH2X6tGgf2M45LFsP22+yKAlrr0aN
QXq9jBSbQWV2by61h8zfTCWWlWiTSmhTJL0inVVq5YLwQkoWcuhbA2VhhnYg56XB
BmNdZvk14tnxj+w9rAMvQnJulIuS0g==
=+7+z
-----END PGP SIGNATURE-----

--bpVaumkpfGNUagdU--


--===============7041928685482662747==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7041928685482662747==--

