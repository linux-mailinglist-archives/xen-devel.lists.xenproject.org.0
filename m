Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFBEB36C16
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 16:52:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094708.1449958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqv2C-00055S-Sd; Tue, 26 Aug 2025 14:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094708.1449958; Tue, 26 Aug 2025 14:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqv2C-00053q-Oy; Tue, 26 Aug 2025 14:52:28 +0000
Received: by outflank-mailman (input) for mailman id 1094708;
 Tue, 26 Aug 2025 14:52:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EpqW=3G=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uqv2B-00053k-NQ
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 14:52:27 +0000
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44ace71a-828c-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 16:52:21 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 48BA714000DD;
 Tue, 26 Aug 2025 10:52:20 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Tue, 26 Aug 2025 10:52:20 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Aug 2025 10:52:19 -0400 (EDT)
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
X-Inumbo-ID: 44ace71a-828c-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756219940;
	 x=1756306340; bh=6iVhYCdCJDy0Sy31oGApj5ZRup5RSTuKacQ9PaqLK9g=; b=
	P2q08P95re1QR9srMvzet7htBW3F+onSLX/+gO0KZViLQOvR3z7A0XUZIpyiEnN5
	QKFX7yMAjnkFnGLWM2mUTuTiMXTKgbDTzkpzg+fSktaksZhwn4KyXdLMWE0jte0Z
	s1mRmQ6BzuU7AjOksodOakTexMMPJR20PbPTn15x6Vb8iXnT2wsQOFhC2rbISCYM
	mMJj9HLf9H0rZXByoWZSAuZEFCJUb8AHb0WtIgq6AGNN/DgeuytAOn3JM+bvhNm+
	ZLxf9l/jAFxT5QuNs/1YQHiE8FY+FH5H/xlarGmUBjdr9MNw209FQwiIXy0wadEs
	Kg3+/xaEiaKZHUyWjCym1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1756219940; x=1756306340; bh=6iVhYCdCJDy0Sy31oGApj5ZRup5RSTuKacQ
	9PaqLK9g=; b=fYlj0l99M43/x/RvCN9OwhrDHik5P2h8EeIlrjcBi2hbN0CJ5BL
	/P/7KkI5rKmEZa1dbP+HVLI/VTnR+LarX/cbNfbmPL+nDDwNB8Kmj6DuU2haO6mA
	DkL5knu6qQj4QMW1sO8XuM7h9RdO3ZjFNQbJusXpeQME7J0f+V6nCTkk+DqFxHDt
	lOZ5ag8zle/5eJzS9LhNwLFq38+4NuwM6PfEk+4C4cEzeD9UJA7rOI9KLE2EGJUs
	mZHyk/dQTl9rVi3mxviAz3wnhQ56UFsRdUXGajCOImN+4vy3Gto09VzkoXbOMCJm
	ISstVER8aVY3+HkfeNbn+KdhpZXqNBHykjg==
X-ME-Sender: <xms:I8qtaFKM1ROzw0SUXoCV5JpenxhoblGfVgsaezoA6GbzAv_ZttBhTQ>
    <xme:I8qtaEZzFPpHlyljshol0YTVn4JNC-5VLbSpA5wCkAHCdRVpxjYdjPwCk3EcGQNPW
    idxSspr4aw-vw>
X-ME-Received: <xmr:I8qtaHJ8mLtgc9nKEZE71D5xrfZGYr97dGsJs4TMZhjPF75T7tsPDWTvFyWOnFyHgUfKfXnzgo_1YhCR5j9GWMD6zG1_xonIfj0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddujeehheehucetufdoteggodetrf
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
X-ME-Proxy: <xmx:I8qtaCDkNN-PMW5G6CRDphGWdpZWlZVausAiKrEuYK-76YMnyG6-Kg>
    <xmx:I8qtaMpii6YXBVYABK5MlVI0P-lJXiFPUlRobl1J700BBZSvT2Hhrg>
    <xmx:I8qtaNiVJdD9g0Zpe_lZHTsdHcFUYfHIKgcnD4fDJtxaiPkFVpmB6A>
    <xmx:I8qtaJCd7zr-6Nkigk57NDRq1gkttUUmYu7cNqlallegABbaVCPpXg>
    <xmx:JMqtaBjC9agpwhq4I2y_mZdUB1X3HKDylakeNS1DJErSeokHza0pJ56x>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 26 Aug 2025 16:52:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: MSI-X cleanup(?) issue with passthrough after domU restart
Message-ID: <aK3KIWOl1EbpaWBM@mail-itl>
References: <aK0St0oUkJzR9lO0@mail-itl>
 <2aafbace-3aa2-4f58-8f6c-2815cd2315ad@suse.com>
 <aK1wSKTg5LcuzBDc@macbook.local>
 <aK2TLuB_yKlWjFgM@mail-itl>
 <aK28ubf5F3x-of3X@mail-itl>
 <aK3JFqFHMZgWHzy7@Mac.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Yv+msR+m0+QsuJXG"
Content-Disposition: inline
In-Reply-To: <aK3JFqFHMZgWHzy7@Mac.lan>


--Yv+msR+m0+QsuJXG
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 Aug 2025 16:52:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: MSI-X cleanup(?) issue with passthrough after domU restart

On Tue, Aug 26, 2025 at 04:47:50PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Tue, Aug 26, 2025 at 03:55:05PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Tue, Aug 26, 2025 at 12:57:50PM +0200, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > On Tue, Aug 26, 2025 at 10:28:56AM +0200, Roger Pau Monn=C3=A9 wrote:
> > > > On Tue, Aug 26, 2025 at 08:16:56AM +0200, Jan Beulich wrote:
> > > > > On 26.08.2025 03:49, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > Hi,
> > > > > >=20
> > > > > > I'm hitting an MSI-X issue after rebooting the domU. The sympto=
ms are
> > > > > > rather boring: on initial domU start the device (realtek eth ca=
rd) works
> > > > > > fine, but after domU restart, the link doesn't come up (there i=
s no
> > > > > > "Link is Up" message anymore). No errors from domU driver or Xe=
n. I
> > > > > > tracked it down to MSI-X - if I force INTx (via pci=3Dnomsi on =
domU
> > > > > > cmdline) it works fine. Convincing the driver to poll instead o=
f waiting
> > > > > > for an interrupt also workarounds the issue.
> > > > > >=20
> > > > > > I noticed also some interrupts are not cleaned up on restart. T=
he list
> > > > > > of MSIs in 'Q' debug key output grows:
> > > > > >=20
> > > > > >     (XEN) 0000:03:00.0 - d22 - node -1  - MSIs < 41 42 43 44 45=
 46 47 >
> > > > > >     restart sys-net domU
> > > > > >     (XEN) 0000:03:00.0 - d24 - node -1  - MSIs < 41 42 43 44 45=
 46 47 48 >
> > > > > >     restart sys-net domU
> > > > > >     (XEN) 0000:03:00.0 - d26 - node -1  - MSIs < 41 42 43 44 45=
 46 47 48 49 >
> > > > > >=20
> > > > > > and 'M' output is:
> > > > > >=20
> > > > > >     (XEN)  MSI-X   41 vec=3Db1 lowest  edge   assert  log lowes=
t dest=3D00000001 mask=3D1/H /1
> > > > > >     (XEN)  MSI-X   42 vec=3Db9 lowest  edge   assert  log lowes=
t dest=3D00000004 mask=3D1/HG/1
> > > > > >     (XEN)  MSI-X   43 vec=3Dc1 lowest  edge   assert  log lowes=
t dest=3D00000010 mask=3D1/HG/1
> > > > > >     (XEN)  MSI-X   44 vec=3Dd9 lowest  edge   assert  log lowes=
t dest=3D00000001 mask=3D1/HG/1
> > > > > >     (XEN)  MSI-X   45 vec=3De1 lowest  edge   assert  log lowes=
t dest=3D00000001 mask=3D1/HG/1
> > > > > >     (XEN)  MSI-X   46 vec=3De9 lowest  edge   assert  log lowes=
t dest=3D00000040 mask=3D1/HG/1
> > > > > >     (XEN)  MSI-X   47 vec=3D32 lowest  edge   assert  log lowes=
t dest=3D00000004 mask=3D1/HG/1
> > > > > >     (XEN)  MSI-X   48 vec=3D3a lowest  edge   assert  log lowes=
t dest=3D00000040 mask=3D1/HG/1
> > > > > >     (XEN)  MSI-X   49 vec=3D42 lowest  edge   assert  log lowes=
t dest=3D00000010 mask=3D1/ G/1
> > > > > >=20
> > > > > > And also, after starting and stopping the domU, `xl pci-assigna=
ble-remove 03:00.0`
> > > > > > makes pciback to complain:
> > > > > >=20
> > > > > >     [ 1180.919874] pciback 0000:03:00.0: xen_pciback: MSI-X rel=
ease failed (-16)
> > > > > >=20
> > > > > > This is all running on Xen 4.19.3, but I don't see much changes=
 in this
> > > > > > area since then.
> > > > > >=20
> > > > > > Some more info collected at https://github.com/QubesOS/qubes-is=
sues/issues/9335
> > > > > >=20
> > > > > > My question is: what should be responsible for this cleanup on =
domain
> > > > > > destroy? Xen, or maybe device model (which is QEMU in stubdomai=
n here)?
> > > > >=20
> > > > > The expectation is that qemu invokes the necessary cleanup, but o=
f course ...
> > > > >=20
> > > > > > I see some cleanup (apparently not enough) happening via QEMU w=
hen the
> > > > > > domU driver is unloaded, but logically correct cleanup shouldn'=
t depend
> > > > > > on correct domU operation...
> > > > >=20
> > > > > ... Xen may not make itself dependent upon either DomU or QEMU.
> > > >=20
> > > > AFAICT free_domain_pirqs() called by arch_domain_destroy() should t=
ake
> > > > care of unbinding and freeing pirqs (but obviously not in this case=
).
> > > > Can you repeat the test with a debug=3Dy hypervisor and post the
> > > > resulting serial or dmesg here?  Some of the errors on those paths =
are
> > > > printed with dprintk() and won't be visible unless using a Xen debug
> > > > build.
> > >=20
> > > Sure, will do.
> >=20
> > Output collected during domU shutdown and subsequent startup (dom0 logs
> > to Xen console here too):
> > https://gist.github.com/marmarek/6dc3ac14d3ba840482e6361fcbd37c30
> >=20
> > I don't see any errors there...
>=20
> Hm, yes, I don't see any errors either.  Do you think you could
> instrument unmap_domain_pirq() and figure out whether it gets called,
> and if such call to unmap the PIRQ succeeds?

Sure, now that I know where to look at, I'll try to find out what goes
wrong.

> There's one silent error path in the return value of
> xsm_unmap_domain_irq(), but that shouldn't be taken since the call to
> unmap_domain_pirq() executed when destroying the domain is done with
> d->is_dying =3D=3D true.
>=20
> > As for the domU-triggered cleanup, I just checked - if I unload the
> > driver in domU before restarting, it works fine on subsequent startup.
>=20
> Yeah, the unbind an unmap is then done by QEMU, and that seems to
> work fine.  What doesn't seem to work fine is the cleanup done as part
> of domain destroy.
>=20
> Don't we have any Gitlab tests that do PCI passthrough?  Maybe those
> don't do any domU resets?

Yeah, it's a single boot and that's it. I can improve that (and double
check if MSI-X is covered too).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Yv+msR+m0+QsuJXG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmityiEACgkQ24/THMrX
1ywikAf/SXtC9fGIRspCbivqTvirhm7jm0elowP6VKkLCZj91AhGi8ax3UCCniir
aGN9A94SeNXrnDPNHM+IEzd2fQwcUB7ot1Y4a8CwT++f6/Sk2XRlrjAaisrrzqxs
jNkcx8JackJd1g0wa61kIt2Uqz3uALwk1GQYhETFIvCpBAi/DYz/rnraeIWMwT95
3xTFZjXcKaBCzXuEw3dS3JMIi5JOVu+kjqabEnhJbg6gpQCV2EBmiTM4kzOQW4hh
V925fJ8k/7CNCXk6w9uPRt9BLab3lWLNMEjLaaTu5r0ZUQ7BsDeIT7PtALovN+xI
A2kwkl/7Umy1bkr/4F8RhmjtUhTAxA==
=mJWW
-----END PGP SIGNATURE-----

--Yv+msR+m0+QsuJXG--

