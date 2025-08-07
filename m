Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBECB1CFAD
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 02:06:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072307.1435481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujo8n-000298-Ao; Thu, 07 Aug 2025 00:05:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072307.1435481; Thu, 07 Aug 2025 00:05:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujo8n-00026m-7l; Thu, 07 Aug 2025 00:05:53 +0000
Received: by outflank-mailman (input) for mailman id 1072307;
 Thu, 07 Aug 2025 00:05:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=llzQ=2T=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ujo8l-00026g-3i
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 00:05:51 +0000
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 463b5111-7322-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 02:05:50 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailfhigh.stl.internal (Postfix) with ESMTP id EA1457A08FD;
 Wed,  6 Aug 2025 20:05:48 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Wed, 06 Aug 2025 20:05:49 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Aug 2025 20:05:47 -0400 (EDT)
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
X-Inumbo-ID: 463b5111-7322-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1754525148;
	 x=1754611548; bh=Yy4AwNCxyeIe0srEz6aXNzEAyAg8MNNYDyg7dsTsAXk=; b=
	KTaJI8auG1k/obqyfjikELAMeLaWvyVYl4qlJVnX5y/TdBK8ziriuAScM3Z4tuqj
	m8DJ8OL349ptrinw8u7M7H3lDXABUdiEBi1Z7RuOg4IxNhhPT5GLbInkAK8S0fVd
	gVIucqBLb+ckC6UyJohDZ37z/Uy7oThjF+RGD7yA07D0pAeudrJuULTLcknVjphP
	0VTZnauwia5Ou4qT0L1bNzQbCqEKykERavCR6MMPpQOWvOUf6sZaDqY2PmIfAO5e
	zTsnU4iNFtS1T9agauGjWl2n8PvW8NrDHuwUjUdEoLxZE3exZaP8Ew9JeodLvbjS
	edHsQVztGW8fx8M4PGh7pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1754525148; x=1754611548; bh=Yy4AwNCxyeIe0srEz6aXNzEAyAg8MNNYDyg
	7dsTsAXk=; b=SFeNFT0mu9Os3EZZZGuMXIMqdKVPdfQt7SW/1VLoqPv9+g3RcsY
	MxfjlLn84JXhwmAZmU62L8JbBY/m38LrY913Wi7cvgI3eKSu2c+MSD2PrPh7HlD9
	+cC5MDI8d/GB3kuGRuLcJM2cIrJVDLo9ND4xi2bcIgFPdiba/95Okj64l46heli8
	sVvEtYfNMmHARuveWldyWy9437gzEHI9pCDzW6onsuoptOVztgjsnxEwRQT6vJWq
	WaEvV1FAN/Y0tSUtycCki/pnVSvyN5rtVHi72Es3Nfvbqeu7qVnjyVDU06z5Y12X
	YhnamWP1/3Le4ld33Od8ex+kx2KDy3eR0Nw==
X-ME-Sender: <xms:3O2TaHyf8GfnJ8WYH6v5kiusnw19KDj8V6KJCOcx8SjJN1_682uMOw>
    <xme:3O2TaJ1d92xNsf8LkcKhSi_P165GqqmfVgx45NQQd__CeOUSW_BLry_TXXQzKY7ZD
    rh6zQKlAsGD7Q>
X-ME-Received: <xmr:3O2TaN73Se8OLu-pPyAPbSk5cDQpvf3DLAqOXKtNek3KtDAS_FpqSDxKSUKmF3Hdk6e9_17Qzd0Vf2CIdfk2c8TS60osEPcSR6I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudelgeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptdevtdeh
    gfdtkeejhfeggedvtddvleffueeuuedtjedvveevffejhedvieefvdefnecuffhomhgrih
    hnpeigvghnphhrohhjvggtthdrohhrghdpihhnuhhmsghordgtohhmnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgi
    gvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhef
    segtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:3O2TaEUzGQkI66AUfNkeZFfyY4UGOz-sMBd0lZsYc4Jdj0miKXDNcw>
    <xmx:3O2TaEAg_evJ45ELPtVzHGbNhjzCEZIhFiJRGRXwSKNK6aTQnmChDQ>
    <xmx:3O2TaL5Oq6jq6ZsteuHmnNFT9g1IXWN9yXdaDQo--4_YnrGqrCc8oQ>
    <xmx:3O2TaHwhBDCGd0Vk7O2na1cj96zVy_lE5G_JWsOUPxjAcxUQtEUZkw>
    <xmx:3O2TaJMIps2430orJxMHXQxa1Hw8xHjs3uJOiC1O2UeK88-k4kXGb5DZ>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 7 Aug 2025 02:05:45 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts] Add debian rootfs artifact
Message-ID: <aJPt2klRMJz34b-o@mail-itl>
References: <20250807000318.2284283-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JQJX+YBVouSRJAht"
Content-Disposition: inline
In-Reply-To: <20250807000318.2284283-1-marmarek@invisiblethingslab.com>


--JQJX+YBVouSRJAht
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 7 Aug 2025 02:05:45 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts] Add debian rootfs artifact

On Thu, Aug 07, 2025 at 02:03:07AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> Will be used as dom0/domU in some tests.
>=20
> Install OpenRC and setup it to start /etc/local.d/ scripts so tests
> don't need different cases for Alpine and Debian.

Looks like this one did not reached the list:
<xen-devel@lists.xenproject.org>: host
    lists.xenproject.org.us1.protection.inumbo.com[46.21.106.111] said: 550
    5.7.1 Rejected by spam filter (f436205f-7321-11f0-a324-13f23c93f187) (in
    reply to end of DATA command)

I just hope people explicitly included in cc did got it...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--JQJX+YBVouSRJAht
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmiT7doACgkQ24/THMrX
1ywPsQf/YyTYxuEGfUTd2kR931Aj5xchaVEuLoCKtxKaLMmua+XJ9fPYtMKjoBhP
DpN4GhZFE1dnPDHFYaoOMGDmvH4zZwvDYioE8TGq4ycbVAM4HB7V7a88AnnjxkqB
sy31YLt5GtavIie4SeaMQq67umwRI4Z0P4asLKMYx/0ZtaWTrSJ/R9cLnKhHeMk6
mqBbBk02oBv93ZbhCVlPW3y+QZuexgY7oNKca8uaWgZtIEtcfnl2KnG0E2OdaBVt
LE5UGhX3nbn3kPC7aB1REr23nOuFibr2HpDO/vy908YW0A0EJQVqY75x/Z9dv8yi
o6IFe4vILOdpNK4OJZ/QDmEOJRSoAw==
=zFuh
-----END PGP SIGNATURE-----

--JQJX+YBVouSRJAht--

