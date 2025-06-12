Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38298AD7C60
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 22:30:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013552.1391947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPoY9-0002cl-Sq; Thu, 12 Jun 2025 20:29:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013552.1391947; Thu, 12 Jun 2025 20:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPoY9-0002bG-QF; Thu, 12 Jun 2025 20:29:25 +0000
Received: by outflank-mailman (input) for mailman id 1013552;
 Thu, 12 Jun 2025 20:29:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bliM=Y3=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uPoY7-0002Z5-NT
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 20:29:23 +0000
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebc10ea1-47cb-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 22:29:21 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 3D058114023C;
 Thu, 12 Jun 2025 16:29:20 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Thu, 12 Jun 2025 16:29:20 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jun 2025 16:29:15 -0400 (EDT)
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
X-Inumbo-ID: ebc10ea1-47cb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1749760160;
	 x=1749846560; bh=nTRp4plZtids7Yw2Omf8/NwrGln5GzTJtS9oOKTYnvM=; b=
	dRLQ45XkQ8F/xojIkHMWzrUs1t7Hg9F90yPcJGFpdwM2kcW9XpxtbreaFOB7icOw
	awWyA1Z2WjYeIGE/jaxfwBufNu/Nit76MtWSPHk4Xn1t+0HDcKsYtjjdyxxQr0rW
	KupB/DqJxPF9lvY3tTlwIDQEQFB2DIVKmFTg8KzmsU4uhq3PxtJfVQF/5AUzduE8
	dtu7CoxYyu6FjYOXAmGRm2HuHcTboATZBEcVJ8S117qAyS0hSyLkBrP2Gkz5wYHl
	19mhvV1jv5HT8yKHs6WEZPhQkSaVJ8HS5L+00D+E5SjER/ILeXNn9SZiyn2XwLkq
	CI//nw7mRvBJ1ySp0o+fPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749760160; x=1749846560; bh=nTRp4plZtids7Yw2Omf8/NwrGln5GzTJtS9
	oOKTYnvM=; b=oiO+cABIwgI8PSHyrm4cQ69fITRBUIoQjyK4s+OiFeDZ4sAcKyy
	apcHxUPOTlm5Eq/H/VGx2Q9GV1EQU/1d3TrDB7iADVuHffOf/0yhNOmrg9YV9luV
	9jfhgoXIk/0Sw+YdGCSmhI+0kEYT9OG7zwDRg9I14PRmDSZymn0m5u12SUXYEQ+G
	5GaBjNhZOo2z+t6Vb3pGMB0bXURX0T9PTcNIYjwDlVRGJESncMjgv7qMGgbXO8VL
	L2UCZlRsZMz/Lw+077S/NocUuNYfTSD8UFCfdTJ//oZQue1datFj9hlV2OtOUESw
	pIzqmuj5C+U6PEybiaPeZG5KkwY7yz4aJoA==
X-ME-Sender: <xms:nzhLaCwg2R_6tJ2fQCJxyjonXZzq0TFK7iLaTxUYQqFqdirApbhUHQ>
    <xme:nzhLaORW4Lp_v-XfDtLSZWPoSfg4KSC6rqtsC_VG8DPPm7a2UQoacTeBa3N0fp7gH
    jn3al96sqjj-w>
X-ME-Received: <xmr:nzhLaEUvJukaw_3OPrvo4tIRoB1OO16MZrSv-CjMh_J8esJRyalAuO0IELk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduiedtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpefgudelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvd
    egueetfeejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpd
    hnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggv
    mhhiohgsvghnohhurhesghhmrghilhdrtghomhdprhgtphhtthhopehjsggvuhhlihgthh
    esshhushgvrdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihht
    rhhigidrtghomhdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvsh
    drthgvtghhpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgurdgtohhmpdhr
    tghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrph
    gruhestghithhrihigrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepjhhgrhhoshhssehsuhhsvgdrtghomh
X-ME-Proxy: <xmx:nzhLaIiKOUKiDV2cPgVyX3ieaEIsBWTY6SF3d2-clFrTcNkQXW5vUQ>
    <xmx:nzhLaEDwmcYtQfMKsf8jOYIOsBq8AZM6UdvfWF2AVcOsIvmhQC7VJA>
    <xmx:nzhLaJJnS1kwCQdcDdpZel3g_FmjN7Zme9JfjJAb1LumeY6mpIQIFg>
    <xmx:nzhLaLDWXU1iJXcco1X6O0dT0XlZ9-jn9oV1WXZiKxGFoOULK2dhrA>
    <xmx:oDhLaPHvDrh8LmgFZEl6YsoOnwips4zJfzX60-IixGaOdoKCK7V9MZM6>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 12 Jun 2025 22:29:12 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>, Trammell Hudson <hudson@trmm.net>,
	Ross Lagerwall <ross.lagerwall@cloud.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	Kevin Lampis <kevin.lampis@cloud.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] docs: UEFI Secure Boot security policy
Message-ID: <aEs4mEqXnxsX0iCr@mail-itl>
References: <20250611235851.167385-1-andrew.cooper3@citrix.com>
 <5aad2d39-31e1-44c6-b167-a3275dc6b747@suse.com>
 <842eb63e-cd20-4c0f-9f25-9d9c2a5457b1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9oYUqGuFLUmhVa6l"
Content-Disposition: inline
In-Reply-To: <842eb63e-cd20-4c0f-9f25-9d9c2a5457b1@gmail.com>


--9oYUqGuFLUmhVa6l
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Jun 2025 22:29:12 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>, Trammell Hudson <hudson@trmm.net>,
	Ross Lagerwall <ross.lagerwall@cloud.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	Kevin Lampis <kevin.lampis@cloud.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] docs: UEFI Secure Boot security policy

On Thu, Jun 12, 2025 at 11:22:39AM -0400, Demi Marie Obenour wrote:
> On 6/12/25 06:06, Jan Beulich wrote:
> > On 12.06.2025 01:58, Andrew Cooper wrote:
> >> 2) Pre-boot DMA Protection.  Microsoft consider this a platform feature
> >> requiring OEM enablement, and do not consider its absence to be a Secu=
re Boot
> >> vulnerability.  But, it is less clear what the policy ought to be for =
Xen
> >> booting on a capable system and failing to do a correct live-handover =
of the
> >> IOMMU across ExitBootServices().
> >=20
> > Shouldn't this be another TODO item at the bottom? We don't support yet=
 taking
> > over when the IOMMUs are already enabled, do we?
>=20
> Dasharo supports leaving the IOMMU enabled when transferring to the OS, a=
nd
> this message was sent from a Qubes OS box booted in this configuration.

"Not explode" doesn't mean it "works" or is "supported". For example
there is no guarantee that IOMMU don't get disabled in the process
opening a window for an attack. (and I do know this issue is the case)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--9oYUqGuFLUmhVa6l
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhLOJgACgkQ24/THMrX
1yzDCgf+J/CoFuqYOLxNsIko9wNzJ0zrtnB6TWRR8czGW7xfRy9596hLpaYhozRA
PDbQgHUykRtE3D8gB0WWUs4/HGNY2ncftYE7EaB7jm5jhgi9qTfKBRSArc7kO2US
s0vnD4Yl+76fBqd8TmWIW09ZJBOV6WidBd8h7+aIgEIWAgB8LjX1N3k37Y9HOF3h
SwGk90/CxBhW5Y4cO4vT9y8fzJfz29l+BX7Fnjg6nTF+bJpf9G76iSlqrQ/mT1T1
kMB7kS62Oz6n12dbGUpIaruHs9/EgcHhibsKjbE6a6/QRgqTpUMIzNpVDND6eN+F
CcXfie189e2uTsW2ZMLwvIukbNAUiQ==
=pfan
-----END PGP SIGNATURE-----

--9oYUqGuFLUmhVa6l--

