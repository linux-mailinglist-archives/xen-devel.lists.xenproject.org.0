Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5312527AAE4
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 11:37:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMpai-0004gl-72; Mon, 28 Sep 2020 09:37:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E4h+=DF=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kMpag-0004gg-Hq
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 09:37:02 +0000
X-Inumbo-ID: 3c8fd764-3da2-4651-9ff9-d72d994022ce
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c8fd764-3da2-4651-9ff9-d72d994022ce;
 Mon, 28 Sep 2020 09:37:00 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 62578C66;
 Mon, 28 Sep 2020 05:36:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 28 Sep 2020 05:36:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=6ctkZH
 bGTWXsVkzKL8+ez/1CD+AU2VN/Vmr5jwB22kc=; b=r/KCV/zr9Ti8I4OKtZhpZH
 /ZKKgAXXxAdzC8dVNql7QmDU4U4cVuy7hbTRewz7unu6PNXsJ5FxskFFZxl90omd
 WBmg2GD9ZTJA1SGR7AIl2f6gfseavYFHk8wlaMY4S4jGBs/2RwU/kQGlatwPveHY
 RkoDXHOELXj78soMI1S8o0oLdUr2zk3aLNGErWJ1RupPMhFjbXiSrSyGq4SIzePI
 I1NcWpgMHVeFvKUJTfZADEhJdL5Fi/EXx0r8U5b1fammw1AiIFMTl1nGv/g7kXzb
 v97bTDRlS/lm5oG/pJl46fKx27v3PJPgLGPR9msTVCFPPY/CfibLmzy/P1T7nLQg
 ==
X-ME-Sender: <xms:uq5xX5rYTtOier_X7Armukbr0LZFK5UsAuD17Pd2Q_qppk78q-4Www>
 <xme:uq5xX7qxGlFjN6mDPM6bpfEsJwcHe8PLljnCJpwqK5CL6hMX9l59rGzU-4PblX3H_
 CQ7DIyScMntmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdeigddulecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
 gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecukfhppeelud
 drieegrddujedtrdekleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
 gtohhm
X-ME-Proxy: <xmx:uq5xX2Mg456l9VZEDhW_pulykghkzE4bZnY-5m42AB0I1E_JWOSkCA>
 <xmx:uq5xX04o9a9kz9pmhrRdt_zCpTWLFzxtldJypWnl9LeiuYeCIp8HZA>
 <xmx:uq5xX44BxDXhp5LeVEj7aY6-pmAOA6Uet3BAkNyEqEUYWz2u3MboEw>
 <xmx:u65xX2mwl72jiBIzZqOpnKxGDUbX3RRveVrZzB3qR_o6rGkfvWG3Lg>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7F07F3280059;
 Mon, 28 Sep 2020 05:36:57 -0400 (EDT)
Date: Mon, 28 Sep 2020 11:36:54 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Denis Efremov <efremov@linux.com>, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org, xen-devel <xen-devel@lists.xenproject.org>,
 Roman Shaposhnik <roman@zededa.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Kernel panic on 'floppy' module load, Xen HVM, since 4.19.143
Message-ID: <20200928093654.GW1482@mail-itl>
References: <20200927111405.GJ3962@mail-itl>
 <26fe7920-d6a8-fb8a-b97c-59565410eff4@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2+XEzv9QEhmMrrEN"
Content-Disposition: inline
In-Reply-To: <26fe7920-d6a8-fb8a-b97c-59565410eff4@suse.com>
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


--2+XEzv9QEhmMrrEN
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Kernel panic on 'floppy' module load, Xen HVM, since 4.19.143

On Mon, Sep 28, 2020 at 07:02:19AM +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 27.09.20 13:14, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi all,
> >=20
> > I get kernel panic on 'floppy' module load. If I blacklist the module,
> > then everything works.
> > The issue happens in Xen HVM, other virtualization modes (PV, PVH) works
> > fine. PV dom0 works too. I haven't tried bare metal, but I assume it
> > works fine too.
>=20
> Could you please try bare metal?

I don't have any hw with floppy controller at hand...
Booting on what I have, it works, loading floppy just says -ENODEV.

> Working in PV and PVH mode, but not in HVM, is pointing towards either
> an issue in IRQ handling (not Xen specific) or in qemu.
>=20
> It might be that Xen is advertising a rarely used APIC mode. In case
> bare metal is working it might be helpful to have APIC related boot
> message differences between HVM guest and bare metal.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--2+XEzv9QEhmMrrEN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl9xrrUACgkQ24/THMrX
1yxZoQf/UQsoHA6L/pBhHrpQ9iyJPYVA+o3GzS/LAhdKQWTyaot8Uksznsk6Danm
Lq/CLQMNTwD7643mcoHshPrc6WhqZZvofLIsx1pDeXJArzgZQ6MObvd0sNm++X6s
sGlU6nPeqWeZeRmZq1R5dsqrXjk8XlI/MfxspwNMDHNJTeFrFLbBtPPbAHDP0KuF
0pib6ULnw/g5k+WbPKhq3xBzTlH5cSxz3DgIGT76H29CrD103PL1xhAjRB/gFN0w
xP+XAbjuxsn2IfjQEflLlyCARaFBS60LvCEI5YRIljXIVxUdfhEJlLR8myt0yOLg
sVxSK29dsfW/aG5SKMrH5U0hX/3b3A==
=ubn6
-----END PGP SIGNATURE-----

--2+XEzv9QEhmMrrEN--

