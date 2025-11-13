Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D3AC597E3
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 19:36:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162044.1489838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJcAZ-0002Ih-JL; Thu, 13 Nov 2025 18:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162044.1489838; Thu, 13 Nov 2025 18:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJcAZ-0002Fu-Gb; Thu, 13 Nov 2025 18:35:43 +0000
Received: by outflank-mailman (input) for mailman id 1162044;
 Thu, 13 Nov 2025 18:35:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=25e8=5V=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vJcAX-0002Fo-BP
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 18:35:41 +0000
Received: from fhigh-b2-smtp.messagingengine.com
 (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bfcc563-c0bf-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 19:35:38 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 02BAD7A030F;
 Thu, 13 Nov 2025 13:35:35 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Thu, 13 Nov 2025 13:35:36 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Nov 2025 13:35:33 -0500 (EST)
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
X-Inumbo-ID: 8bfcc563-c0bf-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1763058935;
	 x=1763145335; bh=CV6PEqh+HFXYnBTew7qnEO10cA+LoykfYLKd3f2wbMc=; b=
	JwTJyZwml4Hjhiom5QxQv3h2Qj5ua1I9Pl6r3uQIHgnQO+/7xrw90agCua8jsjwY
	HZsLhkgm1lmvB6zFJdye7A5OhYlDJmQOTyowBHoKiwidFRKvlMMR/dy3wsEd02Ld
	a21MA36sZEO20obkkPGIhbqr6LOcC/BwMmdSLXq8Fev3N0eA6pU+bJJah+NzvQpM
	rKDLCRitUHP7xx/dLwQHCyoLNBVIplpXXPGRqNKxn7A+OepZ6pVA1t1yJSO9J525
	092Q2SGVuFML/WPtXshoFPjDN/ZVoM+t2mdb0yBOCUvCry3Z4Pby/BvLU/cXC8EY
	UTIe4VWVJ84Y6D6+I6C1gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1763058935; x=1763145335; bh=CV6PEqh+HFXYnBTew7qnEO10cA+LoykfYLK
	d3f2wbMc=; b=0Nf/K/AHrQQKvGmUTRwc8/dzkwCzE6CGC4H7p/o6pHEDw9ZLw7q
	Qu4jeEDjwTWgzYiGKZgpHNw62JUAOuVUrSeEvb/cr3kUXUN4oa7riEVa5Wg2lPTp
	RQObMpI2CcsUks8UzOnzfGce/1YgQ1j24UfwSQfVbOZ3T8M85oYabhRVaugCh2OX
	wtS/0adbDtzYWYujSLLkFwD9lrpy1PReDxfPY0jaf35IzHQp+YNFS9RBod4U0cl3
	73JzX4Tsr2BVj6wN1ygg33On11zya/cDyottktYcC5qdjAR5JcCss1cI0/YhC5pD
	O84VipVoXmQFgz/T4aoCBTmmfBEZA+oAlCg==
X-ME-Sender: <xms:9yQWaW1zRqzTO5s2HuWp5eEQtiDYApBskSjmWNc_uSaiTKm8h-pvSQ>
    <xme:9yQWacwG9TEbIpiEVCrBcv4XYQ0CSk9wWSxdUL0kzkyeL_GuMaeEwXxgJnLrVVotJ
    ryPZ5WrRTQqmsrsRsx6cwmpgfeLQBwuX_mqHCK_h1SIPT_u9g>
X-ME-Received: <xmr:9yQWaXh69lw60RvPILPezYwsSsaGTmxiaORDW0VMAdshBZGmCgF1_RVm8oTf4SkIMmlp8vuUK-FImp6M6aM8apaKv-W5cK43Orc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdejieekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepudegpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehfrhgvughirghnohdriihighhlihho
    segtihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrd
    igvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehfrhgvughirghnohdriihighhl
    ihhosegtlhhouhgurdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefse
    gtihhtrhhigidrtghomhdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgr
    thgvshdrthgvtghhpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgurdgtoh
    hmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopehj
    uhhlihgvnhesgigvnhdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrh
    higidrtghomh
X-ME-Proxy: <xmx:9yQWaZM8Gi4LU9RJRrhXUNKqM1oIGVt9DQuZArAv-7WKlC_gMZtOBQ>
    <xmx:9yQWaadkhqSnN0ZgcNu1l16xxdfL7x9HA00n1N0Opupp5wHtftAlzg>
    <xmx:9yQWaTwkuQUBQWzGA9CaX-sapgsirYlJWWDBpBtLE3AKWgsJypeOoA>
    <xmx:9yQWaf3oLRiERNDzoyx4KFN0qIcf5_Ll4sPfPhVzbiZr9vh1SBkoHg>
    <xmx:9yQWaeb3wFMfqUEHqRxHxghDeaEWPwMJkybPApNeuwLk1AFXbxJUgHaA>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 13 Nov 2025 19:35:31 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Frediano Ziglio <freddy77@gmail.com>,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v8] xen: Strip xen.efi by default
Message-ID: <aRYk80Sqo-sjN6fG@mail-itl>
References: <20251113154358.28704-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0O2GgWKb7mRY8ESq"
Content-Disposition: inline
In-Reply-To: <20251113154358.28704-1-frediano.ziglio@citrix.com>


--0O2GgWKb7mRY8ESq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Nov 2025 19:35:31 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Frediano Ziglio <freddy77@gmail.com>,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v8] xen: Strip xen.efi by default

On Thu, Nov 13, 2025 at 03:43:58PM +0000, Frediano Ziglio wrote:
> From: Frediano Ziglio <frediano.ziglio@cloud.com>
>=20
> For xen.gz file we strip all symbols and have an additional
> xen-syms.efi file version with all symbols.

You meant xen-syms here, right?

> Make xen.efi more coherent stripping all symbols too.
> xen-syms.efi can be used for debugging.
>=20
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

With the above fixed:

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--0O2GgWKb7mRY8ESq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmkWJPMACgkQ24/THMrX
1yw/dAf/fX/Q3YpXGqUSRpqhvuodLnXj0r2RoW0d/TcjM6ne60GgeRuc8lrdGstU
N6+BJGBzyVpT2Sm8F706VsyXChbC5dt7IhE1fNLgBD9kp5FSBTGq3MpBzNq8KahE
1KUgUsXpQB+QSywHlHJa7OQ1XI1DG12I8+RqTCg2jWiJVDBraG4/03eNUF379sZV
FI7V/e9HTANbaQ/OSLWrefwiEx8v9jf0ii7hOkegxbElbr3Tg/RBhmIzTN29ra7f
4w8aQW3nqRbsHmYRYZxpOnWlJgjvbo5yuDpe/XyGnKUVWftt8dUs0ZS5yPryVo9w
x4qzflpz/1u1n9QEKyPL1Xbq3Fy22Q==
=HBpH
-----END PGP SIGNATURE-----

--0O2GgWKb7mRY8ESq--

