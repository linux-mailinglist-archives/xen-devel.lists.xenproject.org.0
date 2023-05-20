Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9741270A822
	for <lists+xen-devel@lfdr.de>; Sat, 20 May 2023 14:28:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537453.836665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0Lg4-0002s6-8Q; Sat, 20 May 2023 12:27:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537453.836665; Sat, 20 May 2023 12:27:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0Lg4-0002oo-4t; Sat, 20 May 2023 12:27:16 +0000
Received: by outflank-mailman (input) for mailman id 537453;
 Sat, 20 May 2023 12:27:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=akxf=BJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1q0Lg2-0002oi-Tb
 for xen-devel@lists.xenproject.org; Sat, 20 May 2023 12:27:15 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3f05e60-f709-11ed-8611-37d641c3527e;
 Sat, 20 May 2023 14:27:10 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 2AEFE5C00D1;
 Sat, 20 May 2023 08:27:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sat, 20 May 2023 08:27:09 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 20 May 2023 08:27:07 -0400 (EDT)
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
X-Inumbo-ID: a3f05e60-f709-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1684585629; x=1684672029; bh=l4Dj11cX38nf0OMYI1HjGSOuPta4+vL40FJ
	Nfn/+JcU=; b=NhJMkf0m2f1N9HuHX+SR7FzeK+qyCWDrookJ5miuwQ0MO/iAEin
	4v0L0tVE3Ahm7dBsYI4iFSwLhtOL8dLyIzlkokU7xEUWRVWkjylpiLx2z6vyyxuH
	pRNmW7tLohZT+aJkCzU4mC7HHPC3CsvSZS/aGiRF4tr96iRFyLVdmwyOfCPKo/gZ
	V7hYesqxkMW3etlEdw+WYZ2Xyi4AtewQDz6n1Hm9s1miq8RaAAQ9pUbHOofpsHSc
	ubBYLOrrmLZEJPBl8mve5qOHrMPd+HRPsXdhPRJ4BSY8QsDrNFCLNF2VjE/o+Fw+
	JpRPzSRhlpiCmFN7xb1ssZNQrX2nAhpmU5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1684585629; x=1684672029; bh=l4Dj11cX38nf0
	OMYI1HjGSOuPta4+vL40FJNfn/+JcU=; b=pXrVX47YA+5SJWaVa1jBOvXAOvdVh
	J7r1tvynIj2rgPkKuLBD65lnmcX6WbLcWA8nCmJ/Z00ZcVcSi7NRV2YjnVl0C+Jh
	5H9uotuS6EkmRy8T2lZkpzWPdbBLQdDJ0jog77QR2j5XBKAtfPCu7M4wyi+p1nru
	nHN2cFbwW8fper6GxqTatQV2/AcAXkVSQep7ZN/ILGZyd/aidikZsnE42Ya3Py72
	hvkzDmZ3zAKVZNKMU5JSmkX3f1ZgtgedEn8ndVDsuWNu53pna6Wz8niHYdJ8toLz
	YSKIkhRfarsZOMU1BPBaR1tnOg0Niwls/hZHHK7jXUAgQkc1RxUHCHHKQ==
X-ME-Sender: <xms:nLxoZOlJ0dmccHmEsL10V9pRpSnv7FppjQCxstOhjGcfU5VqXjlHbQ>
    <xme:nLxoZF3qRT_5rSU1gTzJUQBflGHdFNCdMrXR_dSU28VUFhmulFcsknKY3B6bsA8tm
    qpDQRf6HZP7FA>
X-ME-Received: <xmr:nLxoZMqvcGxcz1ZjcCLo2gknvKvTARJTsEgKdUnWMV03xZrmVi0_U0UWlg90eT2DcRRUMH7BHkPxUsLkNOOz_BzZMnPh4ZNYqxY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeijedghedtucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:nLxoZCnBBemWCtMtkUuNicRe6UBGAq-q13B6D6r5I8g8FmE2yjcSJQ>
    <xmx:nLxoZM3YDT_7kxhc0OyFciWPRDccP-3-V9Kzh7Cwp9bf4LjXYPanZw>
    <xmx:nLxoZJsZkG3TzYe384F60kDSYwSdVJ1jja_d0wnnKAPwJzstIUxsLg>
    <xmx:nbxoZJz3iX0OU7FzDur13f2yYDxU5JfUChicJ-vl0Ttx3Q4XzR1v0w>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 20 May 2023 14:27:04 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, jbeulich@suse.com,
	andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org,
	xenia.ragiadakou@amd.com
Subject: Re: PVH Dom0 related UART failure
Message-ID: <ZGi8mMTXaKVmPi66@mail-itl>
References: <alpine.DEB.2.22.394.2305171745450.128889@ubuntu-linux-20-04-desktop>
 <ZGX/Pvgy3+onJOJZ@Air-de-Roger>
 <alpine.DEB.2.22.394.2305181748280.128889@ubuntu-linux-20-04-desktop>
 <ZGcu7EWW1cuNjwDA@Air-de-Roger>
 <alpine.DEB.2.22.394.2305191641010.815658@ubuntu-linux-20-04-desktop>
 <ZGig68UTddfEwR6P@Air-de-Roger>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Fncw6dtxpPc8pLwg"
Content-Disposition: inline
In-Reply-To: <ZGig68UTddfEwR6P@Air-de-Roger>


--Fncw6dtxpPc8pLwg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 20 May 2023 14:27:04 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, jbeulich@suse.com,
	andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org,
	xenia.ragiadakou@amd.com
Subject: Re: PVH Dom0 related UART failure

On Sat, May 20, 2023 at 12:28:59PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Fri, May 19, 2023 at 05:02:21PM -0700, Stefano Stabellini wrote:
> > On Fri, 19 May 2023, Roger Pau Monn=C3=A9 wrote:
> > > On Thu, May 18, 2023 at 06:46:52PM -0700, Stefano Stabellini wrote:
> > > > On Thu, 18 May 2023, Roger Pau Monn=C3=A9 wrote:
> > > > > On Wed, May 17, 2023 at 05:59:31PM -0700, Stefano Stabellini wrot=
e:
> > > > > > Hi all,
> > > > > >=20
> > > > > > I have run into another PVH Dom0 issue. I am trying to enable a=
 PVH Dom0
> > > > > > test with the brand new gitlab-ci runner offered by Qubes. It i=
s an AMD
> > > > > > Zen3 system and we already have a few successful tests with it,=
 see
> > > > > > automation/gitlab-ci/test.yaml.
> > > > > >=20
> > > > > > We managed to narrow down the issue to a console problem. We are
> > > > > > currently using console=3Dcom1 com1=3D115200,8n1,pci,msi as Xen=
 command line
> > > > > > options, it works with PV Dom0 and it is using a PCI UART card.
> > > > > >=20
> > > > > > In the case of Dom0 PVH:
> > > > > > - it works without console=3Dcom1
> > > > > > - it works with console=3Dcom1 and with the patch appended below
> > > > > > - it doesn't work otherwise and crashes with this error:
> > > > > > https://matrix-client.matrix.org/_matrix/media/r0/download/invi=
siblethingslab.com/uzcmldIqHptFZuxqsJtviLZK
> > > > >=20
> > > > > Jan also noticed this, and we have a ticket for it in gitlab:
> > > > >=20
> > > > > https://gitlab.com/xen-project/xen/-/issues/85
> > > > >=20
> > > > > > What is the right way to fix it?
> > > > >=20
> > > > > I think the right fix is to simply avoid hidden devices from being
> > > > > handled by vPCI, in any case such devices won't work propewrly wi=
th
> > > > > vPCI because they are in use by Xen, and so any cached informatio=
n by
> > > > > vPCI is likely to become stable as Xen can modify the device with=
out
> > > > > vPCI noticing.
> > > > >=20
> > > > > I think the chunk below should help.  It's not clear to me howeve=
r how
> > > > > hidden devices should be handled, is the intention to completely =
hide
> > > > > such devices from dom0?
> > > >=20
> > > > I like the idea but the patch below still failed:
> > > >=20
> > > > (XEN) Xen call trace:
> > > > (XEN)    [<ffff82d0402682b0>] R drivers/vpci/header.c#modify_bars+0=
x2b3/0x44d
> > > > (XEN)    [<ffff82d040268714>] F drivers/vpci/header.c#init_bars+0x2=
ca/0x372
> > > > (XEN)    [<ffff82d0402673b3>] F vpci_add_handlers+0xd5/0x10a
> > > > (XEN)    [<ffff82d0404408b9>] F drivers/passthrough/pci.c#setup_one=
_hwdom_device+0x73/0x97
> > > > (XEN)    [<ffff82d0404409b0>] F drivers/passthrough/pci.c#_setup_hw=
dom_pci_devices+0x63/0x15b
> > > > (XEN)    [<ffff82d04027df08>] F drivers/passthrough/pci.c#pci_segme=
nts_iterate+0x43/0x69
> > > > (XEN)    [<ffff82d040440e29>] F setup_hwdom_pci_devices+0x25/0x2c
> > > > (XEN)    [<ffff82d04043cb1a>] F drivers/passthrough/amd/pci_amd_iom=
mu.c#amd_iommu_hwdom_init+0xd4/0xdd
> > > > (XEN)    [<ffff82d0404403c9>] F iommu_hwdom_init+0x49/0x53
> > > > (XEN)    [<ffff82d04045175e>] F dom0_construct_pvh+0x160/0x138d
> > > > (XEN)    [<ffff82d040468914>] F construct_dom0+0x5c/0xb7
> > > > (XEN)    [<ffff82d0404619c1>] F __start_xen+0x2423/0x272d
> > > > (XEN)    [<ffff82d040203344>] F __high_start+0x94/0xa0
> > > >=20
> > > > I haven't managed to figure out why yet.
> > >=20
> > > Do you have some other patches applied?
> > >=20
> > > I've tested this by manually hiding a device on my system and can
> > > confirm that without the fix I hit the ASSERT, but with the patch
> > > applied I no longer hit it.  I have no idea how can you get into
> > > init_bars if the device is hidden and thus belongs to dom_xen.
> >=20
> > Unfortunately it doesn't work. Here are the full logs with interesting
> > DEBUG messages (search for "DEBUG"):
> > https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/4318489116
> > https://gitlab.com/xen-project/people/sstabellini/xen/-/commit/31c400ca=
a7b86d4c14f9553138e02af18d3b3284
> >=20
> > [...]
> > (XEN) DEBUG ns16550_init_postirq 432  03:00.0
> > [...]
> > (XEN) DEBUG vpci_add_handlers 75 0000:00:00.0 0^M
> > (XEN) DEBUG vpci_add_handlers 75 0000:00:00.2 1^M
> > (XEN) DEBUG vpci_add_handlers 78 0000:00:00.2^M
>=20
> This device is not handled by vPCI either, and is not the console
> device.

That's IOMMU.

Full lspci:

00:00.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family 17h-1=
9h PCIe Root Complex [1022:14b5] (rev 01)
00:00.2 IOMMU [0806]: Advanced Micro Devices, Inc. [AMD] Family 17h-19h IOM=
MU [1022:14b6]
00:01.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family 17h-1=
9h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
00:02.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family 17h-1=
9h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
00:02.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 17h-19=
h PCIe GPP Bridge [1022:14ba]
00:02.2 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 17h-19=
h PCIe GPP Bridge [1022:14ba]
00:02.4 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 17h-19=
h PCIe GPP Bridge [1022:14ba]
00:03.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family 17h-1=
9h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
00:03.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 19h US=
B4/Thunderbolt PCIe tunnel [1022:14cd]
00:04.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family 17h-1=
9h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
00:08.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family 17h-1=
9h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
00:08.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 17h-19=
h Internal PCIe GPP Bridge [1022:14b9] (rev 10)
00:08.2 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 17h-19=
h Internal PCIe GPP Bridge [1022:14b9] (rev 10)
00:08.3 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 17h-19=
h Internal PCIe GPP Bridge [1022:14b9] (rev 10)
00:14.0 SMBus [0c05]: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controll=
er [1022:790b] (rev 71)
00:14.3 ISA bridge [0601]: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridg=
e [1022:790e] (rev 51)
00:18.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Rembrandt Da=
ta Fabric: Device 18h; Function 0 [1022:1679]
00:18.1 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Rembrandt Da=
ta Fabric: Device 18h; Function 1 [1022:167a]
00:18.2 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Rembrandt Da=
ta Fabric: Device 18h; Function 2 [1022:167b]
00:18.3 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Rembrandt Da=
ta Fabric: Device 18h; Function 3 [1022:167c]
00:18.4 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Rembrandt Da=
ta Fabric: Device 18h; Function 4 [1022:167d]
00:18.5 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Rembrandt Da=
ta Fabric: Device 18h; Function 5 [1022:167e]
00:18.6 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Rembrandt Da=
ta Fabric: Device 18h; Function 6 [1022:167f]
00:18.7 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Rembrandt Da=
ta Fabric: Device 18h; Function 7 [1022:1680]
01:00.0 Ethernet controller [0200]: Intel Corporation Ethernet Controller I=
225-V [8086:15f3] (rev 03)
02:00.0 Network controller [0280]: MEDIATEK Corp. MT7921K (RZ608) Wi-Fi 6E =
80MHz [14c3:0608]
03:00.0 Serial controller [0700]: Exar Corp. XR17V3521 Dual PCIe UART [13a8=
:0352] (rev 03)
34:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AMD=
/ATI] Rembrandt [Radeon 680M] [1002:1681] (rev 0a)
34:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Rembran=
dt Radeon High Definition Audio Controller [1002:1640]
34:00.2 Encryption controller [1080]: Advanced Micro Devices, Inc. [AMD] Va=
nGogh PSP/CCP [1022:1649]
34:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Rembrandt=
 USB4 XHCI controller #3 [1022:161d]
34:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Rembrandt=
 USB4 XHCI controller #4 [1022:161e]
34:00.5 Multimedia controller [0480]: Advanced Micro Devices, Inc. [AMD] AC=
P/ACP3X/ACP6x Audio Coprocessor [1022:15e2] (rev 60)
34:00.6 Audio device [0403]: Advanced Micro Devices, Inc. [AMD] Family 17h/=
19h HD Audio Controller [1022:15e3]
35:00.0 SATA controller [0106]: Advanced Micro Devices, Inc. [AMD] FCH SATA=
 Controller [AHCI mode] [1022:7901] (rev a1)
36:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Rembrandt=
 USB4 XHCI controller #8 [1022:161f]
36:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Rembrandt=
 USB4 XHCI controller #5 [1022:15d6]
36:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Rembrandt=
 USB4 XHCI controller #6 [1022:15d7]
36:00.5 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Rembrandt=
 USB4/Thunderbolt NHI controller #1 [1022:162e]

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Fncw6dtxpPc8pLwg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmRovJgACgkQ24/THMrX
1ywimggAllbdGpQWcILXaOTkCOfxgoxRwQxySwHuVgJ/OKJknqzr5aCqvUS6rBsO
isGjim0XGXA1cMlLBdv9fNhe5X3NvAdW8OYzXDiT7sUbWoi3/ebqKWt1Z71M63oB
gO1qQ7qoDmUklsZdA18meY/rAf9FSJiBPeDr0OLqRBi5oqK/mF2PQzyE3Prybm/s
/2O6z01ht+0w4bFGaUqsl1825vN+JEO7l452+3v0r15eJ5IvgQEkmWUYoeYNNJ2D
nY2fHtDPC321qq5Bkw9m2XCZ/yCeasTiob/fNt2BMclGn8m13owA0t00Q2cHv8CT
a4UWqlGoHFl9ncKTKA6QKuU/E57fpQ==
=aQan
-----END PGP SIGNATURE-----

--Fncw6dtxpPc8pLwg--

