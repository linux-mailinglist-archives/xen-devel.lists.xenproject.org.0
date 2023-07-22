Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBEA75D82A
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jul 2023 02:24:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567763.887249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qN0QC-0000lk-RW; Sat, 22 Jul 2023 00:24:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567763.887249; Sat, 22 Jul 2023 00:24:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qN0QC-0000js-OF; Sat, 22 Jul 2023 00:24:32 +0000
Received: by outflank-mailman (input) for mailman id 567763;
 Sat, 22 Jul 2023 00:24:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWMX=DI=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qN0QA-0000jm-U4
 for xen-devel@lists.xenproject.org; Sat, 22 Jul 2023 00:24:30 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ea9ba90-2826-11ee-b23a-6b7b168915f2;
 Sat, 22 Jul 2023 02:24:29 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id CE84D3200906;
 Fri, 21 Jul 2023 20:24:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 21 Jul 2023 20:24:27 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Jul 2023 20:24:25 -0400 (EDT)
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
X-Inumbo-ID: 1ea9ba90-2826-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1689985466; x=1690071866; bh=h9BeXBbyXd+JNJTmt8/LKJ+nA8L7HE1pzc3
	5x8Tv9bU=; b=1MTwfSpoOBuiklF2pKqC9s9KfOkTWpxbVMXos7MkVyk3M3zvIr1
	ReW3J6rKgQLeFJ8GAsNKJhqM5rDzZYR+UO85/F8+qjtFr1lICxfuWRmj0pudeM+k
	ayI5Cl0Toms7ah7roWB4A41YUuGSIm7FXDU1UJJeQXt+nVAJazkpqDpYIhzPYdoi
	fN3ZzCL8s4ahVwN/Gf+dS+VxengJmDsvN7PZSisLm3q9dQ3+2leUuBS88Jzc2PFP
	BdAy2LgmeFPjjVuEiu5FdaoHOIoHqcd1uEmVc6hbNRJBpuMTv07uhDQ4CI6bRWA7
	b6soJ9sDLSFgHd0giwkhP7DWGwakSXbrr8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1689985466; x=1690071866; bh=h9BeXBbyXd+JN
	JTmt8/LKJ+nA8L7HE1pzc35x8Tv9bU=; b=D3qx37UObfRkLxNH3DZxrCsxH0AV5
	5h0B2Ln1IvKIFuexefyJ8NBAzIqgKZMpFpPBDrl1KxfcqyGMOzxjCtJMhmlHmMHz
	OuaekqFP2NwRGavncWBuGVqwIEwS2+ggMC66MAzPErJH1N4LsMFyrTnKuhJdVCF9
	FOWuOjTHQ55nydit+z9FKHBx3ffPVKGzNX0DIjHDX3lrL6SLcB1HocIq47mmijmy
	f1fAMpfGDBuFjXRNOCQh0sp7g3xjvE23mMFSDmBswefkQwBYn/58Kb6XMg9UP94t
	ShLcE5cnh+wML2af24BqVWz50sxVuZe0qEfqKfDjDY0eoF2UuQ0DK35MA==
X-ME-Sender: <xms:uiG7ZFx0M5dalsZCcT5S4EIfu2cnjHRX2-V48Akd7DQL9lCa5PQgaA>
    <xme:uiG7ZFRPOfAawI0ALCFuhERWl1FUat8KordkTOAk4MJngKjzvaOUsag658unkJ001
    W2hyB317LwYBw>
X-ME-Received: <xmr:uiG7ZPWWfLYbLFp9KkaWLKSpJfginCqNm-A1dfTN-tctYMUGHxPn7yRRQUDcyRgCWluNOm2VQT8csPJRNOjcb3A7hmJzCrRj-RI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrheefgdefvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevueej
    teegleelteduueevhfetgfffjeevtddvgfeiveehteehleegueelvdejveenucffohhmrg
    hinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:uiG7ZHjQa4eKTqwGlcQE2RbMQGG0KbLCmD2UF5QDjB7YitBqh34kvA>
    <xmx:uiG7ZHBXFwEqzzdTEmVDo_vDZo8_sVGCGLMzl8Eid4X7UQkcBtT_lQ>
    <xmx:uiG7ZAJ3pas5Gu0irzQCSekxqe0xQPZ8b8PvyzfpfCUnZ_aG_iMElA>
    <xmx:uiG7ZKPiS5MHl180n8kJY5oO0PaqhYtsxEvKGnkNH2FF0WTyv7DTOw>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 22 Jul 2023 02:24:22 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	"committers@xenproject.org" <committers@xenproject.org>
Subject: Re: [PATCH] automation: avoid duplicated builds of staging branch
Message-ID: <ZLshtl8KKgyR1wlY@mail-itl>
References: <20230717130925.28183-1-marmarek@invisiblethingslab.com>
 <cf7ac648-dbef-80bb-986b-3fe0daef855a@citrix.com>
 <ZLVLaPeyOwDYYUXL@mail-itl>
 <alpine.DEB.2.22.394.2307211627080.3118466@ubuntu-linux-20-04-desktop>
 <ZLsd3tdSvTLwIyt3@mail-itl>
 <alpine.DEB.2.22.394.2307211712430.3118466@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JF/W8SrCh71XL8RF"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2307211712430.3118466@ubuntu-linux-20-04-desktop>


--JF/W8SrCh71XL8RF
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 22 Jul 2023 02:24:22 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	"committers@xenproject.org" <committers@xenproject.org>
Subject: Re: [PATCH] automation: avoid duplicated builds of staging branch

On Fri, Jul 21, 2023 at 05:14:01PM -0700, Stefano Stabellini wrote:
> On Sat, 22 Jul 2023, Marek Marczykowski-G=C3=B3recki wrote:
> > On Fri, Jul 21, 2023 at 04:42:11PM -0700, Stefano Stabellini wrote:
> > > On Mon, 17 Jul 2023, Marek Marczykowski-G=C3=B3recki wrote:
> > > > On Mon, Jul 17, 2023 at 02:14:14PM +0100, Andrew Cooper wrote:
> > > > > On 17/07/2023 2:09 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > "staging" branch is mirrored (automatically or manually) to sev=
eral
> > > > > > repositories. Avoid building it several times to not waste runn=
er
> > > > > > resources.
> > >=20
> > > Hi Marek,
> > >=20
> > > Let me try to understand the use-case a bit better. You would like the
> > > following "staging" branch to run a full pipeline:
> > > https://gitlab.com/xen-project/xen
> > >=20
> > > But if someone under xen-project/people is mirroring
> > > https://gitlab.com/xen-project/xen, this patch is attempting to skip =
the
> > > additional pipeline. For instance, if I am mirroring staging in my
> > > personal repo:
> > >=20
> > > https://gitlab.com/xen-project/people/sstabellini/xen
> > >=20
> > > We are skipping the additional pipeline there.
> >=20
> > Yes.
> >=20
> > > Is that correct? If so, it would be easier to ask everyone to make su=
re
> > > they have "Trigger pipelines for mirror updates" unselected:
> > >=20
> > > https://docs.gitlab.com/ee/user/project/repository/mirror/pull.html#t=
rigger-pipelines-for-mirror-updates
> >=20
> > If that's set in gitlab as pull mirror (instead of push from somewhere
> > else), then that indeed may be enough. But is it really in all those
> > cases?
>=20
> Yes, it is an option in the pull mirror, by default should be unselected
> I believe.

Well, if that's the case, either it got manually enabled on those 4 (?)
forks, or those are using something else for mirroring the staging
branch (in which case, the setting would not help). I can't see this
part of the settings in other's repositories, so I don't know.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--JF/W8SrCh71XL8RF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmS7IbYACgkQ24/THMrX
1yxuNQf/U54xksbUsHKef26JQ2eBFnCk8oz8tUkmWzfSRRec7OtclFbftjvnmKrh
txt8eqdsBoUvJEA+vTyYJRALudLBP6tG7Sd8TmTZnMltb8MZ4elMi2q4zi33Mjft
GHKlC7INDoLc3m6hVEtWSOXJI4RfV3eb2SlDIDBZ0nV3pD81JhQ4x+BpdeKJxhJz
cBxuSxJnQ9JNCubPf46AY2yxpCBu5ltc1T9LiucBArYtdGTvsgM1qohbM64QkW4d
r9+m17nFP2rClIVTy3Mn2YnA6eZrDNRVh/BMVDSEe/H94Q4TYdoN3kd/ZiEGFqGj
SVrNdYuDqqWMDmoL6IyZOiOAXIneig==
=x2R8
-----END PGP SIGNATURE-----

--JF/W8SrCh71XL8RF--

