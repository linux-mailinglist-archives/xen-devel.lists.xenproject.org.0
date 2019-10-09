Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02011D0EB4
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 14:29:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIB3h-00055f-9h; Wed, 09 Oct 2019 12:27:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RT5Q=YC=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iIB3f-00055V-LN
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 12:27:11 +0000
X-Inumbo-ID: 1df36c80-ea90-11e9-96dc-bc764e2007e4
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1df36c80-ea90-11e9-96dc-bc764e2007e4;
 Wed, 09 Oct 2019 12:27:11 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id E639922131;
 Wed,  9 Oct 2019 08:27:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 09 Oct 2019 08:27:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ljWnFo
 +1ujMfQfc0vjap2OEA4evG3BaAAHTimFZcS68=; b=uFqTWH0AivqElQ+COvSbyj
 z6bFSijeTW7TArA+8CCMux6sxVvRlxM+5Jv3O3AoGi5ZTeYzaBC5Ll5hjhdE9aqr
 5/DhioTd1Vg4Yysu1eItaI5gdQS0K3wBDjEdisvr2jJ1q0mQwjiQXneStkgKxBFz
 1ZdzpxZkQHf/2nbb1tc5xLBqXVL7kZXI0kQsigAcmZrxb2u1Qe8cFLx6JaeWkp7p
 oJBA3fzncrZW9MI8VKBOj2EwWlc84ef7m2MVxea9oH+IcKty0Mlngrv9gbmxa+E6
 ZgphOapoQXbgN3FtBojvrYvfPFrwLyAiPpY0zwOy5A9t7055pdJMX3j8xCyXmlzQ
 ==
X-ME-Sender: <xms:HtKdXUtk_UaKahj1MpKwTVlOp7kAcGTQsQBYG0sPYpSv4FLQ_lwhAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedriedugddvjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppedukeekrddugeejrdduudef
 rddvfeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhish
 hisghlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:HtKdXYNm5uMFVphgfAwijQM5U23tBZOVOhI_oLUvsy9qit7-CT1Ahg>
 <xmx:HtKdXRg4q1b3pP_ORwRoOSQnorcq_34iwgbOVw0POGuISxarsbIxyQ>
 <xmx:HtKdXS5Hish765D89vgoILR40KAVGE_C0X0q64iwp6GcHYpW3u8zrQ>
 <xmx:HtKdXW-1pYKGNH0nQ2jr2GsqSz2ivPURTdA4RSQhdrYtV7HlPFrMKg>
Received: from mail-itl (188.147.113.233.nat.umts.dynamic.t-mobile.pl
 [188.147.113.233])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3C4D880061;
 Wed,  9 Oct 2019 08:27:09 -0400 (EDT)
Date: Wed, 9 Oct 2019 14:27:02 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191009122702.GS8065@mail-itl>
References: <20191008162922.GL8065@mail-itl>
 <815f3cbc-22c3-5a02-429b-0cdf12d84917@suse.com>
 <20191009103153.GO8065@mail-itl>
 <13c61616-25eb-019d-75fd-7ac72f8bf133@suse.com>
 <20191009110051.GP8065@mail-itl>
 <3a75989f-d655-3bb7-4a71-5421c6f8a625@suse.com>
 <20191009115254.GQ8065@mail-itl>
 <26a97d5f-5100-19ea-a945-f2954a3d9d09@suse.com>
 <20191009122109.GR8065@mail-itl>
 <bddff3b2-a0cc-1a7e-8702-86bea33c9e16@suse.com>
MIME-Version: 1.0
In-Reply-To: <bddff3b2-a0cc-1a7e-8702-86bea33c9e16@suse.com>
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
Content-Type: multipart/mixed; boundary="===============6243341657237457884=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6243341657237457884==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="15mzpIAI2q97mZMl"
Content-Disposition: inline


--15mzpIAI2q97mZMl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] Xen 4.12 panic on Thinkpad W540 with UEFI mutiboot2,
 efi=no-rs workarounds it

On Wed, Oct 09, 2019 at 02:24:31PM +0200, Jan Beulich wrote:
> On 09.10.2019 14:21, Marek Marczykowski-G=C3=B3recki  wrote:
> > On Wed, Oct 09, 2019 at 02:07:05PM +0200, Jan Beulich wrote:
> >> On 09.10.2019 13:52, Marek Marczykowski-G=C3=B3recki  wrote:
> >>> I'm talking about Xen->Xen transition here. How system table pointer =
is
> >>> passed from old Xen to new Xen instance? And how the new Xen instance
> >>> deals with boot services being not available anymore?
> >>
> >> It doesn't. I should better have said "* -> Xen transitions" in
> >> my earlier reply. I simply can't see how this can all work with
> >> EFI underneath without some extra conveying of data from the old
> >> to the new instance.
> >=20
> > Does it mean the whole discussion about SetVirtualAddressMap() being
> > incompatible with kexec is moot, because runtime services (including
> > SetVirtualAddressMap()) are not used by Xen after kexec anyway? If I
> > understand correctly, you just said the Xen after kexec don't have
> > runtime services pointer.
>=20
> The concern is about kexec-ing to Linux (based on what I recall
> from when I wrote this code; as said the situation may have
> changed for modern Linux).

But then, Linux won't have EFI system table pointer either, no? I don't
see Xen passing it over in any way.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--15mzpIAI2q97mZMl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2d0hYACgkQ24/THMrX
1ywPAAf+JulA4DtksKAa1vm1LO5S0mL5VR5r8Tkm9Jw51ljF/PqbatuWTa2pObR5
AwwFzLFsbfasB65Vm7fM819taUsMI7sUd/E4qKnIuyah3w5xrZ9jN69bKfMzqfXM
asKQOSSXjknTIjhxJ8/+5wh/nhcioXnwQf2+Xu+CVyMbTcJug1nJ4MWX82rzcWxX
m3MzlRTFrD2/bA9WBL/p4ranrF+AroCNG2P/m/tcZxzyMHCatHhF0GsoCGokOQea
FT7ZRaTZn8wj3gvzFkw4lubStYrvUrmg2mlVjGr7S4fCGrmb+mNlk0yQS67unlkV
H18DZ/+u22NZ+Fu2Bwis5kgwaKzMCQ==
=ridY
-----END PGP SIGNATURE-----

--15mzpIAI2q97mZMl--


--===============6243341657237457884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6243341657237457884==--

