Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE784E78C1
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 17:15:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294833.501522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXma5-0003GW-3j; Fri, 25 Mar 2022 16:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294833.501522; Fri, 25 Mar 2022 16:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXma5-0003Ej-0n; Fri, 25 Mar 2022 16:14:29 +0000
Received: by outflank-mailman (input) for mailman id 294833;
 Fri, 25 Mar 2022 16:14:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R2Zm=UE=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1nXma3-0003Ed-9Y
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 16:14:27 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2137751-ac56-11ec-8fbc-03012f2f19d4;
 Fri, 25 Mar 2022 17:14:25 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id DB3C23201F5A;
 Fri, 25 Mar 2022 12:14:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 25 Mar 2022 12:14:22 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Mar 2022 12:14:20 -0400 (EDT)
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
X-Inumbo-ID: a2137751-ac56-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=BHp9UZ9HymaucJIU9olMzjynOrY79A/tGrgS3oi76
	WQ=; b=JpckFzwtR87Db8WyUXHfunjrgYjal+s2v11n3awCsoxRXVOgqGqPN/jEU
	WEbFyb+anxwF+X9/s4Eoc1Lr55HPDpD0HR/Tvpa4nQAV67qYS0Z00f+iqQh6rFUR
	TqxVf3jzmpKeBj6xuasH12LLFXxUA6VLTaSxRL4LyEbbpOkBUPY2ZfmlJeySmIU9
	EwTAgos2NVb8sT0bpoR+60+bVa7X/zw9BMadx/FVDPgWgFM1Wn9H+mDWkH/qGWhf
	AXlr0RICKpsqmUVuP4EZRMMt6PyMRR5xo3IBYlexqFKmWcWZVhSz9hUddyngpPKe
	UET8ONLBW/pds3ca8yz9RDP6DlOBg==
X-ME-Sender: <xms:Xeo9YqT0Jghgws0J16Q7p0Ktb-UV2neqdhI_XoJPmcVPxnRNAlS-bQ>
    <xme:Xeo9Yvydh3-UpXqu9xzQF3c57lwUaSK6iyXmOhB_3ZRZ22qJlvpwykAGfU-WBE8XY
    hkKpBcHv21dxoY>
X-ME-Received: <xmr:Xeo9Yn0EX0joZ9RDA_h5ePnB_MUVmR88DLcRfgg3tJOAusH6qwrNoIkGjC4S>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehuddgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfggtggusehgtderredttdejnecuhfhrohhmpeffvghmihcuofgr
    rhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmqeenucggtffrrghtthgvrhhnpeeljedtgeejffelveefueelheejgfdvfefh
    hefgjeegleetgedtteejleeuueevfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrggs
    rdgtohhm
X-ME-Proxy: <xmx:Xeo9YmCjnPzVVKPWC5C-K2uyVC49rCEqX5r8FEhtOQch40Xneqqv9A>
    <xmx:Xeo9YjiUPWJxwxNQN3io6KwL-uxUAJ536UxcmoEFeeXEO-MUGEzwFA>
    <xmx:Xeo9YioI6duGlH7ccxJxdQxpcBdcDaZqWKagDLK6Wck67uXKVfhCdA>
    <xmx:Xeo9Yra64DGLWJP_V4RBBctdoyemt7SK2ntYJOMNnta95qSpo36Kqg>
Date: Fri, 25 Mar 2022 12:13:59 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
	OpenBSD technical mailing list <tech@openbsd.org>
Subject: Security support status of xnf(4) and xbf(4)
Message-ID: <Yj3qW/y20htoSvuK@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NOM57H05SdAMKHFr"
Content-Disposition: inline


--NOM57H05SdAMKHFr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Mar 2022 12:13:59 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
	OpenBSD technical mailing list <tech@openbsd.org>
Subject: Security support status of xnf(4) and xbf(4)

Linux=E2=80=99s netfront and blkfront drivers recently had a security
vulnerability (XSA-396) that allowed a malicious backend to potentially
compromise them.  In follow-up audits, I found that OpenBSD=E2=80=99s xnf(4)
currently trusts the backend domain.  I reported this privately to Theo
de Raadt, who indicated that OpenBSD does not consider this to be a
security concern.

This is obviously a valid position for the OpenBSD project to take, but
it is surprising to some (such as myself) from the broader Xen
ecosystem.  Standard practice in the Xen world is that bugs in frontends
that allow a malicious backend to cause mischief *are* considered
security bugs unless there is explicit documentation to the contrary.
As such, I believe this deserves to be noted in xnf(4) and xbf(4)=E2=80=99s=
 man
pages.  If the OpenBSD project agrees, I am willing to write a patch,
but I have no experience with mandoc so it might take a few tries.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--NOM57H05SdAMKHFr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmI96lsACgkQsoi1X/+c
IsHUrw/8DuTigOFffY4B1kecHpsA1cQJQquId57YFiA/3Z1Wa/D9yFcGKxFMT8J+
A9LglV8+ptwnbdCrfUjnxIjs1N/yzXf1AMggQsali1Hm+U3mTMbdozovzKVDYUwU
pj23Rvrxym9zlMr0LvBpCRcP+SMGKnPCQn02zVUENPIakdtz4yKK/eTjbJSqma/C
zGRQuAlUc0bD4khcEMgP6wa5cMzhsCmKZArEA1aHBJn4WZ+ingOOuDgT+c/7OgjP
C6BAOqqLH7qeAo3jolNNDsPFMM86YWky0dsGZHeZtjLr0AgHHqVpgT9ktpy9Kbr2
CVQBi02zw325YbZxKxiGxi1ANXm58iqhxfXga7V1mWBsMTfIPBk1mezp1vpxqaA1
DoKTpd3DOdS+DI49nsivqXZEb5pBYhRALW5IgzjjwtHG9Pgqqto3pPxCjtXfuzgK
WL7V5Ay0j5vSWJfOvv2oYg7tpxFKtYvzy2puWg68DF2yJCOTB9pcodvUg+eEGmEm
dvaevmIht8mhTPHf4saUdcA/rcJ2InEZrhMH1exC8HOTZDVHzYBBV0i5v2kgPg0S
z/hmBZmdJICL0F2ItXeb/ko62G9PeHkMOaBmvp9NtgQPPnlrhMUTELiLCeE0Kf3h
urJf7mSLztHtpQxxoMaZ/esPproDyssSI1ZYDlhXWDJgvm1IZn4=
=1VC0
-----END PGP SIGNATURE-----

--NOM57H05SdAMKHFr--

