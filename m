Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C84C1106
	for <lists+xen-devel@lfdr.de>; Sat, 28 Sep 2019 16:22:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEDYm-000315-Ku; Sat, 28 Sep 2019 14:18:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9Ov/=XX=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iEDYk-000310-Sx
 for xen-devel@lists.xenproject.org; Sat, 28 Sep 2019 14:18:55 +0000
X-Inumbo-ID: e67c3018-e1fa-11e9-969b-12813bfff9fa
Received: from new4-smtp.messagingengine.com (unknown [66.111.4.230])
 by localhost (Halon) with ESMTPS
 id e67c3018-e1fa-11e9-969b-12813bfff9fa;
 Sat, 28 Sep 2019 14:18:53 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 635C025EA;
 Sat, 28 Sep 2019 10:18:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Sat, 28 Sep 2019 10:18:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Q9n27A
 UfU6NIW8tEL2bSqKIBliP7mlNY691zXrZigho=; b=wz/f4KekI9uiM5ivRf2u3u
 NLe0slbi9LMDH/ghVNYih9g7tefEq/m5MVqgfNRAonNY/QtMne8618ugi9IVaw5W
 KWTRYhW9wpo5lsTl6FRx1hc8XTCVudG0/4+88J/GLMT4YMKhbsDD6kw22QzY7gMy
 RboOnITnTfkpDsBJXdPB4nIn2fLo3x3b/8Y3yr6rocNgixPeHEzfPww4GzppENzr
 4m4+E9hoJNKHkVrTFLMRS6I/sv5SRfDers2y5T1SpeJn+IoXNK3bUcynLwI5m/xM
 YzeRRRyL9kVYS2/vv4iRTwF72JChOopweUwrEo/WGfzwUpQiw0iIY7kyB2Q8qimw
 ==
X-ME-Sender: <xms:y2uPXdWkghdxoSWUUO7CbzFOKn25-H2hAoHzzDpLIoCbaPDNg0HDSA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeekgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedrfeef
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvg
 hthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:y2uPXTksp-UNJP9xZ-2U8gcKKlJqi_uIY6eiLs4N2i5JpjXC5KtYug>
 <xmx:y2uPXXAAvmB_ISVZR6SpR6-7xtYtxQDobJSnrGug-7SLxD4uL0eGpg>
 <xmx:y2uPXbcYZZTp8HPiXyIhQJKf2ANjuvBQPogaDtt2088lJzv3s2sZow>
 <xmx:zWuPXd54TbqmgyOU1K9--nizMsHKG770tWXoryMT5FfIajd6Sh48Fw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 210F9D6005A;
 Sat, 28 Sep 2019 10:18:50 -0400 (EDT)
Date: Sat, 28 Sep 2019 16:18:47 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20190928141847.GY8065@mail-itl>
References: <cover.e819a32509fb1a6bdcbdcefb2de053ccf2361d59.1569379186.git-series.marmarek@invisiblethingslab.com>
 <3c113ed5-2a8d-8ebe-80af-a56d4ff69f25@suse.com>
 <20190927143608.gx72psr2yl5ixesd@debian>
MIME-Version: 1.0
In-Reply-To: <20190927143608.gx72psr2yl5ixesd@debian>
Subject: Re: [Xen-devel] [PATCH v7 0/4] Fix PCI passthrough for HVM with
 stubdomain
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============2346682522380890240=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2346682522380890240==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s5qk6JBqzdA2H2Nv"
Content-Disposition: inline


--s5qk6JBqzdA2H2Nv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v7 0/4] Fix PCI passthrough for HVM with
 stubdomain

On Fri, Sep 27, 2019 at 03:36:08PM +0100, Wei Liu wrote:
> On Fri, Sep 27, 2019 at 04:21:55PM +0200, Jan Beulich wrote:
> > >=20
> > > Marek Marczykowski-G=C3=B3recki (4):
> > >   libxl: do not attach xen-pciback to HVM domain, if stubdomain is in=
 use
> > >   libxl: attach PCI device to qemu only after setting pciback/pcifront
> > >   libxl: don't try to manipulate json config for stubdomain
> > >   xen/x86: Allow stubdom access to irq created for msi.
> >=20
> > I did commit the last one, but I'd prefer if one of you could take
> > care of the three libxl ones.
> >=20
>=20
> I tried to apply the first three. They don't apply cleanly. That's
> perhaps due to Anthony's series which got committed recently.
>=20
> Marek, do you have a branch?

This rebase turned out to be fairly complex, because of the whole pci
attach got reworked for async api. So, I've done it, but dropped your
ack on the patch needing rework for this reason. And also found one
regression introduced by Anthony series.

All in all - v8 on its way, still 4 patches (+1, -1).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--s5qk6JBqzdA2H2Nv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2Pa8cACgkQ24/THMrX
1yxi6Af/QlhGVs/8fgGPWQyxUEZlH/eDM6pNr5WfC235Ie0puB/zDSJRSESMgWzL
Koim6e6LMjbWtFUQ6cXifNEWJ8K2LxkQH7ZinQFxZD8AszdD1EEaAVhuPmWNItHt
oxSAmZOtdPTo1vcOuCK+TBKqEn/dvP6l2EIojc82BvO0woNeRWQVV561cYctj3WO
B5ay82Anx+iRVHOjp8u3Ck0OZ8ihRr/M7i15m4wIIOgyoXc1W2SBb+lQs8EoAL8X
H9jiuLjGmRl7hHNYlq8RCB2xjUEwkWzlH386nLuyTaJOAUJvLH2N5H9ZZ1fnc9nL
zz8XEU7ENGQ6P6RcYj98x/YAU7KGIA==
=nyRP
-----END PGP SIGNATURE-----

--s5qk6JBqzdA2H2Nv--


--===============2346682522380890240==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2346682522380890240==--

