Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D803564AD08
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 02:32:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460087.717892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4u90-0000Wh-H7; Tue, 13 Dec 2022 01:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460087.717892; Tue, 13 Dec 2022 01:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4u90-0000Ti-Cc; Tue, 13 Dec 2022 01:31:42 +0000
Received: by outflank-mailman (input) for mailman id 460087;
 Tue, 13 Dec 2022 01:31:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mJcE=4L=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p4u8z-0000TW-3E
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 01:31:41 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2bf3400-7a85-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 02:31:38 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D854B5C011B;
 Mon, 12 Dec 2022 20:31:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 12 Dec 2022 20:31:36 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Dec 2022 20:31:35 -0500 (EST)
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
X-Inumbo-ID: e2bf3400-7a85-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1670895096; x=
	1670981496; bh=xAHQuL+0iqWHlUaHFfTBSKzzR1ApMZRNV62By3ZB5AY=; b=u
	2QqWVOB8cuVwimFl0RuE9JhyUEaA5BV9yUf6Euvaiv8WA6ziblOmrlbTrs3YzrOz
	f7qBvKxqDcm7Q3DyaQ4OcOEW7s8GLe3+b4n+bJ85JVNQyEGXzvnffjsRE/UT0l2t
	Vaav9sA/xiwFXWTSUs437v4w7cxwwvp+7KNF2X4gHWmfDPSgkh/vAlbKQCwGKdlb
	kZABozHEaRP/78lI1k8rvo0740Eca+74T/Twi3bM6uGzV5JIDeafUlhBuQc22SM5
	L6+UdfHjkIXKb/pUGfKx6IhnT+DJDnCoG686gdy1HRrnAkd/C8UOnm8NFPNQulBc
	6aZCXk999dshUMb5sLH6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1670895096; x=1670981496; bh=xAHQuL+0iqWHlUaHFfTBSKzzR1Ap
	MZRNV62By3ZB5AY=; b=kSAkat/A4orU1hw1E0qGNnJmOi9HSZhOlS0H2NAs4JHg
	DWGzj35TUhgJJxAxa0SJvRgvHyo86A1ytAE3Mg6abqmUXK9eRHfcDRK4dbMlTtPs
	Q6HC8F6TOaJMW2yX3leeKu+nvl4szOnKwiJAe7p1RtPpvu5cKJQTfFYcOkb4neuN
	YIIiwPZDoZNn2YUCWuyo8EhGfsqJNNeArhMWblzjEmHeTKmPtPSJYEoF7wvsFu84
	MI/Y5yc/OO3mQ3bWGlX9YsWDGyQ6ji5QFkhIJVsSqC3yOpc/LKKUUF1kVsKj1VaR
	og5T+p8KPgn2To+pwdI/3ryhyF3iwF/vOsvDaaAcXA==
X-ME-Sender: <xms:-NWXY6jYFchrXVibclxKr_7qkcIDFOdLZdUYIN6sVPqkdMblZFXW8w>
    <xme:-NWXY7BLyoTx8lc42KmZW6sM2ZMchMs8PuKp6Q-6tLvVo5SA2iwDtNDaZ02_2Lyie
    xTMM0Ji9XXr4ec>
X-ME-Received: <xmr:-NWXYyGywqdXOkiRDMZeU90eOyoleZ0MglOl7OBj5GWn_2U3-1rwvwKfIP5u>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdelgdefiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeegteelueelleeiheetkeeiueeftedt
    fefgkeeufeefgeehleeiteejgfejjeevjeenucffohhmrghinhepfhhrvggvuggvshhkth
    hophdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:-NWXYzTqPnOYgTnbcujPYOv7hE3VCNbJRkv70MCIziD9phwNhX4Jpw>
    <xmx:-NWXY3w0aNS-pPuPAABKiPFtr2ZhJ-oBr8xgS3Kgv_Qed-N3_Ocx5A>
    <xmx:-NWXYx5dvHpsmk13vfJThIR3hClHcBpWYWLsKNTmbm0ZkU3lIfmeOA>
    <xmx:-NWXY-m3ytAUCA8HpblTMWzNeFwbxtacrELpHQcWZi9OZIErRDCRtw>
Feedback-ID: iac594737:Fastmail
Date: Mon, 12 Dec 2022 20:31:29 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	"Tim (Xen.org)" <tim@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH 8/8] Use Linux's PAT
Message-ID: <Y5fV9XeBIgLtdRxA@itl-email>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
 <9f0bd911ba6c7fe1b7285f232154d42807145ced.1670300446.git.demi@invisiblethingslab.com>
 <4b2a87e1-89d1-b5fb-bd92-b891c8cea98a@citrix.com>
 <Y4+Die8lcZUwwGmK@itl-email>
 <Y4+F9iujzOmoOAVe@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UWZR7xcu43SLGH1P"
Content-Disposition: inline
In-Reply-To: <Y4+F9iujzOmoOAVe@mail-itl>


--UWZR7xcu43SLGH1P
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Dec 2022 20:31:29 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	"Tim (Xen.org)" <tim@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH 8/8] Use Linux's PAT

On Tue, Dec 06, 2022 at 07:12:06PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Tue, Dec 06, 2022 at 01:01:41PM -0500, Demi Marie Obenour wrote:
> > On Tue, Dec 06, 2022 at 11:38:03AM +0000, Andrew Cooper wrote:
> > > On 06/12/2022 04:33, Demi Marie Obenour wrote:
> > > > This is purely for testing, to see if it works around a bug in i915=
=2E  It
> > > > is not intended to be merged.
> > > >
> > > > NOT-signed-off-by: DO NOT MERGE
> > >=20
> > > Following up on Marek's report on IRC/Matrix, you're saying that this
> > > change does actually fix screen corruption issues on AlderLake, and
> > > something on TigerLake too?
> >=20
> > Correct
> >=20
> > > If that is actually the case, then one of two things is happening.=C2=
=A0 Either,
> > >=20
> > > 1) Drivers in Linux are bypassing the regular caching APIs, or
> >=20
> > This would not surprise me at all.
> >=20
> > > 2) The translation logic between Linux's idea of cacheability and Xen=
's
> > > PAT values is buggy.
> >=20
> > How could I check for this?
>=20
> See Andy's unit test idea on #xendevel:
>=20
>     as a pretty simple "unit" test in dom0, it might be a good idea to
>     have a module which watches the PTE in question, and cycles through
>     various of the memremap_*() APIs and checks the raw PTE that gets
>     written after Linux and Xen are done fighting with it

This confirmed that the translation logic is correct, which means that
i195 is buggy.  I filed https://gitlab.freedesktop.org/drm/intel/-/issues/7=
648
for that.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--UWZR7xcu43SLGH1P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOX1fQACgkQsoi1X/+c
IsGzwBAApKIVzOPVGQdtmZMqvq8mHF3lSYc02JHR9nnxQpsrKSifDH7hDGd7Bgh4
DeFPZ35/wSXv/A/R4Emdf2cJ2SwDNqa03AuWiI1LZred5/+vPri15KGRKHGcuZ4n
zCmORs4FyFCJPpPyvSEcCWQS9qIeLM7ozQrh9wkKKxB8dz1nC1nq/jPSzyTDjEX/
NORcOvLkEAwpwJr0amTYNfxTf6xerG22dqd6NU30xpCzH4nIwvYYEqaMr4CzAvbl
F86xw08Wagno2EL3OhSJXQeNmOg7lretTzkNTFv2mU6tgz2XZFiXwEgB4dTmBULI
LWgEul3gcsXtB1HxzkkuP9rR6cXniQn2tGgRhNcSAd2x/O9L/j99RCqwUs3Byqai
4EjdR9Dpob36e0tnoFz21jS3ebIhbmossB/S3WEA9NicJMDlmE4QJQEPANgHAW+K
872j1W12yl70DIOZcMC6tJRCrohtIPSgiAhSmMHU4PN85odALmD1TrCLB9HydrRA
QgWO6bfhHxynKpmTjVx7GDX+Y1mEMJFIOqRtl2aTrmYPfCoNGwdkxg2EZKfAiYqd
tSFWU2tX0+00fV0jJE5UNIHV3Sn20iUfFvAVie8pramqOXIFkF2hGiVW0bGQ9+my
DLMMZ3MejbCEEvlz1mgFF0Vv+3WXMsjnAuT76GXAbd/CdPbtlpc=
=7fL3
-----END PGP SIGNATURE-----

--UWZR7xcu43SLGH1P--

