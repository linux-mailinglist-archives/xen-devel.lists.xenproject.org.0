Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A126BAE0F70
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 00:07:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020417.1396664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSNOm-0008TM-JZ; Thu, 19 Jun 2025 22:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020417.1396664; Thu, 19 Jun 2025 22:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSNOm-0008RG-FH; Thu, 19 Jun 2025 22:06:20 +0000
Received: by outflank-mailman (input) for mailman id 1020417;
 Thu, 19 Jun 2025 22:06:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NVDA=ZC=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uSNOk-0008R7-Ea
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 22:06:18 +0000
Received: from fout-b3-smtp.messagingengine.com
 (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9dfd9caa-4d59-11f0-a30d-13f23c93f187;
 Fri, 20 Jun 2025 00:06:15 +0200 (CEST)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfout.stl.internal (Postfix) with ESMTP id 0CFCE114015A;
 Thu, 19 Jun 2025 18:06:14 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Thu, 19 Jun 2025 18:06:14 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jun 2025 18:06:10 -0400 (EDT)
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
X-Inumbo-ID: 9dfd9caa-4d59-11f0-a30d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750370773;
	 x=1750457173; bh=Lv2aLhehMFrCKH2lEb418lD3GyPQa1J2fbKakXPnBlo=; b=
	LVWSeOfL56fD0cl/tH73lFRaAUdOxLRxMuZe2p1sofK67MMd8jQykEHBkGVSbj2f
	EMHamrM7CuyIK1gJDw9ot/b3lgPNSxQlaMbvK4mHLKP1SotK/paooYr5pcVUuVjp
	xifJQ8gTlM0H7qUK0BzSJhw8Ae2u+TJMddh0O/Ld4sB/zK0yIInWe59nOpub4Bh8
	KZwjN24bYqVs8rRQLH04q7WlydfOWpimbLO8MmnMDDFB6Kf0GFtPRjZ0kwqYrOOW
	04H843nAzgc8R1CPYZ+Dlag1jp0ZTUu/Yrc2XDn/OVU6UsdA5+UlfY6XBGX2cv8H
	GVJP7IZiEUZER7pSwZB1XA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750370773; x=1750457173; bh=Lv2aLhehMFrCKH2lEb418lD3GyPQa1J2fbK
	akXPnBlo=; b=RbL1Vj7QkD2eLXCRCm4i07ZVbqwAbYigYSWb1alPwu6frRv/lRK
	AsxslWzlW550aCeBlIBTCtlruPXu7qHWBf8UqrB29C0hqViLQp3Wagzei+5auFgT
	iZnXoFgzoDg7T92aUD7QAPHwYCzN7gHJttUNTUjbUcPeOeYeOeVOZKPKQ6upirt/
	fAHqxzwoGIVkYP91P339M2DE/vFgL+LHrcnxm47jXYnCTm+AlIcOgtUukIjDIIt5
	Typd0StKcaaDNoQF60va9LjSbADlFI8TYJuUqOBtsbYJKUXSDcMZtJRTlOlnOSXC
	Y81Uo1Fflvtf6IMMyKWVYC0I/vOGUQPJBqA==
X-ME-Sender: <xms:1IlUaMvq0rajQsCoGVUCWsYqcC7S0iAK1wdR0tIEeOUeU-RcMCyGBQ>
    <xme:1IlUaJd22hsyC5TIqs_xRm1coQXY-DlLqD_3lwawbDQ4e81kmKLU9IAVYrRuOXg9F
    8QTMPZfeSBL7g>
X-ME-Received: <xmr:1IlUaHyAJF-ehkydsiHumU8ScgPjDqd-rP-3PAUXDnp3hdlOTgpxcH3zqj-NeoNOrBm4PRQ_ZpKK0hzpHuJM5u1AXGQEPXjifz4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeiieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleetfeev
    hfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepudehpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehrohhsshdrlhgrghgvrhifrghllhestghlohhuugdrtg
    homhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhm
    pdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrd
    horhhgpdhrtghpthhtoheprghnthhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggt
    hhdprhgtphhtthhopehmihgthhgrlhdrohhriigvlhesrghmugdrtghomhdprhgtphhtth
    hopehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtohepjhhulhhivghnseig
    vghnrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:1IlUaPOILY1XiO1I9hDFRrTLsBWu2ZeFAdbnuIvmuoxSKNp7JnZbVw>
    <xmx:1IlUaM9ltTtXqoibjiTilbaC7Tuy2ljdKWYrRkzdij08iShB-Ry3wQ>
    <xmx:1IlUaHXvbkPNi4mDjgvnnXesyad-ktEA4mJwaeVlBILJBv7xITl3mA>
    <xmx:1IlUaFek2AncrWIBJpyMdCqbOTiKrcGKidO_Cz38VAQX2UAAG3MwXA>
    <xmx:1YlUaPrrYQAkRzw0Hif8hLa76izOQbbqc4SVMIzj5zlGxHDdtxYsA6UL>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 20 Jun 2025 00:06:08 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Ross Lagerwall <ross.lagerwall@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	security@xen.org, Juergen Gross <jgross@suse.com>,
	Trammell Hudson <hudson@trmm.net>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	Kevin Lampis <kevin.lampis@cloud.com>
Subject: Re: [PATCH] docs: UEFI Secure Boot security policy
Message-ID: <aFSJ0MS6k9QxyUVT@mail-itl>
References: <20250611235851.167385-1-andrew.cooper3@citrix.com>
 <CAG7k0Eo3yzpUJjO-371j_h6NGrHFky9a6Sr4NWfMHfarTzpR=A@mail.gmail.com>
 <aFQgd1uSWlAcgFrr@mail-itl>
 <alpine.DEB.2.22.394.2506191254240.1780597@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GZrqIEL+8NgpQS55"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2506191254240.1780597@ubuntu-linux-20-04-desktop>


--GZrqIEL+8NgpQS55
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Jun 2025 00:06:08 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Ross Lagerwall <ross.lagerwall@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	security@xen.org, Juergen Gross <jgross@suse.com>,
	Trammell Hudson <hudson@trmm.net>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	Kevin Lampis <kevin.lampis@cloud.com>
Subject: Re: [PATCH] docs: UEFI Secure Boot security policy

On Thu, Jun 19, 2025 at 12:56:12PM -0700, Stefano Stabellini wrote:
> On Thu, 19 Jun 2025, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Jun 19, 2025 at 03:16:51PM +0100, Ross Lagerwall wrote:
> > > I think a section on PCI passthrough is also warranted. i.e. preventi=
ng misuse
> > > of a device to exploit Secure Boot.
> >=20
> > While I agree it makes sense, I wonder if it's in scope for UEFI
> > Secure Boot as defined by Microsoft? It may have implication for example
> > on PCI passthrough to a PV domains.
>=20
> If we bring DomUs into the discussion, then I think we need to make a
> distinction between predefined DomUs, which could have signatures
> verified by Secure Boot (such as Dom0 and hyperlaunch/dom0less guests),
> and other dynamically created DomUs which could be fetched from the
> network and potentially started without signature verification or prior
> knowledge.

I think it's mostly not about what's running inside domU, but what such
domU has access to. The obvious part is enforcing IOMMU configuration so
that domU cannot use a PCI device as a proxy to modify hypervisor (or
dom0) code. But there may be more subtleties like access to specific
devices (HECI? SPI?).
Anyway, lets figure out first _if_ we need to do something about this
topic, and only then worry how.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--GZrqIEL+8NgpQS55
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhUidAACgkQ24/THMrX
1yy22wf/b2wtFSSYA6Wt+PTLYpYQS1Xemzob98nMgG+elbiydA0My9XEDtITxu7B
q4OA27+PaOdINBcBjYkeV1ABYTicScjyFSFFQHsW5si8ftZ33tqqLyeA75wVBcq3
KPPDjuLpNLE57JvauXiXcKUxge/jJOvN7FxLRZRDvt+qQxpoWQqr8mC3A/vWtMGF
BU+UzPmrHRASFFmDS14P/umR4vqIRY5HIzs3fk4cb7Sl/QBSRk9kSsh3zkslGyRp
I0S5JTRnK/2jtXPh+SogS5rPCdHfzam0TxAWT7YzpMA52nmLYNEK9XCyxcd15M5x
z19DLoDzT885vNmnuWMN6LL2lxRwLw==
=gZag
-----END PGP SIGNATURE-----

--GZrqIEL+8NgpQS55--

