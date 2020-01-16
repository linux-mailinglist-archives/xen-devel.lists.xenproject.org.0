Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B4713E574
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 18:15:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is8gH-0007cS-25; Thu, 16 Jan 2020 17:11:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=paQ2=3F=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1is8gF-0007cN-45
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 17:11:39 +0000
X-Inumbo-ID: 3c9454a6-3883-11ea-b89f-bc764e2007e4
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c9454a6-3883-11ea-b89f-bc764e2007e4;
 Thu, 16 Jan 2020 17:11:30 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 8D9AF57E;
 Thu, 16 Jan 2020 12:11:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 16 Jan 2020 12:11:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ZHKIFP
 KlLEMSuDscGa/T3arcAPDKGGeQMTOrnTisaWU=; b=BjiPnKFYShfG8SsCQgeQwB
 wzbNr52jNqc8UggTq2qEVmXrUn4paVBVEPjt6/9u2LjPeBoO25rwG8Gs8adQr3lY
 60CnnvJGwNL0XjqIQaeTeRfYWe3EVJFMnHA943lG2HyaHoj2w9HTx9vLlGtCpAuo
 97gYx0+B33EfKuvRFKwm/kI+flfzeYCPiWSmZ4eHC5lFhbCGHOYP5ebXwQJ2+r+G
 Elg/gGm6ATzi0mZAYWKNeVN1yLGAKvWMmOBdBLjaw2i1cePT2+fGUq5BKMW/PF5/
 k72oSQEmmucZSCGFgL5mts0iMNXkhd4xW4pz46aOPEtclrpajIusT0A7RCoi+XdA
 ==
X-ME-Sender: <xms:P5kgXmgJc24gE1Xn1oaszI1irGz-cBZJPeSbZ9ZtrOuyD0kUry654A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtdehgdelhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuffhomhgrihhnpehgihhtihhgnhho
 rhgvrdhtohholhhsnecukfhppeeluddrieehrdefgedrfeefnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgt
 ohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:P5kgXu8nRUEj4s8Ej9Ok4Cf9d-81aAO7fii2oRbJpcOUHrLNiguR3Q>
 <xmx:P5kgXlTETBTcKQeVOoIpxPj8HCI3m5sJra1YcYNe7rC2Bjkqim-3Bw>
 <xmx:P5kgXlttZocyVVQJYmYp9vXIHtTLYzxmV7WEZaLXPU25zmIyymN1gQ>
 <xmx:QJkgXpzFb4jB9mqI0HeFRjNeUYHgJ07hTw-hHiKT0BvuYNVBfYILbQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0D713306080E;
 Thu, 16 Jan 2020 12:11:25 -0500 (EST)
Date: Thu, 16 Jan 2020 18:11:23 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200116171123.GX1314@mail-itl>
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
 <ce51dd78fd7aa0856d160b2d94c82f68dd4e7056.1579055705.git-series.marmarek@invisiblethingslab.com>
 <f0712623-fbc7-eca2-8303-6cc6b46f36b1@suse.com>
MIME-Version: 1.0
In-Reply-To: <f0712623-fbc7-eca2-8303-6cc6b46f36b1@suse.com>
Subject: Re: [Xen-devel] [PATCH v4 11/16] tools: add simple
 vchan-socket-proxy
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============3152963304408598688=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3152963304408598688==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FclElvQKoGCylS3A"
Content-Disposition: inline


--FclElvQKoGCylS3A
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 11/16] tools: add simple vchan-socket-proxy

On Wed, Jan 15, 2020 at 12:02:42PM +0100, Jan Beulich wrote:
> On 15.01.2020 03:39, Marek Marczykowski-G=C3=B3recki wrote:
> >  .gitignore                          |   1 +-
>=20
> I guess this is why various non-tool-stack maintainers have
> been Cc-ed. It would have been nice if you had stripped the
> unnecessary Cc-s. I don't think ./MAINTAINERS can properly
> express a suitable rule of Cc REST if the adjustment is not
> simply accompanying the addition of some new output file.

Maybe a solution would be to make use of more .gitignore files in
specific subdirs? I see there are some, but for example tools/misc is
mentioned in _both_ toplevel .gitignore and tools/misc/.gitignore.

> >  tools/libvchan/Makefile             |   7 +-
> >  tools/libvchan/init.c.rej           |  60 ++++-
>=20
> Now since I've been Cc-ed, I'd like to ask what this is about.

This is obviously a mistake. Will remove in the next revision.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--FclElvQKoGCylS3A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4gmTsACgkQ24/THMrX
1yztFAgAmAIW5+jkSY0+KI7Q8Rizy7e7SJqw1mXsVeqpF3u+SiiEwbWt2Qw8+1G1
mhh4luZCyeEhzWIMe+FY+LZ02AqUV/B5q6MXxhAwMhCvmhu/kkei9J8hfeLOycDK
tZngyNjKFm0NG1iulE4VbviZA7RPKHueXci4/9jNuFgf0gw4tVQ8CJkpBehyhu4S
GKjdrqG52FMmoT1ZSA3bMt/46Q1GBPJWAHXWLN985DLwg3OZaudMJMB/8zBtQyL2
3SX5w/Xtj+hnY90uEXo2/1VUE51lDZOKvmchyXg0vr/Xf/0Ghcrj0tbCPCXp5VPT
NwbsE/6od3Hm+g+G3bvySi08MLEZGw==
=sNlv
-----END PGP SIGNATURE-----

--FclElvQKoGCylS3A--


--===============3152963304408598688==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3152963304408598688==--

