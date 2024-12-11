Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB169ECD6D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 14:40:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854806.1267915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLMwI-0000zx-DH; Wed, 11 Dec 2024 13:39:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854806.1267915; Wed, 11 Dec 2024 13:39:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLMwI-0000xq-AR; Wed, 11 Dec 2024 13:39:42 +0000
Received: by outflank-mailman (input) for mailman id 854806;
 Wed, 11 Dec 2024 13:39:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dco5=TE=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tLMwG-0000xk-KU
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 13:39:40 +0000
Received: from fhigh-b3-smtp.messagingengine.com
 (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d39a259-b7c5-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 14:39:38 +0100 (CET)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 7F42A2540206;
 Wed, 11 Dec 2024 08:39:36 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Wed, 11 Dec 2024 08:39:36 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Dec 2024 08:39:34 -0500 (EST)
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
X-Inumbo-ID: 5d39a259-b7c5-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1733924376;
	 x=1734010776; bh=G59R63w7pp1XzMR3o2VnXf8tL/viZNZpLW1rWOzSo18=; b=
	GSTLnue2+Wl7lKboa0ziFMuIxJ6J4FWaAqXpX2a5BrOtcDrAMv/DMXGEhdElNhcJ
	8yuhdG5CeTGhkw5skMSe1Rnriwveg1cB3W82Gm6tU+eac4Vz60xJEXaXwQm1MuMd
	VW1JKoB3x2pjYbqhguD+KOH51J5FtwlzLa/suYwuWO4Q8aMNPO0CwdV+SFU5FOCq
	QlQhgsxqN4jTbGRumoLuhmtYlUm8k4qDwnVh5AE0sv7rx6AhaVLRCZpmgXg0u3TF
	DtoD1Gtbex5pJjI/mLP1i+YfbMeFO2AB8xVI4fGs6C8NnnrQzXKqVBhYEKprYucs
	eezBbv1jGS9syw7w8UL3BQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1733924376; x=1734010776; bh=G59R63w7pp1XzMR3o2VnXf8tL/viZNZpLW1
	rWOzSo18=; b=Mt3v68gh2wcMs3WFmNoSVvNN+T76pQqmJrYq1XMVrvARs0vZSCH
	7lkt+6Gb/PsyW5A9lxgRtFfF4AzyALIRMPD3LUd13DMo212Efp4YGHOYwva5Zp7f
	wx3qLZNsiHKT9nCyeYv2sQzIcTkaML+L6W+m8JiLkIZ0y+t6Kdk3aSH3t5apHOr0
	vrRkFwlMk4OzpKU612yH7ezvWRwr8L39OEsJ2TF08kYACpst27z9iPfo2V1J3Hqc
	axr0iWSuIiDhWOtX3uFkEKxUCX4eUfUKSbW8v0F4tY5bza0bxrTBClWu4sdevQNp
	0MgU42F5w+7cGewTUO57XFra1kw02HuzxgA==
X-ME-Sender: <xms:GJZZZ3lHw9dr4NPWq4FuM6NkDfMvakizUoqYxGEtYcEZr4v6Dw8d7g>
    <xme:GJZZZ61A3ml19Gi2fmGSBKVFwmU9M5QXXsuG_V9_xcS6unyEqNzSIDNJ8Smnc0LXS
    r00NisZZZjOqw>
X-ME-Received: <xmr:GJZZZ9pPmV5OVvHNG1LqfqHaIXZiJ-k2MKXX7gZiPG7Wpe435sc7r06AgeecIjlEy0ImskhFO4AwQdRP23e_U2L6QUGkpfrFdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkedtgdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecu
    hfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrg
    hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffr
    rghtthgvrhhnpefgudelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegue
    etfeejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsg
    gprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrrhgusges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnug
    grthhiohhnrdhorhhgpdhrtghpthhtohepjhhgrhhoshhssehsuhhsvgdrtghomhdprhgt
    phhtthhopehjrghnughrhihukhesghhmrghilhdrtghomhdprhgtphhtthhopehsshhtrg
    gsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopeholhgvkhhsrghnughr
    pghthihshhgthhgvnhhkohesvghprghmrdgtohhmpdhrtghpthhtoheprhgvghhrvghssh
    hiohhnsheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopeigvghnqdguvghv
    vghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:GJZZZ_lH4PLWUpYf-D9YnMQT8grGXjdAXelPdLy62LFfInSjJUW0wA>
    <xmx:GJZZZ10f-G1B7P8puSHBT4DBYGFIj5rcfD7_tXgzCpOWlAPrTR60cg>
    <xmx:GJZZZ-uEdc8r8w_Qxjob-t-1cog9gqPUqA9EyRXhqdvoGYAueo4Hgg>
    <xmx:GJZZZ5VLtq8FF8pwtjixGolGXrGUkSJMcFNMq6XTX3K3m4GJ0_OMkQ>
    <xmx:GJZZZ-LiA15Vy-6DRaE-aZ13ccpmKC1kUKkFEhB0ciWuy17MvJ7XrwAW>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 11 Dec 2024 14:39:33 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	regressions@lists.linux.dev,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [REGRESSION] Linux 6.6.64 crashes when booting as PVH domU
Message-ID: <Z1mWFcm_036BrvEq@mail-itl>
References: <Z1l6XbHP6BTTZSwr@mail-itl>
 <fe8db5b2-7524-49ea-ab8e-21f831dc009f@suse.com>
 <CAMj1kXHSiCo7FH0Mo-_R9HjxhthddPUZfgm5c8yj7vjGvgfTPg@mail.gmail.com>
 <Z1mF0UZPNLjYAJI7@mail-itl>
 <CAMj1kXFVd+2n1fRoOriwmAPH8yX22gSy7_m_1SVjtoG3r_=-Tw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ixZe9eDMs4Thjeq6"
Content-Disposition: inline
In-Reply-To: <CAMj1kXFVd+2n1fRoOriwmAPH8yX22gSy7_m_1SVjtoG3r_=-Tw@mail.gmail.com>


--ixZe9eDMs4Thjeq6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Dec 2024 14:39:33 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	regressions@lists.linux.dev,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [REGRESSION] Linux 6.6.64 crashes when booting as PVH domU

On Wed, Dec 11, 2024 at 01:37:52PM +0100, Ard Biesheuvel wrote:
> (cc Greg)
>=20
> On Wed, 11 Dec 2024 at 13:30, Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > On Wed, Dec 11, 2024 at 01:24:08PM +0100, Ard Biesheuvel wrote:
> > > On Wed, 11 Dec 2024 at 12:53, J=C3=BCrgen Gro=C3=9F <jgross@suse.com>=
 wrote:
> > > >
> > > > Jason, Ard,
> > > >
> > > > I guess there are some prereq patches missing in stable 6.6.y branc=
h?
> > > >
> > > >
> > > > Juergen
> > > >
> > > > On 11.12.24 12:41, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > Hi,
> > > > >
> > > > > With Linux 6.6.64 I get the following crash on domU boot:
> > > > >
> > > > > (XEN) d5v0 Triple fault - invoking HVM shutdown action 1
> > > > > (XEN) *** Dumping Dom5 vcpu#0 state: ***
> > > > > (XEN) ----[ Xen-4.19.0  x86_64  debug=3Dn  Tainted:  M     ]----
> ...
> > > > >
> > > > > Linux 6.6.63 works fine.
> > > > >
> > > > > Looking at the changes, I suspect one of those:
> > > > >
> > > > >      83d123e27623 x86/pvh: Call C code via the kernel virtual map=
ping
> > > > >      f662b4a69e1d x86/pvh: Set phys_base when calling xen_prepare=
_pvh()
> > > > >
> > >
> > > The second patch shouldn't have been backported. It is unnecessary,
> > > given that in the old situation, the kernel image needs to be loaded
> > > at a fixed address. And it assumes  that %rbp is set to the physical
> > > load offset, but those patches were not backported.
> >
> > It has this tag:
> >
> >     Stable-dep-of: e8fbc0d9cab6 ("x86/pvh: Call C code via the kernel v=
irtual mapping")
> >
>=20
> That was added by the stable maintainers - someone grabbed a patch
> from the middle of an unrelated series to make e8fbc0d9cab6 apply
> without lexical conflicts.
>=20
> > Does it mean neither of them should be backported?
> >
> > But then, the e8fbc0d9cab6 has "Fixes:" tag (pointing at very old
> > commit).
> >
>=20
> If someone thinks e8fbc0d9cab6 should be backported, they should
> rebase it onto v6.6.y, not backport random other patches until
> git-apply stops complaining. And ideally, someone would build and boot
> the result to check whether it works.
>=20
> For now, it would be better to revert both.

I can confirm that reverting both commits fixes the issue.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ixZe9eDMs4Thjeq6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmdZlhUACgkQ24/THMrX
1yw7uQgAjf99iAKxgm+xGSQu3KZ7qFwugk8wI83J91QhOVb49AgP8xARFwT/OAqR
DTg9gsbJqBlYrlYel3vcsTSLzOnSyifIKO5wlDid6Yf8MkIRbaPoIR+RAm7cN2sc
R4qkljZT4dpt3Pd9mb91LjaGVo2LdNeHXNZs/ZDlkrZezYATfnJhhVc5LxWL8fo1
O6+Jmrtb9d5DccpBU58E6dCD4H6lh5iOTWOQdWLy4AlQsC8Ea9GU/S0w5VZXrSkW
6WMhsG9y9yN/S7nkfk4EBqIIsbGqsxBxyUTA+Pb4fpmBMtlwG4K9xBpOnNxgaI6S
mpNisy29Un4rTXLJjkgJU5xUkKWeMQ==
=+wW6
-----END PGP SIGNATURE-----

--ixZe9eDMs4Thjeq6--

