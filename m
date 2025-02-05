Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E26A29C75
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 23:14:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882358.1292502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfnfA-0005D0-Of; Wed, 05 Feb 2025 22:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882358.1292502; Wed, 05 Feb 2025 22:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfnfA-0005Ag-LJ; Wed, 05 Feb 2025 22:14:28 +0000
Received: by outflank-mailman (input) for mailman id 882358;
 Wed, 05 Feb 2025 22:14:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ry/V=U4=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tfnf9-0005AW-4W
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 22:14:27 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8dcbae75-e40e-11ef-99a4-01e77a169b0f;
 Wed, 05 Feb 2025 23:14:24 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id 910BB1380173;
 Wed,  5 Feb 2025 17:14:22 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Wed, 05 Feb 2025 17:14:22 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Feb 2025 17:14:19 -0500 (EST)
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
X-Inumbo-ID: 8dcbae75-e40e-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1738793662;
	 x=1738880062; bh=dnnbgDwH9x7fnLB1kibGWwujhtj14VjiX4Zmk+PIIcs=; b=
	RfcZ9w9knYWsoigKruT+BDZsAoSqbtZ8Jt8t8+bNGiLmfF8o+XRgIHFzfToFwGt/
	9L7xjEibAdo8HlyMzHdD/2rxrMH4LvC/qtnFE2eg1DtcDuwGSfW8gaUd4dtDba30
	ts0jX2Z2Us0ze3b7aXW+9u7uHvzKdfdCVfvWcr40N5AJN+b4DsBUTXelw6kCKR8l
	FmMp5SSckmX216DRhOdsnx6azJeh+TktnSgwZXbKAt+DGUdmUxIx4RoUjVjylOz+
	96bgwinO4h49BIH1rJcwW1uKO8by6QXigeY+btnbX1rVc3j5Jpu6xygPZefRkCUr
	2n62mxPptHKKxZ+iDv6+ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1738793662; x=1738880062; bh=dnnbgDwH9x7fnLB1kibGWwujhtj14VjiX4Z
	mk+PIIcs=; b=sTZbGj2jdID13w6z9jwXXtRzkmdaK3H8djlX/gt/s7+sYVTVzwU
	pZ7FmlJk9EdNtWVSOK/ieIw7Bh6wd516Q63KNJ6yXoErF2wRYM33792i7HiNEsCs
	0Zhoo268JT+/XGKQSHO0m8asrF3aZjiXOE2qkYQF78aOl2/rUGiVZ5/imKbp5DGc
	B2riG+2X6endjh27IuD1DxDmfnSJER82fGCwO48JztRuCcKKBpkIfqTbvYQooeqI
	J978uvt+yAJnZ1Jd7HvUb/M4VkO58ZxDJGcu6eEvcUvUgMRkiT4N59UiEocOkXDV
	Q6b36cLQGomlE3LcjPDWv8r4OpaOIyK7cqA==
X-ME-Sender: <xms:veKjZ7BM-SpE0F3BfVWAAw6WjJMjp2KflAi1iOnJDILwVgN679VwvA>
    <xme:veKjZxjjQeEw7SyhCiJJGkCHdiuDKARznX0EMZKjoW0GHFpb-oGPIuvl1o8FDeSXP
    H0Mo4E1AVcLPw>
X-ME-Received: <xmr:veKjZ2mZlTx1kD_ZtaL6wG-qoRIIwKUjtswE3lBpByC-VITpDxjjLlF42gm52oEJ_C7gwin54JqKsemOqPjw-wmJ3edaFE0VRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeifecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpeeukeetteeggffgkeduheetgeeileejjeeiiefhjeegvefhtefggf
    etueetteeuteenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepuddvpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehhvghlghgrrghssehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtohepsghh
    vghlghgrrghssehgohhoghhlvgdrtghomhdprhgtphhtthhopehjghhrohhsshesshhush
    gvrdgtohhmpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpdhr
    tghpthhtohepsghorhhishdrohhsthhrohhvshhkhiesohhrrggtlhgvrdgtohhmpdhrtg
    hpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheprhgvghhrvghsshhiohhnsheslhhishhtshdrlhhinhhugidruggv
    vh
X-ME-Proxy: <xmx:veKjZ9wTNvPU9sMrcNa4aBztUPhju9paz0m54mhqD3Y16uITkYipOw>
    <xmx:veKjZwTh8Xbq53tEElMxfERL0umPTzW8CSM_i08MrIJNTDO9JA00ww>
    <xmx:veKjZwYDvV0FqcMqt3h8EAjCCdhNCfB6HzvJ61_bQlM30fFuYbLp3g>
    <xmx:veKjZxQ_VypgqI_w52La4MkHtWOP9eG0_ytzq86q7iCXQBz05L4tvQ>
    <xmx:vuKjZ3IsYSpip1PL3lfJE11DWZxcPz2JgT10aflKqvIUMGaVKR8bLLeD>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 5 Feb 2025 23:14:17 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)
Message-ID: <Z6PiuRDjml0UNWd_@mail-itl>
References: <cfe0af0e-132b-4390-a3b0-dde0e6326e19@suse.com>
 <20250130213123.GA633869@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ltpSZ9Ianuxtah5b"
Content-Disposition: inline
In-Reply-To: <20250130213123.GA633869@bhelgaas>


--ltpSZ9Ianuxtah5b
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 5 Feb 2025 23:14:17 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)

On Thu, Jan 30, 2025 at 03:31:23PM -0600, Bjorn Helgaas wrote:
> On Thu, Jan 30, 2025 at 10:30:33AM +0100, Jan Beulich wrote:
> > On 30.01.2025 05:55, Marek Marczykowski-G=C3=B3recki wrote:
> > > I've added logging of all config read/write to this device. Full log =
at
> > > [1].
> > ...
>=20
> I suspect there's something wrong with the Root Port RRS SV
> configuration.
>=20
> Can you add the two patches below?

I tried and indeed it doesn't make a difference. Generally it looks like
this device has broken FLR, and the reset works due to the fallback to
the secondary bus reset on timeout. I repeated the test with my
additional "&& !PCI_POSSIBLE_ERROR(id)" and I got this:
https://gist.github.com/marmarek/db0808702131b69ea2f66f339a55d71b

The first log is with xen, and the second with native linux (and added
PCI config space logging in drivers/pci/access.c).

Ignore "usb usb2-port2" errors, that's my USB debug console that
didn't worked on native Linux...

For convenience I paste the interesting part at the end of the email.

> I don't *think* either should make a difference.  The first enables
> RRS SV earlier and maybe in a cleaner place; the second should avoid
> some pointless capability searches that clutter the logs.
>=20
> What does d0v1/d0v2/d0v3 mean?

This is dom0 vcpu 1/2/3.

> Can you add 00:02.2, the Root Port leading to bus 01, so we can see
> the RRS SV configuration?  Maybe also lspci -vv for both 00:02.2 and
> 01:00.0?

Yes, added in the log above.

> Maybe include timestamps and try an FLR without Xen (which I assume
> works correctly) so we can see how long the device typically takes to
> become ready?

Timestamps are in the "native" log above. The one under Xen I added
"time" for the device reset call, it said 1m10s...

> Notes below on the snippet that you commented on, Jan.  I think it
> makes sense until the read after FLR returns 0xffffffff.
>=20
> > > (XEN) d0v1 conf read cf8 0x80010034 bytes 1 offset 0 data 0x80
>=20
> PCI_CAPABILITY_LIST, first cap at 0x80
>=20
> > > (XEN) d0v1 conf read cf8 0x80010080 bytes 2 offset 0 data 0xe010
>=20
> PCI_CAP_ID_EXP (0x10) at 0x80, next cap at 0xe0
>=20
> > > (XEN) d0v1 conf read cf8 0x800100e0 bytes 2 offset 0 data 0xf805
>=20
> PCI_CAP_ID_MSI (0x05) at 0xe0, next cap at 0xf8
>=20
> > > (XEN) d0v1 conf read cf8 0x800100f8 bytes 2 offset 0 data 0x1
>=20
> PCI_CAP_ID_PM (0x01) at 0xf8, end of cap list
>=20
> These caps match the offsets from the lspci output in the full log:
>=20
>   1:00.0 Network controller: MEDIATEK Corp. MT7922 802.11ax PCI Express W=
ireless Network Adapter
> 	  Subsystem: MEDIATEK Corp. Device e616
> 	  Flags: fast devsel, IRQ 255
> 	  Memory at 8010900000 (64-bit, prefetchable) [disabled] [size=3D1M]
> 	  Memory at 90b00000 (64-bit, non-prefetchable) [disabled] [size=3D32K]
> 	  Capabilities: [80] Express Endpoint, IntMsgNum 0
> 	  Capabilities: [e0] MSI: Enable- Count=3D1/32 Maskable+ 64bit+
> 	  Capabilities: [f8] Power Management version 3
>=20
> > > (XEN) d0v1 conf write cf8 0x80010004 bytes 2 offset 0 data 0x400
>=20
> Set PCI_COMMAND_INTX_DISABLE, disable BARs, Bus Master.  Looks like
> the end of pci_dev_save_and_disable().
>=20
> > > (XEN) d0v1 conf read cf8 0x80010088 bytes 2 offset 2 data 0x9
>=20
> PCIe Cap at 0x80, PCI_EXP_DEVCTL is 0x08, PCI_EXP_DEVSTA is 0x0a.
>=20
> 0x80010088 would be PCI_EXP_DEVCTL (a 2-byte register), maybe offset 2
> gets us to PCI_EXP_DEVSTA?  Not sure.
>=20
>   0x0001 PCI_EXP_DEVSTA_CED /* Correctable Error Detected */
>   0x0008 PCI_EXP_DEVSTA_URD /* Unsupported Request Detected */
>=20
> Not impossible that these would be set.  Lots of URs happen during
> enumeration and we're not very good about cleaning these up.
> Correctable errors are common for some devices.  lspci -vv would
> decode the PCIe cap registers, including this.
>=20
> > > (XEN) d0v1 conf read cf8 0x80010088 bytes 2 offset 0 data 0x2910
>=20
> PCI_EXP_DEVCTL:
>   0x2000 PCI_EXP_DEVCTL_READRQ_512B
>   0x0800 PCI_EXP_DEVCTL_NOSNOOP_EN
>   0x0100 PCI_EXP_DEVCTL_EXT_TAG
>   0x0010 PCI_EXP_DEVCTL_RELAX_EN
>=20
> > > (XEN) d0v1 conf write cf8 0x80010088 bytes 2 offset 0 data 0xa910
>=20
> PCI_EXP_DEVCTL:
>   set 0x8000 PCI_EXP_DEVCTL_BCR_FLR
>=20
> This looks like the actual FLR being initiated.
>=20
> > This is the express capability's Link Control 2 Register afaict.
>=20
> Unless I'm missing something this is actually Device Control.  So far
> I think this all looks OK.  The next part:
>=20
> > > (XEN) d0v2 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
>=20
> looks like a problem.  The normal successful read gets 0x061614c3.
> After the FLR, if RRS SV is enabled, we should get either 0x0001ffff
> or 0x061614c3.

Yes, and the most recent test I got the same also when running Linux
natively (which doesn't match my initial report).=20

And also, it looks when it works, it's because waiting for the FLR to
complete times out and it goes to the secondary bus reset, which works
instantly.

> Here we would exit the loop in pci_dev_wait() because we didn't see
> 0x0001 and we expect that the device is ready and we got a valid
> Vendor ID.
>=20
> So we proceed to restoring config space via pci_restore_state(), where
> we restore some PCIe registers and the header (first 64 bytes).  My
> *guess* is the device isn't ready (or at least not responding) since
> all the reads return ~0.

Logs from native (logging both the device at 01:00.0 and the bridge at
00:02.2):

[  348.129591] PCI: read bus 0x1 devfn 0x0 pos 0xfc size 2 value 0x8
[  348.129609] PCI: read bus 0x1 devfn 0x0 pos 0xfc size 2 value 0x8
[  348.130258] PCI: read bus 0x0 devfn 0x12 pos 0x64 size 4 value 0x4737814
[  348.130645] PCI: read bus 0x1 devfn 0x0 pos 0x8c size 4 value 0x145dc12
[  348.130663] PCI: read bus 0x1 devfn 0x0 pos 0x0 size 4 value 0x61614c3
[  348.130667] PCI: read bus 0x1 devfn 0x0 pos 0x4 size 4 value 0x100000
[  348.130671] PCI: read bus 0x1 devfn 0x0 pos 0x8 size 4 value 0x2800000
[  348.130675] PCI: read bus 0x1 devfn 0x0 pos 0xc size 4 value 0x10
[  348.130678] PCI: read bus 0x1 devfn 0x0 pos 0x10 size 4 value 0x1090000c
[  348.131855] PCI: read bus 0x1 devfn 0x0 pos 0x14 size 4 value 0x80
[  348.131859] PCI: read bus 0x1 devfn 0x0 pos 0x18 size 4 value 0x90b00004
[  348.131863] PCI: read bus 0x1 devfn 0x0 pos 0x1c size 4 value 0x0
[  348.132414] PCI: read bus 0x1 devfn 0x0 pos 0x20 size 4 value 0x0
[  348.132419] PCI: read bus 0x1 devfn 0x0 pos 0x24 size 4 value 0x0
[  348.132422] PCI: read bus 0x1 devfn 0x0 pos 0x28 size 4 value 0x0
[  348.132426] PCI: read bus 0x1 devfn 0x0 pos 0x2c size 4 value 0xe61614c3
[  348.133104] PCI: read bus 0x1 devfn 0x0 pos 0x30 size 4 value 0x0
[  348.133121] PCI: read bus 0x1 devfn 0x0 pos 0x34 size 4 value 0x80
[  348.133125] PCI: read bus 0x1 devfn 0x0 pos 0x38 size 4 value 0x0
[  348.133128] PCI: read bus 0x1 devfn 0x0 pos 0x3c size 4 value 0x1ff
[  348.133133] PCI: read bus 0x1 devfn 0x0 pos 0x88 size 2 value 0x2910
[  348.133136] PCI: read bus 0x1 devfn 0x0 pos 0x90 size 2 value 0x1c2
[  348.133140] PCI: read bus 0x1 devfn 0x0 pos 0xa8 size 2 value 0x400
[  348.133143] PCI: read bus 0x1 devfn 0x0 pos 0xb0 size 2 value 0x2
[  348.133148] PCI: read bus 0x1 devfn 0x0 pos 0x11c size 4 value 0x79
[  348.133152] PCI: read bus 0x1 devfn 0x0 pos 0x118 size 4 value 0x40a3000f
[  348.134803] PCI: read bus 0x1 devfn 0x0 pos 0x100 size 4 value 0x1081000b
[  348.134806] PCI: read bus 0x1 devfn 0x0 pos 0x108 size 4 value 0x11010018
[  348.134810] PCI: read bus 0x1 devfn 0x0 pos 0x10c size 4 value 0x10011001
[  348.134813] PCI: write bus 0x1 devfn 0x0 pos 0x4 size 2 value 0x400
[  348.135924] PCI: read bus 0x1 devfn 0x0 pos 0x8a size 2 value 0x0
[  348.135928] PCI: read bus 0x1 devfn 0x0 pos 0x88 size 2 value 0x2910
[  348.135931] PCI: write bus 0x1 devfn 0x0 pos 0x88 size 2 value 0xa910
[  348.241243] PCI: read bus 0x1 devfn 0x0 pos 0x0 size 4 value 0xffffffff
[  348.243160] PCI: read bus 0x1 devfn 0x0 pos 0x0 size 4 value 0xffffffff
[  348.246356] PCI: read bus 0x1 devfn 0x0 pos 0x0 size 4 value 0xffffffff
[  348.251348] PCI: read bus 0x1 devfn 0x0 pos 0x0 size 4 value 0xffffffff
[  348.260697] PCI: read bus 0x1 devfn 0x0 pos 0x0 size 4 value 0xffffffff
[  348.278824] PCI: read bus 0x1 devfn 0x0 pos 0x0 size 4 value 0xffffffff
[  348.312794] PCI: read bus 0x1 devfn 0x0 pos 0x0 size 4 value 0xffffffff
[  348.385762] PCI: read bus 0x1 devfn 0x0 pos 0x0 size 4 value 0xffffffff
[  348.521807] PCI: read bus 0x1 devfn 0x0 pos 0x0 size 4 value 0xffffffff
[  348.785302] PCI: read bus 0x1 devfn 0x0 pos 0x0 size 4 value 0xffffffff
[  349.353822] PCI: read bus 0x1 devfn 0x0 pos 0x0 size 4 value 0xffffffff
[  349.353842] PCI: read bus 0x0 devfn 0x12 pos 0x88 size 2 value 0x42
[  349.354415] PCI: read bus 0x0 devfn 0x12 pos 0x6a size 2 value 0x3012
[  349.355623] pci 0000:01:00.0: not ready 1023ms after FLR; waiting
[  350.441192] PCI: read bus 0x1 devfn 0x0 pos 0x0 size 4 value 0xffffffff
[  350.441211] pci 0000:01:00.0: not ready 2047ms after FLR; waiting
[  352.553793] PCI: read bus 0x1 devfn 0x0 pos 0x0 size 4 value 0xffffffff
[  352.553812] pci 0000:01:00.0: not ready 4095ms after FLR; waiting
[  357.097805] PCI: read bus 0x1 devfn 0x0 pos 0x0 size 4 value 0xffffffff
[  357.097825] pci 0000:01:00.0: not ready 8191ms after FLR; waiting
[  365.801764] PCI: read bus 0x1 devfn 0x0 pos 0x0 size 4 value 0xffffffff
[  365.801783] pci 0000:01:00.0: not ready 16383ms after FLR; waiting
[  382.697684] PCI: read bus 0x1 devfn 0x0 pos 0x0 size 4 value 0xffffffff
[  382.697707] pci 0000:01:00.0: not ready 32767ms after FLR; waiting
[  415.977738] PCI: read bus 0x1 devfn 0x0 pos 0x0 size 4 value 0xffffffff
[  415.977761] pci 0000:01:00.0: not ready 65535ms after FLR; giving up
[  415.978610] PCI: read bus 0x0 devfn 0x12 pos 0x100 size 4 value 0x270100=
0b
[  415.978614] PCI: read bus 0x0 devfn 0x12 pos 0x270 size 4 value 0x2a0100=
19
[  415.978617] PCI: read bus 0x0 devfn 0x12 pos 0x2a0 size 4 value 0x370100=
0d
[  415.978619] PCI: read bus 0x0 devfn 0x12 pos 0x370 size 4 value 0x400100=
1e
[  415.978623] PCI: read bus 0x0 devfn 0x12 pos 0x400 size 4 value 0x410100=
25
[  415.978626] PCI: read bus 0x0 devfn 0x12 pos 0x410 size 4 value 0x440100=
26
[  415.978628] PCI: read bus 0x0 devfn 0x12 pos 0x440 size 4 value 0x10027
[  415.978632] PCI: read bus 0x0 devfn 0x12 pos 0x3e size 2 value 0x2
[  415.978636] PCI: write bus 0x0 devfn 0x12 pos 0x3e size 2 value 0x42
[  415.981198] PCI: write bus 0x0 devfn 0x12 pos 0x3e size 2 value 0x2
[  416.003807] PCI: read bus 0x0 devfn 0x12 pos 0x6a size 2 value 0x1011
[  416.006865] PCI: read bus 0x0 devfn 0x12 pos 0x6a size 2 value 0x1011
[  416.008690] PCI: read bus 0x0 devfn 0x12 pos 0x78 size 4 value 0x0
[  416.009178] PCI: read bus 0x0 devfn 0x12 pos 0x6a size 2 value 0xb012
[  416.009755] PCI: read bus 0x0 devfn 0x12 pos 0x6a size 2 value 0xb012
[  416.010319] PCI: write bus 0x0 devfn 0x12 pos 0x6a size 2 value 0x8000
[  416.010322] PCI: read bus 0x0 devfn 0x12 pos 0x6a size 2 value 0x3012
[  416.114652] PCI: read bus 0x1 devfn 0x0 pos 0x0 size 4 value 0x61614c3
[  416.115053] PCI: read bus 0x1 devfn 0x0 pos 0x100 size 4 value 0x1081000b
[  416.115341] PCI: read bus 0x1 devfn 0x0 pos 0x108 size 4 value 0x11010018
[  416.115563] PCI: write bus 0x1 devfn 0x0 pos 0x10c size 4 value 0x100110=
01
[  416.115803] PCI: read bus 0x1 devfn 0x0 pos 0x90 size 2 value 0x0
[  416.115807] PCI: read bus 0x0 devfn 0x12 pos 0x68 size 2 value 0xcc2
[  416.115811] PCI: write bus 0x1 devfn 0x0 pos 0x90 size 2 value 0x0
[  416.115814] PCI: write bus 0x0 devfn 0x12 pos 0x68 size 2 value 0xcc0
[  416.115817] PCI: read bus 0x1 devfn 0x0 pos 0x118 size 4 value 0x0
[  416.115820] PCI: write bus 0x1 devfn 0x0 pos 0x118 size 4 value 0x0
[  416.115823] PCI: read bus 0x0 devfn 0x12 pos 0x378 size 4 value 0x40a30a=
0f
[  416.115825] PCI: write bus 0x0 devfn 0x12 pos 0x378 size 4 value 0x40a30=
a0a
[  416.115828] PCI: write bus 0x0 devfn 0x12 pos 0x37c size 4 value 0x79
[  416.115831] PCI: write bus 0x1 devfn 0x0 pos 0x11c size 4 value 0x79
[  416.115834] PCI: write bus 0x0 devfn 0x12 pos 0x378 size 4 value 0x40a30=
a0a
[  416.115837] PCI: write bus 0x1 devfn 0x0 pos 0x118 size 4 value 0x40a300=
0a
[  416.115839] PCI: write bus 0x0 devfn 0x12 pos 0x378 size 4 value 0x40a30=
a0f
[  416.115842] PCI: write bus 0x1 devfn 0x0 pos 0x118 size 4 value 0x40a300=
0f
[  416.115845] PCI: write bus 0x0 devfn 0x12 pos 0x68 size 2 value 0xcc2
[  416.115849] PCI: write bus 0x1 devfn 0x0 pos 0x90 size 2 value 0x0
[  416.115852] PCI: read bus 0x0 devfn 0x12 pos 0x80 size 4 value 0x6
[  416.115855] PCI: read bus 0x0 devfn 0x12 pos 0x80 size 2 value 0x6
[  416.115858] PCI: write bus 0x0 devfn 0x12 pos 0x80 size 2 value 0x406
[  416.115861] PCI: write bus 0x1 devfn 0x0 pos 0x88 size 2 value 0x2910
[  416.115864] PCI: write bus 0x1 devfn 0x0 pos 0x90 size 2 value 0x1c2
[  416.115868] PCI: write bus 0x1 devfn 0x0 pos 0xa8 size 2 value 0x400
[  416.115871] PCI: write bus 0x1 devfn 0x0 pos 0xb0 size 2 value 0x2
[  416.115875] PCI: read bus 0x1 devfn 0x0 pos 0x100 size 4 value 0x1081000b
[  416.115878] PCI: read bus 0x1 devfn 0x0 pos 0x108 size 4 value 0x11010018
[  416.115881] PCI: read bus 0x1 devfn 0x0 pos 0x110 size 4 value 0x2001001e
[  416.115884] PCI: read bus 0x1 devfn 0x0 pos 0x200 size 4 value 0x20001
[  416.115889] PCI: write bus 0x1 devfn 0x0 pos 0x208 size 4 value 0x0
[  416.115892] PCI: write bus 0x1 devfn 0x0 pos 0x20c size 4 value 0x0
[  416.115895] PCI: write bus 0x1 devfn 0x0 pos 0x214 size 4 value 0x0
[  416.115899] PCI: write bus 0x1 devfn 0x0 pos 0x218 size 4 value 0x0
[  416.115902] PCI: read bus 0x1 devfn 0x0 pos 0x3c size 4 value 0x100
[  416.115906] PCI: write bus 0x1 devfn 0x0 pos 0x3c size 4 value 0x1ff
[  416.115909] PCI: read bus 0x1 devfn 0x0 pos 0x38 size 4 value 0x0
[  416.115912] PCI: read bus 0x1 devfn 0x0 pos 0x34 size 4 value 0x80
[  416.115916] PCI: read bus 0x1 devfn 0x0 pos 0x30 size 4 value 0x0
[  416.115919] PCI: read bus 0x1 devfn 0x0 pos 0x2c size 4 value 0xe61614c3
[  416.115923] PCI: read bus 0x1 devfn 0x0 pos 0x28 size 4 value 0x0
[  416.115926] PCI: read bus 0x1 devfn 0x0 pos 0x24 size 4 value 0x0
[  416.115930] PCI: read bus 0x1 devfn 0x0 pos 0x20 size 4 value 0x0
[  416.115933] PCI: read bus 0x1 devfn 0x0 pos 0x1c size 4 value 0x0
[  416.123065] PCI: read bus 0x1 devfn 0x0 pos 0x18 size 4 value 0x4
[  416.123070] PCI: write bus 0x1 devfn 0x0 pos 0x18 size 4 value 0x90b00004
[  416.123073] PCI: read bus 0x1 devfn 0x0 pos 0x18 size 4 value 0x90b00004
[  416.123076] PCI: read bus 0x1 devfn 0x0 pos 0x14 size 4 value 0x0
[  416.123080] PCI: write bus 0x1 devfn 0x0 pos 0x14 size 4 value 0x80
[  416.123083] PCI: read bus 0x1 devfn 0x0 pos 0x14 size 4 value 0x80
[  416.123086] PCI: read bus 0x1 devfn 0x0 pos 0x10 size 4 value 0xc
[  416.123090] PCI: write bus 0x1 devfn 0x0 pos 0x10 size 4 value 0x1090000c
[  416.123093] PCI: read bus 0x1 devfn 0x0 pos 0x10 size 4 value 0x1090000c
[  416.123096] PCI: read bus 0x1 devfn 0x0 pos 0xc size 4 value 0x0
[  416.123099] PCI: write bus 0x1 devfn 0x0 pos 0xc size 4 value 0x10
[  416.123103] PCI: read bus 0x1 devfn 0x0 pos 0x8 size 4 value 0x2800000
[  416.123106] PCI: read bus 0x1 devfn 0x0 pos 0x4 size 4 value 0x100000
[  416.123109] PCI: read bus 0x1 devfn 0x0 pos 0x0 size 4 value 0x61614c3

Logs with Xen:

(XEN) d0v3 conf read cf8 0x800100fc bytes 2 offset 0 data 0x8
(XEN) d0v3 conf read cf8 0x800100fc bytes 2 offset 0 data 0x8
(XEN) d0v3 conf read cf8 0x80001264 bytes 4 offset 0 data 0x4737814
(XEN) d0v3 conf read cf8 0x8001008c bytes 4 offset 0 data 0x145dc12
(XEN) d0v3 conf read cf8 0x80010000 bytes 4 offset 0 data 0x61614c3
(XEN) d0v3 conf read cf8 0x80010004 bytes 4 offset 0 data 0x100000
(XEN) d0v3 conf read cf8 0x80010008 bytes 4 offset 0 data 0x2800000
(XEN) d0v3 conf read cf8 0x8001000c bytes 4 offset 0 data 0x10
(XEN) d0v3 conf read cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
(XEN) d0v3 conf read cf8 0x80010014 bytes 4 offset 0 data 0x80
(XEN) d0v3 conf read cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
(XEN) d0v3 conf read cf8 0x8001001c bytes 4 offset 0 data 0
(XEN) d0v3 conf read cf8 0x80010020 bytes 4 offset 0 data 0
(XEN) d0v3 conf read cf8 0x80010024 bytes 4 offset 0 data 0
(XEN) d0v3 conf read cf8 0x80010028 bytes 4 offset 0 data 0
(XEN) d0v3 conf read cf8 0x8001002c bytes 4 offset 0 data 0xe61614c3
(XEN) d0v3 conf read cf8 0x80010030 bytes 4 offset 0 data 0
(XEN) d0v3 conf read cf8 0x80010034 bytes 4 offset 0 data 0x80
(XEN) d0v3 conf read cf8 0x80010038 bytes 4 offset 0 data 0
(XEN) d0v3 conf read cf8 0x8001003c bytes 4 offset 0 data 0x1ff
(XEN) d0v3 conf read cf8 0x80010088 bytes 2 offset 0 data 0x2910
(XEN) d0v3 conf read cf8 0x80010090 bytes 2 offset 0 data 0x1c2
(XEN) d0v3 conf read cf8 0x800100a8 bytes 2 offset 0 data 0x400
(XEN) d0v3 conf read cf8 0x800100b0 bytes 2 offset 0 data 0x2
(XEN) d0v3 conf write cf8 0x80010004 bytes 2 offset 0 data 0x400
(XEN) d0v3 conf read cf8 0x80010088 bytes 2 offset 2 data 0x9
(XEN) d0v3 conf read cf8 0x80010088 bytes 2 offset 0 data 0x2910
(XEN) d0v3 conf write cf8 0x80010088 bytes 2 offset 0 data 0xa910
(XEN) d0v3 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
(XEN) d0v3 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
(XEN) d0v3 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
(XEN) d0v3 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
(XEN) d0v3 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
(XEN) d0v3 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
(XEN) d0v3 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
(XEN) d0v3 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
(XEN) d0v3 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
(XEN) d0v3 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
(XEN) d0v3 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
(XEN) d0v3 conf read cf8 0x80001288 bytes 2 offset 0 data 0x42
(XEN) d0v3 conf read cf8 0x80001268 bytes 2 offset 2 data 0x3012
(XEN) d0v3 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
(XEN) d0v3 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
(XEN) d0v3 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
(XEN) d0v3 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
(XEN) d0v3 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
(XEN) d0v4 conf read cf8 0x80010000 bytes 4 offset 0 data 0xffffffff
(XEN) d0v4 conf read cf8 0x8000123c bytes 2 offset 2 data 0x2
(XEN) d0v4 conf write cf8 0x8000123c bytes 2 offset 2 data 0x42
(XEN) d0v4 conf write cf8 0x8000123c bytes 2 offset 2 data 0x2
(XEN) d0v4 conf read cf8 0x80001268 bytes 2 offset 2 data 0x1011
(XEN) d0v4 conf read cf8 0x80001268 bytes 2 offset 2 data 0x1011
(XEN) d0v4 conf read cf8 0x80001268 bytes 2 offset 2 data 0x1011
(XEN) d0v4 conf read cf8 0x80001268 bytes 2 offset 2 data 0x1011
(XEN) d0v1 conf read cf8 0x80001278 bytes 4 offset 0 data 0
(XEN) d0v1 conf read cf8 0x80001268 bytes 2 offset 2 data 0xb012
(XEN) d0v1 conf write cf8 0x80001268 bytes 2 offset 2 data 0x8000
(XEN) d0v1 conf read cf8 0x80001268 bytes 2 offset 2 data 0x3012
(XEN) d0v4 conf read cf8 0x80001268 bytes 2 offset 2 data 0x3012
(XEN) d0v4 conf read cf8 0x80010000 bytes 4 offset 0 data 0x61614c3
(XEN) d0v4 conf read cf8 0x80010090 bytes 2 offset 0 data 0
(XEN) d0v4 conf read cf8 0x80001268 bytes 2 offset 0 data 0xcc2
(XEN) d0v4 conf write cf8 0x80010090 bytes 2 offset 0 data 0
(XEN) d0v4 conf write cf8 0x80001268 bytes 2 offset 0 data 0xcc0
(XEN) d0v4 conf write cf8 0x80001268 bytes 2 offset 0 data 0xcc2
(XEN) d0v4 conf write cf8 0x80010090 bytes 2 offset 0 data 0
(XEN) d0v4 conf read cf8 0x80001280 bytes 4 offset 0 data 0x6
(XEN) d0v4 conf read cf8 0x80001280 bytes 2 offset 0 data 0x6
(XEN) d0v4 conf write cf8 0x80001280 bytes 2 offset 0 data 0x406
(XEN) d0v4 conf write cf8 0x80010088 bytes 2 offset 0 data 0x2910
(XEN) d0v4 conf write cf8 0x80010090 bytes 2 offset 0 data 0x1c2
(XEN) d0v4 conf write cf8 0x800100a8 bytes 2 offset 0 data 0x400
(XEN) d0v4 conf write cf8 0x800100b0 bytes 2 offset 0 data 0x2
(XEN) d0v4 conf read cf8 0x8001003c bytes 4 offset 0 data 0x100
(XEN) d0v4 conf write cf8 0x8001003c bytes 4 offset 0 data 0x1ff
(XEN) d0v4 conf read cf8 0x80010038 bytes 4 offset 0 data 0
(XEN) d0v4 conf read cf8 0x80010034 bytes 4 offset 0 data 0x80
(XEN) d0v4 conf read cf8 0x80010030 bytes 4 offset 0 data 0
(XEN) d0v4 conf read cf8 0x8001002c bytes 4 offset 0 data 0xe61614c3
(XEN) d0v4 conf read cf8 0x80010028 bytes 4 offset 0 data 0
(XEN) d0v4 conf read cf8 0x80010024 bytes 4 offset 0 data 0
(XEN) d0v4 conf read cf8 0x80010020 bytes 4 offset 0 data 0
(XEN) d0v4 conf read cf8 0x8001001c bytes 4 offset 0 data 0
(XEN) d0v4 conf read cf8 0x80010018 bytes 4 offset 0 data 0x4
(XEN) d0v4 conf write cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
(XEN) d0v4 conf read cf8 0x80010018 bytes 4 offset 0 data 0x90b00004
(XEN) d0v4 conf read cf8 0x80010014 bytes 4 offset 0 data 0
(XEN) d0v4 conf write cf8 0x80010014 bytes 4 offset 0 data 0x80
(XEN) d0v4 conf read cf8 0x80010014 bytes 4 offset 0 data 0x80
(XEN) d0v4 conf read cf8 0x80010010 bytes 4 offset 0 data 0xc
(XEN) d0v4 conf write cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
(XEN) d0v4 conf read cf8 0x80010010 bytes 4 offset 0 data 0x1090000c
(XEN) d0v4 conf read cf8 0x8001000c bytes 4 offset 0 data 0
(XEN) d0v4 conf write cf8 0x8001000c bytes 4 offset 0 data 0x10
(XEN) d0v4 conf read cf8 0x80010008 bytes 4 offset 0 data 0x2800000
(XEN) d0v4 conf read cf8 0x80010004 bytes 4 offset 0 data 0x100000
(XEN) d0v4 conf read cf8 0x80010000 bytes 4 offset 0 data 0x61614c3

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ltpSZ9Ianuxtah5b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmej4rkACgkQ24/THMrX
1yxSRwgAmPZQtY0m5UrCQAjSsvmEJAjS16Y46MyYsl7Jv8TQEHxC8XLZ2WeZWuS7
cpPe5MOraVZNWhXj3vSHLrzmM9W2ZcHoVH1Km5EkVBymyEyr1XhdPAe4qz/B4PsI
OAAzPwPqtCFJ2AkGmOWo1AKEChNjp4ohHSUv95xoiX2HFtRnyZD8r+t/FhaHdOEM
EEKDGAUB/cAXyejqImetKcjiPo+bFKjSbHCHQLtkPPh4+p/u2Xs2rs7S5Jrmcg2X
J06QoOAIYEO17JJnDUVKRGMgKOrbpqM0GzpuvoWmHt5+ufWpLKwRcUlVPTA5FaZ2
K7XfU2ZRIN8AeZdyI3MFpd/oc++6cQ==
=BivA
-----END PGP SIGNATURE-----

--ltpSZ9Ianuxtah5b--

