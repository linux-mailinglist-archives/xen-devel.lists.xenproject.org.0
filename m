Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11303CFFB2C
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 20:20:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197163.1514789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdZ4A-0005Y6-UA; Wed, 07 Jan 2026 19:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197163.1514789; Wed, 07 Jan 2026 19:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdZ4A-0005VU-RF; Wed, 07 Jan 2026 19:19:34 +0000
Received: by outflank-mailman (input) for mailman id 1197163;
 Wed, 07 Jan 2026 19:19:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj8w=7M=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vdZ49-0005VM-8R
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 19:19:33 +0000
Received: from fhigh-a5-smtp.messagingengine.com
 (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca59b63a-ebfd-11f0-b15e-2bf370ae4941;
 Wed, 07 Jan 2026 20:19:31 +0100 (CET)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfhigh.phl.internal (Postfix) with ESMTP id B9FBF14000FC;
 Wed,  7 Jan 2026 14:19:29 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Wed, 07 Jan 2026 14:19:29 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jan 2026 14:19:28 -0500 (EST)
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
X-Inumbo-ID: ca59b63a-ebfd-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1767813569;
	 x=1767899969; bh=rjlyU6n6NQN+n4tpxvCX19FpLU8GV94niAV2v1LdhJ0=; b=
	bVAhzkicWTvAzPlKCKTAGL8zUdj2kqPhoPNBpPMBo0cjEzk8LzzK4lJkbBp9TygV
	/8dJPKu6fF9BrEAvwF245vCUzqV2ro8Rs1fETPodkMtlVyoGpukiCTRG02QfKp4h
	sK845QKJVpDu0G/zGK/8qOuQOr12rQFeLEKE9BolemaFla8Dwp0iIA1vcmTETx+d
	WZy3Y6qepcWOS+P5BYcuvNkJNG8tfPGrVI4Tky+tNA1PZZ5irJsZESqAKlAbpdU3
	UCDcaaPRvlAucA0BL0aXYuZUp65Ub1D96Lgwxg0OJcKVbKGhDyE9iSi5e/Zt+NeR
	Wee+CMvHFkde8VsWp1PV0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767813569; x=1767899969; bh=rjlyU6n6NQN+n4tpxvCX19FpLU8GV94niAV
	2v1LdhJ0=; b=a/v3gxW7rxsXkS5BzWw+HTsx8S48pmxKtZVKkKnjmsoGr72i7YB
	TZuX0/2CX2OBwjDILkvljjshVrKKtuXIfB9TY0uuIxn4PweIE1GCl8h5wjOBlU8v
	oAH/Q/LjC1UjsN2nGuxpDfNphJcNtVqP8/sSpR64ooGnfgQP9G12FeKM0y9ioqop
	Xn192c9C6JkiI4/Vh8lCHjGOnaWkvXHTX1k5Il2Gt4U66YOFjzU7OPBay/doNacS
	aaSRQuakRMCuQRXz7DwYbi1vgLJrqSpGusO8iVyFrOsL4PinJGCut64hNHfol5Ob
	ILtbWMVlnRSRGK9qUXyIXRqO1gzPbQgx2tQ==
X-ME-Sender: <xms:wbFeaZFNiW0_hcO56mg-7c4bKOWcJWP7jDdtz8mMzIPGjdswkqYvhQ>
    <xme:wbFeaVUNAaIwsCgwWVGDYrPqCIDWCgRw4Nceq7GOpsQeSb_ffuZlPWV9FeHqHtrAX
    BnE2IBTSxg-gcQZQdX6W5yAYL2iGEoCDi9SGEHtrRraO4DfHI0>
X-ME-Received: <xmr:wbFeaQIZs1qPbaJslfPsgcaCMr9xAxn4FlEtPQVme7E_-WtyPekWOpWtRsA4J57Tf4dwkULadEYWSjcgOcorAsUnrfVUlBEv6Z8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdefkeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtgho
    mhdprhgtphhtthhopehjrghnughrhihukhesghhmrghilhdrtghomhdprhgtphhtthhope
    hmihhlkhihpgifrgihpgeftdeftdeftdesphhrohhtohhnrdhmvgdprhgtphhtthhopeig
    vghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:wbFead9_sSkMZJR3Irxo97K89JsV1E-8xBHI7nQkOwx0sCoX_ScbBg>
    <xmx:wbFeabIBSypwATP9gkXhwO_xNlad91rmbrDj8rzt8_CfnHPAigPFRA>
    <xmx:wbFeaanyI6BkYCGGAakXtbRqtVrh_UTtsIWR8u2B432iuWPgl-WU4Q>
    <xmx:wbFeaXM7CUVQD_CXcmiRQ6ijuKnL26FDoUca_xdQqUDlVFVHuhbMaw>
    <xmx:wbFeaUZESkB_3kmlNSlMQGu92vaU9oR4tO-pIt1IEH_Ma-4XESoInn2l>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 7 Jan 2026 20:19:26 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jason Andryuk <jandryuk@gmail.com>, Milky <milky_way_303030@proton.me>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Cpufreq drivers not working on T480S
Message-ID: <aV6xvhqjX1sOrXb1@mail-itl>
References: <dg8zeLW4X3RWRJt-1jas5pAqHft5GbxYxS5mNwc4ONE8tDEruL1-5a_e-vQu1RdOUWsMXxKe_Igcewy2zcbnOfkaGVG7y6hXLcLd78HI1po=@proton.me>
 <CAKf6xpsN_RnY2dHnXKj_-UySf1z0auye2qy=KHOEhcBbZ1un9A@mail.gmail.com>
 <NqFx_tXl0Zmx2ft7YVNGodkDcUFK7nA8KWUQMjOmD0y4T5W3-sTcGxCt7ViSRObUeJog3069xTY0ODZIG5hrX-Th2MvE95dSze13MGQ2tOY=@proton.me>
 <CAKf6xpvtF_cE7vMb9JfsVLkYH1XRXZG3nj+QO_72-zKJ3Cxh9w@mail.gmail.com>
 <DkXw78UBxXYCLNKCoThGPM1kde5JwARo3NhWtlBBrrFtLFVTnwNlwDlZYzuNlSdAs9XzE0aDPqgt9dri9YKJULULBXwJLEcEgbLOgzkVSVU=@proton.me>
 <CAKf6xptg+0KrsjrmLD1iZFuT411S+7Pz9-HSX8L-KwQFR8o3Nw@mail.gmail.com>
 <6f02aca2-eaca-48b8-a2f3-4afff42ad264@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2HGh07lK15T6GBLf"
Content-Disposition: inline
In-Reply-To: <6f02aca2-eaca-48b8-a2f3-4afff42ad264@suse.com>


--2HGh07lK15T6GBLf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 7 Jan 2026 20:19:26 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jason Andryuk <jandryuk@gmail.com>, Milky <milky_way_303030@proton.me>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Cpufreq drivers not working on T480S

On Tue, Jan 06, 2026 at 09:25:14AM +0100, Jan Beulich wrote:
> On 06.01.2026 02:03, Jason Andryuk wrote:
> > no-hwp failed to disable HWP.  But if there is no ACPI CPU data, it
> > wouldn't work either.
>=20
> There isn't any "no-hwp" option that we would recognize, is there? Iirc H=
WP
> isn't enabled by default, so simply not saying "cpufreq=3Dhwp" should dis=
able
> the driver? (I already found the original report confusing in this regard,
> hence why I preferred to not reply so far. I wonder if there are local
> patches in use.)

Qubes has a patch enabling HWP by default on supported platforms.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--2HGh07lK15T6GBLf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmlesb8ACgkQ24/THMrX
1yzl+ggAhQ+BeDiQz/Pds/RTCcpAv/R4Lq+fwTa/ahy0ZN8kODVZ+PHo+IcJ/67s
Q2tBIuf/EZFIQkzpOYd9LiPAfTNpX7nES8XW8kgq1uMwQvKj6EpuxTzjXrcIftH7
0NQC3nxzeFnWaBaorPibyk+9pRaaABLFGHS3W/LSVXykp1XzzsjdEQS+BPDHquLl
g5nj9ELS2yGcGnInompHuUJZXTkWbDMcKKvE5gOLmBlq44XhvwE49xKluCjcYlSR
bn6NfN/ta20b7sOudE7MLZWnodvXw4u1icPbcZTsFtXM3064TTGAlmCciPbijz51
+doT1KpfKox+xhZ0f+aeLA67W12zgA==
=g0tv
-----END PGP SIGNATURE-----

--2HGh07lK15T6GBLf--

