Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E81E879605
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 15:25:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691880.1078394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk33S-0000ZW-Ni; Tue, 12 Mar 2024 14:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691880.1078394; Tue, 12 Mar 2024 14:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk33S-0000XR-KB; Tue, 12 Mar 2024 14:24:34 +0000
Received: by outflank-mailman (input) for mailman id 691880;
 Tue, 12 Mar 2024 14:24:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jUN=KS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rk33R-0000XL-0J
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 14:24:33 +0000
Received: from wfout2-smtp.messagingengine.com
 (wfout2-smtp.messagingengine.com [64.147.123.145])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3afb0523-e07c-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 15:24:29 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfout.west.internal (Postfix) with ESMTP id 9F6971C000CE;
 Tue, 12 Mar 2024 10:24:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 12 Mar 2024 10:24:25 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Mar 2024 10:24:22 -0400 (EDT)
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
X-Inumbo-ID: 3afb0523-e07c-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1710253464;
	 x=1710339864; bh=f+1Sd5rakQHLQAUUL89pur99xCcTCbbEFtOqLetdaHk=; b=
	ZGVNKXAXL2bYSKtNR7XyI2B7GI6jV5nt2RnS7DMHsHayPi4UtT+NKFo58z30G8sV
	Md8jQ9Ampc3ohZYemchLh+F7U8jt14xcYPc8sM+UwkrKghVcOkqYL++u8puJTshe
	I/Z2MZv5t+3fhDajPRvTT2r/wZjQIsMn07clsAZzNufCGrgbIaN5/+GO3z7NiQjG
	ITSrgszHAmt07L7El9wjUHB7ZYlZnqQHZeZnKOyK5d1kBgT5FneIVIx5WpNghTMk
	/0dqSCFRV1HEOYISTKxTCF8Vd3BsP3RS8VSp+i5vOOVu5r7U+cTIPwewj1mMM3YW
	f8jaczxH/ijSE5b2K4dlTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1710253464; x=1710339864; bh=f+1Sd5rakQHLQAUUL89pur99xCcT
	CbbEFtOqLetdaHk=; b=VLWjdt2DntIhQqC7Oaotuwqv73G5Tpr9gagF2CWCEr7y
	tSZFl/41mAQ4AM5yUT5uKyt33ppyoZk1Y0RPE6DLVHqn23/mGuWZTHKE8eay8QPl
	ghtdPudcZTlwyl9noPmbdRwrrhgWg8Wz93H6yhR7rXoKK3vaYo5MCelOD3yYa5Vg
	aNsEfmqW8FlSQOp2dvtSHaQ8CcEhExCQdNRR2sc7JU0bLyyKvUqv0sAKZ5IpDbFn
	pANW20zfkeZlsEqc00mdpBng0daQfh1nQPkQ00NsUiO0dGLkxc2ptR7AgEjPKWg1
	t+BjaO9QfRzd0gbb+HzaDD/qq71BgeCJW623yuBDTQ==
X-ME-Sender: <xms:l2XwZUHW51jAAc41TrqHqzjq1-rWd5lKbei8T0SyUJoj4g0EgGxarg>
    <xme:l2XwZdW7Fk8sZxAc0yNNUk1nXYsrg7a0VdnKbAebtLaESVwOcYcPdkS3Ku5pCVhLc
    qUydBvOAQev9Q>
X-ME-Received: <xmr:l2XwZeKvK-_mHUUx-CkLRv5G-eDm7pVM2ev-0Iv-1OBGV60GzXw3KfEIuOLO7UuKKDAdAPutfH9G7ebjuQa4WN09KmF1N_SdKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjeefgdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:l2XwZWFb2noMlu6JitieWHUl_M80pE2f9Vh0v1ShPEQYnHE8vGfJdg>
    <xmx:l2XwZaXSwRQ3zK8Kj7HqknJ1dzlOHyw_M-N-7_HlkFEON9-XYHZhIw>
    <xmx:l2XwZZOKycBYP0uWt0RUQYeKnOsnTqvH6EAD4znjpolMMt4wxkHaqA>
    <xmx:l2XwZR2kcdR3kWTSfmqtbfa3H4esIPwhevOL7vXsOzfsV5i3fqC6fA>
    <xmx:mGXwZepUjrsv1ogHQG2jsOWdfhxCZFPCHTJkegFK1tkj10n-Hh21WZenDjA>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 12 Mar 2024 15:24:18 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] drivers/char: mark XHCI DMA buffers reserved in memory
 map
Message-ID: <ZfBlklSndB3djVJ2@mail-itl>
References: <20240311203431.342530-1-marmarek@invisiblethingslab.com>
 <ZfAtahcXWGqckQFW@macbook>
 <6a80ceb6-cc2a-4d8f-9a66-70063923b0ea@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pf2dGQsCVO7SeNX+"
Content-Disposition: inline
In-Reply-To: <6a80ceb6-cc2a-4d8f-9a66-70063923b0ea@suse.com>


--pf2dGQsCVO7SeNX+
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Mar 2024 15:24:18 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] drivers/char: mark XHCI DMA buffers reserved in memory
 map

On Tue, Mar 12, 2024 at 11:53:46AM +0100, Jan Beulich wrote:
> On 12.03.2024 11:24, Roger Pau Monn=C3=A9 wrote:
> >> --- a/xen/arch/x86/setup.c
> >> +++ b/xen/arch/x86/setup.c
> >> @@ -1806,6 +1806,9 @@ void asmlinkage __init noreturn __start_xen(unsi=
gned long mbi_p)
> >>      mmio_ro_ranges =3D rangeset_new(NULL, "r/o mmio ranges",
> >>                                    RANGESETF_prettyprint_hex);
> >> =20
> >> +    /* Needs to happen after E820 processing but before IOMMU init */
> >> +    xhci_dbc_uart_reserve_ram();
> >=20
> > Overall it might be better if some generic solution for all users of
> > iommu_add_extra_reserved_device_memory() could be implemented,
>=20
> +1
>=20
> > but I'm
> > unsure whether the intention is for the interface to always be used
> > against RAM.
>=20
> I think we can work from that assumption for now.

One more question - what should be the error handling in this case? At
this stage, if reserving fails, I can still skip giving this range to
the IOMMU driver, which (most likely) will result in IOMMU faults and
in-operational device (xhci console). Since I don't know (theoretically)
what driver requested the range, the error message can only contain an
address and device, so will be a bit less actionable for the user
(although it should be quite easy to notice the BDF being the XHCI one).

Panic surely is safer option, but less user friendly, especially since
(due to the above) I cannot give explicit hint to disable XHCI console.

And kinda independently - I'm tempted to add another field to `struct
extra_reserved_range` (and an argument to
`iommu_add_extra_reserved_device_memory()`) - textual description, for
the error reporting purpose.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--pf2dGQsCVO7SeNX+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmXwZZIACgkQ24/THMrX
1yxamggAlTw0NYhy7YOtjj8akdBrQceWAEa45T4OD+izM7TGkqGDHSMEqzEpD1MM
zatvrosBJJMPrCKarUohhNwQI70FNVxeyy3Mc5Fmhd8ytXIOVgWOKCZRTIwUWuHx
SXua+1FVHru/1yIWZrIA3OBBIr+Mvxo3DWxYsPh3bZzeby037vy2jUsDW9pzQnZY
OLzexEEuE8OjMM1GvuJyre6YHrrRSTMkKGROwOMaXvhzGEHkSvSMc8mn2LuXmUUs
fuQ6u3eugMxTAqCP6KsUHVLYdwtDI9s3j20jaIj/JtS905w4Za+HbB7HdUD/2YTD
H9vPWNCqLBPt9SG3yTG/LyWENl/n4Q==
=jAwE
-----END PGP SIGNATURE-----

--pf2dGQsCVO7SeNX+--

