Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB67CB9E42
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 22:33:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185855.1507804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUAke-00047V-5F; Fri, 12 Dec 2025 21:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185855.1507804; Fri, 12 Dec 2025 21:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUAke-000453-2Y; Fri, 12 Dec 2025 21:32:36 +0000
Received: by outflank-mailman (input) for mailman id 1185855;
 Fri, 12 Dec 2025 21:32:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vPyE=6S=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vUAkc-00044x-RI
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 21:32:34 +0000
Received: from fout-b7-smtp.messagingengine.com
 (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1081d8bf-d7a2-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 22:32:32 +0100 (CET)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.stl.internal (Postfix) with ESMTP id 7DCE91D00112;
 Fri, 12 Dec 2025 16:32:30 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Fri, 12 Dec 2025 16:32:30 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Dec 2025 16:32:29 -0500 (EST)
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
X-Inumbo-ID: 1081d8bf-d7a2-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1765575150;
	 x=1765661550; bh=p/wZERNdh5bjulE/fxRfnW/S7pEeyAkpaDPTdkEdhUc=; b=
	rUcvKBOe+bFbPa8dBHKeZXo8bWqrH23uFugmpHpzMBcDjj9wcSMmsKxD1S1qppGw
	+zf5GCXDfc1jgeAqY8p0Rmy/CblXAhVAuGb5a7TlooflRRUtbzymz3n5lu0ZYCr7
	IcyYxJhO7f0TnO4Bh3RARIT1D1m3Kw+4nbk/Y7I/DFk2fFF3puoDBzpKMtemjPFW
	zkJeyrX315BB0rBXHysJ39vYAjCbV5WabIQAeoLqHi3eewad9DXJHaauP/r3qxhg
	Yc/gDf9okAQArD5YHMdmqRlWtoGxJ1HFxRKe7ZMoI81OMPQSLzhxeChrTamvdk1I
	5P+urR8xy9wequHBL8/tEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1765575150; x=1765661550; bh=p/wZERNdh5bjulE/fxRfnW/S7pEeyAkpaDP
	TdkEdhUc=; b=Wh4qzdXg19WaNbR3/oDqwGehKI6E+b3gfZOL3DjltkJBuswaciT
	l/Rj6oZ+mWvj+xy/CibIkWst15rNAWFdoxWd8+hUwwCLvFyAcihWXMoP8H8IyA6l
	IhogyBMoieVQ9O5dzBeJ1yu6sSqTGwWGiAXkJcWJttEAv++8KySzpnmLOgyNWTin
	n5IUyCWPMmmPbB+nJW1tTcyv4NHsUkryfBASXftEGlzguCtV7CTE0PjzwgWy/zZP
	CnDURmVqxZN46YR/bf0VfWDDu/8SbMfAPcRyxDgKB/iFDHWcvsV+31I6r3NhL0sn
	SfCC62A8Xct5GMLYIqMS92BB1blIGjDhjNw==
X-ME-Sender: <xms:7ok8aYpo22LXAO3t-t68sBKtqbK7WxfuwdBwRIm6_YAdJ09ksVyxBQ>
    <xme:7ok8aVo_vqWyu8SGbDFOQjrd8DG56al_Vh45qCNudGFGj-El_Rpn-OllWO85TwQV9
    Q6t6xcr18WKsYV7R4OGtr8b33sbTY4cfp3ScrsT6IKkXK16>
X-ME-Received: <xmr:7ok8aSPjzV9t5kO31_6uiGbEhNR3ut976Oc-6_BEx4gKKW-fRIqSHudnY0OplnyfQfaGw-i-pKaO5F2dyaBRDccbUkn4t-WigvI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvledviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghi
    thhrihigrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnh
    hprhhojhgvtghtrdhorhhgpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:7ok8aew1H1z5HMPEULur1IEFWlhNim_MgiT4m8_EOIDlM_NW05ZuTQ>
    <xmx:7ok8aTszjU5NvdHdrWSOAcjOXZbDaE26Ey4UBoULApYfvmvwDV8A-w>
    <xmx:7ok8af4fIAGMuyl9uYI7C4xdjfbO2sFAtJwrGgaw87uXwfnQ-WWhbA>
    <xmx:7ok8aaTmfqGqMhklvGV6oHjWq-VGXcGxn2ksuyaE_ve9YG2t5HuN8Q>
    <xmx:7ok8acgXDIpyuKlL0Yk57rzvBCjd0DZCoVVHjju5wUPqim3q37wzSEnJ>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 12 Dec 2025 22:32:27 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 01/12] Add Alpine 3.22 containers
Message-ID: <aTyJ6yyR1U1C2PLI@mail-itl>
References: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
 <08274c26cc710d3bfa87a66431f441b5703df272.1764866136.git-series.marmarek@invisiblethingslab.com>
 <dd3225bd-d416-4b61-8e5b-0a0637b0193e@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LvivmXX/wf7Sej/c"
Content-Disposition: inline
In-Reply-To: <dd3225bd-d416-4b61-8e5b-0a0637b0193e@citrix.com>


--LvivmXX/wf7Sej/c
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Dec 2025 22:32:27 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 01/12] Add Alpine 3.22 containers

On Fri, Dec 12, 2025 at 09:12:38PM +0000, Andrew Cooper wrote:
> On 04/12/2025 4:37 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > Add it in all variants:
> > - base container
> > - build container
> > - initramfs archive
> >
> > libdw used to be part of libelf in Alpine 3.18, but it's a separate
> > package in 3.22.
>=20
> I think this ...
>=20
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> >  .gitlab-ci.yml                             | 14 +++++++-
> >  containerize                               |  4 ++-
> >  images/alpine/3.22-arm64-base.dockerfile   |  6 +++-
> >  images/alpine/3.22-arm64-build.dockerfile  | 31 +++++++++++++++++-
> >  images/alpine/3.22-x86_64-base.dockerfile  |  6 +++-
> >  images/alpine/3.22-x86_64-build.dockerfile | 43 ++++++++++++++++++++++=
+-
> >  scripts/alpine-rootfs.sh                   |  4 ++-
> >  7 files changed, 108 insertions(+)
> >  create mode 100644 images/alpine/3.22-arm64-base.dockerfile
> >  create mode 100644 images/alpine/3.22-arm64-build.dockerfile
> >  create mode 100644 images/alpine/3.22-x86_64-base.dockerfile
> >  create mode 100644 images/alpine/3.22-x86_64-build.dockerfile
> >
> > diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
> > index 6fa1d56..c9c0d43 100755
> > --- a/scripts/alpine-rootfs.sh
> > +++ b/scripts/alpine-rootfs.sh
> > @@ -40,6 +40,10 @@ case $UNAME in
> >              # QEMU
> >              libelf
> >              )
>=20
> ... wants to be a comment here too.=C2=A0 I can fix on commit.

+1=20

> ~Andrew
>=20
> > +        if ! grep -q VERSION_ID=3D3.18 /etc/os-release; then
> > +            # QEMU
> > +            PKGS+=3D( libdw )
> > +        fi
> >          ;;
> > =20
> >      aarch64)
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--LvivmXX/wf7Sej/c
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmk8iesACgkQ24/THMrX
1yz5JAf/bUQskNY10T13wDPfkLedOBjwBu6b3cfEWmmtmyKy8504fHOb4nnQZ4Wg
g/vH946GWYnAbJoNc+QYSZfY8c0C1m2R+g8MJUDuM6eqLb8sU6QqEaw6ZJBz9rpD
tb1gGVUoO1sXrLlM87SO2Old4sBx4o+Sfa1/U35CJf/JmUKYbDtgzytgDm68CU29
MKiMFqY3raQwEUT/XmZA6X0PKQczJyIu1mlpneXmHokTfjhSlWmGyGYrVGV3tkfK
80Tyn6QBRs4+fCI6ZoYMBZN0CBMqKzoU8B+x+m2qBfmgAEIrLa1EXLMchPUbE7CF
mq5ZCcg8CNyhZPnFkGcVrAIHJvOBIg==
=IR37
-----END PGP SIGNATURE-----

--LvivmXX/wf7Sej/c--

