Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2319028E3
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 20:48:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737549.1143912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGk3E-0003xd-59; Mon, 10 Jun 2024 18:47:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737549.1143912; Mon, 10 Jun 2024 18:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGk3E-0003vP-2S; Mon, 10 Jun 2024 18:47:28 +0000
Received: by outflank-mailman (input) for mailman id 737549;
 Mon, 10 Jun 2024 18:47:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7tSL=NM=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sGk3C-0003vJ-CC
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 18:47:26 +0000
Received: from fhigh4-smtp.messagingengine.com
 (fhigh4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddec8ad8-2759-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 20:47:21 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 8914C114014F;
 Mon, 10 Jun 2024 14:47:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 10 Jun 2024 14:47:19 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Jun 2024 14:47:18 -0400 (EDT)
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
X-Inumbo-ID: ddec8ad8-2759-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718045239;
	 x=1718131639; bh=S8SC96e7az8r2HEhWCKxQ+Xgv9my0B/BvfG/6hoXoaA=; b=
	i89jFrVEKgiBIKq2RW/rgr6CJlH5NvUe22NkAk2FtxgvaxynKYqHGoWCZXa8lac4
	+wDZgrYJBBdqb/6F7pZr4uzEU0qi777F8ql4j4bQ0BtZ4QftBQqKfB5yvG0fUVQI
	e/spvA680opHA4BKYUbrhrWE6jPCmTuMYrsMChSTR0rGQ7qtK293+I/wGF6M1EmC
	FOBDT2l+GLMxQE8Rxx8ZEUMW+rzxJkqwyUb55Ms6vGsAsBYnt2K4dhyNP7Bu5jiS
	svbkwT/GzsHUDFZ4lHTG2SwC8aUpEAEEWjO7nOHzOZDaCBLruh3ciaLGb+H4tyZy
	VLtCE2U0N2WuEcnOZRzmTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718045239; x=1718131639; bh=S8SC96e7az8r2HEhWCKxQ+Xgv9my
	0B/BvfG/6hoXoaA=; b=ZULHV3cQPrWPRC4i9H5odOOD7swXVohB8gzu8xq9+YTY
	woB/daVikxXo3goYJinaicrhHdf/ahxaUiG50NLIT20zifBbg7CDhmOnMV3rg1K0
	RKz5MtzrtKTdJ+kYZPq5qWbopBGtIG/BvKyLz1Y9QTjJdziTx/ac1Eqmks6Vewy4
	xQLh4DgBo8pIQvPpO5U+5UDQUEIMzUn6uPoDsiUMd5vlmJ4lN6ccz/Yki6dtOOtu
	fmEqmzXWBzpJPmyVK6RXDHBfxsHEwov1MAndbGR4De5FO0zRi86u0juH0cPcbFgI
	tT1hpyAAWLw0MJeAkE8twcKxOHj4PSFvcqM1WGa0Bg==
X-ME-Sender: <xms:N0pnZqPwGM2EqIW0AqFC8mBIi01Mqpx_bQgfmXc-qrKaLjck3IXJeQ>
    <xme:N0pnZo8DCzTgpSveFH6TBqjbKR3cEjI4TzzeulGvychTi6zxp1FdNHNzRnu26e0VL
    tbMfZx9TDMaZA>
X-ME-Received: <xmr:N0pnZhRWF0-jsE3RkS3qwJKADwlshR0bcIq9e2u2NMnBI4hjU_OYs5pXnwPDEgMToke9xG9m73e20E1Cz2ZhBgKWP-dMEbKspA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedutddguddvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    udelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:N0pnZqsKmZtsX_xo1TFo-ZJuPKpvzMJJJa-QsLsHTPl3TKbbwUKjSw>
    <xmx:N0pnZifxphtFzY_OphCiR4cnSaJqymsGUwt80H2dqcEdCNSlj8IieA>
    <xmx:N0pnZu1TmGUMAEckhE7RLLKiiDzkcy_NyJZ_sYVlfrrika47JFz4gg>
    <xmx:N0pnZm87XHS_dvlyZjICQLf8SvoLCdcz9TZ5rukPhyah0JMhIOPGLA>
    <xmx:N0pnZh4pyiWNssR9fxKrPLDbTvPNQrOkCrnkY88fygPSqQT1CM2wBM5v>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 10 Jun 2024 20:47:14 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.19 v1] automation: add a test for HVM domU on PVH
 dom0
Message-ID: <ZmdKMthsjw0qejyg@mail-itl>
References: <20240610133210.724346-1-marmarek@invisiblethingslab.com>
 <67a6fc3a-bcc3-48e8-beb8-b3c05217083c@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Z7NtFVrrua97WZbt"
Content-Disposition: inline
In-Reply-To: <67a6fc3a-bcc3-48e8-beb8-b3c05217083c@citrix.com>


--Z7NtFVrrua97WZbt
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Jun 2024 20:47:14 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.19 v1] automation: add a test for HVM domU on PVH
 dom0

On Mon, Jun 10, 2024 at 04:25:01PM +0100, Andrew Cooper wrote:
> On 10/06/2024 2:32 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > This tests if QEMU works in PVH dom0. QEMU in dom0 requires enabling TUN
> > in the kernel, so do that too.
> >
> > Add it to both x86 runners, similar to the PVH domU test.
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>=20
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> CC Oleksii.
>=20
> > ---
> > Requires rebuilding test-artifacts/kernel/6.1.19
>=20
> Ok.
>=20
> But on a tangent, shouldn't that move forwards somewhat?

There is already "[PATCH 08/12] automation: update kernel for x86 tests"
in the stubdom test series. And as noted in the cover letter there, most
patches can be applied independently, and also they got R-by/A-by from
Stefano already.

> > I'm actually not sure if there is a sense in testing HVM domU on both
> > runners, when PVH domU variant is already tested on both. Are there any
> > differences between Intel and AMD relevant for QEMU in dom0?
>=20
> It's not just Qemu, it's also HVMLoader, and the particulars of VT-x/SVM
> VMExit decode information in order to generate ioreqs.

For just HVM, we have PCI passthrough tests on both - they run HVM (but
on PV dom0). My question was more about PVH-dom0 specific parts.

> I'd firmly suggest having both.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Z7NtFVrrua97WZbt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmZnSjIACgkQ24/THMrX
1yzBsAf/UUWGVzXgyeZ+olY1gl/F4Y5uCzBNhtce04PJLdQBk44152Mo4JqubnHQ
xjiC7uxhLH+bC2gMkJEBoyOOhaBluUQonzKFtvo2/CNkxati7xxkAI9NxupB+OIn
lkc9IukpYH6NppjF+2vFUuXfsoED1wJI73dm2vp5kr2O/b1uN0lvWvPWoz3aOWjf
cTLmX7YaYQo1hSnjNCRs958NQk6CP/u9MFOIrFrPK1iOzSXb2+k93DutKTu4R3HV
iVn3DcEVrOiURhuUZnpaJ9zcne1ZzGqVszmC83bD/A8RDNC3CIJ2RfudbgMjbroC
W1Kg8NHyb2BIq43LSFmJy/RiVliMsQ==
=P3x9
-----END PGP SIGNATURE-----

--Z7NtFVrrua97WZbt--

