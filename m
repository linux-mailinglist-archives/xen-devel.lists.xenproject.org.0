Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A29B0F347
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 15:10:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053959.1422728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueZEi-0005i1-4m; Wed, 23 Jul 2025 13:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053959.1422728; Wed, 23 Jul 2025 13:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueZEi-0005gW-0k; Wed, 23 Jul 2025 13:10:20 +0000
Received: by outflank-mailman (input) for mailman id 1053959;
 Wed, 23 Jul 2025 13:10:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7JV9=2E=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ueZEg-0005gQ-Iq
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 13:10:18 +0000
Received: from fhigh-b1-smtp.messagingengine.com
 (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f9245ba-67c6-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 15:10:16 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfhigh.stl.internal (Postfix) with ESMTP id CF36B7A1D53;
 Wed, 23 Jul 2025 09:10:14 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Wed, 23 Jul 2025 09:10:14 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Jul 2025 09:10:13 -0400 (EDT)
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
X-Inumbo-ID: 5f9245ba-67c6-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753276214;
	 x=1753362614; bh=cTl107/Zf259ktUIMKtiQvHmlm7HtPVOcLPsd8rAXWQ=; b=
	GdxyJUG+fByktDXk2XtgSoRguB+hZl3ijuwpFrDEgm/k1eK8AwNU4t4tHt4fbpr7
	tSdlbKSTPf0Lxx7jzk8LAuoel3dA75zmgW1InxFfp04/DIZJCa3HVh/Vg+sInEO2
	BkPM4stdHJAmpCYv0ACTTeC0L6yLJQKINpV96Tcm2Z+YRYSyPYpzhNWc1Fo8Pq5D
	QN1wK0BHi8Cm0th6PvZYp9smhinf2pcpbfoWPpVggdeAk6VciVprL36Nk8t7CFMc
	SqL3WmJIGf9H0L2qeqa+vOchlKiLnyqs6mx2cfGpz4ouNNBgr/ruvBrSAlTS984t
	yF39Aft0u5+xC0BwNwtEDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1753276214; x=1753362614; bh=cTl107/Zf259ktUIMKtiQvHmlm7HtPVOcLP
	sd8rAXWQ=; b=RX9hqKNmkWWa4M1DzTbbE+CZv6mWYcyC65Ev6r3HXjb8R6JGoyd
	Ph21tcvlfpDcBcCPp8ABHKcsVFjDVJlDl+n82acqJKPSWC7fXO93yt5GI+oNj1Gv
	N1LhPk+cnfaV8tRoXtNQGdUUJfMPYvuO9ZCku+4DeTlwi0G2ttSrAjkYbhJiGGNO
	a/yGT0A1b//5TPo3Pudot+zdyAkMYyV1talIT9SeysyKR27tiwd+0HutVcx7hTa3
	bWwStT5iVp5uaTjf6x6V7XmAUQxKgahOm74BB+1qoXaUmqjZ1zW3sqDzuD2tnhEK
	D9emnoTgTM8qEaQrzLa6Qyzw54URCSUnScw==
X-ME-Sender: <xms:Nt-AaEyqAl3KBURB0FnCgqh2dOz_R0fYHKHDpMYQaUqWaaMjwV1Q8g>
    <xme:Nt-AaC3YHFOpd7vzAwwcM1lmD5Q27L-YR5iSnHL0yhgETDwLkOK7CQ6jXJBCAn4hy
    aSNv6Sr3ejQvA>
X-ME-Received: <xmr:Nt-AaC6HHHZmYiMgVxKkU-kfv-lxrqcTLxXbWZa20Q68dryAUAXzVMnuTs-5AoWIrwuF6qANyhFFsJH_5n-5aoNjpsxw3nlacAo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejjeekjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeeikedv
    udejhfehkedtffeiueehkefgleekuedtjedvkeejhfetgfetgfeihfenucffohhmrghinh
    epkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhdpihhnthgvlhdrtghomhenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrh
    gvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthho
    peegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehnghhotgdqthhurdguihhnhh
    esvhgrthgvshdrthgvtghhpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdr
    gigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrh
    efsegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghr
    nhgvlhdrohhrgh
X-ME-Proxy: <xmx:Nt-AaFUYQhulTSncoEuNSpv9US6u_uTH5Ur9EoCj3ScdXvwSXZ3eRQ>
    <xmx:Nt-AaBAI829YeRdgFnlcEJhOQtfQuQm0QPsGxPdLxFsso4g6D9snlQ>
    <xmx:Nt-AaE7iY9rEyqy7FaI-6L4EL40M_ITdeJs8liAoQ6ALzXQMD149dw>
    <xmx:Nt-AaMxV7hitwLqzvXhmA0tVKBshFAffBP8GsigyQHmKdBMrTF8yUQ>
    <xmx:Nt-AaLJIQ4Y7hZ2pSuFfShqMNfKuhvAt7COr3HtoIDXs2kAXPjOZleSJ>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 23 Jul 2025 15:10:11 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: PCI passthrough of XHCI on Framework AMD crashes the host
Message-ID: <aIDfM0kTNOWjJiJ3@mail-itl>
References: <aIDXIqA4L7wcJH2T@mail-itl>
 <f2d125f2-febe-4e92-a7cf-5373b069cd1c@vates.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jB5++0Rpfh49MaBz"
Content-Disposition: inline
In-Reply-To: <f2d125f2-febe-4e92-a7cf-5373b069cd1c@vates.tech>


--jB5++0Rpfh49MaBz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Jul 2025 15:10:11 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: PCI passthrough of XHCI on Framework AMD crashes the host

On Wed, Jul 23, 2025 at 12:55:53PM +0000, Tu Dinh wrote:
> On 23/07/2025 14:35, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >
> > There is yet another issue affecting Framework AMD... When I start a
> > domU with XHCI controller attached (PCI passthrough), the whole host
> > resets if there was an USB device plugged into it. I don't get any panic
> > message (neither on XHCI console - which is connected to a different
> > XHCI controller, nor on VGA), and the reboot reason register shows
> > 0x08000800 ("an uncorrected error caused a data fabric sync flood
> > event") according to [1].
> >
> > This is Framework AMD with AMD Ryzen 5 7640U.
> >
> > The crash itself happens quite early on domU startup - specifically when
> > SeaBIOS tries to initialize XHCI. I tracked it down to the second
> > readl() in xhci_controller_setup() [2]. Interestingly, it's specifically
> > the second readl(), regardless of which of those comes first. I tried
> > swapping their order, or even repeating read from the same register -
> > always the second call triggers the crash. The first one succeeds and
> > returns some value (for example 0x1200020 for HCCPARAMS).
> >
> > If I start the domU when no USB devices are connected, it doesn't crash.
> >
> > If I manually unbind the device from the dom0 driver (echo 0000:c3:00.4=
 >
> > /sys/bus/pci/drivers/xhci_hcd/unbind), it doesn't crash. Note I have
> > seize=3D1 in domU config, so the `xl pci-assignable-add` calls is impli=
cit.
> >
> > If the system doesn't crash (either by not having any USB devices
> > connected initially, or by the manual unbind), the USB controller in
> > domU works fine. I can later connect devices and they appear inside
> > domU.
> >
> > This system has a couple of XHCI controllers, and the same behavior is
> > observed on at least two of them.
> >
> > The controller works just fine when used in dom0.
> >
> > If I passthrough another PCI device instead (tried wifi card and audio
> > card), it doesn't crash.
> >
> > The value read from from HCCPARAMS (BAR + 0x10) differs between good an=
d bad case:
> > - 0x01200020 when it crashes
> > - 0x0110ffc5 when it works
> >
> > It's weird to have this much differences here, given most bits in this
> > register is about device capabilities[3], not its runtime state...
> >
> > In this system my main debugging tool is the XHCI console. But I tried
> > also without enabling XHCI console, and it still crashes, so it looks
> > like it isn't caused by the XHCI console.
> >
> > I tried also disabling XHCI initialization in SeaBIOS, and then it
> > proceeds to booting domU's kernel. But as soon as Linux gets into
> > initializing that USB controller, it crashes the same way. So, it isn't
> > just SeaBIOS doing something weird (or at least not just that).
> >
> > With PVH dom0, the behavior is a bit different:
> > 1. Initially, the controller works fine in dom0.
> > 2. When starting domU, instead of clean unbind this happens:
> >
> >      [   11.248760] xhci_hcd 0000:c3:00.4: Controller not ready at resu=
me -19
> >      [   11.248765] xhci_hcd 0000:c3:00.4: PCI post-resume error -19!
> >      [   11.248767] xhci_hcd 0000:c3:00.4: HC died; cleaning up
> >      [   11.249010] xhci_hcd 0000:c3:00.4: remove, state 4
> >      [   11.249013] usb usb8: USB disconnect, device number 1
> >      [   11.249437] xhci_hcd 0000:c3:00.4: USB bus 8 deregistered
> >      [   11.249832] xhci_hcd 0000:c3:00.4: remove, state 4
> >      [   11.249835] usb usb7: USB disconnect, device number 1
> >      [   11.250074] xhci_hcd 0000:c3:00.4: Host halt failed, -19
> >      [   11.250076] xhci_hcd 0000:c3:00.4: Host not accessible, reset f=
ailed.
> >      [   11.250389] xhci_hcd 0000:c3:00.4: USB bus 7 deregistered
> >      [   11.251011] pciback 0000:c3:00.4: xen_pciback: seizing device
> >      [   11.335120] pciback 0000:c3:00.4: xen_pciback: vpci: assign to =
virtual slot 0
> >      [   11.335544] pciback 0000:c3:00.4: registering for 1
> >
> > 3. Reading from BAR in domU (in SeaBIOS, and later Linux) returns
> > 0xffffffff.
> > 4. Does not crash the host.
> >
> > Any ideas?
> >
> > I don't have any other system with Zen4 to try on. The hw11 gitlab
> > runner is Ryzen 7 7735HS, and it doesn't have this issue. It's also
> > possible this is something related to Framework's firmware, but give all
> > the observations above, I find it less likely.
> >
> > [1] https://docs.kernel.org/arch/x86/amd-debugging.html#random-reboot-i=
ssues
> > [2] https://github.com/coreboot/seabios/blob/master/src/hw/usb-xhci.c#L=
553
> > [3] https://www.intel.com/content/dam/www/public/us/en/documents/techni=
cal-specifications/extensible-host-controler-interface-usb-xhci.pdf (page 3=
85)
>=20
> I had a similar problem with a Beelink mini PC with the Ryzen 5800U
> after a recent Qubes upgrade.
>=20
> If the USB controller is passed through to sys-usb then the system
> simply resets without warning.

Do you know if that happens also when no USB devices are connected at
that time? There could be more reasons for similar issue, and a common
one I've seen is dom0 kernel panic on unbind operation (which would be a
different issue than the one I have here).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--jB5++0Rpfh49MaBz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmiA3zMACgkQ24/THMrX
1yw05Af/TSMgoN4QWOxzUnyGO1hygl47qcIP3mDgPPlZDKf3u36EKKS+HBcwAlaE
qnwJXrc0d7vzPKzW2lI3bmoj9VB+WMk6b/HGxzX1cCcjvZLrhMee5Tp2eyWpGSjj
1XudO4HcoSMb+9/ZhFPVpNBU3AjroIWrYWQArncogroxMTaNKKCBXs/j9VUwbrL2
vD0F/7tzAs4EQUIOf+iLQAHQYVJDv5NES/jNTi6+jnWMk3YKpGMrLvcTqUPjn38O
SNUMNH/CQPogEdUO4OhaAD9lFjhhVpH0DRaIA1h6x8s2ib99B5PHbgDtdYHOHMEl
8kDryhdyiC7heBgAzXpXMWvZLY80lA==
=YyfL
-----END PGP SIGNATURE-----

--jB5++0Rpfh49MaBz--

