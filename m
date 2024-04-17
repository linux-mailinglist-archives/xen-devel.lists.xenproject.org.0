Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1F18A85E8
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 16:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707546.1105568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx6Dt-00024H-JH; Wed, 17 Apr 2024 14:25:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707546.1105568; Wed, 17 Apr 2024 14:25:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx6Dt-00021d-G7; Wed, 17 Apr 2024 14:25:17 +0000
Received: by outflank-mailman (input) for mailman id 707546;
 Wed, 17 Apr 2024 14:25:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QKhp=LW=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rx6Dr-0001zx-Rj
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 14:25:16 +0000
Received: from wfhigh3-smtp.messagingengine.com
 (wfhigh3-smtp.messagingengine.com [64.147.123.154])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b8b03f6-fcc6-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 16:25:12 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfhigh.west.internal (Postfix) with ESMTP id 116EC18000FE;
 Wed, 17 Apr 2024 10:25:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 17 Apr 2024 10:25:08 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Apr 2024 10:25:06 -0400 (EDT)
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
X-Inumbo-ID: 4b8b03f6-fcc6-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1713363907;
	 x=1713450307; bh=OWF9dO4KiU73KW7hD0J6XxcMGffKB4Z1eCxT4PQVlfk=; b=
	nI+WDVCUxjK8qu8RQKveZTux63ZjGkvIe7IfwqHiHrcuh8yrE5djhqg2mSR7eHDn
	3sz5S8vJy7l+UvM27/yykiIhe2jKsSBAAwNJaUZRLtpphUds6opFHsH3GEA+gOKi
	SRCdN+RWI76FcsRUH2fxDSW8YClwKPJevDWM3B4VGXlWRAGqd+GzNvSWrNmkStaK
	0hOhkj03z/3xGUqud2juV77lLbS71bHCZdb6Evmbp+Nyso3VE4qP1mGvV0GkSRZ2
	cbjMEQy7RbYThhUiI0rjq4YSQLAtO4TVWsxcFZE/JX2fDQhQFzMYpX36MM2iVqCi
	TInXtDMqnRD41iqjbg8HGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713363907; x=1713450307; bh=OWF9dO4KiU73KW7hD0J6XxcMGffK
	B4Z1eCxT4PQVlfk=; b=OakGW61Y18dE2MtgMlJU5FW8SjMcOFe6i2diAdG7TqiC
	Qh01cgjUoYDkSh8mdN1S2SubRcyYKohiApD/5LI28it46Wped2oN/akIGCqwPE4F
	HPc0FnPgRu5/oBw19nmC5GKqumU/IuN5kojfVKZzeP4cLgQBjGb/YE4rO4joVFAZ
	LSA/wr38jGahmPr+4rqwvz69zGm3hRJIthTWOKq4UxzV+bjgE1Up6kT1xFGQuBhf
	q952nTEEX935vHqX6/71aUG/orjIjI37t4TDuZcuASAvHKcyJ76dJkWF7/6E5BWh
	ebW5pImGWcjgHMN2b5OHitPx5brznIG2ZUzRdCe0Fg==
X-ME-Sender: <xms:wtsfZoFl4C6_fwrilc3wRdhVYeSAl5xT-8AATtCP5vjltWNM0r5K6A>
    <xme:wtsfZhU6n0n26hKv2lVipR3-xEok7NyJZ63EwQEhEqlzKgCfWpPN9BMl49743wsjT
    t4l8LOrcjLqBQ>
X-ME-Received: <xmr:wtsfZiLxth_q8UCUPR1WMabqahLZSB4IK7jEHX3WieJBuWcgpPmRnsNNFCRQjuWVLArDmwLp9Lljjd6TsUFtVy47rGYtUEgq_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudejkedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:wtsfZqGjxOm7vxCQAYA1ZiTHHbWmBeeudGDxtX95v-5dhmIc6gqnxA>
    <xmx:wtsfZuUVbOaWqt8w7i9-uHIQZnnX4cVSKOqa6WBwL0zmrygBsKdyxA>
    <xmx:wtsfZtOss32UXxsybs4cECmSuqkRhEwCuPvuqO0jo480iuL25lqGgA>
    <xmx:wtsfZl2557Eg9KiR4bBzCTEGsGU8OOSuzptBw68wyfywTU6CNIWVlA>
    <xmx:w9sfZtS5p7kIaSsMRqUMu5t-l9oBp7M4HSNe2VBtaBp7KblhSbQ0ZmYH>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 17 Apr 2024 16:25:02 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 2/2] drivers/char: mark extra reserved device memory
 in memory map
Message-ID: <Zh_bvtvVAq35A5mI@mail-itl>
References: <20240327025454.514521-1-marmarek@invisiblethingslab.com>
 <20240327025454.514521-2-marmarek@invisiblethingslab.com>
 <0d7daae5-97c3-4982-8301-7ed2fda24ff9@suse.com>
 <ZhskJAL1fz3lNdg7@mail-itl>
 <4324974a-0a0c-4d81-87c0-6b7d27d2ff46@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Jz0btK6xw1y2YmMV"
Content-Disposition: inline
In-Reply-To: <4324974a-0a0c-4d81-87c0-6b7d27d2ff46@suse.com>


--Jz0btK6xw1y2YmMV
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Apr 2024 16:25:02 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 2/2] drivers/char: mark extra reserved device memory
 in memory map

On Wed, Apr 17, 2024 at 04:17:48PM +0200, Jan Beulich wrote:
> On 14.04.2024 02:32, Marek Marczykowski-G=C3=B3recki wrote:
> > On Wed, Apr 03, 2024 at 09:10:40AM +0200, Jan Beulich wrote:
> >> On 27.03.2024 03:53, Marek Marczykowski-G=C3=B3recki wrote:
> >>> The IOMMU driver checks if RMRR/IVMD are marked as reserved in memory
> >>> map. This should be true for addresses coming from the firmware, but
> >>> when extra pages used by Xen itself are included in the mapping, those
> >>> are taken from usable RAM used. Mark those pages as reserved too.
> >>>
> >>> Not marking the pages as reserved didn't caused issues before due to
> >>> another a bug in IOMMU driver code, that was fixed in 83afa3135830
> >>> ("amd-vi: fix IVMD memory type checks").
> >>>
> >>> Failing to reserve memory will lead to panic in IOMMU setup code. And
> >>> not including the page in IOMMU mapping will lead to broken console (=
due
> >>> to IOMMU faults). The pages chosen by the XHCI console driver should
> >>> still be usable by the CPU though, and the console code already can d=
eal
> >>> with too slow console by dropping characters (and console not printing
> >>> anything is a special case of "slow"). When reserving fails print an =
error
> >>> message showing which pages failed and who requested them. This should
> >>> be enough hint to find why XHCI console doesn't work.
> >>>
> >>> Fixes: 3a1a7b809ffa "drivers/char: mark DMA buffers as reserved for t=
he XHCI"
> >>> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethi=
ngslab.com>
> >>
> >> Acked-by: Jan Beulich <jbeulich@suse.com>
> >=20
> > Is any ack missing here, or has it just fallen through the cracks?
>=20
> ??? (commit dd5101a6169f89b9e3f3b72f0b0fcdb38db2fb35)

Oh, sorry, somehow I missed it. All good then, thanks.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Jz0btK6xw1y2YmMV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmYf274ACgkQ24/THMrX
1ywfywf+OmmCL/Y1qmRF6Ba9u5B1R9ky1Nu2XZ42s2TZQeXSSbtsw5KdcqOIE/2x
8D68bpGDnz6BbKIzXMXdCNw3wg5/N/geJ79uCylv/ZsTO+wztEX/LZLL3DSZYbBK
j4o0ElZ2ivvVt0AFO+njgEUDijQy99AWfjE/VafMSAW238aRS8Ppsqyw1ZZeY3t1
BAJK1Darz70zcS4Dtt2Qsy47G2MCgylH9GDLVNpHjxiP03CK2agE/RawBfI9a1Oo
1tMJO/DKh4nyuxNOf2Mt2F8/GBSSR1GAq7rCheJuv0An8nXyRp7gYt+WSkbva6Zp
K9tHwr9XAAJSOLtBJKZFJr4mG6A4eQ==
=Y3DV
-----END PGP SIGNATURE-----

--Jz0btK6xw1y2YmMV--

