Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7128CD597
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 16:22:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728541.1133486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9Kg-0004Cm-6b; Thu, 23 May 2024 14:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728541.1133486; Thu, 23 May 2024 14:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9Kg-0004B9-3h; Thu, 23 May 2024 14:22:14 +0000
Received: by outflank-mailman (input) for mailman id 728541;
 Thu, 23 May 2024 14:22:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TXgv=M2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sA9Kd-0004At-W8
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 14:22:12 +0000
Received: from wfhigh6-smtp.messagingengine.com
 (wfhigh6-smtp.messagingengine.com [64.147.123.157])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d622ffa1-190f-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 16:22:09 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfhigh.west.internal (Postfix) with ESMTP id 3727518000B8;
 Thu, 23 May 2024 10:22:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 23 May 2024 10:22:06 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 May 2024 10:22:04 -0400 (EDT)
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
X-Inumbo-ID: d622ffa1-190f-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1716474125;
	 x=1716560525; bh=wch4MQuvuoO/P1pJrQteF14ohcPjgykADHYQkfDfatc=; b=
	BjcgLiWmlR+xaH9GdQ+d4rEO0sgf1GtMiJTZCRcF2zSw5Kb+0LoFJUg6976wp0cm
	t78HTUzGk4MTKKLTRn67hNwkhj+5o20lLxhTFlwU84aJM65PwxGPhUnu7xWeud+x
	QB+lI9j2OPhzDy0Umf04mbO1KPrz7VwsU4wXCT5+irBQzllMu9m5rD609MYWwoYp
	exZXfrNmJq1qElVb/RdjYSaBJuFp8CUMF0Ey4UiXiKiTsFToWrbv8XKC1kvRH6TZ
	vtL++6GaH35hBfw2Dg6UT5514poW1hfDYl9x7x1WCVfpv35OrZW1QsJPJSygI90U
	Bi+DhF4Cfbupyorsh0dgbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1716474125; x=1716560525; bh=wch4MQuvuoO/P1pJrQteF14ohcPj
	gykADHYQkfDfatc=; b=nXStMfr5tSxpoaGYxfs9eR5ys1YlaSRcGOiZMCyL7b6c
	5nxMWORJPS78UC+XIB4Q+N0srgF0xsC8l6ML6i+cs+W8r3wwF/NfTBNHWb35bgu3
	tKWXUi0+akkgOiqRW8djPIfpi+FMPwvmrQfEL99AW/mVfs1qN4mWaEWec6Z1F9rE
	tLB0SHzQeVTA2iGmSblsIk48DVh8sCDK3v4C5Nd4M/DdYeSAQ4QDkH2CAJFbTKqu
	qTyX19n0kLKGKWpjt7jxCqYIWDsTv9v4A97EAgy72AxwWyfFCgO5tO3595nhZ1Qz
	rwwqQQtoZsfmiyGNN9COytqPKGnxYFgOwPdQd6uVvQ==
X-ME-Sender: <xms:DVFPZo6JxlmxbjnlJCMmWAfkTl3J2M98Yrzu6PmuCIacdm5MP8xHug>
    <xme:DVFPZp5B_NOC9mvzlB3F5fRAbub8RE-kolDJp-ntVB7OLJLImRSvap9oB917eNjRh
    Ii2AYuxX_JYgQ>
X-ME-Received: <xmr:DVFPZnc8ZF6PD1bRfxiorjRvjlbby8YU-7OUp9tBnry9tnM1nr1puBTcpT5avmQ7xFnmUlVBSph1GkUSOCi9yW8Pq9WSxK5etQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeiiedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeehvedv
    ueevheekhefhvefggffgvedugeetuefgleeivdehgfeuieeugfetteeiffenucffohhmrg
    hinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:DVFPZtIUmHNW2D4JaLvhXFGe1S2wjA3kWzq3x1vifkP7hPMtOIqy0w>
    <xmx:DVFPZsJNUWRXYr3juwd1PRUj32Gc9fAIIApk4My0DTFIfeg-bEUlaA>
    <xmx:DVFPZuwDOS5Hb-RMH60J-idNbHecnjLj-pLoWJllAbkcqBezT2KUHQ>
    <xmx:DVFPZgJF-p9Mt_C724P9KhikDW0T6AR9GU5UY_UAdSTtXdRlNU4cNQ>
    <xmx:DVFPZjWRm-UWZrne_iD3FxfmNc5UQ9uO2ZotSvVGIq7qC0YaVNRvWQRN>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 23 May 2024 16:22:01 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 0/2] Add API for making parts of a MMIO page R/O and
 use it in XHCI console
Message-ID: <Zk9RChKHBa4mQAVj@mail-itl>
References: <cover.68462f37276d69ab6e268be94d049f866a321f73.1716392340.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NVX2/ut/877rVt3E"
Content-Disposition: inline
In-Reply-To: <cover.68462f37276d69ab6e268be94d049f866a321f73.1716392340.git-series.marmarek@invisiblethingslab.com>


--NVX2/ut/877rVt3E
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 May 2024 16:22:01 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 0/2] Add API for making parts of a MMIO page R/O and
 use it in XHCI console

On Wed, May 22, 2024 at 05:39:02PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On older systems, XHCI xcap had a layout that no other (interesting) regi=
sters
> were placed on the same page as the debug capability, so Linux was fine w=
ith
> making the whole page R/O. But at least on Tiger Lake and Alder Lake, Lin=
ux
> needs to write to some other registers on the same page too.
>=20
> Add a generic API for making just parts of an MMIO page R/O and use it to=
 fix
> USB3 console with share=3Dyes or share=3Dhwdom options. More details in c=
ommit
> messages.
>=20
> Marek Marczykowski-G=C3=B3recki (2):
>   x86/mm: add API for marking only part of a MMIO page read only
>   drivers/char: Use sub-page ro API to make just xhci dbc cap RO

Does any other x86 maintainer feel comfortable ack-ing this series? Jan
already reviewed 2/2 here (but not 1/2 in this version), but also said
he is not comfortable with letting this in without a second maintainer
approval: https://lore.kernel.org/xen-devel/7655e401-b927-4250-ae63-05361a5=
ee71d@suse.com/

>=20
>  xen/arch/x86/hvm/emulate.c      |   2 +-
>  xen/arch/x86/hvm/hvm.c          |   4 +-
>  xen/arch/x86/include/asm/mm.h   |  25 +++-
>  xen/arch/x86/mm.c               | 273 +++++++++++++++++++++++++++++++++-
>  xen/arch/x86/pv/ro-page-fault.c |   6 +-
>  xen/drivers/char/xhci-dbc.c     |  36 ++--
>  6 files changed, 327 insertions(+), 19 deletions(-)
>=20
> base-commit: b0082b908391b29b7c4dd5e6c389ebd6481926f8
> --=20
> git-series 0.9.1

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--NVX2/ut/877rVt3E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmZPUQoACgkQ24/THMrX
1yyBAgf+OY4AI4FifIusRtmZbKOTGwbDJwPe3rQRQvQIoc2uzQwcYWNiirQdxXR3
8F+ZEL1/IWAC5jJk5kK5guXBFUXhLy0+ni6tfO/jlRg6P468eoIWrHvQ0vtyFcUF
QWjk5MXs2UmPnSY+6FO90sZCU5CXv9E5T5xIXzm2IQGWyQtA5GHBBaGsDdPnsekN
ccrwinyhyVvGSruXHnRpIyCM6Ghmw4Zyq0LpRRH9Mpxw8QiY8OU1mEuHi4txkHTZ
O5RdlHc+nDg40xpY0S9GNzbm9mh9I/blzV+twHkOb+lTCzXq3UfqTH29kKdK6VVO
N427hpmTrAYKGUPuqAZLtmo+c4M5Ig==
=N8As
-----END PGP SIGNATURE-----

--NVX2/ut/877rVt3E--

