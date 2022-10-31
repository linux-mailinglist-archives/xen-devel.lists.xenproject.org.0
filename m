Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A781613EF4
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 21:27:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433202.686090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opbNU-0006Tn-Vd; Mon, 31 Oct 2022 20:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433202.686090; Mon, 31 Oct 2022 20:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opbNU-0006R2-ST; Mon, 31 Oct 2022 20:27:24 +0000
Received: by outflank-mailman (input) for mailman id 433202;
 Mon, 31 Oct 2022 20:27:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=grsl=3A=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1opbNU-0006Qw-1M
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 20:27:24 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a314de3-595a-11ed-8fd0-01056ac49cbb;
 Mon, 31 Oct 2022 21:27:21 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1281E320092F;
 Mon, 31 Oct 2022 16:27:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 31 Oct 2022 16:27:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Oct 2022 16:27:15 -0400 (EDT)
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
X-Inumbo-ID: 6a314de3-595a-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1667248036; x=
	1667334436; bh=CcVMZSWC/nZz2RRW6ULZLxYdjPK/WNorJkNgpb/0MSg=; b=C
	Gqe8P3s1OnS3MpKKEyK/EcOoEb/6y0mt9jXOHEvcFXF/+dU/J26LNa/oFluM3iWf
	OZ3xnON9X9EIHoYm16gz0duEftEJykSuz40PxmmUteo2VOVYZWuE50P26r1oNY8t
	eSsqoAZ/7gGM2AZfgS42rncxqJrX+zO9qc9a5BfkLvNb7Hc1vwbGTK7byOIq8tfA
	V+LxuVjPKYKB4K9jruH/SZECvzU5mxIsXKhcKffpbdUyweGf5DQmFL94FD84sAEh
	EFFMA8JPShUSXhrhSp3y62VHYIPvt8K72ubkn2vGJPROjFbaZ0K/JlIr/72G1sdF
	2JXMZCVzVEQPz8St0YkdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1667248036; x=1667334436; bh=CcVMZSWC/nZz2RRW6ULZLxYdjPK/
	WNorJkNgpb/0MSg=; b=q/yhZmbJNTvMkqsnpNCo1kfNcj3AQY91oM4/gF0MOV8T
	DbCqI74sn8KTitSOp4Rvl9l0Z/tlL3pZ8QbcFtodCjvhjk193XxqTNc7fdpN4wN9
	v3XMgJehVOE19na7ZX3h4tR/M+xtgOsdGdWODvHBHlSZD0T9IHV3jKRmQs2hQp8j
	X1QT//lpptQZN90uZiOhuWykdeqbO/ZWHpQV3SUp/b1Uam82qhrix4QFv/MwGqPY
	JJbr+ZZE6P/DWrjliGpY+KuY6atsXegNz+FC/ALh9HylVGV0jzDVZOe51yBXk1cO
	uaWhP3WwLI/4boZJWRkp8Vurm8Gw+V36jVXEi2zEKA==
X-ME-Sender: <xms:pC9gYxYMyP657TPxStEIB_6Pyp9G7g_ZryXmd2TxajONM2ilbJje4Q>
    <xme:pC9gY4YFR7buTuoN__xZFExWmASV8TVf7-2aEfk2UW8r__7QpkLlgQWAyP3TvyLNj
    LliYWDAXm9agN8>
X-ME-Received: <xmr:pC9gYz8WHK7PfPtYAa85brbj_PmP5Q8p9OUwDYDoEk7GXGLNpfakjT8ukzAP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudefgddufeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdejteegkefhteduhffgteffgeff
    gfduvdfghfffieefieekkedtheegteehffelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:pC9gY_p-6cbaduINnB_fOB3-wDQUWl7NFeKj5y910g5qQQj7YX4TWg>
    <xmx:pC9gY8pwO5BdjWE47SqpX7XU0i4xFMXvsp3CFJaDlUEdXr84iuRdKA>
    <xmx:pC9gY1Qew3dyGMkrdsupcRBtpS2beaqnp0fqCaDu69VefAiRHsfdgw>
    <xmx:pC9gY0L9NIn90O9S19LWluB33xAuDV7hh4r9e8lVOFwYnaBsPuav7g>
Feedback-ID: iac594737:Fastmail
Date: Mon, 31 Oct 2022 16:27:13 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Sasha Levin <sashal@kernel.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"M. Vefa Bicakci" <m.v.b@runbox.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 3/3] xen/gntdev: Accommodate VMA splitting
Message-ID: <Y2AvojXJ5IAGJyL8@itl-email>
References: <20221030071243.1580-1-demi@invisiblethingslab.com>
 <20221030071243.1580-4-demi@invisiblethingslab.com>
 <Y194M/6GboCwWiZX@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/fr8i7DH4beEBrSo"
Content-Disposition: inline
In-Reply-To: <Y194M/6GboCwWiZX@kroah.com>


--/fr8i7DH4beEBrSo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Oct 2022 16:27:13 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Sasha Levin <sashal@kernel.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"M. Vefa Bicakci" <m.v.b@runbox.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 3/3] xen/gntdev: Accommodate VMA splitting

On Mon, Oct 31, 2022 at 08:24:35AM +0100, Greg Kroah-Hartman wrote:
> On Sun, Oct 30, 2022 at 03:12:43AM -0400, Demi Marie Obenour wrote:
> > From: "M. Vefa Bicakci" <m.v.b@runbox.com>
> >=20
> > Prior to this commit, the gntdev driver code did not handle the
> > following scenario correctly with paravirtualized (PV) Xen domains:
>=20
> This is already in 5.10.152, do we need to add it again?

Not as far as I can tell.  I was looking at the linux-5.10.y branch and
didn=E2=80=99t think to check the patch queue.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--/fr8i7DH4beEBrSo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmNgL6IACgkQsoi1X/+c
IsEagA//Z0ru2SlxozIFeWNgC4gI9vchMR6d6fW/3iSKqQGB3wASQpAkDs/af/3b
0kUm20Gurees1D+b9yxy0FuRoCSZoL7Ukwypu2TFkMdYwrl1+xQnNINyWxXTx5dq
Mf1wuz5KdzGlzYsaktqzxdgkQGaelTWEJLrBoyNgLbbhKkAF6TDuv3h2SezybRPv
+H+mJi+6MVliKiRV55KbRh62FN2ZsU0jMzHRlCpm+XGtbXROYpF/ldyF3srXmVjp
4qvr77r1UpOYGJlRfdIhdAihhq3/yA4h2DLvE7tWjE0ySwev+tUkbF8y5p4QbPho
ZUrZUoRI/XX1/Bnqbgx37d0kIp1QctWkIokutQhoSIfsLZm2AX6kFVtv/9lKNzsl
cdX5U3aiUvPrjf3W8OIil/cVf4l/mjPBJH6kmkc1pZPr53ssxNAw9goeWqmGAKce
IYtx3eKzwPZV20euUCX+LR/+Ii+zWuMifI+iF3eWPc0qJhBp/N/9DrDXDP4dl3VC
g/+MYviZFbYsVn3xeW3x23JfxYUool3ztkvjM71pcQgUdQytpJj/R9PoDEpcC8Ax
4S4Arg99ghR2XrAjhsTAXgtbNXyXplZDwALfiFoEGnqZxxmuEaBVycyY775ak3vA
qLIJqdVSUtQhlhT2AjmCFCq38nvmzkQDQAQTMNkFbxNtF0BaLKI=
=4xEt
-----END PGP SIGNATURE-----

--/fr8i7DH4beEBrSo--

