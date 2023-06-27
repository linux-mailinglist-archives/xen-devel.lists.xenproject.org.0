Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1F473FC00
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 14:29:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556147.868429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE7p8-00043E-Ky; Tue, 27 Jun 2023 12:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556147.868429; Tue, 27 Jun 2023 12:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE7p8-00040Y-IL; Tue, 27 Jun 2023 12:29:34 +0000
Received: by outflank-mailman (input) for mailman id 556147;
 Tue, 27 Jun 2023 12:29:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ih4C=CP=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qE7p6-00040A-Qt
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 12:29:33 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42a1fb4b-14e6-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 14:29:30 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1AE23320085B;
 Tue, 27 Jun 2023 08:29:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 27 Jun 2023 08:29:27 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Jun 2023 08:29:25 -0400 (EDT)
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
X-Inumbo-ID: 42a1fb4b-14e6-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1687868966; x=1687955366; bh=b3QbE2TbZMM3ES0XZnBpe6sWnX5ijMeOyft
	7pcZLwwA=; b=fLkn4smWzqD2FIl1ZoPhjdJu/1iMUUg8psRiiwufcFWcNOJsb7o
	xQCS9z1VCzFF77WqirfXd2hw77EEzPgNF/+vaRA/y7j1g3o4R8CRU+DF1ms7Gnyt
	6YidyLXYxDkUGprpiSI0/Lq6amw9sLm8xwETdNtVTAyscpHvHnjqsB7VKEBBeTcf
	xqdwtDi6Mc/fEhnRA0lVBF3HeM8zGoALWpLidtjezn/yc7qeikb4E0dSpMBGUmLB
	Ax75YP/KtlvfR2gYlEZvJoUhW0vo9Uvp/Y8a16bJalrGQu8+O0Vf0/t2ZfRhzsYl
	DyWOXoyuY4DUTTZ1JW0/GY3OsuTNVK4r9WQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1687868966; x=1687955366; bh=b3QbE2TbZMM3E
	S0XZnBpe6sWnX5ijMeOyft7pcZLwwA=; b=RB89iHxcmA4J9vrBRChu1Iu2h2jVU
	Nzk5rsOwgOK55NaFV9exeMROMon3WctKMoke5JDnvDqQIN7nC6H9uJLSLHqIaWLL
	gt/5/t1pWg5YttpLrmRnRlR1JsO6w99ASObExpzlMIJoD83qJw12ZsjZvGrZCu8w
	KIiLj4bnzdsobLxWfvCFc2E3JBNNiVGIaQEamE14rykij1RrVADteInF7a4k14q9
	5upSG3thFNqZ5MERNXd8cLzIzpcQHc03VNdOZ2SPNx9nHLf1UhSsx3xZZZsA98hT
	XslSf05lJIDKMbMWqG1YsWJ8TimERXbAlilxGCTOr/oHElZYVejnSp0LA==
X-ME-Sender: <xms:JtaaZNmmXGr9_bghRPU4JLXpsz6TvfAGx3JKHsP-XcStXryQ-fc9VQ>
    <xme:JtaaZI0cXM10mY4SibFlXhB1glk2gipaQYZnp1mCHmF7HnIcyUn4BLxleVR4JQ9tO
    RRPblnm6P-LTw>
X-ME-Received: <xmr:JtaaZDouO8GQqmFl4YVfMTp1illR2Oq6qfHX2SK5htqaxF2rtnYhFj8ndyyPQrA8e9ldl4Dgv-Ph3S9GWa4Sm-HbxLgGw01oEdo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrtddtgdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:JtaaZNk2FqCZAzLAQHyrkM77CrZMzx-87qyO_TH6eIPufRtZBrm9xg>
    <xmx:JtaaZL0UDBkgSA_-Ifgtjqs1xxgSpmoSc_eHNui71x85FNhUci-_qw>
    <xmx:JtaaZMs-6Qmd-EcITrO1yDOK9fE5f5hPeGMoQ5GSiagT_7yaxM-aIg>
    <xmx:JtaaZGRolba6R6j3y7D4KxwJk30R5bsQQlMLVjtTsDjaw0gn90uD3Q>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 27 Jun 2023 14:29:21 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
	wei.chen@arm.com, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] tools/python: Fix memory leak on error path
Message-ID: <ZJrWImht4GZXvLCv@mail-itl>
References: <20230608135913.560413-1-luca.fancellu@arm.com>
 <20230608135913.560413-2-luca.fancellu@arm.com>
 <ZJnT8rdnMT5lrR0A@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HCBT5xK9kEbVAaTE"
Content-Disposition: inline
In-Reply-To: <ZJnT8rdnMT5lrR0A@mail-itl>


--HCBT5xK9kEbVAaTE
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Jun 2023 14:29:21 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
	wei.chen@arm.com, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] tools/python: Fix memory leak on error path

On Mon, Jun 26, 2023 at 08:07:46PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Thu, Jun 08, 2023 at 02:59:13PM +0100, Luca Fancellu wrote:
> > Commit 56a7aaa16bfe introduced a memory leak on the error path for a
> > Py_BuildValue built object that on some newly introduced error path
> > has not the correct reference count handling, fix that by decrementing
> > the refcount in these path.
> >=20
> > Fixes: 56a7aaa16bfe ("tools: add physinfo arch_capabilities handling fo=
r Arm")
> > Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.co=
m>

Oh, and BTW, in relation to the discussion on the summit about
committing process, the buggy version was committed without my ack,
after waiting for my review for about two weeks.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--HCBT5xK9kEbVAaTE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmSa1iIACgkQ24/THMrX
1yywKwgAmGMxw8NWWMccoY/8B6zKn4KQjcAFz36tqYPbUTz0yGTaHbOE6UmJiLm+
gyVOta/sp1WWGSpJtnpT2ZMJaM9UTHqhv6Yy2FqQbv5OAem3iNVFY2ufUGSOMW6F
IoVe20nN1c+1m9J4pgSDUcRvPBtIVv4ugEsn0aCDtDG/sRqeiIxuFsZvXp/7e+x9
Ii+wCN+ti8L8IVU6jY2mVWdjIzPP8V2FU9qc5yx/Lww6D0mESUG6XoI+20Xobimt
8iwOmmVcr5/ZQwshCuVPWv+1lEPlKCm1eGTPT4fxKMAQV1q0omttETb9yv0Ll55M
r5u0cXVfKfcX9Tj3oW7wIT/giVZdoQ==
=b2eV
-----END PGP SIGNATURE-----

--HCBT5xK9kEbVAaTE--

