Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EE36ED173
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 17:35:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525513.816781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqyDY-0008UM-PC; Mon, 24 Apr 2023 15:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525513.816781; Mon, 24 Apr 2023 15:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqyDY-0008SA-MC; Mon, 24 Apr 2023 15:35:04 +0000
Received: by outflank-mailman (input) for mailman id 525513;
 Mon, 24 Apr 2023 15:35:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HiTc=AP=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pqyDX-0008QR-8z
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 15:35:03 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92853caf-e2b5-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 17:35:00 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0175D5C0190;
 Mon, 24 Apr 2023 11:34:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 24 Apr 2023 11:34:59 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Apr 2023 11:34:57 -0400 (EDT)
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
X-Inumbo-ID: 92853caf-e2b5-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1682350498; x=1682436898; bh=5z2xL8Dc89vedDFBEfOdP2o8+4s0AnBLxIg
	AbTHdUKs=; b=SMzb+eXJ3/Yc9ihXsw99AGKXjo/GZk7WwjGzLlP2ENTsuyfzDlP
	moqcazokhSGQNXz764EwropL5Y9BBf0ViUSodmO6aE011vaD7+6kEwf5y1Iyxlh1
	KbTo8vLNqhKYYseCFqwX02O65nUM5JwZUN4HJ9Bw5ZQVo7cJ05G8jgz9JV6XfxTD
	QlXT99E9O6WoEuNn46jE/4Uk9ybwLacTFRm9l5g29xv5962lHggzXxkWvgatOscm
	ROkpwvofOzCPWLpw1krrOBikESJLAt/ajSh1XPWx/jrYPYpwlkT3yndl+kzOzoyP
	u/fZEnC3KZjcHyZmpZqxDOnT4u4hiJ07v3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1682350498; x=1682436898; bh=5z2xL8Dc89ved
	DFBEfOdP2o8+4s0AnBLxIgAbTHdUKs=; b=BasBoKXeay3N+zSIQKdtetQxxsCjb
	WLo2AZpxcG13UuCiP5lB0igkLMK0lyAVgYjow665gK/Np4jECyIZCeBDqmsDhAS5
	EyqFT0ERMMctPkOEN3de4BKYM4zKGEz9UQm5rpRhK9Mgm4lgmD8GUcvGtiRdjwCF
	EQdZ7q7v7le/X5Ub3IZQ7cZw14Ee/dTI4g0UKdF7ukL4iFq5Na+qNyIAON8hqDfo
	Q9vITvN6UC9poGx9aCF/X+PY7NG5+up3lm11xw0jL7qUbeknMSF5KecwCAk5i0S7
	CdKmvaaUSMxjJ9MNzMpdxgchkU+To47B+s5G/Hncb6j/seHRoIfFh2+yg==
X-ME-Sender: <xms:oqFGZFpqelXkbsdMGf_Qw1MZO81cO5qPvVcpYLAzdKamhUpBDcuLIQ>
    <xme:oqFGZHpAmr_vgKm9HEyO_nKvxXAjsiABcvr2evAg1yPRFo-dKnfD9vu02UOa_6d-j
    9ObNqwt9xoM2A>
X-ME-Received: <xmr:oqFGZCNoc17PXQY0sV5ms7GTtjhMFizxMQoi-7McqFhN0mmboeb9d-iY2eySVsL6-JbpEDb2HaBi7ws5Acutf6dXgzxOh5KfEYU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedutddgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleeu
    tdevfeffueelgfduieevuefftdekheevjeeiiefgtedttdefgfekheduteefnecuffhomh
    grihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:oqFGZA412oV-6fnXs-37gm76-3LQqD68ZhaREG11xH6kAc9i58VmxQ>
    <xmx:oqFGZE7vvlI301n2j3HIoD-vO-ZJJGtcWi9DtAniuJflU4sBC7TCsg>
    <xmx:oqFGZIiUGocgbyhXMSjuxT1561pvU5eiFUh48wKMj8tyniHregqepA>
    <xmx:oqFGZEFYTwadJj8UtBlbh9_pWWwmBOip0RahwsYLMsfcLE5QcMRWeg>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 24 Apr 2023 17:34:52 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 4/4] x86/msi: clear initial MSI-X state on boot
Message-ID: <ZEahnVfwnDgLwodp@mail-itl>
References: <cover.c12fc399ea0151818e48ac5179ad554c00c9386d.1680752649.git-series.marmarek@invisiblethingslab.com>
 <6984a8571dac35d04c85117834d99b00fe1c4184.1680752649.git-series.marmarek@invisiblethingslab.com>
 <4eb45940-5615-2398-633d-e5f59dc6987d@suse.com>
 <CAKf6xps2nVoYL6LtOqW2UBHadNSQzkb1XAe7WRxXmLzyN3kAGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w/O0S1i4n57pGbhV"
Content-Disposition: inline
In-Reply-To: <CAKf6xps2nVoYL6LtOqW2UBHadNSQzkb1XAe7WRxXmLzyN3kAGQ@mail.gmail.com>


--w/O0S1i4n57pGbhV
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Apr 2023 17:34:52 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 4/4] x86/msi: clear initial MSI-X state on boot

On Mon, Apr 24, 2023 at 11:25:01AM -0400, Jason Andryuk wrote:
> On Mon, Apr 24, 2023 at 10:19=E2=80=AFAM Jan Beulich <jbeulich@suse.com> =
wrote:
> >
> > On 06.04.2023 05:57, Marek Marczykowski-G=C3=B3recki wrote:
> > > Some firmware/devices are found to not reset MSI-X properly, leaving
> > > MASKALL set. Jason reports on his machine MASKALL persists through a
> > > warm reboot, but is cleared on cold boot. Xen relies on initial state
> > > being MASKALL clear. Especially, pci_reset_msix_state() assumes if
> > > MASKALL is set, it was Xen setting it due to msix->host_maskall or
> > > msix->guest_maskall. Clearing just MASKALL might be unsafe if ENABLE =
is
> > > set, so clear them both.
> > >
> > > Reported-by: Jason Andryuk <jandryuk@gmail.com>
> > > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethi=
ngslab.com>
> >
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > albeit with a couple of nits (which I'd be happy to address while
> > committing, so long as you agree).=20

Yes, thanks!

> > First one being on the last
> > sentence above: It's surely not just "might"; if resetting already
> > doesn't work right, nothing says that the individual mask bit all
> > end up set. Clearing ENABLE as well is only natural imo, if we
> > already need to fix up after firmware. So maybe "Even if so far not
> > observed to be left set, clear ENABLE as well"?
> >
> > > --- a/xen/drivers/passthrough/msi.c
> > > +++ b/xen/drivers/passthrough/msi.c
> > > @@ -46,6 +46,23 @@ int pdev_msi_init(struct pci_dev *pdev)
> > >          spin_lock_init(&msix->table_lock);
> > >
> > >          ctrl =3D pci_conf_read16(pdev->sbdf, msix_control_reg(pos));
> > > +
> > > +        if ( ctrl & (PCI_MSIX_FLAGS_MASKALL|PCI_MSIX_FLAGS_ENABLE) )
> >
> > Style (missing blanks around |; once more below).
> >
> > > +        {
> > > +            /*
> > > +             * pci_reset_msix_state() relies on MASKALL not being set
> > > +             * initially, clear it (and ENABLE too - for safety), to=
 meet that
> > > +             * expectation.
> > > +             */
> > > +            printk(XENLOG_WARNING
> > > +                   "%pp: unexpected initial MSI-X state (MASKALL=3D%=
d, ENABLE=3D%d), fixing\n",
> > > +                   &pdev->sbdf,
> > > +                   (ctrl & PCI_MSIX_FLAGS_MASKALL) ? 1 : 0,
> > > +                   (ctrl & PCI_MSIX_FLAGS_ENABLE) ? 1 : 0);
> >
> > Our "canonical" way of dealing with this is !!(x & y).
> >
> > > +            ctrl &=3D ~(PCI_MSIX_FLAGS_ENABLE|PCI_MSIX_FLAGS_MASKALL=
);
> > > +            pci_conf_write16(pdev->sbdf, msix_control_reg(pos), ctrl=
);
> > > +        }
> > > +
> > >          msix->nr_entries =3D msix_table_size(ctrl);
> > >
> > >          pdev->msix =3D msix;
> >
> >
> > Aiui there's no dependency here on the earlier patches in the series;
> > please confirm (or otherwise).

Indeed. An earlier patch uncovered a firmware (or such) issue on some
systems and this patch deals with it, but it doesn't depend on earlier
patches.

> > Jason - any chance of getting a Tested-by: from you?
>=20
> I'm building v3 now.  v2  worked for clearing MASKALL on initial boot.
>=20
> I posted in these two messages - a summary is below.
> https://lore.kernel.org/xen-devel/CAKf6xpto87QRSKT2qc1yApNfaw2SrLLxPoytYJ=
v_jEbYTAbjCg@mail.gmail.com/
> https://lore.kernel.org/xen-devel/CAKf6xptHALLR-Qjf=3Dp5y0o9Ud2V7eFMJuB8A=
p-PLjv-N7PAJVQ@mail.gmail.com/
>=20
> OpenXT has a patch that performs an extra reset after domain shutdown,
> and that causes Xen to set MASKALL.  I confirmed by removing it.  So
> this patch helps with clearing MASKALL on host boot, but with the
> OpenXT patch, rebooting a domain fails.  MASKALL gets set on VM
> shutdown and then the subsequent boot can't assign the device.
>=20
> So this patch is helpful in some scenarios, but it was also an issue
> caused by the OpenXT patch.  Does that make it unsuitable for
> inclusion?  I assume the OpenXT patch wasn't an issue previously since
> MSI-X was never enabled.

Upstream Xen IMO should deal with the state it gets on boot, regardless
of what was running previously (the actual issue is likely in firmware
or device itself, that it doesn't clear that bit, but well...). So,
rebooting from OpenXT, into vanilla upstream Xen should result in fully
functional system. That's why I included this patch, but haven't dealt
with an issue caused by OpenXT patch on subsequent domain startups (as
it doesn't apply to the upstream code base).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--w/O0S1i4n57pGbhV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmRGoZwACgkQ24/THMrX
1ywQQggAgLsWK3skwL1kN/N5dbGQ8muzBVTA47Pb8Q9PMZeXnj7Nab/iS184sLb4
TuL3bGHREPLOUKFLqY0febOOKSBHCGzSLjeLEnYDMfpjPZbW17spo4VqLvrsL/sx
cbduZHfctojCU5I9PX0mTMUSnq7s8brgMooWZ+cN3FX/8291xWXd4h+D1KRoqfTN
gD56C1pglOGIBvy26nnbP7O8yKYO7tlQmDUKqg84twlVZakEGbH308MATO4/PMxU
QKabaeyLI/NwapA4LzkR+YFBcOHnDusY/pSISb0N8YqW+KJba0MrcKL1Jf/7sc/r
c80RSzWoYLDAuQ74ii4Trj1GKReIew==
=jnTX
-----END PGP SIGNATURE-----

--w/O0S1i4n57pGbhV--

