Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A9710982C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 04:57:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZRwj-0001qD-2C; Tue, 26 Nov 2019 03:55:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ud2r=ZS=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iZRwh-0001q8-Fd
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 03:55:23 +0000
X-Inumbo-ID: 91e1a02c-1000-11ea-9db0-bc764e2007e4
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91e1a02c-1000-11ea-9db0-bc764e2007e4;
 Tue, 26 Nov 2019 03:55:22 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 86D50AF5;
 Mon, 25 Nov 2019 22:55:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Mon, 25 Nov 2019 22:55:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=z3GsPg
 xh1zWTK7ujK5qTvzkfy9EY9/H2P+9v7cca75U=; b=jY1iBywW2uRQPbbIU8Hj1M
 RSiG8efu4pGWwpCkqXeuNnT06faDR6da0ucgq7vtQ2cswndAZmsp2pBC91AriyzN
 6d9v7urDmNU0CCJCqUFrZSHd6CS03mhwiCtiamU0EIhfM1PYe3wQIQ8Ve2JuJ1RB
 H12R0P2yKaltAIWw5++G7W8RI9HD5js0NsaE22zeNB4sOCh2+haPBenRNMWI6W8v
 2qZ2wEjpn1sT6sJmk6BzlWutH1/f3qxaUhiG9pHiO9dbUk8rD/jErxb8aUm8cTW6
 YKRVR0XXN1OmxQniSCQF4NXdOKsQjcaARgDEh7GTOEXSNzmjxkbPYyiyKvGjpbDA
 ==
X-ME-Sender: <xms:KKLcXczPJpWVWtuCgZWaQfkBDLHLyBViI4UWkj7g6o-lYXPTzG9Ijw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeivddgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:KKLcXbxUWnvXCEjz2Gz8Fy4Zq0wzmO1cKQKYoFuIYLKJHs40YVFCNw>
 <xmx:KKLcXUwmiFiun1MWeOQLIYjEVo8paAuhKM3UAbsImToIh_JB4x_d1Q>
 <xmx:KKLcXVZThm8cWSH3RgSZwg4PRKq9Ddjgi08I7bMTP1HzirrVAb4NWA>
 <xmx:KaLcXc7xzz4JX48Vb4Cjivcs2A4s2GzgWH2eu-_yXa64vPZmyZjTag>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 328988005A;
 Mon, 25 Nov 2019 22:55:20 -0500 (EST)
Date: Tue, 26 Nov 2019 04:55:17 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Roman Shaposhnik <roman@zededa.com>
Message-ID: <20191126035517.GT5763@mail-itl>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <CAMmSBy9Ti3nCt2EhT6XOcrBLWabpPqQFHA1G-Fc4N3gRg1qPUg@mail.gmail.com>
 <91d6b37f-6f83-183d-6b1e-297c0381af75@citrix.com>
 <CAMmSBy-Pr23H1U00S5rJWP205FSkx4HX-GiSkKygyopwf3FD9w@mail.gmail.com>
 <20191125004706.GB2012@mail-itl>
 <CAMmSBy9gkVR-ua9=kVn9rNSb2VnvvtzaLL=ZM-GXxCdtRGRtvA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMmSBy9gkVR-ua9=kVn9rNSb2VnvvtzaLL=ZM-GXxCdtRGRtvA@mail.gmail.com>
Subject: Re: [Xen-devel] UEFI support on Dell boxes (was: Re: Status of 4.13)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============4993181170800993993=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4993181170800993993==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="apqMg07LpBOyFFAR"
Content-Disposition: inline


--apqMg07LpBOyFFAR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] UEFI support on Dell boxes (was: Re: Status of 4.13)

On Mon, Nov 25, 2019 at 07:44:03PM -0800, Roman Shaposhnik wrote:
> On Sun, Nov 24, 2019 at 4:48 PM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> > Do you have by
> > a chance messages of that crash (without efi=3Dno-rs, but with
> > EFI_SET_VIRTUAL_ADDRESS_MAP enabled)? Or even a photo if no serial outp=
ut is
> > available?
>=20
> With my awesome soldering skills ;-) I managed to rig a serial console.
>=20
> Output is attached. Please let me know if you'd like me to run any
> other experiments.

Looks helpful, lets try to do something:

>  Xen 4.13.0-rc
> (XEN) Xen version 4.13.0-rc (@) (gcc (Alpine 6.4.0) 6.4.0) debug=3Dy  Tue=
 Nov 26 03:19:38 UTC 2019
> (XEN) Latest ChangeSet:
> (XEN) build-id: 07aa9f711fe09a91be2588ee7df10d93ebe34c80
> (XEN) Bootloader: GRUB 2.03
> (XEN) Command line: com1=3D115200,8n1 console=3Dcom1 loglvl=3Dall noreboo=
t dom0_mem=3D640M,max:640M dom0_max_vcpus=3D1 dom0_vcpus_pin smt=3Dfalse
(...)
> (XEN) EFI memory map:
(...)
> (XEN)  0000077587000-00000775f4fff type=3D5 attr=3D800000000000000f

This is code that crashes - runtime services code, so somewhere with
actual UEFI code.

(...)
> (XEN)  00000ff900000-00000ffffffff type=3D11 attr=3D8000000000000000
> (XEN) Unknown cachability for MFNs 0xff900-0xfffff

The faulting address is in this range. And because of unknown
cachability, it isn't mapped. Try adding 'efi=3Dattr=3Duc' to the Xen
cmdline.

(...)

> (XEN) Xen call trace:
> (XEN)    [<00000000775e0d21>] R 00000000775e0d21
> (XEN)    [<00000000775ddb8e>] S 00000000775ddb8e
> (XEN)    [<0000000000000000>] F 0000000000000000
> (XEN)    [<7fffffff00000000>] F 7fffffff00000000
> (XEN)
> (XEN) Pagetable walk from 00000000ff920020:
> (XEN)  L4[0x000] =3D 00000000787c0063 ffffffffffffffff
> (XEN)  L3[0x003] =3D 0000000071298063 ffffffffffffffff
> (XEN)  L2[0x1fc] =3D 0000000000000000 ffffffffffffffff
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) FATAL PAGE FAULT
> (XEN) [error_code=3D0000]
> (XEN) Faulting linear address: 00000000ff920020
> (XEN) ****************************************
> (XEN)
> (XEN) Manual reset required ('noreboot' specified)


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--apqMg07LpBOyFFAR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl3coiUACgkQ24/THMrX
1yyhsQf+NGqAzmdlpRuNVgq7CeyZJFGUc0OHkweu4bRN3TPN+tMRAb/xd+G3sEep
apqE11UnZA/YiJaMo/gGMyGBXaXedhLbzV9FVKNVbbjHaijLHKYQeTsbg3g/rf0D
RlQzvV0J3Sfd9wSR4hEn+HN0eI+QM86dC1EEg0SXQRpspxiEIFqmtp7L19JEh9Y7
SUNiQ7DXPjIWiUDPBMBwlhOPLG7Pxa213X7tfd++6AyqxmY7UvywsGzMobhflfZL
B/SynqE/lqnzsIquGjhRLwGDf51Yc5r0sfXDjHEBgkZiZVDdfftSqSGmP84m6MNx
pdi/bv5eZ+vt0SlEyE6n6g+mo9/kag==
=C/cz
-----END PGP SIGNATURE-----

--apqMg07LpBOyFFAR--


--===============4993181170800993993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4993181170800993993==--

