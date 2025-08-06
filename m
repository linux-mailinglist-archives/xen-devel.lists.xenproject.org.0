Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80088B1C486
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 12:47:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071599.1435021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujbfQ-0004FO-9F; Wed, 06 Aug 2025 10:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071599.1435021; Wed, 06 Aug 2025 10:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujbfQ-0004EF-6Q; Wed, 06 Aug 2025 10:46:44 +0000
Received: by outflank-mailman (input) for mailman id 1071599;
 Wed, 06 Aug 2025 10:46:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G2Yn=2S=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ujbfP-0004E9-3v
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 10:46:43 +0000
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a25b96dd-72b2-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 12:46:41 +0200 (CEST)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailfhigh.phl.internal (Postfix) with ESMTP id A60E9140011C;
 Wed,  6 Aug 2025 06:46:39 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Wed, 06 Aug 2025 06:46:39 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Aug 2025 06:46:38 -0400 (EDT)
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
X-Inumbo-ID: a25b96dd-72b2-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1754477199;
	 x=1754563599; bh=uoAcjmEPeXl7PTXRUb8xvLhW1b9d0oqFjbUHC8fRFHs=; b=
	ms92w+4Vmfhp7ZVUwV+34usBgcsVsMqZr2Fl56K5RefcGGBOc4Pygp7vq5fyTdii
	lG33wTDufug8tjwZLHrdCzwypW0KxyYcu9bqPq1foNRcz+quPvQCD0Ea9UHupJ5K
	ZIK7NiKYkJV1jVWIRjKBu/uv5nsQsvBb5BoK0qvpiitxmijQoB4ypxG4VVzFwAaz
	LykILBH7ioxnYehC/OyuaiknDWFI5b3WEtpCgxgbrhEA1rTuCecHc3hQSHyzIWmB
	JWE7PY9cvFKxBg4a2WdvVWrCYeKqcmAoaQeODiTj8inQfwT+xwhnG4R37ullW/gC
	hHlExBh5y9VBF8fml5MxRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1754477199; x=1754563599; bh=uoAcjmEPeXl7PTXRUb8xvLhW1b9d0oqFjbU
	HC8fRFHs=; b=PKwlTJ9znKIeaIXgWMpVYmdH9zmBkXzpbKonAAmP5C5Z2flxMct
	+aZe5DQOH6QeDo8K0UK9xadU1gskgjTWzijkz7aNklIvglrCUMyOS3sP3tVSPw5P
	GUubsO2yCiGju2dzZvQPUuxwVGbB/YyuCzKj7KO96rtswroakugfc9XZu4cA9WHS
	VmChr30bHniNk/qhxpNPfLdkjCpJVkP8gJGmSTYkTwko1KbKyc/Q+lPS1NWiSuj1
	MNEoDR2/bNjXaVswFfvRL+IBPwoAsKqFjGm2TvZgKICi/VVkf4zZITlWbc655Qpl
	bWePyGK1/y7XDF23oT9gISaowq+gJbTIwyg==
X-ME-Sender: <xms:jzKTaMPjb1fc1L1oWbDvIP0q16WrQuYeBSrOO4Lm3lBpeoMKdhPeFA>
    <xme:jzKTaGM0hwcVbNb0vPxhTzzkjQW-B00eVNeU7IsrvzJ5Z6OvLeDJsXUYSddmIZbyS
    9HSMd4yXVdr9w>
X-ME-Received: <xmr:jzKTaMvDsLuICZYbI4EXXVrbI_GkJHtHFL6IMdxMr_cGQMRXd9TnQS0JrsAQb5G1Uk9xokUxjPV4rFbpvZV6J5Q3x4Ibuhyy444>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudejkeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepfedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtgho
    mhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpd
    hrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdho
    rhhg
X-ME-Proxy: <xmx:jzKTaAU7sa251EPpEOpir6WepzKf0dt0xWeVEaeZRpLsK0v4QfTi5A>
    <xmx:jzKTaEsgqvgXBHt1mdHliF4aqc-TECPoH5kz1ZUIQRbfqQ_Nw5HD5w>
    <xmx:jzKTaMUravZMGCEo5mpNPisogr6QgRASi48mIasYIRyb5maZlZZznQ>
    <xmx:jzKTaHlhUuFjs4RMYodlIRgm9cds0PsI_1dIi2oPdHHbfJI_xtfxCA>
    <xmx:jzKTaEUii5ayCJuow2Wk_eB7Bed0NqJMcFIl6KtASP8AT_EfeoxoBq5I>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 6 Aug 2025 12:46:36 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: S3 regression related to XSA-471 patches
Message-ID: <aJMyjYfeTL5uPRtk@mail-itl>
References: <aJMtPLNqQFbGg5cs@mail-itl>
 <f971f8a8-487e-4b9f-8c75-80ebfe70c3b6@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="napIOcvaMj7fpBqC"
Content-Disposition: inline
In-Reply-To: <f971f8a8-487e-4b9f-8c75-80ebfe70c3b6@suse.com>


--napIOcvaMj7fpBqC
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 6 Aug 2025 12:46:36 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: S3 regression related to XSA-471 patches

On Wed, Aug 06, 2025 at 12:36:56PM +0200, Jan Beulich wrote:
> On 06.08.2025 12:23, Marek Marczykowski-G=C3=B3recki wrote:
> > We've got several reports that S3 reliability recently regressed. We
> > identified it's definitely related to XSA-471 patches, and bisection
> > points at "x86/idle: Remove broken MWAIT implementation". I don't have
> > reliable reproduction steps, so I'm not 100% sure if it's really this
> > patch, or maybe an earlier one - but it's definitely already broken at
> > this point in the series. Most reports are about Xen 4.17 (as that's
> > what stable Qubes OS version currently use), but I think I've seen
> > somebody reporting the issue on 4.19 too (but I don't have clear
> > evidence, especially if it's the same issue).
>=20
> At the time we've been discussing the explicit raising of TIMER_SOFTIRQ
> in mwait_idle_with_hints() a lot. If it was now truly missing, that imo
> shouldn't cause problems only after resume, but then it may have covered
> for some omission during resume. As a far-fetched experiment, could you
> try putting that back (including the calculation of the "expires" local
> variable)?

Sure, I'll try.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--napIOcvaMj7fpBqC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmiTMowACgkQ24/THMrX
1yyz/gf/TAjjh3F2m+hJHergkwX4ZwPtXu33CoPXWPENb6t2wXDgEVOP4K6tN4j9
5/hwE0lDaFiHFTYr/lWGY2dcV8Z60lJCYv+Pg1NYu25VhE5yyByanBEnftmwiJs1
nDJ711I9gG82uqdzDlMh6jzx4C5EtgEyYJISLwQ9B5hsKgmfQ2zCsMF3jaqna5QJ
zJTx0tbR4JWkkNvlj0R0a6LPFUYrPiIBlnC3c0MBYs27ZAu8X7ZXZk0mkLoBd+W1
Z0FOqKvgCorTkdgigbfLab7NgY3W3r2ORuXbD+adim964UzkH3CFlm9c6GvYifla
RblTFxvVKcL3KHB7zmO6mYHgwyWVeg==
=sbTY
-----END PGP SIGNATURE-----

--napIOcvaMj7fpBqC--

