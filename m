Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA806EDF41
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 11:30:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525932.817464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prF09-00073j-5a; Tue, 25 Apr 2023 09:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525932.817464; Tue, 25 Apr 2023 09:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prF09-00071G-2f; Tue, 25 Apr 2023 09:30:21 +0000
Received: by outflank-mailman (input) for mailman id 525932;
 Tue, 25 Apr 2023 09:30:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHzL=AQ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1prF07-00070t-PL
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 09:30:19 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c91fd13e-e34b-11ed-8611-37d641c3527e;
 Tue, 25 Apr 2023 11:30:17 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id C9B0B320096B;
 Tue, 25 Apr 2023 05:30:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 25 Apr 2023 05:30:14 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Apr 2023 05:30:11 -0400 (EDT)
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
X-Inumbo-ID: c91fd13e-e34b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1682415013; x=1682501413; bh=UI7v9qpm2wM1dJOLNNZWpO2w8GjESz36ETP
	nStloqCo=; b=kqH/YXRtQhN1inkhLamlO3PDbbp67aGfS+OH9Pruouf8DhGoQ3b
	AZK1OdGCOskWGG4WDgIn5r7gf7ZPbX1iK6nCy2Ivk50U2LTmTD8Pe9VIBYsMDv/J
	pICjTL2JUfD/8hmk2YXiClb1Or5g6DPgTciCBGcvGEW9LAI/YD5QlZtMPIe3RHv6
	QA1eQ2xR8z/JlbbQmKyN7NmeLaynhpKKwyuM3vZ0+Bv3GMbO30G2wcZMNqZ0FC+j
	pNJXOCDyTHyFm5bur9LvwsLl8ecaQ86ot9ynw3IrPZZEGdyC3Sx79s1XtuXqdHsU
	pMCw8sOGHLEQs8ns/ze/j68VtSIQXEnPbew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1682415013; x=1682501413; bh=UI7v9qpm2wM1d
	JOLNNZWpO2w8GjESz36ETPnStloqCo=; b=NUUTDpnBC46mlEiwFGf300L3A+mJT
	uveRcYq5R3kU7tiGG+FCB4YP3iNBD/cHYXnKYn1HxEI9+2TE9WUEG7n1KkQzqKhS
	4MpPnBgKWUeAQD4TC04z6rKLFqrv8nW/yZ/DW9O3ulOkO1gL4Rz+d/GcCVJMiTwK
	jvKwihKnFcTkmKpfaUhqSpAd8sMmAC5+VrPB7F1OGXBQLKC6G36C/cip/xewOo+u
	bakEgu+yPhnWNsSbfhTISMweaa05xEpBYRfZHZBzeLoZpZVwquX5qlXgV29vbYUS
	WoYbqeZVcJwfaG0EzhOefdBibYpOEweHnUcbBKOK1WSTPCf5iQlqZdKlg==
X-ME-Sender: <xms:pZ1HZCaYoAvCyeIXUcSNyxjhYuwrKhnhEto6dMQsHn6Cg0E6pfI7fQ>
    <xme:pZ1HZFYIEbsaKwm7UmbTNfNKPPiBPUMYgaR454xYAtJhpoCeh4extYjh3nyb9Xe0n
    -Szt1vrB_YR2w>
X-ME-Received: <xmr:pZ1HZM8oZi7kmdpDOrPoM_Zvz45R5z9X7AyPLw_aiCb_-gTmnXBxXZfcZtLa-uv8ptLsCFoCRKla71D3Nh5rEh0SElw2mak86-I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduvddgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:pZ1HZErG4O-LxN5QMriXmfPNRvegADqcSSibZCFvvhQQdgAmezGwKQ>
    <xmx:pZ1HZNqtVkmXAm8F4nrdwdKHmivIsI1AukjO7jgatmnciPsNko0ccg>
    <xmx:pZ1HZCR--OvPCa3klKb0nbfXNL9xjCWIYxlYWGEQkonKTISWy3DF4w>
    <xmx:pZ1HZOluAPDSk2O52mbK0iyXYUPOHWp-VbjNG_x37_dNYxJee3UUBA>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 25 Apr 2023 11:30:08 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] ns16550: enable memory decoding on MMIO-based PCI
 console card
Message-ID: <ZEedoM+iqUUroneP@mail-itl>
References: <20230424233930.129621-1-marmarek@invisiblethingslab.com>
 <e93bd35b-42fb-3979-7e08-0d7f779e9ed1@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3zpo+Ev1W+2Pp2ss"
Content-Disposition: inline
In-Reply-To: <e93bd35b-42fb-3979-7e08-0d7f779e9ed1@suse.com>


--3zpo+Ev1W+2Pp2ss
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Apr 2023 11:30:08 +0200
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

--3zpo+Ev1W+2Pp2ss
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmRHnaAACgkQ24/THMrX
1yxV1QgAmByH3X0slNQEPxJ5CA71kaoVU9VQAO9habWVMGdQZ6f5QCvHn2ScvO8l
JTQPFbqxplnfWkPrWr1yvA93fFkOadPvC8yxWQNqUrkKY2TU0WjVWPgiQlcYxW5p
eG0jE+gHEEhZy7M+mNqJXXNwi/PCQyydHHHF3lO/dTtFDho/a5twpzgr3b3FPX7N
WF93gq62fnC/itXA3HH3bU+sc5J9zO+cH3qUVKBFDgo42ZfDq6VF8Y5Szdh1dHzO
hzpgKdpd5/WlJSiIhaVE0C3moZCQpTCXWjLE1N6B2E/Dkn2gb8dpVVl8vW5P6mV9
/taIoRQNpOEbe2sDKNKIgiQe3msrMw==
=0aWC
-----END PGP SIGNATURE-----

--3zpo+Ev1W+2Pp2ss--

