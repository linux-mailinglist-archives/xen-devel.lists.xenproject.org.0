Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F636AE477
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 16:21:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507505.781092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZ86-0002fq-7N; Tue, 07 Mar 2023 15:21:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507505.781092; Tue, 07 Mar 2023 15:21:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZ86-0002dW-3x; Tue, 07 Mar 2023 15:21:30 +0000
Received: by outflank-mailman (input) for mailman id 507505;
 Tue, 07 Mar 2023 15:21:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bbCp=67=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pZZ84-0002dQ-Kk
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 15:21:28 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b89f5b8b-bcfb-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 16:21:26 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 10CB43200912;
 Tue,  7 Mar 2023 10:21:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 07 Mar 2023 10:21:22 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Mar 2023 10:21:20 -0500 (EST)
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
X-Inumbo-ID: b89f5b8b-bcfb-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1678202481; x=1678288881; bh=zQByrxCmOalTEwZf09f5Lw3PO5cSPCbHeH3
	/8l9yHkw=; b=La9sa7hO9YQd/ZqQ1sMGgeVS/jBC/IrkWpFkXwP3jbAcc3QbMME
	bckT7S552kRbQzZEAoq01qn5qsL1O0cnBla7sBL2y8/zcTWHHbZIBTFad/hwRaTP
	X1BccRwrzpz4AlYoCkxqha7KhD5lvMKSqlphKKgTBi+8qu9Vi2kKQEpOX3UHgK8W
	kvKThNGOcH1qUm8//bwtdMMb8Q752wpKXDd9jqWS539O6E4nzvHoFIiiGpaIQlM6
	mfQEVX72cVSoDsG4pp8Ig5Xr0kXQhK/0ruGIorvElVju9/A+u4aWiG06AYwDlROG
	48oiAnhAzcS+8lTmGQVCkFZCnVeeu13EQiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1678202481; x=1678288881; bh=zQByrxCmOalTE
	wZf09f5Lw3PO5cSPCbHeH3/8l9yHkw=; b=ZZ+10uK7jJdr0PlHCMyoEA5tysvzH
	S0KS0Ifh4iZVYReWoNWnsZwtWDIJ2sdieVYqsfYSKqhIiWeLFjv91/G9ByBHfLO6
	vN4wE/GOB/Gxo91AqkJygaLjBQF2ShqH4qITqJXmYj9Uu6OoH4pX6gfx7C2uKqGC
	lyVnS13BpCXsAN5MpVSWPMUTsIvRNDaXQv3rMZHgMlzEwHw7J+g+i6m+UxzUxhgg
	f4pKSE7JzaSwv1dd2RZtySt4u4DVFI15c3eisRkKCI7rnGx9zfbmQFE3zBKv9xz6
	lREz6aIPfFyuVY2YRDkC+twh8fukfL6XBeOQQhkVW4mhuSjbwkCbfSpGA==
X-ME-Sender: <xms:cVYHZB7mABOxiI6ReXy1EjniIfwpuyLpE6KhuOz0TNRmBa7szeZZLA>
    <xme:cVYHZO4Kv1W2X8Q5dSHceQWmuNbYatkNVaAvRQ3Uc_LYLzmUyPsJNd4d-X5gmSWGe
    tQu1oYHHuUSNw>
X-ME-Received: <xmr:cVYHZIfT8ZTSYrXUzuLWd6md7unOYIVPAS-e9lK950nWse_MkpsJoQn9qcEsZ-zaW_z6VIAbU-rbaY00u-x5vnL99aAsKc5KJcY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddutddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepveeu
    jeetgeelleetudeuvefhtefgffejvedtvdfgieevheetheelgeeuledvjeevnecuffhomh
    grihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:cVYHZKLGWQZx6L0geh1UD7GQqAqiSJkzK92QKBVFqleaNAsEJACK6A>
    <xmx:cVYHZFLjSjLEVB0v7laokORmcOSnSTVVhOwXaGyld_GIWMARyJQvDg>
    <xmx:cVYHZDwSnd5XPVN13fZz-OLFrldKGywcQ2wgy7RveaCxqJKBU8kgQQ>
    <xmx:cVYHZF0D5wyaUZ5vW7WxbiAIqYcUS_z5CRmxsfER-pXgF7MR73Hn9A>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 7 Mar 2023 16:21:17 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org, cardoe@cardoe.com,
	michal.orzel@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH v2 2/2] automation: introduce a dom0less test run on
 Xilinx hardware
Message-ID: <ZAdWbrW74dcPYhnM@mail-itl>
References: <alpine.DEB.2.22.394.2303031554080.863724@ubuntu-linux-20-04-desktop>
 <20230303235719.1181690-2-sstabellini@kernel.org>
 <290dec66-c5a5-0609-f95f-7e3bcfd3fc94@citrix.com>
 <alpine.DEB.2.22.394.2303061450530.863724@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J4X/aXPpLIykDIn/"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2303061450530.863724@ubuntu-linux-20-04-desktop>


--J4X/aXPpLIykDIn/
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 7 Mar 2023 16:21:17 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org, cardoe@cardoe.com,
	michal.orzel@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH v2 2/2] automation: introduce a dom0less test run on
 Xilinx hardware

On Mon, Mar 06, 2023 at 03:02:51PM -0800, Stefano Stabellini wrote:
> On Mon, 6 Mar 2023, Andrew Cooper wrote:
> > On 03/03/2023 11:57 pm, Stefano Stabellini wrote:
> > > +  only:
> > > +    variables:
> > > +      - $XILINX_JOBS =3D=3D "true" && $CI_COMMIT_REF_PROTECTED =3D=
=3D "true"
> >=20
> > We don't want to protect every branch of a tree that only a select
> > number of people can push to,
>=20
> Actually this is useful, more on this below
>=20
>=20
> > nor (for this, or others configured with
> > the runner), want to impose branching conventions on them.
> >=20
> > In all anticipated cases, those able to push would also be able to
> > reconfigure the protected-ness of branches, so this doesn't gain us any
> > security I don't think, but it certainly puts more hoops in the way to
> > be jumped through.
>=20
> It is true that it adds a small inconvenience to the user, but I think
> the benefits outweigh the inconvenience at the moment (that could change
> though.)
>=20
> With this, I can register the gitlab runner with a specific gitlab
> project (for instance
> https://gitlab.com/xen-project/people/sstabellini/xen) then I can mark
> all branches as "protected" and select very specific access permissions,
> e.g. I can give individual access to Julien, Bertrand, Michal, anyone,
> to specific branches, which is great to allow them to run individual
> pre-commit tests permanently or temporarily.
>=20
> I couldn't find another way to do it at the moment, as non-protected
> branches don't come with detailed access permissions. But it is possible
> that as we setup a new sub-group under https://gitlab.com/xen-project
> for people with access to the runner, then we might be able to remove
> this restriction because it becomes unnecessary. We can remove the
> protected check at that point.

You can configure runner to run only jobs from protected branches. This
way it actually prevent running jobs from non-protected branches. Just a
condition in .gitlab-ci.yml can be simply removed by anybody who wants
to abuse your runner (and have push access to non-protected branch -
which may or may not include all of patchew).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--J4X/aXPpLIykDIn/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQHVm0ACgkQ24/THMrX
1yw4/Qf+MtuO1mgjQ9Rt2N2y+xm6qyz2166Cp3LW1JsbDyY7jBDjXymWk2V07R1I
OEtRozoVY7K0Za24WXW9eI+GCm7OBEAjvZOj6zDwpzQp/lrwDE6elS7ElqVz8ybP
2Su7myk+lKR5eWbq8VFMNVcUyWyFaYsXqE/4O8GJIbbS/4HiRylnL8IrdmhI5zkY
wqexiZCQbHxf12oNngaLnqXtOAcbf7qT5zHS2tajZTHmwhr+5orNi4r7g6GLh++2
UoAu+TwpwP4luBmeMcn49Jmftx9cAmLe09HCsriffsRC41NF8yzTR5bI/BvyNtjf
ewcBrFqtoGNn0mHAENHom1cMk+5hOA==
=J9WM
-----END PGP SIGNATURE-----

--J4X/aXPpLIykDIn/--

