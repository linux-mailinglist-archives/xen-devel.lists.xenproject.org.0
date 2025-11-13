Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FB7C5773C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 13:39:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161243.1489235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWbo-0006Gx-NS; Thu, 13 Nov 2025 12:39:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161243.1489235; Thu, 13 Nov 2025 12:39:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWbo-0006EI-Kf; Thu, 13 Nov 2025 12:39:28 +0000
Received: by outflank-mailman (input) for mailman id 1161243;
 Thu, 13 Nov 2025 12:39:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=25e8=5V=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vJWbn-0006EC-JN
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 12:39:27 +0000
Received: from fhigh-a2-smtp.messagingengine.com
 (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c72b6af3-c08d-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 13:39:22 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id C403E140020B;
 Thu, 13 Nov 2025 07:39:20 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Thu, 13 Nov 2025 07:39:20 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Nov 2025 07:39:18 -0500 (EST)
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
X-Inumbo-ID: c72b6af3-c08d-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1763037560;
	 x=1763123960; bh=zqdlxBIjB3DVgMxuq8MoXJbhRnJS1kGnr2lLg4C2rCE=; b=
	lhVPtWRlBDrPOjwnJh9QiuKgAW+d7/O532nhGJ22XNoYXfHhS0Zd4kQPJq2cTwXG
	3nv+KOfvHat4tVxVvojCZNS7ynyaW5JIbEiBcGfCYJnMG3dkKEFTN8amlkv7IWoq
	CBtUrHckJ/9UmCIL1O1PXaeK8TzH8umXT4RjJbaZ3crsVkwoq7SkEdOIWqMAinox
	xIuI7XElFgm6nObX1+sEReRt6aEX3JVnBBacmFd9XMTIhluG+UBlENH625xQPnrr
	gNxCejOdJnkk2eqNLe9VLsaHvo+CaxqqzVCDDuQ99eP95VMEA4mu09F9q/FuyM2k
	BWkO9fllaa7MHQ3J93WiVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1763037560; x=1763123960; bh=zqdlxBIjB3DVgMxuq8MoXJbhRnJS1kGnr2l
	Lg4C2rCE=; b=E0Sk4XdwzD2CdLLz1UDURsEAWKSNddGtspGGko1yjxXNr90ILgm
	CTH33BYFpin7c5WX/HbE7uoJPqXs69XZISx1PyqjS53qZMiS+RaLNBDANeqHIiIx
	AQ6PTucv3ymSPf0Gat2EbJvf3fKw2mHML4qDQcc6rD7DuUzck5n44m8IoQWy84mB
	Cdjqe/RVkfNVEHXq3Pejo1wHqEmsUOwQidmfS4/VQP5OFSqC9t2HDsSOof6jQx7D
	xhm5L8VEvPkVrddAEX413ZJxHYHNAMc6r1EfD9dWxe4HZX8NMeGlrJ9/NUkfFs/J
	G8yHJ98Zw6C4vVKYsXCr4IMhqF/e3XJeYYw==
X-ME-Sender: <xms:eNEVaXFX569XtDAxwyr-9y_2OjRdaD41LcvBFzaOuz6qRhLcFfd6Jg>
    <xme:eNEVaTa8pOYd-onNdM61vE4tJrrXSwEtrFQFPMC96QZY3id1CYWoQvS_aJorWSjl6
    h19iP1FLZOjbM9oK7dP5AD7e8VZg3RV-xLqNtpWuHte2lyoZw>
X-ME-Received: <xmr:eNEVafVkkR4630bQx8yQmKZNtq0WpML6jLeIOsDXZswH7plR967NbAlUxFkNiElyyjk49Pc0uRPYszoPXn-o40HYki4fC_7LSNM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdeileehucetufdoteggodetrf
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
X-ME-Proxy: <xmx:eNEVaRk4YaGJtefJij1dV640IJsFMBwwKEpTbdm6oseBHQ7vipuPjQ>
    <xmx:eNEVaSDnFZyDLqyQNL0q_c3dBaNjvnpY8n7pYGfXgZrOtEGjSJzKeA>
    <xmx:eNEVaYgmMtXh00mZm6flxjMzo9II9yaWjQxsXpl3zk7g0aGV7HdBTw>
    <xmx:eNEVaXzoG82mOyKGKbBaRA-v9OFRndNcxa4xHNnplBYr_7Ed6IWqUw>
    <xmx:eNEVaZThYvQ6x-PYM0b7zHTyhtTLmF7Elnu_rUzNf8HYCzv-uD-vL6He>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 13 Nov 2025 13:39:16 +0100
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
Message-ID: <aRXRdU8YusudRmxf@mail-itl>
References: <bdbb2884-c2d2-415a-8891-a598d112e34c@suse.com>
 <bec55a88-00f3-4961-b1dc-5b9e38d94a32@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ch/S/wdXVtSi1v5H"
Content-Disposition: inline
In-Reply-To: <bec55a88-00f3-4961-b1dc-5b9e38d94a32@suse.com>


--ch/S/wdXVtSi1v5H
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Nov 2025 13:39:16 +0100
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

On Thu, Nov 13, 2025 at 12:10:16PM +0100, Jan Beulich wrote:
> This way the relatively large chunk of DMA buffers can be freed when the
> driver isn't in use.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> --- a/xen/drivers/char/xhci-dbc.c
> +++ b/xen/drivers/char/xhci-dbc.c
> @@ -27,6 +27,8 @@
>  #include <xen/serial.h>
>  #include <xen/timer.h>
>  #include <xen/types.h>
> +
> +#include <asm/brk.h>
>  #include <asm/fixmap.h>
>  #include <asm/io.h>
>  #include <asm/string.h>
> @@ -1321,7 +1323,7 @@ static struct uart_driver dbc_uart_drive
>  };
> =20
>  /* Those are accessed via DMA. */
> -struct dbc_dma_bufs {
> +struct __aligned(PAGE_SIZE) dbc_dma_bufs {
>      struct xhci_trb evt_trb[DBC_TRB_RING_CAP];
>      struct xhci_trb out_trb[DBC_TRB_RING_CAP];
>      struct xhci_trb in_trb[DBC_TRB_RING_CAP];
> @@ -1335,8 +1337,7 @@ struct dbc_dma_bufs {
>       * DMA-reachable by the USB controller.
>       */
>  };
> -static struct dbc_dma_bufs __section(".bss.page_aligned") __aligned(PAGE=
_SIZE)
> -    dbc_dma_bufs;
> +DEFINE_BRK(xhci, sizeof(struct dbc_dma_bufs));

I think with this change (or rather with using brk_alloc() below), the
structure wants to be padded up to the page size, to avoid putting
anything else on the same page (see comment just outside of context
above). Previously .bss.page_aligned contained (hopefully) only
page-aligned objects, but now brk_alloc() can combine them.

> =20
>  static int __init cf_check xhci_parse_dbgp(const char *opt_dbgp)
>  {
> @@ -1413,24 +1414,33 @@ void __init xhci_dbc_uart_init(void)
>  {
>      struct dbc_uart *uart =3D &dbc_uart;
>      struct dbc *dbc =3D &uart->dbc;
> +    struct dbc_dma_bufs *dma_bufs;
> =20
>      if ( !dbc->enable )
>          return;
> =20
> -    dbc->dbc_ctx =3D &dbc_dma_bufs.ctx;
> -    dbc->dbc_erst =3D &dbc_dma_bufs.erst;
> -    dbc->dbc_ering.trb =3D dbc_dma_bufs.evt_trb;
> -    dbc->dbc_oring.trb =3D dbc_dma_bufs.out_trb;
> -    dbc->dbc_iring.trb =3D dbc_dma_bufs.in_trb;
> -    dbc->dbc_owork.buf =3D dbc_dma_bufs.out_wrk_buf;
> -    dbc->dbc_iwork.buf =3D dbc_dma_bufs.in_wrk_buf;
> -    dbc->dbc_str =3D dbc_dma_bufs.str_buf;
> +    dma_bufs =3D brk_alloc(sizeof(*dma_bufs));
> +    if ( !dma_bufs )
> +    {
> +        dbc->enable =3D false;
> +        printk(XENLOG_ERR "XHCI: not enough BRK space available\n");
> +        return;
> +    }
> +
> +    dbc->dbc_ctx =3D &dma_bufs->ctx;
> +    dbc->dbc_erst =3D &dma_bufs->erst;
> +    dbc->dbc_ering.trb =3D dma_bufs->evt_trb;
> +    dbc->dbc_oring.trb =3D dma_bufs->out_trb;
> +    dbc->dbc_iring.trb =3D dma_bufs->in_trb;
> +    dbc->dbc_owork.buf =3D dma_bufs->out_wrk_buf;
> +    dbc->dbc_iwork.buf =3D dma_bufs->in_wrk_buf;
> +    dbc->dbc_str =3D dma_bufs->str_buf;
> =20
>      if ( dbc_open(dbc) )
>      {
>          iommu_add_extra_reserved_device_memory(
> -                PFN_DOWN(virt_to_maddr(&dbc_dma_bufs)),
> -                PFN_UP(sizeof(dbc_dma_bufs)),
> +                PFN_DOWN(virt_to_maddr(dma_bufs)),
> +                PFN_DOWN(sizeof(*dma_bufs)),

Is that really correct? But with padding (see earlier comment) it
shouldn't really matter.

>                  uart->dbc.sbdf,
>                  "XHCI console");
>          serial_register_uart(SERHND_XHCI, &dbc_uart_driver, &dbc_uart);
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ch/S/wdXVtSi1v5H
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmkV0XUACgkQ24/THMrX
1ywdEwf+OuXjepjEDIVSvoL7/9ZRwZe8TEYUWUM1S7ebKl3a6kBJ8kevhDrYtss5
SbQBUnK1dSiPv53gjmHe25ipZXjNWGKsx9pHJCKykVCE/Eqy5v7YZ9aqRH9j8o0T
v5QBMzrppP2QPpomT+luR9EqS7xd7Qlf4EFDnuO30qqiCuc5G0jGlexn+mQmN6hi
KUUCSuPdYzU2sZSRggOLW3m8BjOYjPwU5f2g6ma3dPVnuCgR+g8mJw0FYz75+P+3
Ks5KWeDNWDeNR65Q8uOOATiddWNtFrlhAN6KyePbyEK6THQG55xryyuKQn95Nkvx
lNHuAgI1pwRm/ikoeid85vzUePssBw==
=R0OP
-----END PGP SIGNATURE-----

--ch/S/wdXVtSi1v5H--

