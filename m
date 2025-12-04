Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A23ECA5ADC
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 00:19:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178342.1502201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRIbF-0001y9-Et; Thu, 04 Dec 2025 23:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178342.1502201; Thu, 04 Dec 2025 23:19:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRIbF-0001vl-Bv; Thu, 04 Dec 2025 23:19:01 +0000
Received: by outflank-mailman (input) for mailman id 1178342;
 Thu, 04 Dec 2025 23:18:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ymfd=6K=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vRIbD-0001vc-TY
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 23:18:59 +0000
Received: from fout-b3-smtp.messagingengine.com
 (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b2428fa-d167-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 00:18:57 +0100 (CET)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.stl.internal (Postfix) with ESMTP id 678581D00149;
 Thu,  4 Dec 2025 18:18:56 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Thu, 04 Dec 2025 18:18:56 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Dec 2025 18:18:55 -0500 (EST)
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
X-Inumbo-ID: 9b2428fa-d167-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1764890336;
	 x=1764976736; bh=GYffu1xeR4qwUEuF0h8Andg+n988GbrHNxRs4r5qDuA=; b=
	W8Ka5K2cnYuHA2ARFpNEyZjRS6ufe/8avh9mFmHu6Sn1uN2f1VyLOQB2Qw2kOiaF
	MJ1CZ8OG4sFFUL4dxOXEYJx6XKeH35deDpOTanl9VTogzE4Z+TM2uUILTsd3I5vt
	BUphD22qmsfw4wtDHXBS2YGe4Ind1rNUxqH2m6goiXYASEpEaEON4W8qxgJLDIDR
	EDhiIqn2U9sQxDRyHxM2f0Q/JgUACsfzv9BPw6tIsKLYKp9Es9BiVJ+dbET8iBXx
	H4yP5QPnMf3fnlpzmLGGICZM+QS2Dgf1z4T4rmAM9/iRf7LVWFzEau5RHYl0AHx7
	E//3j300Thad3bcRtbiu5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1764890336; x=1764976736; bh=GYffu1xeR4qwUEuF0h8Andg+n988GbrHNxR
	s4r5qDuA=; b=EXzWkaZhM0x3eHo/MSyIwd/zvFl6jMREb98zKt0icoKHxM3HRiH
	X8P+O1a7BF/ZYf6Abk3OhUzd42gzNBsqmY9nfaBfWPfv6bUyzIUXYWm4o2Sv6EUa
	nlxnaNbhUmzaGFd3tkzpp3mZlTqrjgjjJ52iY7EMXnzi2K9v8IpGO67CL276ykGh
	ivFB8ki/6w+inDwEBJS16wr3E5q1W62HCopkvlW9L4CdIz9iyd/444iFrxnSn4lW
	+2KF9tCCEpnEaNDpKFhZDXqbLilmdJMUIQfqQO8JCGotllY8ASXS+KlPghqvRVhy
	7dHEGBAPlz6+B4f/kU4GOpA6VgyYBK0B6zA==
X-ME-Sender: <xms:4BYyaXR2nSYkMrxhUchKMHuOKteAHMxD2H-OpCck8d7aBgtpIc1Myw>
    <xme:4BYyafxnlhcL6ZAAcufyUackJgpcjIfDLqJFrSmnxFPzCdmwYvpbZUntlNl19QJIq
    1AzFrbpckQpNzX7mIgsUXZHM37lz7crvg2q4ELdnPr2-sQ>
X-ME-Received: <xmr:4BYyaR28sP6HYrihAvztpgoVFoTohRJnPb3a6ejm227OjJckCKt13ypLUh4rGvof6JMdv_nEep4bUrPsicieUs0jifgKmk7HPQk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeikeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepveeujeetgeel
    leetudeuvefhtefgffejvedtvdfgieevheetheelgeeuledvjeevnecuffhomhgrihhnpe
    hgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohepgi
    gvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthht
    oheptggrrhguohgvsegtrghrughovgdrtghomhdprhgtphhtthhopehsshhtrggsvghllh
    hinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:4BYyaV40HqQkzXbXeyxDfglSrROCv1p3UKVVAsGdvW-Gu6jIyFYWZQ>
    <xmx:4BYyacX10Xvfnpx-yonaBEGxLI5zr0iT76698gamIpqThNQeP30cgQ>
    <xmx:4BYyacDwZhELIhNRO9dhujsC-8DjVe5ouHWXrrWnYYzFcqCWJuFQIg>
    <xmx:4BYyaT4VDN7-q6eYI1-2RTmKh4Co1-I3KKLdMaDTVPwRSW8nSbJoGQ>
    <xmx:4BYyaZVI0O4H-upq1hyfkkckx11wkIn-m9qRkXur8Qv1c0zLNlqzIvFb>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 5 Dec 2025 00:18:53 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 3/4] CI: Add configure --enable-systemd for full build
Message-ID: <aTIW3V5kR_6Llf7w@mail-itl>
References: <cover.1e7327573686b6fc1e161127e268e4042556d16e.1764867217.git-series.marmarek@invisiblethingslab.com>
 <ed2e7eda64da87351d6fd8590eee698598ef8e88.1764867217.git-series.marmarek@invisiblethingslab.com>
 <c9512f4f-7c68-4504-8492-237447586cc3@citrix.com>
 <aTIVBFMAaVj3Kh4G@mail-itl>
 <72bab1bc-6549-4f5a-b521-a4b3c66f7030@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4teK5MldL2ssURxk"
Content-Disposition: inline
In-Reply-To: <72bab1bc-6549-4f5a-b521-a4b3c66f7030@citrix.com>


--4teK5MldL2ssURxk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 5 Dec 2025 00:18:53 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 3/4] CI: Add configure --enable-systemd for full build

On Thu, Dec 04, 2025 at 11:17:03PM +0000, Andrew Cooper wrote:
> On 04/12/2025 11:11 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Dec 04, 2025 at 09:54:41PM +0000, Andrew Cooper wrote:
> >> On 04/12/2025 4:53 pm, Marek Marczykowski-G=C3=B3recki wrote:
> >>> @@ -26,6 +26,7 @@ RUN <<EOF
> >>>          cpio
> >>>          git-core
> >>>          pkg-config
> >>> +        systemd-dev
> >> Why is this needed?=C2=A0 Or rather, does this patch predate my breaki=
ng of
> >> the dependency on system-dev?
> > It's still needed, without it the build fails:
> > https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/10959608099
> >
> > Likely related to e54a6cd6a1f3802274cd3a58b07df5f012342192
>=20
> Urgh.=C2=A0 Yeah, that breaks the build if systemd isn't installed.

Technically, it breaks "just" --enable-systemd build.

> We also need a build container that does not have systemd anywhere in
> it, to block stuff like that getting in in the first place.

That is Alpine container.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--4teK5MldL2ssURxk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmkyFt0ACgkQ24/THMrX
1yweyAf9GsHFMXXfnhaNQInHMKk1wrbghPoxMU4iHXtyv4OcuPLYUh+eRbbd3hw7
Ei6xMcgGex7wZJ7qyBDCPmeliB3AcjccjF1CBcPgij2W2lTyywxOspz83aocJSrD
K0f0AFFLRYR5mJAuienm6E+4Dnfezi+wVkAo4mBcBGQZBhXAKIi3ZnQ6dsUFf33E
YS9+EY7+u0IH1DVFE+BFoZ1/Rmu7RlNfon7V5x37W898cyn2iG40PoQS9bF80n9c
UQq1bQ8S7lpLKdieYSnqNlgT1rbvKPTAn1AXE/qkv7acmO1/8vtYeqPJA1Yd9hl0
zMyDan/ELZPHToD+XjWOyxG4ChOCtA==
=a/Dk
-----END PGP SIGNATURE-----

--4teK5MldL2ssURxk--

