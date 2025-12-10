Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2848CB1B09
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 03:03:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182515.1505381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT9Xs-0001s2-Ad; Wed, 10 Dec 2025 02:03:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182515.1505381; Wed, 10 Dec 2025 02:03:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT9Xs-0001pZ-7g; Wed, 10 Dec 2025 02:03:12 +0000
Received: by outflank-mailman (input) for mailman id 1182515;
 Wed, 10 Dec 2025 02:03:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RTTf=6Q=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vT9Xq-0001pT-O5
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 02:03:10 +0000
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f37255a-d56c-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 03:03:08 +0100 (CET)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 794137A011B;
 Tue,  9 Dec 2025 21:03:07 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Tue, 09 Dec 2025 21:03:07 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Dec 2025 21:03:06 -0500 (EST)
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
X-Inumbo-ID: 5f37255a-d56c-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1765332187;
	 x=1765418587; bh=4I0nkr8i8c3PoewggU8q4XmJwBA8i9gKRowua0k6lTc=; b=
	lGR3Xko0zbn6H4/9sS1UoRSkG9XQd1DMimoYfV2EW8vPDTJLSRkpWqfEklJQal6/
	ZbOjGGx1YEvdxwpJ3A0fPsKgjJ7gMRHonjmNFwfKxomLYCC84iwRF2+uUpYVfDlB
	dlVt5RtCkdGmpJFacmnAeSY9R+LSLWd10mYclPbv+HQmQrI0Y5WmtA9VhtpJUMLO
	KIHzDpmbprKtJ/UWEpcTE+hjNwEzmFsb15c1N5yK21hV997HN07sGC3753HJr0BN
	r+9Ma+z4RkTWOxlrDgIPtItqxvqds2C3heVs5tmoEiBks6JjT+aKs/uEQQdExyQI
	OZaj6VcxCBb8rNfSuWm0BQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1765332187; x=1765418587; bh=4I0nkr8i8c3PoewggU8q4XmJwBA8i9gKRow
	ua0k6lTc=; b=YTzywSK/rCMg3wQfYYhQ08gN1KE1XLSApX3txHIpOM91N60IijO
	JpwRc4nW3ZrUu4uddt83f3oo3xTHFZRIgp7RCEY94OFiH/uFSRNEFxkknT2M6TLw
	1wjbEJDx7adjwf28/NVrWAreq400jbAcFytosS+vVLzAZYxrbLleDCmYYiIjXK+b
	2TExXL1O5J4xRtDSlV2SdCrh66luHLnzBpaswr+nDwKiTcvhXhVW2G2oI9d/KEjn
	syHolnM6zWjPC5im2TTDY9DElMwuZawCqrJH3lamZTEIExV8D2wuWqT81MUbct+5
	0IgN3twF7wgbfONmF4MDVx0O7JMfdqEz9Kg==
X-ME-Sender: <xms:29Q4aYOv_HbcbdkoB4-ejM54iISHF6jGlkLoWKqyce-mkifcZN2kiQ>
    <xme:29Q4aV8tOXnPWYTJtyJQKwjFxOrRjI8UU80lajNzFIE8mgqvEwMwb2fHw6S0QDwhd
    Uda4W4e5Gu1I8TXFnIA9fkKxpK6B3Nj21aV4w-bmvPMQ6RB>
X-ME-Received: <xmr:29Q4aUS5mZ9aY0EtzmSATaXqPKH9_O_uPGQUXREyS_wOiTmxFTYDjY_b00r3zEU-8cbKD_7XSp04NScU6sU7WE_CH4wbtcnctvY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvuddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedugfdugfdv
    vdekjeeffefgieegheduffelieeghffhiedtleeikeelgfeguddtudenucffohhmrghinh
    epghhithhlrggsrdgtohhmpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdr
    ohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtoh
    hmpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:29Q4afkHt6zcje62QRtGKNYFnIlxcEbA18XEUFpY2C2alirhZXx7Aw>
    <xmx:29Q4acRQ5e-UAknVWG3cJce0UkNxIEbGifKESMxcWel3_Sbem9HQWg>
    <xmx:29Q4aVPJeeakB_A8WSuIm6g9vWwazYMus-XDNmIiqzmA6pDCdbxGUw>
    <xmx:29Q4adVdKqfrLd1CcLJDKSyxyBAn1hfPq3FB2D8RKyxrS5FMHV9xuA>
    <xmx:29Q4afmnuFlE26ua1VyqJc4Tkc8DNF6nc-qtQP9Q5zCNGxJhYPvU0MFk>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 10 Dec 2025 03:03:04 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 07/12] Support building arbitrary Linux
 branch/tag/commit
Message-ID: <aTjU2GJFw9WcaR9X@mail-itl>
References: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
 <c7579b953d400d368f171e4dd56e1b7f879e386f.1764866136.git-series.marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2512091625190.19429@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZHvvibANWmZnJ243"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2512091625190.19429@ubuntu-linux-20-04-desktop>


--ZHvvibANWmZnJ243
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Dec 2025 03:03:04 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 07/12] Support building arbitrary Linux
 branch/tag/commit

On Tue, Dec 09, 2025 at 04:29:02PM -0800, Stefano Stabellini wrote:
> On Thu, 4 Dec 2025, Marek Marczykowski-G=C3=B3recki wrote:
> > If LINUX_URL is set, fetch LINUX_VERSION from there. Go with "git
> > init" + "git fetch" instead of "git clone" to support any of
> > branch/tag/commit.
> >=20
> > This also defines optional linux-git-* jobs which will build the thing
> > if LINUX_GIT_VERSION and LINUX_GIT_URL variables are provided for the
> > pipeline.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > The script variable and job variable need to have different names, so a
> > pipeline variable won't override it for all jobs. While LINUX_VERSION /
> > LINUX_GIT_VERSION is IMO okay, I'm not very happy about LINUX_URL /
> > LINUX_GIT_URL. Any better ideas?
>=20
> The problem is not LINUX_GIT_URL and LINUX_GIT_VERSION, those are good
> names. The issue is ...
>=20
> > ---
> >  .gitlab-ci.yml         | 22 ++++++++++++++++++++++
> >  scripts/build-linux.sh | 18 +++++++++++++-----
> >  2 files changed, 35 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index 184d0b3..8d1deee 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -1,5 +1,9 @@
> >  variables:
> >    REGISTRY: registry.gitlab.com/xen-project/hardware/test-artifacts
> > +  LINUX_GIT_VERSION:
> > +    description: "branch/tag/commit for the linux-git jobs"
> > +  LINUX_GIT_URL:
> > +    description: "git url for the linux-git jobs"
> > =20
> >  stages:
> >    - build
> > @@ -53,6 +57,15 @@ linux-6.6.86-arm64:
> >    variables:
> >      LINUX_VERSION: 6.6.86
> > =20
> > +linux-git-arm64:
> > +  extends: .arm64-artifacts
> > +  script: ./scripts/build-linux.sh
> > +  variables:
> > +    LINUX_VERSION: $LINUX_GIT_VERSION
> > +    LINUX_URL: $LINUX_GIT_URL
> > +  rules:
> > +  - if: $LINUX_GIT_VERSION && $LINUX_GIT_URL
> > +
> >  #
> >  # x86_64 artifacts
> >  #
> > @@ -91,6 +104,15 @@ linux-6.12.60-x86_64:
> >    variables:
> >      LINUX_VERSION: 6.12.60
> > =20
> > +linux-git-x86_64:
> > +  extends: .x86_64-artifacts
> > +  script: ./scripts/build-linux.sh
> > +  variables:
> > +    LINUX_VERSION: $LINUX_GIT_VERSION
> > +    LINUX_URL: $LINUX_GIT_URL
> > +  rules:
> > +  - if: $LINUX_GIT_VERSION && $LINUX_GIT_URL
> > +
> >  microcode-x86:
> >    extends: .x86_64-artifacts
> >    script: ./scripts/x86-microcode.sh
> > diff --git a/scripts/build-linux.sh b/scripts/build-linux.sh
> > index cf0e744..1fc96d1 100755
> > --- a/scripts/build-linux.sh
> > +++ b/scripts/build-linux.sh
> > @@ -12,11 +12,19 @@ COPYDIR=3D"${WORKDIR}/binaries"
> >  UNAME=3D$(uname -m)
> > =20
> >  # Build Linux
> > -MAJOR=3D${LINUX_VERSION%%.*}
> > -curl -fsSLO \
> > -    https://cdn.kernel.org/pub/linux/kernel/v"${MAJOR}".x/linux-"${LIN=
UX_VERSION}".tar.xz
> > -tar xf linux-"${LINUX_VERSION}".tar.xz
> > -cd linux-"${LINUX_VERSION}"
> > +if [[ -n "${LINUX_URL}" ]]; then
> > +    mkdir linux
> > +    cd linux
> > +    git init
> > +    git fetch --depth=3D1 "${LINUX_URL}" "${LINUX_VERSION}"
> > +    git checkout FETCH_HEAD
> > +else
> > +    MAJOR=3D${LINUX_VERSION%%.*}
> > +    curl -fsSLO \
> > +        https://cdn.kernel.org/pub/linux/kernel/v"${MAJOR}".x/linux-"$=
{LINUX_VERSION}".tar.xz
> > +    tar xf linux-"${LINUX_VERSION}".tar.xz
> > +    cd linux-"${LINUX_VERSION}"
> > +fi
>=20
> ... the issue is detecting to fetch via git or via curl based on the
> presence of a variable called "LINUX_URL". Technically=20
>=20
> https://cdn.kernel.org/pub/linux/kernel/v"${MAJOR}".x/linux-"${LINUX_VERS=
ION}".tar.xz
>=20
> is a a valid URL as well.
>=20
> So I think you should keep LINUX_GIT_URL and LINUX_GIT_VERSION named as
> they are, expose them to scripts/build-linux.sh, and detect the fetch
> program based on the presence of LINUX_GIT_URL.
>=20
> Ideally, we should not have LINUX_GIT_VERSION. Instead we should have a
> a common LINUX_VERSION used in both git and curl cases.

The problem here is conflicting variables for different jobs. If you
specify a variable when starting a pipeline (either manually, or via
schedule, or via settings), the variable will be set for all the jobs.
So, to be able to schedule a pipeline with both linux-6.12.60-x86_64 and
linux-git-x86_64 (for example based on linux-next, or maybe some rc),
the pipeline variable needs to be named differently than the one used by
this script. And IMO it's more important to have clear naming
(LINUX_GIT_VERSION+LINUX_GIT_URL) at the pipeline level.

I can change this script to use arguments instead of variables to avoid
this issue, but it will result in slightly more duplication (in
=2Egitlab-ci.yml file).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ZHvvibANWmZnJ243
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmk41NgACgkQ24/THMrX
1yy6/wf/ayndzmYmyqZ+uVeBME9WDOdQGj+H3zSUSAODb5cKCLYypgk3+XfUpSm7
AbtWuIsaqaXE3sTS3rtwLt0vs9/t/IVNr5ZfrbMfM/FAP3fLx+QDKcLJ/LcbzeWO
DFKvylrCR+tkVZwproQyqkIlmU53VxbaGlriVyTV3n+sZJpvvt61xpii0Zu9PZXR
jgFi/5tuCwlo5c8K+5KLfS5L3uvXYEse8jpS6aUuG/DZKZkYXGW6tvXBYuQn5yoZ
X0OJ9WGRc2nqNmqjTwk2Wek3Q1HgrEtX7XJn9zgSkGnJNKLAgIXGQ5nu2T92P3As
A7zznPCI+UtEWtEITEQyE9w70I4/YA==
=lZc0
-----END PGP SIGNATURE-----

--ZHvvibANWmZnJ243--

