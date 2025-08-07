Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F90B1DC78
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 19:30:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073390.1436226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk4RL-0004ju-E1; Thu, 07 Aug 2025 17:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073390.1436226; Thu, 07 Aug 2025 17:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk4RL-0004i3-B7; Thu, 07 Aug 2025 17:30:07 +0000
Received: by outflank-mailman (input) for mailman id 1073390;
 Thu, 07 Aug 2025 17:30:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=llzQ=2T=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uk4RJ-0004O6-7E
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 17:30:05 +0000
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2570ea8e-73b4-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 19:30:01 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailfout.stl.internal (Postfix) with ESMTP id 3D3EA1D000EB;
 Thu,  7 Aug 2025 13:30:00 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Thu, 07 Aug 2025 13:30:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Aug 2025 13:29:59 -0400 (EDT)
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
X-Inumbo-ID: 2570ea8e-73b4-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1754587800;
	 x=1754674200; bh=Bevdk7ICgKgrrnQo8ejvauzvjr053eD/iQdGeanZ8gk=; b=
	mzB+E7fVlkcknO1AGWJsZB5mnfCg0UQnyMxSs+wlkKGCJMZ+ZsrM5/+hijgoT2IF
	OLFwQdvEVwMbgC+wlwT4bfz6H0OKkpBj5LKzT86Lb11kFJ9IPjtrngHhobc6rJ+n
	q1wy6OwbvSJXNeAdmS5GmJwfnR6BbFfb0qN6tjYSRhcUZZmxFb+gkEGVWuuu2kZ9
	nK2CJ2H8kAFVtqHgXXlADXFNR9PF6JHNptxOPRTaHwaWcacXgY8o8zBQKYkxuu0H
	+xYsIuwf+ERShAqVlahafgThbE2VnvQdozhShwC7aePNCN1dHIVtoGvq1iWJaEll
	AQV0KKxXWykUOogpmiYJ4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1754587800; x=1754674200; bh=Bevdk7ICgKgrrnQo8ejvauzvjr053eD/iQd
	GeanZ8gk=; b=Tb4G4tJvXsa8uza5ha/1SPRIn8KI0C0vTxhjbvTKh2Oc60AeakJ
	TnkDOj2GJkZaX/hCVqIs2a3A7l2LmOSjgYfgOvHGCjgg47RlQ5SImTCmgXBT74po
	dQtqEK/MMVXy2wzp6mf+23dl4AlZJjJx5dfPdR44ynCAlyU7AXWx6xpws8nI35cZ
	w9VUQhAX3fV1evj312bX53/Z6xBqTUpT2dhEhG/xh3UF0OIcPBJa1HcoWs1G4Jka
	5OLAH/ib2Rv3Y8vKOCwhYy7IWEWl3d/+2p8C8tZkgf0coroEGJq2QZ8SwqnnQ2DX
	hxc8mS3lRdGaFYb+mSQZiM/YPCFt7d/CYFg==
X-ME-Sender: <xms:l-KUaF7kjU4EqtKvPh2XprcOsW5lnadFiNVtIuEUE5hWj6bXFKT_kw>
    <xme:l-KUaGK4vCwl6D97kMwAvUY4mgbRfw_iKXetCQmfMPOul_XEAEKDk6_AgirmLt2Jt
    k_dYJPrgZNdEg>
X-ME-Received: <xmr:l-KUaF4RJXkhbUiZgf18h4xPT6AXutP7dKn_q7J4uaLN2ROOvSIF32yGIlq15bhP0bPHdlkb8j6gmtQw79WQJW_ZjoWz96d4vQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdduheefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:l-KUaJxUbNPQ2KGNTtsTTv_kMOO41wIjmBWoRSZqxZ35Sv-glJpCKQ>
    <xmx:l-KUaJavhashJWybEwjskKCw4CcLByBHB4TPVdC75c6GE9XL0dM4Kg>
    <xmx:l-KUaLSQx4NQ11a4wRZdzRHrbyUAf0bPhqZNWAzJ7236dpk3ZZMRAA>
    <xmx:l-KUaDwVGUk3FRjvWimzbGi25xVl49T3PYV_uf3zqrBsty6IZZgZ6w>
    <xmx:mOKUaKLGKgUX5bTYNTKe2n5PcI8yrciH5yb0XCjl8eWtvvoi18u0UOmV>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 7 Aug 2025 19:29:57 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: S3 regression related to XSA-471 patches
Message-ID: <aJTilUXpchmRq2Ng@mail-itl>
References: <aJMtPLNqQFbGg5cs@mail-itl>
 <f971f8a8-487e-4b9f-8c75-80ebfe70c3b6@suse.com>
 <aJMyjYfeTL5uPRtk@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="StZy9aDMBBMzPOcv"
Content-Disposition: inline
In-Reply-To: <aJMyjYfeTL5uPRtk@mail-itl>


--StZy9aDMBBMzPOcv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 7 Aug 2025 19:29:57 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: S3 regression related to XSA-471 patches

On Wed, Aug 06, 2025 at 12:46:36PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Wed, Aug 06, 2025 at 12:36:56PM +0200, Jan Beulich wrote:
> > On 06.08.2025 12:23, Marek Marczykowski-G=C3=B3recki wrote:
> > > We've got several reports that S3 reliability recently regressed. We
> > > identified it's definitely related to XSA-471 patches, and bisection
> > > points at "x86/idle: Remove broken MWAIT implementation". I don't have
> > > reliable reproduction steps, so I'm not 100% sure if it's really this
> > > patch, or maybe an earlier one - but it's definitely already broken at
> > > this point in the series. Most reports are about Xen 4.17 (as that's
> > > what stable Qubes OS version currently use), but I think I've seen
> > > somebody reporting the issue on 4.19 too (but I don't have clear
> > > evidence, especially if it's the same issue).
> >=20
> > At the time we've been discussing the explicit raising of TIMER_SOFTIRQ
> > in mwait_idle_with_hints() a lot. If it was now truly missing, that imo
> > shouldn't cause problems only after resume, but then it may have covered
> > for some omission during resume. As a far-fetched experiment, could you
> > try putting that back (including the calculation of the "expires" local
> > variable)?
>=20
> Sure, I'll try.

It appears this fixes the issue, at least in ~10 attempts so far
(usually I could reproduce the issue after 2-3 attempts).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--StZy9aDMBBMzPOcv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmiU4pUACgkQ24/THMrX
1yzrUggAmKvBqN547067aX+lyvof6FxoKnF8mO2PsjEWcaGNTtIg/hyRXrGfxQ2Z
WwxF4wUrZaVOEiy/JB1op50OQDyD8MPlDqwjWUxsDdQmGAip0n1jqZFaSDSZ78Cw
BXHMsyCL5USYLoYw0zYcG9/p29nk2JKnzuaT59EauglhRr0OVRDkbcEDzNJBCl4J
I9NesKshoPyzBrmEREfWFGsmWMx5sJcvYMvhRYKm1kEN3tHwiHzBabXB8WuCGEsY
t13fi58QsW/wXG0o+Qo2WKUuRLtjb/KlF8CseUK8V3zGziqDprflO1lZXgA+A9o3
dP0Bxxy3ZKVa9sRMPdgrBK6YvH68+w==
=2K1z
-----END PGP SIGNATURE-----

--StZy9aDMBBMzPOcv--

