Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 004CC8CBF79
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 12:50:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727487.1131967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9jXt-00055L-Bi; Wed, 22 May 2024 10:50:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727487.1131967; Wed, 22 May 2024 10:50:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9jXt-00053o-8p; Wed, 22 May 2024 10:50:09 +0000
Received: by outflank-mailman (input) for mailman id 727487;
 Wed, 22 May 2024 10:50:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKXr=MZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s9jXs-00053i-7M
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 10:50:08 +0000
Received: from wfout2-smtp.messagingengine.com
 (wfout2-smtp.messagingengine.com [64.147.123.145])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b7e6862-1829-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 12:50:06 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.west.internal (Postfix) with ESMTP id 5EA9B1C000A9;
 Wed, 22 May 2024 06:50:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 22 May 2024 06:50:02 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 May 2024 06:50:00 -0400 (EDT)
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
X-Inumbo-ID: 0b7e6862-1829-11ef-90a0-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1716375002;
	 x=1716461402; bh=T2OJF4JeRo6DywaHzV/H7q42Y/iQEwfR5qEXWTKvIGk=; b=
	QNtaVr5zwgZH1Yq+pu8CWRw5gg2yjlXk0mFZnt7aNb/jNa1MT/wR98E1CcWAa/8A
	6PjbO9yIOSZruaVz62ZVzVPfQO4Yt6n8EFpbyDoxgnNg35WYfo4iD5KLvaGgrOet
	DMfhc5uKWzaaldm9kp1bw2H1f4MuNLqbsTy90SUweR/H09lpjdmE2I7FyMVdMpRv
	2S8ir7JUX1cA19bBBWYosTILVVO9pv8mNKDqyymK9YDKK270ITKOR9+R5aszfbdl
	Z9eHGODfl/lnC2x1xVlB/P2Kv/zmJ8EonyNro5grdE1yxaQNFSAd/99Fzunnst1B
	QgTEv0VLsRqhKD477UZN1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1716375002; x=1716461402; bh=T2OJF4JeRo6DywaHzV/H7q42Y/iQ
	EwfR5qEXWTKvIGk=; b=euAXoKnhRTrWrFmwH8F2KpW1YC+7kP3QmqhYJ62y9nwW
	yCAsbSLuJiIZzGFIBXjVN9FZVIGpp6j8LTUZqWdh88uqktqRZT93YB/2f+6FArQN
	LEtahhnjfFjJohErvqeoTftQjtQ4Rr0MP7Q+T41aSvnOIl0pbkyV82eBoGA1HmED
	meSIjMAVoa6oLoQ/Kga4TknqmA16k2oMCJB2ksXlCh8JOljttcwv2LLIP2MYTJmX
	M584JL4/xd+Ab6sAUqLTexvitLf8lHgJjf17xHToBPIAiL6nm7i+E0sImldtltJw
	XiZwgznexaN2/Et3Plk3sVzKTK++uteeTe2qGKt/dg==
X-ME-Sender: <xms:2c1NZtroFsOxe5-T6MHX5zCMNzbXhbLYkhxHk07N0nRc5NaSgAiVJw>
    <xme:2c1NZvoc46Jqpq905JMPgroDp3EC5crgbL6IA3HX7vB1nL-VNRugHswRyrsqaTzxh
    lx3g_K0XDSP5A>
X-ME-Received: <xmr:2c1NZqNKlOCLfKigPE7tuZbxV1sQxPukQy4QAfag743dz0ImxhaOBjvoMrnjA9qiei9F3XMYBY9wV6AoB8XlAbOSYSny2FPbYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeigedgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:2c1NZo6lWUdggVK7JBN6bEyAYnhz2UDEwy3QT24FyS4oZ9SArgp6JA>
    <xmx:2c1NZs7VFOspiqfs3VX7jMLrpLIXxQVDbzo2IcSphyUrZ8k2v0_Fnw>
    <xmx:2c1NZgi5xA6wLN3jJ0xogjZJ-SXC-3pYIVZm0zXSvmSTZKW2q2iJ-g>
    <xmx:2c1NZu6J_f1KkGscKtcyLmLXGAyXML4XrhB_661OH1W9yqV46I-bvQ>
    <xmx:2s1NZmSBU7-rhn8-OkHvp9VTFl_kryf58FHLgbZ4i7CcDXWsVQ8VdrMU>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 22 May 2024 12:49:58 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 2/2] drivers/char: Use sub-page ro API to make just
 xhci dbc cap RO
Message-ID: <Zk3N1peuxXthOnwy@mail-itl>
References: <cover.1b2f25e20efaa1fe1e6a2da565731becd27e7ead.1716260066.git-series.marmarek@invisiblethingslab.com>
 <7682bbf3a24045ae1fcbdf651a6dd8e609ec3a20.1716260066.git-series.marmarek@invisiblethingslab.com>
 <0dbc701d-d8e6-4cbf-b7bf-27d9e05b5491@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RfZcqG+IrPjM0llv"
Content-Disposition: inline
In-Reply-To: <0dbc701d-d8e6-4cbf-b7bf-27d9e05b5491@suse.com>


--RfZcqG+IrPjM0llv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 May 2024 12:49:58 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 2/2] drivers/char: Use sub-page ro API to make just
 xhci dbc cap RO

On Wed, May 22, 2024 at 10:05:05AM +0200, Jan Beulich wrote:
> On 21.05.2024 04:54, Marek Marczykowski-G=C3=B3recki wrote:
> > --- a/xen/drivers/char/xhci-dbc.c
> > +++ b/xen/drivers/char/xhci-dbc.c
> > @@ -1216,20 +1216,19 @@ static void __init cf_check dbc_uart_init_posti=
rq(struct serial_port *port)
> >          break;
> >      }
> >  #ifdef CONFIG_X86
> > -    /*
> > -     * This marks the whole page as R/O, which may include other regis=
ters
> > -     * unrelated to DbC. Xen needs only DbC area protected, but it see=
ms
> > -     * Linux's XHCI driver (as of 5.18) works without writting to the =
whole
> > -     * page, so keep it simple.
> > -     */
> > -    if ( rangeset_add_range(mmio_ro_ranges,
> > -                PFN_DOWN((uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MAS=
K) +
> > -                         uart->dbc.xhc_dbc_offset),
> > -                PFN_UP((uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK)=
 +
> > -                       uart->dbc.xhc_dbc_offset +
> > -                sizeof(*uart->dbc.dbc_reg)) - 1) )
> > -        printk(XENLOG_INFO
> > -               "Error while adding MMIO range of device to mmio_ro_ran=
ges\n");
> > +    if ( subpage_mmio_ro_add(
> > +             (uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK) +
> > +              uart->dbc.xhc_dbc_offset,
> > +             sizeof(*uart->dbc.dbc_reg)) )
> > +    {
> > +        printk(XENLOG_WARNING
> > +               "Error while marking MMIO range of XHCI console as R/O,=
 "
> > +               "making the whole device R/O (share=3Dno)\n");
>=20
> Since you mention "share=3Dno" here, wouldn't you then better also update=
 the
> respective struct field, even if (right now) there may be nothing subsequ=
ently
> using that? Except that dbc_ensure_running() actually is looking at it, a=
nd
> that's not an __init function.

That case is just an optimization - if pci_ro_device() is used, nobody
else could write to PCI_COMMAND behind the driver backs, so there is no
point checking. Anyway, yes, makes sense to adjust dbc->share too.

> > +        if ( pci_ro_device(0, uart->dbc.sbdf.bus, uart->dbc.sbdf.devfn=
) )
> > +            printk(XENLOG_WARNING
> > +                   "Failed to mark read-only %pp used for XHCI console=
\n",
> > +                   &uart->dbc.sbdf);
> > +    }
> >  #endif
> >  }
>=20
> It's been a long time since v2 and the description doesn't say anything in
> this regard: Is there a reason not to retain the rangeset addition alongs=
ide
> the pci_ro_device() on the fallback path?

pci_ro_device() prevents device from being assigned to domU at all, so
that case is covered already. Dom0 would fail to load any driver (if
nothing else - because it can't size the BARs with R/O config space), so
a _well behaving_ Dom0 would also not touch the device in this case.
But otherwise, yes, it makes sense keep adding to mmio_ro_ranges in the
fallback path.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--RfZcqG+IrPjM0llv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmZNzdYACgkQ24/THMrX
1yzulwf/fLSbA75UWeJwt5Wks4vp5zyGXbvFK1zmkA3jBBNG5l4Xy4fSXgUD1mht
J0DY/S11sBo8poVJijba7tKTPHQl2rj/EOEFCQGFUi3+SJKGvYYcWLFQtOcZIZvV
FZ2zdctRlX/UYfBRRsX6TljKQnnqbKWx23cY3mXxgrOrki0VdOnVkocTxbX2tU7w
a28bJOqc8/9HM0J5iZA2Vmub1hBsRl4Kyo9HlUy5t+iMn6bIg1ov8gYfVrYnnSjC
YzgEvtsHvvQcXkfBLbt4jyg6gVB7xKKwVed23G89W9w0VAVc3kLynIdMZZBlCl0i
xNs+KgSGr/UQ9NKqNKWU15LSbVeRmQ==
=q+Pw
-----END PGP SIGNATURE-----

--RfZcqG+IrPjM0llv--

