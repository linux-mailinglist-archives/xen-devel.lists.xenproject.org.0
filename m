Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35272669E47
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 17:37:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477485.740205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGN3F-0007Mq-Dr; Fri, 13 Jan 2023 16:37:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477485.740205; Fri, 13 Jan 2023 16:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGN3F-0007KX-Av; Fri, 13 Jan 2023 16:37:09 +0000
Received: by outflank-mailman (input) for mailman id 477485;
 Fri, 13 Jan 2023 16:37:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LVbI=5K=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pGN3D-0007KR-RM
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 16:37:08 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83078aaa-9360-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 17:37:05 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id DDEE55C0059;
 Fri, 13 Jan 2023 11:37:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 13 Jan 2023 11:37:03 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jan 2023 11:37:02 -0500 (EST)
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
X-Inumbo-ID: 83078aaa-9360-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1673627823; x=
	1673714223; bh=yyzyyumq3jAZv3MJoulGW+5f+DgOr7g/UNTue6VYZaM=; b=z
	eqxscSSZ+wjdSIV6JHy3WxC0wNfWoigI1axNZXzauSrBhjglDXBXcuE+3AQ3aQnz
	Auf61Uema7LFS9RN+MTGyPIdZcANzDXVCChKuKbXAq1za45g3KxLtKI8mI+i975M
	iTMcHv4QGehwJn9THhHIBRc2TUjavLDblTVAo1EfQUp5T9CJqg5fzAX1YfJDzwE+
	ufd+/ucMiDIdOZjGswRaX1YFIVLgGY3oltdUiQo/H248FMGjyhUps+wXFMj3wOAh
	CorfuIgiyLyfaKSQiTnOW6dvOXoaAszo1vnPsyezbup/MpQrmQz7+s60WxGOy1xb
	BgnRxNIN+HfK3UiV9pXuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1673627823; x=1673714223; bh=yyzyyumq3jAZv3MJoulGW+5f+DgO
	r7g/UNTue6VYZaM=; b=mxKQgrYYakDbY7B8d6g546efjMYxlaEP7lEEpk41Vkdv
	pboCITRY80clUuPZnUpuxZhT8IiJGk+Sddnj1xffZLHsIrW8yn5hch1XPV0Ymr8W
	gLEf6dSSmF3E8g39nBdqRpCaoujvkkqRFlxm3ZYSR8EGRKk/kkQNLo8Oeox41aWh
	ObkvRXn/NPWIIPCr666N6feThfGAeUFNJ2uogaYEZ3VVKiEu4MfB1j0ZH4W2ZBJJ
	E+J6aw1J18G6zJK8dUAEXpkaV/4E3+yGx0GIUxhnl5Gf/UTs1PvFaJJ7OIJWD+2z
	ayL5d3/Ln7wiT0NPrZNTqUj2K4TflGfzSb9LB1z0Tg==
X-ME-Sender: <xms:r4jBY71yUEg-V22cXqxlp6NNrGFWhkU_s9j_gvixS77m4jGTp3feIg>
    <xme:r4jBY6HEiAX8w_DAr2e_XHxLZgMu-lvEqTxV7b9w4rlcD46V2XxDKE7wahQJFJM1D
    vU8XAu-liqIbg>
X-ME-Received: <xmr:r4jBY762sBUE5Q_M_M-9Dn0_C21O5u4WTGXgvuTYsAoYk9dB7-KPMcU6_tYzS6_NkRsuKvvnZQHYGEvA4EVwdUkDryQgHz5h_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleekgdekiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduteev
    leevffdvteeludeljeeiieeufffhgfdvfeekudeihfehteehkeekfeffieenucffohhmrg
    hinhepmhgrihhlqdgrrhgthhhivhgvrdgtohhmnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvth
    hhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:r4jBYw3vd4D18q5vXtuVA37Xr3gN1xE1T3ZFs_4DHwVjwIQfkTcx4A>
    <xmx:r4jBY-E6FlarkibTY9Sf2ulVkC7gXUPxq4obb5dh2AuGLjW4-FvNCA>
    <xmx:r4jBYx_Ur4YyIVlZRPaz5znhqpl-HJ0YCUeJQXcRK9rNvQ6Q1NRdUA>
    <xmx:r4jBY5OtCiGxpJVgIxQUasy0EbkszDRmCtAc6_4aSEU1eeB8FpPLCg>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 13 Jan 2023 17:36:58 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, regressions@lists.linux.dev
Subject: Re: S3 under Xen regression between 6.1.1 and 6.1.3
Message-ID: <Y8GIqncmmhFvJ2lB@mail-itl>
References: <Y8DIodWQGm99RA+E@mail-itl>
 <bdea54df-59dc-3d4d-dd0c-8c45403dea24@suse.com>
 <Y8FgQyVvpUXqumvS@mail-itl>
 <47ae3bbb-6468-4282-1789-72eedaa54814@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dbTMTVjy0FuC/Odd"
Content-Disposition: inline
In-Reply-To: <47ae3bbb-6468-4282-1789-72eedaa54814@suse.com>


--dbTMTVjy0FuC/Odd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Jan 2023 17:36:58 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, regressions@lists.linux.dev
Subject: Re: S3 under Xen regression between 6.1.1 and 6.1.3

On Fri, Jan 13, 2023 at 03:20:37PM +0100, Juergen Gross wrote:
> On 13.01.23 14:44, Marek Marczykowski-G=C3=B3recki wrote:
> > But, unrelated to this bug, it did get message like in https://www.mail=
-archive.com/xen-devel@lists.xenproject.org/msg107609.html
> > (WARNING: CPU: 1 PID: 0 at arch/x86/mm/tlb.c:523 switch_mm_irqs_off+0x2=
30/0x4a0)
> >=20
>=20
> Hmm, is applying the attached patch making any difference here?

No, it's still there.
Some further observations:
 - it happens only on first suspend after system startup (at least in a
   few attempts I made now)
 - it's logged during suspend, just after "Disabling non-boot CPUs", not
   resume

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--dbTMTVjy0FuC/Odd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmPBiKoACgkQ24/THMrX
1yyd8QgAkXK6/TiUJCvW1+gpgjmZVdI+lp+aFyeu8Q1xDJQys+r2ngbEpNemxiPW
Kj0NPmj2pUO9KlXcEslvAd6E/38w/fHdwr6g2luKN7oU3vtLG0TIF+1ha/cLmqMq
7pwYrhCCtfIFx85LWoTk5ocgB1U5TNdbE7GCP3TtZLuqWRJbj6YRjVAGEpeN51Ju
KPS5kgai4JOqXJgtwQ6tISbPjEfyPaR+hyniziVO8uWSjyWkBw1aUqi8v7BK5Vsl
bCHn4Z8BnQFWGLPdq1u3UTUIp9SFLS6L+amdktHQOWKTiR2aLIdj7GxYJXBGt4KN
EdQJO5OmWBe1Fgtrc7ZG5dckfsTijQ==
=di4t
-----END PGP SIGNATURE-----

--dbTMTVjy0FuC/Odd--

