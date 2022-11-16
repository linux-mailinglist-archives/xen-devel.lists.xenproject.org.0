Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6275E62CCE0
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 22:41:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444412.699589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovQ8k-00005J-7z; Wed, 16 Nov 2022 21:40:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444412.699589; Wed, 16 Nov 2022 21:40:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovQ8k-0008VA-56; Wed, 16 Nov 2022 21:40:14 +0000
Received: by outflank-mailman (input) for mailman id 444412;
 Wed, 16 Nov 2022 21:40:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=URqW=3Q=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ovQ8i-0008TX-F3
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 21:40:12 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e1b3d5c-65f7-11ed-8fd2-01056ac49cbb;
 Wed, 16 Nov 2022 22:40:10 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id DE3CD5C01F3;
 Wed, 16 Nov 2022 16:40:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 16 Nov 2022 16:40:08 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Nov 2022 16:40:07 -0500 (EST)
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
X-Inumbo-ID: 3e1b3d5c-65f7-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1668634808; x=
	1668721208; bh=79ymK68beQa1zK3znI/v+JsysT5CmM/aDYWh63Kes/Y=; b=k
	4ti1iaeVYjYjuhHhZPofLTGWtawGjZuRyt7PNO4RR9xygMfmad9gvPj5SPMtxbaT
	JcB3GcfEWl5XTPiav65bg+qjCx5r6auFTfdDw5+uXhDOeTsvnTVwGKwU9q8AT1Ea
	XpNsPzD/zbhM3XYsgT046QwVNEdxewkMlEXhrq6s6sQB0NuEcU4ARXJhSILL6ztk
	eo74yOU3NYLPybAiJmq9LqA+xF5i8wQtH9lwYkb6yUYjjq+9v9KqEGIHMSRSLUxw
	zr07a9iYTdSVdfqwC0SyV9rke1ZilcMgtTXrs16+MmzUlEy75g8O0/a5Aw758c6L
	ZcM1nMUXwU+yW2GL68RPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1668634808; x=1668721208; bh=79ymK68beQa1zK3znI/v+JsysT5C
	mM/aDYWh63Kes/Y=; b=X6rOSiE+RkQHmcK9nrlMTCoDlA0yXXFgVzw3CsfeMfk1
	CMv+cioEgXjGTiq/gHKJn2H2Q4K/6Doxkb++G8JfdRUTWsMESQY0UpMZ+EeHwrSr
	DilplfZRAOIsXbwVLUN6Q9LfmQdJsMO0i5jUYeqSJiwPu35lZa9EkJ7dygMd8wqA
	o/wpIkTTJwEXR0QLFzuITr7iOxoN7Jy6smMSro5NrdmWMqw3or9F0Vl1BUQhzb70
	cjYpgVuR78Rf0Vs+6jW4Ofg/R9mRoWjyQov4qzQrOXgE/hcYyuJzhoHPqZXCvOZW
	+3iP0IrOUZfIhghLRNms+Odlplpz9IAY0g9Hn1hDfw==
X-ME-Sender: <xms:uFh1Y315j3tqr7CmtC8HqvSFrwu4ap79vF9sTSdywvREkTfQtUiTKQ>
    <xme:uFh1Y2EkbzCliM4wb1_VJAHtADQPU4mcPER-OOdnNf5dlM-r90GKennlsbVuAEbru
    95OchW0MIqj4w>
X-ME-Received: <xmr:uFh1Y377zRhQmLsYXmXQQfLUU-ohAKIRCMsZ2STNZWME410MTkF-sMMGUA3_hHe0fW7zqeNBfk8K9v7y6DTXbmke7C0ldJAfKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeigdduhedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueek
    teetgefggfekudehteegieeljeejieeihfejgeevhfetgffgteeuteetueetnecuffhomh
    grihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:uFh1Y820sgCTrcNEbuVX10-5YyO5uqPacT1LnYtZF5GBUqBapbGfzQ>
    <xmx:uFh1Y6HtxolulhVOcZ9S13OCyJjpeShqzN9fnbqbiWsypoD1neY8yg>
    <xmx:uFh1Y99vhJLdfRqNw8Czc6ybnaNn8Eu56QaGxEbgTZCTljPEDZhVdA>
    <xmx:uFh1Y2BScbZbWS0cCfBhYS6UyEX9_YNqmr3LP2rt6o2wlF00qpdmQA>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 16 Nov 2022 22:40:02 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] Do not access /dev/mem in MSI-X PCI passthrough on
 Xen
Message-ID: <Y3VYs/sS4VddrBCK@mail-itl>
References: <20221114192011.1539233-1-marmarek@invisiblethingslab.com>
 <20221114192011.1539233-2-marmarek@invisiblethingslab.com>
 <CAKf6xpvpsJuMZx98vLJ7CAmUWG-vW91Am0L8817eD8nmAN4NUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pdecqJYtKVupcCRx"
Content-Disposition: inline
In-Reply-To: <CAKf6xpvpsJuMZx98vLJ7CAmUWG-vW91Am0L8817eD8nmAN4NUw@mail.gmail.com>


--pdecqJYtKVupcCRx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Nov 2022 22:40:02 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] Do not access /dev/mem in MSI-X PCI passthrough on
 Xen

On Wed, Nov 16, 2022 at 02:15:22PM -0500, Jason Andryuk wrote:
> On Mon, Nov 14, 2022 at 2:21 PM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > The /dev/mem is used for two purposes:
> >  - reading PCI_MSIX_ENTRY_CTRL_MASKBIT
> >  - reading Pending Bit Array (PBA)
> >
> > The first one was originally done because when Xen did not send all
> > vector ctrl writes to the device model, so QEMU might have outdated old
> > register value. This has been changed in Xen, so QEMU can now use its
> > cached value of the register instead.
> >
> > The Pending Bit Array (PBA) handling is for the case where it lives on
> > the same page as the MSI-X table itself. Xen has been extended to handle
> > this case too (as well as other registers that may live on those pages),
> > so QEMU handling is not necessary anymore.
> >
> > Removing /dev/mem access is useful to work within stubdomain, and
> > necessary when dom0 kernel runs in lockdown mode.
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>=20
> I put the Xen, QEMU, and xen-pciback patches into OpenXT and gave a
> little test.  When pci_permissive=3D0, iwlwifi fails to load its
> firmware.  With pci_permissive=3D1, it looks like MSI-X is enabled. (I
> previously included your libxl allow_interrupt_control patch - that
> seemed to get regular MSIs working prior to the MSI-X patches.)  I
> also removed the OpenXT equivalent of 0005-Disable-MSI-X-caps.patch.
> I am testing with Linux 5.4.y, so that could be another factor.

Can you confirm the allow_interrupt_control is set by libxl? Also,
vanilla 5.4 doesn't have the allow_interrupt_control patch at all, and you
may have an earlier version that had "allow_msi_enable" as the sysfs
file name.

> One strange thing is the lspci output.  Dom0 shows MSI-X enabled.
> Meanwhile NDVM (sys-net) does not show the MSI-X capability.  If you
> `hexdump -C /sys/bus/pci/devices/$dev/config` you can see MSI-X
> enabled, but you also see that the MSI capability has 00 as the next
> pointer, so lspci stops parsing.

This 00 value is written by Linux[1] (sic!) and then qemu incorrectly
allowing the write and happily emulating that zero. The other qemu patch
in this series ought to fix that (as in: properly refuse the write), do
you have it included?

[1] https://github.com/torvalds/linux/blob/master/drivers/net/wireless/inte=
l/iwlwifi/pcie/drv.c#L1721

> MSI cap stubdom:
> 00000040  10 00 92 00 c0 0e 00 00  10 0c 10 00 00 00 00 00  |............=
=2E...|
> 0x41 -> next 0x00
> MSI cap dom0:
> 00000040  10 80 92 00 c0 0e 00 10  10 0c 10 00 00 00 00 00  |............=
=2E...|
> 0x41 -> next 0x80
>=20
> MSI-X:
> 00000080  11 00 0f 80 00 20 00 00  00 30 00 00 00 00 00 00
>=20
> AFAIU, the value 0x80 at offset 0x83 is MSI-X Enabled.
>=20
> I had a boot where assignment failed with the hypervisor printing:
> d12: assign (0000:00:14.3) failed (-16)
> Rebooting the laptop seemed to clear that.

Zombie of previous domain? Not set as "assignable" first?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--pdecqJYtKVupcCRx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmN1WLIACgkQ24/THMrX
1yxXpQf/Tpxw6IVza7ILJAFIjQbfpFFDHNbiSAVS03xF88K3crKqKmPaJ+fKvBSZ
ntFetwY/Paz4/V3dFWv7ly5f6K3E1K4B0kYlBoYBCmZwv5NW8G+CYfOigr2J9mQn
9nYW0Dsn0UXVZklEUey6J/UA7C7byU6lKuVSseXfj8BpkH8+9fZMPKvokLEiszol
NLBpy2k11M7JFdlILZ4JhcTdZPhnN6Etr41jjud1hg2boPxfIdwH3FtAx33fkda5
3Y/BTMd8m4nigEiLBDwFIjJnuPwrF5ST2dGU2qWZEN8hen6QJ+2NGgRCMSk4ZVmW
VT+8gJzGM2n5XXi7T1oVqvGoXysnVw==
=cMsU
-----END PGP SIGNATURE-----

--pdecqJYtKVupcCRx--

