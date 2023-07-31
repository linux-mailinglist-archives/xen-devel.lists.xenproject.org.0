Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71952768A83
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 06:01:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572586.896400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQK4o-0006VX-Tk; Mon, 31 Jul 2023 04:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572586.896400; Mon, 31 Jul 2023 04:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQK4o-0006Th-M0; Mon, 31 Jul 2023 04:00:10 +0000
Received: by outflank-mailman (input) for mailman id 572586;
 Mon, 31 Jul 2023 04:00:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C1oe=DR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qQK4m-0006Tb-G6
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 04:00:08 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba8210af-2f56-11ee-b254-6b7b168915f2;
 Mon, 31 Jul 2023 06:00:05 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 74AD85C012B;
 Mon, 31 Jul 2023 00:00:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 31 Jul 2023 00:00:03 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Jul 2023 00:00:01 -0400 (EDT)
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
X-Inumbo-ID: ba8210af-2f56-11ee-b254-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1690776003; x=1690862403; bh=AZS5zvDBx1m6sc3l9ZNlaTXmu5ZmgDfI515
	g8g/0Vqw=; b=ErUBizsGXRYxeIoQKJEe+d5rq3FFAAqlX/iz+n68EQUFlEHt9RI
	GQDY8UDwFFIpRuBsmGF3rYURBckHrk78huSdVCgbQZIDUxogExRUSkSyWYqklv9Z
	g0+nqj7eMMKQpPF6F865/czlwYGrOKgBKqxsw7OyCAOt8Gu0wZgZPbZ0JQA0867C
	4SXlB4xMpJkkDEq1XilLHD4CRAhvVC0SsxCRKDg5P+7KOwdmhCHlFFKtESNG1xog
	4Tb8v5UdLuMQ97rF5KHtVkhm7BKEbmWYCWtDZ0Kl/Rxt1Yjd29HHPJFDo3UY6NX/
	WW8i0WeW4kcylFaK3isAIpUUJaONVZkEGkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1690776003; x=1690862403; bh=AZS5zvDBx1m6s
	c3l9ZNlaTXmu5ZmgDfI515g8g/0Vqw=; b=ZBzBbObK2xiOfUig/vQe4pnI+2z10
	G8eff4a/tPCPgibN2E8DQXGHiBiAz3LEQ9Obku+dw66GP0bveBx3tmZXT0+vxccO
	GvTcEbDoxHM6i+KWt1raLYLgV4PQTJ2SzYdVfMLaduSGuZWCJeAanYzwT3JOr09C
	6QDuBt5KrkeOc985SbpEPq9xi26ouxai+d0IzX9cJhfK91RgqkB5aCudhDDezcco
	kfGh7hKy12PWOnT8cuUEw+KYC/706wuloMOhLxhcz8Z3BSJ4PWj8bgk0VV8Wrw1B
	H0H5akFyyD/SEiYaBpX1W5chZ2A6sRlLxZ4nnv6Fe/Iy4O69osM30T1Ug==
X-ME-Sender: <xms:wjHHZKdFdnVjCes-Eau9CrMgYwL23G58gw9pBSSw-VH82y7vQMvaKw>
    <xme:wjHHZEPO2ZUE94sdWCn6sjlLvx-CTmJoLaHdZhBQThfUPO1yZES2di-4i-DoTJ2zz
    BfbGqEC2F1kxg>
X-ME-Received: <xmr:wjHHZLhcMbTK3nLzJaWl0i7QPXN7gx8FYAQ2jXebc9xt8gMrF8amqgNdvA2EwO0VY1002vdIeIkHPv49mJf4Sov7xefAbYJwnBM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrjedvgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeefgefg
    kedvfffhvdejgffggfeliedtteefieefieegtdegvdeileekueeujeeukeenucffohhmrg
    hinhepgigvnhhprhhojhgvtghtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhih
    hnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:wjHHZH821WCySF7_3EEkxkPdMYxvKB6NJtoWgJZGFg22qyLlhrQX9g>
    <xmx:wjHHZGsSFmUbRmkFMJlvFWhHV_j4oDxn0uFAcc3h0HlxRTNFTxe_EQ>
    <xmx:wjHHZOGVfCTVYdjQ0tvufth5cTj9cH7cEkBJgYxfoh1na3xrg32hkg>
    <xmx:wzHHZKJ2U2MMpgIQiTxGvXKGOu1tavADkQN-gzsDBusSNUu6H4Pf8A>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 31 Jul 2023 05:59:55 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, iwj@xenproject.org, wl@xen.org,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: Python in Domain Configurations
Message-ID: <ZMcxvdSbpQdWg5/r@mail-itl>
References: <ZKiN80e08QIojRSL@mattapan.m5p.com>
 <ZL7e6IcJWK38IHU7@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zFt09wcN0ytVQeDj"
Content-Disposition: inline
In-Reply-To: <ZL7e6IcJWK38IHU7@mattapan.m5p.com>


--zFt09wcN0ytVQeDj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Jul 2023 05:59:55 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, iwj@xenproject.org, wl@xen.org,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: Python in Domain Configurations

On Mon, Jul 24, 2023 at 01:28:24PM -0700, Elliott Mitchell wrote:
> On Fri, Jul 07, 2023 at 03:13:07PM -0700, Elliott Mitchell wrote:
> >=20
> > The only context I could find was 54fbaf446b and
> > https://wiki.xenproject.org/wiki/PythonInXlConfig which don't explain
> > the reasoning.
> >=20
> > Would the maintainers be amenable to revisiting the decision to remove
> > support for full Python in domain configuration files?
>=20
> Any chance of this getting a response?
>=20
> On examination it appears domain configuration files are a proper subset
> of Python.  The interface to the parser is a bit interesting, but it
> looks fairly simple to replace the parser with libpython.
>=20
> My goal is to create an init script for some automatically started
> domains.  Issue is there can be ordering concerns with domain start/stop,
> and this seems best handled by adding an extra setting to the
> configuration files.  If full Python syntax is available, I can use that
> for this extra data.

Hi,

I don't know full history here, but from my point of view, having a
full-fledged script as a config file is undesirable for several reasons:
 - it's easy to have unintended side effects of just loading a config
   file
 - loading config file can no longer be assumed to be "cheap"
 - dynamic config file means you can no long rely on file timestamp/hash
   to check if anything changed (I don't think it's an issue for the
   current xl/libxl, but could be for some higher level tools)
 - leads to issues with various sandboxes - for example SELinux policy
   allowing scripted config file would be excessively permissive

So, IMHO reducing config file from a full python (like it used to be in
xend times) into a static file with well defined syntax was an
improvement. Lets not go backward.

As for your original problem, IIUC you would like to add some data that
would _not_ be interpreted by libxl, right? For that you can use
comments with some specific marker for your script. This approach used
to work well for SysV init script, and in fact for a very similar use case
(ordering and dependencies, among other things).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--zFt09wcN0ytVQeDj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmTHMb0ACgkQ24/THMrX
1yx3Cwf+IeB+WcegglsE7fTFEj3iMmfDmNFwefWndPsgCXw3N9DXTAqSmICvByNl
no5U/H6ah+HD/FfypYThUICez3q9crKxp8Leil0XH/mle/AJ1CC02TViLA+xdp94
Z9oDXyFcakZ+NyJRBg5KkWQc02AmoSXZwq1l8Q/2phIWTMnxU+NMobrKFXetFovH
Wv9/rk2YGRU6tpYVkPBFeABuhYDulqPk+GjIr4sXBo3nzhRa7Lqj7q/nbjL51kfE
LKQ7sNQc/nLW3Ubq1RQbgT8iOYsdXJZhBxB287prmbPpyrKqlz8CxUNh8gvhwFmw
H/ORS8I7xMs0WzRHkvN/n/fNcKn5Mw==
=opZ5
-----END PGP SIGNATURE-----

--zFt09wcN0ytVQeDj--

