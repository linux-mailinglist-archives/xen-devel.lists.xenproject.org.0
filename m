Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD885267F4D
	for <lists+xen-devel@lfdr.de>; Sun, 13 Sep 2020 13:14:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHPwH-0000DT-IO; Sun, 13 Sep 2020 11:12:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U+xY=CW=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kHPwF-0000DO-UU
 for xen-devel@lists.xenproject.org; Sun, 13 Sep 2020 11:12:56 +0000
X-Inumbo-ID: 578f744f-b345-485b-a732-8b13fc7cacb3
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 578f744f-b345-485b-a732-8b13fc7cacb3;
 Sun, 13 Sep 2020 11:12:45 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 28BCF5C0100;
 Sun, 13 Sep 2020 07:12:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sun, 13 Sep 2020 07:12:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=qkaGO6
 13xHDgOQ1dMOtJ3ILZnaH7yMzukBi2itCe+o0=; b=q60cSkdBz+AcmpOSDXb4Pn
 YQYhrVkVCm6baixMDqbv93WNDP6g/ytDr3iyLvY+1rDTUOKdo230yKeCFv2Z7yJK
 JYD9hUC1/qNfwejCAutlv9BiAbW7jRo3TFs2TSQ1be8zM9t/jsfY9aaOIsoINxZT
 7x+5QJ2IynSpkL1h+bKUzdY2vwZewID+AfW4FNuCUDuf4Gj7x1enEzjDkzRjK3U7
 EBfrr4kvpsWhKLGY9p2MQFGwiuC9B+HNpA/V+4iKN0UP1b4ol0a+f8mJfhftUWs4
 Rom1JOL9EtJi6jORfe5MB+JdxEXL5AHOBcS6haMdH3syIWc/BtQCljNn60i9igPg
 ==
X-ME-Sender: <xms:rf5dX3K1joewC0tz7c3PtWE5tXRrGyhbd6A-rezi_GXRnvl5EvxURA>
 <xme:rf5dX7LJ1VdeyuK0LqufFhpBCVz51Ls0rRmAzCZ21rYDXRfcM3JhoNIHsL0tnccN6
 zqb44q8F92ZQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeifedgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
 iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucfkpheple
 durdeigedrudejtddrkeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
 drtghomh
X-ME-Proxy: <xmx:rf5dX_sktbwgEi7V7YNAfiiSVTM_iGkV5fLypvGMVZrHoJS5wdRfOA>
 <xmx:rf5dXwatoR5uAf_1fPezNcT75hej0F6z6p1gtjdoQ6vfYT2JW9FCGA>
 <xmx:rf5dX-bTFT6E5oqhGpG9R-OOkl3ZzhXKLR58I2KKVncL4LoCzAKFDg>
 <xmx:rf5dXxwTgzQ8rP_2tXese-TIOUrDLFaGvMgSwPh1LQkvHuw9_VUVGg>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id DACA5306467D;
 Sun, 13 Sep 2020 07:12:43 -0400 (EDT)
Date: Sun, 13 Sep 2020 13:12:39 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: libxl - b_info.{acpi,apic} behaves differently than
 b_info.u.hvm.{acpi,apic}
Message-ID: <20200913111239.GB3962@mail-itl>
References: <20200910035723.GY1626@mail-itl>
 <20200910085148.GU753@Air-de-Roger>
 <20200910102921.GZ1626@mail-itl>
 <20200910104104.GW753@Air-de-Roger>
 <20200910105854.GA1626@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
Content-Disposition: inline
In-Reply-To: <20200910105854.GA1626@mail-itl>
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


--gj572EiMnwbLXET9
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: libxl - b_info.{acpi,apic} behaves differently than
 b_info.u.hvm.{acpi,apic}

On Thu, Sep 10, 2020 at 12:58:57PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Thu, Sep 10, 2020 at 12:41:04PM +0200, Roger Pau Monn=C3=A9 wrote:
> > Adding toolstack maintainers.
> >=20
> > On Thu, Sep 10, 2020 at 12:29:21PM +0200, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > On Thu, Sep 10, 2020 at 10:51:48AM +0200, Roger Pau Monn=C3=A9 wrote:
> > > > On Thu, Sep 10, 2020 at 05:57:23AM +0200, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > Hi,
> > > > >=20
> > > > > After updating from Xen 4.13 to Xen 4.14 I have troubles starting=
 any
> > > > > HVM: just after hvmloader saying "Invoking SeaBIOS" I get "(XEN) =
MMIO
> > > > > emulation failed (1): d29v0 32bit @ 0008:fffeedf d -> "
> > > > >=20
> > > > > I come to a situation where seemingly the same domU started via xl
> > > > > works, while when started via libvirt it crashes. This seems to be
> > > > > related to xl setting b_info.{acpi,apic}, while libvirt setting
> > > > > b_info.u.hvm.{acpi,apic}. Modifying libvirt to use the former fix=
es the
> > > > > issue.
> > > >=20
> > > > Could you print the values of the involved fields at the end of
> > > > libxl__domain_build_info_setdefault in both cases?
> > > >=20
> > > > I'm not able to spot what changed between 4.13 and 4.14 that could
> > > > alter the behavior, but knowing the values at that point might make
> > > > it easier.
> > >=20
> > > Sure, will do.
> > > It may be also something else: maybe it acpi/apic settings were broken
> > > before, but did not results in a domU crash this way.
> > > FWIW when looking into /var/lib/xen/*-libxl-json I clearly see
> > > difference between b_info.{acpi,apic} and b_info.u.hvm.{acpi,apic}.
> >=20
> > I think libxl__domain_build_info_setdefault should check whether
> > b_info.u.hvm.{acpi,apic} is set and copy those into b_info.{acpi,apic}
> > if those are not set?
>=20
> Looking at libxl__domain_build_info_setdefault this is not the case.
> Instead there is libxl__acpi_defbool_val which looks at both.
> Oh, and there is no similar thing for apic -> b_info.u.hvm.apic is
> ignored!
>=20
> > Toolstack people is more likely to have an opinion here, or to help
> > debug the issue.

Ok, The crash reported initially was caused by a different thing: using
seabios.bin instead of seabios-256k.bin (should that really cause the
crash? shouldn't 128k seabios build work too?). But in any case, I think
the b_info.u.hvm.{acpi,apic} is also not in a good shape.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--gj572EiMnwbLXET9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl9d/qgACgkQ24/THMrX
1yzhGAf/SylIfsLu/Bhc29oWlvnj0e3P0uOff35nc8B59FuAJzF8qiQZe3F2icKc
X661IPrFHNLusLhU+dhdg28o1P85oPnlUHedzlauCBetOkW1gu2yi493qQv8wT4f
WOpd8iuhP1skApyPWfskB9Q7Gyclt24dLGiQXno9YoCXzrYKFEFGWSLh0dZLp8uq
MBnVc4qtl1w3eUmOFk3XgNGSVLTpRQ4JUwp5DIBSe/5WkqTGNHIe2v9z4/64wXk8
MIXj+hbHFsdOqNgfHw+nubm1E64KR70lC7M2MX1Tyq1TJ/R8Khjeyv6JdkvYAYdD
i6aZYyasFasE920y1xfKYn4AETm1hg==
=jL6w
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--

