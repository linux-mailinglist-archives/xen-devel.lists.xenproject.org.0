Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D146EDF1C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 11:23:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525924.817454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prEsw-0005Vk-AP; Tue, 25 Apr 2023 09:22:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525924.817454; Tue, 25 Apr 2023 09:22:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prEsw-0005So-6Y; Tue, 25 Apr 2023 09:22:54 +0000
Received: by outflank-mailman (input) for mailman id 525924;
 Tue, 25 Apr 2023 09:22:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHzL=AQ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1prEsu-0005Sh-Nm
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 09:22:52 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bea29891-e34a-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 11:22:50 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 5C5E332005C1;
 Tue, 25 Apr 2023 05:22:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 25 Apr 2023 05:22:47 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Apr 2023 05:22:44 -0400 (EDT)
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
X-Inumbo-ID: bea29891-e34a-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1682414565; x=1682500965; bh=n7mEZHqqlPL4GuAmu+P0KpVYPyPHX0Db6or
	cu4QoUDU=; b=ofpUM5MlX1mzGborQ6U/zTN7T3LNetR3enueMNXKd04sCg4H1HU
	BIkgsY3eXNEF3jvbFGWcn2oR45LCFTxwfOKhpKviwnizVbo/1oyXcEp5aLtocHG/
	ZAvcxN9Owb7uKAJk9+OjNueH+Lleq0b0ETO1vpC6qFt9cxqpjMavsGGZX9z71Gks
	SctfzNlQnH6GYoNg0fmCDEHTRK2chTz4kgH1m69T7AFNPuKZIwcAAuuLXD+h47tZ
	oxDAFlR0mno/kPH/UshVwVBXZvWZ/3irCtlvgjZ5sut4QpsDnr7Y9kV1fnjAbAsk
	ja1R6AnTYcij1r9hOAGWXAzjOjXeVM9/H4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1682414565; x=1682500965; bh=n7mEZHqqlPL4G
	uAmu+P0KpVYPyPHX0Db6orcu4QoUDU=; b=iwftkVvaFqonMFO9WW/mjPGa0pFzu
	B1/3fus/3i5hZkIcuba/FKS4huyRKKsheMErqSlnwAnpegAB0aAx/eSYWWW9PS4y
	iL0bpcrulYTJzAyF+xU2x68VXelxlO3pxkkQ2VSqFa4EMJBFdlviiepfQvtTWBQP
	05Gr3phlmbZvU1nDWx7qi6Ls+WeMSDyPhDVsxjppUjyL4UStl97c8iNiVEcd0CE3
	v21ZVIpSDTuzxQBrilfpwfFuNQY/8zKX+qEzHay7uhbChhpuhigUB57mkwWEz1vh
	Iz+f8r1BT6+uqAmnuuTbno3VtgrzdKFWKR0grPMzkUX+L6CtQU80yeKDw==
X-ME-Sender: <xms:5ZtHZBhQg3zkBi_dNd1TkzKVX3uljLUOtNPqgOM-zgWra8kWl03Yhw>
    <xme:5ZtHZGDG9Ot2Z9zgb226hqjkHsMZ2NtXpTAUg4Di0hT0JW7oYFsDC8riqBSLgzudq
    UOy5TKBhCYcig>
X-ME-Received: <xmr:5ZtHZBEPU3mdRfFh1t7xeRs1TWOHuU-DQJsLkO7vJ4qIxZO9w-fodL7jqZdwX9VA49v-FZkheAeOv1vZSKCL2XqLbqhZCVzwJl4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduvddgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:5ZtHZGQcdi6HjHiIvgfuJWuC7eNJ7p6EEJHnEEUjSwNDR_Y8H0m8vg>
    <xmx:5ZtHZOyyPwaLNgKVj9c3L9uNa_1LufSiwT-aLqFv9QVmZi6zUGuNhg>
    <xmx:5ZtHZM7SVf59UqbFl-8OMEPV_qZvTpt8zelNlQEU6rRlOroKHlx5Kg>
    <xmx:5ZtHZIsh3pCr89N5nuDQZGLyEBl8jlyMWpvNql7PV1K_jAIj5f_FtQ>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 25 Apr 2023 11:22:41 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] ns16550: enable memory decoding on MMIO-based PCI
 console card
Message-ID: <ZEeb4ieUq1B1cQsg@mail-itl>
References: <20230424233930.129621-1-marmarek@invisiblethingslab.com>
 <e93bd35b-42fb-3979-7e08-0d7f779e9ed1@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o+ldYxeBTrHEeD44"
Content-Disposition: inline
In-Reply-To: <e93bd35b-42fb-3979-7e08-0d7f779e9ed1@suse.com>


--o+ldYxeBTrHEeD44
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Apr 2023 11:22:41 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] ns16550: enable memory decoding on MMIO-based PCI
 console card

On Tue, Apr 25, 2023 at 10:05:25AM +0200, Jan Beulich wrote:
> On 25.04.2023 01:39, Marek Marczykowski-G=C3=B3recki wrote:
> > pci_serial_early_init() enables PCI_COMMAND_IO for IO-based UART
> > devices, do similar with PCI_COMMAND_MEMORY for MMIO-based UART devices.
>=20
> While I agree that something like this is needed (and in fact I have been
> wondering more than once why this wasn't there), what you say above isn't
> really correct imo: You do not really make things similar to port-based
> handling. For one you don't respect uart->pb_bdf_enable. And then you also
> don't write the BAR. When you use the BDF form of com<N>=3D, I don't see =
how
> else the BAR could be written to the value that you (necessarily) have to
> also specify on the command line.=20

I don't think MMIO-based UART is going to work without "pci" on the
command line at all. Setting the BAR is one of the reasons (there is
more to it than just setting (or reading) PCI_BASE_ADDRESS_0, as many
cards have UART registers at an offset), but also other parameters like
fifo_size. So, I don't think it's a good idea to set PCI_BASE_ADDRESS_0
to what user provided in io_base.

> As said on Matrix, using the "pci"
> sub-option together with the BDF one isn't intended (and would probably
> better be rejected), according to all I can tell. Which in turn means that
> for the "pci" sub-option alone to also have the effect of - if necessary -
> enabling I/O or memory decoding, a further adjustment would be needed
> (because merely keying this to uart->ps_bdf_enable then isn't enough). I
> guess like e.g. ns16550_init_postirq() you'd want to also check uart->bar.

Yes, checking also uart->bar makes sense.

> That said, I'm not meaning to mandate you to particularly deal with the
> bridge part of the setup, not the least because I consider bogus what we
> have. But you should at least mention in the description what you leave
> untouched (and hence dissimilar to port-based handling).
>=20
> As to rejecting invalid combinations of sub-options: See e.g. the dev_set
> variable in parse_namevalue_pairs(). That's a wee attempt to go in the
> intended direction.

That makes sense with the current code shape. At some point IMO it's
worth having an option to choose which PCI device to use, also for
MMIO-based cards, but I don't have a need for this feature right now.

> Jan
>=20
> > --- a/xen/drivers/char/ns16550.c
> > +++ b/xen/drivers/char/ns16550.c
> > @@ -272,9 +272,17 @@ static int cf_check ns16550_getc(struct serial_por=
t *port, char *pc)
> >  static void pci_serial_early_init(struct ns16550 *uart)
> >  {
> >  #ifdef NS16550_PCI
> > -    if ( !uart->ps_bdf_enable || uart->io_base >=3D 0x10000 )
> > +    if ( !uart->ps_bdf_enable )
> >          return;
> > =20
> > +    if ( uart->io_base >=3D 0x10000 )
> > +    {
> > +        pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
> > +                                  uart->ps_bdf[2]),
> > +                         PCI_COMMAND, PCI_COMMAND_MEMORY);
> > +        return;
> > +    }
> > +
> >      if ( uart->pb_bdf_enable )
> >          pci_conf_write16(PCI_SBDF(0, uart->pb_bdf[0], uart->pb_bdf[1],
> >                                    uart->pb_bdf[2]),
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--o+ldYxeBTrHEeD44
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmRHm+IACgkQ24/THMrX
1yyhnAgAmigbGE67ThnOdCcgO7WrstM++HrGTvar4fpC3mK/q1VkFlrxeB+AXRjY
eG++ne4G//wvxAJeP1uQZQSNCwLMGL4PboPQ1/RolhRoW8nj4fenIOjc96Dyc9rB
7FkEfe/SIiyEuu9PxFXbavEnrLEOPCVdfSBj0ZR1JA1bAcYwyVEHbslWG++qUdks
sqHSDa5neq4McV/ucC/JvOdxdxffCVZf15m/is7mqayM0smFuyGOLUTStI9cus1S
jXTJwyw44Foyd4bW+w6zDDEDVdPGwtTRZQvw3jPbwnKYxf7c4bbNpOoR6ysNRXh2
ttIBbaDPtYjwJ8EAa8LcVZsB9z+4dQ==
=KdJE
-----END PGP SIGNATURE-----

--o+ldYxeBTrHEeD44--

