Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D437A36AB3
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2025 02:15:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889252.1298442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj6lZ-00026H-3y; Sat, 15 Feb 2025 01:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889252.1298442; Sat, 15 Feb 2025 01:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj6lZ-00024Q-1L; Sat, 15 Feb 2025 01:14:45 +0000
Received: by outflank-mailman (input) for mailman id 889252;
 Sat, 15 Feb 2025 01:14:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C9vo=VG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tj6lW-00024K-RQ
 for xen-devel@lists.xenproject.org; Sat, 15 Feb 2025 01:14:42 +0000
Received: from fhigh-b3-smtp.messagingengine.com
 (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a9aa5ed-eb3a-11ef-9896-31a8f345e629;
 Sat, 15 Feb 2025 02:14:40 +0100 (CET)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 06DAB25400FB;
 Fri, 14 Feb 2025 20:14:39 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-08.internal (MEProxy); Fri, 14 Feb 2025 20:14:39 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Feb 2025 20:14:37 -0500 (EST)
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
X-Inumbo-ID: 3a9aa5ed-eb3a-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1739582078;
	 x=1739668478; bh=mYH4yMAVcWP+QW4nsXtDS14D1ZRQ2W0J8gkMySRcFuM=; b=
	Q6mvrg7Nmx59udp8mcqrQaLoon4rvEf1WQLAVQ2dAkrkPD248OcAYJkjxymfrqJ/
	02AyhdsuE7ALW3C6CsL23gA0OCmnrZUMUBOi7sK3yU3hV76xky26snRqJe4ucyT1
	P0VgicYGxyv94A4q7dRjyx6kGELf07To04OpGx+pGHKGALaK6Z3p5SAH23Bx/lcu
	eCvcZE0hExPLTolW/Cvz6tz9f9eepmAgY2arzRwze+aHIg+LFUUPhg0rtog0aTxb
	U1gEgMD7T/mh6GYUjzSNX0BWhIc4/u+7MBLKElyDACK5soeJF/jKrKGWMx+/lrwc
	fHP9PrOsk3xjBJmNbj7GDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1739582078; x=1739668478; bh=mYH4yMAVcWP+QW4nsXtDS14D1ZRQ2W0J8gk
	MySRcFuM=; b=C7GI+Ex6IC01CuaShLSXBhqaEeD33aERHc7zoPXphhX5XvZOo6r
	m0Yf0QWRuDO1Cup2oT6kQedbbhMfYI7ljidRMMeAJnQeLdxrXtTc59sbwmDiuGCu
	s1riRYmyDy04/MqZou477jQoSMEmKT8jmXhcL4Z/gaIGXmKUrtw82c84BYmIl62g
	xSyZ3sXYwizxKvnuf2UHT+JtlBJxUUILlsCuN6kmLu34M0v4c0i66qWkG7qVwU9S
	qG+9B6ZmFa6dQexSYKlervKIM1QxHj6M0wxdAwaLmuZymPRD3LLv9597VEErCpW1
	cqrBZg55GY/RQ0UOba0au3M7ewGkXvR5vug==
X-ME-Sender: <xms:fuqvZ39a4PQer9o_NNeLIBCt4GGbJsqGd-RAroNGo741T7DHC18pXA>
    <xme:fuqvZzu-3qvQ6l-9J6L5PBIEioh_tRCUkHuuGcLdqvNBOwpWkthZh89wtLYLg21G4
    bTSbHmMhcHvZQ>
X-ME-Received: <xmr:fuqvZ1BZhMxebNxtTLrUEGIGJ1o5_VX9CdscQ19kic7bAnNL2rdxr79I5BflX35jwGCrWj14GCpontZTYQtV9kfqHq4jELVK1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehuddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpeeugfdvfedufeffjeeugfevleekkeevieehvdegfeehteevieeuve
    evveelieehveenucffohhmrghinhepghhithhlrggsrdgtohdrjhhppdhgihhtlhgrsgdr
    tghomhdpgihktggurdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgr
    sgdrtghomhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgigv
    nhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoh
    eptggrrhguohgvsegtrghrughovgdrtghomh
X-ME-Proxy: <xmx:fuqvZzdTO_cGTYJmg_wkOBHmp6SXDGt-PNqrTVnWxdLBcH91cDdngA>
    <xmx:fuqvZ8Oc_TVQ6cIKsyspIL_hO95P23oKzVZITYF4pGHpE5LIoC8Kpw>
    <xmx:fuqvZ1mNffZlNVX0TYJC-xufpJkzRqlBy82Q-gG-x-_usYpkZWtfJA>
    <xmx:fuqvZ2u2HK-3Ao-reHYMBBIATq3oHqmyq1O8hCIbUq3KDv8CH9d0VQ>
    <xmx:fuqvZxrlflv8-WkceLyRggxXpfTL65T-t7J0vVHDsiqEobt3X-o-zcM->
Feedback-ID: i1568416f:Fastmail
Date: Sat, 15 Feb 2025 02:14:35 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 3/4] automation: allow selecting individual jobs via
 CI variables
Message-ID: <Z6_qe_t46ZHN0DOG@mail-itl>
References: <cover.36ee649a8537af1a5fb5b3c5b7ffc0d8a1369969.1739496480.git-series.marmarek@invisiblethingslab.com>
 <53730b7d7120635ce9079b57fc7e25b610569316.1739496480.git-series.marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2502141627210.3858257@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iTVop1iTCIyhKfMH"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2502141627210.3858257@ubuntu-linux-20-04-desktop>


--iTVop1iTCIyhKfMH
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Feb 2025 02:14:35 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 3/4] automation: allow selecting individual jobs via
 CI variables

On Fri, Feb 14, 2025 at 04:29:17PM -0800, Stefano Stabellini wrote:
> On Fri, 14 Feb 2025, Marek Marczykowski-G=C3=B3recki wrote:
> > Debugging sometimes involves running specific jobs on different
> > versions. It's useful to easily avoid running all of the not interesting
> > ones (for given case) to save both time and CI resources. Doing so used
> > to require changing the yaml files, usually in several places.
> > Ease this step by adding SELECTED_JOBS_ONLY variable that takes a regex.
> > Note that one needs to satisfy job dependencies on their own (for
> > example if a test job needs a build job, that specific build job
> > needs to be included too).
> >=20
> > The variable can be specified via Gitlab web UI when scheduling a
> > pipeline, but it can be also set when doing git push directly:
> >=20
> >     git push -o ci.variable=3DSELECTED_JOBS_ONLY=3D"/job1|job2/"
> >=20
> > More details at https://docs.gitlab.co.jp/ee/user/project/push_options.=
html
> >=20
> > The variable needs to include regex for selecting jobs, including
> > enclosing slashes.
>=20
> Does it work with a single job like this?
>=20
> git push -o ci.variable=3DSELECTED_JOBS_ONLY=3D"job1"

No, it works with:

    git push -o ci.variable=3DSELECTED_JOBS_ONLY=3D"/job1/"

or rather:

    git push -o ci.variable=3DSELECTED_JOBS_ONLY=3D"/^job1$/"

> If it does, is there any way we could use to automatically whitelist its
> dependencies too? Because that would be so much easier to use...

I guess it should be possible to add some extra condition for
dependencies, like extending rules for alpine-3.18-gcc-debug
specifically with

  - if: $SELECTED_JOBS_ONLY && "adl-smoke-x86-64-gcc-debug" =3D~ $SELECTED_=
JOBS_ONLY
    when: always

(and repeated for other tests depending on this build job)

But that means dependencies need to be kept in sync manually, in two
places. The absolute lack of any variables processing (even a simple
string concatenation...) at this stage of gitlab yaml processing makes
it challenging to propose any even semi-reasonable solution...

On the other hand, if you care about specific test, you can easily get
its dependencies by either looking at test.yaml, or clicking "show
depdendencies" in gitlab ui and hovering over the job you want.

> > A coma/space separated list of jobs to select would be friendlier UX,
> > but unfortunately that is not supported:
> > https://gitlab.com/gitlab-org/gitlab/-/issues/209904 (note the proposed
> > workaround doesn't work for job-level CI_JOB_NAME).
> > On the other hand, the regex is more flexible (one can select for
> > example all arm32 jobs).
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > This probably wants documenting beyond this commit message. I don't
> > think we have any CI-related docs anywhere, do we? Some new file in
> > docs/misc?
>=20
> Please add documentation for it. Other than that, I think it could be
> committed. I would prefer you also added documentation about alternative
> methods such as removing all the jobs except the ones you care about.

Do we really want to recommend removing unnecessary jobs, given a better
option exists now?
I know https://xkcd.com/1171/, but still...

> > And also, it's possible to extend web ui for starting pipelines to
> > include pre-defined variables. I use it in qubes here if you want to
> > see:
> > https://gitlab.com/QubesOS/qubes-continuous-integration/-/pipelines/new
> > Does it make sense to include SELECTED_JOBS_ONLY this way too?
> > Personally, I'll probably use it via cmdline push only anyway, but I
> > don't know what workflows other people have.
> > ---
> >  automation/gitlab-ci/build.yaml |  6 ++++++
> >  automation/gitlab-ci/test.yaml  | 14 ++++++++++++++
> >  2 files changed, 20 insertions(+)
> >=20
> > diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/bui=
ld.yaml
> > index 35e224366f62..f12de00a164a 100644
> > --- a/automation/gitlab-ci/build.yaml
> > +++ b/automation/gitlab-ci/build.yaml
> > @@ -12,6 +12,12 @@
> >        - '*/*.log'
> >      when: always
> >    needs: []
> > +  rules:
> > +  - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =3D~ $SELECTED_JOBS_ONLY
> > +    when: always
> > +  - if: $SELECTED_JOBS_ONLY
> > +    when: never
> > +  - when: on_success
> > =20
> >  .gcc-tmpl:
> >    variables: &gcc
> > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test=
=2Eyaml
> > index c21a37933881..93632f1f9204 100644
> > --- a/automation/gitlab-ci/test.yaml
> > +++ b/automation/gitlab-ci/test.yaml
> > @@ -1,6 +1,11 @@
> >  .test-jobs-common:
> >    stage: test
> >    image: ${XEN_REGISTRY}/${CONTAINER}
> > +  rules:
> > +  - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =3D~ $SELECTED_JOBS_ONLY
> > +  - if: $SELECTED_JOBS_ONLY
> > +    when: never
> > +  - when: on_success
> > =20
> >  .arm64-test-needs: &arm64-test-needs
> >    - alpine-3.18-arm64-rootfs-export
> > @@ -99,6 +104,9 @@
> >        - '*.dtb'
> >      when: always
> >    rules:
> > +    - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =3D~ $SELECTED_JOBS_ONLY
> > +    - if: $SELECTED_JOBS_ONLY
> > +      when: never
> >      - if: $XILINX_JOBS =3D=3D "true" && $CI_COMMIT_REF_PROTECTED =3D=
=3D "true"
> >    tags:
> >      - xilinx
> > @@ -117,6 +125,9 @@
> >        - '*.log'
> >      when: always
> >    rules:
> > +    - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =3D~ $SELECTED_JOBS_ONLY
> > +    - if: $SELECTED_JOBS_ONLY
> > +      when: never
> >      - if: $XILINX_JOBS =3D=3D "true" && $CI_COMMIT_REF_PROTECTED =3D=
=3D "true"
> >    tags:
> >      - xilinx
> > @@ -137,6 +148,9 @@
> >        - '*.log'
> >      when: always
> >    rules:
> > +    - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =3D~ $SELECTED_JOBS_ONLY
> > +    - if: $SELECTED_JOBS_ONLY
> > +      when: never
> >      - if: $QUBES_JOBS =3D=3D "true" && $CI_COMMIT_REF_PROTECTED =3D=3D=
 "true"
> >    tags:
> >      - qubes-hw2
> > --=20
> > git-series 0.9.1
> >=20


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--iTVop1iTCIyhKfMH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmev6nsACgkQ24/THMrX
1yys6Af9FJBX154+YtD8GzcFIJt+wVUUulErAg5OAIrxk8IAYaU4jQvfa1Q5AJn0
h/smnMnyReuSQiPZdelMIGStvX5rrn6qXKRebI+J04z+2jiKWPKkgg3rmGrBaB1q
47S8nJl7btzGGZGDPIgYRJZeSNnAaZsR+CXSXJsUiIB/1zVIWN36jwiNr6yImW2k
zTTkwiMlPPIPVdQL1kcZO7yc5b1A1dhJPT8gWKegCWXPBeQZ5KWDHsd7WjWNpxDs
/ywP7/UA3UJLB2LXexdQKlmAYNR2gXgPawHc/x36WuL3kPW6cz8D+tVVfZoY1LKj
sCkz3XPCjNMwCeAf5oY53tgxf0LZew==
=zQVq
-----END PGP SIGNATURE-----

--iTVop1iTCIyhKfMH--

