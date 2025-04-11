Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F28DFA86773
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 22:43:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947958.1345512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3LDY-0008A8-Vh; Fri, 11 Apr 2025 20:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947958.1345512; Fri, 11 Apr 2025 20:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3LDY-00087k-Sl; Fri, 11 Apr 2025 20:43:16 +0000
Received: by outflank-mailman (input) for mailman id 947958;
 Fri, 11 Apr 2025 20:43:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5hfk=W5=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u3LDX-00087Z-Q0
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 20:43:15 +0000
Received: from fhigh-a3-smtp.messagingengine.com
 (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 966b037b-1715-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 22:43:14 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.phl.internal (Postfix) with ESMTP id EB5ED1140282;
 Fri, 11 Apr 2025 16:43:12 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Fri, 11 Apr 2025 16:43:12 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Apr 2025 16:43:11 -0400 (EDT)
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
X-Inumbo-ID: 966b037b-1715-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744404192;
	 x=1744490592; bh=ms9fonwwnF6/fn9N0WAjY/BQCiY5wjtYy62hczZ2QEs=; b=
	cAeF61xUMlKZJ1BsDFsYJjaX3MHVCF0n17JtasanGWHys+lDcbd9WyP0rsgzAogV
	rw+mnf933m4zV5rKgoGlxiD7ZajVQ+6hiUzOQWYcQczxctNru9wqM1h7LTWrDI8j
	CcC5Bv3LlrOWe/WN161Vj525w6WoqF1/xmdoBAwc7L2SRIerykVb1/I1rTm1ZuIs
	LRgl+aWQtG+1W0MLwViKBjq07dg0ZHc/scOhBg5pufH31FKLLo+0XqwaTl+g3vn0
	fjEm03424qLuWJ/dQ4xuH4JtKmv9BFSsJhsi8bATM7nEFnQysQdcHfacjR0WqbOR
	eE6KWe/zmaZXOgvA7A/prg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744404192; x=1744490592; bh=ms9fonwwnF6/fn9N0WAjY/BQCiY5wjtYy62
	hczZ2QEs=; b=pw0evbTROkex5XByFpqbYxihXGX7/l6iIgdq02sxADAyrP2MN3n
	s0piqb3/k1wJhWL4k6J1+QckmDeQNJ2nxY8T9eD/A8VnUDoZU97++zCebxjQAGOU
	hRxPXMBrKp1sw81dYS5IX6MOPsOYnBJw9/czFJwd/5wRD46MpvrtGQQp1LMysw8u
	dWJsGZsu4V7+XUzLqM6PoJ+eym4DeKZoC4qgUcUBmXPIcVBh9kIbGtAebtlpfHoq
	ml4Qq2PDwzF8mmsvjKFYyjvA/FEzGOYUeTw30nsm4Pmr4Q6mGQyL7nCezjgiJH38
	waapm6mSCnMytx/OEu3QLo4ChSr6/gZ0hFg==
X-ME-Sender: <xms:4H75Z5Vmqipkee03QoN590tm9H-n8HjWxe4XLuG92yVA9Z3h8SN_lQ>
    <xme:4H75Z5mnCVLRu8Bhk-l5qus6y0HRB4TPB7dGrNjmxpIAPM-KVwwt5gde2HVlCc5rP
    _gScpw5Kj8n3g>
X-ME-Received: <xmr:4H75Z1YqHMEYHnpSrKzpcoTvEhIytm7y5O1fkfQWWpbFREF9-WoBPKXXHUTSkccedx-n5DDLwj_Tnmv3nEqslhQJvsmJqsDFOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddvkedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghn
    ughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqd
    guvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegt
    rghrughovgestggrrhguohgvrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhnih
    eskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:4H75Z8W2Mmdvh-_GLi6Wc-00ok8jtSQhPkBFQCXA_nz9y6GL_pLTdg>
    <xmx:4H75ZzmUrBCv4ZE4kM-_MTcOvex-7q7VcxztfouC2PPhCtl-B2XRnQ>
    <xmx:4H75Z5fuGLoXdeRGphDBKV3VMQaqWdRf2QhoYY1VCK6fD9LsMDpjaQ>
    <xmx:4H75Z9HRyvpYRXxTwVNJnJjcS2_vgddrK5W6-yFGU4Z4kxnhTv8NKQ>
    <xmx:4H75Z12HFn7w8YieSzmKG0vabO4xV8z2lyBm5OBL3NmJtOCRbZIHpyO5>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 11 Apr 2025 22:43:09 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 3/7] CI: switch qubes runners to use console.exp
Message-ID: <Z_l-3fXeTHA6N4Z_@mail-itl>
References: <cover.146eb3617cc9cf442dd4fc7a0a8950fb1bc191c8.1744403499.git-series.marmarek@invisiblethingslab.com>
 <668fb90bbc5e418f6aea85e81d90343d834a066f.1744403499.git-series.marmarek@invisiblethingslab.com>
 <fde17938-a7e9-4e31-9b77-77080525294e@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M+7URqF4FjX/zdFP"
Content-Disposition: inline
In-Reply-To: <fde17938-a7e9-4e31-9b77-77080525294e@citrix.com>


--M+7URqF4FjX/zdFP
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Apr 2025 22:43:09 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 3/7] CI: switch qubes runners to use console.exp

On Fri, Apr 11, 2025 at 09:40:31PM +0100, Andrew Cooper wrote:
> On 11/04/2025 9:32 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > diff --git a/automation/scripts/console.exp b/automation/scripts/consol=
e.exp
> > index 834a08db1b95..bdb1dd982003 100755
> > --- a/automation/scripts/console.exp
> > +++ b/automation/scripts/console.exp
> > @@ -45,6 +49,15 @@ if {[info exists env(BOOT_MSG)]} {
> >      expect -re "$env(BOOT_MSG)"
> >  }
> > =20
> > +if {[info exists env(WAKEUP_CMD)]} {
> > +    expect -re "$env(SUSPEND_MSG)"
> > +
> > +    # keep it suspended a bit, then wakeup
> > +    sleep 30
>=20
> Do we need 30s here?=C2=A0 Couldn't we get away with 10?

I want to be absolutely sure it got suspended (target system actually
suspends only after printing the message), and I've seen some drivers
taking a bit more time...

> Either way, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--M+7URqF4FjX/zdFP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf5ft0ACgkQ24/THMrX
1ywlowf/W6xtAonQYU0G4f9NiAEYVKRgXyyVIHPYmpcU06Bu2mvvDYTpqMlgTnYL
c8CEX+2b3zD95t4afTO/0yKeln0JX4772Z8WOOE851uwX/pm/J+5AyTJV3iwKXW9
PPfZmGGDhNQO0yhPtME0yQlv8h0evhuVy2gFxDsrnDMUs79Y1HyJN+zKlwHM4XTC
ClnnMpsPNJ5W5I57E35/FyrimdwoeG46MPTbpZjZnfEffc+rAH2RQyciBkzxg3JS
+n6B1O3DhyZDXJYojboOa1d3+8aLx6v+6ybQAaJhBuaL4gUheDxt0e0Eq2U/+Vut
GQhKL0E3juW2nNvjKP/+qgkdxWxcaQ==
=qn1J
-----END PGP SIGNATURE-----

--M+7URqF4FjX/zdFP--

