Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F06F2644E6
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 12:59:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGKIB-0000MB-QE; Thu, 10 Sep 2020 10:59:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sM5j=CT=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kGKIA-0000M6-Ui
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 10:59:02 +0000
X-Inumbo-ID: c370dc42-3474-48b9-9d09-4880487a06fc
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c370dc42-3474-48b9-9d09-4880487a06fc;
 Thu, 10 Sep 2020 10:59:01 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 3A40AA22;
 Thu, 10 Sep 2020 06:59:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 10 Sep 2020 06:59:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=3ZtNmo
 56vjkcNNVYyA8fLARC8+VWNS2YZphb1u9cNi0=; b=lesAjiw/c0PPqlJkQl6Omt
 5Vj0wiUkMmRYaL3CbZFCffnlfrEfFgfZN56f39VCqHzE7lANmkz8R0ap0PUHipQM
 6S5PYHBUUZMyoGj1NbDJNHXAgXA2f8UJYR5WRyyPbvb3nVDEyTSfvDouVLRXpFM9
 LUdlp3VqOvZQOs3jgKIdlZX8nGlL9DpsLXXYByCbJ7Yk4KKXeZaqeBke2d65xdc8
 moCy/FUuMrKt/TZ1lPcmWdf4xHWimzrD21i8sjSh7Bm3srIJnW8m1B3L4CnRCsbA
 aygS1+z6ngmASj/ZUV/Y+mb8xV9Ks4MR800EWXHQskzrWmD3SoeCBtxaYmmWCSmA
 ==
X-ME-Sender: <xms:8wZaX8TkOzd2_omcRQJ6od2YWQwiF4QR9ejqiV80NzdR-zaDH35oLQ>
 <xme:8wZaX5ybrnhi1MzPG-RdVEQoTIs6X9DZIJIR45ltyxOMSDKf1d6wxyVOJ4bXvnvtj
 hmSBS82ou0YaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehjedgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
 iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucfkpheple
 durdeigedrudejtddrkeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
 drtghomh
X-ME-Proxy: <xmx:8wZaX53BVvX0kW0Q_hEeUD3gTRabbLXgYiYmAm_7FVPTRL0mr94jtQ>
 <xmx:8wZaXwDqgk-Gd56ZmEMX2NGbh7V7cYNIkZV6iA4bqm5uhG_GmWTh2A>
 <xmx:8wZaX1hmPW0a3ZTt_lFUiyGCUfnn4Xf3M5fCyUcl4p-3lj-1C6zvUw>
 <xmx:8wZaX1Y1jXx9GoFAz7oM-qiQ82YgRwR8T9H4Sj6q2cBIq-xVnnbNPQ>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8614C3280060;
 Thu, 10 Sep 2020 06:58:58 -0400 (EDT)
Date: Thu, 10 Sep 2020 12:58:54 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: libxl - b_info.{acpi,apic} behaves differently than
 b_info.u.hvm.{acpi,apic}
Message-ID: <20200910105854.GA1626@mail-itl>
References: <20200910035723.GY1626@mail-itl>
 <20200910085148.GU753@Air-de-Roger>
 <20200910102921.GZ1626@mail-itl>
 <20200910104104.GW753@Air-de-Roger>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eBor3w/3Tk4fTrOq"
Content-Disposition: inline
In-Reply-To: <20200910104104.GW753@Air-de-Roger>
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


--eBor3w/3Tk4fTrOq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: libxl - b_info.{acpi,apic} behaves differently than
 b_info.u.hvm.{acpi,apic}

On Thu, Sep 10, 2020 at 12:41:04PM +0200, Roger Pau Monn=C3=A9 wrote:
> Adding toolstack maintainers.
>=20
> On Thu, Sep 10, 2020 at 12:29:21PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Thu, Sep 10, 2020 at 10:51:48AM +0200, Roger Pau Monn=C3=A9 wrote:
> > > On Thu, Sep 10, 2020 at 05:57:23AM +0200, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > Hi,
> > > >=20
> > > > After updating from Xen 4.13 to Xen 4.14 I have troubles starting a=
ny
> > > > HVM: just after hvmloader saying "Invoking SeaBIOS" I get "(XEN) MM=
IO
> > > > emulation failed (1): d29v0 32bit @ 0008:fffeedf d -> "
> > > >=20
> > > > I come to a situation where seemingly the same domU started via xl
> > > > works, while when started via libvirt it crashes. This seems to be
> > > > related to xl setting b_info.{acpi,apic}, while libvirt setting
> > > > b_info.u.hvm.{acpi,apic}. Modifying libvirt to use the former fixes=
 the
> > > > issue.
> > >=20
> > > Could you print the values of the involved fields at the end of
> > > libxl__domain_build_info_setdefault in both cases?
> > >=20
> > > I'm not able to spot what changed between 4.13 and 4.14 that could
> > > alter the behavior, but knowing the values at that point might make
> > > it easier.
> >=20
> > Sure, will do.
> > It may be also something else: maybe it acpi/apic settings were broken
> > before, but did not results in a domU crash this way.
> > FWIW when looking into /var/lib/xen/*-libxl-json I clearly see
> > difference between b_info.{acpi,apic} and b_info.u.hvm.{acpi,apic}.
>=20
> I think libxl__domain_build_info_setdefault should check whether
> b_info.u.hvm.{acpi,apic} is set and copy those into b_info.{acpi,apic}
> if those are not set?

Looking at libxl__domain_build_info_setdefault this is not the case.
Instead there is libxl__acpi_defbool_val which looks at both.
Oh, and there is no similar thing for apic -> b_info.u.hvm.apic is
ignored!

> Toolstack people is more likely to have an opinion here, or to help
> debug the issue.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--eBor3w/3Tk4fTrOq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl9aBu4ACgkQ24/THMrX
1yz16Af+MSOEvcZaVyh8iX/7VmD9lL6W0gJDR2rLLlh55fV7sgBrQTLrcKGWfuiq
UDm8BOq4wPGxlQJZ1s+3PsgrAttGhAOtzxViIdhgQ/VgKvJ5ZD8o8ykO6YS0MFuI
M4aV+GqxMs5HDx8n4oaiuEIRK78qoU2LdbVAnF5/ptLrgcsizpF/lqEUuuDB56Ul
hQ63se4kAtK6o6eUnA/8wcVChwU49aHPyY1ey7t2MD0hySvWyJSJMNWf6A+o0VjW
a26G9C+LtOVfJV3mHl/AK4lyjmk0is03wj4E3y57xOVLFShw/46NxWMagVbV2bRv
opTSrZ9un8jSiiCpE2RtVkpEeUgIuw==
=Lpql
-----END PGP SIGNATURE-----

--eBor3w/3Tk4fTrOq--

