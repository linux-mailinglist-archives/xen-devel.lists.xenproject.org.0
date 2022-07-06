Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42530567F15
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 08:57:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361805.591502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8yyV-0005fv-8h; Wed, 06 Jul 2022 06:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361805.591502; Wed, 06 Jul 2022 06:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8yyV-0005dh-5g; Wed, 06 Jul 2022 06:57:27 +0000
Received: by outflank-mailman (input) for mailman id 361805;
 Wed, 06 Jul 2022 06:57:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=91kg=XL=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1o8yyT-0005dX-VC
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 06:57:26 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3103ffc-fcf8-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 08:57:24 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F279C5C00B4;
 Wed,  6 Jul 2022 02:57:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 06 Jul 2022 02:57:22 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Jul 2022 02:57:22 -0400 (EDT)
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
X-Inumbo-ID: e3103ffc-fcf8-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1657090642; x=
	1657177042; bh=TNUF7M5+wGqWTbj7Pot6CFHrH63E3xsts9bkQ5kFXCg=; b=l
	wITBkj0ArBl29cm/yuug0jIOcaj5y5FEb2SBRFUPo6Q7NNdXx4LvPOSvmbNwb7PB
	thQABLkbfHp3xHrnMNi4UiQZTwOov7zOUVXGrGeW0wVj27DBcY21vWlZxYkShIQN
	6xyFAsLrKMdNm8F/jTJB4dBP3wa7tGx8V3FGtbws5P+Ly27DgNkNqdUWDUJ8aUBH
	M0ix6tzELxjbvhreJrMEixmgOygKtfkXj8IkS1LKGzCmRFz3IgHz15USjaAGkRcg
	5Tyhj52NvMHEaaRpCsyQfkNQVb8f4nmESazSKd8H3NTtGwVdygM3+sEIGKHF80GM
	SSO8LyaJIH7lHsySOm2Wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1657090642; x=1657177042; bh=TNUF7M5+wGqWTbj7Pot6CFHrH63E
	3xsts9bkQ5kFXCg=; b=Ob+JLYb+Q/Pe5tiUMfhXW8BZx06MBmHxBvd18k/QUQqQ
	dx1iMn8Wl0uJtcgkil2wgrPRRJKxp3oDE+7M1tR4oyiVyu8qmoRb6YE0FNZXSaNJ
	shQoGoaq/2USUQ/FP7iwFqqcGc3xj4qvKA9hhm914sZiv3RFyuBZQYrO+5B1uxTI
	iWfmg/2n2KcGFtkCwyj7LF9zoti0Oa04DmN+LB/C6LwjWKwqBl+Lqps8GpExf8rt
	VOjdqEP+C2/oQm0aqOefrs9By7GFxcJ4Ue0dCO+Yy5NObkgiyC9LM52/+Im8CPWx
	MIx/h2u7gwwT7o3brHgY6L8I60M6K4buPDnFT0nGRw==
X-ME-Sender: <xms:UjLFYm7WsgooXQ9v8U-GouKXKXMqX-9kmlAkYqj41Fx56l_eALVCUg>
    <xme:UjLFYv48KpT2M-r3QSec9xu2Om9kEwLrQ-C43QiTojAyeVuWLOO6KD8DbhjvxaSNp
    szoEuaGTuq2EIM>
X-ME-Received: <xmr:UjLFYleEUH4qqE0OmMaPEDHtXimYdQ-WyBIXMyIHDxcBgv2cVrCz8AuGuu-j>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeivddgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelfeejueekheekgeeitdegkeek
    leetvdfhuddufefgffehffehueevvdeileefhfenucffohhmrghinhepkhgvrhhnvghlrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    uggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:UjLFYjLvRdadkGFQJwphYm2rYqTEP0b35Gf--w6jzG7aYUntAQ6NWw>
    <xmx:UjLFYqKICSv3BGii_WGSaURUqjPElj_CHfSYnck07lJgVA8yV2tYxA>
    <xmx:UjLFYkxVD9aZmVpxxR3pDpED-rbrsyqG8ieKpJ2lfB6Vy2p69Pp6zw>
    <xmx:UjLFYkw1c5yzPovK83SAtshrluDJHd-jhjGRjZ8bntHfKDAC9Lhriw>
Feedback-ID: iac594737:Fastmail
Date: Wed, 6 Jul 2022 02:56:51 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: osstest service owner <osstest-admin@xenproject.org>
Subject: Re: [xen-unstable-smoke test] 171511: regressions - FAIL
Message-ID: <YsUyUCv7IAbXYwaB@itl-email>
References: <osstest-171511-mainreport@xen.org>
 <a9a8276f-725a-db6e-8223-a9e6060f7700@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cgtH4Z1nbZSnYISY"
Content-Disposition: inline
In-Reply-To: <a9a8276f-725a-db6e-8223-a9e6060f7700@suse.com>


--cgtH4Z1nbZSnYISY
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 6 Jul 2022 02:56:51 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: osstest service owner <osstest-admin@xenproject.org>
Subject: Re: [xen-unstable-smoke test] 171511: regressions - FAIL

> > commit 8d410ac2c178e1dd1001cadddbe9ca75a9738c95
> > Author: Demi Marie Obenour <demi@invisiblethingslab.com>
> > Date:   Tue Jul 5 13:10:46 2022 +0200
> >=20
> >     EFI: preserve the System Resource Table for dom0
> >    =20
> >     The EFI System Resource Table (ESRT) is necessary for fwupd to iden=
tify
> >     firmware updates to install.  According to the UEFI specification =
=C2=A723.4,
> >     the ESRT shall be stored in memory of type EfiBootServicesData.  Ho=
wever,
> >     memory of type EfiBootServicesData is considered general-purpose me=
mory
> >     by Xen, so the ESRT needs to be moved somewhere where Xen will not
> >     overwrite it.  Copy the ESRT to memory of type EfiRuntimeServicesDa=
ta,
> >     which Xen will not reuse.  dom0 can use the ESRT if (and only if) i=
t is
> >     in memory of type EfiRuntimeServicesData.
> >    =20
> >     Earlier versions of this patch reserved the memory in which the ESR=
T was
> >     located.  This created awkward alignment problems, and required eit=
her
> >     splitting the E820 table or wasting memory.  It also would have req=
uired
> >     a new platform op for dom0 to use to indicate if the ESRT is reserv=
ed.
> >     By copying the ESRT into EfiRuntimeServicesData memory, the E820 ta=
ble
> >     does not need to be modified, and dom0 can just check the type of t=
he
> >     memory region containing the ESRT.  The copy is only done if the ES=
RT is
> >     not already in EfiRuntimeServicesData memory, avoiding memory leaks=
 on
> >     repeated kexec.
> >    =20
> >     See https://lore.kernel.org/xen-devel/20200818184018.GN1679@mail-it=
l/T/
> >     for details.
> >    =20
> >     Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> >     Reviewed-by: Jan Beulich <jbeulich@suse.com>
>=20
> ... this is the most likely candidate, considering in the log all we
> see is:
>=20
> Xen 4.17-unstable (c/s Mon Jun 27 15:15:39 2022 +0200 git:61ff273322-dirt=
y) EFI loader
> Jul  5 23:09:15.692859 Using configuration file 'xen.cfg'
> Jul  5 23:09:15.704878 vmlinuz: 0x00000083fb1ac000-0x00000083fc880a00
> Jul  5 23:09:15.704931 initrd.gz: 0x00000083f94b7000-0x00000083fb1ab6e8
> Jul  5 23:09:15.836836 xenpolicy: 0x00000083f94b4000-0x00000083f94b6a5f
> Jul  5 23:09:15.980866 Using bootargs from Xen configuration file.

This would not surprise me at all.  I was hoping that Jan would be able
to test this before he merged it, especially the ARM-specific stuff.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--cgtH4Z1nbZSnYISY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmLFMk0ACgkQsoi1X/+c
IsEkWxAAhGcmmF/bt5V+YNUhuHsRvaHaMAtQ1OZvLoP3X0fUWjeyW/bPehmJQiXd
N69hQoAVNWIHw2tBR2EaH/JlXe0RHLMtPDeSBWzNBuPBW8zcqvvoGGPxAMWX1fD9
DJUPloL/6JelyaO0MJ3/V2LWR++LZuBTvFLGSc+mcbfUCqmykwhzRCwfAHQS/Bto
3jJPG7P1jN+58klq6ixS/Ewa43Qn4cb2BX8MaGajLKgI74/9F8Yok5SD84otD2BO
gJYubE/mMulTuoNR6OkM7tx2g4rUvG7tMQop0H6Kbqthbu13JEhMxu/YV9rH0h7E
WZxSpEfTyJ03cmDdgDkOfHiHi/ixGjckituAKwjZZbTAyWtKi3PmAA/gpmJ/r1Vy
94+4b8TUW6gEH0lhyaKT+cXQaks3bgpZ9cMCXU3OU3qByg05B88yiCz7hCZnxnpb
SC4xbw7OBr+wDDDTvuuqd4BIuOP1AUx10bz9MoF/UartzMT0f3XhhTjRz4rtXDs/
cHQQ2GhwJRopJNvIJfZvgfQ4Rq7JM0FYbCE6H4IVuSFAcstTohq+Ir17OVfSJJ/N
hWp8ulZPlCncMEThuan79vB9pUCjFZkrNlHSInLhr4odBtAtkuGbCBq3UdMIMwJl
ofqsJblRGT0n0yTPGy5IE93HVyERJLGXdsFaK+ye3Db3J7wodUw=
=A3Qx
-----END PGP SIGNATURE-----

--cgtH4Z1nbZSnYISY--

