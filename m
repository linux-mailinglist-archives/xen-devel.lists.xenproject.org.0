Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5B686F375
	for <lists+xen-devel@lfdr.de>; Sun,  3 Mar 2024 04:02:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688004.1071843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rgc6K-0006MM-MP; Sun, 03 Mar 2024 03:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688004.1071843; Sun, 03 Mar 2024 03:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rgc6K-0006JZ-Fg; Sun, 03 Mar 2024 03:01:20 +0000
Received: by outflank-mailman (input) for mailman id 688004;
 Sun, 03 Mar 2024 03:01:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5dCw=KJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rgc6I-0006JB-D8
 for xen-devel@lists.xenproject.org; Sun, 03 Mar 2024 03:01:18 +0000
Received: from wfout5-smtp.messagingengine.com
 (wfout5-smtp.messagingengine.com [64.147.123.148])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 456c68c3-d90a-11ee-a1ee-f123f15fe8a2;
 Sun, 03 Mar 2024 04:01:04 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfout.west.internal (Postfix) with ESMTP id C4A2E1C000A2;
 Sat,  2 Mar 2024 22:01:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 02 Mar 2024 22:01:02 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 2 Mar 2024 22:01:00 -0500 (EST)
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
X-Inumbo-ID: 456c68c3-d90a-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1709434861; x=1709521261; bh=OX
	E5jTMpWnLk34Uici2HjXn8DLeyTAtcf0EXQsY1RfI=; b=jGwqQuMtRMN3lyMxi0
	K1tyueIxG3Bo2haODWgzA4/JkmwE+80xIug+uXsD6dU25CpXeJKG1t+ex0mp6P4h
	EaCfChZERlrYJ6Ps8GcUcBo/1E36/qhrptkBcoTZ2TxEY7CpLKFFbPf3OOIzGVHe
	KOaTX3g+eK/VU0YOywngb6CxSo8Nvy+QH1OXwKjHjjCO0yioDlg8C+YF4BBhp8LL
	1QM4/qUP/dH0RIIHr1b1Jw6//g2s81qASTCqmfae3HvUK9OOEEO5ohSbznVl2UKd
	jwYtlzDSVZPSK9evJmPKLUHtqNODk8OmE3F9rETW2X/RRSn5+cCzQYunuNGDjtnO
	6T1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1709434861; x=1709521261; bh=OXE5jTMpWnLk34Uici2HjXn8DLeyTAtcf0E
	XQsY1RfI=; b=rSdb6cTI/AAben2xGuz4LjYWQXgxz0VPWGbYkyQcKh5FSrPtva1
	dE1e+tR3d3gKVhNKbjeO3Cqqxww6rIg889F7JLs9zt5TF3u3H7zxkqWYa4+hC5iy
	lPGZRX7vcfUA0Z7qPRzd5Jho+K+09F18L7c7hsnW1FEl4fO4EQuSC4KeryNMcJmq
	07eBykMOABuyhjqSMDNodyKofKUfmUu93H9cqNeIW+znSkdGvmxw2xkKwSseN4pJ
	ovrKHNLLwvbktlJCbix0lFSNkAksNpWiuREhCrhbGe9Xq3SwaXhQav5w9mCqXxxg
	jT8rQVQNlg/q/RJZ/kXaMbz9rCr2LOBO3HA==
X-ME-Sender: <xms:7efjZfbl3j-htmP1UgV_Ht0FaSQ7r0RN07OIp_TDaCGU6A13jiXQWQ>
    <xme:7efjZeYJQQ_C9nB8-hHOdz3bZ-3xDXWTbTx56VkLTfmdug-P0aKbZ5UVoOamNG-YA
    c7vwGSFwabmtQ>
X-ME-Received: <xmr:7efjZR8z_ngCqTdoKn5CgWBQgJVGF5UjWAom4KxoOSw8oU1Inxw-vEY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrheeggdehfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfggtggusehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeiffevkeeg
    gffguddviedufeduiedukeekffevieehvdevgfeivedvgefftddvueenucffohhmrghinh
    eplhhinhhugihfohhunhgurghtihhonhdrohhrghenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvg
    hthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:7efjZVoKoS0Fev9_Q9547afPlhTkbXfziU8Jz7TCNRlE_eu8apTkmA>
    <xmx:7efjZaoIGvB8f8jmyiLfWMhS14_yyMN192K2xqeCSMHMOMJfLzLS4Q>
    <xmx:7efjZbQIfYgxz4iB3XAlprl8I2hYv2T-_iJTTNYn4TeIe9tsdhuAsQ>
    <xmx:7efjZfBGiWdxhAa51V8OQJ1WZ6XsxKUmJLcOwEqpg8NrWj_e5UIFOYy8RZA>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 3 Mar 2024 04:00:54 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Kelly Choi <kelly.choi@cloud.com>
Subject: Link to the 2023 xen summit schedule is broken
Message-ID: <ZePn5zQkcwvpoTBU@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ukwSF5SVVZjSBj8X"
Content-Disposition: inline


--ukwSF5SVVZjSBj8X
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 3 Mar 2024 04:00:54 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Kelly Choi <kelly.choi@cloud.com>
Subject: Link to the 2023 xen summit schedule is broken

Hi,

The link to the last year schedule at
https://events.linuxfoundation.org/archive/2023/xen-project-summit/ is
broken, it opens a page for upcoming "ONE summit" event that doesn't
look to be related to Xen Summit.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ukwSF5SVVZjSBj8X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmXj5+cACgkQ24/THMrX
1yw7uQf+O9iRAB2QO9QRgxZo+m+2f9bqpAJSfaEjN/kcCZ2+8pw+hVsnOvCySuVG
DtVqBloY7KN8ahz9bH1+IfguS8jYJFtPgen7qeIm7hOWu5yTQwDN0+5P3Amwy2Zi
WRQlAKZ5vq/ZSrdHAB4P/0g/m0SnMrUVcHPPKh3QCekmyMkBwXBgLDVONYrFncPB
+dbcnBEo7mmM1uyMIYsd2FRntHgym1L/ueCOlSsULzaFlmJHr/PMdqfJ98OvgGws
Q4v2iaO52TzFrwM6cvc4+wCWcea8MsfWwTF4UxN0C2kqeaMdcUC52HWn+ZI6tX0a
Xld0ztDBW0qkOxpsgTIfEY+dM/zpqw==
=HxFV
-----END PGP SIGNATURE-----

--ukwSF5SVVZjSBj8X--

