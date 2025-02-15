Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B96CDA36A2D
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2025 01:54:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889239.1298431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj6Rt-0008Td-FD; Sat, 15 Feb 2025 00:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889239.1298431; Sat, 15 Feb 2025 00:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj6Rt-0008Qz-Be; Sat, 15 Feb 2025 00:54:25 +0000
Received: by outflank-mailman (input) for mailman id 889239;
 Sat, 15 Feb 2025 00:54:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C9vo=VG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tj6Rr-0008Qt-RQ
 for xen-devel@lists.xenproject.org; Sat, 15 Feb 2025 00:54:24 +0000
Received: from fhigh-b2-smtp.messagingengine.com
 (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 636ef27d-eb37-11ef-9896-31a8f345e629;
 Sat, 15 Feb 2025 01:54:20 +0100 (CET)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 0A2C425400F6;
 Fri, 14 Feb 2025 19:54:19 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Fri, 14 Feb 2025 19:54:19 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Feb 2025 19:54:17 -0500 (EST)
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
X-Inumbo-ID: 636ef27d-eb37-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1739580858;
	 x=1739667258; bh=X61cSb//XlTREU7xZw7jpsq/hlG6osrsXU2hPl2Ei0Y=; b=
	FzW/OcuMn2T2xG9FMEVsvaN4U37dN2E1rqkwFMPNvbZ+A7MOFq9q8GYO5VgoJ3iZ
	2tcPBQdsvkP8kL1E69ekFvBSxZyJcfUbQBwXiGyuoZ63V70dSb/N7iiHzxHQnfjn
	Ai8LbFbPyY3lFZe15k1xJR0DMVEC5Ij96+VUnwppvmLHSCpFcZ82fuJV4ZQoGAgV
	uQ0JStXFX9YRtDqXfFJSVzO91q2xJ/twhjHLBfxfMqmFm/l8JG4g28rakUyz90ds
	BKGxJy9Lp4fEYDpGtKAk2XJsLyRmxDt1b0NbJP5HrUzOrcqU6rZDsKIjM1sloZNr
	eE0C849V1iQCMJ0ExOXtig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1739580858; x=1739667258; bh=X61cSb//XlTREU7xZw7jpsq/hlG6osrsXU2
	hPl2Ei0Y=; b=PQWWIA6s4K/QITCeMOK6hPPdq0nCad/3hnhwI8plWfJfnO/kHqN
	C7rNPKrRotO/Fx2OqmF60VC+DzD2k0p+aiGGrMhTLk4I1zLgBHj20DEWDU1s7Syw
	dbSLWJ7jpbB8UIXGwIpM35scnQubeGNmwjDh6Zw/ILBMRnGVXkEGd8jejNAy3rB4
	qUFB0wuVFc8apAcSjTkk6cMLIu4QBW55WO+afpCZpWYfd9+KIE+Mbb6rERBTUQaS
	Fk67zjtI33944CWWaHsR/KQTHnSbUfI7MY1i0nkRslmtMEXvPT9ZxGlNzJnzQ2n4
	5Wp6wn7D1KywH5kptSQ9KWlXtW64DAFGhcw==
X-ME-Sender: <xms:uuWvZ26NjajS11JIzjSZYesxvmfI8PecUpsfVEJTrucWIWjMSk9EgA>
    <xme:uuWvZ_4ntP5MG5KGt51KLM_V1Rkc95wKGkQXCQARFd6x1i0J686TMY-_5uNori-6X
    8GE3bSDZtUutw>
X-ME-Received: <xmr:uuWvZ1eTK2g1Zak_ogqY3aFJ1f4GPmn6frzoWPE879ky_BB6ztN0wMsVlkrriLnI7K4Hs2c376ItnaQIhS0ioWIM4cIFU2iLKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehuddugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpefgudelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvd
    egueetfeejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpd
    hnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsshht
    rggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopeigvghnqdguvghvvg
    hlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegtrghrugho
    vgestggrrhguohgvrdgtohhm
X-ME-Proxy: <xmx:uuWvZzJSBQwSGPwkPUm_twmdKWEnyYJ2v98AJAq8LyLBD-ml47KQTQ>
    <xmx:uuWvZ6KveESr6YaShL6CPJqkjNYb7LfNjBzN5DpNFWEqzk42ybByzA>
    <xmx:uuWvZ0zwbHsKRJDkOFcLaVbNofNsn-RlGItEC1SGULmeyLSnB84HQA>
    <xmx:uuWvZ-Ip9E2QkTs4qmu4qn3Tw9CE-QD842ZoC6vORiPK3ETZV6B_nQ>
    <xmx:uuWvZ22T7mb7C_BMvwM0kJVxzE8VpcCbFtyWiPvWblKJnokXgrCZBE_T>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 15 Feb 2025 01:54:14 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 4/4] automation: add tools/tests jobs on the AMD Zen3+
 runner too
Message-ID: <Z6_lt1Kd9ELpmv5e@mail-itl>
References: <cover.36ee649a8537af1a5fb5b3c5b7ffc0d8a1369969.1739496480.git-series.marmarek@invisiblethingslab.com>
 <82cb819ef4d54705b3a79ce5b77003380382ebbf.1739496480.git-series.marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2502141629420.3858257@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RfGQxf3114LQtw/H"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2502141629420.3858257@ubuntu-linux-20-04-desktop>


--RfGQxf3114LQtw/H
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Feb 2025 01:54:14 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 4/4] automation: add tools/tests jobs on the AMD Zen3+
 runner too

On Fri, Feb 14, 2025 at 04:33:07PM -0800, Stefano Stabellini wrote:
> On Fri, 14 Feb 2025, Marek Marczykowski-G=C3=B3recki wrote:
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > new in v2
> > If those tests are sensitive to underlying hardware, I guess it makes
> > sense to run them on other runners too. Are they?
> > Similarly - does it matter if dom0 is PV or PVH for those tests? If not,
> > probably better to put just one of those jobs (PV?) to save CI
> > time.
>=20
> It should make a difference for the vpci test probably. I think we
> should keep both a PV and a PVH test of it. I think it is less important
> to run them on multiple runners, but it cannot hurt.
>=20
> > ---
> >  automation/gitlab-ci/test.yaml | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >=20
> > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test=
=2Eyaml
> > index 93632f1f9204..fc7663e3367a 100644
> > --- a/automation/gitlab-ci/test.yaml
> > +++ b/automation/gitlab-ci/test.yaml
> > @@ -162,6 +162,7 @@
> >      PCIDEV: "01:00.0"
> >      PCIDEV_INTR: "MSI-X"
> >      CONSOLE_OPTS: "console=3Dcom1 com1=3D115200,8n1,pci,msi"
> > +    SUT_ADDR: test-11.testnet
> >    tags:
> >      - qubes-hw11
>=20
> Is this a spurious change?

No, the SUT_ADDR variable is used by the test script to extract the
junit xml file via network.

> > @@ -340,6 +341,28 @@ zen3p-pvshim-x86-64-gcc-debug:
> >      - *x86-64-test-needs
> >      - alpine-3.18-gcc-debug
> > =20
> > +zen3p-tools-tests-pv-x86-64-gcc-debug:
> > +  extends: .zen3p-x86-64
> > +  script:
> > +    - ./automation/scripts/qubes-x86-64.sh tools-tests-pv 2>&1 | tee $=
{LOGFILE}
> > +  artifacts:
> > +    reports:
> > +      junit: tests-junit.xml
> > +  needs:
> > +    - *x86-64-test-needs
> > +    - alpine-3.18-gcc-debug
> > +
> > +zen3p-tools-tests-pvh-x86-64-gcc-debug:
> > +  extends: .zen3p-x86-64
> > +  script:
> > +    - ./automation/scripts/qubes-x86-64.sh tools-tests-pvh 2>&1 | tee =
${LOGFILE}
> > +  artifacts:
> > +    reports:
> > +      junit: tests-junit.xml
> > +  needs:
> > +    - *x86-64-test-needs
> > +    - alpine-3.18-gcc-debug
> > +
> >  qemu-smoke-dom0-arm64-gcc:
> >    extends: .qemu-arm64
> >    script:
> > --=20
> > git-series 0.9.1
> >=20


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--RfGQxf3114LQtw/H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmev5bcACgkQ24/THMrX
1ywzyQf9HiZuYjRoMQFTSwP5JYtP+Wo7sVXLTqWyx6rHKZWJzVhjw+7YyE/QZbg/
hj3i8a/waFkMjH0adzl54jqOeVV21ho6k59PE3NRYWKVc9uqPl34b+29QsOlYqhu
PvJehT9skbhI0oIv+Hh+TyNwmyUdjc9+aCuiF4Gu3CXVYNXtSPVnlOioaoVIOJi4
quH3Ia66taNKu7MK4W1JLVmiQ+EezoLELdkfhVUtg7Kanw1+WySc4FuMfbeslRsg
GGU4KUqS+MBoXUU29f7qeKsx5A0B9B29HwHgW6GvDJK7Ln7TbudFC3iZ04P1DTmb
KbwdeQIYx9AwyGeI9X/tswDd33KpaA==
=BPO2
-----END PGP SIGNATURE-----

--RfGQxf3114LQtw/H--

