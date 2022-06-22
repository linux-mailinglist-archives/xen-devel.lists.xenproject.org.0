Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02903554FD4
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 17:48:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354176.581229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o42Zl-0006UG-9c; Wed, 22 Jun 2022 15:47:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354176.581229; Wed, 22 Jun 2022 15:47:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o42Zl-0006Ra-5i; Wed, 22 Jun 2022 15:47:29 +0000
Received: by outflank-mailman (input) for mailman id 354176;
 Wed, 22 Jun 2022 15:47:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5hfk=W5=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1o42Zj-0006RU-Bt
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 15:47:27 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a9b99f4-f242-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 17:47:23 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 644EE5C014D;
 Wed, 22 Jun 2022 11:47:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 22 Jun 2022 11:47:21 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 11:47:19 -0400 (EDT)
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
X-Inumbo-ID: 9a9b99f4-f242-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1655912841; x=
	1655999241; bh=rB9Wm+XmI+yNoro3smRJKMMciqzWIsI+xbYet9Terec=; b=R
	uH01bqTZBjOJsiIHEZ5/30xPXD2EZUSgcChfkSxMVP9GahPn7+g8LHapjW5YOAiT
	fCSYXm0uQAYCeZ1lEgi0deU69YCEQnI3Jt8W5aJI/l/XI/XM/Qwf/PlZpjOlTXax
	QtyhpUQ5QTrexO8iv04okysTc7yArRx9V/E3QYZfj6pMXm1xmHjxbhcwBXTTGQ5O
	7rnELYsguXva/zIjI+pOnFReKqo3M55xvxvo+SMf+PZLXM2qmR0+KcCe8lETcMBW
	M34JSD8eQeYu/jFnkbvopCmeE1b+zFesgMSkVc4Giu/XHpRE4piZhjb4illZxb9E
	ZZ7P+U4MDU38TxEqE57EQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1655912841; x=1655999241; bh=rB9Wm+XmI+yNoro3smRJKMMciqzW
	IsI+xbYet9Terec=; b=SRitMXfE/xaPp3xq9Gm3lYxuSiP9zcIAxPbT4TPpc9pP
	IdHZ1KC+Kec6VqQXsaQXG3lWj2cXst6bt3oq/RSmGahhrA6OC1dqzMFy9ZJvn372
	e4yyeKXesKstaPd/xqye4wzKGIyPF6E9rZmDyhhZrsT6yxEYj+FXQ72+59ecWn8i
	LHcv4w6J/677eKCxE0EQOkyXX2EZTz8wR50KTnn0Juc77lvONidclgwmEEgYW125
	4uhtonnyhZ3D9hq3nZCBbn7JPR1gh7KoQDFIReNkMQS8oVLjjc9YjeBg7g6gZWog
	rJKI6Ev2GIJcjIdfeWdEHx7wPTak/3lhopaLeoa3Rg==
X-ME-Sender: <xms:iDmzYpn3I7cdpknaxCl_fTLBtm_pM3UYVVQxoOyW9M30VgVUpOtnKQ>
    <xme:iDmzYk3-xYGOnV2GFdj7HGwtbVy7K5Hl94CUFKoEEOrfoASs7_IdyeJ6YMYLcP1yc
    G-othuv85gfhg>
X-ME-Received: <xmr:iDmzYvrMIlBecBPfnaMbzPImXiIcC-yiJuQSax5EjLRr_4ULp9LtdDzVdufxyLROmMScoSUrnTW3gNLq6EkBr1MlWjsgMIkLng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:iTmzYplOVWrv8J9FZ8rXdrZMGwp2Y19i3suQNbaCxaXXpH8eepqQNg>
    <xmx:iTmzYn2xP0qRv_qOSFHlCmNiTP6VfIir9cyIFsaU2AV-fZ1t7GDg0Q>
    <xmx:iTmzYot8t1ybzH4ILo3tdpWeA-VIYQMfmAqNYTMlthYRWDk7fZDxlg>
    <xmx:iTmzYsm1j4zrLEkTUJnoi6AdkDZVojig3poOx6ihzlghhYul8-FlTQ>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 22 Jun 2022 17:47:15 +0200
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
Message-ID: <YrM5g3dLRJHTIVYt@mail-itl>
References: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
 <87c73737fe8ec6d9fe31c844b72b6c979b90c25d.1654612169.git-series.marmarek@invisiblethingslab.com>
 <9c7c11f5-be1e-f0ef-0659-48026675ec1a@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SrxAhTaFs1FNuynb"
Content-Disposition: inline
In-Reply-To: <9c7c11f5-be1e-f0ef-0659-48026675ec1a@suse.com>


--SrxAhTaFs1FNuynb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jun 2022 17:47:15 +0200
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

On Wed, Jun 15, 2022 at 04:25:54PM +0200, Jan Beulich wrote:
> On 07.06.2022 16:30, Marek Marczykowski-G=C3=B3recki wrote:
> > From: Connor Davis <davisc@ainfosec.com>
> > --- /dev/null
> > +++ b/xen/drivers/char/xue.c
> > @@ -0,0 +1,957 @@
> > +/*
> > + * drivers/char/xue.c
> > + *
> > + * Xen port for the xue debugger
>=20
> Since even here it's not spelled out - may I ask what "xue" actually
> stands for (assumng it's an acronym)?

Honestly, I don't know. That would be a question to Connor.

> > +/* Supported xHC PCI configurations */
> > +#define XUE_XHC_CLASSC 0xC0330ULL
>=20
> While I'm not meaning to fully review the code in this file (for lack
> of knowledge on xhci), the two ULL suffixes above strike me as odd.
> Is there a specific reason these can't just be U?

I don't think so (that's just how it was in xue.h). Will adjust. The
same response applies to many other remarks.

> > +    /* ...we found it, so parse the BAR and map the registers */
> > +    bar0 =3D pci_conf_read32(xue->sbdf, PCI_BASE_ADDRESS_0);
> > +    bar1 =3D pci_conf_read32(xue->sbdf, PCI_BASE_ADDRESS_1);
>=20
> What if there are multiple?

You mean two 32-bit BARs? I check for that below (refusing to use them).
Anyway, I don't think that's a thing in USB 3.0 controllers.


> > +    /* IO BARs not allowed; BAR must be 64-bit */
> > +    if ( (bar0 & 0x1) !=3D 0 || ((bar0 & 0x6) >> 1) !=3D 2 )

(...)

> > +    memset(xue, 0, sizeof(*xue));
> > +
> > +    xue->dbc_ctx =3D &ctx;
> > +    xue->dbc_erst =3D &erst;
> > +    xue->dbc_ering.trb =3D evt_trb;
> > +    xue->dbc_oring.trb =3D out_trb;
> > +    xue->dbc_iring.trb =3D in_trb;
> > +    xue->dbc_owork.buf =3D wrk_buf;
> > +    xue->dbc_str =3D str_buf;
>=20
> Especially the page-sized entities want allocating dynamically here, as
> they won't be needed without the command line option requesting the use
> of this driver.

Are you okay with changing this only in patch 9, where I restructure those
buffers anyway?

> > +    xue_open(xue);
>=20
> No check of return value?

Good catch, will adjust.

> > +    serial_register_uart(SERHND_DBGP, &xue_uart_driver, &xue_uart);
> > +}
> > +
> > +void xue_uart_dump(void)
> > +{
> > +    struct xue_uart *uart =3D &xue_uart;
> > +    struct xue *xue =3D &uart->xue;
> > +
> > +    xue_dump(xue);
> > +}
>=20
> This function looks to be unused (and lacks a declaration).

It is unused, same as xue_dump(), but is extremely useful when
debugging. Should I put it behind something like #ifdef XUE_DEBUG,
accompanied with a comment about its purpose?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--SrxAhTaFs1FNuynb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmKzOYMACgkQ24/THMrX
1yzkswf8D7xZb1jn6Bh6JZ9dvZxOMuodXKZ2kU0llv+c9IGGr83rvVHkyVwDl3Nz
ItpqTvVdoOCcXm27aMYZjgkro7t5Y5bgK0woKhHqcA0AnTLtAS4XGAE0pQfRtC6L
vFS41zZvMw2w3ljXxXBEkKbT11fyAC9KtdZ154kiSb/GcPDK3Ym2leodURVj0yor
5raUQ44X8kkxGtGobBgAofF98TV7j8tqDM3BFVQo+MNdokEHzKaqRjtTU6kBBqIc
/x+oa1ao0mMnP8rrTY+IOlNkmE6ENLsEzrnQeDqq0dbAwC9cEr+Z8oqAbhx2LhOQ
RKKo5jo6G1t3dtGzqQ47RcQ7rUU+fw==
=6EwA
-----END PGP SIGNATURE-----

--SrxAhTaFs1FNuynb--

