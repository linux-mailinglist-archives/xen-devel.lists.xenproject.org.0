Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFC86A2C16
	for <lists+xen-devel@lfdr.de>; Sat, 25 Feb 2023 23:35:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501918.773743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pW37v-0002BN-Fu; Sat, 25 Feb 2023 22:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501918.773743; Sat, 25 Feb 2023 22:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pW37v-00028L-Cn; Sat, 25 Feb 2023 22:34:47 +0000
Received: by outflank-mailman (input) for mailman id 501918;
 Sat, 25 Feb 2023 22:34:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rUVm=6V=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pW37t-00028F-Vp
 for xen-devel@lists.xenproject.org; Sat, 25 Feb 2023 22:34:46 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97797c50-b55c-11ed-a82a-c9ca1d2f71af;
 Sat, 25 Feb 2023 23:34:41 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 2FB7C3200406;
 Sat, 25 Feb 2023 17:34:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Sat, 25 Feb 2023 17:34:39 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Feb 2023 17:34:35 -0500 (EST)
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
X-Inumbo-ID: 97797c50-b55c-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1677364477; x=
	1677450877; bh=7v+mVSaUogTR4LaZGmtUp+PNoO6ejkwg7ygkfKv6bnE=; b=a
	3OOPAxRl2gjqieXppUJAwHroj6xt7gtxuWm9qbiYuV3gmECpKvTNBg2Eqo+Lk37K
	Yof+ATraPyi2YN84W7pj/QN26B1I4xAVyqm0QmJSn+6fDFi/VSPmf9s2gInqNQ18
	s0PnCLO80Q6uHwD2GpP1s8SKX/oHlwuuMDpwp1NeDAHonynRSe8NCcAqEkVF6WYH
	LLxfTa/LHGxYeADWTr+KsGGLheMVndSPep5NrVT14nFQ7U8fVWhh3g8BO+MmjQOC
	mRGsjbsk/PERWtBQyG+hF6KgmWxwiIvxsh7vMzejOdq8SO5zy19mdBZT4qe0t5DO
	1ySPsRiy35lItQVQ7bZAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1677364477; x=1677450877; bh=7v+mVSaUogTR4LaZGmtUp+PNoO6e
	jkwg7ygkfKv6bnE=; b=NH3D/Fk1U1oYG903zMkFkKrj7Jlu92PcqrU3g9nu6HnV
	Is2AieaBFsjMYU/U5uSExe4ReeyEu6rXr2dImdgP6HVfKGZzXXzKrJEWMc/QhG5Z
	8bTx863UM1fQUkOzw0XSjTwJuvUYS5z/bsY2zeGnB+ifYDXYa1TZZxW27gqccUlP
	eOLZG6y1p9koYjD6E3l4mM5941/sJEO6r3e8TP0Fn+Z9OX1VVdusFbndz4gL6yIZ
	OhtIoLm6B/aWdrzgVmwmk3j2I6yJAmOwJTWuqaalrcHDkXM+YsrN9FGIW+DQ/6Kw
	JIAizmqQ3Q90/x9U40lVgQYib3uG2jLmGEMLGo9HLg==
X-ME-Sender: <xms:_Iz6Y3hERPzKTbhN1hvuS8I1BARVk9XkBaJuxTerMLXdwqAJ3yDx4A>
    <xme:_Iz6Y0ATKzVfk1BDFirG5RqRzecu03-gN8Ofl6A15i-mw71stSYLCMIW-Zhpf1uTN
    PXZFM6zDXSchA>
X-ME-Received: <xmr:_Iz6Y3EKA420I-czyj1_3Dbb_J6P5r7tsoi8cZ4F7aOA07eH8gweuw9NSQtgpO8gpEV805_HQ7GKcA9rJYJB-TUEXE_Vls9De9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekiedguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedu
    ueejvedvkefghffhhfelvdeileelteekgfetvedvteehhfdtvdfftefhudevhfenucffoh
    hmrghinhepgigvnhdrohhrghdpghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:_Iz6Y0RkvKjo-cMisXbyGvWN-Z8zf6h0j42AkIcW_slPWDU8XAEJOg>
    <xmx:_Iz6Y0yNP713ZG7lWc-eiCew0ic72Eso1Svtaf6KHXpqf8wNoqPGuQ>
    <xmx:_Iz6Y64N-FcThJlMuhO5z3aRvvq8NhGk6ky4dIQJxsuKT66RaEmFkw>
    <xmx:_Yz6YzlxvSaK9TyI_V_fnkJ_bI2kmHIvRkhcpYXEP9m6q5rTEUhPjA>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 25 Feb 2023 23:34:32 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v5 1/5] Use HTTPS for all xenbits.xen.org Git repos
Message-ID: <Y/qM+MOsWVp/6Yev@mail-itl>
References: <cover.1677356813.git.demi@invisiblethingslab.com>
 <9cb98cb9aaca22bbc88de9fd8cbd7f9463b4d425.1677356813.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OQEc90r8F6o86KWP"
Content-Disposition: inline
In-Reply-To: <9cb98cb9aaca22bbc88de9fd8cbd7f9463b4d425.1677356813.git.demi@invisiblethingslab.com>


--OQEc90r8F6o86KWP
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Feb 2023 23:34:32 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v5 1/5] Use HTTPS for all xenbits.xen.org Git repos

On Sat, Feb 25, 2023 at 03:37:11PM -0500, Demi Marie Obenour wrote:
> Obtaining code over an insecure transport is a terrible idea for
> blatently obvious reasons.  Even for non-executable data, insecure
> transports are considered deprecated.
>=20
> This patch enforces the use of secure transports for all xenbits.xen.org
> Git repositories.  It was generated with the following shell script:
>=20
>     git ls-files -z |
>     xargs -0 -- sed -Ei -- 's@(git://xenbits\.xen\.org|http://xenbits\.xe=
n\.org/git-http)/@https://xenbits.xen.org/git-http/@g'
>=20
> All altered links have been tested and are known to work.
>=20
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>

It seems expired Lets Encrypt root issue applies to few other containers
too:
- archlinux:current: https://gitlab.com/xen-project/patchew/xen/-/jobs/3834=
739751
- debian:stretch-i386: https://gitlab.com/xen-project/patchew/xen/-/jobs/38=
34739762
- debian:unstable-i386: https://gitlab.com/xen-project/patchew/xen/-/jobs/3=
834739771

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--OQEc90r8F6o86KWP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmP6jPgACgkQ24/THMrX
1yy3awf/R8jwooCP+vntktqjuEURX8e/N5uGXYyl7nd6QmB4+0ggMM51GLL0zU7c
+jeewAxiYrwlh8/yq6vYC/jKOALAHOLePwAoKQmF/vGZFjYzzmGWrVYpwCY/S/Cn
vbMdvRimxYh7rdk19WiDptqGt5uq6d8pQL2bT7aLXTjS/7R6/7qhzL6y6x/GVvfL
gz3qHJ2IElqFRuG8CR2FDXn17YMmI7VRqgo76NC74VUciEjAkoaYSjxVtjacbZRY
3XN6au3oije9lvFYYvyYwMegoQzDZctsO8WpN4HuDdOa1Tsut82R07yIUeyZNh6y
s55wRmogUyPIW1wYovtXKtF0cGLp/Q==
=uewn
-----END PGP SIGNATURE-----

--OQEc90r8F6o86KWP--

