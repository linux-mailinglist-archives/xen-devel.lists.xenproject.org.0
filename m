Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC80B36643
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 15:55:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094514.1449807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqu8n-00054t-9N; Tue, 26 Aug 2025 13:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094514.1449807; Tue, 26 Aug 2025 13:55:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqu8n-00052j-6o; Tue, 26 Aug 2025 13:55:13 +0000
Received: by outflank-mailman (input) for mailman id 1094514;
 Tue, 26 Aug 2025 13:55:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EpqW=3G=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uqu8m-00052d-5p
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 13:55:12 +0000
Received: from fout-a2-smtp.messagingengine.com
 (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 471b5845-8284-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 15:55:09 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id 71658EC0495;
 Tue, 26 Aug 2025 09:55:08 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Tue, 26 Aug 2025 09:55:08 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Aug 2025 09:55:07 -0400 (EDT)
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
X-Inumbo-ID: 471b5845-8284-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756216508;
	 x=1756302908; bh=K8WQCwSehiom9QczQ6FIl2QN0kQnpXkCGstJKkpJdxA=; b=
	deiiDOzJjdswrFCerYyFahErntKyIh8x6Isy92/DqbmfhiCDtsPao+QeOVI8UyJ0
	OZlXFI4kgxuWzUeNsUW/qPk1gwhB2LzuDrLGackkqQn4rdhYx238JHWAZ6mluCDx
	YmTc9sjYzY/2TUP11bDC39zi7Koxi93zr8B1Dfp+HnELh/osGl8RQHuuknIVUgHk
	aG0WWRSeB+q7SMjqxbwDvx8VIcc8e0H41dMpjrz3OaMTLq55pgekn/FsGdLAg3Ca
	asJPbhZNwzgqjHuTTBRb1GkuPk6rHW4TYfcGsalRCKJMz6d6Wu0/LTicCB0fWh+J
	ACala883X1/GXrQ0ClzNlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1756216508; x=1756302908; bh=K8WQCwSehiom9QczQ6FIl2QN0kQnpXkCGst
	JKkpJdxA=; b=oJ7PA3E+XDYKdQUEyRAxpyMmkn598EDy39DRwlLJYktUweaNR+d
	jZxruHEtkvdiSk2wS731x8LSC1poW7M8PP2s5aNLaXZSSHMz3AnYU357vTGEpliU
	z4cdyGG0+I/euUBqa7ajVmhwj9qydFeWaAzKFbvDVRBSQagaKGlbwIbzrf6aAh8e
	PSfgsYIz8Ht86Hb9PI4xQLYm29wRhXRcy3NllydZkgjqxrFX5Ep8sUGWp9Q671Xb
	nDEjkScU+TkUs01X5I+e0J/D/vqosBRmHn8Mr49ORGOQoPz/szUVDGnumuLwUBe7
	nbROU+cLqZwXxmigYtsEhW8l0D01IeoHZWQ==
X-ME-Sender: <xms:vLytaOnYnQANvovqHABr7Q0VH3L4TVr6eGZezxUZt8eSQTboRz3v7w>
    <xme:vLytaJG5YE1O70oBjRi8uuPg47MIGS1nS6OdWtcqgD18N1o5tPmzXcDhetDY-hjhY
    ETiMHvVvMmCaQ>
X-ME-Received: <xmr:vLytaGHMXZGclwbgz7P-ovvXaMw8qMe2az6S3Dg30fMo4HrfJKvR6R5bpAy_z1rlfuB1o84uECKaXPImVDjKlVWW_sruGXiI44E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddujeehgeegucetufdoteggodetrf
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
X-ME-Proxy: <xmx:vLytaOOmXBz1At0ywJ8Ibf6jUrikqGVZ5MWxXNPZy-zlH92ZUB8ZzQ>
    <xmx:vLytaNGBOA-WmfG53s09C0HlQPav7yL4mozXVbkQ0sBeR9LSxx-CwA>
    <xmx:vLytaNMVMJhP7zi3mCgOcsoBDT0_nIR3ZCqigvCrWSVBeOO6YzZfpQ>
    <xmx:vLytaG-dx3vlYH0uRmsweI-E3Nly59TYbQOWkygXzB8LZceb5DnsRQ>
    <xmx:vLytaNPpRmSy8AWKA6NFCeaqK-arcgKV2UKeMFdW45zuLQMiHyzuKYaW>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 26 Aug 2025 15:55:05 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: MSI-X cleanup(?) issue with passthrough after domU restart
Message-ID: <aK28ubf5F3x-of3X@mail-itl>
References: <aK0St0oUkJzR9lO0@mail-itl>
 <2aafbace-3aa2-4f58-8f6c-2815cd2315ad@suse.com>
 <aK1wSKTg5LcuzBDc@macbook.local>
 <aK2TLuB_yKlWjFgM@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SPDx3WFh/ytkDTPC"
Content-Disposition: inline
In-Reply-To: <aK2TLuB_yKlWjFgM@mail-itl>


--SPDx3WFh/ytkDTPC
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 Aug 2025 15:55:05 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: MSI-X cleanup(?) issue with passthrough after domU restart

On Tue, Aug 26, 2025 at 12:57:50PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Tue, Aug 26, 2025 at 10:28:56AM +0200, Roger Pau Monn=C3=A9 wrote:
> > On Tue, Aug 26, 2025 at 08:16:56AM +0200, Jan Beulich wrote:
> > > On 26.08.2025 03:49, Marek Marczykowski-G=C3=B3recki wrote:
> > > > Hi,
> > > >=20
> > > > I'm hitting an MSI-X issue after rebooting the domU. The symptoms a=
re
> > > > rather boring: on initial domU start the device (realtek eth card) =
works
> > > > fine, but after domU restart, the link doesn't come up (there is no
> > > > "Link is Up" message anymore). No errors from domU driver or Xen. I
> > > > tracked it down to MSI-X - if I force INTx (via pci=3Dnomsi on domU
> > > > cmdline) it works fine. Convincing the driver to poll instead of wa=
iting
> > > > for an interrupt also workarounds the issue.
> > > >=20
> > > > I noticed also some interrupts are not cleaned up on restart. The l=
ist
> > > > of MSIs in 'Q' debug key output grows:
> > > >=20
> > > >     (XEN) 0000:03:00.0 - d22 - node -1  - MSIs < 41 42 43 44 45 46 =
47 >
> > > >     restart sys-net domU
> > > >     (XEN) 0000:03:00.0 - d24 - node -1  - MSIs < 41 42 43 44 45 46 =
47 48 >
> > > >     restart sys-net domU
> > > >     (XEN) 0000:03:00.0 - d26 - node -1  - MSIs < 41 42 43 44 45 46 =
47 48 49 >
> > > >=20
> > > > and 'M' output is:
> > > >=20
> > > >     (XEN)  MSI-X   41 vec=3Db1 lowest  edge   assert  log lowest de=
st=3D00000001 mask=3D1/H /1
> > > >     (XEN)  MSI-X   42 vec=3Db9 lowest  edge   assert  log lowest de=
st=3D00000004 mask=3D1/HG/1
> > > >     (XEN)  MSI-X   43 vec=3Dc1 lowest  edge   assert  log lowest de=
st=3D00000010 mask=3D1/HG/1
> > > >     (XEN)  MSI-X   44 vec=3Dd9 lowest  edge   assert  log lowest de=
st=3D00000001 mask=3D1/HG/1
> > > >     (XEN)  MSI-X   45 vec=3De1 lowest  edge   assert  log lowest de=
st=3D00000001 mask=3D1/HG/1
> > > >     (XEN)  MSI-X   46 vec=3De9 lowest  edge   assert  log lowest de=
st=3D00000040 mask=3D1/HG/1
> > > >     (XEN)  MSI-X   47 vec=3D32 lowest  edge   assert  log lowest de=
st=3D00000004 mask=3D1/HG/1
> > > >     (XEN)  MSI-X   48 vec=3D3a lowest  edge   assert  log lowest de=
st=3D00000040 mask=3D1/HG/1
> > > >     (XEN)  MSI-X   49 vec=3D42 lowest  edge   assert  log lowest de=
st=3D00000010 mask=3D1/ G/1
> > > >=20
> > > > And also, after starting and stopping the domU, `xl pci-assignable-=
remove 03:00.0`
> > > > makes pciback to complain:
> > > >=20
> > > >     [ 1180.919874] pciback 0000:03:00.0: xen_pciback: MSI-X release=
 failed (-16)
> > > >=20
> > > > This is all running on Xen 4.19.3, but I don't see much changes in =
this
> > > > area since then.
> > > >=20
> > > > Some more info collected at https://github.com/QubesOS/qubes-issues=
/issues/9335
> > > >=20
> > > > My question is: what should be responsible for this cleanup on doma=
in
> > > > destroy? Xen, or maybe device model (which is QEMU in stubdomain he=
re)?
> > >=20
> > > The expectation is that qemu invokes the necessary cleanup, but of co=
urse ...
> > >=20
> > > > I see some cleanup (apparently not enough) happening via QEMU when =
the
> > > > domU driver is unloaded, but logically correct cleanup shouldn't de=
pend
> > > > on correct domU operation...
> > >=20
> > > ... Xen may not make itself dependent upon either DomU or QEMU.
> >=20
> > AFAICT free_domain_pirqs() called by arch_domain_destroy() should take
> > care of unbinding and freeing pirqs (but obviously not in this case).
> > Can you repeat the test with a debug=3Dy hypervisor and post the
> > resulting serial or dmesg here?  Some of the errors on those paths are
> > printed with dprintk() and won't be visible unless using a Xen debug
> > build.
>=20
> Sure, will do.

Output collected during domU shutdown and subsequent startup (dom0 logs
to Xen console here too):
https://gist.github.com/marmarek/6dc3ac14d3ba840482e6361fcbd37c30

I don't see any errors there...

As for the domU-triggered cleanup, I just checked - if I unload the
driver in domU before restarting, it works fine on subsequent startup.

Relevant QEMU/stubdomain log parts (initial startup + shutdown, when
device still works):

1. Without unloading the driver:

[2025-08-26 12:57:42] [00:06.0] xen_pt_realize: Assigning real physical dev=
ice 03:00.0 to devfn 0x30
[2025-08-26 12:57:42] [00:06.0] xen_pt_register_regions: IO region 0 regist=
ered (size=3D0x00000100 base_addr=3D0x0000e000 type: 0x1)
[2025-08-26 12:57:42] [00:06.0] xen_pt_register_regions: IO region 2 regist=
ered (size=3D0x00001000 base_addr=3D0xf7c00000 type: 0x4)
[2025-08-26 12:57:42] [00:06.0] xen_pt_register_regions: IO region 4 regist=
ered (size=3D0x00004000 base_addr=3D0xf0000000 type: 0x4)
[2025-08-26 12:57:42] [00:06.0] xen_pt_config_reg_init: Offset 0x0010 misma=
tch! Emulated=3D0x0000, host=3D0xe001, syncing to 0xe001.
[2025-08-26 12:57:42] [00:06.0] xen_pt_config_reg_init: Offset 0x0018 misma=
tch! Emulated=3D0x0000, host=3D0xf7c00004, syncing to 0xf7c00004.
[2025-08-26 12:57:42] [00:06.0] xen_pt_config_reg_init: Offset 0x0020 misma=
tch! Emulated=3D0x0000, host=3D0xf000000c, syncing to 0xf000000c.
[2025-08-26 12:57:42] [00:06.0] xen_pt_config_reg_init: Offset 0x0042 misma=
tch! Emulated=3D0x0000, host=3D0x07c3, syncing to 0x0603.
[2025-08-26 12:57:42] [00:06.0] xen_pt_pm_ctrl_reg_init_on: PCI power manag=
ement control passthrough is on
[2025-08-26 12:57:42] [00:06.0] xen_pt_config_reg_init: Offset 0x0052 misma=
tch! Emulated=3D0x0000, host=3D0x0080, syncing to 0x0080.
[2025-08-26 12:57:42] [00:06.0] xen_pt_config_reg_init: Offset 0x0074 misma=
tch! Emulated=3D0x0000, host=3D0x5908cc0, syncing to 0x5908cc0.
[2025-08-26 12:57:42] [00:06.0] xen_pt_config_reg_init: Offset 0x007a misma=
tch! Emulated=3D0x0000, host=3D0x0010, syncing to 0x0010.
[2025-08-26 12:57:42] [00:06.0] xen_pt_config_reg_init: Offset 0x0082 misma=
tch! Emulated=3D0x0000, host=3D0x1011, syncing to 0x1011.
[2025-08-26 12:57:42] [00:06.0] xen_pt_msix_init: get MSI-X table BAR base =
0xf0000000
[2025-08-26 12:57:42] [00:06.0] xen_pt_config_reg_init: Offset 0x00b2 misma=
tch! Emulated=3D0x0000, host=3D0x0003, syncing to 0x0003.
[2025-08-26 12:57:42] [00:06.0] xen_pt_pci_intx: intx=3D1
[2025-08-26 12:57:42] [00:06.0] xen_pt_realize: Real physical device 03:00.=
0 registered successfully
[2025-08-26 12:57:42] from-unix: {"return": {}, "id": 2020372736}
[2025-08-26 12:57:42]=20
[2025-08-26 12:57:42] wrote 34 bytes to vchan
[2025-08-26 12:57:42] from-vchan: {"execute":"query-pci","id":2020372738}
[2025-08-26 12:57:42]=20
[2025-08-26 12:57:42] from-unix: {"return": [{"bus": 0, "devices": [{"irq_p=
in": 0, "bus": 0, "qdev_id": "", "slot": 0, "class_info": {"class": 1536, "=
desc": "Host bridge"}, "id": {"device": 4663, "subsystem-vendor": 6900, "ve=
ndor": 32902, "subsystem": 4352}, "function": 0, "regions": []}, {"irq_pin"=
: 0, "bus": 0, "qdev_id": "", "slot": 1, "class_info": {"class": 1537, "des=
c": "ISA bridge"}, "id": {"device": 28672, "subsystem-vendor": 6900, "vendo=
r": 32902, "subsystem": 4352}, "function": 0, "regions": []}, {"irq_pin": 0=
, "bus": 0, "qdev_id": "", "slot": 1, "class_info": {"class": 257, "desc": =
"IDE controller"}, "id": {"device": 28688, "subsystem-vendor": 6900, "vendo=
r": 32902, "subsystem": 4352}, "function": 1, "regions": [{"bar": 4, "size"=
: 16, "address": -1, "type": "io"}]}, {"irq_pin": 1, "bus": 0, "qdev_id": "=
", "irq": 0, "slot": 1, "class_info": {"class": 1664, "desc": "Bridge"}, "i=
d": {"device": 28947, "subsystem-vendor": 6900, "vendor": 32902, "subsystem=
": 4352}, "function": 3, "regions": []}, {"irq_pin": 1, "bus": 0, "qdev_id"=
: "", "irq": 0, "slot": 2, "class_info": {"class": 65408}, "id": {"device":=
 1, "subsystem-vendor": 22611, "vendor": 22611, "subsystem": 1}, "function"=
: 0, "regions": [{"bar": 0, "size": 256, "address": -1, "type": "io"}, {"pr=
efetch": true, "mem_type_64": false, "bar": 1, "size": 16777216, "address":=
 -1, "type": "memory"}]}, {"irq_pin": 1, "bus": 0, "qdev_id": "", "irq": 0,=
 "slot": 3, "class_info": {"class": 256, "desc": "SCSI controller"}, "id": =
{"device": 18, "subsystem-vendor": 0, "vendor": 4096, "subsystem": 4096}, "=
function": 0, "regions": [{"bar": 0, "size": 256, "address": -1, "type": "i=
o"}, {"prefetch": false, "mem_type_64": false, "bar": 1, "size": 1024, "add=
ress": -1, "type": "memory"}, {"prefetch": false, "mem_type_64": false, "ba=
r": 2, "size": 8192, "address": -1, "type": "memory"}]}, {"irq_pin": 0, "bu=
s": 0, "qdev_id": "", "slot": 4, "class_info": {"class": 768, "desc": "VGA =
controller"}, "id": {"device": 4369, "subsystem-vendor": 6900, "vendor": 46=
60, "subsystem": 4352}, "function": 0, "regions": [{"prefetch": true, "mem_=
type_64": false, "bar": 0, "size": 16777216, "address": -1, "type": "memory=
"}, {"prefetch": false, "mem_type_64": false, "bar": 2, "size": 4096, "addr=
ess": -1, "type": "memory"}, {"prefetch": false, "mem_type_64": false, "bar=
": 6, "size": 65536, "address": -1, "type": "memory"}]}, {"irq_pin": 4, "bu=
s": 0, "qdev_id": "ehci", "irq": 0, "slot": 5, "class_info": {"class": 3075=
, "desc": "USB controller"}, "id": {"device": 9421, "subsystem-vendor": 690=
0, "vendor": 32902, "subsystem": 4352}, "function": 0, "regions": [{"prefet=
ch": false, "mem_type_64": false, "bar": 0, "size": 4096, "address": -1, "t=
ype": "memory"}]}, {"irq_pin": 1, "bus": 0, "qdev_id": "pci-pt-03_00.0", "i=
rq": 0, "slot": 6, "class_info": {"class": 0}, "id": {"device": 33128, "sub=
system-vendor": 0, "vendor": 4332, "subsystem": 0}, "function": 0, "regions=
": [{"bar": 0, "size": 256, "address": -1, "type": "io"}, {"prefetch": fals=
e, "mem_type_64": true, "bar": 2, "size": 4096, "address": -1, "type": "mem=
ory"}, {"prefetch": false, "mem_type_64": true, "bar": 4, "size": 16384, "a=
ddress": -1, "type": "memory"}]}]}], "id": 2020372738}
[2025-08-26 12:57:42]=20
[2025-08-26 12:57:42] wrote 2048 bytes to vchan
[2025-08-26 12:57:42] wrote 1125 bytes to vchan
[2025-08-26 12:57:42] vchan client disconnected
[2025-08-26 12:57:42] [00:06.0] xen_pt_check_bar_overlap: Warning: Overlapp=
ed to device [00:02.0] Region: 1 (addr: 0xf0000000, len: 0x1000000)
[2025-08-26 12:57:42] [00:06.0] xen_pt_region_update: Warning: Region: 4 (a=
ddr: 0xf0001000, len: 0x3000) is overlapped.
[2025-08-26 12:57:44] {"timestamp": {"seconds": 1756213064, "microseconds":=
 412107}, "event": "DEVICE_DELETED", "data": {"path": "/machine/unattached/=
device[8]"}}
[2025-08-26 12:57:44] {"timestamp": {"seconds": 1756213064, "microseconds":=
 416176}, "event": "DEVICE_DELETED", "data": {"path": "/machine/unattached/=
device[7]"}}
[2025-08-26 12:57:44] {"timestamp": {"seconds": 1756213064, "microseconds":=
 416244}, "event": "DEVICE_DELETED", "data": {"path": "/machine/unattached/=
device[6]"}}
[2025-08-26 12:57:44] {"timestamp": {"seconds": 1756213064, "microseconds":=
 416653}, "event": "DEVICE_DELETED", "data": {"path": "/machine/peripheral-=
anon/device[3]"}}
[2025-08-26 12:57:44] {"timestamp": {"seconds": 1756213064, "microseconds":=
 416694}, "event": "DEVICE_DELETED", "data": {"path": "/machine/peripheral-=
anon/device[0]"}}
[2025-08-26 12:57:48] [00:06.0] xen_pt_msixctrl_reg_write: enable MSI-X
[2025-08-26 12:57:48] [00:06.0] msi_msix_update: Updating MSI-X with pirq 5=
5 gvec 0xef gflags 0x0 (entry: 0x0)
[2025-08-26 12:57:49] [00:06.0] msi_msix_update: Updating MSI-X with pirq 5=
5 gvec 0x23 gflags 0x0 (entry: 0x0)
[2025-08-26 13:21:03] {"timestamp": {"seconds": 1756214457, "microseconds":=
 588341}, "event": "SHUTDOWN", "data": {"guest": true, "reason": "guest-shu=
tdown"}}
[2025-08-26 13:21:03] {"timestamp": {"seconds": 1756214457, "microseconds":=
 588579}, "event": "STOP"}
[2025-08-26 13:21:03] pcifront pci-0: Rescanning PCI Frontend Bus 0000:00
[2025-08-26 13:21:03] pci_bus 0000:00: busn_res: [bus 00-ff] is released
[2025-08-26 13:21:03] ------------[ cut here ]------------
[2025-08-26 13:21:03] sysfs group 'power' not found for kobject '0000:00'
[2025-08-26 13:21:03] WARNING: CPU: 0 PID: 13 at fs/sysfs/group.c:282 sysfs=
_remove_group+0x3a/0x6f


2. With unloading the driver before shutdown:
[2025-08-26 13:21:07] [00:06.0] xen_pt_realize: Assigning real physical dev=
ice 03:00.0 to devfn 0x30
[2025-08-26 13:21:07] [00:06.0] xen_pt_register_regions: IO region 0 regist=
ered (size=3D0x00000100 base_addr=3D0x0000e000 type: 0x1)
[2025-08-26 13:21:07] [00:06.0] xen_pt_register_regions: IO region 2 regist=
ered (size=3D0x00001000 base_addr=3D0xf7c00000 type: 0x4)
[2025-08-26 13:21:07] [00:06.0] xen_pt_register_regions: IO region 4 regist=
ered (size=3D0x00004000 base_addr=3D0xf0000000 type: 0x4)
[2025-08-26 13:21:07] [00:06.0] xen_pt_config_reg_init: Offset 0x0010 misma=
tch! Emulated=3D0x0000, host=3D0xe001, syncing to 0xe001.
[2025-08-26 13:21:07] [00:06.0] xen_pt_config_reg_init: Offset 0x0018 misma=
tch! Emulated=3D0x0000, host=3D0xf7c00004, syncing to 0xf7c00004.
[2025-08-26 13:21:07] [00:06.0] xen_pt_config_reg_init: Offset 0x0020 misma=
tch! Emulated=3D0x0000, host=3D0xf000000c, syncing to 0xf000000c.
[2025-08-26 13:21:07] [00:06.0] xen_pt_config_reg_init: Offset 0x0042 misma=
tch! Emulated=3D0x0000, host=3D0x07c3, syncing to 0x0603.
[2025-08-26 13:21:07] [00:06.0] xen_pt_pm_ctrl_reg_init_on: PCI power manag=
ement control passthrough is on
[2025-08-26 13:21:07] [00:06.0] xen_pt_config_reg_init: Offset 0x0052 misma=
tch! Emulated=3D0x0000, host=3D0x0080, syncing to 0x0080.
[2025-08-26 13:21:07] [00:06.0] xen_pt_config_reg_init: Offset 0x0074 misma=
tch! Emulated=3D0x0000, host=3D0x5908cc0, syncing to 0x5908cc0.
[2025-08-26 13:21:07] [00:06.0] xen_pt_config_reg_init: Offset 0x007a misma=
tch! Emulated=3D0x0000, host=3D0x0010, syncing to 0x0010.
[2025-08-26 13:21:07] [00:06.0] xen_pt_config_reg_init: Offset 0x0082 misma=
tch! Emulated=3D0x0000, host=3D0x1011, syncing to 0x1011.
[2025-08-26 13:21:07] [00:06.0] xen_pt_msix_init: get MSI-X table BAR base =
0xf0000000
[2025-08-26 13:21:07] [00:06.0] xen_pt_config_reg_init: Offset 0x00b2 misma=
tch! Emulated=3D0x0000, host=3D0x0003, syncing to 0x0003.
[2025-08-26 13:21:07] [00:06.0] xen_pt_pci_intx: intx=3D1
[2025-08-26 13:21:07] [00:06.0] xen_pt_realize: Real physical device 03:00.=
0 registered successfully
[2025-08-26 13:21:07] from-unix: {"return": {}, "id": 2020372736}
[2025-08-26 13:21:07]=20
[2025-08-26 13:21:07] wrote 34 bytes to vchan
[2025-08-26 13:21:07] from-vchan: {"execute":"query-pci","id":2020372738}
[2025-08-26 13:21:07]=20
[2025-08-26 13:21:07] from-unix: {"return": [{"bus": 0, "devices": [{"irq_p=
in": 0, "bus": 0, "qdev_id": "", "slot": 0, "class_info": {"class": 1536, "=
desc": "Host bridge"}, "id": {"device": 4663, "subsystem-vendor": 6900, "ve=
ndor": 32902, "subsystem": 4352}, "function": 0, "regions": []}, {"irq_pin"=
: 0, "bus": 0, "qdev_id": "", "slot": 1, "class_info": {"class": 1537, "des=
c": "ISA bridge"}, "id": {"device": 28672, "subsystem-vendor": 6900, "vendo=
r": 32902, "subsystem": 4352}, "function": 0, "regions": []}, {"irq_pin": 0=
, "bus": 0, "qdev_id": "", "slot": 1, "class_info": {"class": 257, "desc": =
"IDE controller"}, "id": {"device": 28688, "subsystem-vendor": 6900, "vendo=
r": 32902, "subsystem": 4352}, "function": 1, "regions": [{"bar": 4, "size"=
: 16, "address": -1, "type": "io"}]}, {"irq_pin": 1, "bus": 0, "qdev_id": "=
", "irq": 0, "slot": 1, "class_info": {"class": 1664, "desc": "Bridge"}, "i=
d": {"device": 28947, "subsystem-vendor": 6900, "vendor": 32902, "subsystem=
": 4352}, "function": 3, "regions": []}, {"irq_pin": 1, "bus": 0, "qdev_id"=
: "", "irq": 0, "slot": 2, "class_info": {"class": 65408}, "id": {"device":=
 1, "subsystem-vendor": 22611, "vendor": 22611, "subsystem": 1}, "function"=
: 0, "regions": [{"bar": 0, "size": 256, "address": -1, "type": "io"}, {"pr=
efetch": true, "mem_type_64": false, "bar": 1, "size": 16777216, "address":=
 -1, "type": "memory"}]}, {"irq_pin": 1, "bus": 0, "qdev_id": "", "irq": 0,=
 "slot": 3, "class_info": {"class": 256, "desc": "SCSI controller"}, "id": =
{"device": 18, "subsystem-vendor": 0, "vendor": 4096, "subsystem": 4096}, "=
function": 0, "regions": [{"bar": 0, "size": 256, "address": -1, "type": "i=
o"}, {"prefetch": false, "mem_type_64": false, "bar": 1, "size": 1024, "add=
ress": -1, "type": "memory"}, {"prefetch": false, "mem_type_64": false, "ba=
r": 2, "size": 8192, "address": -1, "type": "memory"}]}, {"irq_pin": 0, "bu=
s": 0, "qdev_id": "", "slot": 4, "class_info": {"class": 768, "desc": "VGA =
controller"}, "id": {"device": 4369, "subsystem-vendor": 6900, "vendor": 46=
60, "subsystem": 4352}, "function": 0, "regions": [{"prefetch": true, "mem_=
type_64": false, "bar": 0, "size": 16777216, "address": -1, "type": "memory=
"}, {"prefetch": false, "mem_type_64": false, "bar": 2, "size": 4096, "addr=
ess": -1, "type": "memory"}, {"prefetch": false, "mem_type_64": false, "bar=
": 6, "size": 65536, "address": -1, "type": "memory"}]}, {"irq_pin": 4, "bu=
s": 0, "qdev_id": "ehci", "irq": 0, "slot": 5, "class_info": {"class": 3075=
, "desc": "USB controller"}, "id": {"device": 9421, "subsystem-vendor": 690=
0, "vendor": 32902, "subsystem": 4352}, "function": 0, "regions": [{"prefet=
ch": false, "mem_type_64": false, "bar": 0, "size": 4096, "address": -1, "t=
ype": "memory"}]}, {"irq_pin": 1, "bus": 0, "qdev_id": "pci-pt-03_00.0", "i=
rq": 0, "slot": 6, "class_info": {"class": 0}, "id": {"device": 33128, "sub=
system-vendor": 0, "vendor": 4332, "subsystem": 0}, "function": 0, "regions=
": [{"bar": 0, "size": 256, "address": -1, "type": "io"}, {"prefetch": fals=
e, "mem_type_64": true, "bar": 2, "size": 4096, "address": -1, "type": "mem=
ory"}, {"prefetch": false, "mem_type_64": true, "bar": 4, "size": 16384, "a=
ddress": -1, "type": "memory"}]}]}], "id": 2020372738}
[2025-08-26 13:21:07]=20
[2025-08-26 13:21:07] wrote 2048 bytes to vchan
[2025-08-26 13:21:07] wrote 1125 bytes to vchan
[2025-08-26 13:21:07] vchan client disconnected
[2025-08-26 13:21:07] [00:06.0] xen_pt_check_bar_overlap: Warning: Overlapp=
ed to device [00:02.0] Region: 1 (addr: 0xf0000000, len: 0x1000000)
[2025-08-26 13:21:07] [00:06.0] xen_pt_region_update: Warning: Region: 4 (a=
ddr: 0xf0001000, len: 0x3000) is overlapped.
[2025-08-26 13:21:09] {"timestamp": {"seconds": 1756214469, "microseconds":=
 28994}, "event": "DEVICE_DELETED", "data": {"path": "/machine/unattached/d=
evice[8]"}}
[2025-08-26 13:21:09] {"timestamp": {"seconds": 1756214469, "microseconds":=
 32958}, "event": "DEVICE_DELETED", "data": {"path": "/machine/unattached/d=
evice[7]"}}
[2025-08-26 13:21:09] {"timestamp": {"seconds": 1756214469, "microseconds":=
 33004}, "event": "DEVICE_DELETED", "data": {"path": "/machine/unattached/d=
evice[6]"}}
[2025-08-26 13:21:09] {"timestamp": {"seconds": 1756214469, "microseconds":=
 33261}, "event": "DEVICE_DELETED", "data": {"path": "/machine/peripheral-a=
non/device[3]"}}
[2025-08-26 13:21:09] {"timestamp": {"seconds": 1756214469, "microseconds":=
 33296}, "event": "DEVICE_DELETED", "data": {"path": "/machine/peripheral-a=
non/device[0]"}}
[2025-08-26 13:21:12] [00:06.0] xen_pt_msixctrl_reg_write: enable MSI-X
[2025-08-26 13:21:12] [00:06.0] msi_msix_update: Updating MSI-X with pirq 5=
5 gvec 0xef gflags 0x0 (entry: 0x0)
[2025-08-26 13:21:13] [00:06.0] msi_msix_update: Updating MSI-X with pirq 5=
5 gvec 0x23 gflags 0x0 (entry: 0x0)
[2025-08-26 13:41:45] [00:06.0] msix_set_enable: disabling MSI-X.
[2025-08-26 13:41:45] [00:06.0] msi_msix_disable: Unbind MSI-X with pirq 55=
, gvec 0x23
[2025-08-26 13:41:45] [00:06.0] msi_msix_disable: Unmap MSI-X pirq 55
[2025-08-26 13:41:45] [00:06.0] xen_pt_msixctrl_reg_write: disable MSI-X
{"timestamp": {"seconds": 1756215718, "microseconds": 455554}, "event": "SH=
UTDOWN", "data": {"guest": true, "reason": "guest-shutdown"}}
[2025-08-26 13:41:58] {"timestamp": {"seconds": 1756215718, "microseconds":=
 456438}, "event": "STOP"}
[2025-08-26 13:41:58] pcifront pci-0: Rescanning PCI Frontend Bus 0000:00
[2025-08-26 13:41:58] pci_bus 0000:00: busn_res: [bus 00-ff] is released
[2025-08-26 13:41:58] ------------[ cut here ]------------
[2025-08-26 13:41:58] sysfs group 'power' not found for kobject '0000:00'
[2025-08-26 13:41:58] WARNING: CPU: 0 PID: 13 at fs/sysfs/group.c:282 sysfs=
_remove_group+0x3a/0x6f



--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--SPDx3WFh/ytkDTPC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmitvLkACgkQ24/THMrX
1yzxhQf/SPchJGKg/iL88KTK8uNyyAjEVayxB2NWUEBQek/pyVVwsFrRmgEcXamZ
kbn5oQX2mAUVIbHjC0wMMN9ahOrY/9bwLKW9IKkXl8JT0lS0zN+CBil0F/y0n+t9
e/AWOx9Vo6mB2xyD4rXfa+EFwjoOLAx3NJvQ04/GAoXfNgmvQHCcElMk9oS+i7GK
f/O8fFZ26b36BTB9HgtNxu55zUTyUeI/znf6J5/4CwCqJ1zubA/D+9gx+ixL8T3w
sWYMs+2i5QWfXbwedSfH9qjafiuWPGnv6xm6Gtlu7UaFbKwqDIktFxGKiSkK+2BN
L7eldYel22qIZ3wp7GtaHvJbpctPmQ==
=jhao
-----END PGP SIGNATURE-----

--SPDx3WFh/ytkDTPC--

