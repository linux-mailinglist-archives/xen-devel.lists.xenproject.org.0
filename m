Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02158AD39E7
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:49:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010968.1389231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOzLr-0001vm-3q; Tue, 10 Jun 2025 13:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010968.1389231; Tue, 10 Jun 2025 13:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOzLr-0001tW-0c; Tue, 10 Jun 2025 13:49:19 +0000
Received: by outflank-mailman (input) for mailman id 1010968;
 Tue, 10 Jun 2025 13:49:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fiUs=YZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uOzLq-0001tL-HB
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:49:18 +0000
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0e14173-4601-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 15:49:13 +0200 (CEST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id E56042540108;
 Tue, 10 Jun 2025 09:49:11 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Tue, 10 Jun 2025 09:49:12 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Jun 2025 09:49:10 -0400 (EDT)
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
X-Inumbo-ID: b0e14173-4601-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1749563351;
	 x=1749649751; bh=Bx0FUwl99RzMl79cCwMd39gQYljvINpdxyewwdtObUc=; b=
	BGD2TPDEXDGvnHAfPFleIIPVdX9t9/hzzAtkVJ5eyFCRAEG7xuIgE49aknoXYFb3
	fppUKFiZsM+rVoWEWd4hj3h+UKD7Q1zuTNRECkGx8OSHJ51AWFqL/987pmOEEUrG
	SoauxnenvwfaiFBKHnFeemT9w4Rz1COPBNApM4vh9ga7sSYnFjXsD3bfHE6ONFJn
	GkQu42mx6Bs+/xwhiP7eT3d60nKY9UkaZ9GtYLUzyQi/27goBaCaaR3v2YciDy0h
	tPswEKwGu4mJyFN5oPhA5fWgVn4cb/Vd+kQ4Fv+rZHXDxRzAL+fR96oeF91i1Hez
	wGZM3GhyKKw8IJilgHYozg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749563351; x=1749649751; bh=Bx0FUwl99RzMl79cCwMd39gQYljvINpdxye
	wwdtObUc=; b=KJQWG9mcHQRk/OwbOUWN+wVbbW1ujgbHB4iQTi5Cxc0dYgVqRAA
	29Q8LfF34GFUAC/7YriJsSM7YYsO12zaGiVrCBVciPBtUzTEApTuDNF9fm25Aoy6
	dqe7Wfqv5gHrACnaTON5LmImS49AcJxsv9L97safjBwMG2gu652eAc/sL4xaEiiV
	cfYDCGsaifaTIJENJQnVjBSWPEJ11IqRNvAmFYvAd9gAN9KfdZdAdN6Gulx1gVNB
	h1efdXGyIjjXTXcgX3Xp6LgAiFfdj4cyF7FdBrZBIjOUF++DWt/zOylx5EASWnS0
	uf8PxOAQRD4M5lye9d9ats/KzmwZgsHBjmQ==
X-ME-Sender: <xms:1zdIaG4PZ1gRTFXhSg7-Y-IrYLt2oZbCFmE_InktdrmVdovH8k8LFQ>
    <xme:1zdIaP6BHCE1LszskidtuCP_sCp4gbhGvlEUpE_tfAGAUJCQY4rp_uksSpA3fxatN
    H3bqxwapEo8Fw>
X-ME-Received: <xmr:1zdIaFfldced5HJ226TPrM1trvcsKneza4Qg3OdCLcnb2hPnOHRxEkNtwSG6jHzi2ZlfRdWA9RRTjMjzo7_J-Y21AJJSAHmnmcg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutdekvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpeeileduvdekjeeukefhffetgeefiefffeejjedvieejvdfgjeehte
    duvdekffduieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepkedpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprh
    gtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghp
    thhtoheprghnthhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthhdprhgtphhtth
    hopehmihgthhgrlhdrohhriigvlhesrghmugdrtghomhdprhgtphhtthhopehjuhhlihgv
    nhesgigvnhdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtg
    homhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:1zdIaDI8VvxKjxAusRuTFL31YjRNNrIbz6ojLh1k19RjogTRf_3hPw>
    <xmx:1zdIaKJRKAH0bj8uxnZ20VQWOswR3PKTqSF29XpnxFizvF9ahabFrQ>
    <xmx:1zdIaEzqwPU6B1raXVvntV5BF3qdIOx7veLGZv48LVbVhRbVuF1aSA>
    <xmx:1zdIaOKbUU5giFoiJkkbklwt8LFAS0cNAf-m4Ad7-uw5JL0KLpgseQ>
    <xmx:1zdIaKdXJ_fti1c9Ce4kh40q1RqCy4-knHBJZPP9LiOKnW9LCJv5I-vT>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 10 Jun 2025 15:49:08 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 5/5] console: support multiple serial console
 simultaneously
Message-ID: <aEg31IPOTifE8Yir@mail-itl>
References: <cover.defc562b917978814c8359bbd04f1dadba33fb77.1748182535.git-series.marmarek@invisiblethingslab.com>
 <98ff383ff2ee3dc162b2d12afaea2b3f1406d99e.1748182535.git-series.marmarek@invisiblethingslab.com>
 <cc661b69-9260-405c-b421-a75bdc8166af@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9KaVgZv5yGFTqEhj"
Content-Disposition: inline
In-Reply-To: <cc661b69-9260-405c-b421-a75bdc8166af@suse.com>


--9KaVgZv5yGFTqEhj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Jun 2025 15:49:08 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 5/5] console: support multiple serial console
 simultaneously

On Tue, Jun 10, 2025 at 02:48:54PM +0200, Jan Beulich wrote:
> On 25.05.2025 16:15, Marek Marczykowski-G=C3=B3recki wrote:
> > Previously only one serial console was supported at the same time. Using
> > console=3Dcom1,dbgp,vga silently ignored all but last serial console (in
> > this case: only dbgp and vga were active).
> >=20
> > Fix this by storing not a single sercon_handle, but an array of them, up
> > to MAX_SERCONS entries. The value of MAX_SERCONS can be chosen in
> > kconfig, the default (4) is arbitrary, inspired by the number of
> > SERHND_IDX values.
> >=20
> > Make console_steal() aware of multiple consoles too. It can now either
> > steal output from specific console (for gdbstub), or from all of them at
> > once (for console suspend).
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > This was posted before as part of initial xhci console submission, it
> > reached v6 (but last changes were in v4), but wasn't considered useful
> > enough to review/ack:
> > https://lore.kernel.org/xen-devel/Yu0XHUhsebE+WG0g@mail-itl/
> >=20
> > Since I needed this feature again, to debug xhci console issue, I'm
> > including this patch again in the series.
>=20
> Beyond this narrow aspect, has anything changed in the picture, compared
> to what was said / discussed earlier on?

Not really. It's still quite useful for people doing console drivers
debugging and have the luxury of having many options at the same time.
For me it's xhci, but it could be useful also for debugging other
drivers (outside of x86 too). And it's still not very useful for anybody
else.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--9KaVgZv5yGFTqEhj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhIN9QACgkQ24/THMrX
1yxlZgf7Bm4HqeqtUWNtK+kGyetDUvfI0/l7AKgJoun+pbiF/UEVqipHqc62V8kv
QGrom1xdU19KMccG8RkkbfgO3DzuUlbUnllrwsGYqXzN+IUK36czVC0lUf/8ZL50
KovPtJj28PEfpUj88afpW7DjpEuE3T8uZC81tVrLVXkvjCRY6E9Pf3KsuexwlS0h
9CgYui1AOjxYGn2xgnJi9l2hqtytIP0WXyXqLUC2A/QNK5ANGQD16fT9qm77Sa1p
743g46K04iTwIcwzTtGJ23/AxS0prgVjaoHf2v3TM0zy4Dt5FA6XimNS0G08w1Dp
rkO3l+3+DCfT18/b4Bqn0YwlfHgOQw==
=7/9b
-----END PGP SIGNATURE-----

--9KaVgZv5yGFTqEhj--

