Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F37ACF3C1
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 18:08:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007165.1386477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uND95-0006vj-6o; Thu, 05 Jun 2025 16:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007165.1386477; Thu, 05 Jun 2025 16:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uND95-0006sc-3L; Thu, 05 Jun 2025 16:08:47 +0000
Received: by outflank-mailman (input) for mailman id 1007165;
 Thu, 05 Jun 2025 16:08:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B23G=YU=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uND93-0006sW-55
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 16:08:45 +0000
Received: from fhigh-a7-smtp.messagingengine.com
 (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 572efe1b-4227-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 18:08:39 +0200 (CEST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id B5AA9114013C;
 Thu,  5 Jun 2025 12:08:37 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Thu, 05 Jun 2025 12:08:37 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Jun 2025 12:08:35 -0400 (EDT)
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
X-Inumbo-ID: 572efe1b-4227-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1749139717;
	 x=1749226117; bh=89STe5fw1aNVbaA6KjPAdtlHp3gpOhHgWSnH4egnfqI=; b=
	Tj1hUyVjYFuFXISRUW+UKKoDCQ9wHqlzGxqrNw7+i2gx4d2qgaiRXno4JMdMxq+U
	SqC3pxn7/0jOKrkIU6DV2z5kBM/xADfsvVxQW74JEzV8dlQAy1aj/9q1jvjI/qIF
	+KPyDzrY1zQnsV2OnHIwAeV+Uln8gw3+fHlys9fC/b37cY/aCGL+mdhQfu10kv9P
	+AmSxFTOe7Wla4afZ4d3wWH8jqTWo4qur6cFddEWDoiissnHJHNZSOciHqJ+2WhF
	QuOVq2laMNZ3gkGxd05jVrUDBMz2IIrSU9c3BR6/PJCiM0TJhBWmauduT23bLWql
	Wpav1Q5xB3iJic0h/mZ5vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749139717; x=1749226117; bh=89STe5fw1aNVbaA6KjPAdtlHp3gpOhHgWSn
	H4egnfqI=; b=kGtjrsIWXLUMadpb64p+MAYQ7jwHuA+g1U1cRHs/Vsren66qAZK
	IuDsFQXkkeRPkzzkBFqtAyrUdEw0MWguHfaHp5hl845s+haQxRKkRqyfxN8yheJX
	p3cth+va1uavwmqsmADJiaeOWLqwEnfK/RAjEmETIBYI9YiyxkNXeGIzy3RYN6aC
	8Rnn2wzC1jVDAh/dcdezB8T5k+9yg7l1aH4njsA94U6rgNKQxUaWQ1TZr+Ui/J4j
	NlgUxIDfXs6FUSP8Ko7o39UnQAwxdWXOReEfzy3eYjvY+XrbEukBTaF5PCVLwHS1
	OrSfo87ulUCES9uBEDib6pNvwRaptC/256g==
X-ME-Sender: <xms:BcFBaKpJuXynrF0aKOa3uxwtSG1SGbVnnX_5asQVeg51fXO175a7gg>
    <xme:BcFBaIo1wS-vdMqMurSuXhViXEp690CTQL3wk21AXlublywnGQf7m3Zhzxez5H-hJ
    VnZy75s6ri2ag>
X-ME-Received: <xmr:BcFBaPMf9ukOXzMG6vQDHw-d0L3ylbtFQNa8bU58q2orgTD0FklXv6q440HTQo857kp56_pmy9qpfCUizWzPRyyYNYCBB9XY-9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdefkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghu
    lhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsth
    hsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegt
    ihhtrhhigidrtghomhdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrth
    gvshdrthgvtghhpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgurdgtohhm
    pdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpthhtohepshhsthgrsg
    gvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohho
    phgvrhefsegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:BcFBaJ5YZzHwq-1KnBsO7u51mZFz2Ff2kdGosXS_ed0HnYKiAiS92A>
    <xmx:BcFBaJ5zitSyQYe5yAJZJ67YzIfq24yM9mwzohRfM5xiwHLdHbLAMQ>
    <xmx:BcFBaJjKYf1RO1DwnK0M12Og1ja-jc4x3rqQONp-OIyZ_RVxjb_phw>
    <xmx:BcFBaD5kZcXjBneoe-KdJNgLm-ieZd4-hPYVcLIcj_DAEinmo_MWdA>
    <xmx:BcFBaDvrXr4kXS8xeIZn8VwHv4tq08vVBz2RZb676o1mRj5R-SCjNrH->
Feedback-ID: i1568416f:Fastmail
Date: Thu, 5 Jun 2025 18:08:33 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1 1/5] console: add relocation hook
Message-ID: <aEHBAsLFvZni1_5Y@mail-itl>
References: <cover.defc562b917978814c8359bbd04f1dadba33fb77.1748182535.git-series.marmarek@invisiblethingslab.com>
 <4f1889dc03ec4aa2cc0cd2bd14523a2c6f670bdb.1748182535.git-series.marmarek@invisiblethingslab.com>
 <0b17da9c-57db-4a8b-90af-e53e45cb1243@citrix.com>
 <aDSLNeFRZWoxMTEt@mail-itl>
 <66cfdee6-5dc2-4139-8550-ef441fa7a7a0@suse.com>
 <aEGu6-6dGqc_WUlg@mail-itl>
 <ea285192-c39c-43b4-a879-7ca4ff7f9b4a@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s1Rvo7knGHNqT0rK"
Content-Disposition: inline
In-Reply-To: <ea285192-c39c-43b4-a879-7ca4ff7f9b4a@suse.com>


--s1Rvo7knGHNqT0rK
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 5 Jun 2025 18:08:33 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1 1/5] console: add relocation hook

On Thu, Jun 05, 2025 at 06:05:02PM +0200, Jan Beulich wrote:
> On 05.06.2025 16:51, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Jun 05, 2025 at 04:42:53PM +0200, Jan Beulich wrote:
> >> Why is it that this ring is dependent upon Xen's position? If the ring=
 was
> >> dynamically allocated, it wouldn't change position when Xen is moved.
> >=20
> > The console is setup quite early, I don't think I can allocate memory at
> > this stage, no?
>=20
> But you allocate before Xen is moved, I suppose.

Well, I have those buffers in BSS exactly to avoid the need to allocate
them (or rather: have bootloader allocate them for me).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--s1Rvo7knGHNqT0rK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhBwQIACgkQ24/THMrX
1ywW5wf/Sclq4O4yTiinMcc8gjohwtODTH28YG7DrzS1Pe7b8drGVY4hJVEoHq5b
hKJahZByn1jrT3+MfexUwal62m2bBjbKV7hu9RtXTy17T2ulMt2Idf57jhC0athj
eor514yIuBcsFMihLjYoTQc8k/O8nFYYwJv/6HG7ON1WzcZMmn1cwpHnrMYD6p0s
pm9GK9jDbqbIruzfJsmjntK+QMkcnKGt1B+xM/n+CHf3UBJXfuTD31LiVSKFCMBG
BJEQhPStaX0MH0uYW6uV/M7I4gyHlzx+n6FPu7WXVpkbC5hwV/WaYItdSz05G2kT
D0rnaxeWfIWErAHOp3gGvAfW2mtQfw==
=Anx9
-----END PGP SIGNATURE-----

--s1Rvo7knGHNqT0rK--

