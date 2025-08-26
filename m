Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C506B35A87
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 12:58:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094329.1449651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqrNH-0001av-TW; Tue, 26 Aug 2025 10:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094329.1449651; Tue, 26 Aug 2025 10:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqrNH-0001XP-Pn; Tue, 26 Aug 2025 10:57:59 +0000
Received: by outflank-mailman (input) for mailman id 1094329;
 Tue, 26 Aug 2025 10:57:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EpqW=3G=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uqrNG-0001XH-27
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 10:57:58 +0000
Received: from fout-b7-smtp.messagingengine.com
 (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 846f9078-826b-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 12:57:55 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id C1D361D00178;
 Tue, 26 Aug 2025 06:57:53 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Tue, 26 Aug 2025 06:57:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Aug 2025 06:57:52 -0400 (EDT)
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
X-Inumbo-ID: 846f9078-826b-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756205873;
	 x=1756292273; bh=FpvDcoY/i89amBfbg856eFmlD/GJra+fiQBad2nf+fc=; b=
	OcZLKJpoXZQXvq+brn1q5snT7WmUL7/Tf7LXZD7ylaAqcYuUjEfj11aWdVIcSodL
	O/eGYukKZtgUIP3dC1RCIeG7JTAaLYVZx8DRzOnauOsNjxSdTiUBogLuuRllFrWY
	1QazxnpMCj2osTIeJTckzQB1c8ZBzjSMN9bUiufWu8VBmovg4mH3dx8P2tsTHQrA
	2jsH6FCxUeO79DzJgpdgFyYN6iTLYv/EKrtnfT/gOkK3wltzn+l3ZYaEFLenGT9h
	y9LDK48Q9eEeNnJyE/ubHjQsfpmCeTBIwHNPGLWXpMDyqeGOyY0Vv0hl1N3dZ+B1
	r9ShmuNa4eksnMpUVJM9yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1756205873; x=1756292273; bh=FpvDcoY/i89amBfbg856eFmlD/GJra+fiQB
	ad2nf+fc=; b=kjjHr9jrojNKUPfV+ZeBhixw0SIX87l1bSTh5mu9UDMoA16Xaay
	kVFs2fiPBp3Z7gXWbL8LGLAdSLrhOjUabfrnHa1ze6SUpTuffeGneIij2vWe79F7
	o1Cq5iikPUyCCecBCeOjKUlvTQiV9df//34clPayIbI9yWc4vUTJHqY+iGLDp5iO
	p8JMrkDf6eBAv2TgoQiP+NjEux2DLzu14yMnxGD1dLCcbdEwRQ1ZNGbR99Ou3tau
	hJjS390AhiW/ENdAPxoVO1hsINcZ5P6xuVFO5U4ZbaWnDnHrr9HSaEdHV5QOki5g
	aJA5pZ1f6+UgZ7pqHPpd9HtdBzeM04oxayw==
X-ME-Sender: <xms:MZOtaJjy6XjlspoeaGrf1nqyY-KDP-1OckvkGRNG0-Z9XVIyTe-9uQ>
    <xme:MZOtaBTjLlSqOu84EwuwzSrQrOrnZ2mnOzWn9hdeYZeUPQUBHns7oRkV_dtOP_8hb
    0Mk1Bl9XwKuxQ>
X-ME-Received: <xmr:MZOtaCgrNY-50jrn-0jN-ganPzvGuhDc4iXlCXdmrb33RhW6X29cmM-bRvdc2XZpH0huELq7JGMU67p8C4DIrjmJLqgkjjPfraw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddujeehtdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueekteet
    gefggfekudehteegieeljeejieeihfejgeevhfetgffgteeuteetueetnecuffhomhgrih
    hnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopehjsggvuh
    hlihgthhesshhushgvrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishht
    shdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:MZOtaJ7LqqFqJnJSw968ADshdppiSMIy0ep8YaAz9Ck_sV-BlCfg1g>
    <xmx:MZOtaHAn4gz_X9qfntq61i-LoMG0ytslEY9pqL9Rzct5PcC4Ozv1mw>
    <xmx:MZOtaIZ0zJQk-_9Vm8ZJZzm3OY2ALCvJK-8kvx0UNCVu_RD1ogya5A>
    <xmx:MZOtaKbBdA4L_OAkFSOsYaAsWAxCLetsnZPfp7chQzsh1eTQ7xUFIQ>
    <xmx:MZOtaEaG9od6UUi5eC69Cgu06rEgp_caveSJOTYA-zYb4rFs4o8pJZWp>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 26 Aug 2025 12:57:50 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: MSI-X cleanup(?) issue with passthrough after domU restart
Message-ID: <aK2TLuB_yKlWjFgM@mail-itl>
References: <aK0St0oUkJzR9lO0@mail-itl>
 <2aafbace-3aa2-4f58-8f6c-2815cd2315ad@suse.com>
 <aK1wSKTg5LcuzBDc@macbook.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h8MF4Jebq8oeROdV"
Content-Disposition: inline
In-Reply-To: <aK1wSKTg5LcuzBDc@macbook.local>


--h8MF4Jebq8oeROdV
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 Aug 2025 12:57:50 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: MSI-X cleanup(?) issue with passthrough after domU restart

On Tue, Aug 26, 2025 at 10:28:56AM +0200, Roger Pau Monn=C3=A9 wrote:
> On Tue, Aug 26, 2025 at 08:16:56AM +0200, Jan Beulich wrote:
> > On 26.08.2025 03:49, Marek Marczykowski-G=C3=B3recki wrote:
> > > Hi,
> > >=20
> > > I'm hitting an MSI-X issue after rebooting the domU. The symptoms are
> > > rather boring: on initial domU start the device (realtek eth card) wo=
rks
> > > fine, but after domU restart, the link doesn't come up (there is no
> > > "Link is Up" message anymore). No errors from domU driver or Xen. I
> > > tracked it down to MSI-X - if I force INTx (via pci=3Dnomsi on domU
> > > cmdline) it works fine. Convincing the driver to poll instead of wait=
ing
> > > for an interrupt also workarounds the issue.
> > >=20
> > > I noticed also some interrupts are not cleaned up on restart. The list
> > > of MSIs in 'Q' debug key output grows:
> > >=20
> > >     (XEN) 0000:03:00.0 - d22 - node -1  - MSIs < 41 42 43 44 45 46 47=
 >
> > >     restart sys-net domU
> > >     (XEN) 0000:03:00.0 - d24 - node -1  - MSIs < 41 42 43 44 45 46 47=
 48 >
> > >     restart sys-net domU
> > >     (XEN) 0000:03:00.0 - d26 - node -1  - MSIs < 41 42 43 44 45 46 47=
 48 49 >
> > >=20
> > > and 'M' output is:
> > >=20
> > >     (XEN)  MSI-X   41 vec=3Db1 lowest  edge   assert  log lowest dest=
=3D00000001 mask=3D1/H /1
> > >     (XEN)  MSI-X   42 vec=3Db9 lowest  edge   assert  log lowest dest=
=3D00000004 mask=3D1/HG/1
> > >     (XEN)  MSI-X   43 vec=3Dc1 lowest  edge   assert  log lowest dest=
=3D00000010 mask=3D1/HG/1
> > >     (XEN)  MSI-X   44 vec=3Dd9 lowest  edge   assert  log lowest dest=
=3D00000001 mask=3D1/HG/1
> > >     (XEN)  MSI-X   45 vec=3De1 lowest  edge   assert  log lowest dest=
=3D00000001 mask=3D1/HG/1
> > >     (XEN)  MSI-X   46 vec=3De9 lowest  edge   assert  log lowest dest=
=3D00000040 mask=3D1/HG/1
> > >     (XEN)  MSI-X   47 vec=3D32 lowest  edge   assert  log lowest dest=
=3D00000004 mask=3D1/HG/1
> > >     (XEN)  MSI-X   48 vec=3D3a lowest  edge   assert  log lowest dest=
=3D00000040 mask=3D1/HG/1
> > >     (XEN)  MSI-X   49 vec=3D42 lowest  edge   assert  log lowest dest=
=3D00000010 mask=3D1/ G/1
> > >=20
> > > And also, after starting and stopping the domU, `xl pci-assignable-re=
move 03:00.0`
> > > makes pciback to complain:
> > >=20
> > >     [ 1180.919874] pciback 0000:03:00.0: xen_pciback: MSI-X release f=
ailed (-16)
> > >=20
> > > This is all running on Xen 4.19.3, but I don't see much changes in th=
is
> > > area since then.
> > >=20
> > > Some more info collected at https://github.com/QubesOS/qubes-issues/i=
ssues/9335
> > >=20
> > > My question is: what should be responsible for this cleanup on domain
> > > destroy? Xen, or maybe device model (which is QEMU in stubdomain here=
)?
> >=20
> > The expectation is that qemu invokes the necessary cleanup, but of cour=
se ...
> >=20
> > > I see some cleanup (apparently not enough) happening via QEMU when the
> > > domU driver is unloaded, but logically correct cleanup shouldn't depe=
nd
> > > on correct domU operation...
> >=20
> > ... Xen may not make itself dependent upon either DomU or QEMU.
>=20
> AFAICT free_domain_pirqs() called by arch_domain_destroy() should take
> care of unbinding and freeing pirqs (but obviously not in this case).
> Can you repeat the test with a debug=3Dy hypervisor and post the
> resulting serial or dmesg here?  Some of the errors on those paths are
> printed with dprintk() and won't be visible unless using a Xen debug
> build.

Sure, will do.

> > What I find puzzling (assuming I can take the quoted output plus your a=
nnotations
> > verbatim) is that the device apparently uses multiple vectors,=20

No, that was not the first domU restart before I started collecting this
output. At fresh boot there is just one vector.

> > and we're leaking
> > exactly one of them. Also, since reboot is generally nothing else than =
shutdown
> > and immediate relaunch, is there a leak also after shutdown? I ask beca=
use it
> > might help to know which of the multiple vectors is leaked (first, last=
, random).
>=20
> Can we maybe get the output of `lspci -vv` when the device is
> attached?

Both below on first domU start, when the device still works, but when it
breaks it's identical.

Collected in dom0:
03:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8=
211/8411 PCI Express Gigabit Ethernet Controller (rev 06)
	Subsystem: Gigabyte Technology Co., Ltd Onboard Ethernet
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 18
	Region 0: I/O ports at e000 [size=3D256]
	Region 2: Memory at f7c00000 (64-bit, non-prefetchable) [size=3D4K]
	Region 4: Memory at f0000000 (64-bit, prefetchable) [size=3D16K]
	Capabilities: [40] Power Management version 3
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=3D375mA PME(D0+,D1+,D2+,D3hot+,D3c=
old+)
		Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
	Capabilities: [50] MSI: Enable- Count=3D1/1 Maskable- 64bit+
		Address: 0000000000000000  Data: 0000
	Capabilities: [70] Express (v2) Endpoint, IntMsgNum 1
		DevCap:	MaxPayload 128 bytes, PhantFunc 0, Latency L0s <512ns, L1 <64us
			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 10W TEE-I=
O-
		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
			RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
			MaxPayload 128 bytes, MaxReadReq 4096 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
		LnkCap:	Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s u=
nlimited, L1 <64us
			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-
		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
		LnkSta:	Speed 2.5GT/s, Width x1
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR-
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- TPHComp- ExtTPHComp-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
			 AtomicOpsCtl: ReqEn-
			 IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- Compl=
ianceSOS-
			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- Equalizat=
ionPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
	Capabilities: [b0] MSI-X: Enable+ Count=3D4 Masked-
		Vector table: BAR=3D4 offset=3D00000000
		PBA: BAR=3D4 offset=3D00000800
	Capabilities: [d0] Vital Product Data
		Not readable
	Capabilities: [100 v1] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPB=
lockedErr-
			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXl=
atBlocked-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPB=
lockedErr-
			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXl=
atBlocked-
		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
			ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPB=
lockedErr-
			PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXl=
atBlocked-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrInt=
Err- HeaderOF-
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrInt=
Err- HeaderOF-
		AERCap:	First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCC=
hkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [140 v1] Virtual Channel
		Caps:	LPEVC=3D0 RefClk=3D100ns PATEntryBits=3D1
		Arb:	Fixed- WRR32- WRR64- WRR128-
		Ctrl:	ArbSelect=3DFixed
		Status:	InProgress-
		VC0:	Caps:	PATOffset=3D00 MaxTimeSlots=3D1 RejSnoopTrans-
			Arb:	Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
			Ctrl:	Enable+ ID=3D0 ArbSelect=3DFixed TC/VC=3D01
			Status:	NegoPending- InProgress-
	Capabilities: [160 v1] Device Serial Number 01-00-00-00-68-4c-e0-00
	Kernel driver in use: pciback
	Kernel modules: r8169


and the domU view:

00:06.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8=
211/8411 PCI Express Gigabit Ethernet Controller (rev 06)
	Subsystem: Gigabyte Technology Co., Ltd Onboard Ethernet
	Physical Slot: 6
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 40
	Region 0: I/O ports at c200 [size=3D256]
	Region 2: Memory at f2018000 (64-bit, non-prefetchable) [size=3D4K]
	Region 4: Memory at f2010000 (64-bit, prefetchable) [size=3D16K]
	Capabilities: [40] Power Management version 3
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=3D0mA PME(D0-,D1-,D2-,D3hot-,D3col=
d-)
		Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
	Capabilities: [50] MSI: Enable- Count=3D1/1 Maskable- 64bit+
		Address: 0000000000000000  Data: 0000
	Capabilities: [70] Express (v2) Endpoint, IntMsgNum 1
		DevCap:	MaxPayload 128 bytes, PhantFunc 0, Latency L0s <512ns, L1 <64us
			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 10W TEE-I=
O-
		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
			RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
			MaxPayload 128 bytes, MaxReadReq 4096 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
		LnkCap:	Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s u=
nlimited, L1 <64us
			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-
		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
		LnkSta:	Speed 2.5GT/s, Width x1
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR-
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- TPHComp- ExtTPHComp-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
			 AtomicOpsCtl: ReqEn-
			 IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- Equalizat=
ionPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
	Capabilities: [b0] MSI-X: Enable+ Count=3D4 Masked-
		Vector table: BAR=3D4 offset=3D00000000
		PBA: BAR=3D4 offset=3D00000800
	Capabilities: [d0] Vital Product Data
		Not readable
	Kernel driver in use: r8169
	Kernel modules: r8169


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--h8MF4Jebq8oeROdV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmitky4ACgkQ24/THMrX
1yyGfgf5AaZdohtyj+KWKZEpRABmbPSp/9SsfvzBm9BxI2omAaxnj0P1ncrAYMTe
PDe/g71qgau9HiI09NeR5ACIozwfEITw8QY5D8R+0joUS2TIfZDzKOzpM/z9I8VH
hZzJvHSZfjra1VjzkM++/RAjPxi/zZ4/a0NSF8ANIyjx7IZqQtJOwr1mb5ZY1btv
7ZGER9rR/VeblCi0n2NIC+oWhKG4QJFrYovZw2RsIxWdTJjuCH40h8HNqwfj6Zeg
UEUjWn+tcLFDv7T6s6luMiQqrGB6dDvAMaj+9pB9qF+SnGZFNqUtsSwKVjvi9HLT
TzIPH1a7XNdNeNB7fip1nsD5zdM48w==
=CHIr
-----END PGP SIGNATURE-----

--h8MF4Jebq8oeROdV--

