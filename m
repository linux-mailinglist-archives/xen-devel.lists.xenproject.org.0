Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F70EAE4642
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 16:16:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022501.1398337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThxk-0002QO-Qu; Mon, 23 Jun 2025 14:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022501.1398337; Mon, 23 Jun 2025 14:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uThxk-0002O1-Nh; Mon, 23 Jun 2025 14:15:56 +0000
Received: by outflank-mailman (input) for mailman id 1022501;
 Mon, 23 Jun 2025 14:15:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TVau=ZG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uThxj-0002Nv-8U
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 14:15:55 +0000
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91d6d1ad-503c-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 16:15:53 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id DF9B8138043D;
 Mon, 23 Jun 2025 10:15:51 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Mon, 23 Jun 2025 10:15:51 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jun 2025 10:15:50 -0400 (EDT)
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
X-Inumbo-ID: 91d6d1ad-503c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750688151;
	 x=1750774551; bh=qns6fN0fK2/ObDf94R9rZadp1F7Ip6+JKqr5aJYdcLI=; b=
	SoX0/KcxUtYaw5awb6WvtnB8AVkbFKj5nVrrkw4x1jiP17kkNxlcIWIs8D9vMHjI
	WBvAumUxTdI7Od/sEr9JzgLjiSqbOzdAq/4J03KDpSb/SyuTpFyDII7yvOTsS/Yv
	7IWDzAof6nWR0K6B+SmlEAgDD+5wGmDh0Yq7vXuyBXhTDF8eA9+l2ulTLNjkvlTv
	v+V9JjApebVJB5DUWnc1RQK+BeLvuRzj8J3p+MYWrO+IXd4yxvtJh26BpvjaQUFj
	QfIQ1x6VfobwWHN64b3qaUKLvJs2/D/B5ryVyTAkjSUt0f8bQ1h0ltpKLBu/RtKa
	JwijIq9fSosTV1ZREUamFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750688151; x=1750774551; bh=qns6fN0fK2/ObDf94R9rZadp1F7Ip6+JKqr
	5aJYdcLI=; b=S72KPoEOTCqVsgwB6+VuJCxZV1easrN52HpCeL7m5JSXpi4KVVi
	xv6Qb7OV41zxKm5PPHAJ19TvazYKCQre/AH0VksP8Mk3TI3VRcr9dgE3VMWDrdi8
	W3MLTy0GajBvtAgVemOAwQAGtohD+tR22X5z8D5hgIVDcYKK/NmL0j0wDq0sDP+m
	b7MdXjwncke88ayHyz8tsZSev8L+fU2hf5bH37WesbkagWaAj1m/DOzGFKhDNxgQ
	3K0P2wEONBiHQNvcbyBhUtyBJ/iu/GenYamt/VhcBaTD6/LEgUVCrEfa/9SS/2PL
	2v4YCVnYlapFP4G877CZIriKgnhmGzWEEJQ==
X-ME-Sender: <xms:l2FZaEHg--iYu1niTy4nYM0ASahRDc4yLKlgLtzdu9twae4u-scnvA>
    <xme:l2FZaNX9muDRMUp8i1uTbsisFvR2adD-gRY4Y3HEsxz3ATvZyxjc8EM7KONPlvZCn
    86Gw3Zp3wFhRA>
X-ME-Received: <xmr:l2FZaOLJx498H2jBGka7YZpIchb19GeK60sGy4fN4_IUo5pWEQQK2ARcZHkW12MkcddJaudOsG5svnYIMocOg7PbRWaKjINigl8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujedvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghi
    thhrihigrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnh
    hprhhojhgvtghtrdhorhhgpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:l2FZaGFtrRQ3ouB4tSC0YMtsTKLX8cEPHisAO9zXQfSBbSKqwI5dxQ>
    <xmx:l2FZaKV8zM2-PLiCPvHF6OjSfN2GGZFT3u3YDhsu-a0Ud_FnrL0rMw>
    <xmx:l2FZaJPsD9ctxWJyDthOQikwdL_NkwgE8QLh2-YtrTIMqKvdl_jFGA>
    <xmx:l2FZaB1edeSiLDiiH5mdWH8LzMFAWBXXjdnbdBIGcicv0_1GUkBfkg>
    <xmx:l2FZaAiGtwOmq1sBJ9UMnEkVJqNdw6G-Ae-qU-q6wdDSct_n6E-2EgQD>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 23 Jun 2025 16:15:48 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v1 5/5] Setup ssh access to test systems
Message-ID: <aFlhlKc8Pl76SgTW@mail-itl>
References: <cover.7129d44a341f3fb3a85f808a998c28ebe8a77ee8.1750684376.git-series.marmarek@invisiblethingslab.com>
 <d9e1dc62d2bcf647e0a1d26d90d2d33778d954a1.1750684376.git-series.marmarek@invisiblethingslab.com>
 <fe0adc4b-8bbf-41d6-b33d-54f5f9f18156@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mfA8UifdhOeM+qRB"
Content-Disposition: inline
In-Reply-To: <fe0adc4b-8bbf-41d6-b33d-54f5f9f18156@citrix.com>


--mfA8UifdhOeM+qRB
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Jun 2025 16:15:48 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v1 5/5] Setup ssh access to test systems

On Mon, Jun 23, 2025 at 02:56:00PM +0100, Andrew Cooper wrote:
> On 23/06/2025 2:46 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > For this add also bridge package, so xenbr0 can be configured with
> > /etc/network/interfaces.
> > This allows extracting more logs out of the test system.
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > This enables passwordless root login. It's okay for qubes runners, as
> > they are isolated (even from each other). Is that okay in other places
> > too?
>=20
> It's potentially a problem on a corporate network.
>=20
> Can't we have each job generate a random password an insert it via the
> dom0-rootfs overlay?
>=20
> Or alternatively have the runner drop a public key in
> /root/.ssh/authorised_keys ?

That can work, yes. And is preferred to a password, as easier to do
non-interactively.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--mfA8UifdhOeM+qRB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhZYZQACgkQ24/THMrX
1yyAOwgAlIdXdb5K+YCy3hIBc9JQ8vPnGKTBcB9MvCH+IjOwj+zU/pE4UgmCgGJ6
ONBDnfHLaDpYGsRzJiimOvwlhRUFxxy4Lx3UlgEPFVYO2lNDSaiOAKaOar+e8CWK
ZpxsQ0OR807hN7KmMiqaHRBh28Epj5bH8VsCC1YzTmz0izOo4rUY7RNtV3fxenEd
G+x3Y11UaqWylO9YLG5xO1CecSlGT33hrQWJ9PpCydLG/oNxvgDVLCm4n/tn7TWe
F3xA2cCju7GWIM2Vzkdv8ohOsgsvGy0TECHx/JqThT3Zc1a0pLEUEYY9oqMx9ACp
bfJxDa408b5yf8F8RBTHD2uoyWekIA==
=9GN4
-----END PGP SIGNATURE-----

--mfA8UifdhOeM+qRB--

