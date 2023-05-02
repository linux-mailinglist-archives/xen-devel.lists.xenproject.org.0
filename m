Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D60C6F4B90
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 22:44:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528828.822468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptwr3-0001eM-FS; Tue, 02 May 2023 20:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528828.822468; Tue, 02 May 2023 20:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptwr3-0001bC-C5; Tue, 02 May 2023 20:44:09 +0000
Received: by outflank-mailman (input) for mailman id 528828;
 Tue, 02 May 2023 20:44:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b5+i=AX=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ptwr2-0001b6-GB
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 20:44:08 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1389ce24-e92a-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 22:44:05 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 2EA135C0206;
 Tue,  2 May 2023 16:44:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 02 May 2023 16:44:04 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 May 2023 16:44:02 -0400 (EDT)
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
X-Inumbo-ID: 1389ce24-e92a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1683060244; x=1683146644; bh=bquulcUGVvPXVr3hhUZYxsQgDschilipxpo
	PBxW7lwM=; b=RPmQ0OEV9S1XkKuov9bdECga8Q63lGNujL6ihp0PnRNOmlBYp7l
	EsvBDkYTCNEiDTD8WP6tOee8+sayAI3Fx9y7ZcpmmZ+ou/AhR5Oh3dQAXoiIFSan
	amtiFluu6Hj7BMyLhViAT5i1SI+Fkz7AQ0d49oNlnQS04R4oaVOHA1/gTtjVe2Dc
	wO/sFNKj3PU3mrBZg05Yv/VlSefvV3kFDlCGpmG/W/9QQIwoVGxOfsH28DBDCaqT
	N8gkWDQMJq+cONor2MdJSk9tMwg0MjnE9ReybQ7WTNyafJVW0KF9zvoWKRFryyNF
	WI+l2AV7hByEb4zm00CdvUYtIx3aP3769Sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1683060244; x=1683146644; bh=bquulcUGVvPXV
	r3hhUZYxsQgDschilipxpoPBxW7lwM=; b=hHrHP8WKRMORzXF/1BbhU2fLHwaxC
	+SIWNSZAakxT1Xjiw2S4+upHy4LtpWg89ea3rUS42UJVq9QMN5fpSUBBmheMEvm3
	11qNlg4sKrLSvUCc8qNvNUEFjZCVmqthKmU/d1K+BF/sgOpuxyuGwFkfBf8+hqSX
	7Zt3fih/ZsgANDSLoMNgQczj63l1ItxGlooXPLoDSZ2raYWhReUnS3TFgtWDnE4e
	ulaJEooge2O1aVDlu9rlNOt/Eg6YRQfaIirQ5Pmovd56T/qEXnPa1G+42jRaSgxk
	srviAENp5d+ALe/+9wSYlKQvWCKMVeHLMRpuIJjZ9f657hgOx7GnaunWQ==
X-ME-Sender: <xms:E3ZRZB-kVMC_FO4nyrDydFnbPoKPVeehzfhjg0a6WOp7ZTJ-IyUYGg>
    <xme:E3ZRZFvXB2bS4HnIImV4hs668OcZzbpWpSH25FfooQIvr15J-lVEAL127QnpW2xJU
    WOnjyUEEJdg0A>
X-ME-Received: <xmr:E3ZRZPDLFuYiAGlyEd4AniNNLrfZDdoraytrdavI7_yhF8GZEX861MIv4y1IcLFo0J5g9tMYZ2btG44qQTPVwKkKv8bSzib5uE8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedviedgudehfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    udelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:E3ZRZFfhEdkJ7CJ5PXMmNmlwTx_fD1joy8ha3KrD8D9nuH6C-t4Vqw>
    <xmx:E3ZRZGPgiOcR1sX8aHDGmmx0fVdUlIJzzm8xJKDjUaQ-3FuPLHqAEA>
    <xmx:E3ZRZHkYC8WEzuJjgJAwB_YUYOcIVIjfES7db8EA562avGwKO9qT4A>
    <xmx:FHZRZDp4koRt3K0bpUFNlosNeteRmvU__iJejTJTOWi1HiZm6y2VBg>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 2 May 2023 22:43:58 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] ns16550: enable memory decoding on MMIO-based PCI
 console card
Message-ID: <ZFF2D0NkvJdkR1dU@mail-itl>
References: <20230425143902.142571-1-marmarek@invisiblethingslab.com>
 <a3f2d048-78c5-9a5d-d44d-3a930ba780fd@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eIxYRDk9pctUlU0V"
Content-Disposition: inline
In-Reply-To: <a3f2d048-78c5-9a5d-d44d-3a930ba780fd@suse.com>


--eIxYRDk9pctUlU0V
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 2 May 2023 22:43:58 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] ns16550: enable memory decoding on MMIO-based PCI
 console card

On Tue, May 02, 2023 at 12:53:15PM +0200, Jan Beulich wrote:
> On 25.04.2023 16:39, Marek Marczykowski-G=C3=B3recki wrote:
> > pci_serial_early_init() enables PCI_COMMAND_IO for IO-based UART
> > devices, add setting PCI_COMMAND_MEMORY for MMIO-based UART devices too.
>=20
> This sentence is odd, as by its grammar it looks to describe the current
> situation only. The respective sentence in v1 did not have this issue.
>=20
> > --- a/xen/drivers/char/ns16550.c
> > +++ b/xen/drivers/char/ns16550.c
> > @@ -272,7 +272,15 @@ static int cf_check ns16550_getc(struct serial_por=
t *port, char *pc)
> >  static void pci_serial_early_init(struct ns16550 *uart)
> >  {
> >  #ifdef NS16550_PCI
> > -    if ( !uart->ps_bdf_enable || uart->io_base >=3D 0x10000 )
> > +    if ( uart->bar )
> > +    {
> > +        pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
> > +                                  uart->ps_bdf[2]),
> > +                         PCI_COMMAND, PCI_COMMAND_MEMORY);
> > +        return;
> > +    }
> > +
> > +    if ( !uart->ps_bdf_enable )
> >          return;
> > =20
> >      if ( uart->pb_bdf_enable )
>=20
> While I did suggest using uart->bar, my implication was that the io_base
> check would then remain in place. Otherwise, if I'm not mistaken, MMIO-
> based devices not specified via "com<N>=3D...,pci" would then wrongly take
> the I/O port path.

I don't think MMIO-based devices specified manually have great chance to
work anyway (see the commit message), but indeed I shouldn't have broken
them even more.

> Furthermore - you can't use uart->bar alone here, can you? The field is
> set equally for MMIO and port based cards in pci_uart_config().

Right, I'll restore the io_base check.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--eIxYRDk9pctUlU0V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmRRdg8ACgkQ24/THMrX
1yxm9wf/dusj5o4WiivPB3JYBb6aS4pI2gj3KvUbO+8zK5nxFkL5SCTxE/4gMhY2
aTNlNTnxfo7xuhWqptqaJ1tM9mScc6vwHODrwUf6jv8o8K+YFZoEPgfhyeEC2Xjn
qJA6M8JPaEWi+QPCSbY2BeVlxXTNM30xKOoBIuCav9v8OMozbz02OGescxyDCt0e
xUzFozvsy/KC4Bvv22sZ7YxwKad+KbfmNhFN791YZ97RFn4uTErAgVCV/ajGH6FE
fXQeVQcLymxyWBI4tlicQdw9SNVYwvm0bkHXhjP6MmGXQhc//LxssUIRPe/KVXW9
DcAWB7caQ7yNyV+kbvFO6qK3UlMgtw==
=Q3KG
-----END PGP SIGNATURE-----

--eIxYRDk9pctUlU0V--

