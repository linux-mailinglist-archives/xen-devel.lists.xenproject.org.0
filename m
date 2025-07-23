Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E18B0F264
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 14:36:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053926.1422709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueYhQ-0007zy-Bt; Wed, 23 Jul 2025 12:35:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053926.1422709; Wed, 23 Jul 2025 12:35:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueYhQ-0007xa-7l; Wed, 23 Jul 2025 12:35:56 +0000
Received: by outflank-mailman (input) for mailman id 1053926;
 Wed, 23 Jul 2025 12:35:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7JV9=2E=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ueYhO-0007xC-CF
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 12:35:54 +0000
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 908fee8e-67c1-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 14:35:50 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfout.stl.internal (Postfix) with ESMTP id 4DE5C1D00CFA;
 Wed, 23 Jul 2025 08:35:49 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Wed, 23 Jul 2025 08:35:49 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Jul 2025 08:35:48 -0400 (EDT)
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
X-Inumbo-ID: 908fee8e-67c1-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1753274149; x=1753360549; bh=GY
	PVx9ACXh8fSPw/Pufk/D0HIRhgwMGmOnm81/iYiYo=; b=JSfwYpNllURvDKJaIT
	h/6AuHgsB9Q6TtOs7DKIggjLvsVzLIzWhgB4+Eigigb/CNmAHkUtU1R6JPWFjcQA
	V0mAsfm7BPCzXSfggEZza+FnQ+Lhb1GNHUwhg51SdPin8c3ad4LRy8eDLFJ3IDT/
	auLskNuMdyBywu5OQ0VX8IP4UPTWpGnsei40YHaBJVqVNPUuoLVJkjwBU7QQSPgp
	SPjo320ENZDEwMKSUaNj6oubKh90d8xE27joytE3ajjzuV62jBgX1izMr7RhKTUJ
	b9c2f8ps8jjDoa8XKiHpoLohYQm8IV97JawzNjEwKmovn4cADawYv9tcGs0V3zCs
	5qMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1753274149; x=
	1753360549; bh=GYPVx9ACXh8fSPw/Pufk/D0HIRhgwMGmOnm81/iYiYo=; b=M
	3KMyDnUN+YMihAmD38Pfs7xJ/sjHgh1QtB1WOV4ymBYcCJnf3REAFNLlR1uv35+T
	iRS9C4t/FaFdcoGNPDR4WRQymInTeggn/7tk280YPV3/HrAMSjsXndp/EqaCYKFr
	gobYVt7XvP578hQSz7QYcZYrA8z+H+egwwk8sPlAgz7VaiBcWBB8IPs92wx3qjjf
	ew9A5FLlczdN43OaftIIwDGEer7IB+CxAUMze/AgKKpFueeR/j4CWNNSa/trTZ3n
	WTr0pfiosUIQsguWJEpJ3QysvrGipUxnVXxA3l0+M3QJPQ2/ZPUxVPru2t0wnLgO
	60XOsXKGALtosqg83C61A==
X-ME-Sender: <xms:JNeAaIjXa28ja2cmHLBAq-hxvRUApO_SVN5zBh3ZRVd_AVRmuBsTeQ>
    <xme:JNeAaET9bCoKbsLzPpdaMfL2zQRywEkTOst5oiO2fJb0KOnMdIIB_s1HWcn64Q3l7
    OcT1oHNgvfBkw>
X-ME-Received: <xmr:JNeAaJhxbVfz65iQIXllEydiJ5P_IPxMQ0TOCvOHf6bo4a27Ll5GcFK3fWMGYin2gRijGMfnFz22uVYuQbW-Iqkv5GipP_1apNc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejjeejlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfggtggusehgtderredttdejnecuhfhrohhmpeforghrvghkucforghr
    tgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvhfduiefhueeh
    ieehieelgffggeegfeetudelteelffduueehjeeuhfeftedtheenucffohhmrghinhepkh
    gvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhdpihhnthgvlhdrtghomhenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkh
    esihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeef
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsth
    hsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhp
    vghrfeestghithhrihigrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:JNeAaE5pKYBfw1GqbrfhNZt2xUAfzx2JOtog-DUtISuRXXZMedpvEA>
    <xmx:JNeAaGBrt4iz6ZglmQoMZDHAtd6UBLP0U4Ej1KtYzay9Ko4E4NLoTw>
    <xmx:JNeAaLYB5Koa5mpQ6hgKF11TBAZts4CW7NDnbcUeSw4yV7tH9MoU0A>
    <xmx:JNeAaBb_lGfKXj9x-Zs_2oA3w9ExWpIsFhnEmbcFeimDEBl-xKtBLA>
    <xmx:JdeAaOIRLknVV4A-bryDG4irm2lnD3tdrCWFheqQ6AvbIzCbxVbqh6mp>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 23 Jul 2025 14:35:46 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: PCI passthrough of XHCI on Framework AMD crashes the host
Message-ID: <aIDXIqA4L7wcJH2T@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KcDnGiRsNgHLYSUW"
Content-Disposition: inline


--KcDnGiRsNgHLYSUW
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Jul 2025 14:35:46 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: PCI passthrough of XHCI on Framework AMD crashes the host

Hi,

There is yet another issue affecting Framework AMD... When I start a
domU with XHCI controller attached (PCI passthrough), the whole host
resets if there was an USB device plugged into it. I don't get any panic
message (neither on XHCI console - which is connected to a different
XHCI controller, nor on VGA), and the reboot reason register shows
0x08000800 ("an uncorrected error caused a data fabric sync flood
event") according to [1].

This is Framework AMD with AMD Ryzen 5 7640U.

The crash itself happens quite early on domU startup - specifically when
SeaBIOS tries to initialize XHCI. I tracked it down to the second
readl() in xhci_controller_setup() [2]. Interestingly, it's specifically
the second readl(), regardless of which of those comes first. I tried
swapping their order, or even repeating read from the same register -
always the second call triggers the crash. The first one succeeds and
returns some value (for example 0x1200020 for HCCPARAMS).

If I start the domU when no USB devices are connected, it doesn't crash.

If I manually unbind the device from the dom0 driver (echo 0000:c3:00.4 >
/sys/bus/pci/drivers/xhci_hcd/unbind), it doesn't crash. Note I have
seize=3D1 in domU config, so the `xl pci-assignable-add` calls is implicit.

If the system doesn't crash (either by not having any USB devices
connected initially, or by the manual unbind), the USB controller in
domU works fine. I can later connect devices and they appear inside
domU.

This system has a couple of XHCI controllers, and the same behavior is
observed on at least two of them.

The controller works just fine when used in dom0.

If I passthrough another PCI device instead (tried wifi card and audio
card), it doesn't crash.

The value read from from HCCPARAMS (BAR + 0x10) differs between good and ba=
d case:
- 0x01200020 when it crashes
- 0x0110ffc5 when it works

It's weird to have this much differences here, given most bits in this
register is about device capabilities[3], not its runtime state...

In this system my main debugging tool is the XHCI console. But I tried
also without enabling XHCI console, and it still crashes, so it looks
like it isn't caused by the XHCI console.

I tried also disabling XHCI initialization in SeaBIOS, and then it
proceeds to booting domU's kernel. But as soon as Linux gets into
initializing that USB controller, it crashes the same way. So, it isn't
just SeaBIOS doing something weird (or at least not just that).

With PVH dom0, the behavior is a bit different:
1. Initially, the controller works fine in dom0.
2. When starting domU, instead of clean unbind this happens:

    [   11.248760] xhci_hcd 0000:c3:00.4: Controller not ready at resume -19
    [   11.248765] xhci_hcd 0000:c3:00.4: PCI post-resume error -19!
    [   11.248767] xhci_hcd 0000:c3:00.4: HC died; cleaning up
    [   11.249010] xhci_hcd 0000:c3:00.4: remove, state 4
    [   11.249013] usb usb8: USB disconnect, device number 1
    [   11.249437] xhci_hcd 0000:c3:00.4: USB bus 8 deregistered
    [   11.249832] xhci_hcd 0000:c3:00.4: remove, state 4
    [   11.249835] usb usb7: USB disconnect, device number 1
    [   11.250074] xhci_hcd 0000:c3:00.4: Host halt failed, -19
    [   11.250076] xhci_hcd 0000:c3:00.4: Host not accessible, reset failed.
    [   11.250389] xhci_hcd 0000:c3:00.4: USB bus 7 deregistered
    [   11.251011] pciback 0000:c3:00.4: xen_pciback: seizing device
    [   11.335120] pciback 0000:c3:00.4: xen_pciback: vpci: assign to virtu=
al slot 0
    [   11.335544] pciback 0000:c3:00.4: registering for 1

3. Reading from BAR in domU (in SeaBIOS, and later Linux) returns
0xffffffff.
4. Does not crash the host.

Any ideas?

I don't have any other system with Zen4 to try on. The hw11 gitlab
runner is Ryzen 7 7735HS, and it doesn't have this issue. It's also
possible this is something related to Framework's firmware, but give all
the observations above, I find it less likely.

[1] https://docs.kernel.org/arch/x86/amd-debugging.html#random-reboot-issues
[2] https://github.com/coreboot/seabios/blob/master/src/hw/usb-xhci.c#L553
[3] https://www.intel.com/content/dam/www/public/us/en/documents/technical-=
specifications/extensible-host-controler-interface-usb-xhci.pdf (page 385)
--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--KcDnGiRsNgHLYSUW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmiA1yIACgkQ24/THMrX
1yxI6Qf/XGXDLbGRssdpZW1Nw23b6CLpW9aVxh/rhZ0xpZgigs1yWcEL7FldV0fM
kVt1LwrfRUHn3iEku8SISmCYIMXTo409wJfazj4PtZh628P8HQeN7ceOIEXQCq6+
QqWWs/P9lRzTqhkuBIvmA2qPhMb8SCQjM3uCnnsgX5tV2cl+UIEB3Jp1FOMKW0Vt
kYCcDC9nAfO04IQzQzUGdadbjiJG8w/CglLU/wqqtZDfE7mbrV8wskym/MPI0OTn
Sd38c5rZNVx230RbldKOkXbJgnZCVLsp7kRM8hdvwb8G1EkE2pXzF1BMXjb/AWl6
zcUHQSpTIY1EoopZegSKriA+IQVK1w==
=3f8l
-----END PGP SIGNATURE-----

--KcDnGiRsNgHLYSUW--

