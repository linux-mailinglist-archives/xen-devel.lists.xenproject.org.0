Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B23536FF5D2
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 17:23:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533467.830174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px88V-00052h-Gc; Thu, 11 May 2023 15:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533467.830174; Thu, 11 May 2023 15:23:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px88V-0004zr-DZ; Thu, 11 May 2023 15:23:19 +0000
Received: by outflank-mailman (input) for mailman id 533467;
 Thu, 11 May 2023 15:23:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dl8=BA=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1px88G-0004zW-K4
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 15:23:18 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b27b2d23-f00f-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 17:22:54 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 50AA75C00EE;
 Thu, 11 May 2023 11:22:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 11 May 2023 11:22:52 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 May 2023 11:22:51 -0400 (EDT)
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
X-Inumbo-ID: b27b2d23-f00f-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1683818572; x=1683904972; bh=YliH59hT2gaIIGacYHQkH/P/AUqcG8p3geu
	Ha5iQB+U=; b=cteZTWaOk5K7FZBWhFD4UDwgRl6KAFrIJp8X732p9WnxiAWLEQK
	7EZ9Pg2aEWhW5km9GXDsmsuoTHOPFDHrDq8b70/jPtnblSTZnU+qTTFs3cbUWbb4
	myt9PZCdHlgHz29/maCOEzG6O4y4sX5172lGQ2S/zZMoV+3iGoXubGGsqW7PQtT2
	pV3gZca5+6J4+8egaCjZc8bfZY4/vNm+lACI1t5mPw4k7OlM8AJug7ApEt7Ttbiq
	U+7g1+EnfFXXwWVWb3Jh4VuXVQz1L7BVLGmSSaKhYNRvSA+LhHpTCINaSe2mLcP3
	66L4uy/SlFcj6LUZ1evnEseLCrR8Gd6KUSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1683818572; x=1683904972; bh=YliH59hT2gaII
	GacYHQkH/P/AUqcG8p3geuHa5iQB+U=; b=hIxK3irsrL9OcWotPMv0cHqIurLXM
	CwyPY2C3vwmuZXKPphHGH+qenxn9wWNfpGW0zzqd/OERvbfejtKwyADMYcPAF5h1
	XQ0D05xz+QhvQ71x2WLwjiGZ6nWIKHUPXF0c5AHmWn0J6fwyU/8ixGCD7ZcZJXU3
	xj9Mrj0hiP4iyY8egkXDKJ+U27yYstTdHVMNf3dlJDHAeWwqoQ0lDUgCAL9SCi2V
	rgXUBHtnDj/FGr4r/FvxetevIohfCbYnBasaSlOgP1mxUft4VFlzFHcTTFfFiB7G
	nEgtj9OJ3p0YDj9NzEt6rz3GEr1ZOyR5LEcHAgXAKN1r8tVGcutxO9XeA==
X-ME-Sender: <xms:TAhdZFeYlcxr1g73oNCDdvfFbrHSEfZn1U3Qsi6dJe1PP1eSx91oqQ>
    <xme:TAhdZDMjuqwn2rQ8aQQZDzHh4uweWwjWHn6059pTbVMCGUXAeX2mbozoi206GzUcn
    5Sk7wWauFX7Dw>
X-ME-Received: <xmr:TAhdZOgmRWsKcbmh60C-nPkEtuuFLeZbghlhwBc2PufMdwh8LDpMkYH6TfBNHycbJE2T0AHGF9M1kNH61f9jjAuth5MNlbrEiCE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeegkedgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:TAhdZO9sKSBCudRh8e2CqNH10x4RDC2r9U6UQeJdjGG9blT86ldFzA>
    <xmx:TAhdZBvgGdTKWQ0rR3Eti0h250GZHpaLisnaQB57n01AuWNfaMRS2g>
    <xmx:TAhdZNFJJxIPMsJgIKWAeAFhNUHDNBzaa-Kba5Pyzs_43uIC_csXHQ>
    <xmx:TAhdZG5p_hLCFz_es-3jYdUxYLp8Caq3_5zWfU_DYJr8gz8xeG2hNw>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 11 May 2023 17:22:48 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 0/2] Add API for making parts of a MMIO page R/O and
 use it in XHCI console
Message-ID: <ZF0ISD/uMns0aLtd@mail-itl>
References: <cover.dd82aca339854e90ffe12e7bc4298254a6caaf0d.1683321183.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xpspPdt6mM4MuL2-vwXHu23ahm874e4kZqROqCwC4cd=fA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7EIq/qd3Zxw5tvMI"
Content-Disposition: inline
In-Reply-To: <CAKf6xpspPdt6mM4MuL2-vwXHu23ahm874e4kZqROqCwC4cd=fA@mail.gmail.com>


--7EIq/qd3Zxw5tvMI
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 May 2023 17:22:48 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 0/2] Add API for making parts of a MMIO page R/O and
 use it in XHCI console

On Thu, May 11, 2023 at 10:58:48AM -0400, Jason Andryuk wrote:
> On Fri, May 5, 2023 at 5:26=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > On older systems, XHCI xcap had a layout that no other (interesting) re=
gisters
> > were placed on the same page as the debug capability, so Linux was fine=
 with
> > making the whole page R/O. But at least on Tiger Lake and Alder Lake, L=
inux
> > needs to write to some other registers on the same page too.
> >
> > Add a generic API for making just parts of an MMIO page R/O and use it =
to fix
> > USB3 console with share=3Dyes or share=3Dhwdom options. More details in=
 commit
> > messages.
> >
> > Marek Marczykowski-G=C3=B3recki (2):
> >   x86/mm: add API for marking only part of a MMIO page read only
> >   drivers/char: Use sub-page ro API to make just xhci dbc cap RO
>=20
> Series:
> Tested-by: Jason Andryuk <jandryuk@gmail.com>
>=20
> I had the issue with a 10th Gen, Comet Lake, laptop.  With an HVM
> usbvm with dbgp=3Dxhci,share=3D1, Xen crashed the domain because of:
> (XEN) d1v0 EPT violation 0xdaa (-w-/r-x) gpa 0x000000f1008470 mfn 0xcc328=
 type 5

Hmm, this series is supposed to avoid exactly this issue. I tested it on
12th Gen, so maybe 10th Gen has a bit different layout.
Can you add a debug print before subpage_mmio_ro_add() call in
xhci-dbc.c and see what area is getting protected?

> The BAR is mfn 0xcc320-0xcc32f
>=20
> Booting PV, it faulted at drivers/usb/host/pci-quirks.c:1170 which looks =
to be:
> ```
> /* Disable any BIOS SMIs and clear all SMI events*/
> writel(val, base + ext_cap_offset + XHCI_LEGACY_CONTROL_OFFSET);
> ```
>=20
> Thanks for integrating XUE, Marek!

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--7EIq/qd3Zxw5tvMI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmRdCEgACgkQ24/THMrX
1ywQPgf/U0lCST5MSzHwIwOXwDkviiPxKD1XdpSPaTgqT+N6aCV367NuKRgSW/qI
1sZiXUHMQ5qQ7V5IFIAVKIK4aPZeSPGs7OIQGeKyFssVsDNYCuF4i/D9XIX+3ySD
cko5UuPGM8OCXt0lRlYdnKGcJq3Dlhlz0Gb382wWy/VIP9hnJcLdQO02gpPdCqH/
IsI73VBCAV+skYv2vx82lkScJy2aXaj8hkB3jh6xq1++TV3l4n+Rt2nI1Z4wlneK
HziNe1nuvMPPIvQgCJ2SVdy1UMOcWa924v44+kqnzOctgx1PQo0YXgXSytRAMImc
zTr8iGasz6WHwYe5pdAOYigpDCZveQ==
=X8eh
-----END PGP SIGNATURE-----

--7EIq/qd3Zxw5tvMI--

