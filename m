Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AC3268FFA
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 17:31:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHqRo-0002c7-5V; Mon, 14 Sep 2020 15:31:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K6qy=CX=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kHqRl-0002c2-U8
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 15:31:14 +0000
X-Inumbo-ID: a3f2a775-c07a-4851-988c-b31fcaf465a8
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3f2a775-c07a-4851-988c-b31fcaf465a8;
 Mon, 14 Sep 2020 15:31:12 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 464E0714;
 Mon, 14 Sep 2020 11:31:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 14 Sep 2020 11:31:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=yy4R8K
 yQkyO+F0K5deuguDDLanPZNawYDOG/seGPtAc=; b=lLfV4XydaXV4e4unD664b6
 YHRMs8t2EN171+uJPMoBmkUbP7/eIho7PoxmzsEnnamyjMzN7bavpfQeq53yBYom
 dAkErbThEi7lxZ5GZm5a9tiKxeOl76smrjuFNz4OkAG9ZL3HR8p+pgQTieYSyZdy
 e6u6cmXhsaTrqF9ay8V+Qnux224+/ocBuzAhD0uKxxh1ArX1+5/H5FhqicKM/cbQ
 oAWW+72XZujPwYzWXaNcLtbgx/iX6DP8wvoIVvaqvNox3AK7YfnVXKwApQWsTVSm
 PO4KCMbmqMu6bDyuIt0TfxxHPI/FWlxKbgKlN9T3oDt5UD2SsOj9nxVDIw4rN8Qw
 ==
X-ME-Sender: <xms:voxfX1iG81wDl6QAX3zGEjGyRXdMOUI4kl4fcPIquORaYh3VCr0JLg>
 <xme:voxfX6Bfec8Xi-oZScDb3P35doao-QPi0_djcByuHByNcT9yYNOsPPqHqTP33nYDt
 X9gNRbbDUYhSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeiiedgledtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeegkedu
 teduteeuheeuleeuffduieeutdfghfetgfeiffffffejtdevffevieetffenucffohhmrg
 hinhepfhgvughorhgrphhrohhjvggtthdrohhrghenucfkphepledurdeigedrudejtddr
 keelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:voxfX1HPd0HeD7xpTJggCJ1OXYvKlE-NpnCs7f735fEjE8CDT2VULQ>
 <xmx:voxfX6R31SVAoHN5_SKF7Rpu4QC0lv1aO8NT4eoNaSg7u1LGA_XoXQ>
 <xmx:voxfXywN1aQmdGBjnF4b3zGdM9XsRE8XuuvoiTCHq5pLNhKgFL0Hsw>
 <xmx:voxfX3pT3reNi_2EN5A4QAIYMy7yF4HC1w_MF1sSa67KDOQAECqZaQ>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 27DBC3280066;
 Mon, 14 Sep 2020 11:31:09 -0400 (EDT)
Date: Mon, 14 Sep 2020 17:31:04 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: libxl - b_info.{acpi,apic} behaves differently than
 b_info.u.hvm.{acpi,apic}
Message-ID: <20200914153104.GI1482@mail-itl>
References: <20200910035723.GY1626@mail-itl>
 <20200910085148.GU753@Air-de-Roger>
 <20200910102921.GZ1626@mail-itl>
 <20200910104104.GW753@Air-de-Roger>
 <20200910105854.GA1626@mail-itl> <20200913111239.GB3962@mail-itl>
 <20200914151956.GG753@Air-de-Roger>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zPXeIxDajdrcF2en"
Content-Disposition: inline
In-Reply-To: <20200914151956.GG753@Air-de-Roger>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--zPXeIxDajdrcF2en
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: libxl - b_info.{acpi,apic} behaves differently than
 b_info.u.hvm.{acpi,apic}

On Mon, Sep 14, 2020 at 05:19:56PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Sun, Sep 13, 2020 at 01:12:39PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Ok, The crash reported initially was caused by a different thing: using
> > seabios.bin instead of seabios-256k.bin (should that really cause the
> > crash? shouldn't 128k seabios build work too?). But in any case, I think
> > the b_info.u.hvm.{acpi,apic} is also not in a good shape.
>=20
> Does 128K SeaBIOS have Xen support enabled?

This is a very good question. No:
https://src.fedoraproject.org/rpms/seabios/blob/f32/f/config.seabios-128k#_7

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--zPXeIxDajdrcF2en
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl9fjLkACgkQ24/THMrX
1yxyVwf/fBg3FkUPHNT5fWXNZ1VF6K4zU3a16RCPxGuwuWv3HIu2Bh0MX0DFLkvl
0NiHa77VCiGnCTa8Y8ehQBFLz9iW8yFO2ct2vLDZpXRrg1bk8Uv1daEkC6GJMoAe
W+xZYOal2+cXSL+V/lxL3BhdjDNQWInAir49xy9T/OJfS+S2IMwfWzrTbmE6JfOq
KLfknfBOs38WWMU1vBvxYkfO1tAWblIARg30EiUx3bOI0pXoQAXemtxvcNiAzZ5+
+JzbY8/SVjOpUU6Wh8Sczgm9Ims9X23S5nJA0bGJQN2aaaSUoi1UFnvCfx1aWxpQ
81sjUSq1fRHoLPcG2cVNdmpZg7nNoA==
=QE16
-----END PGP SIGNATURE-----

--zPXeIxDajdrcF2en--

