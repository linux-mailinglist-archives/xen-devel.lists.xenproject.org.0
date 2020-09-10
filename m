Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BC026441B
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 12:30:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGJpb-0005xN-Dr; Thu, 10 Sep 2020 10:29:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sM5j=CT=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kGJpZ-0005xI-O9
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 10:29:29 +0000
X-Inumbo-ID: 0b38899d-f3b8-48e7-af37-02e1c9af5c57
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b38899d-f3b8-48e7-af37-02e1c9af5c57;
 Thu, 10 Sep 2020 10:29:28 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id BEF7B8E8;
 Thu, 10 Sep 2020 06:29:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 10 Sep 2020 06:29:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=TNzjk3
 ia4ViLQYEj9Nqm9sfuMhFQYNikNmVbW16yBdc=; b=hbP5Ihg7IEvj/mZS3H9HAa
 Lth5gCI2YsqHIKxFs2WGxdEPcMC4zQk5q326jQGdgSvXkYcXrh8uQoZYT7C/LXcD
 oLzPBUvF5wCq3Y0hGVT8EegjXL32JvIoZvamx6gfxL7rEfcCzOI75fD0VVpcorir
 ANAGwX+hFsEDkQN75Gkr98HLgk+/yT0p7XZmkcLHf29Ol54Bs2sie1bEAdxytLaf
 yDrK3lV7+YyZ8QDIeNX/PHVHL/TTphotOjT+QcmiNR/u2ydXIKKZqT2vq6E3eMZM
 cKpCQPnNhb48CfWtLpGruAkgUnRTX67i519wxmHtL/kZkl+Brxgl4wZhUpE/Zx8A
 ==
X-ME-Sender: <xms:BgBaX6ahddexEYw_6ZhroqyeweZYx6G-AaZRauwjX4o_4wDH01pEOA>
 <xme:BgBaX9YTT6242sELQU9xSNi-Jvj-dU3sj_FzdB7gX-0ifdUx2ctuD7b6zTavz5k8a
 NwcZUTJ7BUxEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehjedgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeihedt
 hfeghfeiudefudevfeeufeeltefghfdtgeegudevudfhleeljeetvefgteenucffohhmrg
 hinhepgigvnhhprhhojhgvtghtrdhorhhgnecukfhppeeluddrieegrddujedtrdekleen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmh
 grrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:BgBaX08OJqu5z6hO3v8L50Y6XwthYPyQIZxfoy-yQ6r6MbR_fIcvgg>
 <xmx:BgBaX8p9xgez-Vn4JgX3TE3CsneSYvgxMhxdZVmOUkcQ0FNkRQ9PaA>
 <xmx:BgBaX1rPAgP_9Vhk37WBrmWE8-aEm4H324yEoE3dOHI7mJi9Ea06XQ>
 <xmx:BgBaXy1b3tiU2VDE60wLOI91C8NPerbr16gk8Y7PrG3o2UsC2yMnYg>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id A3EFE306468F;
 Thu, 10 Sep 2020 06:29:25 -0400 (EDT)
Date: Thu, 10 Sep 2020 12:29:21 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: libxl - b_info.{acpi,apic} behaves differently than
 b_info.u.hvm.{acpi,apic}
Message-ID: <20200910102921.GZ1626@mail-itl>
References: <20200910035723.GY1626@mail-itl>
 <20200910085148.GU753@Air-de-Roger>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YZlgiSU82KsurN9l"
Content-Disposition: inline
In-Reply-To: <20200910085148.GU753@Air-de-Roger>
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


--YZlgiSU82KsurN9l
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: libxl - b_info.{acpi,apic} behaves differently than
 b_info.u.hvm.{acpi,apic}

On Thu, Sep 10, 2020 at 10:51:48AM +0200, Roger Pau Monn=C3=A9 wrote:
> On Thu, Sep 10, 2020 at 05:57:23AM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Hi,
> >=20
> > After updating from Xen 4.13 to Xen 4.14 I have troubles starting any
> > HVM: just after hvmloader saying "Invoking SeaBIOS" I get "(XEN) MMIO
> > emulation failed (1): d29v0 32bit @ 0008:fffeedf d -> "
> >=20
> > I come to a situation where seemingly the same domU started via xl
> > works, while when started via libvirt it crashes. This seems to be
> > related to xl setting b_info.{acpi,apic}, while libvirt setting
> > b_info.u.hvm.{acpi,apic}. Modifying libvirt to use the former fixes the
> > issue.
>=20
> Could you print the values of the involved fields at the end of
> libxl__domain_build_info_setdefault in both cases?
>=20
> I'm not able to spot what changed between 4.13 and 4.14 that could
> alter the behavior, but knowing the values at that point might make
> it easier.

Sure, will do.
It may be also something else: maybe it acpi/apic settings were broken
before, but did not results in a domU crash this way.
FWIW when looking into /var/lib/xen/*-libxl-json I clearly see
difference between b_info.{acpi,apic} and b_info.u.hvm.{acpi,apic}.

> > So, handling the old option got broken sometime between 4.13 and 4.14.
> > Or perhaps it is some other related side effect.
>=20
> Libvirt master tests seem to have been failing for some time (60 days)
> in the build phase [0], maybe you are using a newer version of libvirt
> than what osstest is currently testing? (Xen flights are currently
> stuck at libvirt commit 2c846fa6bcc11929c9fb857a22430fb9945654ad).

I use libvirt 6.6.0, so even older one, and in fact updated it from
6.4.0 together with Xen 4.14. But I don't see relevant change between
those two versions.

BTW The libvirt build may require more attention, they've changed build
system... Now it is built with meson/ninja (haven't figured it out yet).

> Thanks, Roger.
>=20
> [0] http://logs.test-lab.xenproject.org/osstest/logs/152881/build-amd64-l=
ibvirt/6.ts-libvirt-build.log

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--YZlgiSU82KsurN9l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl9aAAEACgkQ24/THMrX
1yy/hwf/Z2Bk+OybqVriEqukX1tnt9ldtAS4toXw53xscHtWjczNfh6AZVH4EjvZ
iaVOtwlQsPCZvnn8/b7OO/y5x69DHBzv4sJVhKmcNWpdewe63tmyQ9kYJTRwErbQ
grCWgNKtZYml7z4ydOTr6hfRzz7QQkQZ26/pqXkf+s/1kMcolSF5XHj7kmDcfx/e
RHE60hadxIIiJcct8c7+BYnhk7UYKRb8h0nObY1zvM83OWcd9U7UBdwZuQSU8FTj
WgIbpA3JFNbE9JoCvCVeC1iOB5ttSlP7ag497muOyvoadbBu8miHCUTNsAywVibR
BRbJqoDXEHw4Nl4bnYCRZ78fF5dIWA==
=MzfC
-----END PGP SIGNATURE-----

--YZlgiSU82KsurN9l--

