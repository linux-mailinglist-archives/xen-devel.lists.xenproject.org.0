Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 509868304ED
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 13:08:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668439.1040653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ4hG-0005cM-6Q; Wed, 17 Jan 2024 12:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668439.1040653; Wed, 17 Jan 2024 12:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ4hG-0005aD-3l; Wed, 17 Jan 2024 12:07:06 +0000
Received: by outflank-mailman (input) for mailman id 668439;
 Wed, 17 Jan 2024 12:07:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JJP7=I3=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rQ4hE-0005a7-Kf
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 12:07:04 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb352b93-b530-11ee-98f2-6d05b1d4d9a1;
 Wed, 17 Jan 2024 13:07:02 +0100 (CET)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailout.west.internal (Postfix) with ESMTP id B8AF93200A74;
 Wed, 17 Jan 2024 07:06:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 17 Jan 2024 07:06:59 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Jan 2024 07:06:57 -0500 (EST)
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
X-Inumbo-ID: eb352b93-b530-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1705493218;
	 x=1705579618; bh=6dXwf2Emkr8hF/QTtxCS9RwUTBC/ZoEjXg/2ijDfCD8=; b=
	fgcc5c8XXyi+nuijytNdrh8R2ikQpa0QSShWZ+G761/miDosE62xaIqOrL47bwe6
	jFmBPulPjLvP/v0uPIkt2BkB93LgzUEqyX0f/rLi/CZyfIhiwUr+CDII/ZxA1Uh/
	ETo9WJDwfFAoRrhlHLWPG3rQ+Ftd3ySb3b7RgggEIczbSoScobLVch7GWj+IcfaL
	2ffw+DUzu5/PgqJBcmQzd5GIOb7x1Uj3C8wFmF15P/T1wE4nQKwsAHX/r7qR9rdW
	LPZdBV/DwJDuUXJJ1GkGamx+0CNGz6RpN1U/ul/evYrXYCbPKR9fZEAXEpZhM5YR
	eGFY8s1ur8ybzAMOiUaKjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1705493218; x=1705579618; bh=6dXwf2Emkr8hF/QTtxCS9RwUTBC/
	ZoEjXg/2ijDfCD8=; b=c+AA3prrMKoSkg0p4yU/gbUb/9zTwP/34QAUxYlDwFgg
	v4ktMEPvId3rQlnj/nxv7OZk13XDTdAP13n6W57hrOpkZpzPt866rYcIlda0H5Ut
	CzwpKlTU7v9/uT040YoFW3pr3hjpwsij3tQeFgu5B/ZTqmk78l9LL/8IWIljMu0o
	R8EVVdiLfb3Cicjlgz8AOAul9ACZqr1kDwBkUjnCkZP2lAgwvtvpv2O84FxJUUt3
	gj9m7hLfAOVkj4sMOFxIwJrbfDU6mlX6rcqIXZJb5cJp669ggsTWZM8uUldNFfcJ
	MKov0buRegSXjneuVte0BH9u6G/hbcHkd7Me1F+qnQ==
X-ME-Sender: <xms:4sKnZQvNOQr7piLT31PLI6ms57AYE2bijN5ErEKlEN7Ih2A3PxVzLw>
    <xme:4sKnZddL7iCqOGQVlnoShn3PEWJOOuUJTqVyqX_0Sv5ToMwsDt6VXEq9OpbDabQ2n
    Ac0V8Be63PAKg>
X-ME-Received: <xmr:4sKnZbzMLXGOdRKE-RN1RhTstshpDj0lMtAVXoDSAo3-iY-WmphhxPskafw-C9hnuTqqsTX3SM82VlyffKyfvgPpiJRFydJnZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdejhedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:4sKnZTOApGBR8-7L6b-XLn5X4813RsIH-RGFqZdOsm1u8sG7M2Wung>
    <xmx:4sKnZQ8sgJYTH6YDcCZel2wJYtHZw7JQPYDaWRHjk8VtdVhfI5_1eg>
    <xmx:4sKnZbXY4lwpoQRxcuVpWc_N6HVU6I1t5IbSCmFtT5T7Q6tLkBLXcQ>
    <xmx:4sKnZek-ivAs70J9mPPNZ0qANE_tyqS5QRJqeOXpiTyjFfUP7t_2bA>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 17 Jan 2024 13:06:53 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Patrick Plenefisch <simonpatp@gmail.com>,
	xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Subject: Re: E820 memory allocation issue on Threadripper platforms
Message-ID: <ZafC3apB4rjFUOXP@mail-itl>
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
 <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tVSWNhlt71lf4w1l"
Content-Disposition: inline
In-Reply-To: <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>


--tVSWNhlt71lf4w1l
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jan 2024 13:06:53 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Patrick Plenefisch <simonpatp@gmail.com>,
	xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Subject: Re: E820 memory allocation issue on Threadripper platforms

On Tue, Jan 16, 2024 at 10:33:26AM +0100, Jan Beulich wrote:
> ... as per
>=20
> (XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x4a00000
>=20
> there's an overlap with not exactly a hole, but with an
> EfiACPIMemoryNVS region:
>=20
> (XEN)  0000000100000-0000003159fff type=3D2 attr=3D000000000000000f
> (XEN)  000000315a000-0000003ffffff type=3D7 attr=3D000000000000000f
> (XEN)  0000004000000-0000004045fff type=3D10 attr=3D000000000000000f
> (XEN)  0000004046000-0000009afefff type=3D7 attr=3D000000000000000f
>=20
> (the 3rd of the 4 lines). Considering there's another region higher
> up:
>=20
> (XEN)  00000a747f000-00000a947efff type=3D10 attr=3D000000000000000f
>=20
> I'm inclined to say it is poor firmware (or, far less likely, boot
> loader) behavior to clobber a rather low and entirely arbitrary RAM
> range, rather than consolidating all such regions near the top of
> RAM below 4Gb.

FWIW, we have two more similar reports, with different motherboards and
firmware versions, but the common factor is Threadripper CPU. It doesn't
exclude firmware issue (it can be an issue in some common template, like
edk2?), but makes it a bit less likely.

> There are further such odd regions, btw:
>=20
> (XEN)  0000009aff000-0000009ffffff type=3D0 attr=3D000000000000000f
> ...
> (XEN)  000000b000000-000000b020fff type=3D0 attr=3D000000000000000f
>=20
> If the kernel image was sufficiently much larger, these could become
> a problem as well. Otoh if the kernel wasn't built with
> CONFIG_PHYSICAL_START=3D0x1000000, i.e. to start at 16Mb, but at, say,
> 2Mb, things should apparently work even with this unusual memory
> layout (until the kernel would grow enough to again run into that
> very region).

Shouldn't CONFIG_RELOCATABLE=3Dy take care of this? At least in the case
of Qubes OS, it's enabled and the issue still happens.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--tVSWNhlt71lf4w1l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmWnwt0ACgkQ24/THMrX
1yytzAf/Sy1zcR4YlIQqTOtyOsBrGloA3BiD0vt0pkI6KyIU3/WPQ3gP/sR6JwfS
aagnqE9C92K8nO8JFRzmHY9ZO7kCZooTGbaJsj/L9a4m0nFNcV+Lr0Avm+Mi9Gzo
Mzh7NbrYY2iM7YR+XRyJnUNMgRmhm7Y8m1VbUdHnmGlnFWcoTpIJEl4YQfR7PuME
g0D/qXXXcLYrnQQeX+EhH3dEwocUd8aKp/8GLM6NFz4ZgqSnlvDi2Twtionp/pml
fE3EkE2PcPsKVkkvQElx6khYCte1jEsX8aftGoZlIcAMZStjcF1bVdnTqedOQDke
dYfPbeVz739QGWu8qS+5Le7979kZyg==
=2p1s
-----END PGP SIGNATURE-----

--tVSWNhlt71lf4w1l--

