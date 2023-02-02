Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C08CC6886EA
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 19:43:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488903.757199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNeXn-0000Vk-87; Thu, 02 Feb 2023 18:42:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488903.757199; Thu, 02 Feb 2023 18:42:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNeXn-0000TC-5N; Thu, 02 Feb 2023 18:42:47 +0000
Received: by outflank-mailman (input) for mailman id 488903;
 Thu, 02 Feb 2023 18:42:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tn6t=56=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pNeXl-0000T6-GP
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 18:42:45 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d9c6a3f-a329-11ed-933c-83870f6b2ba8;
 Thu, 02 Feb 2023 19:42:42 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 8123A3200645;
 Thu,  2 Feb 2023 13:42:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 02 Feb 2023 13:42:36 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Feb 2023 13:42:33 -0500 (EST)
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
X-Inumbo-ID: 5d9c6a3f-a329-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1675363355; x=
	1675449755; bh=lg2mMVgKWzumdcP+F9hZgcsYrteBCJhK/JelW6EYdVY=; b=C
	uTXDseVzBiQj9h2D+NuYP2jUT0tW3Lmilaa0/HVSPpcoiD3KfygKzgQY6EimkjGJ
	r5FPB9IdV+dObh+fV0OrZLfZju61Sb6vtG1NmYLcIF3/TDhRTlZSI3Pu/JQhgjs5
	zeRqriMqf8Jbp0rN18pCjM+1Lt5t/VTltANRbn4K9r5dCYs5JqXLdqLwY0TsTT3j
	31hBdBZCBzFrcgq7waSac0sKHGrR/49IS6TWidI6ddBpWjEPzPR7SFcCRg6b4FUR
	GRYPIRccsAsOCVdMLmydp4wk+cRTUS5Xxon9Fq4sn8BQsZP+FfM/yxM/3FqncdQ2
	BPo8XZ+FTMxYV+HznS63Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1675363355; x=1675449755; bh=lg2mMVgKWzumdcP+F9hZgcsYrteB
	CJhK/JelW6EYdVY=; b=cxgzpT9otQWxsLIA+yjsDC7ZP5F0KwVUpP3jph2vdxZ5
	+mitzO+3QYTvVvmnpmL8EKvzBAOOpiKA0KefZzv7ciC8KpwXn3TYPeIYKEQpHe7O
	H0pbjMXOqtg5yoRYP3hsvSdXQz7CwXFX/HIQ7fJ5wURTZGtn01qKIf1v7RCIoaw9
	KzXvF2sdBjzYNlhKlrJ+2dde8e9oV5rizIAthd4k6Q22qZzoKVRj6R2UMwQOFMnW
	BVM5W5A2aZAJVzpHPoIqj9GNAFpK/H+Rbs09rSxRASrPjVDyjJtMFuZop9KbSzaj
	2PUaxc67TE8Tua6UJ1edW8stqxg4x7nrkZ/k9QJsUQ==
X-ME-Sender: <xms:GgTcY74wnNYRNp3neyFioCfGY8gsdr3kkbZ9pBLxQDI8nBScyPiT-A>
    <xme:GgTcYw6Raa_0cT5CF0vH53DC7qhHu1c4ldmSTDbYu_ApbkSwpwgEOQ6B8dI-8kN9-
    meCH_9gcInE36s>
X-ME-Received: <xmr:GgTcYyevjVy9ZEXxI7N76kG2I57m3hoyPOkTgeDH3NCz60GkNk1wkK_tBk4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefkedgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffeg
    fffguddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:GgTcY8IJiELPiUPl16hearWJ8KrYflnS8vJ3WcyZZjvqvQzEHt65DA>
    <xmx:GgTcY_I3zAOvarV3gwgLMxeoGw3-GDJ7cFbqKY6IHEJ773hLxHQ2wg>
    <xmx:GgTcY1zaNQiMs9pq8JTL8Jk0u2h4Pdy67KTvedibqCA-tnGC7CQuEA>
    <xmx:GwTcY8p6sUmqTz0YfWHoddsK_tGu_jBhadfD6KT9DQiI0nHglxbFRw>
Feedback-ID: iac594737:Fastmail
Date: Thu, 2 Feb 2023 13:41:29 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Juergen Gross <jgross@suse.com>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	dm-devel@redhat.com
Subject: Re: [RFC PATCH 0/7] Allow race-free block device handling
Message-ID: <Y9wEF3rWfpiCKc2i@itl-email>
References: <20230126033358.1880-1-demi@invisiblethingslab.com>
 <Y9vp3XDEQAl7TLND@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0LK2ZHUlLOwPgDgy"
Content-Disposition: inline
In-Reply-To: <Y9vp3XDEQAl7TLND@redhat.com>


--0LK2ZHUlLOwPgDgy
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 2 Feb 2023 13:41:29 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Juergen Gross <jgross@suse.com>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	dm-devel@redhat.com
Subject: Re: [RFC PATCH 0/7] Allow race-free block device handling

On Thu, Feb 02, 2023 at 11:50:37AM -0500, Mike Snitzer wrote:
> On Wed, Jan 25 2023 at 10:33P -0500,
> Demi Marie Obenour <demi@invisiblethingslab.com> wrote:
>=20
> > This work aims to allow userspace to create and destroy block devices
> > in a race-free and leak-free way,
>=20
> "race-free and leak-free way" implies there both races and leaks in
> existing code. You're making claims that are likely very specific to
> your Xen use-case.  Please explain more carefully.

Will do in v2.

> > and to allow them to be exposed to
> > other Xen VMs via blkback without leaks or races.  It=E2=80=99s marked =
as RFC
> > for a few reasons:
> >=20
> > - The code has been only lightly tested.  It might be unstable or
> >   insecure.
> >=20
> > - The DM_DEV_CREATE ioctl gains a new flag.  Unknown flags were
> >   previously ignored, so this could theoretically break buggy userspace
> >   tools.
>=20
> Not seeing a reason that type of DM change is needed. If you feel
> strongly about it send a separate patch and we can discuss it.

Patch 2/7 is the diskseq change.  v2 will contain a revised and tested
version with a greatly expanded commit message.

> > - I have no idea if I got the block device reference counting and
> >   locking correct.
>=20
> Your headers and justifcation for this line of work are really way too
> terse. Please take the time to clearly make the case for your changes
> in both the patch headers and code.

I will expand the commit message in v2, but I am not sure what you want
me to add to the code comments.  Would you mind explaining?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--0LK2ZHUlLOwPgDgy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmPcBBUACgkQsoi1X/+c
IsEkFA/9GXzWAuv/0q2ZJqJ64sluumHTrJNuenjIiibpb2PmaUs036H9r2jQYDI4
Lsxw3M3/9AYwGFpj/mhV5uBJutDasM3xTROoY5VqdO6vTeueaXUCefc+CGNzXNzZ
3o018mxFSPwKDaOBrCsiOuNsHtVzaOnO/TGuBW3HcYafDKFTWhDoprhfzL9mkwBY
21Ly74WUVB+S3fhURF+XgGoPKlQlaI8u6uJvW+wPQYei/LZqm5Gcpj5sqIhomFgM
yTA6l097aOj6ULLkScDW91sj30OJLc7qN5V+FtU27tRZWEzIcY5cl4/IL9KcAfGi
bcQcQ2Z7WPcjqLLuUxB2C5dfR6id/CmDnplOBRD0TAVzbUCJCEciClYHxPxljE6q
/mSqAfuBhO3ryA7z8xMYsYVz0SpdgnQqXXhxaZslSA4r0ACdEsytMu0YPPpIby7M
BjV5Sx2xuLaw/McuiptVktbvKknJAqw79ZecjU03d3Ga3/sA8dZC4JBGRj90cOMT
WPHUORPPmepxyX6n28rH/mdcsFDAzllbi37fReeJCKEEmrT5aCa8pyry1Rl2V6fi
ub+T46oghFHgl63y0Timr6eamgqV3CHGczHiKMcA0Mclv4shWUyaId0bzAGn/RLR
vpbwX0CGu7m1vnqsskbtLq1ThblONmQWtVFcFrqykfZMeqs2KtM=
=aeu1
-----END PGP SIGNATURE-----

--0LK2ZHUlLOwPgDgy--

