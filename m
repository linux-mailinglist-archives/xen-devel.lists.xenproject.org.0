Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25205564741
	for <lists+xen-devel@lfdr.de>; Sun,  3 Jul 2022 14:18:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359571.588923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7yXa-0005qz-4e; Sun, 03 Jul 2022 12:17:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359571.588923; Sun, 03 Jul 2022 12:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7yXa-0005oP-1Q; Sun, 03 Jul 2022 12:17:30 +0000
Received: by outflank-mailman (input) for mailman id 359571;
 Sun, 03 Jul 2022 12:17:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bfqh=XI=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1o7yXY-0005oJ-Dg
 for xen-devel@lists.xenproject.org; Sun, 03 Jul 2022 12:17:28 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 174d422f-faca-11ec-bd2d-47488cf2e6aa;
 Sun, 03 Jul 2022 14:17:24 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id EAAF45C0068;
 Sun,  3 Jul 2022 08:17:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 03 Jul 2022 08:17:21 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 3 Jul 2022 08:17:20 -0400 (EDT)
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
X-Inumbo-ID: 174d422f-faca-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1656850641; x=
	1656937041; bh=HUTvfd/IwhhmZ4XeTUjMNu80Hhlx1Y0n9Fzk9Cb4i3c=; b=n
	72JUAfX5Be6kBFRN7WZWf4G5SqonT2Efh9Wlkg5vhvAJm9mr3SU8LSOiQD4zJz+m
	VDz+QimMp6zzg3K8prvHKuFkG5pSlAuJXWcPfoIzuD8QYM6VIf1K1srPgzGZRIoF
	Oh+fwY9VqfIsRxCgRYiV5W8LCgEw3TCwy7gxz8W8Xh5hzQWs33XeJW6oEe5qF+N6
	YEaM4exZ6lzm4xyTwgTDN0k7SawlAbzul2urAVUns43mSLPummq3iFk6rXb13gsM
	qTUFUECuCPW32oG/5XED97q1BYn25/pv6qwQKPI0uUvSvXYRq8H20a4iWZQeodY6
	kqOOG4vW9MS/fMDE3TmCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1656850641; x=1656937041; bh=HUTvfd/IwhhmZ4XeTUjMNu80Hhlx
	1Y0n9Fzk9Cb4i3c=; b=LiefMM+bkjdK2MRzqc5BAtXfOw+UJqhxwdEJs/hNlfdZ
	3ZNLx0KyPiwb5QUcTHkk9FmYD+IE60tTL1UzItWSieHiGKcyVY+7icg1Cwja8GG1
	dCf1UGIxogDXObyTyP8DWPIM15KhTApFhgpip587PgN8xhuJjXNFFjDQTinapN5X
	R1Ezei45UNKjbhQuBx8zRc0wcl/ky0gY6uY3wD02sCG5bdkBEyK1sJ004jZY/F00
	4DEMGpRIHHFIKCrxsvlbQoWyudij98qtCwFnlUtHDmpK7j6H8C/vqDel79eiC5MO
	QPK6AUY7frUnDq6GivC9/y01Hykb1bxmQqxzKnY8zg==
X-ME-Sender: <xms:0YjBYtZbBFsFPos1x3hs9lcWi_N52Ud3Qb7RsLFRHLb0cyfF5gGJ5w>
    <xme:0YjBYkZ6mzBpVSa6UxFbIsR4i9mP5RmACYVSXO73qNM5_tpUOA5msTMPSaOEdQaAW
    o_N3RLwXhva-A>
X-ME-Received: <xmr:0YjBYv9L9sUcceKmJ6pt5be_ALFVcZ81cBoOxXJYVrdysdgUoPG3xm6uo1UJ9MgVx2qwIGNs0BIoTomjecUgfUHlyYWUM45J3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehjedghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:0YjBYrrhHAgkqyDJJ3HDEpjrnJjlgNcWc_-vdO5to7JXdEPz8vq5ow>
    <xmx:0YjBYor81Ab4UO6tmFUMSm8PcHSZ0v41CuX8Xjbx-moQo4o0bPz_Sg>
    <xmx:0YjBYhQfsj92tT4-UUcCauf159e3pFygIdEEdC0Vgz_H8tHaOkVp4g>
    <xmx:0YjBYgIikCg2IIZSa-1ag29OsmrWdR0ctFFhWCd_IZMxXHRLEYd7kA>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 3 Jul 2022 14:17:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Connor Davis <davisc@ainfosec.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Connor Davis <connojdavis@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 01/10] drivers/char: Add support for Xue USB3 debugger
Message-ID: <YsGIzXKPr+j05TC4@mail-itl>
References: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
 <87c73737fe8ec6d9fe31c844b72b6c979b90c25d.1654612169.git-series.marmarek@invisiblethingslab.com>
 <9c7c11f5-be1e-f0ef-0659-48026675ec1a@suse.com>
 <YrM5g3dLRJHTIVYt@mail-itl>
 <8322303f-021a-b520-d2ad-cf8310573df5@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jM+4HfAWoFk3MHCN"
Content-Disposition: inline
In-Reply-To: <8322303f-021a-b520-d2ad-cf8310573df5@suse.com>


--jM+4HfAWoFk3MHCN
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 3 Jul 2022 14:17:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Connor Davis <davisc@ainfosec.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Connor Davis <connojdavis@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 01/10] drivers/char: Add support for Xue USB3 debugger

On Thu, Jun 23, 2022 at 11:29:31AM +0200, Jan Beulich wrote:
> On 22.06.2022 17:47, Marek Marczykowski-G=C3=B3recki wrote:
> > On Wed, Jun 15, 2022 at 04:25:54PM +0200, Jan Beulich wrote:
> >> On 07.06.2022 16:30, Marek Marczykowski-G=C3=B3recki wrote:
> >>> +    memset(xue, 0, sizeof(*xue));
> >>> +
> >>> +    xue->dbc_ctx =3D &ctx;
> >>> +    xue->dbc_erst =3D &erst;
> >>> +    xue->dbc_ering.trb =3D evt_trb;
> >>> +    xue->dbc_oring.trb =3D out_trb;
> >>> +    xue->dbc_iring.trb =3D in_trb;
> >>> +    xue->dbc_owork.buf =3D wrk_buf;
> >>> +    xue->dbc_str =3D str_buf;
> >>
> >> Especially the page-sized entities want allocating dynamically here, as
> >> they won't be needed without the command line option requesting the use
> >> of this driver.
> >=20
> > Are you okay with changing this only in patch 9, where I restructure th=
ose
> > buffers anyway?
>=20
> I'm afraid I'll need to make it to patch 9 to answer this question. If
> suitable dealt with later, I don't see a fundamental problem, as long
> as it's clear then that I will request that this patch be committed in
> a batch with that later one, not in isolation.

This turns out to be rather problematic. xue_uart_init() is called
really early (as it should, to get console as early as possible). It's
before even boot allocator is functioning, so I can't use alloc_boot_pages(=
).
Are there any other options for memory allocations at this point?
We are talking about 58 pages. It isn't much, but isn't exactly nothing
either. Maybe there is way to keep the memory allocated statically as it
is now, but return it to the allocator is xue is _not_ enabled?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--jM+4HfAWoFk3MHCN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLBiM0ACgkQ24/THMrX
1ywdOgf7BcjwoRFajS0dGFPkO0TLRtHXYEvWXvqu7hTxAdCiMcBGdceP1NKAymEX
1uUotWyNAUo84Y01r1iS88IISkAUb/Ndiz80coT1fwUUccfMoRGLrbW0mzc371dk
B9MoatjhrDmkidaa8pkNbeWVOt7qc4q2iK8aFwnmyCf2vKL4bKR92JttwRVvfVsF
CASK3+rtwG7hERWu0GyEThBMWKs+uMibZ8VqnZ+zzV342n5MIwm7JBrs0FM9y8J0
WD4J/m1o5F4xQtt80PEK8dVggrALD/pnR1u9Pq4IlzaswL/0lXmbEq/3rxuPSQ1P
8INy1V7sU35q3OtWGjlOV5GF9+0oKw==
=gblL
-----END PGP SIGNATURE-----

--jM+4HfAWoFk3MHCN--

