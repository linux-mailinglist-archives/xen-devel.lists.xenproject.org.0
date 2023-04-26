Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 857DC6EFE1A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 01:44:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526862.818896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pronx-0005NA-KZ; Wed, 26 Apr 2023 23:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526862.818896; Wed, 26 Apr 2023 23:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pronx-0005KU-Hc; Wed, 26 Apr 2023 23:44:09 +0000
Received: by outflank-mailman (input) for mailman id 526862;
 Wed, 26 Apr 2023 23:44:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0jx=AR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pronv-0005KO-TJ
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 23:44:08 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38d7f14d-e48c-11ed-b224-6b7b168915f2;
 Thu, 27 Apr 2023 01:44:05 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id EBB6C3200319;
 Wed, 26 Apr 2023 19:43:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 26 Apr 2023 19:44:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Apr 2023 19:43:57 -0400 (EDT)
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
X-Inumbo-ID: 38d7f14d-e48c-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1682552639; x=1682639039; bh=juromuWe+xLzqtJizKVtk+5279RWmuI4tdO
	nzfQg3VA=; b=JXcLVRzpk4SmxtgnRfk9WA5rd/olIl1nr2PO3e5i/cUK3p57d/+
	oNl9qWoHVjnJgE5pL0FbJ7xS+kqOl0nyPW/dVz9o/zddWeJE83JQNdKbEt3odaS2
	wtC5KC9ORc38GwN06exiSJvMLShQt2iWHhIgANpg6mH4mJTIxxsi/UU4oQJtQ6X/
	bBg6GmUVQbaVE0Qdwm6xTO7KK0DZeBs/cqVS3hXa+WQo8KDV3jst7DZzOPz6RfF4
	lckF4fksV9qwFAEapASZMJVTMJcpoYQTSMQaEG29SWo7R+Rhm8NFxZPLxdWbslA9
	8avsB+SsKIAy6KeJImsvS+GUaWAC/cC6mAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1682552639; x=1682639039; bh=juromuWe+xLzq
	tJizKVtk+5279RWmuI4tdOnzfQg3VA=; b=PFHHEo4Fd4lh+ChhhPGd6D5a2oN2E
	jNqZY7c0MwKSwDbnpfHmD33fJ8XMtJ8Bg60PFmzwFnDYsBAZE05JZmpwij36gMof
	H2v2e3pNnc+uhA68A/DyfCi96n2x2XIzb168l2TVxsPmbAKHmnfndalOTwAwtVW3
	ikbya0AR0Uw2m9ibcWaCz0IAhMZXUTfhSoroMm4lhG9B8di1cfgSnVFFuaAM5lN/
	XayEs8HVK4JoIB6wH84xL6TxgA92B5gCIKOHtIxtxFz60tSwYWb85KomMxwc3Oth
	XagDlfAWaeVR3tuuYUDQBpdgsJp6FPfs71VpSsr1bSh5RXvI/bvjwbU4g==
X-ME-Sender: <xms:P7dJZACs70xsi4LxYBfB7AS1_X1MpV2a0a1gtGDRZlqy4QTce5wj2g>
    <xme:P7dJZChYiu4QOAKos3EXBTWOJRtNNBtBf-7kQWYufFv2HTOwSOTsCz8bEyoufuwvf
    WQfF_lYnFvJRg>
X-ME-Received: <xmr:P7dJZDnRW8hADTDwyl6bOJtO1B4L8ijZncPSYqhXXMXBiry3CMYGVm16qzZawWcs4MSmVMy8YW58oHTE_44KFZmtHjueW2ebiRk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduhedgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:P7dJZGy3gGBWHp-z_nVoTrOQ93X-pwBpY9PJ0jmkgEFnwsIcJVGPpw>
    <xmx:P7dJZFTlbLeg0XSxwLbxePGzNEyfJ5OUw2BBCGP_WWtKTu26AH0t8A>
    <xmx:P7dJZBa5vbEQcknWI08YipDC-6_iL94uaHNxU0NLkdUKxEbxxLN3gg>
    <xmx:P7dJZOJM4sYgELjXQUBoRuWwdLvTx047N-viXpxCdLI28Hq_K5tPlg>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 27 Apr 2023 01:43:55 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] ns16550: enable memory decoding on MMIO-based PCI
 console card
Message-ID: <ZEm3O2PL0NLWqoMk@mail-itl>
References: <20230425143902.142571-1-marmarek@invisiblethingslab.com>
 <ZEjXNLAVCixClGyl@Air-de-Roger>
 <b41e8eb0-a776-8924-429f-8abe7e70ead7@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="97dlg8z4lmExvfhD"
Content-Disposition: inline
In-Reply-To: <b41e8eb0-a776-8924-429f-8abe7e70ead7@suse.com>


--97dlg8z4lmExvfhD
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Apr 2023 01:43:55 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] ns16550: enable memory decoding on MMIO-based PCI
 console card

On Wed, Apr 26, 2023 at 10:24:28AM +0200, Jan Beulich wrote:
> On 26.04.2023 09:48, Roger Pau Monn=C3=A9 wrote:
> > On Tue, Apr 25, 2023 at 04:39:02PM +0200, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> >> --- a/xen/drivers/char/ns16550.c
> >> +++ b/xen/drivers/char/ns16550.c
> >> @@ -272,7 +272,15 @@ static int cf_check ns16550_getc(struct serial_po=
rt *port, char *pc)
> >>  static void pci_serial_early_init(struct ns16550 *uart)
> >>  {
> >>  #ifdef NS16550_PCI
> >> -    if ( !uart->ps_bdf_enable || uart->io_base >=3D 0x10000 )
> >> +    if ( uart->bar )
> >> +    {
> >> +        pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
> >> +                                  uart->ps_bdf[2]),
> >> +                         PCI_COMMAND, PCI_COMMAND_MEMORY);
> >=20
> > Don't you want to read the current command register first and just
> > or PCI_COMMAND_MEMORY?
> >=20
> > I see that for IO decoding we already do it this way, but I'm not sure
> > whether it could cause issues down the road by unintentionally
> > disabling command flags.
>=20
> Quite some time ago I asked myself the same question when seeing that
> code, but I concluded that perhaps none of the bits are really sensible
> to be set for a device as simple as a serial one. I'm actually thinking
> that for such a device to be used during early boot, it might even be
> helpful if bits like PARITY or SERR get cleared. (Of course if any of
> that was really the intention of the change introducing that code, it
> should have come with a code comment.)

I have mirrored the approach used for IO ports, with similar thinking,
and I read the above as you agree. Does it mean this patch is okay,
or you request some change here?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--97dlg8z4lmExvfhD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmRJtzoACgkQ24/THMrX
1yzVJwf/VoO+AdaYvfNdG/6HU8qru+NLn+kerIjpwDpiYdAZ7fQEoDQ/ZbAg0vv8
c+FRdA+xjs3kooQfY6moIKCeii9mvlkET0/UWSrKFgSNAkMHPALDaWwUR6jsNiq8
pHMn6it+ACN27tiT8oExY5LBCR6JE01WZ8qksmi2uPX3OZw25jSLTBUlPTcDtvNC
FubG5kiImn+eFkYL/cUKfotc7Mbx+LIlqYyq//nQp0uoXPEaq/ppLlXBdt9jJFed
1Ogr3eE3o4udmSQsTS/pwp/Wkmurr7VJU1BYUg8iwVV1gKQjhLB4wjuLkH2pbwlb
yiqf0t8zHfkVK69h4HwpruyF0ENxbQ==
=CNGE
-----END PGP SIGNATURE-----

--97dlg8z4lmExvfhD--

