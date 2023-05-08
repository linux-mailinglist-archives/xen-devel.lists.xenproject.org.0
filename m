Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE5C6FB333
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 16:46:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531603.827378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw27S-00010F-Sf; Mon, 08 May 2023 14:45:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531603.827378; Mon, 08 May 2023 14:45:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw27S-0000x9-PL; Mon, 08 May 2023 14:45:42 +0000
Received: by outflank-mailman (input) for mailman id 531603;
 Mon, 08 May 2023 14:45:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y8Ur=A5=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pw27Q-0000x3-Pq
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 14:45:41 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe45e7e3-edae-11ed-8611-37d641c3527e;
 Mon, 08 May 2023 16:45:38 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 2B0C35C0198;
 Mon,  8 May 2023 10:45:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 08 May 2023 10:45:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 May 2023 10:45:33 -0400 (EDT)
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
X-Inumbo-ID: fe45e7e3-edae-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1683557136; x=1683643536; bh=GalsNTfBovyiQ3QbCYOoCXADHgE91GHkBa5
	DzKiFpNI=; b=oxAmWlhgkuGMEXFUunr3DNH47p7sDDyAhVCjzNf1POru5DcOEjg
	ZNKo3q+5t342BaL2JbQv4H3sZV7NEc3OtlQaj8KMTts16ffvbkJq+TNqJad5V2Ij
	Z/vvIJwZO5FQuzSGXaV55dZ8irXMU4R9NftdW4J88eGoOm+7OFbQw4KelssJjf/3
	xPL+hau3pSRwBgEWXYzx+Do4uWs9CHYHNK7g2PvRu1YQ7OD5Q3/YqzTFd/HncLTs
	X8FrcU8tnH4xQdyV3VB1HU7qolgGT2KPQRcKayyTZeHPmLH6uR3bQ6cVYUvgeM5l
	rjuLcpzQwBea0e+xYEkMMGHXyneV/N/OP9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1683557136; x=1683643536; bh=GalsNTfBovyiQ
	3QbCYOoCXADHgE91GHkBa5DzKiFpNI=; b=EMILixeZBAaHHJgYOgzUtcNpUVCfF
	Ib9jyNVK2C/cckyKIr18HtNT02OaOw5bbZECLwtKC4yj0GL8YXrSHii8HLl/GV3B
	N+svB//1zwstwrQkXQCdbMNzNJoFlY9DNBYGLzMQ6+rY8y1Cb2fyQhnN2TQBXZAf
	+CB32UbcCrtZpfMcbHU3LdVKG2h3usuMZ8kZGzryfXa7hgijRKoB3N7SlhhUGedu
	PPFM2ed/nfDPWKVbpJfK4GzvPCgi3fJ3STUJX8UGaOKNG5GrlpZmILKpyWUrVRH4
	DbExOUgqHUFPRuBLFzAtdWni0ZmuObKUcGUCj8edNPN5Bfuu9Yd9QiEPw==
X-ME-Sender: <xms:DwtZZOgx7f_GEfFJiJonXKNbRaUXpzDelJq-asUJIktvq9u8vyYcJw>
    <xme:DwtZZPDLqoxCCPZO12aPgYnIvIzmdV7HBjahQpTC99G4Zs0hDIn2y3jdL5cwSzOG1
    mrvn87s5NJtfw>
X-ME-Received: <xmr:DwtZZGHNknDML4PknwaNswF9Yr1NyHo2fi06rn-1RL2tOluKCfx1CXgq-RZ7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefkedgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:DwtZZHQEVosl-Yng-HJEnoZV86KdPQI_chJD9df6n5Tnu1gPouEGdg>
    <xmx:DwtZZLzh04plgcs5CGsiz-jGTjMwASj4mra3HrLOUUOaalk-t36tQw>
    <xmx:DwtZZF6hPBurLQ6MA3scwPWd1-dwFAOnbXbbaz_nKG5avrXJk14DFA>
    <xmx:EAtZZNuOMtAei1IpTCvJZXR9DaFLSIDPCAOEquVKjyPxdg6JujwTKA>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 8 May 2023 16:45:30 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] ns16550: enable memory decoding on MMIO-based PCI
 console card
Message-ID: <ZFkLChRN7L+SjXyg@mail-itl>
References: <20230505214810.406061-1-marmarek@invisiblethingslab.com>
 <763df4ee-95d7-be20-212f-7450f3fd431e@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MYnSo1kS/nFwL/fs"
Content-Disposition: inline
In-Reply-To: <763df4ee-95d7-be20-212f-7450f3fd431e@suse.com>


--MYnSo1kS/nFwL/fs
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 8 May 2023 16:45:30 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] ns16550: enable memory decoding on MMIO-based PCI
 console card

On Mon, May 08, 2023 at 11:01:18AM +0200, Jan Beulich wrote:
> On 05.05.2023 23:48, Marek Marczykowski-G=C3=B3recki wrote:
> > pci_serial_early_init() enables PCI_COMMAND_IO for IO-based UART
> > devices, add setting PCI_COMMAND_MEMORY for MMIO-based UART devices too.
> > Note the MMIO-based devices in practice need a "pci" sub-option,
> > otherwise a few parameters are not initialized (including bar_idx,
> > reg_shift, reg_width etc). The "pci" is not supposed to be used with
> > explicit BDF, so do not key setting PCI_COMMAND_MEMORY on explicit BDF
> > being set. Contrary to the IO-based UART, pci_serial_early_init() will
> > not attempt to set BAR0 address, even if user provided io_base manually
> > - in most cases, those are with an offest and the current cmdline syntax
> > doesn't allow expressing it. Due to this, enable PCI_COMMAND_MEMORY only
> > if uart->bar is already populated. In similar spirit, this patch does
> > not support setting BAR0 of the bridge.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
> with ...
>=20
> > --- a/xen/drivers/char/ns16550.c
> > +++ b/xen/drivers/char/ns16550.c
> > @@ -272,6 +272,14 @@ static int cf_check ns16550_getc(struct serial_por=
t *port, char *pc)
> >  static void pci_serial_early_init(struct ns16550 *uart)
> >  {
> >  #ifdef NS16550_PCI
> > +    if ( uart->bar && uart->io_base >=3D 0x10000)
>=20
> ... (nit) the missing blank inserted, which I'll be happy to do while
> committing.

Thanks!

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--MYnSo1kS/nFwL/fs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmRZCwoACgkQ24/THMrX
1yweDgf/VYoswpWnZMdtshzSzmFxmIltDCjRlXb2573ThI7Wwjx6t2M28F+om1qh
J8bkD+fISFpIZnuDB9+x/BntvgwvpCsUXX0U/kuldnYTFi5MuJeopjlTn6u8db35
MnJQ4gTIghv2IBLZTHHIbWDMf/l+eWKARRrxUG31vvYsooiptRi1gLGYtcQpPjXs
UWRi3DmEqR4kGS/1QRUgIthuzv9zPfppFAD83OPZ11CTJhoeKtUxyhMjKAopQk7N
wtbNQOFDONcZOKNaq+/obF7oZEmoGLVvIjcxd+9Na5IalOrGEoNbVOgPh4/CV+yP
KpYsHSyW1hHaoi+83yn3DEGXzZFpfg==
=ltDc
-----END PGP SIGNATURE-----

--MYnSo1kS/nFwL/fs--

