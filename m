Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4401F538736
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 20:23:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338733.563543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvk2e-0000KV-81; Mon, 30 May 2022 18:23:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338733.563543; Mon, 30 May 2022 18:23:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvk2e-0000IQ-4f; Mon, 30 May 2022 18:23:00 +0000
Received: by outflank-mailman (input) for mailman id 338733;
 Mon, 30 May 2022 18:22:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wtgc=WG=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1nvk2c-0000I7-VC
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 18:22:58 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 877c0f86-e045-11ec-bd2c-47488cf2e6aa;
 Mon, 30 May 2022 20:22:57 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C746D5C021A;
 Mon, 30 May 2022 14:22:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 30 May 2022 14:22:56 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 May 2022 14:22:55 -0400 (EDT)
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
X-Inumbo-ID: 877c0f86-e045-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1653934976; x=
	1654021376; bh=RcsuwO01lQJrmDh0EjNMgSodvLUsnLiIQcvQyO4BxqQ=; b=X
	069/dAtK4t9AEWRc7gnSs08lLzkfoQRDcHVwQUpv9gPetF3I4AfUguHtpibJneqI
	9okksSJjm+HL8xep12KjBZ68zd6rf9W4Jwybmx+8OVYhmAGNZSnqlJss5S6Y9/BX
	S7A0PlrgBlkaO1uBGM7/7Oxyj1b/ODGH2PG/WEoolrPHoKDO1lr1xJwMRQS83Y33
	0KLjN79FVPPQkCXo/0NS9GeoXPXPv7QlOXnfrmh0h2fetNLIU/UWZk++5OsO9Gva
	gSiXx6UKoQshIQOLcHC4DPOgo2ZaYfDl7rYVtN4WezI446Z6zZhgaDWTLXLpOCOv
	QHXwvdlUNLkHz24sqJ5oA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1653934976; x=1654021376; bh=RcsuwO01lQJrmDh0EjNMgSodvLUs
	nLiIQcvQyO4BxqQ=; b=gL0LE4KRz2K9qUDZdmclAbBwM6pnPeW0oa8K0XzlOab8
	5O2kxLqT8XeBlLNEqf/A7Stw2GrWAX5zkzKRntLNrDnzvSLf43QpV4nlgiMklHJO
	/zbvQkohzFOZVwbRQUCLePPzCoqC7QtMjNEE06u9kmmr1PPpBYzeFMu3rzpvTEBt
	FJCcAmz9iJT89lDzICd5bNui1J6gxMdwGTC+7b0s4k+VdUNyWbCeaCAmYLEJDkeN
	kBXaRYfJBg+jyOq3VNO4heb8p5GQPLan8AQe4kzg7tPXYAJNkafVcHdxHXnT1Kxy
	xHDVVPFJjEC8uy9HJRr3DDLXT9go226KW8Auvxrh3g==
X-ME-Sender: <xms:gAuVYuHjyZN2_aWZoA9cacsUPq1skKR-z0D7j0HbqrjUCSWRJyzWbg>
    <xme:gAuVYvVIFMkjeGsLsedYpWlGNn4vdu7gNoijjfdqOg1aFfw0GyttEEiSRhS4EZc5D
    kT52qv32oPgRXw>
X-ME-Received: <xmr:gAuVYoKGa4Z0L4LUmYHfQBiYmeUGgBb6qryb6qwCkLUIr8-iE3CJLJcxxBEe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrkeeigdduvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepudeileefueetvdelheeuteffjeeg
    jeegffekleevueelueekjeejudffteejkeetnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:gAuVYoF9XNcG7aqueU_dmD83XlMjSRqvdPP3y7nc-3S-oM1Ptb81gw>
    <xmx:gAuVYkUaU5jvc30m8_4zdviHwrs_r4jRcADRV0FQNxaxYa6gBky8rw>
    <xmx:gAuVYrPJfhOoyNboiq6EHrbc8tSv2baIFzVA45o2JXDh8589-0Xkdw>
    <xmx:gAuVYnH6JRjQBBVfts5qSACyakTsCKLdY0fsS2hesg8uQikFRo17dQ>
Feedback-ID: iac594737:Fastmail
Date: Mon, 30 May 2022 14:22:51 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Henry Wang <Henry.Wang@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/4] Grab the EFI System Resource Table and check it
Message-ID: <YpULfZ027aOCaKGd@itl-email>
References: <Yl7WHv6+M+eJwQep@itl-email>
 <Yl7X3mAJhR5ENSpl@itl-email>
 <0644ecd8-51cc-897a-5555-62d4c9ee9461@suse.com>
 <AS8PR08MB79912809AF4E9D258DB8951F92DD9@AS8PR08MB7991.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IH2qeyERgb6SrlYF"
Content-Disposition: inline
In-Reply-To: <AS8PR08MB79912809AF4E9D258DB8951F92DD9@AS8PR08MB7991.eurprd08.prod.outlook.com>


--IH2qeyERgb6SrlYF
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Date: Mon, 30 May 2022 14:22:51 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Henry Wang <Henry.Wang@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/4] Grab the EFI System Resource Table and check it

On Mon, May 30, 2022 at 08:47:39AM +0000, Henry Wang wrote:
> Hi,
> 
> It seems that this series is stale for more than one month with maintainers
> comments given for [1][2] and some discussions between maintainer and author
> for [3]. So this email is a gentle reminder for the author about this series (no hurries
> and pressure though, please take your time :) ). Thanks!

Thanks for the reminder.  This series has been superseded by a later
one.

-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--IH2qeyERgb6SrlYF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmKVC30ACgkQsoi1X/+c
IsEpwg//ScgI2a41bQ8CUhM+brn3ksykzrQg1Y2bg1ek/rK+5pHF70L+qBI8DtJo
V7xsisTZB80qZtrhSi+GEev7iGkzwZD+Ec+8rXfWr66kTbWPxIjxnD/XfhFCIPYa
k6DomxImfdNPaZIIJGSr6EUs/rRgnaub6CTPb7hy51BF3FH/HKkNZzx0HJg/LUWe
D8BlmwAPZgYMtFlGIj8we8+GDne+FzewlKYwLQxTlNa8U9Q1XwnMoeLDRRi+mdqq
eKY2gKCoUvVMW5jAYA+M1Pj0DQs+rrhQvGVG8cfT3WmsXC4puKOcFEUf/5NMAVgS
swqMX2BGDLn4x2lOKxPVNOs8Ucd9Nb35FtlW91bevF8yJF2iLtyhCLKGB4YebCB5
5nLC+VnfhnWWmEyf/VpVEIp0Ck/aK849/qPelBkJ42DOcD0KKzxs2szJYcJpWW9R
IvWDDmH7oWkh8zoOf+kwGr7mRznVb4r7vRIzhXNhzoS6qRRUsqU62Qy9rVCqG7jN
P5v2r3C/UU0G7fcEhugM32TwM1KBwg1HTM2S4g7ZjL3msd66dRnCLG9rU80vLjI9
MkMAT2EhHeyAJ1Pj+25TuIsJ+Q+GPb+5vgui1lvkRLRNK2H5jCR5Ggmv0Ry9YSpU
csnVP4S7b/MDk63uomDtg2NJhcmer9XWA1oITTl0fYGvASw6h5c=
=1NBu
-----END PGP SIGNATURE-----

--IH2qeyERgb6SrlYF--

