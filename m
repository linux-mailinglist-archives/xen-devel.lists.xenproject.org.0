Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1946AA914E
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 12:41:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975970.1363244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBtFQ-0001GR-3f; Mon, 05 May 2025 10:40:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975970.1363244; Mon, 05 May 2025 10:40:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBtFQ-0001Dt-0v; Mon, 05 May 2025 10:40:32 +0000
Received: by outflank-mailman (input) for mailman id 975970;
 Mon, 05 May 2025 10:40:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lLXC=XV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uBtFN-0001Dn-TO
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 10:40:30 +0000
Received: from fout-a2-smtp.messagingengine.com
 (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59fde89b-299d-11f0-9ffb-bf95429c2676;
 Mon, 05 May 2025 12:40:25 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfout.phl.internal (Postfix) with ESMTP id B63CA13808CB;
 Mon,  5 May 2025 06:40:23 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Mon, 05 May 2025 06:40:23 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 May 2025 06:40:22 -0400 (EDT)
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
X-Inumbo-ID: 59fde89b-299d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1746441623;
	 x=1746528023; bh=29Ps2y4SaSAbFjQ5BF2wB8HEg3NPVt1KQ5XXQkA+MLs=; b=
	lTrohVdRcmxrX9xYyq23FDO2DuTmj8vVcY5jimWreokKllMAw/Kv+WUl7HU+EJEp
	FtpPRgNHKO01WveGDttTYRuSv8vr+3fi3vlMBpKBOkZK88VK5kuLRxYmUORmSkiU
	c3z242/KqO6lnNmAkNbexO/GHvZuUNu1+7k7jjA0sVVuNbnq2ofrYvYsKRIsYKJX
	DxJ8lxoVYhTrR/NAD/tI08+oCd54G8HgJ2HDAXf8G/SscaijDRqkrospEYz8c01J
	3kg1ht1EGnteqZV9MHBIjlYgeMuB/7AthYsolLUFblxGPGR6Hyob9VqFxg3L/C7x
	+XJinbF8KhKSH+eGUxhSPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1746441623; x=1746528023; bh=29Ps2y4SaSAbFjQ5BF2wB8HEg3NPVt1KQ5X
	XQkA+MLs=; b=UALJ/Fe+Zpg/TL8jax6wcijWeDKOrUA4vRZjCKdReAoR/Oy1RPx
	MpPrJv+YRp89JlFScRD/ibbSUNnB3Kcxiy03z3m8kxznEJOqIzBmgKKhsbXnDoE5
	b6BL+jOWtOqIsaR/tUT8CsT1m7nGDyWvkBauyagHGUEoPtZz6n2GWrvoryCCPSlg
	TPxuOwzk5lVsIu4oqgWBXE9Lh5HxoB/AL8iyyn+wxe+5S8e883K9qz870tdHmq+3
	i8jePewvmY3AQOWfx8eE+QBnSTwV4xFNTV8DH/0BNygtdvecYD7li2sX61S8CJxm
	dOD9MvJ05RqDnQqVEAE6yiO7XC/Z4tq4QwA==
X-ME-Sender: <xms:l5UYaF0_S3TyAInFgISfw05zqE-qnCNne4zmVj2_44t80HVD5-jpLg>
    <xme:l5UYaMGkqXZhNKyZkt2EPdkAJZlKRtHizgM3867sZ55x3vyoEfMpBf6NQwBIYZvJY
    gMm8ljsWAkiOg>
X-ME-Received: <xmr:l5UYaF7kjCd9PJffiUK0Rua7mN_QSMvVZVBwj9tpHkn4VBXDYzveJFA_uFEz-ieYSPf6ncdFIyWqfZ1Ddq5uUQLH2t7T-n75Mg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkedtkeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepudeffeehkedtfeelueduleejieeutdeludffveeikeekkeeige
    duleegudeujeffnecuffhomhgrihhnpeigvghnphhrohhjvggtthdrohhrghdpghhithhh
    uhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdp
    nhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhsth
    grsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgsvghulhhitghh
    sehsuhhsvgdrtghomhdprhgtphhtthhopeigvghnihgrrdhrrghgihgruggrkhhouhesrg
    hmugdrtghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihig
    rdgtohhmpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtg
    hpthhtohepjhgrshhonhdrrghnughrhihukhesrghmugdrtghomhdprhgtphhtthhopegr
    ghgrrhgtihgrvhesrghmugdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlih
    hsthhsrdigvghnphhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:l5UYaC0ctbsDfBXIpMbEXHPfCMzFV4rozxXm71kq-Ez3hCH8hfQmWA>
    <xmx:l5UYaIExLd8vDjMq8DXAtOU9s8ftZa1NuwgunEBGsSQHcLuJ-nIHWA>
    <xmx:l5UYaD-WiqI990seDvlJ3KsxE0ZbkROXWgXQ6vUbaiVD93xEAUzBWw>
    <xmx:l5UYaFkksE46dST8IhZ3nmH1EH5S-qM8MCTs83CsowXmk4wRupoPSA>
    <xmx:l5UYaHJEl2s-udbUfdQH7b2cGyC8_V-1GIbci0nqU8JiwF0LNfMH5smw>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 5 May 2025 12:40:18 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	jason.andryuk@amd.com, agarciav@amd.com,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/x86: allow Dom0 PVH to call XENMEM_exchange
Message-ID: <aBiVkw2SXJHxpieh@mail-itl>
References: <alpine.DEB.2.22.394.2504251314050.785180@ubuntu-linux-20-04-desktop>
 <19d9aec4-c21a-47a9-9c58-6bfcadbd22e0@suse.com>
 <alpine.DEB.2.22.394.2504281242240.785180@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oT+uxnubbYQ3cQdc"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2504281242240.785180@ubuntu-linux-20-04-desktop>


--oT+uxnubbYQ3cQdc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 5 May 2025 12:40:18 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	jason.andryuk@amd.com, agarciav@amd.com,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/x86: allow Dom0 PVH to call XENMEM_exchange

On Mon, Apr 28, 2025 at 01:00:01PM -0700, Stefano Stabellini wrote:
> On Mon, 28 Apr 2025, Jan Beulich wrote:
> > On 25.04.2025 22:19, Stefano Stabellini wrote:
> > > From: Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>
> > >=20
> > > Dom0 PVH might need XENMEM_exchange when passing contiguous memory
> > > addresses to firmware or co-processors not behind an IOMMU.
> >=20
> > I definitely don't understand the firmware part: It's subject to the
> > same transparent P2M translations as the rest of the VM; it's just
> > another piece of software running there.
> >=20
> > "Co-processors not behind an IOMMU" is also interesting; a more
> > concrete scenario might be nice, yet I realize you may be limited in
> > what you're allowed to say.
>=20
> Sure. On AMD x86 platforms there is a co-processor called PSP running
> TEE firmware. The PSP is not behind an IOMMU. Dom0 needs occasionally to
> pass addresses to it.  See drivers/tee/amdtee/ and
> include/linux/psp-tee.h in Linux.

We had (have?) similar issue with amdgpu (for integrated graphics) - it
uses PSP for loading its firmware. With PV dom0 there is a workaround as
dom0 kinda knows MFN. I haven't tried PVH dom0 on such system yet, but I
expect troubles (BTW, hw1 aka zen2 gitlab runner has amdgpu, and it's
the one I used for debugging this issue).

References:
https://lists.xenproject.org/archives/html/xen-devel/2022-06/msg01660.html
https://github.com/QubesOS/qubes-issues/issues/6923

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--oT+uxnubbYQ3cQdc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmgYlZMACgkQ24/THMrX
1yyX1wf/dXw+1AltqC+Ss5NgT6xGvdDHAXzQ2lKSjJ78Sru0OmZCeFhz7SGrP8o7
Em1tJo/fXVLkcjrYYUNnqkCoZPIk1PY/MZMGPLB9IC6t5/Vq+PWW1C1K96CjdRDz
afK35JLLV4yqy69s7rSzAyhX4zym8tNH/VNJTzISIbVaZsd6bWrl4PZtHcjfIGt0
HMCIDZX4VDqK2RLMpm1EdmmSoQJ+4oL7pwAZgoTlj7jyaRAZzSp4XKZ2d2HXtbWf
O34xZf55xG3RMTN6MwmVAw4dxHPswQIen9mnU48SMjfOEjfoIJqblPojygOx5bqW
p2dPIBKx5DooDWoG/8nHjG0HucQeIQ==
=Vldb
-----END PGP SIGNATURE-----

--oT+uxnubbYQ3cQdc--

