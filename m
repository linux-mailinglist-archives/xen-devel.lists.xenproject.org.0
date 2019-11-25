Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A133108614
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 01:51:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZ2X6-0000Ml-5e; Mon, 25 Nov 2019 00:47:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YHGQ=ZR=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iZ2X4-0000Mg-KN
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 00:47:14 +0000
X-Inumbo-ID: 1ef6a9a6-0f1d-11ea-b3bd-bc764e2007e4
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ef6a9a6-0f1d-11ea-b3bd-bc764e2007e4;
 Mon, 25 Nov 2019 00:47:13 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 78D6722A2B;
 Sun, 24 Nov 2019 19:47:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Sun, 24 Nov 2019 19:47:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=SWrR0+
 G9VfQFbQRQMlZDyUCUwIQ10uYZ8Y1sdnhJb0A=; b=UAtplZOHvRi8tPoNATWgCz
 N7Bc+dfymf3/WJ+NjL8SCCjTWdYEBoZCbISs1sUB3r3FaPTa9P3JPX+UaZC1w8oX
 U0n+XfaIr9qIDZdsxxorXX9Fhu6Gicjwri0w1a+6VSWZQHKjS21BpaZFVX8bvg3p
 6ZJIREU1RMOI7eEQFE4mcfaumJh4nVEPM9I86pddK3gNlNLmmx2H/0mm/uRnP9mV
 1rSqXuWiQAGly2t88EA0J61ry25mKvT/R75M7eR5f83zqb14+d3jsYueR0JLeme3
 egAqcEjMzobAvsMLSuQ3WZRZEskMT1kKavF2YKXDu3d2uIofdl/+pOlVtreh02rg
 ==
X-ME-Sender: <xms:kSTbXa92EPp_nMbJ5rQKFb5vV6_lkaoRD99Yg1l8b0Od5AMCpZNwDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudehledgvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepkeelrdeiledrkeelrddu
 iedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
 hlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:kSTbXWgtKSyg_bX2faBgoc_tDjXO7PG6QQ-hy_grtrVZTj3TvySbCw>
 <xmx:kSTbXbb-hKAoQRt4Jtu6lwyGJQ_2cVj1Vg2j2TuVlQ9Hor4LyC-T6A>
 <xmx:kSTbXb807qv6bx-LFvE96sfKJuLckubx3lfjsQZK5VY_dGtVkDeFbA>
 <xmx:kSTbXZrGtKxa1n0peKH_uY5Ri8BwgOLLhWAywGLGtLtATRGmb35y9w>
Received: from mail-itl (89-69-89-162.dynamic.chello.pl [89.69.89.162])
 by mail.messagingengine.com (Postfix) with ESMTPA id 77A1380060;
 Sun, 24 Nov 2019 19:47:11 -0500 (EST)
Date: Mon, 25 Nov 2019 01:47:06 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Roman Shaposhnik <roman@zededa.com>
Message-ID: <20191125004706.GB2012@mail-itl>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <CAMmSBy9Ti3nCt2EhT6XOcrBLWabpPqQFHA1G-Fc4N3gRg1qPUg@mail.gmail.com>
 <91d6b37f-6f83-183d-6b1e-297c0381af75@citrix.com>
 <CAMmSBy-Pr23H1U00S5rJWP205FSkx4HX-GiSkKygyopwf3FD9w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMmSBy-Pr23H1U00S5rJWP205FSkx4HX-GiSkKygyopwf3FD9w@mail.gmail.com>
Subject: [Xen-devel] UEFI support on Dell boxes (was: Re:  Status of 4.13)
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
Content-Type: multipart/mixed; boundary="===============0785067784262708298=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0785067784262708298==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KFztAG8eRSV9hGtP"
Content-Disposition: inline


--KFztAG8eRSV9hGtP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: UEFI support on Dell boxes (was: Re: [Xen-devel] Status of 4.13)

On Fri, Nov 22, 2019 at 10:00:13PM -0800, Roman Shaposhnik wrote:
> 3. Bad news: Marek's suggestion didn't work on Dell product line (and yes
> I double checked that I built it correctly).
>=20
> So... when it comes to RC2 regression -- we're all good.
>=20
> But since we're here anyway -- I'm wondering if anyone would be
> interested in helping me figure out why Xen on those Dell boxes coredumps
> without efi=3Dno-rs ?
>=20
> Marek, any chance I can interest you in helping me a bit here? ;-)

Yes, I am interested in helping with UEFI state there. Do you have by
a chance messages of that crash (without efi=3Dno-rs, but with
EFI_SET_VIRTUAL_ADDRESS_MAP enabled)? Or even a photo if no serial output is
available?

PS trimmed CC list as isn't really 'Status of 4.13' anymore.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--KFztAG8eRSV9hGtP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl3bJIoACgkQ24/THMrX
1yzlOgf+Jhx0ZyVa+Y3XTYEgsGClsSIa7JDgWCzewmXRVgt8bpL9oOz8Yzli0hbk
LWd+DgZPoAKfdm9143crzQWULPqthoKSiOlTW6hpRFvlpLIoF2/SDN65xcfe0IBL
daztFvA5zK0DzAp7c1QLbPnpdeDtDxDEQYCpyM+VFVTo0kZV0+7vnucXvjwIJeks
zc5WNFuJ6ZQlUJbLPTS4wCAl/oMkwD2Zm8+UZ2G/yzMUitgQdN4GHXUcn/Bk/ayb
Q4KtYTaVPjLIvqdN5smuz9omg3nNwpJ31HPdR99A8H07kCq4OC6uNmnhZQfLuiq3
j0A8IpKl8rOeKqKYSmec+6XlMlSIng==
=RsT0
-----END PGP SIGNATURE-----

--KFztAG8eRSV9hGtP--


--===============0785067784262708298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0785067784262708298==--

