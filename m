Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC0D897570
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 18:43:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700604.1094007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs3ge-0005yk-Oz; Wed, 03 Apr 2024 16:42:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700604.1094007; Wed, 03 Apr 2024 16:42:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs3ge-0005ww-Lr; Wed, 03 Apr 2024 16:42:08 +0000
Received: by outflank-mailman (input) for mailman id 700604;
 Wed, 03 Apr 2024 16:42:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AQ6p=LI=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rs3gc-0005wo-R3
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 16:42:07 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17ef4e26-f1d9-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 18:42:02 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 5E87B3200A43;
 Wed,  3 Apr 2024 12:41:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 03 Apr 2024 12:41:59 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Apr 2024 12:41:57 -0400 (EDT)
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
X-Inumbo-ID: 17ef4e26-f1d9-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1712162518;
	 x=1712248918; bh=+3zJn3eMC4VAWipQ716D05U/BvLeRZk9xNb1608O5mA=; b=
	YRLJd1Z6+QRCKgPygOOO8WllZUsisGVuzEXNXChIOEnoebA33c3nkongvJ1wSmhw
	SKNKsMfPD9oSg/dNGJU2rFggiLerqLNr1zjNsCIljKQbkFfh+tupqYrrCPYrquLK
	qdct3vmPOAQqNJXuvVOynDiF3+pXI4AKi3em34+Kk8kpCxhdfuh3mC9ItzGDi3OQ
	oBC1ViVeOYvBKlB6wbNCJ71ko/y67k2dlDRnFAdPqUD/rZZ8cUk5DY+j+YK15/lA
	MtLGOZFH7Ia9a7q3kHJpmCG6zyg0CuhJxogAHDq8KV+ZgtJXt5U0y+nghZhsD22p
	bykR6843b06kMnqgftaMOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712162518; x=1712248918; bh=+3zJn3eMC4VAWipQ716D05U/BvLe
	RZk9xNb1608O5mA=; b=PYZImeBdRVlsti7DOIIuOVslgGSgTqRQeAvG0S3AT+BW
	AzSh3giLGfHhwVYhwWzHFV0fEWqBMKOcFih8pUn634sidM6U2HTiJ6auIN32htuD
	bBZ0oihkL4bO5gMKzY8e3PRXMGSgotukZzTTgj0ucfvl7lLHxUbvOtjBKnZi0sYb
	cHWHZM/n870r/2yiccEbhSCALLjy/M++jiETESeBk+aHCtSk7bP7raZFHkApTz/o
	jwqo+Z+e5E90vPqfMte3ELAYkeGkw4wkM9XNW3RGe4izS24wLUeag0z8GtgLbVST
	0fedp6r5nuXbOyYiY3Vd8N2Q90XRo1+q/SxTdsaBxg==
X-ME-Sender: <xms:1oYNZpI-B-VHGgXCAuDeXQEPv2fPwvayJZds-CL_NvqTRyfseVasow>
    <xme:1oYNZlLs2pgtphIbrCnHnYG4HjgKD7NwrDpS4a1L5EFqmc1KODHcP-i6tf3m4A2SB
    USnIT7lzZATnA>
X-ME-Received: <xmr:1oYNZhujgLRK2H2tVjMXDiwjLD_bCLSbReg90YeG1U4vkWpK8g9W8qrlbK9qqmExoGwxM5fwCsgK0aRJ1nXUyzBVGbdGRTaVLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudefiedgiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:1oYNZqYgF3lwxQYkI5MejF2kXhs5uOqcWJ1wAOKkd07noeMUDeNloQ>
    <xmx:1oYNZgbPeZ9_Oh74M0EFEb-w3C9d_SnzCev7P8GAeUAxVgUIn-qvvw>
    <xmx:1oYNZuAlS-XsQOwpoLycnQueX7IGUHDQhZ8qDeuFNotwH7N1yBpsLA>
    <xmx:1oYNZubxI8KsEEFcmZQn2W2qbSFK-XLPTMP1W7YKFkDeXs8Zs8jBlg>
    <xmx:1oYNZvl28ZhfYN9EFmXnSezIDVsyhikGYzFolilKExtJnmQxOXnJa8Iw_HHd>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 3 Apr 2024 18:41:54 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: text-tsx fails on Intel core 8th gen system
Message-ID: <Zg2G06KZzvHuOYVz@mail-itl>
References: <Zg1stUacaDBkyDOn@mail-itl>
 <8c7ffed8-4faa-4dd3-8a41-d436ba49898b@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6dGt0UyQrtl4zarS"
Content-Disposition: inline
In-Reply-To: <8c7ffed8-4faa-4dd3-8a41-d436ba49898b@suse.com>


--6dGt0UyQrtl4zarS
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 3 Apr 2024 18:41:54 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: text-tsx fails on Intel core 8th gen system

On Wed, Apr 03, 2024 at 05:04:20PM +0200, Jan Beulich wrote:
> On 03.04.2024 16:50, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >=20
> > I've noticed that tools/tests/tsx/test-tsx fails on a system with Intel
> > Core i7-8750H. Specific error I get:
> >=20
> >     [user@dom0 tsx]$ ./test-tsx=20
> >     TSX tests
> >       Got 16 CPUs
> >     Testing MSR_TSX_FORCE_ABORT consistency
> >       CPU0 val 0
> >     Testing MSR_TSX_CTRL consistency
> >     Testing MSR_MCU_OPT_CTRL consistency
> >       CPU0 val 0
> >     Testing RTM behaviour
> >       Got #UD
> >       Host reports RTM, but appears unavailable
>=20
> Isn't this ...
>=20
> >     Testing PV default/max policies
> >       Max: RTM 1, HLE 1, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTR=
L 0
> >       Def: RTM 0, HLE 0, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTR=
L 0
> >       HLE/RTM offered to guests despite not being available
> >     Testing HVM default/max policies
> >       Max: RTM 1, HLE 1, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTR=
L 0
> >       Def: RTM 0, HLE 0, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTR=
L 0
> >       HLE/RTM offered to guests despite not being available
> >     Testing PV guest
> >       Created d8
> >       Cur: RTM 0, HLE 0, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTR=
L 0
> >       Cur: RTM 1, HLE 1, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTR=
L 0
> >     Testing HVM guest
> >       Created d9
> >       Cur: RTM 0, HLE 0, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTR=
L 0
> >       Cur: RTM 1, HLE 1, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTR=
L 0
> >     [user@dom0 tsx]$ echo $?
> >     1
>=20
> ... the reason for this?

I think so, but the question is why it behaves this way. Could be an
issue with MSR/CPUID values presented by Xen, or values Xen gets from
the CPU.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--6dGt0UyQrtl4zarS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmYNhtMACgkQ24/THMrX
1yyRngf5AZFyarz1TE1Kme/SFocIGFPg0lfe3jyaLhx83MFLJL2HiA4/pli0aeLz
RcH8bxDsf9PRruO0aHEstxoOkSfm8nHChIs6hJmqzykrp+zeqIZcqBZNOW96fAv6
pnWMFylK9K5u2aJInkc9uOgomtBLQc/Mw5bPh7o1D9HCUb8SPeQm/D3fVRE6CWbr
uey6ob6es0br/3J9Ju0bvyjTrdn0NQ2231pQBmBmyeBbYOa7F/0ja1tc50Jlm7SK
owE29XjTvRHatTipsN6txPVDGCLg4NbjJA9BDhapWrqLIDyhV4m9mTQwi2knLz0Z
ciEIn3yBXJBgKvN+cDg2jORmWY5BtA==
=lS6Y
-----END PGP SIGNATURE-----

--6dGt0UyQrtl4zarS--

