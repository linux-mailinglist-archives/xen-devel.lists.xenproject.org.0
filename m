Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 947C85B9221
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 03:29:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407192.649605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYdg7-00074e-7K; Thu, 15 Sep 2022 01:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407192.649605; Thu, 15 Sep 2022 01:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYdg7-00072D-4X; Thu, 15 Sep 2022 01:28:31 +0000
Received: by outflank-mailman (input) for mailman id 407192;
 Thu, 15 Sep 2022 01:28:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ud2r=ZS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oYdg5-000727-Dp
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 01:28:29 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1e9796b-3495-11ed-9761-273f2230c3a0;
 Thu, 15 Sep 2022 03:28:27 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 8F7523200A1A;
 Wed, 14 Sep 2022 21:28:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 14 Sep 2022 21:28:24 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Sep 2022 21:28:23 -0400 (EDT)
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
X-Inumbo-ID: b1e9796b-3495-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1663205304; x=
	1663291704; bh=l1fnseSnzVShMhAuJkr5Ysl7c2SbHiOQMdqpYfguPIo=; b=G
	BZbCh8b/WDPE7fI+IwpCHthV9TsYzTqw4h3cW6DeN2kTMy4wLxPhiOCujBg2WHLm
	NGKuS9zd+3y9pC/98mrgIrGCqL4FnWbNBeWk2J8kxJ7X5j5A7qlB7j489SZJqqHb
	z42+9G8EQFfcQNJtAw1Kv0Rd1wwMglSffkwiOdERWANztXSpWdtWmQa4KqtILEe9
	TtYHp1kZCp8Kq66lPmPQCExOMl0iAUm3LfKCJkzdHBi3VCuXW5zMX8Jv2PTId2SA
	xmES2mvudj6XwF3NeOcASiHENLlXhJRzCAkvYAZa8jDzfxEcyz3bMFtMMUcj5z1T
	ynZZUt+/VlCgaKWYlRtaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663205304; x=1663291704; bh=l1fnseSnzVShMhAuJkr5Ysl7c2Sb
	HiOQMdqpYfguPIo=; b=Kc7L0bURTw8EAvT9vPYMVzF5nCmUz3tolkXEF9ZwgF4S
	Jh5Rt8xZPX1V881bQEkjCCurUCddW+3q4imRkvv6f3Kz64ZOqnZhfkKUHzAFccXX
	ik/rssbZuHB/e623tPSZBWqbl3sr9xxULI3MBWSj0aa2Yybkb+eND2yW3NWHLr8j
	mJJnag4q/RIpNVtBmuXDQ5kYIguhkne09+hHASShFo6ToGGc1niaHdirLeErseG8
	AAXRqFqlz6+opM272jSW4nEf0bPqqZ8ZFzQP5p/16n93mFwH7/K/a+mHheXuuxRM
	phwZWG2BHYs8v9JMBgHVdXuIOvshJN1sOlHXdO/DFw==
X-ME-Sender: <xms:t38iY6pKPiilTWuNOFyYtDcC9VJNv7IwkDoEX1gIbnUGsKRPq6ex5Q>
    <xme:t38iY4qiSKIylyGFHhsiMuQN-R_ci50It7NqvhzAHq3ORhifJjFKj0XjZ2xBmVr9k
    bzWV9GYGegyBA>
X-ME-Received: <xmr:t38iY_OIjdVZ5V7AupAlNuUVZ_ogfw7d3anwAjv-JBm8KgntSMTFE21btRGKrhWnDx2XgNaBV2XopIfKxsUMdVzWfkgaYcr5Kdib>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedujedggeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueek
    teetgefggfekudehteegieeljeejieeihfejgeevhfetgffgteeuteetueetnecuffhomh
    grihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:t38iY54NNVV0I_8TyeZQsLAfN42Mb84Aa--nrvql6MbTwwhV-yXBJQ>
    <xmx:t38iY56Evr--qxiZk6ICeNELdv87MHq_PilGESQl_NejBOwf4WXi5w>
    <xmx:t38iY5gH05UIA0poRwe7yAcu5I-vsKURQu3R0w4_87p2Ciu082ovHw>
    <xmx:uH8iY6XcBqyUOu__jGL5YgSV6QkY7xrrNy6PS9yRobSoEIV9CDcpyg>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 15 Sep 2022 03:28:20 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Console output stops on dbgp=xhci
Message-ID: <YyJ/tP5pZPXPxeTh@mail-itl>
References: <CABfawhmXWouFVRVrtX82Dh+8maaJqnDSDL=Me7_fzBGdM4oE2Q@mail.gmail.com>
 <YyJOWDWYVpShtAU9@mail-itl>
 <CABfawhnLzmBLjeVGAFVMy27MCGMrddaic_31FvuJ3sCevsvXww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wKQ1kuJXuD1mREl3"
Content-Disposition: inline
In-Reply-To: <CABfawhnLzmBLjeVGAFVMy27MCGMrddaic_31FvuJ3sCevsvXww@mail.gmail.com>


--wKQ1kuJXuD1mREl3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Sep 2022 03:28:20 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Console output stops on dbgp=xhci

On Wed, Sep 14, 2022 at 08:41:59PM -0400, Tamas K Lengyel wrote:
> > > Do you have any idea what might be going on and preventing the output
> > > from showing over USB3 afterwards? The /dev/ttyUSB0 device is still
> > > present on the receiving side, just nothing is being received over it.
> >
> > There are few more patches in the series that are de facto required.
> > Especially those about IOMMU, otherwise it can only possibly work with
> > iommu=3D0 (which I'm not sure if even is enough).
>=20
> Unfortunately with iommu=3D0 Xen doesn't boot at all for me. I see this
> on the console:
>=20
> (XEN) Panic on CPU 0:
> (XEN) FATAL PAGE FAULT
> (XEN) [error_code=3D0011]
> (XEN) Faulting linear address: 00000000328b3a54
>=20
> Not sure what's up with that. Either way, can you post a git branch
> with the remaining patches that are not yet merged in master? Want to
> check if those patches resolve the issue.

I keep it at https://github.com/marmarek/xen/tree/master-xue=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--wKQ1kuJXuD1mREl3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmMif7QACgkQ24/THMrX
1yycgQf/XB3JIiv51Op5svRImHq/K8mrKWMHiQKTcTURs7eW4U2EKizneydQSKLh
z79cRPuVMkqBbiJlYZ/YNzwygUKli0LjTAbtwgzRztnlzzs36Jq+FMN4dbG8J/3X
LnUYmPwF4ql7UZz4NB2RP1l/EMA3j+uEbN4AsWmJGrkEpWJo3M2XVMlXL6etrlgr
kBHTCIliXVFa4YxJYh4o4ivZ80t9X6RWQmUkV2mZky9KG7PEp7ZLI7yIASn0D/ed
cyyrGCcEFFXjbUZws5mKaexBrbVRrXkiGL0pHZHIeHuECD75vnZ4H4lGfRLSFtTk
WTxXmWghOnQ9GIbv9PeeIqgfKj0x+Q==
=LVcj
-----END PGP SIGNATURE-----

--wKQ1kuJXuD1mREl3--

