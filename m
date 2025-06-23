Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C07CAE5115
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 23:30:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022803.1398658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTokC-0007bu-07; Mon, 23 Jun 2025 21:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022803.1398658; Mon, 23 Jun 2025 21:30:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTokB-0007Yt-T6; Mon, 23 Jun 2025 21:30:23 +0000
Received: by outflank-mailman (input) for mailman id 1022803;
 Mon, 23 Jun 2025 21:30:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TVau=ZG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uTokA-0007Yn-8f
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 21:30:22 +0000
Received: from fhigh-b3-smtp.messagingengine.com
 (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42b0e397-5079-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 23:30:19 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 4F5D57A0081;
 Mon, 23 Jun 2025 17:30:18 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Mon, 23 Jun 2025 17:30:18 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jun 2025 17:30:16 -0400 (EDT)
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
X-Inumbo-ID: 42b0e397-5079-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750714218;
	 x=1750800618; bh=ZT4Gj0OcXUjMt7e2JG9WKuEXZFrHqlaBtM4crmsHJLk=; b=
	Xyr+cEDcMiFq9nBwHruLfoiNYDlg/LfztLqpYIPTKspGI8FB2b0i5h55mUdM3cQ/
	av2UjnByhPLq8vrMGYc5hxbf3Bm+EwZHIh/bWr6iOvLdgqN74IZeKL1bIO3gxAvy
	Q+Jlqt8zPjXB9ApgLnsSiQK5CJvjLTDN2cNSBeVE7mq/tWUulyLXcZEl9m3HmAvQ
	+5TmeKEH37S2xb4mbJKU/qtLhqE23xjM6XyhRQ2yyOe5lwjtBSPsCUy/PSOD5JaF
	emkFbMUE0Y6C+Inr5F+k0+Py6ALUvkA3NAeHlPQ3NSTuHFDpY32wd61i8k+HmF+l
	Lu8XRMEqvsEgFxvIT2qUTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750714218; x=1750800618; bh=ZT4Gj0OcXUjMt7e2JG9WKuEXZFrHqlaBtM4
	crmsHJLk=; b=rEk5DHNZ2cdHlWtT/swipaJJ4WtKLkxEMKtMQYqAfIpaLYu0gH7
	XRAvMxmd0ya8nBV+VlbV1/4uq/0xeBjFL1LoGElcuTVbO8oA5FyMFzy8ALBRXNI9
	b8uvIdCDFgYiZTYA7fkI/P9XB3S8OCGXL1NZLlV1GNdEq0wPz9eYYNqVUoRQzYVE
	VHzBSI0RoHK4YR/KCvWxspLjPBnKYZ0niHPlMx+OHK1OKWyK7L+yj5Q3ijZdA4D7
	nXTvepIXtIX1fUsL0REnsw73cJJYC2g0bnea2jRcS44gyKRnBufv+WOHVUoSopgt
	HdP+4edttMqW2B3IDwIuxLbanGLG01N7qLA==
X-ME-Sender: <xms:acdZaOXIGFtyMzmKrwu3ruGdNsl1f9RtMaSDnjRPSnzDcjOUxE9PeA>
    <xme:acdZaKljHR-rwOfJiLNfjkGotBsMClTGRCVrie1ovhiEYKdbZBXU-a-00ZMWXb3KT
    K3RRg8VkvzGRg>
X-ME-Received: <xmr:acdZaCadOQwWCzU6g7YcYDtzv4f08f3iXVMjB1uhixhJxYMLk6QMgGlrGXbseeziboMsZDdyxQeYH0va4T2j8NQQo8fKpULRMlQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddukedutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeefveevfffg
    heettdejhfevleegieekvdduueejfeejuedvleekieejudeludehheenucffohhmrghinh
    epkhgvrhhnvghlrdhorhhgpdhgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeefpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdr
    ohhrghdprhgtphhtthhopegtrghrughovgestggrrhguohgvrdgtohhm
X-ME-Proxy: <xmx:acdZaFV5ow8CYtaoPUDU7-NwR8_LDjqrYLIOCTM7RJ26U11g6unkjg>
    <xmx:acdZaInLPFSQvd8UYZNhUeXSLpKD0NjQAMTbNqMhgUUM8b6JuNXC0g>
    <xmx:acdZaKdb8m2uIjHsH00ZpbL0Y687B_bT34FwTILJV97d1i5X2vUIbw>
    <xmx:acdZaKGhGlHnCOMrqTlNse4oCp-bkhdDDcb6f99csV9j7btQxwdp_g>
    <xmx:asdZaCkGhEABNiUNmFShP9wPnNd18DwhUUBA1tNCOBu_A5QCrfd5PncZ>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 23 Jun 2025 23:30:14 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1 4/6] CI: make test-artifacts branch/job customizable
Message-ID: <aFnHZnxBextHJRZy@mail-itl>
References: <cover.16ccd290bf95e314a4f23777f5564b3aa2417e57.1750686195.git-series.marmarek@invisiblethingslab.com>
 <7c032d51b6183888cb0fcb71662b452fd9cb5a20.1750686195.git-series.marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2506231401090.8066@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N8cwctjf6Esz6SM1"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2506231401090.8066@ubuntu-linux-20-04-desktop>


--N8cwctjf6Esz6SM1
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Jun 2025 23:30:14 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1 4/6] CI: make test-artifacts branch/job customizable

On Mon, Jun 23, 2025 at 02:04:36PM -0700, Stefano Stabellini wrote:
> On Mon, 23 Jun 2025, Marek Marczykowski-G=C3=B3recki wrote:
> > Allow choosing which artifacts branch and job to use for Linux. This
> > allows running the same tests for different Linux versions, without
> > duplicating a lot of yaml sections.
>=20
> I just sent this reply:
> https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2506231351060.8066@=
ubuntu-linux-20-04-desktop/
>=20
> You are answering my question: the goal is to allow much wider Linux
> versions testing? Because if not, I don't think there is much of a
> benefit.

Yes, the goal is to get wider Linux versions testing, including some
select "staging" Linux branches, not only frozen tags.

> Do you envision a bunch of jobs in automation/gitlab-ci/test.yaml that
> play with different LINUX_JOB_X86_64 / LINUX_JOB_ARM64 ? If so, we would
> need the corresponding jobs in test-artifacts.

See the cover letter (in which I forgot to CC you...).
The idea is to have separate pipelines (via a schedule) to test
different Linux branches, and each of them would select what Linux
branch is tested using those variables. For the LINUX_JOB_* variables it
would be mostly selecting between "frozen" Linux tag (for Xen standard
pipeline) and the "arbitrary git branch" one (for different Linux
versions). And then in the test-artifacts repo it can be either by
adding more jobs (as you suggests here), or more branches (all equal to
master) - each having a pipelines with different
LINUX_GIT_VERSION/LINUX_GIT_URL. In the latter case,
LINUX_ARTIFACTS_BRANCH would select which Linux build to use (+
LINUX_JOB_* set to linux-git-*).


> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > I have considered common LINUX_JOB and then add architecture suffix, but
> > even now X86 and ARM use different jobs, so I made them separate.
> > ---
> >  .gitlab-ci.yml                 |  9 +++++++++
> >  automation/gitlab-ci/test.yaml |  8 ++++----
> >  2 files changed, 13 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index 7974ac4e82bc..c1d92dc485e7 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -2,6 +2,15 @@ variables:
> >    XEN_REGISTRY: registry.gitlab.com/xen-project/xen
> >    SELECTED_JOBS_ONLY:
> >      description: "Regex to select only some jobs, must be enclosed wit=
h /. For example /job1|job2/"
> > +  LINUX_ARTIFACTS_BRANCH:
> > +    description: "Branch in test-artifacts to use for Linux"
> > +    value: master
> > +  LINUX_JOB_X86_64:
> > +    description: "Job name in test-artifacts to use for Linux x86_64"
> > +    value: linux-6.12.34-x86_64
> > +  LINUX_JOB_ARM64:
> > +    description: "Job name in test-artifacts to use for Linux arm64"
> > +    value: linux-6.6.86-arm64
> > =20
> >  workflow:
> >    name: "$CI_PIPELINE_SCHEDULE_DESCRIPTION"
> > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test=
=2Eyaml
> > index dc08488e76f4..9fd66fb6138d 100644
> > --- a/automation/gitlab-ci/test.yaml
> > +++ b/automation/gitlab-ci/test.yaml
> > @@ -9,8 +9,8 @@
> > =20
> >  .arm64-test-needs: &arm64-test-needs
> >    - project: xen-project/hardware/test-artifacts
> > -    job: linux-6.6.86-arm64
> > -    ref: master
> > +    job: $LINUX_JOB_ARM64
> > +    ref: $LINUX_ARTIFACTS_BRANCH
> >    - project: xen-project/hardware/test-artifacts
> >      job: alpine-3.18-arm64-rootfs
> >      ref: master
> > @@ -21,8 +21,8 @@
> > =20
> >  .x86-64-test-needs: &x86-64-test-needs
> >    - project: xen-project/hardware/test-artifacts
> > -    job: linux-6.12.34-x86_64
> > -    ref: master
> > +    job: $LINUX_JOB_X86_64
> > +    ref: $LINUX_ARTIFACTS_BRANCH
> >    - project: xen-project/hardware/test-artifacts
> >      job: alpine-3.18-x86_64-rootfs
> >      ref: master
> > --=20
> > git-series 0.9.1
> >=20


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--N8cwctjf6Esz6SM1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhZx2cACgkQ24/THMrX
1yzMuAf/S+dw+6Mw6ytv0FlWYc9Kth5SCdKNJaq+MCYplK3TlV6KHa6ZyC0sDNNI
0KBSb4t6pyRR4Ieo7Kg/V0vYOV3xM3prslDpynBfIkxN7DSoAdaYYb4V/u+bidya
EzwpF4TmP761GXLSW+klxfEKha4qZV2jHzgdGoPdKm0hKGt1ctWZSgNR7YaIOXvJ
0Gv54EWd6WaR3dfPsjmHWmfVZ4OfyagC35UvnGbyCUjCXGqBQ6IHx8Mpskz1qbp0
JvpBXMYb0/8os+kQve9j+yNuLqhj99BwZGKl3QOLz1Yki+UQPulML93WjjSB8JZb
YNaWore/VUvEhgVAC9Ts6P43zAlMGQ==
=Dq3w
-----END PGP SIGNATURE-----

--N8cwctjf6Esz6SM1--

