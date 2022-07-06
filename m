Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F685680B9
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 10:06:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361936.591716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o902Z-0008PX-TB; Wed, 06 Jul 2022 08:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361936.591716; Wed, 06 Jul 2022 08:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o902Z-0008NQ-QV; Wed, 06 Jul 2022 08:05:43 +0000
Received: by outflank-mailman (input) for mailman id 361936;
 Wed, 06 Jul 2022 08:05:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=91kg=XL=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1o902Y-0008NK-Kw
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 08:05:42 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ca0cb6f-fd02-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 10:05:40 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 4BBB95C01EA;
 Wed,  6 Jul 2022 04:05:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 06 Jul 2022 04:05:39 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Jul 2022 04:05:38 -0400 (EDT)
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
X-Inumbo-ID: 6ca0cb6f-fd02-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1657094739; x=
	1657181139; bh=S+iXG6vR99bBJb+KySeOfzJsoOuMGxh7CZz66f7wlos=; b=F
	JT2vOPBfudE93TJ+/L3uRxQtnpkyHH5Cxop03oB7n11Vxf3XfkNUdAeiImxCsqX1
	3IUt++1xdYzlkSHYykw1tgnmIv+izHv+PvNqXAxx8n/tQvOprY8MRyu7ybQQy6UP
	BSX/Ne7fI7qCn0/LLVSzAZIvyuqeKkSmahpeYgsf3kve6NqSp5vQSoEez23FI2aq
	tDovL2cU6EZ4/db43J7dG4qM5HfvVhWBmiSrYT0HpZKPS5CUP6PEABDaqWPdMrlm
	fzCqAjoCq26k0y9tgXJEt17hmrBjBfT+RlcVv6kdiwCChLgjIIFZZptANaIFywKX
	2zck9uPOqsHlv++ZBgYxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1657094739; x=1657181139; bh=S+iXG6vR99bBJb+KySeOfzJsoOuM
	Gxh7CZz66f7wlos=; b=rSn+rupbRJ1cPesPHMhb1dtDzfDQca/mkFYtPSH4Nk1i
	cWaH/ugMfRPzRkVHioulyB9wbTIUwnMNudMEND6ZTDG/qArywgjnXjK7myYHq5mb
	WwdN9MzTM3HD0WZ2GKxT11hOkyifzRAlyQEkqamtUD3TNgtNXZA2QrwSObm2EKzn
	gY48MdYo8xG9eE1sK+actKSIbC/cE6LsSbjHhhX4DPTRei3/Gwwv9TiHeor51oyk
	YMS9rbJ/jH8ghFGPNLkVRXgDgjuFOLFVCOuHA6/qu2EGAqXoQMW6ujc6cpMu2tzt
	PzgyG/+p23DNTaQtxbwapN2uLakSdJBCtAREm579GQ==
X-ME-Sender: <xms:UkLFYst9NqbThGVAGvpFQeC-XmalHZ9T3zoJ20Qkx6sxeZAd-oa-SQ>
    <xme:UkLFYpcNUgP6cyxt-TQihffNxwi6AYjX7dSmHicWQMWfg_1mxfzNZ5x8PUa3oX_kt
    ylRlpWzp_wuNfk>
X-ME-Received: <xmr:UkLFYnzLuZI-3kii8oMO4_BlNdNOQ2e-IAbTo3nkRCg2qGFTfaOiz2CMXefc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeivddguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeekvdeuvdejgeevhfegvdegleeg
    teetueeihfevteffgfdvhfdvffejfedvieelgeenucffohhmrghinhepgigvnhhprhhojh
    gvtghtrdhorhhgpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:UkLFYvN3IMkwHzADNaPE5nC7hW-qHbFJkiHW9HjaqkaKlAVlKBSRJw>
    <xmx:UkLFYs8o31i_w0fuxH87OpoRsxLtNBYOWUh06fDAJ6cruILTEBJWJQ>
    <xmx:UkLFYnX2aPc_hio2EQeebGb_vUALNIMJNtlylYawIP1pzRVdD4vAUQ>
    <xmx:U0LFYqluJXbUJvGRNEFyinu4vHk_gzpagVsg52v-pY0uzYF7zRSxOw>
Feedback-ID: iac594737:Fastmail
Date: Wed, 6 Jul 2022 04:05:35 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
	xen-devel@lists.xenproject.org
Cc: osstest service owner <osstest-admin@xenproject.org>
Subject: Re: [xen-unstable-smoke test] 171511: regressions - FAIL
Message-ID: <YsVCUITQ8nWKi+W0@itl-email>
References: <osstest-171511-mainreport@xen.org>
 <a9a8276f-725a-db6e-8223-a9e6060f7700@suse.com>
 <14334329-baf8-5b71-5a48-421e2b6652b5@xen.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9w2Cap5vluFac+Ud"
Content-Disposition: inline
In-Reply-To: <14334329-baf8-5b71-5a48-421e2b6652b5@xen.org>


--9w2Cap5vluFac+Ud
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 6 Jul 2022 04:05:35 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
	xen-devel@lists.xenproject.org
Cc: osstest service owner <osstest-admin@xenproject.org>
Subject: Re: [xen-unstable-smoke test] 171511: regressions - FAIL

On Wed, Jul 06, 2022 at 08:53:49AM +0100, Julien Grall wrote:
> Hi Jan,
>=20
> On 06/07/2022 07:44, Jan Beulich wrote:
> > On 06.07.2022 05:39, osstest service owner wrote:
> > > flight 171511 xen-unstable-smoke real [real]
> > > flight 171517 xen-unstable-smoke real-retest [real]
> > > http://logs.test-lab.xenproject.org/osstest/logs/171511/
> > > http://logs.test-lab.xenproject.org/osstest/logs/171517/
> > >=20
> > > Regressions :-(
> > >=20
> > > Tests which did not succeed and are blocking,
> > > including tests which could not be run:
> > >   test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR.=
 vs. 171486
> >=20
> > Looking at what's under test, I guess ...
> >=20
> > > commit 8d410ac2c178e1dd1001cadddbe9ca75a9738c95
> > > Author: Demi Marie Obenour <demi@invisiblethingslab.com>
> > > Date:   Tue Jul 5 13:10:46 2022 +0200
> > >=20
> > >      EFI: preserve the System Resource Table for dom0
> > >      The EFI System Resource Table (ESRT) is necessary for fwupd to i=
dentify
> > >      firmware updates to install.  According to the UEFI specificatio=
n =C2=A723.4,
> > >      the ESRT shall be stored in memory of type EfiBootServicesData. =
 However,
> > >      memory of type EfiBootServicesData is considered general-purpose=
 memory
> > >      by Xen, so the ESRT needs to be moved somewhere where Xen will n=
ot
> > >      overwrite it.  Copy the ESRT to memory of type EfiRuntimeService=
sData,
> > >      which Xen will not reuse.  dom0 can use the ESRT if (and only if=
) it is
> > >      in memory of type EfiRuntimeServicesData.
> > >      Earlier versions of this patch reserved the memory in which the =
ESRT was
> > >      located.  This created awkward alignment problems, and required =
either
> > >      splitting the E820 table or wasting memory.  It also would have =
required
> > >      a new platform op for dom0 to use to indicate if the ESRT is res=
erved.
> > >      By copying the ESRT into EfiRuntimeServicesData memory, the E820=
 table
> > >      does not need to be modified, and dom0 can just check the type o=
f the
> > >      memory region containing the ESRT.  The copy is only done if the=
 ESRT is
> > >      not already in EfiRuntimeServicesData memory, avoiding memory le=
aks on
> > >      repeated kexec.
> > >      See https://lore.kernel.org/xen-devel/20200818184018.GN1679@mail=
-itl/T/
> > >      for details.
> > >      Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > >      Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >=20
> > ... this is the most likely candidate, considering in the log all we
> > see is:
> >=20
> > Xen 4.17-unstable (c/s Mon Jun 27 15:15:39 2022 +0200 git:61ff273322-di=
rty) EFI loader
> > Jul  5 23:09:15.692859 Using configuration file 'xen.cfg'
> > Jul  5 23:09:15.704878 vmlinuz: 0x00000083fb1ac000-0x00000083fc880a00
> > Jul  5 23:09:15.704931 initrd.gz: 0x00000083f94b7000-0x00000083fb1ab6e8
> > Jul  5 23:09:15.836836 xenpolicy: 0x00000083f94b4000-0x00000083f94b6a5f
> > Jul  5 23:09:15.980866 Using bootargs from Xen configuration file.
> >=20
> > But I guess we'll want to wait for the bi-sector to give us a more
> > solid indication ...
>=20
> I have tested a Xen with and without this patch this morning and can EFI.=
 I
> haven't looked into details yet why.
>=20
> Can we consider to revert it?

I'm fine with reverting it for now, but I would like to know what the
bug was.  Does a Xen with this patch boot okay on x86?  If so, could it
be temporarily turned off on ARM until the problem can be tracked down?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--9w2Cap5vluFac+Ud
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmLFQlAACgkQsoi1X/+c
IsG0zQ/3TAxDEWHyO7PbAj8RSOS093O7ZKU8DomvD27eC9a+egHWPXslzWcKUjfn
N0rIpWIhB8EXAQsEsajziAsflixN3BumXpU56zukEs4Roh2lon2Ex8TQ53pexiX6
b9LJ3Y/D/P1dwxyH1/auu2wPT+qehHm/YKhDjCqfVeir2mP5Fjn3V7NafcWZ8AXA
EalbdP2KOc4BXBEJPSFDbC97wPollFz1xdP0BbFGNMwiQwiZ8oMEkosSWEEKG4cV
WCsUk2V7VPaTIDBgO0oornZ7VKQYPsTd75dnbFFKppayu4k+K4eJtxWwuAlT4PTe
B5iwxcb109HvMEmg8e88ppdEhYJurOTJSBL4wSE0NpbU0rlX4uT2zvnoWNXB1Wd2
hR3emKrMe1Lf3L5sEkdrOYPZ3hFn8+uNnmhU0koMpQBzFLPycbFXWJqa21Rt7NY+
zi9qvBq8+QJkPN2BPs/mJckiUgXH2mkseFZYWJr9ReL6WMNJQxmUvLXvaHIyUKmE
HLUnUK+nopwwELYZNrT/O7qLa4zF6dEplUgVzwH+598S74yLrBAWOVJPInuBSKR7
cJLTv+fALmAMQtKQ6COfzJfd6ZiR/zrVe3zJNP1KEKU0x3ikFnwR4vghJdhKJdod
FwUN76mGUohzqfZeU73wez7OnWFXdPXP5YGGDo9qeiHcUshLRg==
=PxNo
-----END PGP SIGNATURE-----

--9w2Cap5vluFac+Ud--

