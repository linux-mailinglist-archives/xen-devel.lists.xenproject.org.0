Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37014A84AD1
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 19:19:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946129.1344134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2vXy-00072f-KO; Thu, 10 Apr 2025 17:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946129.1344134; Thu, 10 Apr 2025 17:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2vXy-00070L-HX; Thu, 10 Apr 2025 17:18:38 +0000
Received: by outflank-mailman (input) for mailman id 946129;
 Thu, 10 Apr 2025 17:18:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S0bf=W4=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u2vXx-00070D-1C
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 17:18:37 +0000
Received: from fout-b6-smtp.messagingengine.com
 (fout-b6-smtp.messagingengine.com [202.12.124.149])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5451781-162f-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 19:18:35 +0200 (CEST)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfout.stl.internal (Postfix) with ESMTP id EEE4D114012C;
 Thu, 10 Apr 2025 13:18:33 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Thu, 10 Apr 2025 13:18:34 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Apr 2025 13:18:32 -0400 (EDT)
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
X-Inumbo-ID: d5451781-162f-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744305513;
	 x=1744391913; bh=8+tIHI0/LkJ/gLUHjcb4H/XbFT/LNdLyWJk+FNi/uIs=; b=
	lJSgjjTUapgjI6SrLs0XQDQ/25n+jmu34pY0ioRwfLZ6En7panT8aqmS/A03/AEh
	MtSGGCMzE4yiZg7HyroO0K5P3DJTbuU4ntHnDf+sURnqEnQn9P9hGj2R43cnjdiu
	cHeoxe2oAJpOe8tjkH06dzP6B298GqKkhIrhOzesc3d3/ILmSsuWpRPsxZ5r0J1k
	00AtgHbReINE/1TwxhY+6woTpWF9jd0bb1XKvvGM8/1EJtvBVQ1QkLloHJ4mCCD7
	rAOlFtRWfMleD9BeAYCO3tX8gXEJ0j2JGEU6nb7a80UCpmtm2j2vORKXGM8pyuOT
	bkWTv+P3ohUPhv1C81fffw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744305513; x=1744391913; bh=8+tIHI0/LkJ/gLUHjcb4H/XbFT/LNdLyWJk
	+FNi/uIs=; b=c6oxvJz2/SaRh+0/RLi6o7Bbn7A+w57oDeNq1lJsYiCWH8pVmKh
	CGERgpzYqNQ+uetZh8qS9AlIg8kYGxmnxzLtGgV52jgxjknJBkFHnQiTFr1lGsnw
	XYGDF0viV4O5Hnj2vnN71xbsNsEk9Z6qvKbxXH82eIqakwgVBtvHSujQTOD4gSz1
	hm5l+bJzAR9rdNvpDcbqWRiK76U0TePSQVywvCTceHM3+eTmQ8eA1jcMgNvVlaLD
	yr0hgGe0M+4S0a7IBghU6GM0DaHuYpjuUTXI9sW3vc/7YwunM2SvGDZg+2kbKg5m
	QMu8P1JsDrmIvHGbUsctms2sIUXqsIzUebw==
X-ME-Sender: <xms:af33Z127rNjXUHtBTuLHRDASj8OJhvQ1NUouxmL8d4q2g4yP0RBjdg>
    <xme:af33Z8FwkxlaEGvubEOC1JJyPzoI7sa5VmmHF9ZdYsZleKKQvL0XHTb3sK_KzyRHm
    dUdPcahJIYzlA>
X-ME-Received: <xmr:af33Z17AYKJ9CHyROnz0yTRo9csi2Y6sT7e9SL5YZO29EEXEw1OTDs8r_KFPhLOKeLemTX-xPIirSa2Bbplge8eVA45ahqRG3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdelgeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghn
    ughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopegrnhhthh
    honhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepgigvnhdquggv
    vhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprhhogh
    gvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhn
    iheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlsegrmh
    gurdgtohhm
X-ME-Proxy: <xmx:af33Zy3IkS88je1Hslg6SqueYoOKUixDHWPcgxsJiRiGnpwMseThZg>
    <xmx:af33Z4FtqgZkPK0f5GcgKg9z3YrnFHtKQvYhSCe2caD9nwAuGA9dFQ>
    <xmx:af33Zz8ixUZsmTqu14rsjxboz8QRQLOxwA6clAomrYoKsRlaX4b6DA>
    <xmx:af33Z1nAZeXrH7n1baIdfB6porKHI9cut_jDffmUMqfcP0A6VGvXFA>
    <xmx:af33Z7EfmjcOAuqLKJANlyYiu3LTwCBZJgHTAtet81ey1J3klFU9fJgm>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 10 Apr 2025 19:18:29 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH TEST-ARTEFACTS] Fix adduser --shell path
Message-ID: <Z_f9Zjx0jSxVR6jC@mail-itl>
References: <20250410155531.29570-1-anthony.perard@vates.tech>
 <6046d30b-b5ca-4867-9f24-831b469d1ee3@citrix.com>
 <Z_f0BO6oncTMKtrQ@l14>
 <718ee844-64b6-4146-a0fd-0ff7042ce737@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VsAzbb20BGurfcS8"
Content-Disposition: inline
In-Reply-To: <718ee844-64b6-4146-a0fd-0ff7042ce737@citrix.com>


--VsAzbb20BGurfcS8
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Apr 2025 19:18:29 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH TEST-ARTEFACTS] Fix adduser --shell path

On Thu, Apr 10, 2025 at 05:57:23PM +0100, Andrew Cooper wrote:
> On 10/04/2025 5:38 pm, Anthony PERARD wrote:
> > And by the way, you might want to add `gawk` as
> > well to replace busybox's awk, to make the linux build a bit more happy,
> > even if it doesn't seems to be an issue right now.
>=20
> That awk complaint appears to go away with find/diffutils in the
> container.=C2=A0 I've not figured out exactly why yet.

See my earlier email, I've seen it still there at least in one job.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--VsAzbb20BGurfcS8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf3/WYACgkQ24/THMrX
1ywnmAgAkKDudO/BMnsEMEkjLx/cdFZsPwSGOyL2UVXHX+tX2UiFz4BI3NYTkqOd
B1LsRm/sTqF2sX42AC4rJX2s3ab4D4dDfpRtFaeOuKv7MXHptHLElV2uWI+W98VF
6eDp5rn+BzDwpq7KiM4T/JR+ARwh89TsGbNUVwgNuj2iOIZInkxogDuxYsoXeolv
vbWaMuZ4Du0xYKQb/IfXb5iZbO4z/69aQ1FuSS+OTDBzy1TLbp376vihVAuvBqen
fKpq2FE8CfgA9ZehpCEO9LVtaTZZSO5OO4xSbntx6s/YEholMCbgciIVOZQizWN1
J4aMdE7v5q62aHMHHB1eS+XQaeSTsA==
=gpZ3
-----END PGP SIGNATURE-----

--VsAzbb20BGurfcS8--

