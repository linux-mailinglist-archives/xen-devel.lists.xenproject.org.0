Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCBAFFCD8
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 02:29:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWVoy-00070h-UJ; Mon, 18 Nov 2019 01:27:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9k5L=ZK=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iWVoy-00070c-5e
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 01:27:16 +0000
X-Inumbo-ID: 8d91b624-09a2-11ea-a2d0-12813bfff9fa
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d91b624-09a2-11ea-a2d0-12813bfff9fa;
 Mon, 18 Nov 2019 01:27:15 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 287B121951;
 Sun, 17 Nov 2019 20:27:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Sun, 17 Nov 2019 20:27:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ZsTF6Y
 Sc+hTK9CymDVvBFTXm/9jt3JVYGvuc7ITmixw=; b=NB53XLzk/1N3xMRXeBRz2g
 006bXBdamY/i53tBwdYfYa26EbeGYJ4fI3uxpGpTpZ6TxTpeqi53e1XgnWmRIIk2
 Z26wZDE6zV+EoBo/lzBE9exQn0W1cEWJaJsQVMqAbOTlzh7ZsKM7oUb7CXPK6Q6M
 r60y9vhwl/hD1wLqOzvN3d52Aqp2g/ZeAygLEuIUkyVRq5j1sbNlPTHNMrJEnnZG
 QRBCG4M+lrf+5rDzMn0LZcSPXEkcduMBo4wXeLN8OXh2HYodau5eGuogIrRDHlXr
 O7Fp1b4/cI5+RrWmDtIJjfYfZGf1iZDMJ6YYn9uA6IWT3c3l+xgvjdEy3elRw2bw
 ==
X-ME-Sender: <xms:cvPRXdLOzmI4QBwOe2GidIaMmrbUthJSqsqTrPQE4WMqorpjPNfgYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeggedgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:cvPRXU8mqGI_ERXPu8iD1bWugF-5xEz5WFDPdSNMM4ugoiGdk-y6zg>
 <xmx:cvPRXRGDKK_-s9Se6215Bx5BMk0Dly2ttGqQsSjE4bIzafwKSdmclg>
 <xmx:cvPRXX5RW76mR-dlbh_A3thou6UlrnJsmBIqZJ9rw8V-b_8_VEaTMA>
 <xmx:c_PRXUmQch3LfrBV6tYz2iF3px5dAkCrQAQwecNMiaj3mOyhd0zgSA>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 170B6306005E;
 Sun, 17 Nov 2019 20:27:13 -0500 (EST)
Date: Mon, 18 Nov 2019 02:27:11 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Roman Shaposhnik <roman@zededa.com>
Message-ID: <20191118012711.GE5763@mail-itl>
References: <CAMmSBy9VN9fFC1M5P7OdLOiwZdgWjjWjMWppA63gnOe5wwGr4A@mail.gmail.com>
 <20191116230744.GC4109@mail-itl>
 <CAMmSBy8ZN4ihufbihSS5bxLKU-feMgfUNi2zDgcCuE9NL9pePA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMmSBy8ZN4ihufbihSS5bxLKU-feMgfUNi2zDgcCuE9NL9pePA@mail.gmail.com>
Subject: Re: [Xen-devel] Likely regression in efi=no-rs option
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
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============9202985640844692381=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============9202985640844692381==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sZvnRN25x3w09J/6"
Content-Disposition: inline


--sZvnRN25x3w09J/6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] Likely regression in efi=no-rs option

On Sun, Nov 17, 2019 at 05:06:11PM -0800, Roman Shaposhnik wrote:
> Rich, Marek, thanks a million for quick replies -- I'll try your
> suggestions tomorrow in my lab.

To make use of the change, enable "EFI: call SetVirtualAddressMap()" in
menuconfig (Common Features), visible only with XEN_CONFIG_EXPERT=3Dy.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--sZvnRN25x3w09J/6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl3R828ACgkQ24/THMrX
1yy3Qgf+Jr4x1r0R11GrH+4UhjC4pxEajCeoBynjmiJPl1EiJvKJFx5j+ekMAFIt
7rbA8xubR2faJ46vrnVN/YbrIKo2LY8UDgzmma0LaRRdWF/W6i3T7V7oSK9kOqIc
OCYPD4wZF2WVPFbyvqocTiFUHVMaOiVsbH1yAyZxoaWcOqAmMCMC3sW9hcmCeGwZ
2WPxyVFTbOOmVb+iSEiDqhxVO1sdW7bKjVncN04dBB+chJzKsYYNabyIXO9uS2Xc
9L3MMrGoQWmZmsU91V8U6MdbZQ5wjABLgkSTrqclGx2hwANVmCm0ZNtQBx21IRoF
smhxlxPHlpNo+FY7kHzP6Gl9TGbDwQ==
=RZR0
-----END PGP SIGNATURE-----

--sZvnRN25x3w09J/6--


--===============9202985640844692381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9202985640844692381==--

