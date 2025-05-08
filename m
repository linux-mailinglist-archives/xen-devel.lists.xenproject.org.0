Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D93AAAF7D2
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 12:31:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979224.1365916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCyXd-0002pc-0n; Thu, 08 May 2025 10:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979224.1365916; Thu, 08 May 2025 10:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCyXc-0002nR-TX; Thu, 08 May 2025 10:31:48 +0000
Received: by outflank-mailman (input) for mailman id 979224;
 Thu, 08 May 2025 10:31:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LuaF=XY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uCyXb-0001eT-9B
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 10:31:47 +0000
Received: from fout-b5-smtp.messagingengine.com
 (fout-b5-smtp.messagingengine.com [202.12.124.148])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3554a4c-2bf7-11f0-9ffb-bf95429c2676;
 Thu, 08 May 2025 12:31:45 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfout.stl.internal (Postfix) with ESMTP id 29D461140106;
 Thu,  8 May 2025 06:31:44 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Thu, 08 May 2025 06:31:44 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 May 2025 06:31:42 -0400 (EDT)
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
X-Inumbo-ID: a3554a4c-2bf7-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1746700304;
	 x=1746786704; bh=B0EPi84e7/VOCLlVJjqRSlFSmdqIi5vIcf35n7RzJuA=; b=
	nnhyMd0hUn5ekRRg3omIx4/mbuhbQYkaazgagz3j/DsUc1HymXl7+utqhosQf39w
	R7SciCSE0IorjGU3pcV4PQE7eWJ3OtGpMrgQKH5tboHJSWjbvIVS5ENk72WFNfXQ
	Ww+CRvF8jMVoBoI/8SOoRPF4I4w5vpcYJhif6m/17NA1U/QHLgEHfH5DeMS+swf3
	FiTwOWMX2rsdeKJXBmZxZnLDzDw57nbLxzPE4n3ZCvXwBJFNxROZqZUIEEGVGihv
	ZZy5JMbc5+R3EfKX7Z9RzU5/nyrHVaF+wmvEg6CPVi0jn4crPHYMAdw8PNIBaqXW
	PBJGjIcAMMDS5SLrCFmu4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1746700304; x=1746786704; bh=B0EPi84e7/VOCLlVJjqRSlFSmdqIi5vIcf3
	5n7RzJuA=; b=gyYoF+Tou/ktqpN7Gp8leheQauo9rRMMZ18ISMy/y+Fxehegy43
	U5o4q9X+j3PttZEIlAAw3Bt2z4NTo9f/aCybVGJX6ykDSsk/g/0yJ9MnxUWG7/GK
	4CsICoSpoLlQCucDeaO94eQM2Flk19DCRm0djJ9dJznKM11w9S8R6ooyHR3ULRwJ
	LPG70bymZNrVZIjp1hg7V1OWYsnXvvNWcy4uJsfNo6Age0Z4frlBfmIdvCnMMnEn
	HYEKDbn09RKLrKdvmIfA4QmRRV+oBsYEP8ljr8a8QHVthylaWl0ApU1TBSuISx3Q
	3woZb1CuM8xYXdqjzzhBe+4ABkNnfkveUAg==
X-ME-Sender: <xms:D4gcaFGKmOo0Tz0HAmLcm4X7T8D5hDpfmzvpsjC2e8xBnGZviO0PEQ>
    <xme:D4gcaKXG2feiU78UUlSE038WgyjlWl87PFRu69uYwoSX7JIVgw0Z7j45jJEGP91jE
    pD4Rni_du2M4Q>
X-ME-Received: <xmr:D4gcaHIqrl2ujwq3tmH7pu_vXpiA3MzGHzMLrOy8cmbbFG6O_n4a9-OfHRMOa0J-mCiiv8ASCWbN5BllL9GzMB6Tia9yJFEd1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeelhedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghn
    ughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehgvghrrg
    hlugdrvghluggvrhdqvhgrshhssegtlhhouhgurdgtohhmpdhrtghpthhtohepgigvnhdq
    uggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepug
    hpshhmihhthhesrghpvghrthhushhsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohep
    fhhrvgguihgrnhhordiiihhglhhiohestghlohhuugdrtghomhdprhgtphhtthhopehjsg
    gvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtoheprhhoghgvrhdrphgruhestghi
    thhrihigrdgtohhm
X-ME-Proxy: <xmx:D4gcaLHqRZ9DdDAmRnoaGyPT9TnVxcmLkXlScMB6c5GlSQckeDoLTQ>
    <xmx:D4gcaLW3D7eOmQ2crrVtAsrhQWunkvutiqRCOIquOVY8klhufbVZ0A>
    <xmx:D4gcaGNygOK1QYK-6iZzET5n-W1kJnIQo0MGkc1dMPl-JJND-YTGNA>
    <xmx:D4gcaK03V5cXjLxsqyyqpDV_gsad0Iq9IqYtuyevOTzJDixc6-iD3w>
    <xmx:EIgcaC3yM1LSrSv6mKzM84O_cEpJTg1_y_86oOTYCSLGEb_kdV7tgaGp>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 8 May 2025 12:31:40 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	xen-devel@lists.xenproject.org, dpsmith@apertussolutions.com,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v3] sbat: Add SBAT section to the Xen EFI binary
Message-ID: <aByIDP2iEHjmo99t@mail-itl>
References: <20250507135442.3439237-1-gerald.elder-vass@cloud.com>
 <94652153-99fe-47d8-84d5-cbf2865ad6e0@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aBxSmMj0cUHPezIt"
Content-Disposition: inline
In-Reply-To: <94652153-99fe-47d8-84d5-cbf2865ad6e0@citrix.com>


--aBxSmMj0cUHPezIt
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 8 May 2025 12:31:40 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	xen-devel@lists.xenproject.org, dpsmith@apertussolutions.com,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v3] sbat: Add SBAT section to the Xen EFI binary

On Thu, May 08, 2025 at 09:51:59AM +0100, Andrew Cooper wrote:
> Also,
>=20
> > ld: warning: orphan section `.sbat' from `prelink.o' being placed in se=
ction `.sbat'
>=20
> This is because sbat.o is getting linked into the non-EFI build of Xen to=
o.
>=20
> I'm less sure how to go about fixing this.=C2=A0 There's no nice way I can
> see of of getting sbat.o only in the EFI build.=C2=A0 The other option is=
 to
> discard it for the ELF build.

This is kinda related to my question on Matrix - is multiboot2 binary
also supposed to (eventually) support UEFI SB?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--aBxSmMj0cUHPezIt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmgciAwACgkQ24/THMrX
1yz82wf/dEl9brIiYv4zkUEO1g/4ynmWxF28rTb6iXlZ42vIocPDPUSOmF9xIpwv
i+5EdjS9oWnBBxCzA+pX+bQ0ipDRBFF+qnbMqPwDOoh4Dno90FaFxqyBZzAR8XCv
9QPDhUGogs+9pBuw4fond8jeudDylICpi/zHDo/+9S5yym8py8ZfG63Nh36DlwG3
zBxIDP/WaLSaXVRSFoMaT7QaE1DujD6p4M+8v63KY08bE045C0Zk5pS8Q06KzEXf
FWvdbiT1Nk8MqHorXj5vrgB/5tO57Z5lHmLLO+PyGy29M6LzAQPhQmeDO0RfdiC1
AZID4Y1xcMJpTffe3u2XYbNHg3qj5g==
=wY4t
-----END PGP SIGNATURE-----

--aBxSmMj0cUHPezIt--

