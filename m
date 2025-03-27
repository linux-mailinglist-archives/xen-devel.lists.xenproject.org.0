Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A2EA74092
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 23:03:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929946.1332688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txvJY-00023K-K9; Thu, 27 Mar 2025 22:03:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929946.1332688; Thu, 27 Mar 2025 22:03:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txvJY-000214-HU; Thu, 27 Mar 2025 22:03:04 +0000
Received: by outflank-mailman (input) for mailman id 929946;
 Thu, 27 Mar 2025 22:03:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbs7=WO=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1txvJW-00020i-TH
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 22:03:03 +0000
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f3d1fc1-0b57-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 23:03:01 +0100 (CET)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id 973351383828;
 Thu, 27 Mar 2025 18:02:59 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Thu, 27 Mar 2025 18:02:59 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Mar 2025 18:02:57 -0400 (EDT)
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
X-Inumbo-ID: 3f3d1fc1-0b57-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1743112979;
	 x=1743199379; bh=zf6tcG4o+mDyKdiFDoblfnPavaAiQxh5rvU4VR14S+8=; b=
	qsNR2WJXh0ESyAevQdyM0s+kTsYJKnIQvdDm3r1+gxiDTpGnJ+5FQTQ/MgDH3NwJ
	2hMHrzA4e0giqKUsGhBI0jwpIcFr5czvEs/F8QXJQ6Q8aTKM/ZelhgxT8bXqYo5x
	Xl/5j0FVEakstUZ81rCPzZGfLNG72xxoSyVp55ZFBOVp443Mi2rOwGI536l++VVF
	Llq/4HpgVx/77N/0ECiGVwJv++N9N1bvBHUt+LDMYTyTYg/HVw6wpKMVLn2ThkuX
	G7LHXCft+8/OBAI+Z0pr2n0KqAv1Gam5cXVSVT0WjMKU3QZkemdww/RE7cJk2bPA
	sdkZXdv6CYWoPaEspsPEZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1743112979; x=1743199379; bh=zf6tcG4o+mDyKdiFDoblfnPavaAiQxh5rvU
	4VR14S+8=; b=N6f1yw83MqtHv7p51hGZ4/SC9oMZL5ghc4xXWl/8/8u70ACDeqk
	dNogg2QuxIKOIS6hmPk6uMIQWJD1/JWshj7CsubHhmHTPqzc6Jbl/+DlSYaWl3st
	VqQ+hhyEbix1QoI3lQsS1mbVJcAEhFL1Gm/7SStAbcws498So/VsU7RNwDlalZol
	X8XfMTi+8eu3UpoQSghWVpIPlewY3xIekZTRD49/XISNwCwGxlqW8LCdC5xo/m5O
	HAxOrvQudpVsOiLNPHDhdJqMV3jVZrzGbqLxSJ3HM2jG2emubrrYvVPyqYY6yuXS
	wK6zQOzMGscUDWrNDrtSV1qekKtdUD/w3OQ==
X-ME-Sender: <xms:E8vlZ1z1CZECBG6_Mp88bOnx5cVJzJ7563QxTDbOEBT6m1Vg5bVMfA>
    <xme:E8vlZ1Q8dPTy3XJ9psoljGwXy2NVVE9pGqXeydQ38V8IRZAzpKoS7j6YKriUamXzc
    nkM62tbWETC0A>
X-ME-Received: <xmr:E8vlZ_V_gfDRcqKSkoKoYjun8rxx3ZNQYmiEx2Mvfhzp70sF1PS9i3xXg91oD4s2u9F4chSXx9UvrPqXyDpXgLtN4QuCoC1lRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieelheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhgr
    fhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjsggvuhhlihgthhesshhush
    gvrdgtohhmpdhrtghpthhtoheplhhinhhugidqphhmsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqrggtphhisehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtg
    htrdhorhhgpdhrtghpthhtohepjhhgrhhoshhssehsuhhsvgdrtghomhdprhgtphhtthho
    pehrvghgrhgvshhsihhonhhssehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoh
    epvhhirhgvshhhrdhkuhhmrghrsehlihhnrghrohdrohhrgh
X-ME-Proxy: <xmx:E8vlZ3gF2XCjuE75JMfKey6xrB1KDGRQwSB_Zz6rqhIbDMaKJZLc_w>
    <xmx:E8vlZ3DoNF4kDwtCT45CbwA5LkLTnRd0bcWStq-gcl9gnbU4gog0Ag>
    <xmx:E8vlZwI0go199P1aByq75PTaH84a6wHiOqFoC7FoGejgKNr_2rX-VQ>
    <xmx:E8vlZ2CCn1vcZv2vExq2Hk9im0zGshq2jPezirMyu7rIzarY0KBqVQ>
    <xmx:E8vlZzt0mvB-6kPl_WJA76SfockTXV1N1Ln2adtM3Q1OSqVbbDFu_rtq>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 27 Mar 2025 23:02:55 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>, regressions@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: NULL pointer dereference in cpufreq_update_limits(?) under Xen
 PV dom0 - regression in 6.13
Message-ID: <Z-XLD9FVjqKPU3hO@mail-itl>
References: <Z-ShAR59cTow0KcR@mail-itl>
 <3796f2d9-738f-4cdf-a4a2-61c4aa99c310@suse.com>
 <CAJZ5v0jn_gv92ywZiTZDdGN3Z+GNW0BJ5=kBD=8MpQ0Pt+y8TQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n/zi9pJWB1Be1f5W"
Content-Disposition: inline
In-Reply-To: <CAJZ5v0jn_gv92ywZiTZDdGN3Z+GNW0BJ5=kBD=8MpQ0Pt+y8TQ@mail.gmail.com>


--n/zi9pJWB1Be1f5W
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Mar 2025 23:02:55 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>, regressions@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: NULL pointer dereference in cpufreq_update_limits(?) under Xen
 PV dom0 - regression in 6.13

On Thu, Mar 27, 2025 at 12:02:24PM +0100, Rafael J. Wysocki wrote:
> cpufreq_update_limits() needs to ensure that the driver is there.
>=20
> The attached patch should address this issue, Marek please verify.

Yes, it fixes the problem, thanks!

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--n/zi9pJWB1Be1f5W
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmflyw8ACgkQ24/THMrX
1yyKGAf/RTH6B+NEeQIKDnBlfNysIHdT/cbPalXVBjdTpKXKuIyi+gjpm4pFpLU0
EVf8sCTXe2zXKAWmTJ+g1kwocHEAu94lm78QAn2Y1ZP98e7czfVy0zqpMfOVOfW4
acaKrf6R30uzDAW6RNmFk4BwGS2wHhQ2qt+pn9Yz5OQd1mNaZFguHhqnPn6ceRnO
zG2W8HJRoQjsqG5r/JQ/ouKhXVMU9HMq14OQLANb6Q+GOuWuZ3HmRL+ZtG7O9+H5
AYbqeIoIH1XuNLkb69GdoJcyfV+LMKoagGYumGsfhR460h/O9LA8lpKher86U7ig
XH40zoYMGASoWX7KueC+Bb7uKv4XkQ==
=Zu1I
-----END PGP SIGNATURE-----

--n/zi9pJWB1Be1f5W--

