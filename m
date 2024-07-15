Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F19A93122D
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 12:22:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758824.1168327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTIqc-0008BS-HL; Mon, 15 Jul 2024 10:22:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758824.1168327; Mon, 15 Jul 2024 10:22:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTIqc-00089y-EN; Mon, 15 Jul 2024 10:22:22 +0000
Received: by outflank-mailman (input) for mailman id 758824;
 Mon, 15 Jul 2024 10:22:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v06p=OP=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sTIqa-00089s-LM
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 10:22:20 +0000
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com
 [103.168.172.150]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c25659b-4294-11ef-8776-851b0ebba9a2;
 Mon, 15 Jul 2024 12:22:17 +0200 (CEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailfout.nyi.internal (Postfix) with ESMTP id F2EA91388CB6;
 Mon, 15 Jul 2024 06:22:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 15 Jul 2024 06:22:15 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Jul 2024 06:22:13 -0400 (EDT)
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
X-Inumbo-ID: 1c25659b-4294-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1721038935;
	 x=1721125335; bh=xP+Gc5scGnxGLV7BcYf/W9Z23XDXZxP72kv6VMBirrI=; b=
	Sopv1rZSEB6uzWnqbX0RvKcPjUH83NeZ5cMOlezge8U7h7VIa5EVC+ziyJPjRVY3
	S0BxFm4gruQbebgNx4+MF8f/7Ps3jaB3cRpXAHHPF/ieBdsMuDUruZkYI+Xfu1wl
	9roMTsRYAo3DrkS059gDhe2HtzCf8nRhsRVUhXzKqIWCTlLAfCjpDZ0RBOxiIWxs
	Q7J++dhUkfbRMJRI4OC2VvrxXO8kYStJgH86kx4x82S9/4DpgdZTuZDy1Gcva71V
	l/E+gFhWir143FGmoMwcThiThYI36JevX0MotJ/CsPMewha5TRaoXO0Lly/TA/tc
	+BVETCmmPAW8SkIlj2irlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1721038935; x=1721125335; bh=xP+Gc5scGnxGLV7BcYf/W9Z23XDX
	ZxP72kv6VMBirrI=; b=FtrdJJmt0cOVsgrMdovDKhYqGsOd/p4fkT37LTQX30Kf
	cQ9bEgJnurbcMxn/+1q4edVTHSpMumXXvswgl+Ha/YBD/tacYsFfhjrJ0qz+z5Mp
	IX+crrYQ3DHjbOUvu/ZbRHP6VRc0Tonu422ha9FqPf+xZq3KRxFh2zSkBKkDcn7W
	xsgSCzTtYfykD3yHGHUkqLZpDkx5EJImH3WJk3ePGCkgHqorpAeUDE1RML8Mlc/B
	TrLS0rFdLNNKG/9uWa6y06lyJ0pgF9jd/8o6tUYd0AjZW/Y7wyrCvuZ5kAJ2jEnU
	ishFZ3aS+RCxA+wBsfz8LDQ1Bj5xnOvzMgOXnTJNEg==
X-ME-Sender: <xms:VviUZl7TkEbChf9nTBlBLYHk_w5VuXVIL5LiVUqxLBx1V1pmNT6flg>
    <xme:VviUZi6PLtCpkz1MwVnFWDDv2TUqmLmImZIEt6QI8PYUnpi8L3y50YjV2bEdsMPLn
    mZN25ELRYgqfQ>
X-ME-Received: <xmr:VviUZseiPlJb3K95JMi6ovfBYaDgHIx4skZ1Hk1lJWundvhEzS43hXm6rH-cBlE268mJ2hcreNj3vG8i9leDoHhLWj-_pqoNWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrgedvgddvjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:VviUZuKEQTGF76zp9DDXrDKG36lTtqpo5R0yyFOwHdnkiFigEKy9LQ>
    <xmx:VviUZpJk5I5drb3drvUNpVibHhRsknHwn6nkgEUYeQxpcdLrZ_z3_g>
    <xmx:VviUZnyaGN0n879uZFpIA8kl7fFRw-d9x7pKprxarI9_fmpaIXwT4w>
    <xmx:VviUZlLAMqNL8quUI2UFJAEzpv0TsNbn_JbJwnKoqMt1gyYGY6eGoQ>
    <xmx:V_iUZmFHyZ0OdVTarLFd9nZGF_6mFQV6W9p15XjI8L94Tt1_7GcFvAS1>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 15 Jul 2024 12:22:08 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: systemd units are not installed in 4.19.0-rc2 anymore
Message-ID: <ZpT4U2KnTO5xOvPF@mail-itl>
References: <ZpHqR4e3VaFAXC3m@mail-itl>
 <94d0ef92-9fb8-4097-a633-59f1190434c4@citrix.com>
 <1057f937-da16-415f-a760-ac4f00bc29f3@suse.com>
 <4cf46d24-2e21-4909-b1f4-fd6757801101@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j8kAmtpp9gH8U4Ek"
Content-Disposition: inline
In-Reply-To: <4cf46d24-2e21-4909-b1f4-fd6757801101@citrix.com>


--j8kAmtpp9gH8U4Ek
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jul 2024 12:22:08 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: systemd units are not installed in 4.19.0-rc2 anymore

On Mon, Jul 15, 2024 at 11:07:42AM +0100, Andrew Cooper wrote:
> On 15/07/2024 9:11 am, Jan Beulich wrote:
> > On 13.07.2024 15:02, Andrew Cooper wrote:
> >> On 13/07/2024 3:45 am, Marek Marczykowski-G=C3=B3recki wrote:
> >>> Hi,
> >>>
> >>> Something has changed between -rc1 and -rc2 that systemd units are not
> >>> installed anymore by default.
> >>>
> >>> Reproducer:=20
> >>>
> >>>     ./configure --prefix=3D/usr
> >>>     make dist-tools
> >>>     ls dist/install/usr/lib/systemd/system
> >>>
> >>> It does work, if I pass --enable-systemd to ./configure.
> >>>
> >>> My guess is the actual change is earlier, specifically 6ef4fa1e7fe7
> >>> "tools: (Actually) drop libsystemd as a dependency", but configure was
> >>> regenerated only later. But TBH, I don't fully understand interaction
> >>> between those m4 macros...
> >> Between -rc1 and -rc2 was 7cc95f41669d
> >>
> >> That regenerated the existing configure scripts with Autoconf 2.71, vs
> >> 2.69 previously.
> >>
> >> Glancing through again, I can't spot anything that looks relevant.
> >>
> >>
> >> 6ef4fa1e7fe7 for systemd itself was regenerated, and I had to go out of
> >> my way to get autoconf 2.69 to do it.
> > Yet was it correct for that commit to wholesale drop
> > AX_CHECK_SYSTEMD_ENABLE_AVAILABLE? That's, afaics, the only place where
> > $systemd would have been set to y in the absence of --enable-systemd.
>=20
> Hmm.
>=20
> Yes it was right to drop that, because the whole purpose of the change
> was to break the dependency with systemd.
>=20
> Thereafter, looking for systemd in the build environment is a bogus
> heuristic, and certainly one which would go wrong in XenServer's build
> system where the Mock chroot strictly has only the declared dependencies.
>=20
> I see two options.
>=20
> 1) Activate Systemd by default on Linux now (as it's basically free), or
> 2) Update CHANGELOG to note this behaviour
>=20
> Personally I think 2 is the better option, because we don't special case
> the other init systems.

But we do install classic init scripts by default, no? Why not systemd
units then (which are harmless on non-systemd system)?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--j8kAmtpp9gH8U4Ek
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmaU+FMACgkQ24/THMrX
1yyYQAf/R9P8dYabSR/o4Nb41MNqq3k7/taTqZmXMCDR62vKaaAZzdeVygcWxASm
OAGDF1oS2DrzYWEX2lrYjGFbJbt/tEFm4rK0D52qDuMHMBrGal1ooKgH2Gfj/TAA
Rn6NifW92mnZGNSR0MDLmyUw7QHobP+AHf7BgROp3I/fsXye8WcO7TvtlRowh1Of
FMQ0pybHmYhQyI0o+Fyb/xcBnIGoO8ekI8ocD7zdMUdCjBH+pe+Pk3nw41WkZvdr
Ohgt7WaDU3XDVeDbasQ7boQSkoMpnO7V2zxs5Hjr43H3Cq3iak1MFQJyuHWkUOZ7
vdLZhf7uOm08ltDJ4WyGO73+2M/FIA==
=Up1X
-----END PGP SIGNATURE-----

--j8kAmtpp9gH8U4Ek--

