Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A1EAD8CEB
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 15:13:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014358.1392501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ4D8-0007dt-Ne; Fri, 13 Jun 2025 13:12:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014358.1392501; Fri, 13 Jun 2025 13:12:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ4D8-0007al-Km; Fri, 13 Jun 2025 13:12:46 +0000
Received: by outflank-mailman (input) for mailman id 1014358;
 Fri, 13 Jun 2025 13:12:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uXbF=Y4=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uQ4D7-0007af-FP
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 13:12:45 +0000
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 166b2a86-4858-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 15:12:43 +0200 (CEST)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 15808254012F;
 Fri, 13 Jun 2025 09:12:41 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-10.internal (MEProxy); Fri, 13 Jun 2025 09:12:41 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 09:12:36 -0400 (EDT)
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
X-Inumbo-ID: 166b2a86-4858-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1749820360;
	 x=1749906760; bh=nic4krrDQvZMHzuHBfuhHul7sbLqjo8sqiELgpkyWwQ=; b=
	S/4TdprqVZEItFqsnfTKR32/snSDHdi4ZQgY4USZuK6lZ2kW6Rv0ch2t8Z/eAi4K
	P61Ks2JHQax3edyNJR24ENBkjShcqJbwhFBNldbzIrT1DyvFHoxXqX3PrfEo77Fx
	M55aFiuJeu42uGHxQedr378IM9Pi8QOh4MpnE+dt41vMduoqV5XkvDH432eNE60z
	rW4CBnQVjBHxhOebby17xELnWiCcyhj6Vpf6Id3+YPyMpJhGR74OtULwozjrDK7d
	a+FMxQed62Jlg6d0xOIVHQXR6BxEmbyvAkB7lmpZ9p4yZsXiSElIa8V2HjKg5ZQG
	yv21PMWwsx7VP36jU9KeBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749820360; x=1749906760; bh=nic4krrDQvZMHzuHBfuhHul7sbLqjo8sqiE
	LgpkyWwQ=; b=Lv92+xNRcAFrIQP772pfzygmhR5arCHa6mgCzL6XzHrhOUxTYqy
	lxzHtNNdCugYJxlNhAufT0AzGeKmxVlAzu+SIemcgB6qVlQWOV+g0Wbz+Tj9liMA
	aGCuuc62PNT0/SdZyQPc9ynwgSvraiOjy/S7rjp6xExle8WskXUFU6v3k+6ALcYb
	uqtnSdYE+9qznsNy55AQy01J1hrkn774+SwoxWR+wB8I2+nD0SJEnMzinT1zIQ0k
	l0CYe7SKL4zNHoaVO+km35+ZBjvm3QT0K6SH+cdBvMVmFKG0RG35Q895jC8sUPXn
	E/aP4Y9nC5NXC0JoC0LmodkqlsArDJ+p7gQ==
X-ME-Sender: <xms:xyNMaHvVfr8M3uj6dagYyLyKA4_hyyPJvrHwEO5XIKCKcAqroi79kQ>
    <xme:xyNMaIeDJzxa-bCQf0iJuMCsBb5iY7G4LkK16aaE6eP2gLBzXE5kpir5UZNe8zH8r
    H6-ceshbz0f8w>
X-ME-Received: <xmr:xyNMaKyi0mbxPsVYL7DOk91BVMXJIhn0WOXZmXdu4KsMO3uOVQfQFqk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukedtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpefgudelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvd
    egueetfeejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpd
    hnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgs
    vghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhise
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdig
    vghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrug
    esvhgrthgvshdrthgvtghhpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgu
    rdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpthhtoheprh
    hoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepjhhgrhhoshhssehs
    uhhsvgdrtghomhdprhgtphhtthhopehhuhgushhonhesthhrmhhmrdhnvght
X-ME-Proxy: <xmx:xyNMaGM3SWk1batE1NuUj88BiRNI1sbLmNzIDdl7NXNCHnL3lAK-eQ>
    <xmx:xyNMaH9Ld8GSGgOqBFtKBiSjcORb_ypCNT7m_aY2UafoQYrOXH7ktg>
    <xmx:xyNMaGXbmclPQWElRNVlx6MyM5XhTNHwpZRZETHP3cL3VwBsBP0v6Q>
    <xmx:xyNMaIe5WFupc_KPCEy_grXc2lFNtxKI9zgYpkTKunKcHKBHXWEt5A>
    <xmx:yCNMaAPF3bV2B2GOlXQoiEwIRlt5XNQ0rTluA3ebbHUWdklTvIEeY4wY>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 13 Jun 2025 15:12:34 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>, Trammell Hudson <hudson@trmm.net>,
	Ross Lagerwall <ross.lagerwall@cloud.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	Kevin Lampis <kevin.lampis@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] docs: UEFI Secure Boot security policy
Message-ID: <aEwjwqlmOvdp9G2H@mail-itl>
References: <20250611235851.167385-1-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2506121426520.8480@ubuntu-linux-20-04-desktop>
 <608cf9c5-f057-4d3b-8833-8ef040064fec@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YamY06O8Z+wvFSTe"
Content-Disposition: inline
In-Reply-To: <608cf9c5-f057-4d3b-8833-8ef040064fec@suse.com>


--YamY06O8Z+wvFSTe
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Jun 2025 15:12:34 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>, Trammell Hudson <hudson@trmm.net>,
	Ross Lagerwall <ross.lagerwall@cloud.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	Kevin Lampis <kevin.lampis@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] docs: UEFI Secure Boot security policy

On Fri, Jun 13, 2025 at 08:35:26AM +0200, Jan Beulich wrote:
> On 12.06.2025 23:32, Stefano Stabellini wrote:
> > On Thu, 12 Jun 2025, Andrew Cooper wrote:
> >> +Support in Xen
> >> +--------------
> >> +
> >> +There are multiple ways to achieve this security goal, with differing
> >> +tradeoffs for the eventual system.
> >> +
> >> +On one end of the spectrum is the Unified Kernel Image.  e.g. Xen is =
bundled
> >> +with the dom0 kernel and init-ramdisk, with an embedded command line,=
 and with
> >> +livepatching and kexec compiled out, and suitably signed.  The signat=
ure is
> >> +checked by the bootloader and, as this covers all the privileged code=
, Xen
> >> +doesn't need to perform further checks itself.
> >> +
> >> +On the other end of the spectrum is maintaining the features of exist=
ing
> >> +deployments.  e.g. Xen needs signature checking capabilities for the =
dom0
> >> +kernel, livepatches and kexec kernels, and needs to allow the use of =
safe
> >> +command line options while disallowing unsafe ones.
> >=20
> > I just wanted to mention that there is one more option which I used in
> > the past: the firmware/bootloader loads Xen, the Dom0 kernel, and other
> > binaries, check their signatures, then boot Xen.
> >=20
> > This is similar to the "Unified Kernel Image" approach in the sense that
> > Xen doesn't need to do any signature checking for the dom0 kernel, but
> > it doesn't require all the binaries to be glued together.
> >=20
> > Assuming that the firmware/bootloader is capable of loading multiple
> > binaries and checking the signature of multiple binaries before booting
> > the next element, it works fine.
>=20
> How would an initrd, a ucode blob, or an XSM policy blob be signed?

At least grub supports gpg detached signatures, and can be configured to
require them.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--YamY06O8Z+wvFSTe
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhMI8IACgkQ24/THMrX
1yzNUgf/UtRiHQdPBgWLUK/YlLpFwtsxPmtrYwRNu4/ucSVQmJr+dW+1KO/fnNo4
b0jk3qY2UJl7yrUdqwq+/sHxU6p7TO1URrRjLLmoiUbqK3ERV5y/XGdq9Qt2COOw
7OqjyTgqn6j2ukdc2iFCMxvFeekOkNV3TODpe4mFczE5RVG7RNw9sJY9DfmdfgPS
uEBVZJJoieQZ8VZ74EoVKqyGbA7+NqCIErtWqXnkhMeXeSx5dHJ9tq2AVPRdE58G
/E1Whw7l91QACp66b2NtdUQsiEID6/zje0UR5NWxtou64CHCJ65xuEW/NFtqFapw
xRgrrvMxbJTB+gQKVw2RmAQs3cS4dg==
=rkTk
-----END PGP SIGNATURE-----

--YamY06O8Z+wvFSTe--

