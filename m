Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A256486BE
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 17:48:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458102.715970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3gY3-0002nq-Re; Fri, 09 Dec 2022 16:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458102.715970; Fri, 09 Dec 2022 16:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3gY3-0002l5-OY; Fri, 09 Dec 2022 16:48:31 +0000
Received: by outflank-mailman (input) for mailman id 458102;
 Fri, 09 Dec 2022 16:48:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iKBv=4H=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p3gY2-0002kz-0L
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 16:48:30 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d10fc3c-77e1-11ed-8fd2-01056ac49cbb;
 Fri, 09 Dec 2022 17:48:27 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 9D509320091D;
 Fri,  9 Dec 2022 11:48:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 09 Dec 2022 11:48:25 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Dec 2022 11:48:23 -0500 (EST)
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
X-Inumbo-ID: 4d10fc3c-77e1-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1670604504; x=
	1670690904; bh=rwcevJsGOOu+mkfRIURBcgYHTUxPCM/K0K22OeKSv7Y=; b=p
	f2zXWh2/SPwLKZeYwU92bBX46Y59gcFBP68TgK9lDAwfW3NtQyAz8LpnyPx+tRdq
	glfbGkd37ggoFH6Jh6QlcCIFQJ9XmNQbpvdEOJLCBj4vhELqymqdyh3IU5+JA7gC
	LFrUqfVJ4ezK2b6va31uQ2mJ3xLHjIbi0eJJMhSCJy3m6zmoF7eAin4jRTC4k7F4
	nbtj0OhAFdccUQeeKp+EcWTCDQIx8WwDnjCL9P1nmAgAxh2DkLavKDl9hg0r0OVo
	KOssCXjSUX1ByQRu9Fetl3BiVGt4hTVEuiWVYc+3iBbplD8W0JVj+cx0DR4zAJHY
	FAyggPPAnfSVKCXRUnNXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1670604504; x=1670690904; bh=rwcevJsGOOu+mkfRIURBcgYHTUxP
	CM/K0K22OeKSv7Y=; b=vcNrPlLfmbyNoP0sgWYWX6wTm1lEzNBpBNLMY8D2wqee
	+NaRYr4CuxHQDDYkO5t0cfIZmIN5WHqYvWwhuOTPrjO6J8DMJeoxWKN+wOkEUCdj
	2CrRDgaRDRIMGvAtnwGQy27bgoZ3Blsabihl4x/8KVoCCqz9M1h22KK2Srt8Y6NI
	jTRUMo4x4SKz4Lv/tXL+DRlTksWd3DeGXA26psNmFLq43qXAD5eWTD0Y7A+3CBLO
	ZIJhVD1Yyy59qyNixtdFNQKaxvdSP+2KtCwlvUpGCGk81B+O1XxxzqIE30zDjvy5
	3HP2Ok7elYUpQLcltQ2QYlKC/BZUzkoxnWIW1VrCvw==
X-ME-Sender: <xms:12aTY4XAGcCk-qpHlm24sexGIlMEnQtN7lfw4N7523a_AUFgk8Ak7A>
    <xme:12aTY8mSgAY26KIThC_Adp-K0H0qm2V6pWtK4pAtMQU6prEqTmEref10XFJVPCl1Y
    dJ4H9WBurqrFqc>
X-ME-Received: <xmr:12aTY8ZtS9-fEC8xUysLMazPNzB65q3gB7zlYweykfeQyX_1XDurrmPU8lWL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvgdelvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffegfffg
    uddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:12aTY3UNKQP3iIALylivbQprfU6zE3pw-28bJKbPnG5fbFdpBJZnJw>
    <xmx:12aTYymdsVQBLwvOg7NDqFWItS46QYUlz81IFfgxwWo6NBUFy-6GRg>
    <xmx:12aTY8dchZPj0VCMz-84FCC9BhXVf_EP8CVHX7itEFSJ8-cEomyktQ>
    <xmx:2GaTY0j0O8Awol2wMn1QA9BgQHsJ7uDHDcIzTVOpN8RMHBaioqQJSg>
Feedback-ID: iac594737:Fastmail
Date: Fri, 9 Dec 2022 11:48:17 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Henry Wang <Henry.Wang@arm.com>, Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>
Cc: Ard Biesheuval <ardb@kernel.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] Use EfiACPIReclaimMemory for ESRT
Message-ID: <Y5Nm1bYC3GdEiNyN@itl-email>
References: <ce73ae2fa148c5d79a038275b0983d24537e97de.1665458679.git.demi@invisiblethingslab.com>
 <9c1e3cc3-e0b4-6ca5-087b-55117b45db80@suse.com>
 <AS8PR08MB7991E4EE490EC8B028BB1D2F921D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <5ce98ff4-6b7d-2254-d755-a68fc3ac67b4@xen.org>
 <AS8PR08MB7991A81EEEC33451800CAF97921C9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <Y5M1D4w44uIddxNn@itl-email>
 <AS8PR08MB79916F9F373BAC3D805B63FB921C9@AS8PR08MB7991.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jMGzixMHSvII9kj3"
Content-Disposition: inline
In-Reply-To: <AS8PR08MB79916F9F373BAC3D805B63FB921C9@AS8PR08MB7991.eurprd08.prod.outlook.com>


--jMGzixMHSvII9kj3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 9 Dec 2022 11:48:17 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Henry Wang <Henry.Wang@arm.com>, Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>
Cc: Ard Biesheuval <ardb@kernel.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] Use EfiACPIReclaimMemory for ESRT

On Fri, Dec 09, 2022 at 02:54:15PM +0000, Henry Wang wrote:
> Hi,
>=20
> > -----Original Message-----
> > From: Demi Marie Obenour <demi@invisiblethingslab.com>
> > Subject: Re: [PATCH v3] Use EfiACPIReclaimMemory for ESRT
> >=20
> > On Fri, Dec 09, 2022 at 07:37:53AM +0000, Henry Wang wrote:
> > > Hi Julien,
> > >
> > > > -----Original Message-----
> > > > From: Julien Grall <julien@xen.org>
> > > > Subject: Re: [PATCH v3] Use EfiACPIReclaimMemory for ESRT
> > > >
> > > > Hi,
> > > >
> > > > >>> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > > > >>
> > > > >> Acked-by: Jan Beulich <jbeulich@suse.com>
> > > > >>
> > > > >>> Should this be included in 4.17?  It is a bug fix for a feature=
 new to
> > > > >>> 4.17, so I suspect yes, but it is ultimately up to Henry Wang. =
 The code
> > > > >>> is identical to v2, but I have improved the commit message.
> > > > >>
> > > > >> It may be too late now, looking at the state of the tree. Henry,=
 Julien?
> > > > >
> > > > > Like I said in v2, I don't object the change if you would like to=
 include
> > this
> > > > patch
> > > > > to 4.17, so if you are sure this patch is safe and want to commit=
 it, feel
> > free
> > > > to add:
> > > > >
> > > > > Release-acked-by: Henry Wang <Henry.Wang@arm.com>
> > > > >
> > > > > Since we also need to commit:
> > > > > "[PATCH for-4.17] SUPPORT.md: Define support lifetime" so from my
> > side
> > > > > I am no problem. Julien might have different opinion though, if J=
ulien
> > > > object
> > > > > the change I would like to respect his opinion and leave this pat=
ch
> > > > uncommitted.
> > > >
> > > > I have committed it after SUPPORT.md. So if for some reasons we are
> > seen
> > > > any issues with Osstest, then I can tag the tree without this patch
> > >
> > > This is a great solution :)
> > >
> > > > (that said, I would rather prefer if we have staging-4.17 =3D=3D st=
able-4.17).
> > >
> > > Looks like now staging-4.17 =3D=3D stable-4.17 now, with this patch p=
ushed.
> > > So we are ready to tag.
> >=20
> > And it turns out that I botched the initial patch, sorry.  (I forgot to
> > handle the multiboot2 case.)
> >=20
> > I understand if it is too late for stable-4.17, but it ought to make
> > stable 4.17.1 as it was simply omitted from the initial patch series.
>=20
> I don't think this patch will make it today so I would suggest we still f=
ollow
> what Julien planned yesterday. Also I think this is also consistent with =
the
> release management guideline.

That=E2=80=99s okay.  Qubes can take this as an out of tree patch until it =
is
merged.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--jMGzixMHSvII9kj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOTZtUACgkQsoi1X/+c
IsFbFg//YoD5egzocgW6gmujtLUEGJzSpAkKhJJen8b8ukCCnqC6+FrCD5TEU0h4
eR9h+ujiUa0xnWDarcLc71ZTE0c4rbCUAKHj40PBstX/iokspxN9nGMXblHUFLvb
VRnKGhfn9r8vLYCHomGhQLZ5cZiaKaTQwCPeWJ6/Af/NWYKNYarhrRpHjQBSsGet
MXoKLt//7Qj1heCEM/UIWd394tpSROu11uhV8ABZjwbJbj7auFQAbFvJHUxexf59
vUEK1nrtfNBpRtC1v/a/46shn2lfvqt6ATa0s7RVZyrixnHlCvxeBnjQ605cxPrM
Uk+QP2Cb7gd4a9y4zBJ9dLG5sYS/DZTJRro3B2hrpc0VfLAZHDOBFzVgoUo3N9ib
kn+uZyVhM4xd3GyRfP/0hOYmIaDdT/9WWorv2r2yTENgZ/VbNshIiv0PamSGrkjO
T7SGzgw2cC5GKEAB1M7VNpogF7D8zXfN9F6pdTpJM22SsrejIZOMCF4lDvGAmTVJ
yCygSys8QdstOrpnwMPevmKH7Sh4kdelsxkp0XRGX7pmWjBrsgdC4Gx0Mk9xugrl
CMv1HX3bBMm5KV/1vPrxpr7VjLs7quKyIuNFpeaxs/N2BRWD4QYhksioPLxqqfMT
267fXt2kaBMKAQdjYPVjBKtOgZh7c1ZpjUotpa5pbzkwJ7jgnu4=
=8X9s
-----END PGP SIGNATURE-----

--jMGzixMHSvII9kj3--

