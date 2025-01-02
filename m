Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C52319FFB93
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 17:30:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864312.1275509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTO5P-0004uE-6g; Thu, 02 Jan 2025 16:30:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864312.1275509; Thu, 02 Jan 2025 16:30:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTO5P-0004rM-2T; Thu, 02 Jan 2025 16:30:15 +0000
Received: by outflank-mailman (input) for mailman id 864312;
 Thu, 02 Jan 2025 16:30:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4GO/=T2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tTO5N-0004rG-L3
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 16:30:13 +0000
Received: from fhigh-a2-smtp.messagingengine.com
 (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d559bc4a-c926-11ef-99a4-01e77a169b0f;
 Thu, 02 Jan 2025 17:30:10 +0100 (CET)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 43B4A11401BA;
 Thu,  2 Jan 2025 11:30:09 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Thu, 02 Jan 2025 11:30:09 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jan 2025 11:30:07 -0500 (EST)
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
X-Inumbo-ID: d559bc4a-c926-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1735835409;
	 x=1735921809; bh=EnrVZtCyc86uul8va4wbIgI4fjfehn1muYnUorBvgcQ=; b=
	KXtHBMHKf5I3s5LpxAmqOR85PAM55L1/7VkQUFmYufcHa8e+x1PlDbLchRc70+bK
	miYLPZW7MPbJxvt/IlzsIPod/svMsIk7zXf9grwXE7Bkg/8zHyA4gJY83jws7Goi
	hACiknQKUThukACEXpWFM7vY+Q06Kg0YY/suwMhGU9P+roYPPCXFT8hB9bvNrOV3
	L2zzxYfNBIdP9zG+8sChxQfl0Zyg4/RwJiqc36Jt+Oq5GGsIMA6gtg+5nyzqypgS
	LrUGkp5nyGNC89CXhZmg1qOiwJIjfmCWlzBbcou6WOo7ccFhsBEmT/m66tG3KU/n
	M2T7AYuCE67j9yd0vmKMaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1735835409; x=1735921809; bh=EnrVZtCyc86uul8va4wbIgI4fjfehn1muYn
	UorBvgcQ=; b=itTOLTB6hKv5vmKW3nGXv+wue+sNo/OWibquZyjkC/RxVJPK0sL
	Phjfa2LK+GT3YN9HkS/dfYOCSC2z259HfcsFShZsJm3BknrVaFaaAIBI24FfDto7
	GKOk/L5yk+HGJLwlk1hFn/OwRUJFff7UAxrKycMJ/mPzod3uBI4DZqVuI5qi96xp
	GSFLrTAO9SFd3GZXOgmSrMa0B2HFArsBaE1iNob0SAXCXP98EYM/HNwbuXIgbCn3
	qGHsr2fgrICuS69Jb+SFvrXTGu6gDMIVV/el+i8nt1LtYO3M6M/ZWSJ7BxKejvs9
	05tGpVCA5msaz/+mRnvoCOpGQTnV6LW1FLg==
X-ME-Sender: <xms:EL92Z-3bd0ttsl8-f7aK8426pz1yYxBOCP-H2yrQrDP48lN97Z-BAQ>
    <xme:EL92ZxGuEV4qrIWkuqadN8VYZZhKm8zUeGDrXWIAd2-vGuDIbgSbfYxtAbIWo7pPX
    ihq1pQAVmXxhA>
X-ME-Received: <xmr:EL92Z2679hzlJWHFkHHPq-vfsgACODMqCiXhaRpdQ-epl2nm9_YicnOxMsCFKNzz0-LZJqNPBx4FcyKoiNBy-g1tBN27Fj3jEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudefvddgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughr
    vgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqdguvg
    hvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehjsggv
    uhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtoheprhhoghgvrhdrphgruhestghith
    hrihigrdgtohhmpdhrtghpthhtohepughpshhmihhthhesrghpvghrthhushhsohhluhht
    ihhonhhsrdgtohhmpdhrtghpthhtohepfhhrvgguihgrnhhordiiihhglhhiohestghloh
    huugdrtghomh
X-ME-Proxy: <xmx:EL92Z_0NvnOqltVMOjr2rXd0ZV_dSY-GuGErqeCJyut0zAmgZ2vI2w>
    <xmx:EL92ZxEH_Y9HrPRZi5Smht4za9uLc51TllfhjKiUBGrvTNSPuX8CWw>
    <xmx:EL92Z4_kp2WlE9V8s9_qoyDfiugUwCKOmvksa6V1R3-hzSmSW7lQhg>
    <xmx:EL92Z2lcRkhiRP61Sh6LFoaiTBb5V4O_TWV5lfn47lT8EFQ_ASJlXw>
    <xmx:Eb92Z24W-EuJ85O_g6xiZHiGahaD6WrmGfiLZfxf9CQtD3RROffsroQC>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 2 Jan 2025 17:30:02 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: Re: Xen.efi "must be loaded below 4Gb"
Message-ID: <Z3a_Civ7ZZHO0uxH@mail-itl>
References: <0b4d4fa4-7d8e-444e-a4a0-f2dc677178a5@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CJh7mYvvqb/9K28Z"
Content-Disposition: inline
In-Reply-To: <0b4d4fa4-7d8e-444e-a4a0-f2dc677178a5@citrix.com>


--CJh7mYvvqb/9K28Z
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 2 Jan 2025 17:30:02 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: Re: Xen.efi "must be loaded below 4Gb"

On Thu, Jan 02, 2025 at 04:26:28PM +0000, Andrew Cooper wrote:
> Hello,
>=20
> Forwarding a bug report from IRC from before Christmas:
>=20
> ---
> bit of a random question, but: has anyone had any luck booting efi
> builds of Xen? over the last year or so I've tried 4.18 and 4.19, Alpine
> and Fedora builds, and on a Dell PowerEdge R430 and an Optiplex 7010
> Plus, and in every case received an error that "Xen must be loaded below
> 4Gb"
> ---
>=20
> The Xen.efi path does expect to be loaded below 4G, and does give up
> rather than relocating itself.
>=20
> Right now, I'm aware of at least one blocker to xen.efi being able to
> relocate itself, and that is because it populates the MB1 metadata with
> physical pointers into the ebmalloc[] region, which is in .bss.=C2=A0=20

What about not touching anything MB1-related in the EFI boot path? MB1
can't possibly work on EFI, right?

> Fallout
> related to this was the subject of c/s 0fe607b2a1 "x86/boot: Fix PVH
> boot during boot_info transition period" and a protective ASSERT() includ=
ed.
>=20
> The ProperFix(tm) is to remove ebmalloc(), and the scratch space in the
> trampoline, and instead have a range in initdata to stash the bootloader
> metadata, and use virtual pointers rather than physical.=C2=A0 This also
> avoids us double/triple handling the bootloader metadata, simplifying
> all aspects of the startup logic.

This obviously would be better

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--CJh7mYvvqb/9K28Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmd2vwoACgkQ24/THMrX
1yw8Twf8C8F8IzhFGE7yb84icLNoKHKmXtMYXkbBiz2RTT08HsxCvy1/L2p7HUX1
qa6qz9Ki3+ZHOwBCUL3dQsm3jgyiEsfb2MFVMi1CssJAY75ssyrx/Aa+utT2dp1D
cTpMQ3aUWjlGczfj0UpZ+A2Hs1TF/Y2q313EOC8oQrSSiHrZrlXMOROWkJiFYb16
85I5Pej/sXTely6JecEGCeuQAZWPrfVycKCds6oy13WMI/xKy4Lq8W2z0f2Zsvxs
ib9PBARTZlgsK1+QYPxYPdxuTvp70ccrD0i2SX6r+318YMj/1QqFAKqXMYC14xnV
s7j/DP8AawkztUjLQrZal7odBcxBGQ==
=8wzu
-----END PGP SIGNATURE-----

--CJh7mYvvqb/9K28Z--

