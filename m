Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10155752E86
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 03:25:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563477.880665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qK7YY-0004eb-RH; Fri, 14 Jul 2023 01:25:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563477.880665; Fri, 14 Jul 2023 01:25:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qK7YY-0004cV-Of; Fri, 14 Jul 2023 01:25:14 +0000
Received: by outflank-mailman (input) for mailman id 563477;
 Fri, 14 Jul 2023 01:25:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qN+J=DA=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qK7YX-0004c5-TO
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 01:25:14 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 449879bb-21e5-11ee-8611-37d641c3527e;
 Fri, 14 Jul 2023 03:25:09 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 30EDD3200990;
 Thu, 13 Jul 2023 21:25:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 13 Jul 2023 21:25:06 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Jul 2023 21:25:04 -0400 (EDT)
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
X-Inumbo-ID: 449879bb-21e5-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1689297905; x=1689384305; bh=K+hmV+BandF09R6ayynDHWnmwYWMzK4iZEH
	5qN9GllM=; b=jZ8RuRyK/Defac+RAJ8Ud4EV0nbwHfwuj2yAecB3QWhu9ZKldrf
	DUG/b5+HtIm/LuMhjh4aDV3ekUOsc2dLn4rJG2fsxdffEFQ1lcl8ygiMS8QOmPYG
	PATnE8piIPPw1ufUkAyiRag4X+r2D/8lTEvuf2UzpFWKT4dx+95Df+EsmopNOCSS
	/VcoEMOFMEd1QcBe9ROBYH/nZMlvfYvxTQJuq0rVRUwPRDOXYb+k9BuEYgRBkInY
	J5LeDVJ7JDWKMd6IbVCncLengEuE2SKT+xpH4AV5ERg9+Ff/jUptS/z5FaGN7SOM
	2i8K/ApeSfzOHBzVYQe3zkpd//3pBE74FSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1689297905; x=1689384305; bh=K+hmV+BandF09
	R6ayynDHWnmwYWMzK4iZEH5qN9GllM=; b=geLcAqwPh4xQe/LXlTLXM/CTyOnps
	FhcDDuayeY+041QAFxmbUJtajGXT0TWHO+DZ0mnCWIiOCsf39m19Mfc+KxrPPWtQ
	48Chgp1DhErIERUt7Ku4UZ171BlXgOsNP0iNzgXZJYMLPjDVGzopceI1hNrcHbh8
	AFRyH7xpu8j46IMitMA8ChWDaZHrFzQH285thM/xCcp+oX6hWOnHqSARGSfq74AN
	qP0tT471YkBRiV0vpTztaVY2rkHL+sOmxQoNK//WYCt/wGnEhWdcvNESdLeeUK8m
	cGsLje4r5snvJjRZf4JGZ7N10jDcrwrTzhN8bg+aYMTWysOYnXvQuuTIQ==
X-ME-Sender: <xms:8aOwZHOmdLfGJXNQE3rqm_bnva017CGxjgMjBUgcLEP_kf579MDLvA>
    <xme:8aOwZB9NMF6w3TVdHuc6KBc5i4IvJmXwrgeqLibu2f0iFQkv3RFEP8N1vavSO2_dW
    tcMgNXcyGbNDw>
X-ME-Received: <xmr:8aOwZGQIz3H0_2A_UtF_j2cvfDdd8u-86Y_RReajaadOAxTWdN62Trebj6fU-mkCGZhRTnOnfaOeb6EIkC_02Ma5Qt-rd4k8sks>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrfeehgdegjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:8aOwZLvWwy_YFKTsssaX1FI2828RR-Qj9d_rc5fzpieNd_kSnO0-xw>
    <xmx:8aOwZPcz9qN6ZL4ceR_wDXAEi63eOOhbQpG4IyH_ewQZK20v2KIdSw>
    <xmx:8aOwZH2mHp3GuWf0AzLyCz65VkBRSJ-qipfCuEy24DQ1ijGj34cYBQ>
    <xmx:8aOwZHHe-hPEOjZfX4pPIIk7WEW_qDmjwFA2LH__VxMlm4m7_KiWOA>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 14 Jul 2023 03:24:59 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] docs/xen-tscmode: remove mention of numeric tsc_mode=
 values
Message-ID: <ZLCj62XMBbspMWbY@mail-itl>
References: <a8223a339a0b8ff3c0d04fb4ee2913c7558cc131.1689294071.git.ehem+xen@m5p.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tb9bDuqycHXD16lz"
Content-Disposition: inline
In-Reply-To: <a8223a339a0b8ff3c0d04fb4ee2913c7558cc131.1689294071.git.ehem+xen@m5p.com>


--tb9bDuqycHXD16lz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Jul 2023 03:24:59 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] docs/xen-tscmode: remove mention of numeric tsc_mode=
 values

On Thu, Jul 13, 2023 at 05:16:40PM -0700, Elliott Mitchell wrote:
> The better to encourage moving to setting via string mode names.

The numeric values needs to remain documented, otherwise interpreting
pre-existing configs (that may use them) will be tricky.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--tb9bDuqycHXD16lz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmSwo+sACgkQ24/THMrX
1yz9dgf/TJ1yGe0gcpJACMAYSRZm3ChzujQtCd3NM7N5CJBMBdvi8UlMJ9nQ1JyH
sL6iWQC4ULxBagrlL5jk2vC3IrDamx6lZeOJ6i3+xFnPBp2dEzwdkSVnPcOhaWrf
Bb70HVjKFygVN3Y8+gaZmYvwbdDnFk2Hk/dAxBCO1Btf2Hky325D6rxPd26Jz+gb
vpyIYDVOvRuOUWup4n2wSNYsBttgduAbzGCcVn5K9V/9GkMIceLmeMX+ErNn3gBu
7/NfreQ7ULXhxe9U0RvQBLLYut2Ej05ZfTmmnS2o97aZ8vu5qOICeBEpeWWD9viP
ng1XMez6EunFJsiq9t++tEvVf+KaSg==
=/ptM
-----END PGP SIGNATURE-----

--tb9bDuqycHXD16lz--

