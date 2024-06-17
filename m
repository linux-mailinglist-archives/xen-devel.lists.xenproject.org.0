Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A53F90B0CB
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 16:03:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742339.1149120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJCwy-0004bM-M6; Mon, 17 Jun 2024 14:03:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742339.1149120; Mon, 17 Jun 2024 14:03:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJCwy-0004Ze-JU; Mon, 17 Jun 2024 14:03:12 +0000
Received: by outflank-mailman (input) for mailman id 742339;
 Mon, 17 Jun 2024 14:03:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BQ9S=NT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sJCwx-0004ZY-3Q
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 14:03:11 +0000
Received: from fhigh8-smtp.messagingengine.com
 (fhigh8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52b3a46b-2cb2-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 16:03:08 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id EB1C111401EE;
 Mon, 17 Jun 2024 10:03:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 17 Jun 2024 10:03:06 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Jun 2024 10:03:04 -0400 (EDT)
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
X-Inumbo-ID: 52b3a46b-2cb2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718632986;
	 x=1718719386; bh=W1xHVkhqMM4DNKJlUR7Gv2638u+H1uW6AQE6QMPxhP0=; b=
	nDAjA2Mrbtmg4xxQSBIiPDzOvrLWix3dGe6xwqWOnEA1RJ3V3B6uT1wJvuGNOGim
	sn0le6VQK8tfq8q89ujyEzjr/0C1OCrEAzKmBEZi1ASbzSN6e4RwzPv8BUIflsJ1
	KpVm1FrnaZu7JIgJ78BlYhoS/7HkbgJUKgBqX+8mbyvYSDYhRHNyf+nSgb7Hoalo
	8R416BL59QgBJTx0jfwY3Mp5iEi1B6Umq17r5N+PVpViza2RFilnz0wudGFcm9U+
	ihedKCjtcYX7qM7ZBA0YwOsIW6CO5HAoojEOz1k/4eaF+jB6NnQ34F30cEgDlk00
	vB7raztyYosnwcE6+/s0Ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718632986; x=1718719386; bh=W1xHVkhqMM4DNKJlUR7Gv2638u+H
	1uW6AQE6QMPxhP0=; b=j9RpCEZ+9CdirtB661/un0oh+AlpwrDi4KGLU6kIP89z
	iRCcV1y1LBioY/GkjAxUAC2sU5aKhTcjuc/cXTV9cOqWqkOrRhi3MXb+OCxynpB/
	/DWrRBn8zG1c+FXzEVPmo03tDs5zU1Rbi75tigTRK0DI+zZGKKBcnfH8pRRNAb2h
	GeE6XDRN9akOhW4wu+dKh459TCc2lApgJKWIiRsSN2Hc/o0yxlIyG7703KyXvumq
	aHQL+z1ZcJEz2wst/Z7T8QIq7qWnfn/D9TieXivST2zJQFFZc73NRAyhyOK2cEiJ
	w+xXY52uzN5Tg3+L6DibshPz7zoHDfAS7VtsLxEfhA==
X-ME-Sender: <xms:GkJwZsrTAZF5huh53Q33UFqihuWq3W6rgTYe_3xs-gDfI6ZMO1WF1Q>
    <xme:GkJwZirFPBS1rTIm83Ux9lDgDvtqNeXO9VywFPSHmcfM235h3EgZuGOUtiWmkE3X5
    3iCzrGe-steKg>
X-ME-Received: <xmr:GkJwZhMHHF0PvG46picaDQ7bggiLp5l5MZxTpZkjZOIc2mHFwmyQfJm3kxY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvhedgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteeu
    geefhfffvdffteelledtleekvdelhfekhefghefhhfehheduiedtgeehjeelnecuffhomh
    grihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:GkJwZj6BsRexTvs1u01UwVM70czF85e_l5FEwW9fq-uEIz3o-Ltf7w>
    <xmx:GkJwZr5_HbbRf59uqTKh9GSDH58sByAXF06jMMgjXaunBW1M3qxPCw>
    <xmx:GkJwZji0YhOep0XBi8_vMe2FmkMWSL-qd36HhPHVWsxIgeleuncTOg>
    <xmx:GkJwZl6dLhVlbHkVt28SBbxXpl1PFlAeATl_2-rC6tqOMOMrQXcYuA>
    <xmx:GkJwZrGGZQGnaGJEQIeRA3-PimkNkyHCO3cjNoJ2elouJ8DtGvGhcsDJ>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 17 Jun 2024 16:03:01 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: ACPI NVS range conflicting with Dom0 page tables (or kernel
 image)
Message-ID: <ZnBCFgHltVqj2FDh@mail-itl>
References: <a5a8a016-2107-46fb-896b-2baaf66566d4@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UkDnYqeCInIhjvEd"
Content-Disposition: inline
In-Reply-To: <a5a8a016-2107-46fb-896b-2baaf66566d4@suse.com>


--UkDnYqeCInIhjvEd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Jun 2024 16:03:01 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: ACPI NVS range conflicting with Dom0 page tables (or kernel
 image)

On Mon, Jun 17, 2024 at 01:22:37PM +0200, Jan Beulich wrote:
> Hello,
>=20
> while it feels like we had a similar situation before, I can't seem to be
> able to find traces thereof, or associated (Linux) commits.

Is it some AMD Threadripper system by a chance? Previous thread on this
issue:
https://lore.kernel.org/xen-devel/CAOCpoWdOH=3DxGxiQSC1c5Ueb1THxAjH4WiZbCZq=
-QT+d_KAk3SA@mail.gmail.com/

> With
>=20
> (XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x4000000
> ...
> (XEN)  Dom0 alloc.:   0000000440000000->0000000448000000 (619175 pages to=
 be allocated)
> ...
> (XEN)  Loaded kernel: ffffffff81000000->ffffffff84000000
>=20
> the kernel occupies the space from 16Mb to 64Mb in the initial allocation.
> Page tables come (almost) directly above:
>=20
> (XEN)  Page tables:   ffffffff84001000->ffffffff84026000
>=20
> I.e. they're just above the 64Mb boundary. Yet sadly in the host E820 map
> there is
>=20
> (XEN)  [0000000004000000, 0000000004009fff] (ACPI NVS)
>=20
> i.e. a non-RAM range starting at 64Mb. The kernel (currently) won't toler=
ate
> such an overlap (also if it was overlapping the kernel image, e.g. if on =
the
> machine in question s sufficiently much larger kernel was used). Yet with=
 its
> fundamental goal of making its E820 match the host one I'm also in trouble
> thinking of possible solutions / workarounds. I certainly do not see Xen
> trying to cover for this, as the E820 map re-arrangement is purely a kern=
el
> side decision (forward ported kernels got away without, and what e.g. the
> BSDs do is entirely unknown to me).

In Qubes we have worked around the issue by moving the kernel lower
(CONFIG_PHYSICAL_START=3D0x200000):
https://github.com/QubesOS/qubes-linux-kernel/commit/3e8be4ac1682370977d4d0=
dc1d782c428d860282

Far from ideal, but gets it bootable...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--UkDnYqeCInIhjvEd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmZwQhYACgkQ24/THMrX
1ywSVwf/fyMEu68K8SLXaLRbbLDBTExW/bTQw8LZQNZt32UXgRtPc6aYtw0YVgJP
73KDFeHAJIwS7/douOaLJQVKpHQTbTN5wK+BTOIct5dXcekWD/Q2AnhrAxoOVse/
B5BF8m+pBjrb1IVxS1uDGvjsvqYNPQRv2HttnP7niXz5s7FxWnP4z8PUla59vQW7
cThUv1gwIgxy+aQxf8R2vFFovgt73IEH2686UAjYwDrmmnCi+fOPnQuKZTu7W/Sq
aYt3n/TB6Em82DY5WOGTy4XOQQrRZWL8EDiUb6MizvMY7CJ0oVn2YKKU8/A/UHiQ
iO4C+ufb4PNxJ+HX5sc2Atw0NCXZRA==
=RfCu
-----END PGP SIGNATURE-----

--UkDnYqeCInIhjvEd--

