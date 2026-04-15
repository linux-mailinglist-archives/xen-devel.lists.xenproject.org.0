Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFD4GdTN32maZAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 19:41:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F52D406DF0
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 19:41:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282686.1565209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD4E2-0000JR-Qs; Wed, 15 Apr 2026 17:40:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282686.1565209; Wed, 15 Apr 2026 17:40:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD4E2-0000GK-NM; Wed, 15 Apr 2026 17:40:30 +0000
Received: by outflank-mailman (input) for mailman id 1282686;
 Wed, 15 Apr 2026 17:40:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wD4E1-0000GE-JY
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 17:40:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD4Dz-003782-LH
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 19:40:28 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69dfcd69-5cb7-0a2a0a5109dd-0a2a4505cabe-42
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 19:40:27 +0200
Received: from [202.12.124.157] (helo=fhigh-b6-smtp.messagingengine.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69dfcd89-3760-0a2a45050019-ca0c7c9dd7e7-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 19:40:26 +0200
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 600147A0227;
 Wed, 15 Apr 2026 13:40:25 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Wed, 15 Apr 2026 13:40:25 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Apr 2026 13:40:22 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1776274825;
	 x=1776361225; bh=s3XtCFscdlXN7iNA/z6lXwyh+C6EF+xDAafKYuN191g=; b=
	h7XYXW5ohqP5fTkawCmdoTKM8FMi/Xi5tiSorkwnL8Jp2qBWOKRNJvmL6MygEZgC
	HsZy+yFoToa2ux+am/Z+q/bLY5FTCa8wddjA2vPSSCMq+NqVMZ5ihorhsnNbu0ct
	Bn002wlTEt9ng3tCQ7hjgU2oqsFLChvuZN+wpPWn6bTCgdl/4lhQT87IAVgcG9JG
	C5THSo+8DStYWUPgSKxLZF0MlSTcgG1GtX8qmQcloqo7f4gdkt0vY2+A6/nasZai
	tF+tTseWmUR4GNdQfjTqfDSxro6lQBG1MU5p1WA8Os6o9Z752bGJKn6H5GjIigZp
	Bwg9yz/h0iHyjj8MjzLcXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776274825; x=1776361225; bh=s3XtCFscdlXN7iNA/z6lXwyh+C6EF+xDAaf
	KYuN191g=; b=SEt6Iq+Ej6w9OLnQhoiDNtpyx8BFOKXrGkJNy80UG5UEuqGugH4
	U810k5YOMdmY9Rq9xzbMffeOf071wKb0p35xKCnhYzVL1blUiTkAUtzJi9O4iLHw
	/fQFHG/PrFsImSV+z2Vm/qOiiHeQNrT9yHBjhv/TtLGkAUoDj+Ldjw2u9a8/3FWT
	6+0YWo3+Ma/s/jQFwkq9OHhvePEC8p/tDu1J7PPfLkSMU86LLTRmELhyx6UcOno0
	Kq5vfmat/iLZwHdGGVmH2YIjgmbEnk+BykKctPzUYex/tK91QR3osm3ABv1nG+75
	AOyySvst3bSerVK6fdync+Te1f52AeZUSDg==
X-ME-Sender: <xms:iM3fadXs0aa9p0_6BRNzg02-nMToXkSv-mHPOplDu3AX4Zeyy1lECQ>
    <xme:iM3faUcbssfcSY_rQIMMUa1G3evzFpcj-aZGKnD5Cce0e5kKpfheoXNlTS1uL5vUK
    HbjbwTe2AUDmZpbCjR1gP8EzXB9OD9b9WF90_a80Y_Q1_oL2g>
X-ME-Received: <xmr:iM3faRv63WXyWLAmC9PDb8ryYUvgsNdjItIHiDWwbNLAbNvR7tz0yyDeqlL_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeggeejudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeehfeejueej
    teefhedtgfefhfdugeehgfektdejieejteekuddtgefhudekfefggfenucffohhmrghinh
    epkhgvrhhnvghlrdhorhhgpdhgihhtlhgrsgdrtghomhdpvhgrthgvshdrthgvtghhnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrg
    hrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthht
    ohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnthhhohhnhidrphgvrh
    grrhgusehvrghtvghsrdhtvggthhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhs
    thhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghooh
    hpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhnihes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrd
    gtohhm
X-ME-Proxy: <xmx:iM3fab_pvE5qqMs6CdShS1KQ_4oIlH_rRWLKRyIW6khiYV3l4sEOXQ>
    <xmx:iM3faU3dmpPzC1WGJr7inZksqyHEG3dHGYH4A6hdlmyyZSjFsAMPyg>
    <xmx:iM3faYDBu8heSzI1NfmoVm52GGY8cp1L0u-Zlo-SQW559ohsH2xDJw>
    <xmx:iM3faYerA-DpAB81opqHZltx5kbd8QFbvwRdyWvWWiIVBkrLpeezfw>
    <xmx:ic3faWmfx19u_xFrs3SrGCMpPFF5ZJWzlkcnUjKC6QSN_IjhBhLkYsDL>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 15 Apr 2026 19:40:19 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v3 09/13] Add trigger-test job, to run
 test on a Linux built from a branch/tag
Message-ID: <ad_Ng5TryP3Nj6em@mail-itl>
References: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
 <9893108225500bb841a39918942bc9267e62b6af.1774999132.git-series.marmarek@invisiblethingslab.com>
 <ad-WTdnAdOzcUkze@l14>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CaGGDZKULuvCeH9e"
Content-Disposition: inline
In-Reply-To: <ad-WTdnAdOzcUkze@l14>
X-purgate-ID: tlsNG-c201ff/1776274827-2292196F-228500A5/0/0
X-purgate-type: clean
X-purgate-size: 4409
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm2];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,messagingengine.com:dkim,vates.tech:url,vates.tech:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 8F52D406DF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--CaGGDZKULuvCeH9e
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Apr 2026 19:40:19 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v3 09/13] Add trigger-test job, to run
 test on a Linux built from a branch/tag

On Wed, Apr 15, 2026 at 01:44:47PM +0000, Anthony PERARD wrote:
> On Wed, Apr 01, 2026 at 01:21:59AM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > When scheduling pipeline in test-artifacts repo, it can get also
> > TEST_TRIGGER_REPO and TEST_TRIGGER_BRANCH variables, to trigger relevant
> > pipeline to test just built artifacts.
> > Pass ARTIFACTS_REPO+ARTIFACTS_BRANCH to the child pipeline to ensure it
> > fetches artifacts from the right job.
> > For example, to build linux-next and test Xen staging on it, the
> > pipeline could be triggered with:
> >
> >     LINUX_GIT_URL=3Dhttps://git.kernel.org/pub/scm/linux/kernel/git/nex=
t/linux-next.git
> >     LINUX_GIT_VERSION=3Dmaster
> >     TEST_TRIGGER_REPO=3Dxen-project/hardware/xen
> >     TEST_TRIGGER_BRANCH=3Dstaging
> >
> > The triggered xen test pipeline will skip most build jobs.
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
>=20
> You might want to add that this depends on two patch for the xen repo,
> for the trigger to do the expected tests:
>     CI: make test-artifacts repo/branch/job customizable
>     ci: introduce BUILD_FOR_TESTS_ONLY
>=20
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index 62b2a24e7faf..9d90a8f57ff8 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -105,3 +110,18 @@ linux-git-x86_64:
> >  microcode-x86:
> >    extends: .x86_64-artifacts
> >    script: ./scripts/x86-microcode.sh
> > +
> > +trigger-test:
> > +  stage: deploy
> > +  trigger:
> > +    project: $TEST_TRIGGER_REPO
> > +    branch: $TEST_TRIGGER_BRANCH
> > +    strategy: mirror
> > +  variables:
> > +    ARTIFACTS_REPO: $CI_PROJECT_PATH
> > +    ARTIFACTS_BRANCH: $CI_COMMIT_REF_NAME
> > +    LINUX_JOB_X86_64: linux-git-x86_64
> > +    LINUX_JOB_ARM64: linux-git-arm64
> > +    BUILD_FOR_TESTS_ONLY: 1
>=20
> Can we add this?
>   inherit:
>     variables: false
>=20
> Otherwise, as I understand, the triggered pipeline will also use the
> global variables, like TEST_TRIGGER_REPO, LINUX_GIT_VERSION, ... Or I
> could be wrong because we don't set a default value and the are only
> manual/scheduled pipeline variable.
>=20
> https://docs.gitlab.com/ci/yaml/#trigger
> > CI/CD variables defined in a top-level variables section (globally) or
> > in the trigger job are forwarded to the downstream pipeline as trigger
> > variables.
>=20
> https://docs.gitlab.com/ci/pipelines/downstream_pipelines/#prevent-defaul=
t-variables-from-being-passed

Hm, yes, inherit:variables:false might be needed if we'd want to avoid
passing those variables. But, TBH I'm not sure if we want to avoid that
- it might be useful at some point to get LINUX_GIT_VERSION there, for
example.=20

> I'm not sure if the inherit:variables:false is needed, so:
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
>=20
> Thanks,
>=20
>=20
> --
> Anthony Perard | Vates XCP-ng Developer
>=20
> XCP-ng & Xen Orchestra - Vates solutions
>=20
> web: https://vates.tech
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--CaGGDZKULuvCeH9e
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnfzYMACgkQ24/THMrX
1yx8Xwf/XSWAbi0mIjPs1NEu6gFMy2T5CYBtFs5hZkffz7lLVAKUbS5PHBLsMBKh
98gCov1nT1b9ZYVhEB/0fDjhMF4LyQNOhD/flAkcBR/iLSaz9jftt9u0qdeXRBjx
FBTSxsLT4NvthLgUB+hcFJfGY2/2IWsznVTLkg58UnLnCEiLyie7ovMbHTRgvN2H
C+a5+4YrnCEU6XdLRDSYmMEhcgmZZQKybGZgy7i8+68zrJT85CL33yElh4W0jhja
1mFVrOYHz4ZlHVti4HYF8TILSF5ck8L3mmW9NHiL2VQ1ZEz6YTiBmGgOHUL/CJYF
A/VFCVCHiAM4UJM24XtD6TE+mzLigw==
=qeFz
-----END PGP SIGNATURE-----

--CaGGDZKULuvCeH9e--

