Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 288A696F18F
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 12:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791699.1201660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smWGO-0002mY-9V; Fri, 06 Sep 2024 10:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791699.1201660; Fri, 06 Sep 2024 10:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smWGO-0002l2-6m; Fri, 06 Sep 2024 10:32:24 +0000
Received: by outflank-mailman (input) for mailman id 791699;
 Fri, 06 Sep 2024 10:32:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sAWr=QE=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1smWGM-0002kw-9t
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 10:32:22 +0000
Received: from fhigh4-smtp.messagingengine.com
 (fhigh4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4acdff6f-6c3b-11ef-a0b4-8be0dac302b0;
 Fri, 06 Sep 2024 12:32:19 +0200 (CEST)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 1CA1411401F0;
 Fri,  6 Sep 2024 06:32:18 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-08.internal (MEProxy); Fri, 06 Sep 2024 06:32:18 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Sep 2024 06:32:16 -0400 (EDT)
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
X-Inumbo-ID: 4acdff6f-6c3b-11ef-a0b4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1725618738;
	 x=1725705138; bh=sunZvbMqIohRlTYcbhUgPXkWn9BZlJ0wqbqCfCwuRhU=; b=
	j/ZHKDZUbfsLy9FCdDaOr4sPNl2y+NdI7Q68yqD3VXiL01IGxMl3wDByE45XB/tF
	3RNpls7Rhp7oAK/zD5GD7i+hTnh1wQ9O+MaQuJdevZlU3ckY9amFslQvKcvjXm3m
	Wo71QePoRXsihbJdJl2k41NEgeI0ij8ZHihhDzSrmpkLoM0j5Lnjsuhm9OEbKXQF
	AWkPXxz0eWtO0EljJrGGnCp4qgFNusZYJCMPr9AgbcTNU4PJAS/gOhfCf1NUERzb
	te6tHZ+HrVoBWfazt8vHp5DCuLKEp7VomxKDwsDEvMkIK6cj5aBPt2JiI6/gVUZQ
	e9ahgSFDzFLPgDnj8LzFRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1725618738; x=1725705138; bh=sunZvbMqIohRlTYcbhUgPXkWn9BZ
	lJ0wqbqCfCwuRhU=; b=n85pCENJPT76mRZyI7rVTUVH9Ov2HVdLARd42CkQvdCR
	hXLPyZn0qA5BEquyST6nQpDttqdSqqLGuQltdYE6/po9eDxxs47wrFbZoGh01j6O
	3dBtzFHhuAOnv4IT4accjUxD3E8ZDwlMEzR/1dH7bCIRRMkUgx13UN/Dd/Y9SSPU
	xPD+D0Z6dREUTwwaMBUm6gHAyEIR4LpOvwnG0LQQAbz97N7wxcPncSVAqCF9QCfU
	XZFzo38uWDmzdJKptdEB+zPZO0VByO/BrLicHwS07UgA4H3Sf/EqytM2TuRPhdWW
	NaDoNqI1dECWJzNZiWkF3CUi2E594npznlq3lZ9N7w==
X-ME-Sender: <xms:MdraZqElCfQHPD3KIEH2SVKeWbTZQJEOMqg-dSolDkNnqpVO46pKKw>
    <xme:MdraZrXHFbZK8yP_Oqr_l3ddh6Pr_VgK8dbe7o86ciNw6ZMCDENUNbRl47Esqf7zx
    cWvuSSHpIyHYA>
X-ME-Received: <xmr:MdraZkL-7iBp657SCfmZT9NgAoUNFEzTmQcob8sFZz43YsCXaprBRh7gePy0SR3OYaxT00Gu_aE3u1_Fb07__bJ_yWRM_qHaHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeiuddgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhgvghhr
    vghsshhiohhnsheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopeigvghnqd
    guvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehj
    ghhrohhsshesshhushgvrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepohhlvghkshgrnhgurhgpthihshhhtghhvghn
    khhosegvphgrmhdrtghomh
X-ME-Proxy: <xmx:MdraZkH67KMby1AZVAoFVcjeONcFke51qe6UdNP2h_KYNVOud-6zLQ>
    <xmx:MtraZgW47ALQqJtgK-OdSTBsQmqat-5BEznDcTgr7qA4U-Ouuf7AYQ>
    <xmx:MtraZnN0oWfNo216akQRSPRoNcOK7iaCvhatzTW1GGgMiV5k2VaggA>
    <xmx:MtraZn14_7So3aN6wwOxXO5i8_NgMSV2RMt-DqzJSkiukHtGTPng3g>
    <xmx:MtraZuy5xmLvWbp3dMElUAHsyT5FBIlRqArAumN1r9MIdtiTHC3C5QKo>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 6 Sep 2024 12:32:12 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [REGRESSION] kernel NULL pointer dereference in xen-balloon with
 mem hotplug
Message-ID: <ZtraL9XT7X1LG6gI@mail-itl>
References: <ZrSecpuTN9zgtqYu@mail-itl>
 <8e3afa4a-aca2-4803-886d-e162eb5e0478@leemhuis.info>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gFiQE58+i/FnxuLU"
Content-Disposition: inline
In-Reply-To: <8e3afa4a-aca2-4803-886d-e162eb5e0478@leemhuis.info>


--gFiQE58+i/FnxuLU
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 6 Sep 2024 12:32:12 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [REGRESSION] kernel NULL pointer dereference in xen-balloon with
 mem hotplug

On Fri, Sep 06, 2024 at 12:30:03PM +0200, Linux regression tracking (Thorst=
en Leemhuis) wrote:
> On 08.08.24 12:31, Marek Marczykowski-G=C3=B3recki wrote:
> >=20
> > When testing Linux 6.11-rc2, I've got the crash like below. It's a PVH
> > guest started with 400MB memory, and then extended via mem hotplug (I
> > don't know to what exact size it was at this time, but up to 4GB), it
> > was quite early in the domU boot process, I suspect it could be the
> > first mem hotplug even happening there.
> > Unfortunately I don't have reliable reproducer, it crashed only once
> > over several test runs. I don't remember seeing such crash before, so it
> > looks like a regression in 6.11. I'm not sure if that matters, but it's
> > on ADL, very similar to the qubes-hw2 gitlab runner.
>=20
> Marek, did this happen again or do things appear to be resolved? Asking
> because I'm tracking this as a regression.

I haven't investigated it more, and also haven't ran any later tests on
6.11, so I don't know if it's still there, but I suspect it might be.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--gFiQE58+i/FnxuLU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmba2i4ACgkQ24/THMrX
1yxL/AgAgXVJ3sYbrGKzil07rR/rD5O4DQoaMbdeNeSPV641VkUjSyxCLPS72L+r
//37mRrxe+/Lw1CtWGJcqt6sbOFlLLvp/0S5n37CvVMWD84jA8R3OCl6Yr0btMgK
ZOnxUfecgpbok4aWZgDQgTO0H4WYJZJA2j0QpQzUrBvjthPppU6On7/LGV3Fx/kb
Kl0n4bavC26DuTJKJQlaXRfu22esNNq6neUWF7rMw2TCPXPFXSDXdIydMPybgOuM
Qld3wlDwdHXTWnTKnQFa9YEwwD+vktlHHHWb/2D+WHtgYSjz56t7R50suAFflTme
xEeIhlqXsJ3pTlMpMjjlU7Pk3kfn8w==
=RMlY
-----END PGP SIGNATURE-----

--gFiQE58+i/FnxuLU--

