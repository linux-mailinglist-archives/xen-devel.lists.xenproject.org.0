Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9B9B1D55A
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 12:02:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072754.1435721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujxRT-0007EA-Vu; Thu, 07 Aug 2025 10:01:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072754.1435721; Thu, 07 Aug 2025 10:01:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujxRT-0007C9-TJ; Thu, 07 Aug 2025 10:01:47 +0000
Received: by outflank-mailman (input) for mailman id 1072754;
 Thu, 07 Aug 2025 10:01:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=llzQ=2T=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ujxRR-0007C3-Np
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 10:01:45 +0000
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80f36ef6-7375-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 12:01:37 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id 8FBDFEC00F4;
 Thu,  7 Aug 2025 06:01:35 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Thu, 07 Aug 2025 06:01:35 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Aug 2025 06:01:34 -0400 (EDT)
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
X-Inumbo-ID: 80f36ef6-7375-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1754560895;
	 x=1754647295; bh=AJ5OFoRbsYaQslHS/TiLgpsvE1aZQhx45duQFUz3QnM=; b=
	U9KyEpEKVbH8LP5kGIK5JHgooSbf5ErZBx6sLnT8AERMfRKhBiqonmgv5+wTEEMo
	3Ryq4cKQYZBM9nIkw8bd0/MxOv/p8+9hocdhYhUWlk1F5P9vTOLa5O1+SogGA8y+
	N9PzHTFD+IKwdyxVrm0gTe+wopML403v5bxWioFhRedREhlv1yHMEJEW7DryT8BY
	1DWl8XstIiZ4XXxgLk2JkZ+8Rc6/G/S0Xt+lGibzK27PzT9yu7Wb2alG81vISnFj
	HRYxnPiSzwMVpEKKWoOCAaUDpeCs1jIs4oj32c/LcxiBvohrYBM9gEIbdnBduM2z
	SG1oKFwldLKrUBuwKaDGQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1754560895; x=1754647295; bh=AJ5OFoRbsYaQslHS/TiLgpsvE1aZQhx45du
	QFUz3QnM=; b=Pt26urSLhoZakgAnPi73RuskIa3SmKEtIfppLehLno2mAkdbUV+
	8QF9pOkKUusRu2mzEovRfN+/1rsyXz9gS0YTS8BnFtdeWKZtJc5zfBkIRB5rx5m9
	qlDCbQKz+Ii0bAhHyYHiVhUMMKL/8eVzOnvIMe85KjDwD8wAQQRJn3oPNnMSw3z/
	3/RpD89ofoSpmeqIHs9hsnsYxpg6oe1sPTEMGZ/vq1TQ5PMfPFVSiuqeHeVsdzgu
	15CJfweHiLuOYx4MiVn6RAh4K7Zt8ZLE6VL2g/YsoojQeLIS4d0MODoaSnsesTHt
	JcP77PMQTT6PeIJWSVDdbtEKpviXhBOYPJQ==
X-ME-Sender: <xms:f3mUaAceppnG1E25q6vK1Y5YVeM8GEfexMUIyPRZ2taNwvD8qXjknQ>
    <xme:f3mUaMwgE9nwmQ0tpDT9pZZTRWnWCDx2gzZJ0-jyU_Pxsh49RgOR3xakQ61KZ44rv
    hOxQlDqKBICnQ>
X-ME-Received: <xmr:f3mUaOFMzJlb0Wy_eyb-LMfLGQldMmLKnP5JMyJteqOcnDzrZKF69X-hlR3JaYAZHVvmNohdi0dtOCB_xQ5o1ZUGcL8d87PBSTM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvddtieegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegt
    ihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvg
    hnphhrohhjvggtthdrohhrghdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:f3mUaIwXvLOMBoCAtQiDv6BFoX3GaDmowD3z6MTyj_gli3RiVE6UVw>
    <xmx:f3mUaHsc5O8i49pSUQo6YeFeG0MV2sMUZA9i6Sh5TFlMwIcMVbemyA>
    <xmx:f3mUaN21BYk76uBmfatz9d6W8xBAeJkuAkHvessXeOkpBa_44Dt7Ew>
    <xmx:f3mUaK_ju-FoBTubbfk7E4qZPg0gFCcuO5Rl-RAjpjSseggPG55c1Q>
    <xmx:f3mUaBbWz5me7tn19G7yOxB4U5LBoZuWw01v9b_3y4M4T0LS6WPwbq7p>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 7 Aug 2025 12:01:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts] Add debian rootfs artifact
Message-ID: <aJR5fGn4kU4HYGfA@mail-itl>
References: <20250807000318.2284283-1-marmarek@invisiblethingslab.com>
 <461423ec-9c34-4df6-a073-d1e4c78badad@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7hlTsf29IqlNLwo2"
Content-Disposition: inline
In-Reply-To: <461423ec-9c34-4df6-a073-d1e4c78badad@citrix.com>


--7hlTsf29IqlNLwo2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 7 Aug 2025 12:01:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts] Add debian rootfs artifact

On Thu, Aug 07, 2025 at 08:55:56AM +0100, Andrew Cooper wrote:
> On 07/08/2025 1:03 am, Marek Marczykowski-G=C3=B3recki wrote:
> > Will be used as dom0/domU in some tests.
> >
> > Install OpenRC and setup it to start /etc/local.d/ scripts so tests
> > don't need different cases for Alpine and Debian.
>=20
> (Yeah, I got this via CC.)
>=20
> I was just thinking that we needed some non-Alpine testing too, but for
> a different reason.
>=20
> We have systemd configuration in Xen, and changes to it, yet no CI of
> what is the most common init system in Linux these days.
>=20
> What would need to be different in tests to avoid OpenRC?=C2=A0 If it's o=
nly
> the script to start the test running, can't we just declare a name, and
> arrange for both init systems to run it?

In this particular test, probably just that. And convincing
systemd/journald to dump logs to the console. But some other tests (if
we'd want to reuse this artifact) wait for "Welcome to Alpine Linux"
text, or start other services via /etc/init.d (mostly xencommons...).

And also - installing openrc takes 3MB, installing (just) systemd takes
30MB. And I haven't tried yet if any auxiliary package isn't needed
too...
But I can see what it takes to make the test use systemd.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--7hlTsf29IqlNLwo2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmiUeXwACgkQ24/THMrX
1yw5kgf/feZtgH6SCT2MlgJX2gU1cy4NBPjMNLqY9VYzSNPnPdmzpPWNwZsMP7C2
oIMETHrBm+xPpeYpExlUaHme0EVr3mdA1+rnYryDAfWb3Uh5yRpeT29U1rBwjvc6
h8AtT0MNPu2TpMqjgi8wtPzRuE3UDw5YtxoE+OHY8NMLB00ELMiaKgHSdiB/i4cY
WHwoldjLVe2XeNHhMMQHWt+Zgt1zBsjp6NXKYAADckNvSUcHG+BUMHFwwvKqHmBt
q+3V1DwjrYMcLqcS7i1E1Huh0ygwtdzMZrPuPWUx5lFJDmI9IaOZOblTi1I5rIXv
rqqn8cHejvA9jqeBRUG0VNZi16ls7g==
=L1sQ
-----END PGP SIGNATURE-----

--7hlTsf29IqlNLwo2--

