Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBCFCA9F3F
	for <lists+xen-devel@lfdr.de>; Sat, 06 Dec 2025 03:53:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179740.1503216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRiQW-0002Jm-Qq; Sat, 06 Dec 2025 02:53:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179740.1503216; Sat, 06 Dec 2025 02:53:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRiQW-0002HP-MY; Sat, 06 Dec 2025 02:53:40 +0000
Received: by outflank-mailman (input) for mailman id 1179740;
 Sat, 06 Dec 2025 02:53:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JSAj=6M=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vRiQV-0002HG-1t
 for xen-devel@lists.xenproject.org; Sat, 06 Dec 2025 02:53:39 +0000
Received: from fout-b5-smtp.messagingengine.com
 (fout-b5-smtp.messagingengine.com [202.12.124.148])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2bb12de-d24e-11f0-9d1b-b5c5bf9af7f9;
 Sat, 06 Dec 2025 03:53:37 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.stl.internal (Postfix) with ESMTP id 322451D00168;
 Fri,  5 Dec 2025 21:53:36 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Fri, 05 Dec 2025 21:53:36 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Dec 2025 21:53:35 -0500 (EST)
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
X-Inumbo-ID: c2bb12de-d24e-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1764989616;
	 x=1765076016; bh=RMi7y1zcbHW7OqXqPJMGTQn2lAIlhaylknS1oFmO/Qs=; b=
	AHdWJDjmUAZufkiH166OWa5rysyDaiCLzHdstxkDQeLdnAKPrd9RK4T3y5gNXfS1
	V3xqRhorPC1SysiPm4JInurPnrHqwKV0tkH5bNphJILda+gVIpfnEeGxyO0nkMqx
	JJsxvnWLpdoXFC1ErxScWtxkfRqPIaFSxhwJbtCqbt3alOv/FpbiiymmqdjDl1MF
	v+v8gCbsHLtEDI4nJ5pQfnTkmhJ6UXhAh3Gyn95KAWOsb0M45JrFUuwTHWmopI2t
	DscBMpP0hgdn9NSBJIfc9knA11R0yqXOh/gYcM4W/5JlUh0EUFjnrSJBas86tRfX
	LTWnfCnIJz9AxH+qd8yRjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1764989616; x=1765076016; bh=RMi7y1zcbHW7OqXqPJMGTQn2lAIlhaylknS
	1oFmO/Qs=; b=MO/kK4r0a1TqKlv5f3oBEo8a4QQRtMBQAMsFVKgYrJuhc7HqKfX
	2s0rXM9PvrF+jW8APDnBJxVMkt8BwrYBA6gqwffA6eZKUlVYvPws0uc3eEjaUPFs
	Yv8KtZDDTPrZYqwJ5e1LE2QVujBpQ2EliGa1YGAA4DbqMQc2mRySnnETqrnJS2Hf
	/ll0KOih3CDkaOLiap5uJB7bU1vzqJ+FMBILbIuRgjt5XoP6fOLY48bGUQs+Tc8G
	sGrVv8V7W+q02VSZ5jLeUiQ50t+gbbTfI+tdoi0aJsdX9Gaow68TYyIpKfiy3hag
	h7KRg1yq5l+0fuRgwOCjZT5Js9tAWN5eKrw==
X-ME-Sender: <xms:r5ozaTXKP4rhxfNTZQSH3MAuUwF2V9xpOfiQZdRWVcG-MbgdCwdXRw>
    <xme:r5ozaRlWRGSduQPObYeNb4VewJOoYxzzvRSiZlF9HRArBef_djGBulcGsP-OI9Qcr
    xEkXZglxHJbvRNQd1VYOaeObM81JN1uAd8ns4d2tjkXac1QWAs>
X-ME-Received: <xmr:r5ozadAUyFcKA1q2Dv5BDWTsF8seA8Dpw8VfCNfoPzS2CU0VfHhYFArWjKsv05Bz9VS-1peqCl_tebfNFuSIz7kmOqYomZpt8d8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepveeujeetgeel
    leetudeuvefhtefgffejvedtvdfgieevheetheelgeeuledvjeevnecuffhomhgrihhnpe
    hgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhmpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    peigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtph
    htthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:r5ozaZcFftoG8mKqF96QsH-SQhUeOj5NQnNCUOMhSbiJLl_NrqYLVQ>
    <xmx:r5ozaQKJqEO8wVkMOhI1RFkOobANJrkEsRbrlfuVpqbQRR8zhjSTuQ>
    <xmx:r5ozaUcNSuEfqn_G3WaTrmrMdle801yhVkqO_iI-d95uc4gu3i5R7A>
    <xmx:r5ozaf0jfh-KU4tFe513-86NksLVGUdX9rvioMqpG5hiqNqmnrsm_A>
    <xmx:sJozaR3bMT1BTSvTh4mZ6t1MiDFmEVKnWwSYc74CV01E-ytUh7dHIjrD>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 6 Dec 2025 03:53:33 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 0/6] Add driver domains test
Message-ID: <aTOarS1mY55VlTUI@mail-itl>
References: <cover.b56a66dfe4d98db2f1cc8b1fe0c2091d02cebe38.1764989098.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LWZIQnqaqaVQr4T6"
Content-Disposition: inline
In-Reply-To: <cover.b56a66dfe4d98db2f1cc8b1fe0c2091d02cebe38.1764989098.git-series.marmarek@invisiblethingslab.com>


--LWZIQnqaqaVQr4T6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 6 Dec 2025 03:53:33 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 0/6] Add driver domains test

On Sat, Dec 06, 2025 at 03:48:02AM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> This is intended to detect issues like recent xl devd crash in domU.
>=20
> Pipeline (on top of Andrew's sd-notify.h fixup):
> https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/2199305972
>=20
> I did checked that indeed it fails with the fix reverted - that's why the
> Debian patch - Alpine version did not detected that regression.
>=20
> Requires Alpine 3.22 and Debian in test-artifacts repo - patch series sent
> separately.
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> Marek Marczykowski-G=C3=B3recki (6):
>   automation: switch to alpine:3.22
>   CI: extract qubes test container
>   CI: cleanup alpine containers

As "expected", patches 1-3 didn't made it into ML...=20
The pipeline linked above has them.

>   CI: Add driver domains tests
>   CI: Add configure --enable-systemd for full build
>   CI: Run driver domains test on Debian too
>=20
>  automation/build/alpine/3.18-arm64v8.dockerfile       |  51 +----
>  automation/build/alpine/3.18.dockerfile               |  52 +----
>  automation/build/alpine/3.22-arm64v8-qubes.dockerfile |  18 +-
>  automation/build/alpine/3.22-arm64v8.dockerfile       |  46 +++-
>  automation/build/alpine/3.22.dockerfile               |  59 ++++-
>  automation/build/debian/13-x86_64.dockerfile          |   3 +-
>  automation/gitlab-ci/build.yaml                       |  44 +--
>  automation/gitlab-ci/test.yaml                        | 125 +++++----
>  automation/scripts/build                              |   1 +-
>  automation/scripts/containerize                       |   4 +-
>  automation/scripts/qemu-driverdomains-x86_64.sh       | 152 +++++++++++-
>  11 files changed, 379 insertions(+), 176 deletions(-)
>  delete mode 100644 automation/build/alpine/3.18-arm64v8.dockerfile
>  delete mode 100644 automation/build/alpine/3.18.dockerfile
>  create mode 100644 automation/build/alpine/3.22-arm64v8-qubes.dockerfile
>  create mode 100644 automation/build/alpine/3.22-arm64v8.dockerfile
>  create mode 100644 automation/build/alpine/3.22.dockerfile
>  create mode 100755 automation/scripts/qemu-driverdomains-x86_64.sh
>=20
> base-commit: 28d1d1c3f5aa6563ecf07136ba064be0261565c1
> --=20
> git-series 0.9.1

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--LWZIQnqaqaVQr4T6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmkzmq0ACgkQ24/THMrX
1yyWoAf8DGX8exOXATGIp0Ang7Nj3KqI5rGlUhS1b7QLNDXaENddJyRjBXp6TO6X
zb84vXE2kuo3A2bVUsQkPEnQUssXSTTDNzCsfnb6x4q+MQetj63GBcbjsa5hQdgN
sFlPNRbsEe77BPFK0viJ4RGhxb3pD6rvTx7e6Kdi17e8xOJ2YtxF4Dp+k6Wap2ga
e68jclLdspttVE2YHGcXjQpDvvLRKLx8zMIc30VoktJBBbFAy54h8LuLtoG42SYa
ZauyxpRa7yViuby73qgoUQzOng5HfoxxhbrGqvVIlQhN53e0pLlybpvC5YIebcEF
XAGdHASAU1gI8A1AJbxFx2/4vVpk2Q==
=X+3u
-----END PGP SIGNATURE-----

--LWZIQnqaqaVQr4T6--

