Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ADDD0E10
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 13:55:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIAWe-0001nx-AX; Wed, 09 Oct 2019 11:53:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RT5Q=YC=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iIAWb-0001nr-Vk
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 11:53:02 +0000
X-Inumbo-ID: 578dd84a-ea8b-11e9-97ee-12813bfff9fa
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 578dd84a-ea8b-11e9-97ee-12813bfff9fa;
 Wed, 09 Oct 2019 11:53:00 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 748AB530;
 Wed,  9 Oct 2019 07:52:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 09 Oct 2019 07:52:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=dI1SJm
 kqmgI7/wwf42wVAXl4U3vQSvws+F2bJVpyT04=; b=cdcL85tu56fdO0LjnKGs9B
 ytVrvFWrKA5QG/Kqp8wPr1i47KollkDlMYHC+F7faOkXxwf6zNCEX6P9FPW0+Dc0
 hjXBGqrULmhbhCr8QGHxwoNz3p5+yO+JXOh5YXZogKCCHCHt39MkODQRR5mRBnuP
 r7xJGtw2THEHojUiARTESCPjfacOGhNEcIGhQ92s34XnrBxtycA9SHxA5gz9ggkA
 2BWBvELNyK+fg4nmQbShfm9DZNVZ5nN9PTJ2wYgrq8nhjHYYrGGaSASJZ6WjQF1o
 kaB7CoeYhoTl1m338PpOarJljsmuAPxTmSPTpoIQyg3EYeckqXaulx6u3m/IvgpQ
 ==
X-ME-Sender: <xms:GsqdXbz_itCXzk8S8a0I2OSJ9Spyiv-88qO3OF22SAbod4B-GuYreQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedriedugddvudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppedukeekrddugeejrdduudef
 rddvfeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhish
 hisghlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:GsqdXZRq1U6qmN3eChyFrY5hHNls-g-UxxWK0v0fMkOFVi0fRzuihA>
 <xmx:GsqdXS9PWBtdXhom9Jd62EJ4DpBWcHBeSRf5YlaBFpMySs38V5sN7g>
 <xmx:GsqdXQo67OQxBHbmvekF3DqrmbQyxjaTQH09P-Zy_p8F-Lyq7IeAKA>
 <xmx:G8qdXcOvA4HE7nSl-PnGEAcyFB0mq5I2nlZkYbAT2ReRow-kTjg5nQ>
Received: from mail-itl (188.147.113.233.nat.umts.dynamic.t-mobile.pl
 [188.147.113.233])
 by mail.messagingengine.com (Postfix) with ESMTPA id 346B08005C;
 Wed,  9 Oct 2019 07:52:57 -0400 (EDT)
Date: Wed, 9 Oct 2019 13:52:54 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191009115254.GQ8065@mail-itl>
References: <20191008115014.GI8065@mail-itl>
 <d7974227-0a42-c86c-d87e-18ce3168cd59@suse.com>
 <20191008135252.GK8065@mail-itl>
 <3251752c-117b-7a71-88ef-18e49aa63329@suse.com>
 <20191008162922.GL8065@mail-itl>
 <815f3cbc-22c3-5a02-429b-0cdf12d84917@suse.com>
 <20191009103153.GO8065@mail-itl>
 <13c61616-25eb-019d-75fd-7ac72f8bf133@suse.com>
 <20191009110051.GP8065@mail-itl>
 <3a75989f-d655-3bb7-4a71-5421c6f8a625@suse.com>
MIME-Version: 1.0
In-Reply-To: <3a75989f-d655-3bb7-4a71-5421c6f8a625@suse.com>
Subject: Re: [Xen-devel] Xen 4.12 panic on Thinkpad W540 with UEFI mutiboot2,
 efi=no-rs workarounds it
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============1477048279533514027=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1477048279533514027==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OxYbngvnDUoPDb+a"
Content-Disposition: inline


--OxYbngvnDUoPDb+a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] Xen 4.12 panic on Thinkpad W540 with UEFI mutiboot2,
 efi=no-rs workarounds it

On Wed, Oct 09, 2019 at 01:48:38PM +0200, Jan Beulich wrote:
> On 09.10.2019 13:00, Marek Marczykowski-G=C3=B3recki  wrote:
> > On Wed, Oct 09, 2019 at 12:50:09PM +0200, Jan Beulich wrote:
> >> On 09.10.2019 12:31, Marek Marczykowski-G=C3=B3recki  wrote:
> >>> BTW How runtime services work after kexec? I don't see EFI handles
> >>> handed over kexec, are they somehow re-discovered?
> >>
> >> What EFI handles are you talking about? For runtime services
> >> what a consumer needs is a table pointer, which is a field
> >> in the system table, which in turn is an argument passed to
> >> the EFI application's entry point.
> >=20
> > Yes, I'm talking about those pointers (system table specifically).
> >=20
> >> I didn't think there are
> >> provisions in the spec for either of these pointers being NULL.
> >=20
> > But I don't see kexec using EFI application entry point. Am I missing
> > something?
>=20
> Can we stop thinking about a Linux -> Xen transition on this
> thread please?=20

I'm talking about Xen->Xen transition here. How system table pointer is
passed from old Xen to new Xen instance? And how the new Xen instance
deals with boot services being not available anymore?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--OxYbngvnDUoPDb+a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2dyhYACgkQ24/THMrX
1yyBAQf/UV/oKm1DhwX39++cCcjNX5s/A5UnyL0t5rxZ6BOhKvb/bo1YBQ35VIs8
LhHpf6yr4LqizYm95gTw7MHO+McHvROeZpKrulLupGT4VYsVNf9M/Uxz51zhRJw4
ZNd7PAow6eLjvm8BG32noFMPhMtBiUS/ASIKgFEiOf9fZ+C/HFUIWjkb9wTRE/AW
nWy0QU5RhMQXxkm8hql0FMu+a7DGtKkt3WlXyoOLJojmMLAY1Tf9k2f/tk8mS4lG
P3h11SpyU4vCwRVi4fZVAzgl6QwepL7Ql3oUCgvHjnctqsFmVeJ69tehY7/DFufg
LYKJA8nnFzpUm2LH+tfWwF/IAAlcJw==
=rVnm
-----END PGP SIGNATURE-----

--OxYbngvnDUoPDb+a--


--===============1477048279533514027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1477048279533514027==--

