Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9889499D945
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 23:37:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818913.1232200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Skm-0005qm-6A; Mon, 14 Oct 2024 21:37:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818913.1232200; Mon, 14 Oct 2024 21:37:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Skm-0005ox-3W; Mon, 14 Oct 2024 21:37:24 +0000
Received: by outflank-mailman (input) for mailman id 818913;
 Mon, 14 Oct 2024 21:37:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=043R=RK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1t0Skj-0005or-Rw
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 21:37:22 +0000
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7cff2360-8a74-11ef-a0be-8be0dac302b0;
 Mon, 14 Oct 2024 23:37:19 +0200 (CEST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 87D8E114015C;
 Mon, 14 Oct 2024 17:37:18 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Mon, 14 Oct 2024 17:37:18 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Oct 2024 17:37:17 -0400 (EDT)
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
X-Inumbo-ID: 7cff2360-8a74-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1728941838;
	 x=1729028238; bh=E2pZ6HXZGXn6JL2Rjnw6GMA6i6M+jbDIUvaH9jTyyKA=; b=
	Rpi6vO+ky2mADG1V0vZ/58m/FU/Fp1ee5/yo2AJGaVP+8apgYNqDH2UFkgM+x/mC
	lOkiJIreboHzRDNvp85DNBJyo6RFq9lXrfjcApVjBzoDWeuNyfQKNqk0GIcarusd
	wqZOkJaz7BB03MHryGZv6VVAwNgpZWsteqBoM84VE/tN8XG4AlVZ612u2M9GMGMj
	9dS7pVk6tQq/84wxBhG5syi+xYgebycBFlen6Dq8Aks6V/kGnlmarWppXF0tPrRv
	ydhsgDan5HnAZz38AkEC2UPrH0yEb0DeUAuwiBDJHUu8lBGwEW+HSjLRQUfysdJP
	Ibac5CKPozQZc6g81fhOLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1728941838; x=1729028238; bh=E2pZ6HXZGXn6JL2Rjnw6GMA6i6M+
	jbDIUvaH9jTyyKA=; b=VyrVvP1ppm1nS9Zbi4fkwgHjxqebvWmCkCzCXBDl3eJX
	g34DQ+beLVEHmofXhZBySjDnAINLjwuVqqbqg19GDkB7Nxa7qb1obp5eLo+Fg+z4
	C3qlTVDbonbHiqEjWi2ixNXjtUKZ+0mbEyO1fr9fc3aoxsqmVgGEaytf39A1GUuT
	hCA6H7U1AbB8df0KptQmAPzoK4WchIqLlqXW+hCXs0UfHiffjZAK36N4RyBIu7bb
	OofYG5rXTjy0WVeE//H/y3QEUr6CxzRHKzqzF4go4hVU+TTCV3/NN3Enjf4hmvne
	0T+V06aShiTRcnVCH6ADFFHhbZVb1/STBDq8cZYFaQ==
X-ME-Sender: <xms:Do8NZ0FUx8souoJAlRSr82xO-cKVmBlAYI4mEVZYxw5Ex_8N6hRDOA>
    <xme:Do8NZ9VhcyuLyqsg_Yx8kDFNV7k3dpCwWr1bbiUn5Z-hGX7worRSBCTXZUdGcbQux
    QKbPjKETiqqEg>
X-ME-Received: <xmr:Do8NZ-JdwgflLtIakjXmYP8i-PvSajfnHeIrZ0cSdYMIeMYldQ5GfZxPIUxGsesnBHLQnhu0d5waI-MwM4cj-9TG2LOLg0VrTw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdegiedgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepueekteetgefggfekudehteegieeljeejieeihfejgeevhfetgffgte
    euteetueetnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedvpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrih
    igrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhho
    jhgvtghtrdhorhhg
X-ME-Proxy: <xmx:Do8NZ2FxVrsfq0FfIjjuODMilJ3CkqYev6Hdj65bYfooYSQjqcv9zQ>
    <xmx:Do8NZ6UwW029PYRRL4kb8cicjj6sGqMMtvuCEwi_aNU87UE3ySUwhw>
    <xmx:Do8NZ5OQikwxDFXJH3_OOWO1W1iYmiaqTZuXHlVs5d7Y0PPWeVRbcA>
    <xmx:Do8NZx0yBUmE1JBIqM4MYDkTb1rMmnqsWGSGAja2FI6oiynqQd8tew>
    <xmx:Do8NZ9fn65NXZDrtT7a7MOP4it1w6S5J-3XNNSWls5R3ekRXgumA7AZP>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 14 Oct 2024 23:37:13 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Xen PAT settings vs Linux PAT settings
Message-ID: <Zw2PCXSdxjrqP4bn@mail-itl>
References: <Zw1iSuLD7473m07N@mail-itl>
 <dc7a4441-b082-459d-a954-78f43d7d35bd@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oh/fywFlm7BR8i0T"
Content-Disposition: inline
In-Reply-To: <dc7a4441-b082-459d-a954-78f43d7d35bd@citrix.com>


--oh/fywFlm7BR8i0T
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Oct 2024 23:37:13 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Xen PAT settings vs Linux PAT settings

On Mon, Oct 14, 2024 at 09:05:58PM +0100, Andrew Cooper wrote:
> On 14/10/2024 7:26 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >
> > It looks like we've identified the second buggy driver that somewhere
> > assumes PAT is configured as Linux normally do natively - nvidia binary
> > one this time[3]. The first one affected was i915, but it turned out to=
 be
> > a bug in Linux mm. It was eventually fixed[1], but it was quite painful
> > debugging. This time a proper fix is not known yet. Since the previous
> > issue, Qubes OS carried a patch[2] that changes Xen to use same PAT as
> > Linux. We recently dropped this patch, since the Linux fix reached all
> > supported by us branches, but apparently it wasn't all...
> >
> > Anyway, would it be useful (and acceptable) for upstream Xen to have
> > a kconfig option (behind UNSUPPORTED or so) to switch this behavior?
>=20
> Not UNSUPPORTED - it's bogus and I still want it purged.
>=20
> But, behind EXPERT, with a suitable description (e.g. "This breaks
> various ABIs including migration, and is presented here for debugging PV
> driver issues in a single system.=C2=A0 If turning it on fixes a bug, ple=
ase
> contact upstream Xen"), then I think we need to take it.

Makes sense.

> The fact that I've had to recommend it once already this week for
> debugging purposes, and it wasn't even this Nvidia bug, demonstrates how
> pervasive the problems are.
>=20
> > Technically, it's a PV ABI violation, and it does break few things
> > (definitely PV domU with passthrough are affected - Xen considers them
> > L1TF vulnerable then; PV live migration is most likely broken too).
>=20
> Do you have more information on this?=C2=A0 The PAT bits shouldn't form a=
ny
> part of L1TF considerations.

https://github.com/QubesOS/qubes-issues/issues/8593

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--oh/fywFlm7BR8i0T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmcNjwkACgkQ24/THMrX
1yzfQwgAh/956Z8NeyGlNS6LADzp9jI8gLUJ1rx8ZA+VczGrI8/KPXX47xSuqiS4
Vlmmr32nyusZKIcRzKw4CiQrs5UZK/9IeVTqaJM5fsjCPHlnK5gpUwHV3XtaCdoN
VRGnNhLB18gXpgGhwb5jnaCWaSa68kcvrIqJZ8z779ySmTPKQecxdY7M5pGgCXRX
znZnjizJelzt2Dqr9Ty0FE8gcYzU8nk7ic2pTL51E+hsIbqH/x5ZJRf5PKLvCZNU
0aWXHg/I81o0fjRt5u0BbS3YkVfqHXhU74qFjHfxnVxHzm2PbpuGcGbZxKD8F8zu
masCUcNqzzoFQUAkykwazIItkfJ6GA==
=YciZ
-----END PGP SIGNATURE-----

--oh/fywFlm7BR8i0T--

