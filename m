Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA34B371FE
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 20:15:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094932.1450117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqyC7-00050s-Ei; Tue, 26 Aug 2025 18:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094932.1450117; Tue, 26 Aug 2025 18:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqyC7-0004y9-Bf; Tue, 26 Aug 2025 18:14:55 +0000
Received: by outflank-mailman (input) for mailman id 1094932;
 Tue, 26 Aug 2025 18:14:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EpqW=3G=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uqyC5-0004y3-Uy
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 18:14:54 +0000
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e7736bd-82a8-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 20:14:52 +0200 (CEST)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailfout.stl.internal (Postfix) with ESMTP id B4E331D00182;
 Tue, 26 Aug 2025 14:14:49 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-09.internal (MEProxy); Tue, 26 Aug 2025 14:14:49 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Aug 2025 14:14:48 -0400 (EDT)
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
X-Inumbo-ID: 8e7736bd-82a8-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756232089;
	 x=1756318489; bh=Iu198IFIGxtw87wjEV4oZe9sR+8A4Eia3jCOA9QVlTQ=; b=
	CUrzM8IelUJKdU3ITUgP9yLMMxMTUgkLzil96428VSmdRkT2tjhBKZU8U0eD3deY
	Ni0PTIVsoxMroIWyh9E32EJnWKmTQadS1ZoM7DG6bVd/hRtevrnvyI9B/cT8Z0HJ
	rEkmNocgiDS8cnPy0V7fuct8tmhR9OZYNBVTJWAER4et3H0Nn2+nVrMBdIDH2HFk
	0JVBwg4d955VJsopdhQjhx+UgKtRd5LkbPcLHRQLRHa7S3d3tWSJUHG3oyBaK2Yu
	yKhKquit8NydF409V5kwc9U+CVdpfH2NDqWlABErjn/+dNEIu5AUk77T7Fswlk7d
	GvVm1Hd1rdwzvE0LFwReWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1756232089; x=1756318489; bh=Iu198IFIGxtw87wjEV4oZe9sR+8A4Eia3jC
	OA9QVlTQ=; b=JgJmbQO8XJTdjQnh3oPSsTz+t7MCNyS2nHLLJnsoIuCtdfmbmHp
	9+PIoUf4StoLYKTNRTIjC0CvJm0hwWRIoyliivd8qa4FS2jfCQQYteHuhH3nES0+
	1+Xx+VGZ8D/JvbfHkfNxjU/Sm1UWg9kJuT5Ab7WtTgVbgtJ8sT0yk8zXU5F3v7sr
	qOkAGJMtaIYiz51r9hUHx6h2c9fosIJgyfPY4y1msUbyfsfOsfyRJv51MlI2GUd6
	/+sexCcSitYa07EwdQMhSx8UaJ5M/nKXBRPgA+76pWxi4EG4BZUfWo1U+7QW2Eqo
	I8iDDLEQn/rMuex3jkv3JQGDWGyuoDcQWIQ==
X-ME-Sender: <xms:mfmtaI4pBUq6u504DE46TuTiWSlBgZF5l8T-jbFiVUh52MhSoZCqDQ>
    <xme:mfmtaNJN7s58Repz4pEoPHBlGzauaNv0UM8lel4_OI8vZ-7pZtSOOUFyV7Fa8EF4-
    IUhKzEsEWKwEg>
X-ME-Received: <xmr:mfmtaA5SxPc7qHzl5VSMOL6gGCxsjiM_NUU-rYaZyLAfQUszCROkM4ivcx86_WLAsFHlYhqnv8e2G1RfEZWG9AC2_OyZqlZ21fg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddujeehleeiucetufdoteggodetrf
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
X-ME-Proxy: <xmx:mfmtaIz_mBMBLhoq3CXH7W7nkkuHEABHutmqjPHXFfh5gfiIrwXYAg>
    <xmx:mfmtaMYXXtVJYJuQWJ1akr3paGmKQ-3D1Om5TTnhUNNiFI3wwxzSFA>
    <xmx:mfmtaCQNx27O6pzWceKfBF8e5IXW0zR6iUQzMoCmCJw51dQTOajRbw>
    <xmx:mfmtaOyw7bjQYM1VPu2b20QddLXFCmvdEaHBiYFUQI7_0kWfBg5axA>
    <xmx:mfmtaGTQjDQIUMsJbmMCMzgDHalMbFMUZQdKCEV1SsVJHryHoW1fVwo6>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 26 Aug 2025 20:14:47 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: MSI-X cleanup(?) issue with passthrough after domU restart
Message-ID: <aK35l46_vMfaJ61w@mail-itl>
References: <aK0St0oUkJzR9lO0@mail-itl>
 <2aafbace-3aa2-4f58-8f6c-2815cd2315ad@suse.com>
 <aK1wSKTg5LcuzBDc@macbook.local>
 <aK2TLuB_yKlWjFgM@mail-itl>
 <aK28ubf5F3x-of3X@mail-itl>
 <aK3JFqFHMZgWHzy7@Mac.lan>
 <aK3KIWOl1EbpaWBM@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XYjHLFKe6qQk+9uo"
Content-Disposition: inline
In-Reply-To: <aK3KIWOl1EbpaWBM@mail-itl>


--XYjHLFKe6qQk+9uo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 Aug 2025 20:14:47 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: MSI-X cleanup(?) issue with passthrough after domU restart

On Tue, Aug 26, 2025 at 04:52:17PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Tue, Aug 26, 2025 at 04:47:50PM +0200, Roger Pau Monn=C3=A9 wrote:
> > On Tue, Aug 26, 2025 at 03:55:05PM +0200, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > On Tue, Aug 26, 2025 at 12:57:50PM +0200, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > On Tue, Aug 26, 2025 at 10:28:56AM +0200, Roger Pau Monn=C3=A9 wrot=
e:
> > > > > On Tue, Aug 26, 2025 at 08:16:56AM +0200, Jan Beulich wrote:
> > > > > > On 26.08.2025 03:49, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > Hi,
> > > > > > >=20
> > > > > > > I'm hitting an MSI-X issue after rebooting the domU. The symp=
toms are
> > > > > > > rather boring: on initial domU start the device (realtek eth =
card) works
> > > > > > > fine, but after domU restart, the link doesn't come up (there=
 is no
> > > > > > > "Link is Up" message anymore). No errors from domU driver or =
Xen. I
> > > > > > > tracked it down to MSI-X - if I force INTx (via pci=3Dnomsi o=
n domU
> > > > > > > cmdline) it works fine. Convincing the driver to poll instead=
 of waiting
> > > > > > > for an interrupt also workarounds the issue.
> > > > > > >=20
> > > > > > > I noticed also some interrupts are not cleaned up on restart.=
 The list
> > > > > > > of MSIs in 'Q' debug key output grows:
> > > > > > >=20
> > > > > > >     (XEN) 0000:03:00.0 - d22 - node -1  - MSIs < 41 42 43 44 =
45 46 47 >
> > > > > > >     restart sys-net domU
> > > > > > >     (XEN) 0000:03:00.0 - d24 - node -1  - MSIs < 41 42 43 44 =
45 46 47 48 >
> > > > > > >     restart sys-net domU
> > > > > > >     (XEN) 0000:03:00.0 - d26 - node -1  - MSIs < 41 42 43 44 =
45 46 47 48 49 >
> > > > > > >=20
> > > > > > > and 'M' output is:
> > > > > > >=20
> > > > > > >     (XEN)  MSI-X   41 vec=3Db1 lowest  edge   assert  log low=
est dest=3D00000001 mask=3D1/H /1
> > > > > > >     (XEN)  MSI-X   42 vec=3Db9 lowest  edge   assert  log low=
est dest=3D00000004 mask=3D1/HG/1
> > > > > > >     (XEN)  MSI-X   43 vec=3Dc1 lowest  edge   assert  log low=
est dest=3D00000010 mask=3D1/HG/1
> > > > > > >     (XEN)  MSI-X   44 vec=3Dd9 lowest  edge   assert  log low=
est dest=3D00000001 mask=3D1/HG/1
> > > > > > >     (XEN)  MSI-X   45 vec=3De1 lowest  edge   assert  log low=
est dest=3D00000001 mask=3D1/HG/1
> > > > > > >     (XEN)  MSI-X   46 vec=3De9 lowest  edge   assert  log low=
est dest=3D00000040 mask=3D1/HG/1
> > > > > > >     (XEN)  MSI-X   47 vec=3D32 lowest  edge   assert  log low=
est dest=3D00000004 mask=3D1/HG/1
> > > > > > >     (XEN)  MSI-X   48 vec=3D3a lowest  edge   assert  log low=
est dest=3D00000040 mask=3D1/HG/1
> > > > > > >     (XEN)  MSI-X   49 vec=3D42 lowest  edge   assert  log low=
est dest=3D00000010 mask=3D1/ G/1
> > > > > > >=20
> > > > > > > And also, after starting and stopping the domU, `xl pci-assig=
nable-remove 03:00.0`
> > > > > > > makes pciback to complain:
> > > > > > >=20
> > > > > > >     [ 1180.919874] pciback 0000:03:00.0: xen_pciback: MSI-X r=
elease failed (-16)
> > > > > > >=20
> > > > > > > This is all running on Xen 4.19.3, but I don't see much chang=
es in this
> > > > > > > area since then.
> > > > > > >=20
> > > > > > > Some more info collected at https://github.com/QubesOS/qubes-=
issues/issues/9335
> > > > > > >=20
> > > > > > > My question is: what should be responsible for this cleanup o=
n domain
> > > > > > > destroy? Xen, or maybe device model (which is QEMU in stubdom=
ain here)?
> > > > > >=20
> > > > > > The expectation is that qemu invokes the necessary cleanup, but=
 of course ...
> > > > > >=20
> > > > > > > I see some cleanup (apparently not enough) happening via QEMU=
 when the
> > > > > > > domU driver is unloaded, but logically correct cleanup should=
n't depend
> > > > > > > on correct domU operation...
> > > > > >=20
> > > > > > ... Xen may not make itself dependent upon either DomU or QEMU.
> > > > >=20
> > > > > AFAICT free_domain_pirqs() called by arch_domain_destroy() should=
 take
> > > > > care of unbinding and freeing pirqs (but obviously not in this ca=
se).
> > > > > Can you repeat the test with a debug=3Dy hypervisor and post the
> > > > > resulting serial or dmesg here?  Some of the errors on those path=
s are
> > > > > printed with dprintk() and won't be visible unless using a Xen de=
bug
> > > > > build.
> > > >=20
> > > > Sure, will do.
> > >=20
> > > Output collected during domU shutdown and subsequent startup (dom0 lo=
gs
> > > to Xen console here too):
> > > https://gist.github.com/marmarek/6dc3ac14d3ba840482e6361fcbd37c30
> > >=20
> > > I don't see any errors there...
> >=20
> > Hm, yes, I don't see any errors either.  Do you think you could
> > instrument unmap_domain_pirq() and figure out whether it gets called,
> > and if such call to unmap the PIRQ succeeds?
>=20
> Sure, now that I know where to look at, I'll try to find out what goes
> wrong.

Ok, after adding several debug prints there and looking why it's not
called, I found it's a completely different issue. arch_domain_destroy()
is not called, because there was a dom0 userspace process still having a
page mapped of that domain, and indeed there was a zombie on xl list.
Killing that process fixes it.

Sorry for the noise...

> Yeah, it's a single boot and that's it. I can improve that (and double
> check if MSI-X is covered too).

But this might be a good idea anyway.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--XYjHLFKe6qQk+9uo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmit+ZcACgkQ24/THMrX
1yyjaAf/WOQrlUWQ19Sx7MlswV8pzCAw+i7Yhn9RDgaC2JUHCSsGoFVgPyASw2cG
iBatLI9ceLf9Rcdk7QE08HZFfd6rinGI7caGyXDYyF6R3mUjK2YLdoMwiAeqqBgR
DmOP64A9vwYJwP00Q2XVYoiqpRxIy2cfskcnHHAFr1oWHzlqZn1Y1sDET+STx9k/
UeE4Jt7ypJKbAoD2Ar0HsPo6xqQ+CKReud/OiCa21NyhKNBvKzdI122aVpbzF2Va
/bFgObHIlMpYpAPXMGM/N8I1jdeBd93Je6bOPAYvvCNQi25F+uehNolt0+EN31Hs
PrRaVsfv0bbv8fC4Ei7PdB+tQclVqg==
=K+8R
-----END PGP SIGNATURE-----

--XYjHLFKe6qQk+9uo--

