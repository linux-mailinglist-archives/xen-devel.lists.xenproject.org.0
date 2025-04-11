Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAC8A85C2D
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 13:47:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947257.1344922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Cqs-0001iu-N3; Fri, 11 Apr 2025 11:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947257.1344922; Fri, 11 Apr 2025 11:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Cqs-0001gk-Jm; Fri, 11 Apr 2025 11:47:18 +0000
Received: by outflank-mailman (input) for mailman id 947257;
 Fri, 11 Apr 2025 11:47:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5hfk=W5=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u3Cqr-0001ge-CJ
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 11:47:17 +0000
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5bd7fc0-16ca-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 13:47:14 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 3004011402F1;
 Fri, 11 Apr 2025 07:47:13 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Fri, 11 Apr 2025 07:47:13 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Apr 2025 07:47:11 -0400 (EDT)
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
X-Inumbo-ID: b5bd7fc0-16ca-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744372033;
	 x=1744458433; bh=dSSGNWTYi5Amp0RGUJoS4RnBo56ASbhWONKglOTaUok=; b=
	Nf3kXbHpyhqOoMIfRJkdB7od12LGUEz/06ez4xKl2R2HHtYVqXPvrOj1sGjZIdFQ
	PAXkFz/nzDtm1RyPtWK1DA/DPDrd7w3XxdnUkBosdjcKkMufLagrCQDLpTo/KS+M
	/eVGfC71lC0qEhNR+XVPo3acbvgk2UB+otaPC5b2U/MMZP4Vg1cpjvBT4M98bnDr
	/W+UAG/GS1uKQfr/WL3Qs62BlLlhAHhO37IH6qdFod8IKeYA9GeHz2h2HG/vwdu3
	VF6Ny9xvX5LMXHbr6Je3Rv6aLXL2cIBtNSUDccj5l9I8ntuPnxO8l9JBy3NKX2xh
	Cv6OEI5+0JUq/t9HSOwu7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744372033; x=1744458433; bh=dSSGNWTYi5Amp0RGUJoS4RnBo56ASbhWONK
	glOTaUok=; b=OYJngNhUw0zOH2GKFYg3meCuwL3PZKXB33M3nA0C3ul+3Xr+gFt
	kZ9T+ZbKqFvkx3JDscTnpnDCmP0KmKT+gqimiks0WvWQAEy+NL/+WkXyxwjJBY2V
	Od8nU0JtReX2EswxNnHRUenJu4RZT3ynezQHgg3dIjbwejTyQyDD2koUSVjUJR1o
	yH4YbvHJ2GYy/3F0l+aY2/Q44NzHIC31Dy3VNItwpZHiM/WSWzuURb7C2dyHlL3v
	nWNqMVTAPlw+5fdV47rlSV3fCRp/YDns4gmiAJYHzNOOw2McWVbFt0ySMHf5Bvge
	qK0ziXQ5ghtqeKIMPbnO6nyi1YVei9EPHLw==
X-ME-Sender: <xms:QAH5ZzMRA4ZYqdIYeKsK1jrOvuSDD7EPsPik9DIHjlPlcRHj_QlqQQ>
    <xme:QAH5Z99AvC3fStkbt-NT-ecyuyphb8IC0PH2t6u_10gx_J-3UMk46UH-ZPpiYLldJ
    wVdZ-iU5lEEMw>
X-ME-Received: <xmr:QAH5ZyRRZMKX7ux5fJ_utvV97JEASn3jS7b99Q9Pjgwxnlhpyr6XRv2JFZMiIjt1WOuWRwfmb3cUvUNvfPVe1XJXbGqHem4LKg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddujedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepveeujeetgeelleetudeuvefhtefgffejvedtvdfgieevheethe
    elgeeuledvjeevnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeeipdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghith
    hrihigrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhp
    rhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhhohhnhidrphgvrhgrrhgusehvrg
    htvghsrdhtvggthhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehmihgthhgrlhdrohhriigvlhesrghmugdrtghomhdprhgtph
    htthhopegtrghrughovgestggrrhguohgvrdgtohhm
X-ME-Proxy: <xmx:QAH5Z3tQsC8HuN6cv3cel3sInapBqRFA_2MtLqxXNSPImnwUX1XjVg>
    <xmx:QAH5Z7eKCM4F2ImnyzE_5kDCCzOwzpHA7MZaIDMQIXeRWZu9DW7PbA>
    <xmx:QAH5Zz0W3nk31nWR2p2jw4ljLPDnYWgI5a03JtdBSJnVA5mULllbcA>
    <xmx:QAH5Z3_XY0RjU0mW448PKznHWjRl7rw6GB7geImSo-9cKR0mc6DeyQ>
    <xmx:QQH5Z3wZJ_tLYK0jPgrBzR_0BjNMchTGJAP6UaaXY-HajTUAq926CPI0>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 11 Apr 2025 13:47:09 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 1/3] Rework rootfs generation to make a cpio archive
Message-ID: <Z_kBPfXvxDozbMNk@mail-itl>
References: <20250411105217.2141356-1-andrew.cooper3@citrix.com>
 <20250411105217.2141356-2-andrew.cooper3@citrix.com>
 <Z_j3wXtigDHb6i6P@mail-itl>
 <de67e64b-beb8-4fb0-8ad2-323ff8ef53f9@citrix.com>
 <7dd33457-f748-45b5-b885-eb451bdab9e9@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GOzWiEBF/ewuh7t8"
Content-Disposition: inline
In-Reply-To: <7dd33457-f748-45b5-b885-eb451bdab9e9@citrix.com>


--GOzWiEBF/ewuh7t8
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Apr 2025 13:47:09 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 1/3] Rework rootfs generation to make a cpio archive

On Fri, Apr 11, 2025 at 12:33:50PM +0100, Andrew Cooper wrote:
> On 11/04/2025 12:09 pm, Andrew Cooper wrote:
> > On 11/04/2025 12:06 pm, Marek Marczykowski-G=C3=B3recki wrote:
> >> On Fri, Apr 11, 2025 at 11:52:15AM +0100, Andrew Cooper wrote:
> >>> +        find $PATHS | cpio -o -H newc | gzip > "${COPYDIR}/rootfs.cp=
io.gz"
> >>> +
> >>> +        # Print the contents for the build log
> >>> +        zcat "${COPYDIR}/rootfs.cpio.gz" | cpio -tv
> >> add 'v' to cpio above instead?
> > Oh, of course.=C2=A0 There's another instance of this pattern in argo, =
which
> > I'll fix up too.
>=20
> Apparently not.=C2=A0
> https://gitlab.com/xen-project/hardware/test-artifacts/-/jobs/9695952322
>=20
> I expect the -v is getting swallowed by the pipe.

Great, busybox's cpio prints it to stdout instead of stderr (as normal
cpio do)...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--GOzWiEBF/ewuh7t8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf5AT0ACgkQ24/THMrX
1yxZXwf/dQuQS3Ti0q+wd/F4/rohjYmWHaZvbzCHUa2bxqTePXDXXUZ/rNeY3dMb
k3fXYDF/X4jc+qXxDLEcFFUar/TQ9BCYxHjalnDcKfM1smi6zouTM+oyyVg9iHMu
FOcS/TdJa3CMbc7nSAKp9locxWpzGcIQgzCUzPbDeZpKKvjoFTEgLKrFUp/YeKo/
B9nfaXIUvBuzlB1T/zoXI6QbAcmjgCJGc0+bqNDqEf6avBU/B4LubkHo4J5AAXld
dJm5P4PfWL0N1fzw58dc+Pr3fuYrMtY1m42EW1lld2gMcTonFcIJrYs2wqAzeEEX
Nt9w9ZIz8h8yedanyoLznpoBEOSMUA==
=hbqr
-----END PGP SIGNATURE-----

--GOzWiEBF/ewuh7t8--

