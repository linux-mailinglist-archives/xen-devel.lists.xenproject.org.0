Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 308168A3FC6
	for <lists+xen-devel@lfdr.de>; Sun, 14 Apr 2024 02:34:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.705297.1101962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvnnb-0003gO-Mr; Sun, 14 Apr 2024 00:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 705297.1101962; Sun, 14 Apr 2024 00:32:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvnnb-0003eW-Ja; Sun, 14 Apr 2024 00:32:47 +0000
Received: by outflank-mailman (input) for mailman id 705297;
 Sun, 14 Apr 2024 00:32:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUi4=LT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rvnnZ-0003eK-R7
 for xen-devel@lists.xenproject.org; Sun, 14 Apr 2024 00:32:46 +0000
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com
 [103.168.172.148]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81a71f03-f9f6-11ee-b908-491648fe20b8;
 Sun, 14 Apr 2024 02:32:43 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id 3B3F213800A8;
 Sat, 13 Apr 2024 20:32:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sat, 13 Apr 2024 20:32:42 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Apr 2024 20:32:40 -0400 (EDT)
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
X-Inumbo-ID: 81a71f03-f9f6-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1713054762;
	 x=1713141162; bh=ONF1Wv6Dl4PkIlJ0SrTg3M5CeC1NXWB7miG07jOYyd0=; b=
	RgFQC9kfz+OvdkMqSKTHG47S6bbDHy1N30KF0g9pbkP6nhsU9OwFdp+Mp520uxf7
	bZdoiAV/TWTsPP54D8XJGLShBr2MOuz7C7zQ2L1PsQFcfBBCUCpAdtXzhNrGvOP7
	SwMoWHaD681ilLhbzI2j+wEp4aDwcR1iCLa6xrrw3yowO/d/7+By9mRMiczcsIf5
	hSAfU75CtSn/1egPIylTd+oHyWLiwEV9FmJwQt3grBiQn4IxNOtPwYO5es+P5CW7
	RV4X1yxo85io5a4S74+PiZLxZ/D8HyLDCbnVY2g4udfW5uf/+esELzV71u2W5P72
	kdNgqbcUCxzYon+WZuH9EQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1713054762; x=1713141162; bh=ONF1Wv6Dl4PkIlJ0SrTg3M5CeC1N
	XWB7miG07jOYyd0=; b=JnJVxgIhivnUJ1jkllwLfW5dZQ+mRupKtSJ2d/z6RQZM
	mRKt7oHriCYLKcGiUtlWshlNkmiK4At1iZyq7xd/ivOYxPUlxjSJicnUPLC+dFru
	PxN/RbIcpRDq32kLkCVAv1dVTl1rvC6cDKMGIltK13t0CNyOBAqysR9hWkr/nP7G
	MTmiBmLkIsCAIaTDZx6mgKu9AYLP+cCuL35N93foyE1PYmqbzdCJhmwEjQrz+y+/
	tLs+FeY0mmYf16exM4Dw5OQdDumzAcYy+BNCDn/EEr4Z2BxxATRh/BLwkJpKJdDC
	f6zjiGN3D07fpuLGGOdf+UPT7TujnzqqVj/6togoHg==
X-ME-Sender: <xms:KSQbZutKc91S7HXwvJXfwOpWtosA6Wo0EIYaMal-qEKXVF-bIG_bcQ>
    <xme:KSQbZjckAAI5QUD1KrHNoX1RVp-q22pFcmJxLOeLbImHV9BM1RpPn4Azes5fuEabZ
    bTJIV0keE91Nw>
X-ME-Received: <xmr:KSQbZpwtrQasg-twmVr36jeqQZTzAoyXaC_gcR-BTBfpwqHRtGkdxU2XgDFkVwbIBsB4-ihJryFsQiUZityiDGFHaHgVp2uPdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudeijedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:KSQbZpP_aQd9JaLMfgK7lkdwaXgza3XeXYd8yub5a92OvfNWDEM7ZQ>
    <xmx:KSQbZu-nh7VJwaJsfjbn03rs6y_BM0Jv43OA6Q64eE1otwnBuuTAGw>
    <xmx:KSQbZhXX3b7IJv_Ru1161lbcipjlBUppSzQrdPUbfpq4En_Us-gK8w>
    <xmx:KSQbZncDq4MNaJXSqySwTgBwq4vuvF1R_yv-8aRx49D4SMBoEp0LHA>
    <xmx:KiQbZlYq4GndpI9fvkV_tfsyNHF3tbAez-PsTPkdlgE0javJFfWlGNrP>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 14 Apr 2024 02:32:35 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 2/2] drivers/char: mark extra reserved device memory
 in memory map
Message-ID: <ZhskJAL1fz3lNdg7@mail-itl>
References: <20240327025454.514521-1-marmarek@invisiblethingslab.com>
 <20240327025454.514521-2-marmarek@invisiblethingslab.com>
 <0d7daae5-97c3-4982-8301-7ed2fda24ff9@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gIMOllW2eE6Vd1E3"
Content-Disposition: inline
In-Reply-To: <0d7daae5-97c3-4982-8301-7ed2fda24ff9@suse.com>


--gIMOllW2eE6Vd1E3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 14 Apr 2024 02:32:35 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 2/2] drivers/char: mark extra reserved device memory
 in memory map

On Wed, Apr 03, 2024 at 09:10:40AM +0200, Jan Beulich wrote:
> On 27.03.2024 03:53, Marek Marczykowski-G=C3=B3recki wrote:
> > The IOMMU driver checks if RMRR/IVMD are marked as reserved in memory
> > map. This should be true for addresses coming from the firmware, but
> > when extra pages used by Xen itself are included in the mapping, those
> > are taken from usable RAM used. Mark those pages as reserved too.
> >=20
> > Not marking the pages as reserved didn't caused issues before due to
> > another a bug in IOMMU driver code, that was fixed in 83afa3135830
> > ("amd-vi: fix IVMD memory type checks").
> >=20
> > Failing to reserve memory will lead to panic in IOMMU setup code. And
> > not including the page in IOMMU mapping will lead to broken console (due
> > to IOMMU faults). The pages chosen by the XHCI console driver should
> > still be usable by the CPU though, and the console code already can deal
> > with too slow console by dropping characters (and console not printing
> > anything is a special case of "slow"). When reserving fails print an er=
ror
> > message showing which pages failed and who requested them. This should
> > be enough hint to find why XHCI console doesn't work.
> >=20
> > Fixes: 3a1a7b809ffa "drivers/char: mark DMA buffers as reserved for the=
 XHCI"
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>

Hi,

Is any ack missing here, or has it just fallen through the cracks?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--gIMOllW2eE6Vd1E3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmYbJCQACgkQ24/THMrX
1yyKwAf/aj+4GRRnfb3H2tiyg/cvNiJQoHqzAzBVyaCf5oksbV0D5GBywFy3W7OE
VUDx5GPygER7xPtwQAP+DG462vV7uLhgttaLU4Dh2ixRiEqOVddItlYUEGEmYf+5
5bDtXfIVZiWV2+DjDkYXccxfH2FFtiUjzFCAtxsX8zq2rrNV7FGeCJDnuVDl/smh
24ts3R8JXsJ1MewUNv3n2hl8p0xaURlTN2+WZNiCB0kAkdTlMOIz/mfuM6VRnydJ
P5LvCKDZCB4ysM1Xx+e2W24xJu5d6ochsH3i7Gy8inliKw7SbSYcz4vCWIjqIknq
+mqI+qyueoV+ndPReqx2NfUu5dMPdQ==
=tu5o
-----END PGP SIGNATURE-----

--gIMOllW2eE6Vd1E3--

