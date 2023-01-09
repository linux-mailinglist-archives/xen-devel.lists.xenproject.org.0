Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA854662AF1
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 17:15:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473838.734650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEunP-0004Rd-5e; Mon, 09 Jan 2023 16:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473838.734650; Mon, 09 Jan 2023 16:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEunP-0004OK-1X; Mon, 09 Jan 2023 16:14:47 +0000
Received: by outflank-mailman (input) for mailman id 473838;
 Mon, 09 Jan 2023 16:14:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rQi4=5G=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pEunM-0004OE-NJ
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 16:14:45 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b89d383d-9038-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 17:14:42 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 7B72B5C01AC;
 Mon,  9 Jan 2023 11:14:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 09 Jan 2023 11:14:40 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Jan 2023 11:14:39 -0500 (EST)
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
X-Inumbo-ID: b89d383d-9038-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1673280880; x=
	1673367280; bh=1GGy41zJtcnIKoNV4zriEHhvQgYGglkS78ucKnWeKLk=; b=d
	xXuIip7xiWdi4SBSprYRK10+E0SDAP8/dxuyBD3V7HP3fz75FGDP/06FBGQDR3Dd
	681/t39T2kfUvgDqCnzB4JYUOxJGJJyPZ7jFI33ODFXFMXr5lYD43EK/5CcbiK/s
	XA5aR5iPEbI8n5tV8lanEyiz8+GG1NvdK1znQUwXA5vpYZh2ng0gB23g84j1bHDg
	8YI8xIapCq6Ur6QxW7+t/EVQtmrAOglBnNa7sW8VHAu+tIKu9QlCi+GIfeMp5lPp
	mjICH48JfJUxa3k3FcaiAb9+TjuGeuaYF/Nlr9q/H+g1m1foYDhz2QySwB038pz1
	sXfDLz1awrn6Cf422rlDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1673280880; x=1673367280; bh=1GGy41zJtcnIKoNV4zriEHhvQgYG
	glkS78ucKnWeKLk=; b=InLrfATdM2Jwxsd1QadJpxehdSzjAInH0f7vQBPu5qmx
	VsTs9lu3piNkPYHO8R4IQGfZojdaFrnTiIMjjKr25QvttPteQ0R+IId8L+ASnzJ9
	makmG32u3Rg1yD6UE6Q23LrR+JRThuJa66cMcVBoGDR8y/5ubPxZcjQ30UYug0s6
	UpIXoHAprly1Zw+msRU4cuCMAa8iVL6yV+udrUo1ohZQz19sqPPcIOdnVxS1pVTv
	2ckl3OuRlekZHsLTr0OFGz68gC6IIBcBueY2eor+DQOUHwLp2zpZ7jDrqPNIRCHI
	udF/dTa0UqAuwVHzb2kY52yWuOlBXkn5EpgQ/napdg==
X-ME-Sender: <xms:cD28Y7Ytqu3niWlOlKnKc_N2dUJioyXatZrdPP8iSjE1ntwnB2F4SA>
    <xme:cD28Y6YWRVYNcjcQMGldHQgs-wxENh88dkUQpL5BbMoZBXYtvsJnngzfZ6PamQl1D
    0hBWEDCrPj4OX4>
X-ME-Received: <xmr:cD28Y98gLJpfkg_yhwV8yyk_CYAAbkt54fYeJ3LlCQAiy1T_06PmLkGHUtb8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeigdekvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffegfffg
    uddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:cD28YxrFyT55g8H9UEe04BnvSeMTIMUr73DWVj4myWKK3Ac1SLjvEQ>
    <xmx:cD28Y2oMOn_9WRkWblB11cpyJA4EZJKjAnv0oTdaGJyU51ZwXKXg-Q>
    <xmx:cD28Y3QhfTFckjxiqxJwi1Rnncy6TnnplWeBydzd1yKBPMiKTK-O2w>
    <xmx:cD28Y2KWWedwFxassFcwQkUng5pgN28auVPjjtJ3c8WLCYK10YbL0A>
Feedback-ID: iac594737:Fastmail
Date: Mon, 9 Jan 2023 11:14:28 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7 4/4] x86: Allow using Linux's PAT
Message-ID: <Y7w9bQn295Bc3GJz@itl-email>
References: <cover.1673123823.git.demi@invisiblethingslab.com>
 <9fd0360dd914d93dab357d16b46b4290e6119d30.1673123823.git.demi@invisiblethingslab.com>
 <2b46602a-f518-c191-946d-3b343b46dc87@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PuiekJm17OZlMUMK"
Content-Disposition: inline
In-Reply-To: <2b46602a-f518-c191-946d-3b343b46dc87@suse.com>


--PuiekJm17OZlMUMK
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 9 Jan 2023 11:14:28 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7 4/4] x86: Allow using Linux's PAT

On Mon, Jan 09, 2023 at 12:37:34PM +0100, Jan Beulich wrote:
> On 07.01.2023 23:07, Demi Marie Obenour wrote:
> > --- a/xen/arch/x86/Kconfig
> > +++ b/xen/arch/x86/Kconfig
> > @@ -227,6 +227,39 @@ config XEN_ALIGN_2M
> > =20
> >  endchoice
> > =20
> > +config LINUX_PAT
> > +	bool "Use Linux's PAT instead of Xen's default"
> > +	help
> > +	  Use Linux's Page Attribute Table instead of the default Xen value.
> > +
> > +	  The Page Attribute Table (PAT) maps three bits in the page table en=
try
> > +	  to the actual cacheability used by the processor.  Many Intel
> > +	  integrated GPUs have errata (bugs) that cause CPU access to GPU mem=
ory
> > +	  to ignore the topmost bit.  When using Xen's default PAT, this resu=
lts
> > +	  in caches not being flushed and incorrect images being displayed.  =
The
> > +	  default PAT used by Linux does not cause this problem.
> > +
> > +	  If you say Y here, you will be able to use Intel integrated GPUs th=
at
> > +	  are attached to your Linux dom0 or other Linux PV guests.  However,
> > +	  you will not be able to use non-Linux OSs in dom0, and attaching a =
PCI
> > +	  device to a non-Linux PV guest will result in unpredictable guest
> > +	  behavior.  If you say N here, you will be able to use a non-Linux
> > +	  dom0, and will be able to attach PCI devices to non-Linux PV guests.
> > +
> > +	  Note that saving a PV guest with an assigned PCI device on a machine
> > +	  with one PAT and restoring it on a machine with a different PAT won=
't
> > +	  work: the resulting guest may boot and even appear to work, but cac=
hes
> > +	  will not be flushed when needed, with unpredictable results.  HVM
> > +	  (including PVH and PVHVM) guests and guests without assigned PCI
> > +	  devices do not care what PAT Xen uses, and migration (even live)
> > +	  between hypervisors with different PATs will work fine.  Guests usi=
ng
> > +	  PV Shim care about the PAT used by the PV Shim firmware, not the
> > +	  host=E2=80=99s PAT.  Also, non-default PAT values are incompatible =
with the
> > +	  (deprecated) qemu-traditional stubdomain.
> > +
> > +	  Say Y if you are building a hypervisor for a Linux distribution that
> > +	  supports Intel iGPUs.  Say N otherwise.
>=20
> I'm not convinced we want this; if other maintainers think differently,
> then I don't mean to stand in the way though. If so, however,
> - the above likely wants guarding by EXPERT and/or UNSUPPORTED

I considered this, but decided against it.  Recent Intel iGPUs are
simply incompatible with Xen=E2=80=99s default PAT, so anyone wanting to us=
e Xen
in a desktop environment must say Y here.  Guarding this with EXPERT or
UNSUPPORTED will not prevent distribution maintainers from enabling it,
because the alternative is building a hypervisor that does not support
the hardware their users actually have.  Qubes OS is *already* shipping
a patch to use Linux=E2=80=99s PAT, so you don=E2=80=99t need to worry that=
 this code
will go untested.  And if there was a vulnerability that requires
CONFIG_LINUX_PAT=3Dy, I=E2=80=99d rather it not be dropped on Qubes users a=
s a
0day.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--PuiekJm17OZlMUMK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmO8PWwACgkQsoi1X/+c
IsEJgBAAyuVY6uST5cWxL/JvZwJFwUaxZpys3NuNGGKFciAwb5UF1UBCFcA9DNG5
cACYAq3oU9c2fwVrvz+Rbvsx3F/yLXcbnnJ+3dlnxV3aejcOget52JPwBjC+7RJP
HYZwuPk+mObqfNc8DZ2eyfEN3nNZT0dDiGs55EesFpGp46TAuMnt3ajX6GUEl3OT
+auxdHKpYScOiObKKz5mklGR0hHRET73NlKRrsJB+Z0J88XYX3m/3kksQyDr51aC
n7IaixuvkdQHVFwU0l8AlcPjLmv8mdbb34yg9mDVM4Vf4Kmj3qCAUY/tzCnNoPff
RiDjEpaHMft7GdHrbYbk+ArpgE4dtV3Snk19zvUPr5LtYmKUjuGsY1RuxNx5fwDo
W73nFH8bfzStX1/UYz5xSbmiuKG4XUsWJ7JUP19hFK6jrA9nm/WnBoCkleYmfKEd
Q1Ua0vhwbapH2h5UkWobuy043RaWiH4WP4JN6AsAYqPvGlj/NdrKrFRUNzMfmGtm
nziEetZAGZ0sPCpBTcprVGeOMwQitseQyV1OP6qmuyLIbn5P/VL8utzBDS15TUBL
OKVLrppiQxVbEUTsa7zBV3UJBnj6NQ27ucbMRRDMxx7FKEBOmkG9CRptiFu2k9R7
qG/z/klN2pKWuR37hrjp9pUdLAIhTofuHzLSc/ybfszgLBvlcm4=
=CX+6
-----END PGP SIGNATURE-----

--PuiekJm17OZlMUMK--

