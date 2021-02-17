Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B0A31DAEC
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 14:49:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86273.161839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCNCO-0001W4-KE; Wed, 17 Feb 2021 13:49:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86273.161839; Wed, 17 Feb 2021 13:49:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCNCO-0001Vf-HC; Wed, 17 Feb 2021 13:49:00 +0000
Received: by outflank-mailman (input) for mailman id 86273;
 Wed, 17 Feb 2021 13:48:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SSRj=HT=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1lCNCN-0001VX-E7
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 13:48:59 +0000
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36722e62-5a52-44cd-8208-363e8c21879a;
 Wed, 17 Feb 2021 13:48:58 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 7B4DED32;
 Wed, 17 Feb 2021 08:48:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 17 Feb 2021 08:48:57 -0500
Received: from mail-itl (unknown [91.67.79.4])
 by mail.messagingengine.com (Postfix) with ESMTPA id 637FE240062;
 Wed, 17 Feb 2021 08:48:56 -0500 (EST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 36722e62-5a52-44cd-8208-363e8c21879a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5d4LBG
	6Qg/xjUkSWjDeu9znpavuBLKz6fQQ9smZ7o3c=; b=P6Wu4WTOlx+W2gUNm1cg1C
	JA6iZaFUM+Sqzi0M4v4F6y8TMfNuYWS4PxqsaUJ3ti7knc8+GNAegE/4uXDi8Vw7
	tAlE82D7dbCePw6GJX9MYluLtUYYRq4rUtWf8Iv72K4Tc6e+JcScqB/5JDMo5Q8q
	Meese+ze4W13/5laaVr9OXD//NypdY933p/5SzbFVeQt3riCI3EUqi2B9DX3Ge/u
	xd7hBy3CuNgtvSMvfxpPmtvBARqQ93KttB/2A2Tl38mrTjnp5e/nx+R/HI+64Pc7
	r47q3vd73/9aAE9TKXLnOj99+3JjyFJetaASowwbFszRi+Rnq/xUl//2B6L1BC2g
	==
X-ME-Sender: <xms:yB4tYCY0l_S-l9pXzXfxOpK6QAoDcPpcO49aBEP07LpyAA1p1HZ8Eg>
    <xme:yB4tYE-XYaJWFg14mJsYFY1EgTrH-slbCKy6mhaiLPbJSLwFEy8sWepzqieLhREE7
    fpSxY0dgr-6pw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjedvgdefudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtderre
    dttdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghk
    ihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqe
    enucggtffrrghtthgvrhhnpeffkeffudevvddtkefhveelvdfgudehvdeitdduheeugfei
    jeektdeuhfefveefhfenucffohhmrghinhepphgrthgthhgvfidrohhrghenucfkpheple
    durdeijedrjeelrdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
    homh
X-ME-Proxy: <xmx:yB4tYBT6zbKCLY67AsDji7Km9jcS1wP-uhhW93i8T3bWq2ysL4wHag>
    <xmx:yB4tYHLysVOZJmgD1zbIufowupXWSmEEoMmSxKuVsv-ihXZTf5D_Jg>
    <xmx:yB4tYLQ3aiLf5PsUKncGg7zAJi9x2kb27-Gro_syYoUQUrEG_5tC1g>
    <xmx:yR4tYNGz3saZyQrLXfiu5-oTLG7vGs2gUSaTPSIqWXBe_5arlgmA7Q>
Date: Wed, 17 Feb 2021 14:48:51 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Linux PV/PVH domU crash on (guest) resume from suspend
Message-ID: <YC0exVYljxxvwFFt@mail-itl>
References: <YCylpKU8F+Hsg8YL@mail-itl>
 <0b71a671-592a-53ab-6b4a-1fe15b9eb453@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Eept/bozI/Ba/6p9"
Content-Disposition: inline
In-Reply-To: <0b71a671-592a-53ab-6b4a-1fe15b9eb453@suse.com>


--Eept/bozI/Ba/6p9
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Feb 2021 14:48:51 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Linux PV/PVH domU crash on (guest) resume from suspend

On Wed, Feb 17, 2021 at 07:51:42AM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 17.02.21 06:12, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >=20
> > I'm observing Linux PV/PVH guest crash when I resume it from sleep. I do
> > this with:
> >=20
> >      virsh -c xen dompmsuspend <vmname> mem
> >      virsh -c xen dompmwakeup <vmname>
> >=20
> > But it's possible to trigger it with plain xl too:
> >=20
> >      xl save -c <vmname> <some-file>
> >=20
> > The same on HVM works fine.
> >=20
> > This is on Xen 4.14.1, and with guest kernel 5.4.90, the same happens
> > with 5.4.98. Dom0 kernel is the same, but I'm not sure if that's
> > relevant here. I can reliably reproduce it.
>=20
> This is already on my list of issues to look at.
>=20
> The problem seems to be related to the XSA-332 patches. You could try
> the patches I've sent out recently addressing other fallout from XSA-332
> which _might_ fix this issue, too:
>=20
> https://patchew.org/Xen/20210211101616.13788-1-jgross@suse.com/

Thanks for the patches. Sadly it doesn't change anything - I get exactly
the same crash. I applied that on top of 5.11-rc7 (that's what I had
handy). If you think there may be a difference with the final 5.11 or
another branch, please let me know.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Eept/bozI/Ba/6p9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmAtHsUACgkQ24/THMrX
1yxFhQgAmfd5RKukJUsaQpSaNUrTV/lAylrIb9bSgHpKk+OFOUvQlcVzpADT/eB1
WLTdNHZ0fENjW96HSI3NUZR4YmzOl/2Zw5vV1wiokwhi6eMR3PrLwGqRY7gMdU4f
NZf31wQhukgZ/yxzJesCar1EnpoAmfIMZyGx73BDXoRcXlqx5UKf7HIZ6Ta/LIkE
WAq1jXXT6RK6O/FjsmYmJaigbqSqCMyymC1JdxBGNCk7gtw6Sh2NOfYbbC/VnC+2
38z6LJVTpjZUTKEkXQYlgYv88PHTFf24SnUwNN/ju6IMPv/cD4lw8qbcPh459RLm
rn7DoiUL5VJv+6qIapngzWEMdFqVmw==
=Yj3r
-----END PGP SIGNATURE-----

--Eept/bozI/Ba/6p9--

