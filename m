Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9344069F8
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 12:20:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184228.332805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOddc-00068z-21; Fri, 10 Sep 2021 10:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184228.332805; Fri, 10 Sep 2021 10:20:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOddb-00064g-Uc; Fri, 10 Sep 2021 10:20:03 +0000
Received: by outflank-mailman (input) for mailman id 184228;
 Fri, 10 Sep 2021 10:20:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/vwH=OA=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mOdda-0005ty-Ji
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 10:20:02 +0000
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a844ba56-1220-11ec-b223-12813bfff9fa;
 Fri, 10 Sep 2021 10:20:01 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 183FC5C0151;
 Fri, 10 Sep 2021 06:20:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 10 Sep 2021 06:20:01 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 06:19:59 -0400 (EDT)
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
X-Inumbo-ID: a844ba56-1220-11ec-b223-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=NrqFJE
	A7K6DO9LA/zODEzDVYxlIRo+E5W5azI/AS25s=; b=gnCMg5Sa3W3YRGREGMaFBI
	kjYQ38F7khqobc9HZSyAeTpG0otGcxXMaEDKFfOntPPw8u9uq5TUK6f/PVe5uFU/
	vhUgu0VRVgVC0hqcNvU4sAgJMZvx1xwfIA9toHcVz7QFcmxTVqapFu+/uowYJSLl
	7+qhj6GzQ4Ic5197tOIRPKcqUxDlwUEEA0JOA+SzHsKoKD67pV1F88SG4/4RMTa+
	rZE/jGJGBztORg9Vp3s7DDyL+SNIWRmt4P9bG/+CfjZpLMGBMaZdpgeu7TlQtjRF
	w+72l5LepDSEkt7Jx4sjlJjfNpMx1ib2DMLuIdA63I/tbiQZEjoP/g3Vr3FgvSqA
	==
X-ME-Sender: <xms:UDE7YQ_psUErcvCdfEma6qtxyiDa_x-tzPPBMWdIhCeHGMjQKmX7Fg>
    <xme:UDE7YYvR7fOyf3bAkoYQq2G6EPSTJimrGxTtBEX7OQJzdwpax9enI_v84rWiy7lZz
    0Ebdqr5e69jBg>
X-ME-Received: <xmr:UDE7YWByCTTyEz0wEH7cUKTgig4vEtRj5NOvrFUcZ6p0sUbHH-zIJBrsWtX5pJ-Rx1vM9ptFnyItnunA-bEa0SKADITQyp8a>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:UDE7YQdfK5rsmuH5zxY9z7O41G-OHzAzlpYQZ7DnGydc_3gRj0kmxg>
    <xmx:UDE7YVOEj4S9hxKU22a3vyunluZgbFQ8r3RfEk0uMADMyw9ol52-pA>
    <xmx:UDE7YamFaNmf9uXKUyOyI8eFCeabYqYfT52kru9E7hukuh-VS6GNfg>
    <xmx:UTE7YRCwN_hsfXUEm5_f4Q1IlQiJ6FpfZY86I-8R_RiG6HK9DjZA4w>
Date: Fri, 10 Sep 2021 12:19:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] xen: harden netfront against malicious backends
Message-ID: <YTsxTKNlL1KgMhB3@mail-itl>
References: <20210824102809.26370-1-jgross@suse.com>
 <1f98d97c-1610-6a66-e269-29b2a9e41004@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a+WymmwsT1dAoNOc"
Content-Disposition: inline
In-Reply-To: <1f98d97c-1610-6a66-e269-29b2a9e41004@suse.com>


--a+WymmwsT1dAoNOc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Sep 2021 12:19:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] xen: harden netfront against malicious backends

On Tue, Aug 24, 2021 at 05:33:10PM +0200, Jan Beulich wrote:
> On 24.08.2021 12:28, Juergen Gross wrote:
> > It should be mentioned that a similar series has been posted some years
> > ago by Marek Marczykowski-G=C3=B3recki, but this series has not been ap=
plied
> > due to a Xen header not having been available in the Xen git repo at
> > that time. Additionally my series is fixing some more DoS cases.
>=20
> With this, wouldn't it have made sense to Cc Marek, in case he wants to
> check against his own version (which over time may have evolved and
> hence not match the earlier submission anymore)?

I have compared this, and the blkfront series against my patches and
they seem to cover exactly the same set of issues. Besides one comment I
made separately, I think nothing is missing. Thanks!

BTW, shouldn't those those patches land in stable branches too? In some
threat models, I'd qualify them as security fixes.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--a+WymmwsT1dAoNOc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmE7MU0ACgkQ24/THMrX
1yyPgwf/UhMrTFQDi4aAO939ZYoIqkqGRgzJvXk3uKeBm1e3Cja+W310tHHN9YcV
jArR36lzQkV9/DzUSIE/OTvtxJ4kw/5/iGOaDNTAZhpr7AVU0JTjOhJSD0FINqeh
V2/97cuouBTK69DRBoB7XPhGgeM6qhhkJIKns9alnvsXy3Xjdar7SHg4GjWBWIEV
aSPQwiac1JCoGQC4y0U2Ke1WT81ozbztAZCSoYORTzmwzRNwufuf0n1kgfdt1LK/
2s01e4WJebsYowlqTDYZNPKL0L0qyHj9XMeIHjuBZG2Xa86k/Q5RwEN3rAMtsH6O
L2eIsY98ExjJmqH29Og0/EqbOeoCSg==
=HpA0
-----END PGP SIGNATURE-----

--a+WymmwsT1dAoNOc--

