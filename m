Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF73413466F
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 16:42:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipDRH-0007i0-Lk; Wed, 08 Jan 2020 15:40:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IcqW=25=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1ipDRG-0007bX-1Y
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 15:40:06 +0000
X-Inumbo-ID: 1fad51b4-322d-11ea-a38f-bc764e2007e4
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fad51b4-322d-11ea-a38f-bc764e2007e4;
 Wed, 08 Jan 2020 15:39:57 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 5A0D12201F;
 Wed,  8 Jan 2020 10:39:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 08 Jan 2020 10:39:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=rInGlE
 bPROKoXHk6m5HE8VocyxCDzkr/K+gwb4ypD9Q=; b=ZAVukKTDKtzrblg2X+RIUM
 IM6+I3idLt1MpDfy4nrQA2gOwO3Gbv58puqeAgd/mKFRYrReP5sX8g+gDT9IYXi3
 K5jM1shDhqaY7E3hU+PeCowLPKBClhOnXWBsUzLrEk+xtp1mOKI2Z0iVo/ig4oOZ
 jc7e237e/0wXv+iy8aYptqBpUiyLCKAIM3PM+rpmFwq/mxNSQKsai/wTu55olbn0
 0LDhWDyLviWnVIToH5FfIrq5F/siyfyFIDBc8UoLjQ1rtbU22vwIZMbF67cotIfa
 m0UZTMXarUS1z5pitsassM77jFvUWNqvwmrcOhjNvoBvNBhyyNyU1NtoF3fRjuxA
 ==
X-ME-Sender: <xms:zfcVXreCB9fbDiBS5d-Kv7im9IHAch9vq-fcIRTyb0fcj1kwaMBeYQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehkedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:zfcVXmcbVo_MXlY4oUZw2dZD2Kej8dcbqMwTgCwIXOQXEQoeKlMn0Q>
 <xmx:zfcVXmPUz9HIobpBDEX-xmnv8ZWQ2oLkfkFcmNZYI_ZxbS4hDiKCjw>
 <xmx:zfcVXlJW2-fdmLNPj6rvO5JnNnCt8NZghgR3pYczDM8xjeJervtm8g>
 <xmx:zfcVXnLk7cb75Ii-QdUhO0wxReQIeST75ZWv-0_qRL0mrjAzvOPV2Q>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4A14430600A8;
 Wed,  8 Jan 2020 10:39:56 -0500 (EST)
Date: Wed, 8 Jan 2020 16:39:51 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200108153951.GT1314@mail-itl>
References: <5A310C33-58F6-47F0-8892-1BE7D256A374@gmail.com>
 <20200108152036.yfccdzesfigkmpv3@debian>
MIME-Version: 1.0
In-Reply-To: <20200108152036.yfccdzesfigkmpv3@debian>
Subject: Re: [Xen-devel] Making save/restore optional in toolstack,
 for edge/embedded derivatives
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Rich Persaud <persaur@gmail.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: multipart/mixed; boundary="===============0740628234196534469=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0740628234196534469==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PPxI8paQBs33t8dK"
Content-Disposition: inline


--PPxI8paQBs33t8dK
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Making save/restore optional in toolstack, for edge/embedded
 derivatives

On Wed, Jan 08, 2020 at 03:20:36PM +0000, Wei Liu wrote:
> On Thu, Jan 02, 2020 at 01:51:21PM -0500, Rich Persaud wrote:
> > Linux stubdom patches currently require qemu in dom0 for consoles [1],
> > due to the upstream toolstack need for save/restore.  Until a
> > long-term solution is available (multiple console support in
> > xenconsoled), would tools maintainers consider a patch that made
> > save/restore build-time configurable for the toolstack?  This would
> > avoid Xen edge/embedded derivatives having to patch downstream to
> > remove save/restore, e.g. to avoid qemu in dom0.
>=20
> Re multiple console support, I think that's added back in 2017 for Arm
> guests. What is missing?
>=20
> (Not suggesting it is fit for purpose as-is)

No, it only adds support for multiple console _types_. The key thing is,
those are statically defined in the code. I've tried to repurpose it to
support up to 3 (or 4) consoles, but it's rather ugly and Ian(?) didn't
liked it. Refactoring it for dynamic number of console is much more
work...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--PPxI8paQBs33t8dK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4V98cACgkQ24/THMrX
1yz2ZggAghuYXDo9d+ePvEIfN652ZfY2bb9jhMsQU1cWLIJGzzDOGn4tfbhd1KTQ
b3CU5miBKI1y0w1E8Jy36APXfw3xtK3Vw07WX6umvg3hPk4AixGYwHEzibIEsnCR
WO//+f4XgpvDcAzJAeIwzcyVDDsA6LDbnRiy/nPnzNNNSaJ/dFV/SVL1Hl9w/vVo
Foo7kDynJH05NRwWoB7MJTqvxlorPBmWKLLClAhLz868JF6CGwcOrZx2S+n/LFHV
t+i5Nx1ym3HC24rfDHrWlBqnfiVXnV+XS62rhYl9VknfwitNKtJyI62vbVqKDii0
G8k3C6i9MDai20kNIQDwkRXIIOJDOQ==
=gXb/
-----END PGP SIGNATURE-----

--PPxI8paQBs33t8dK--


--===============0740628234196534469==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0740628234196534469==--

