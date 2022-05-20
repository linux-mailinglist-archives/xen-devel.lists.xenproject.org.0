Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC87F52E9ED
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 12:33:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333706.557572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrzw6-0001hQ-T8; Fri, 20 May 2022 10:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333706.557572; Fri, 20 May 2022 10:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrzw6-0001fc-Pv; Fri, 20 May 2022 10:32:46 +0000
Received: by outflank-mailman (input) for mailman id 333706;
 Fri, 20 May 2022 10:32:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dOI6=V4=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nrzw4-0001fW-6L
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 10:32:44 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ce7e0a0-d828-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 12:32:42 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 33E625C0269;
 Fri, 20 May 2022 06:32:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 20 May 2022 06:32:40 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 May 2022 06:32:38 -0400 (EDT)
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
X-Inumbo-ID: 2ce7e0a0-d828-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1653042760; x=
	1653129160; bh=TXyd2jwAtc+G9T46sH/m7OiAUHw3FJC24Trx9vtVOUM=; b=l
	05wDjaojTJ2zpN48OzB4bkFR9orW/fnoLQNQch3AnJzrRQ9WdpGyyJn5H4hBmBvZ
	WXSFohQRwW3uYBcK8L5lcHR0G+qwYuPzQalnIDu4d+A1AzYZC/CGHKB+mzwazMRM
	psigInw/+257JIAq1SUuSC+Q/FQLjkW3ZwZO1I5NCahGBvLl7Im5JPKKGWc232Bf
	n5GXxBZagSxipdYWwJ6uq/S8f0PgWyiu6rYPfASF96OEbMSXhryl4oWbGZo7Y+xD
	8L+113TMH/+IM8IkqlkmexQLENR1I8g9GlK2YDJEel7Cg0jJGvNPFdTK/ymPECuB
	gDpjAuIC2BdlqWySo2vQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1653042760; x=1653129160; bh=TXyd2jwAtc+G9T46sH/m7OiAUHw3
	FJC24Trx9vtVOUM=; b=E+l89lGaaP+6gAI5rrQjHZ+ft+zcQKDZV32ae9IgTlzr
	G+KR7hxKytaUXsfDkr0qeM4VyS7BtZ+RqGjbsnXcw9GG0+YoSG5nphJAJhHEGwi+
	onWGKxCvCMMza+w50dMzpiWbAIYnthpec/13uZZG9e+xTWYRn7V/BMpurH5yf+Rp
	ZhQshLYzgtaWJ9ksH5t0lkY12hp7vnrvPndNEH0Q2lkOlFTLmxcGf5OX1KyCAWcD
	Kjt2f0SH0VfQO7aL5e2eaZ2ENedwfD+muvfSfjysapgoeQ2rTz4HK9GLenHpup9z
	wxFPIbQYPGcubbuTLW10C98rYZWrtuGkRdV8BZ2MCg==
X-ME-Sender: <xms:R26HYn4f420CGPlAQGJWJtgQuMMmZBB26ymCik-fLJiGPKPWmYglbQ>
    <xme:R26HYs64HWwZpV0yUf9gwz-g85JXd1t6J8ABTLq4kN4BgkuS1OHyB81IjEoPz0Mk6
    tdvzUwdF0ZPQQ>
X-ME-Received: <xmr:R26HYucb-bWYomSIqN5Cxn2gGor3N3fL9VCdI0Oh2Ub7neGOYSttv4PHcxo7LZh4pBA1hqIhz8xDOzWTdRoXud0gkbVJfkfGvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrieefgddvjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:R26HYoLX-ZniN_9wPJVU7cFrw6LCy2YFxC4Mw-all9wI_tIeRsP-4w>
    <xmx:R26HYrJSG6tUYzv9c5OAwQjT2MvEVa9Jq1KYCgT5jwQlfDtscmJA_Q>
    <xmx:R26HYhy-7H9ENIwlxOvyFTE6LD4sfu9pwwDLgaMLjJD32p74y7IHjg>
    <xmx:SG6HYoF25LXv_FlxUl59t5Y8SEmUGcYjSeq22ypnQTzwXE0e6KavKw>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 20 May 2022 12:32:35 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 2/2] ns16550: Add more device IDs for Intel LPSS UART
Message-ID: <YoduRJw6/Cd0ozL4@mail-itl>
References: <20220520085343.1835866-1-marmarek@invisiblethingslab.com>
 <20220520085343.1835866-2-marmarek@invisiblethingslab.com>
 <663a03ad-9df1-173e-19b1-4f4af1aa9b37@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g4A2vc3PI9AlducC"
Content-Disposition: inline
In-Reply-To: <663a03ad-9df1-173e-19b1-4f4af1aa9b37@suse.com>


--g4A2vc3PI9AlducC
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 May 2022 12:32:35 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 2/2] ns16550: Add more device IDs for Intel LPSS UART

On Fri, May 20, 2022 at 11:42:37AM +0200, Jan Beulich wrote:
> On 20.05.2022 10:53, Marek Marczykowski-G=C3=B3recki wrote:
> > This is purely based on the spec:
> > - Intel 500 Series PCH: 635218-006
> > - Intel 600 Series PCH: 691222-001, 648364-003
> >=20
> > This is tested only on TGL-LP added initially, but according to the
> > spec, they should behave the same.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> Oops? Commit 1f0b1f5cce9d.

Right, I haven't fetch new master. No changes here for several
iterations, so everything is fine.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--g4A2vc3PI9AlducC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmKHbkQACgkQ24/THMrX
1yzVawf+MR7Xp1jDHLPL6l4O6M7MINpcDf+sJnBMj+mkaYAi5UheRw5VHTMkBYEs
HxReVlNPnQCDlUvx1hUuLOyPuPDb0FmOag5D6gNl7mlpEVV4q/mX0SznPAeC51N0
3XcDAcMUIVylvjVJRkrWnZJl6X6yibzzw8DqsgrdtHonYFLciLPeS5EMzAOKoN/a
rfpa9V7ZF2l4go5WUBpyFQE6QnsuVwR9ybdyrXLa6FxwMkUUS50kUkhe+QuJEsfE
SK3BxlgTTxsIFy7XdCBFUzIaK1dAxAjl5S1Xee8VHp7p4M0SSKU4eR7qFNnIzmz6
ZvmkFWztSBQDOVQlng1IsVKHJu+UBg==
=BJ05
-----END PGP SIGNATURE-----

--g4A2vc3PI9AlducC--

