Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B5CA7BB60
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 13:14:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.938136.1339015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0ezJ-0008Dd-6E; Fri, 04 Apr 2025 11:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 938136.1339015; Fri, 04 Apr 2025 11:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0ezJ-0008B0-2R; Fri, 04 Apr 2025 11:13:29 +0000
Received: by outflank-mailman (input) for mailman id 938136;
 Fri, 04 Apr 2025 11:13:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n5Qt=WW=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u0ezH-0008Au-OV
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 11:13:27 +0000
Received: from fhigh-b2-smtp.messagingengine.com
 (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d17b2ef8-1145-11f0-9ffb-bf95429c2676;
 Fri, 04 Apr 2025 13:13:22 +0200 (CEST)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfhigh.stl.internal (Postfix) with ESMTP id CA4F725400FF;
 Fri,  4 Apr 2025 07:13:20 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-08.internal (MEProxy); Fri, 04 Apr 2025 07:13:20 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Apr 2025 07:13:19 -0400 (EDT)
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
X-Inumbo-ID: d17b2ef8-1145-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1743765200;
	 x=1743851600; bh=b+KmV9nn+/2Ctj4X77gsnK6ZHOSFMsFML2Y1h7LIlos=; b=
	Zyc49dr0Ejs+elgwq1l8/joykkNQMA4IUV0qJ6foxl8paPD0x7IoTk+W2owfDTWn
	WybajkSl40vUS5ZdjiVsPAuQEXSChcw6c5dkqIsXK+GQqi926JNr8Ellw1Xea9LM
	2nPQlNHNqLoxqeGtqTVwDe2n4Qq6A3SUjOi4fumAoq67ll7x78nGffYsRyltSkzH
	JiZ4ei9UAw5/WRjOyL/rwnclWGgE2E9nqGMfkQUTp5VLlMPjzQOi/HQh3GBrQEww
	yRM0lHvV82Mcxp6bmHBCRxETW93vGIOHWGkWCS47UxGAuSV398V9ueiFTW+UoPGY
	GIEGdQv2MDFRiNRYfFMxag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1743765200; x=1743851600; bh=b+KmV9nn+/2Ctj4X77gsnK6ZHOSFMsFML2Y
	1h7LIlos=; b=PZeWC/4Otf6JzRGg0oYfqBBYt1bG+vXftcFg/AJweDZ2fkSShcL
	Cn8sF73Hf8JDdOPm8GmNiE1WGn5oUWoMlQhdAqNoJYm35nPmYtdy7yOM5aUcFc+u
	+pgapz3DrfpciJIT7UbW3Me4BaDC23ystzNYo/AphtBV2UN2MqCiYbVD/LY/BsFn
	NjPZggrSBsTN5mZdAhpw99RJTRfETqTaW6CrXYGinISguGoe50M5g/x0VlSv9kEc
	ZtvoMvihgvKuMKNq4Mja0Awf5Z+xffG4cc3phvqQginW4laKB4DHYaosn0WwI5jt
	gFAFkRPLPkjE+5hR31qI5a4Ju+X20pkdyZA==
X-ME-Sender: <xms:0L7vZ7z4iVGgGhsADlxl3aBxixvMvYlA3u_4UvUH8BszDwXAGE2oJA>
    <xme:0L7vZzTsfUo78l-9zh6UjswPuB_vLfO5n_8aRdNDGlnlzUKOZ5hQX8CQDLRkTkWS-
    GTmPM1oasVqUA>
X-ME-Received: <xmr:0L7vZ1WiJKkNMMO-lunVV07Hc-FZtQn4eK63srgObM-gU2KlzsmgwzsIwkAjC8CD3z-KqydqIzVcY5H08LeuwN_AOkR8XbGgaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleduvdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhs
    thgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgigvnhdquggvvh
    gvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnughr
    vgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopegtrghrughovg
    estggrrhguohgvrdgtohhm
X-ME-Proxy: <xmx:0L7vZ1josI9Ze6o1B49Ixys_8xD1eCMwn9JTGkY2bapFlCVHyDxjkg>
    <xmx:0L7vZ9DBddw61VwRCvlUCLWoBMUIQwiKysVo_uPUo6roKt64EdxFzw>
    <xmx:0L7vZ-IB6zb43-3H2JqJRdh8HZtP1txNiaW44lGnwqdnr31-RyoLcw>
    <xmx:0L7vZ8BqtrDoBL2nk7HcSQIczUyF-PiaGRKsUBHo-yceha_IlXIozA>
    <xmx:0L7vZ6wpBc4htirgYl7PVWFXYy5D0MkwQfjUrNCP0O5hU91CTQ1DX33R>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 4 Apr 2025 13:13:16 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1 08/11] ci: switch test kernel from 6.1.19 to 6.12.21
Message-ID: <Z---zcF0s29BEBxB@mail-itl>
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com>
 <612750de76202364b749bda6cdd30c1daa81f79d.1743678257.git-series.marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2504031737290.3529306@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gBQezFazTDWEzoUL"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2504031737290.3529306@ubuntu-linux-20-04-desktop>


--gBQezFazTDWEzoUL
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 4 Apr 2025 13:13:16 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1 08/11] ci: switch test kernel from 6.1.19 to 6.12.21

On Thu, Apr 03, 2025 at 05:40:07PM -0700, Stefano Stabellini wrote:
> On Thu, 3 Apr 2025, Marek Marczykowski-G=C3=B3recki wrote:
> > The jump is pretty big, but should be enough for a longer time. The
> > change right now is motivated adding new runner with AMD Zen4.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>=20
> As long as all the tests (including QEMU and xilinx-x86) pass:

I tested all I can (and it works), but I don't have access to the xilinx ru=
nner.

> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--gBQezFazTDWEzoUL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmfvvs0ACgkQ24/THMrX
1yyRbQf/Wz4Dj+RzD58d0wkR0/2lfDqsqKEthdV/viF5FcdFgvUpqRLDo+vefeZD
UsnGYLTKmjFeWHJZyHimHBb2AiPji4Y5YnMk1q0N8s7Kf+Xf7jHTWYzM91UXXnXh
7GIlP6zmH0HU05wuijO7ASSkTqGxeUVvTQ7EpWTe6cX/8oZn3FyvA5dl/WUvsIDC
MKi1a4bfSPFGeoiixOM5BGkMPg1GkosMibK4BswXb8frEmBMCeyz2gO+uZOWoM23
djlXEHQiekYYnas9M7K54jeAxaIFGkW7qDyAghqhXrS5N5thp0iD5m6lO7Mpxy/2
kgaogvvytEGxxPZiAvYNCNuXTPvEig==
=KNOv
-----END PGP SIGNATURE-----

--gBQezFazTDWEzoUL--

