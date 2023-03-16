Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 588786BD7B4
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 19:02:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510776.789125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcrvK-0003Zb-HB; Thu, 16 Mar 2023 18:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510776.789125; Thu, 16 Mar 2023 18:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcrvK-0003Xt-EM; Thu, 16 Mar 2023 18:01:58 +0000
Received: by outflank-mailman (input) for mailman id 510776;
 Thu, 16 Mar 2023 18:01:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ItE1=7I=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pcrvJ-0003Xn-1e
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 18:01:57 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a24ce99d-c424-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 19:01:55 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 0F8953200943;
 Thu, 16 Mar 2023 14:01:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 16 Mar 2023 14:01:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Mar 2023 14:01:51 -0400 (EDT)
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
X-Inumbo-ID: a24ce99d-c424-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1678989712; x=1679076112; bh=wAEkL7fe93Qu9Z0g1WCeglq8ePVawCA6moH
	8H6ashwA=; b=FT1rtiEiKgLXINiAsV/QTPDmDKJ6uDWiiz6wV64QQNy8+MsX7Vu
	P1Hu8DnFaWvJIv5PKehzHVhi9XS1HefHa7eg1PFjwvwrxoENWHtyO5FHq/2G4BYm
	UWU+/X0SuO/OjVis2JoyaOU1Zh3uj1Xl295rrdBferAPSyxeafBQxPPovcoGnkuB
	e3WsCKn1hTaKNvArrhLw+Ex3mgOT0pIJYPy5WlzAMIA87yknTUBgzBS3FNrDgh1h
	p00ptKwN2P0YZbAzRM39ZHoqLKJfn0rLu2AU8UJ97esBTy2X4W4rxuoN+ObZsSve
	5OSKqlU0e7fEq9hKSpenYSAe+fzkU9mWT3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1678989712; x=1679076112; bh=wAEkL7fe93Qu9
	Z0g1WCeglq8ePVawCA6moH8H6ashwA=; b=eYhXc7ixusG7k/MCFQ2LwWbfjos1l
	ElRrqTOiw01HpkvlImdk/ENTPon8+IASWVczIt9sjFTrrqE0ffSYoT8ke351yCxX
	/zfJkEN5MRvzbAr/7O8dSSrvBQo8isdkYoeGche8dOSqeME4pfcYk4FQi3DKdk40
	l3wMxUGrIc4cvYzC+3zsMGOZuFniB600hXLXHGLTyfk+5DW+h9DInlajCfP60Gd4
	ntmG1Uq92MhuMymn+50Ikfw2H/evFEda4ufoB02CHMRaaZFM+TmpcY1q/6cF3Fej
	xTKUP4VMxy5ek4C3vrNOx6swcmuHTU6t+GUCBjPnqFgjHUT3wknyWX4zA==
X-ME-Sender: <xms:kFkTZMLakP4nj3jRQ2oqutYSw2I6HZm17OxE0Lp9TTRHAwNp6IFHiw>
    <xme:kFkTZMKMBbftY4wXx3oM0VKXYj1IvKtXKYTEns8uNBpgov1w9fA1QYYzE3_Lgij3V
    xARqSWMysaKXQ>
X-ME-Received: <xmr:kFkTZMuSC-CmdWaW13AmPqkyyS4lHySeIAokegwHp6kzC7qUeB1Unh2Wodk2NkmvT5EMbYBNTVfTZOaj9E20M6Syiwv3yAA-iDU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeftddguddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    udelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlh
    hushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:kFkTZJZO12x35qzhACPYrl4GTDRxsNl9H0WSMx8jiulvb6KY_mqxqA>
    <xmx:kFkTZDb-0ooeL_Cym4tyy58DO0HOaZGFhnpIYVpFQk_21FI8_AKnGw>
    <xmx:kFkTZFBd6VpOTBbyZzV1LFwsGOdVLQFk3xXCfu-47fNPaIhFaBjbYQ>
    <xmx:kFkTZClcr_WTeZkajslJaeXSnvTMrgP_8l_jFwdgpNIE6-lK8rrXqw>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 16 Mar 2023 19:01:48 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Bernhard Kaindl <bernhard.kaindl@citrix.com>
Subject: Re: [PATCH 2/7] tools/misc: Drop xencons
Message-ID: <ZBNZjfzyu7I8rzIR@mail-itl>
References: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
 <20230314141520.3652451-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CemQ4UNq1tsUExKQ"
Content-Disposition: inline
In-Reply-To: <20230314141520.3652451-3-andrew.cooper3@citrix.com>


--CemQ4UNq1tsUExKQ
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Mar 2023 19:01:48 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Bernhard Kaindl <bernhard.kaindl@citrix.com>
Subject: Re: [PATCH 2/7] tools/misc: Drop xencons

On Tue, Mar 14, 2023 at 02:15:15PM +0000, Andrew Cooper wrote:
> This is a python script which has it's shebang modified by be python3, but
> was never converted to be python3 compatible.
>=20
> The most recent reference I can find to this script (which isn't incident=
al
> adjustments in the makefile) is from the Xen book, fileish 561e30b80402 w=
hich
> says
>=20
>   %% <snip>  Alternatively, if the
>   %% Xen machine is connected to a serial-port server then we supply a
>   %% dumb TCP terminal client, {\tt xencons}.
>=20
> So this a not-invented-here version of telnet.  Delete it.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Not sure if necessary, but in any case:

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--CemQ4UNq1tsUExKQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQTWYwACgkQ24/THMrX
1yyFhAf/deD0ovKcRp6htBSy4xddQO2Pk3O5fYR3L+VMO1jKFIenYmcEkntoQCsR
GU1gESNno/yQHYYqFz1XSlqzOOh9ENfx69aSI580t6ODzTjIlGgktWD5bCk2noFX
4MQQM13txJ/k4eIYJJYJnGYkmGXKLn5R4bxHD/CHzoPEUrsHFVTVx652bnM9o78x
22ZOjMmtJ1eW3XSVE9A6CwjJhgZUpRu9hQ0OHKTe9Dfjo/oPv9E0AS8Wv1ciEwN8
GYtJgPWwUBFnO5P5kj+T1aEcbljHE1FcO+zsW407qDwHjRQfK48nmnyBK6GLyf8a
e/WJa5eo8zWIvoupI3lwvCiz5aisLA==
=cmz8
-----END PGP SIGNATURE-----

--CemQ4UNq1tsUExKQ--

