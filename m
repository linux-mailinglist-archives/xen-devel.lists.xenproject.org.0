Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 474B770A40C
	for <lists+xen-devel@lfdr.de>; Sat, 20 May 2023 02:35:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537317.836363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0AYw-0000Km-9K; Sat, 20 May 2023 00:35:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537317.836363; Sat, 20 May 2023 00:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0AYw-0000HW-6b; Sat, 20 May 2023 00:35:10 +0000
Received: by outflank-mailman (input) for mailman id 537317;
 Sat, 20 May 2023 00:35:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=akxf=BJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1q0AYu-0000HQ-BS
 for xen-devel@lists.xenproject.org; Sat, 20 May 2023 00:35:08 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28720129-f6a6-11ed-b22d-6b7b168915f2;
 Sat, 20 May 2023 02:35:05 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id DA9DC5C00EB;
 Fri, 19 May 2023 20:35:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 19 May 2023 20:35:01 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 May 2023 20:35:00 -0400 (EDT)
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
X-Inumbo-ID: 28720129-f6a6-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1684542901; x=1684629301; bh=8JWnuXKvqOBFUdIwI9GejWOITXtszPdzG0y
	gzBHRP0o=; b=lT3HH1jUdpjEvwt6gVvEnZSLA7v1BbUDLq0BxQheHEmWn/A18So
	Ij+AgboUwmVhXnhhRWK/TE7CfF/PuFTbswz1PC+Dkuff4nt1MSJsHRw6CJdNci+O
	p5yd+2yVRNyo2pr9iQ7ujm2oexGd1sUigEWPaBi3oduE2NPBcFUfzZkc7EBwUTIp
	TwH+vpQU0Tyv6pbrKwmtaNOdUgjhLSFB1RiIVCZ0A8G9gQ41gYZYPkWGaH2SR/+c
	cVd8kgOzlog8oOLWLkDvZ2548LhhmJh5qMJC5WDBlPobuKbVlt2yHrq6s5WHlmOW
	mkWztiQ6PGI48c4UiwspDdwEoLEklrpx9nA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1684542901; x=1684629301; bh=8JWnuXKvqOBFU
	dIwI9GejWOITXtszPdzG0ygzBHRP0o=; b=p+trJPHhzIZVYkS/bJ5aF1/7xT0CM
	wlTz8aBz0exHO/4XrDjb8MxtR6UtC3bMfhM/DunH0GXswVg+IafbHsPzHwjJNSHP
	0ypEE9H9J2ys7BukAIuJHNW/1NlhNoIN+td1kD3KNG91zXQwe3KhndrljrYnsDkJ
	fHGakd/O2E46S+G7Ae5KWKtqVFzy/gfotKYP9cYzifiBDXOlAP76ha3sdpb4IMTe
	mpeGAexai1C1PVsMs327ssFyh0pAivN2FKlFeDbZ2oP4eeywn04KPEEUncns9VzX
	HLnzS3GevByYo4d89nvteHi+nRCG0lJItbzMU8Nyny7Pm95/h68pTnHuQ==
X-ME-Sender: <xms:tRVoZIaFWT6GP01rwebjlU7QENQhoUFtlzLMCx9zpAEkxP3eUjb0OQ>
    <xme:tRVoZDZako3WWsCa7CCQyi6oDpM4UulhUvdUkx05Mc8XvmYWAEqAPaXnoNTo-uy8r
    e1kdOqVo-2U1Q>
X-ME-Received: <xmr:tRVoZC9FhbmfUgQO0Z-AuoOfQeBvlDv-3DZ8bKejBHHwJLfWQTW4ur1lVwghfiYs4DGCLFqjD7lz1ov5RknDkJOvgnn5YLY_-1o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeiiedgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepuddu
    geelhefhteektdekvefgieeugedutdffgefgvdduieetleeuveelieeulefgnecuffhomh
    grihhnpehmrghtrhhigidrohhrghdpihhnvhhishhisghlvghthhhinhhgshhlrggsrdgt
    ohhmpdhgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:tRVoZCobHojYxrwqtoChuedO6aLEBw1fiViW9qx7WqP6q44wJGZqpw>
    <xmx:tRVoZDoRNbSnvd7vd2Dvt58FRXPlJQ2tAfQhxNKMZLIcArmDG2KxBQ>
    <xmx:tRVoZAQOcRa4It9TFjYZqohW7g54TjHoRQnOuCUWgs9CHXmvWzWD6g>
    <xmx:tRVoZCWwg4QOi6cJCAUZd9hwWSLmmXcNISa5MqyubaH0pFtkfnFCsw>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 20 May 2023 02:34:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	jbeulich@suse.com, andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org, xenia.ragiadakou@amd.com
Subject: Re: PVH Dom0 related UART failure
Message-ID: <ZGgVsRuAm/+RqA1C@mail-itl>
References: <alpine.DEB.2.22.394.2305171745450.128889@ubuntu-linux-20-04-desktop>
 <ZGX/Pvgy3+onJOJZ@Air-de-Roger>
 <alpine.DEB.2.22.394.2305181748280.128889@ubuntu-linux-20-04-desktop>
 <ZGcu7EWW1cuNjwDA@Air-de-Roger>
 <alpine.DEB.2.22.394.2305191641010.815658@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Cl3FzbKZSqTcwbFj"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2305191641010.815658@ubuntu-linux-20-04-desktop>


--Cl3FzbKZSqTcwbFj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 20 May 2023 02:34:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	jbeulich@suse.com, andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org, xenia.ragiadakou@amd.com
Subject: Re: PVH Dom0 related UART failure

On Fri, May 19, 2023 at 05:02:21PM -0700, Stefano Stabellini wrote:
> On Fri, 19 May 2023, Roger Pau Monn=C3=A9 wrote:
> > On Thu, May 18, 2023 at 06:46:52PM -0700, Stefano Stabellini wrote:
> > > On Thu, 18 May 2023, Roger Pau Monn=C3=A9 wrote:
> > > > On Wed, May 17, 2023 at 05:59:31PM -0700, Stefano Stabellini wrote:
> > > > > Hi all,
> > > > >=20
> > > > > I have run into another PVH Dom0 issue. I am trying to enable a P=
VH Dom0
> > > > > test with the brand new gitlab-ci runner offered by Qubes. It is =
an AMD
> > > > > Zen3 system and we already have a few successful tests with it, s=
ee
> > > > > automation/gitlab-ci/test.yaml.
> > > > >=20
> > > > > We managed to narrow down the issue to a console problem. We are
> > > > > currently using console=3Dcom1 com1=3D115200,8n1,pci,msi as Xen c=
ommand line
> > > > > options, it works with PV Dom0 and it is using a PCI UART card.
> > > > >=20
> > > > > In the case of Dom0 PVH:
> > > > > - it works without console=3Dcom1
> > > > > - it works with console=3Dcom1 and with the patch appended below
> > > > > - it doesn't work otherwise and crashes with this error:
> > > > > https://matrix-client.matrix.org/_matrix/media/r0/download/invisi=
blethingslab.com/uzcmldIqHptFZuxqsJtviLZK
> > > >=20
> > > > Jan also noticed this, and we have a ticket for it in gitlab:
> > > >=20
> > > > https://gitlab.com/xen-project/xen/-/issues/85
> > > >=20
> > > > > What is the right way to fix it?
> > > >=20
> > > > I think the right fix is to simply avoid hidden devices from being
> > > > handled by vPCI, in any case such devices won't work propewrly with
> > > > vPCI because they are in use by Xen, and so any cached information =
by
> > > > vPCI is likely to become stable as Xen can modify the device without
> > > > vPCI noticing.
> > > >=20
> > > > I think the chunk below should help.  It's not clear to me however =
how
> > > > hidden devices should be handled, is the intention to completely hi=
de
> > > > such devices from dom0?
> > >=20
> > > I like the idea but the patch below still failed:
> > >=20
> > > (XEN) Xen call trace:
> > > (XEN)    [<ffff82d0402682b0>] R drivers/vpci/header.c#modify_bars+0x2=
b3/0x44d
> > > (XEN)    [<ffff82d040268714>] F drivers/vpci/header.c#init_bars+0x2ca=
/0x372
> > > (XEN)    [<ffff82d0402673b3>] F vpci_add_handlers+0xd5/0x10a
> > > (XEN)    [<ffff82d0404408b9>] F drivers/passthrough/pci.c#setup_one_h=
wdom_device+0x73/0x97
> > > (XEN)    [<ffff82d0404409b0>] F drivers/passthrough/pci.c#_setup_hwdo=
m_pci_devices+0x63/0x15b
> > > (XEN)    [<ffff82d04027df08>] F drivers/passthrough/pci.c#pci_segment=
s_iterate+0x43/0x69
> > > (XEN)    [<ffff82d040440e29>] F setup_hwdom_pci_devices+0x25/0x2c
> > > (XEN)    [<ffff82d04043cb1a>] F drivers/passthrough/amd/pci_amd_iommu=
=2Ec#amd_iommu_hwdom_init+0xd4/0xdd
> > > (XEN)    [<ffff82d0404403c9>] F iommu_hwdom_init+0x49/0x53
> > > (XEN)    [<ffff82d04045175e>] F dom0_construct_pvh+0x160/0x138d
> > > (XEN)    [<ffff82d040468914>] F construct_dom0+0x5c/0xb7
> > > (XEN)    [<ffff82d0404619c1>] F __start_xen+0x2423/0x272d
> > > (XEN)    [<ffff82d040203344>] F __high_start+0x94/0xa0
> > >=20
> > > I haven't managed to figure out why yet.
> >=20
> > Do you have some other patches applied?
> >=20
> > I've tested this by manually hiding a device on my system and can
> > confirm that without the fix I hit the ASSERT, but with the patch
> > applied I no longer hit it.  I have no idea how can you get into
> > init_bars if the device is hidden and thus belongs to dom_xen.
>=20
> Unfortunately it doesn't work. Here are the full logs with interesting
> DEBUG messages (search for "DEBUG"):
> https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/4318489116
> https://gitlab.com/xen-project/people/sstabellini/xen/-/commit/31c400caa7=
b86d4c14f9553138e02af18d3b3284
>=20
> [...]
> (XEN) DEBUG ns16550_init_postirq 432  03:00.0
> [...]
> (XEN) DEBUG vpci_add_handlers 75 0000:00:00.0 0^M
> (XEN) DEBUG vpci_add_handlers 75 0000:00:00.2 1^M
> (XEN) DEBUG vpci_add_handlers 78 0000:00:00.2^M
> (XEN) DEBUG vpci_add_handlers 75 0000:00:01.0 0^M
> (XEN) DEBUG vpci_add_handlers 75 0000:00:02.0 0^M
> (XEN) DEBUG vpci_add_handlers 75 0000:00:02.1 0^M
>=20
> Then crash on drivers/vpci/header.c#modify_bars
>=20
> vpci_add_handlers hasn't even been called yet for the interesing device,
> which is 03:00.0 (not 00:02.1).

This device is behind a bridge, could it maybe be related to marking
(part of) BAR of such device as R/O? FWIW, the bridge is at 00:02.4.

> At that pointed I doubted myself on the previous test so I went back and
> re-run it again. I do confirm that the below patch instead (instead, not
> in addition) works:
>=20
>=20
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index 212a9c49ae..24abfaae30 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -429,17 +429,6 @@ static void __init cf_check ns16550_init_postirq(str=
uct serial_port *port)
>  #ifdef NS16550_PCI
>      if ( uart->bar || uart->ps_bdf_enable )
>      {
> -        if ( uart->param && uart->param->mmio &&
> -             rangeset_add_range(mmio_ro_ranges, PFN_DOWN(uart->io_base),
> -                                PFN_UP(uart->io_base + uart->io_size) - =
1) )
> -            printk(XENLOG_INFO "Error while adding MMIO range of device =
to mmio_ro_ranges\n");
> -
> -        if ( pci_ro_device(0, uart->ps_bdf[0],
> -                           PCI_DEVFN(uart->ps_bdf[1], uart->ps_bdf[2])) )
> -            printk(XENLOG_INFO "Could not mark config space of %02x:%02x=
=2E%u read-only.\n",
> -                   uart->ps_bdf[0], uart->ps_bdf[1],
> -                   uart->ps_bdf[2]);
> -
>          if ( uart->msi )
>          {
>              struct msi_info msi =3D {


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Cl3FzbKZSqTcwbFj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmRoFbEACgkQ24/THMrX
1yytRAf/SKHGJInOXUyXa+SlnbHIgGZcJAIO8MHFKtcR7M8em/GXsyLE59EheGXQ
UWnOAt4I+d1f788a1pLPZ0EkqTJksEW95vRRYE/Oj4dbib2PEB9LbxrAd/tdMscJ
mrHgZSkkeQpbalYpnBp9A68Ie+jNtfdmRPdtaDyH0Cxr8ib+rsnY598XTr89gY/0
6Z6Fp4D9VLK0QIbOzRQBiVXc565RxObJRVZEBa34dGCebk6alB1gdB5K4b9rVoIZ
2gczEOCCgb5gy9G+g5z1bJxrNkye3KC5V1Gt0i480tMsTDYd1si4fUcxsiDLAGiT
Z7kqbcM6sVNFWAsttpDwNQaDQ+SUHg==
=W7Rz
-----END PGP SIGNATURE-----

--Cl3FzbKZSqTcwbFj--

