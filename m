Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F41C5784B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 14:01:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161370.1489335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWx0-0007bK-IY; Thu, 13 Nov 2025 13:01:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161370.1489335; Thu, 13 Nov 2025 13:01:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWx0-0007Yf-Ev; Thu, 13 Nov 2025 13:01:22 +0000
Received: by outflank-mailman (input) for mailman id 1161370;
 Thu, 13 Nov 2025 13:01:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=25e8=5V=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vJWwy-0007YW-Aa
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 13:01:20 +0000
Received: from fhigh-a2-smtp.messagingengine.com
 (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d640ec70-c090-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 14:01:15 +0100 (CET)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
 by mailfhigh.phl.internal (Postfix) with ESMTP id E554A14000B5;
 Thu, 13 Nov 2025 08:01:14 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Thu, 13 Nov 2025 08:01:14 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Nov 2025 08:01:12 -0500 (EST)
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
X-Inumbo-ID: d640ec70-c090-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1763038874;
	 x=1763125274; bh=aaWjsFBt37Ub2GG+uc5FO7+4g8aYl5aEW8CFoEC7ZKo=; b=
	cGyoOsr1QUXIqRxTu8JNF2GoFpxs8jJN+nGfQm8DynyMcw8d4M2J3an6qMPFY9WM
	L6DSRa8ioTKyQJ6ZQqv01XbmRjUVqmJC9RDS8XI3xaAcMPmJV8QtYkj/LgkirGQI
	UTnV9MfJnXp1xPvpWovwPisLaZMlsje1MIL6mAPopkWXmIpCa9X8ONNS8GO6b2Ts
	ZcRZG82u2Jxx5I/m10+41/2NGc8Jzf8pNhk0aAO09TfOlkfwXakAnuMd5GIgzibP
	INvBGfI8HeZIrlRJZcU7aHJ1l3YVLd6Wy+B0Tc8eyO+EUibNceK+0DyuHY2JTxCx
	ifmX697Lj4SEfhxAabyhlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1763038874; x=1763125274; bh=aaWjsFBt37Ub2GG+uc5FO7+4g8aYl5aEW8C
	FoEC7ZKo=; b=XPImjfVd32GOkhQ5o7YJ5pCmPfol7928UrrQF+ppab2IDAd9TOQ
	9pnJgfbZZXlpOQepWlLCaREdxALipyl9sJCxA/dlW+kDM/OD9dqOlhFVF5TRREFm
	bVOATjxlcuu6mwKMgav8cSK9UVIlLrn/yFWdkCpJTWYWb5LtsAme/C+NEAKo7QHC
	2Oo6iLNSFvHe6VGpUm4GQcyzRbbhZrRktJAgsSWotHwrGSdRFS+j9EIHidlGmjci
	/KmdDyYzw4FyiJsivMT5QIO/WjZDM2La3byAzFxZPyAHD+Cydkrr67CYBX8sZyli
	HaDzGQbRIgAKiVbUDIekZtQeakyueUeywlA==
X-ME-Sender: <xms:mtYVaYdl6wuMSbCiJTxo5DYL8fxI1TQ-ZCnqAQdKi6Y9Y5iN9ANZdA>
    <xme:mtYVaZR_TsmOyym8HwPQZkj7WWu-Fd0sgT-av_AUAL8ML_0MfGXXGs7M-RKdDVYiS
    6FO1eLLvZRz9HFkHKlewYWm9ifNd3XOB2fX3es9_ly1fzO7vS0>
X-ME-Received: <xmr:mtYVafsHCMU5NIinDQCMf7Mfk4D-WNJ9QaYEV6uGXKOs0c3Ra2-cP8Ne3rueWIvk4YacqmTxXQJZe-dcNfOpN9ejxMfaQCUS4UM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdejtdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhih
    hnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfekuddtffettefhieeuheff
    keeuffelvdffuddtteetledtveekfeekleehjefgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgv
    thhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthho
    peigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtph
    htthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthht
    ohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpthhtohepshhsthgrsggvlhhlihhnih
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnthhhohhnhidrphgvrhgrrhgusehv
    rghtvghsrdhtvggthhdprhgtphhtthhopehmihgthhgrlhdrohhriigvlhesrghmugdrtg
    homhdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:mtYVaacF5JVFAHvr7RUqPBAe47TCRkMmA1THOHQfRpQmwSOsbzyp7Q>
    <xmx:mtYVaZYAXd-aNMimS246v1TuZywcDI4_TZ8M7yjXgkrUPKt7YWYRtQ>
    <xmx:mtYVacYBICiZDxiFU-d44XEUPsIO3n29ijNJKZceXeVRMgPTfuludw>
    <xmx:mtYVaeL1g7DnKVwHn8VY-JL0OzQLsa3AYXpLU58XbsmtY_Qp69P8mQ>
    <xmx:mtYVaermM7-I0y-8hM3uOgR-K6JBNERQ9rIIaG-dCB4ht1mHByIo0JWY>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 13 Nov 2025 14:01:10 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 3/3] xhci-dbc: use brk_alloc()
Message-ID: <aRXWl1cVvjsDnWBP@mail-itl>
References: <bdbb2884-c2d2-415a-8891-a598d112e34c@suse.com>
 <bec55a88-00f3-4961-b1dc-5b9e38d94a32@suse.com>
 <aRXRdU8YusudRmxf@mail-itl>
 <0ed20aaa-2625-4555-8fab-0e15fea5e71c@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/UcRZ6SxJa3EZ8K7"
Content-Disposition: inline
In-Reply-To: <0ed20aaa-2625-4555-8fab-0e15fea5e71c@suse.com>


--/UcRZ6SxJa3EZ8K7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Nov 2025 14:01:10 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 3/3] xhci-dbc: use brk_alloc()

On Thu, Nov 13, 2025 at 01:50:28PM +0100, Jan Beulich wrote:
> On 13.11.2025 13:39, Marek Marczykowski wrote:
> > On Thu, Nov 13, 2025 at 12:10:16PM +0100, Jan Beulich wrote:
> >> --- a/xen/drivers/char/xhci-dbc.c
> >> +++ b/xen/drivers/char/xhci-dbc.c
> >> @@ -27,6 +27,8 @@
> >>  #include <xen/serial.h>
> >>  #include <xen/timer.h>
> >>  #include <xen/types.h>
> >> +
> >> +#include <asm/brk.h>
> >>  #include <asm/fixmap.h>
> >>  #include <asm/io.h>
> >>  #include <asm/string.h>
> >> @@ -1321,7 +1323,7 @@ static struct uart_driver dbc_uart_drive
> >>  };
> >> =20
> >>  /* Those are accessed via DMA. */
> >> -struct dbc_dma_bufs {
> >> +struct __aligned(PAGE_SIZE) dbc_dma_bufs {
> >>      struct xhci_trb evt_trb[DBC_TRB_RING_CAP];
> >>      struct xhci_trb out_trb[DBC_TRB_RING_CAP];
> >>      struct xhci_trb in_trb[DBC_TRB_RING_CAP];
> >> @@ -1335,8 +1337,7 @@ struct dbc_dma_bufs {
> >>       * DMA-reachable by the USB controller.
> >>       */
> >>  };
> >> -static struct dbc_dma_bufs __section(".bss.page_aligned") __aligned(P=
AGE_SIZE)
> >> -    dbc_dma_bufs;
> >> +DEFINE_BRK(xhci, sizeof(struct dbc_dma_bufs));
> >=20
> > I think with this change (or rather with using brk_alloc() below), the
> > structure wants to be padded up to the page size, to avoid putting
> > anything else on the same page (see comment just outside of context
> > above).
>=20
> Are you sure? My understanding is that sizeof(xyz) is always evenly divis=
ible by
> alignof(xyz). Hence such padding doesn't need making explicit. (And yes, =
I did
> see that comment while making the change.)

Ok, then indeed the added (or rather moved) __aligned(PAGE_SIZE) is enough.

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

> >> @@ -1413,24 +1414,33 @@ void __init xhci_dbc_uart_init(void)
> >>  {
> >>      struct dbc_uart *uart =3D &dbc_uart;
> >>      struct dbc *dbc =3D &uart->dbc;
> >> +    struct dbc_dma_bufs *dma_bufs;
> >> =20
> >>      if ( !dbc->enable )
> >>          return;
> >> =20
> >> -    dbc->dbc_ctx =3D &dbc_dma_bufs.ctx;
> >> -    dbc->dbc_erst =3D &dbc_dma_bufs.erst;
> >> -    dbc->dbc_ering.trb =3D dbc_dma_bufs.evt_trb;
> >> -    dbc->dbc_oring.trb =3D dbc_dma_bufs.out_trb;
> >> -    dbc->dbc_iring.trb =3D dbc_dma_bufs.in_trb;
> >> -    dbc->dbc_owork.buf =3D dbc_dma_bufs.out_wrk_buf;
> >> -    dbc->dbc_iwork.buf =3D dbc_dma_bufs.in_wrk_buf;
> >> -    dbc->dbc_str =3D dbc_dma_bufs.str_buf;
> >> +    dma_bufs =3D brk_alloc(sizeof(*dma_bufs));
> >> +    if ( !dma_bufs )
> >> +    {
> >> +        dbc->enable =3D false;
> >> +        printk(XENLOG_ERR "XHCI: not enough BRK space available\n");
> >> +        return;
> >> +    }
> >> +
> >> +    dbc->dbc_ctx =3D &dma_bufs->ctx;
> >> +    dbc->dbc_erst =3D &dma_bufs->erst;
> >> +    dbc->dbc_ering.trb =3D dma_bufs->evt_trb;
> >> +    dbc->dbc_oring.trb =3D dma_bufs->out_trb;
> >> +    dbc->dbc_iring.trb =3D dma_bufs->in_trb;
> >> +    dbc->dbc_owork.buf =3D dma_bufs->out_wrk_buf;
> >> +    dbc->dbc_iwork.buf =3D dma_bufs->in_wrk_buf;
> >> +    dbc->dbc_str =3D dma_bufs->str_buf;
> >> =20
> >>      if ( dbc_open(dbc) )
> >>      {
> >>          iommu_add_extra_reserved_device_memory(
> >> -                PFN_DOWN(virt_to_maddr(&dbc_dma_bufs)),
> >> -                PFN_UP(sizeof(dbc_dma_bufs)),
> >> +                PFN_DOWN(virt_to_maddr(dma_bufs)),
> >> +                PFN_DOWN(sizeof(*dma_bufs)),
> >=20
> > Is that really correct? But with padding (see earlier comment) it
> > shouldn't really matter.
>=20
> I think this is addressed by the reply further up as well.
>=20
> Jan

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--/UcRZ6SxJa3EZ8K7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmkV1pcACgkQ24/THMrX
1yz9jQf8C4Zo5l57mM8In2zhZnW0/jRU86xRQbuGFli+O7MbaPJQ28RuRmEU/ION
cMhUCgLeaTnR+9ebJzfwhN09WMljB8VvqX/tcNjOIGhO8NLDGbSKzI4KTCbuXfiv
BiFB/HM+9nFakHBfFQOrRTz4PTU/Y4fMbBwpVa1cKkbv9qfMIWX/72mVIH5mjZ1B
gbVu9gYlYFVVisCz+uJcj0cyBc5l3YFb/ZuFU50/0xr/m3CfCc6rRDTGz4jTE6bf
fEHDVysIrjoX4wtHycCO7oPDTwP3ixP4ekKRiLzaAYUrUiIB2DRW0j1gsdIQiiHv
FGvnh8E3Dtk18mcqmHBujDPy9aUuRg==
=6rLb
-----END PGP SIGNATURE-----

--/UcRZ6SxJa3EZ8K7--

