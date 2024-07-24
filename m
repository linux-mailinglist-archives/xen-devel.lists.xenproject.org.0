Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D9193B91B
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 00:22:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764549.1175024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWkMw-0003d2-68; Wed, 24 Jul 2024 22:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764549.1175024; Wed, 24 Jul 2024 22:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWkMw-0003aX-2e; Wed, 24 Jul 2024 22:21:58 +0000
Received: by outflank-mailman (input) for mailman id 764549;
 Wed, 24 Jul 2024 22:21:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VfnQ=OY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sWkMv-0003aR-4p
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 22:21:57 +0000
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com
 [103.168.172.148]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 206ed573-4a0b-11ef-8776-851b0ebba9a2;
 Thu, 25 Jul 2024 00:21:53 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfout.nyi.internal (Postfix) with ESMTP id 92DC813801DA;
 Wed, 24 Jul 2024 18:21:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 24 Jul 2024 18:21:44 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Jul 2024 18:21:43 -0400 (EDT)
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
X-Inumbo-ID: 206ed573-4a0b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1721859704;
	 x=1721946104; bh=e7YYia+duEPY029zdgM/6UMvVwePoeNMsfMcO9EC9rg=; b=
	B1RZtqOkmmHb+7IgizYV1qyx+75BPOtyQ5X2+r56d7u1SFWhzhhr/YTk80YYOhNr
	ZZrsFT4JacsV9+jZdqonazE+SJVwX8Eov2YV8Uzqn4L7SCUpQRJyVzID9zJ7ZJnZ
	7HhBx1+kBuFa5vuaJKpTyy7tYUzmgz+jcm/4XcW0hkpiJwuo411uF1faYXxbU/KI
	hVmN+0txc67uNVbQM6AJnRrpBFSp9Hp2kVsO8ZqzUecEVPbbLK+T8suCciUENwgY
	ef97EEBBe6zmYujbRBIQGZ4bsegJ5iMF24mIZxKR944kdWnd8QPdJ/ayXQ7rY4Ca
	HDu8nMY4Uyu047DPmEyZIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1721859704; x=1721946104; bh=e7YYia+duEPY029zdgM/6UMvVweP
	oeNMsfMcO9EC9rg=; b=ZRcKqxJkTTrIAqzxm2Fnz0sFSLIUgX7IV3Fw/NvTeHG4
	fTm23K/4nTV/xFA6fAleCam75pohe2F2BGHf42W8iv40xJuiRsWNkR50o2NpbEsE
	IDrryehfgKlgtREc9SEkgfmknSwN8Rb6xtM98NUC0gCNw3VZEUJ6ra2g8tlF68QF
	5pntbwF+Yy9vkuAEeBohualAIh05wnemo0hi+rqE5os9KdKaPB2qD0QJtAG/aFo6
	01jReGETJCY3EdH1geARVO0t+1H05z2dXeJZnjUrskGBZh9B9U4RKv+NoOI0apWL
	NCMOWyYChGIk3uO6zLLsFs1dcAJyTxr4gb8HUnp9kg==
X-ME-Sender: <xms:eH6hZqQovNj3zfCy4kkJZiJ9F9uIutfVv7ogjM0JUOQoWPO4womiIQ>
    <xme:eH6hZvzBxksCxGIWn5cjGR4c2lg8_ByIQaYHbIoWH9lsmS8LaG8xssXB-YYiLe4k3
    clpAdzWMboB9w>
X-ME-Received: <xmr:eH6hZn1YmSnBlj8ynJtYo-3a7-FbqT6t4xor6ScuZ5QKtZPqx3a_eCdQ1ihD3p9ZhS4dwIkMuY7qx-PKfN3bsMZ72n_Uw1h6Cw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddriedvgddutdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedugfdu
    gfdvvdekjeeffefgieegheduffelieeghffhiedtleeikeelgfeguddtudenucffohhmrg
    hinhepghhithhlrggsrdgtohhmpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:eH6hZmBn6rkjYolv-_cZcBl_PbsnFvYUnvKI_UrxbHZPVJuG921zZw>
    <xmx:eH6hZjgIcorwQv2GfsmKszmK7BvEID5d5hYxKhl0LbSyp7zXNcDsFw>
    <xmx:eH6hZipsdgqw6phaVQzrZ8bvX1ixgVfa3TVDfZI4YFgHbuAvqBq9SA>
    <xmx:eH6hZmhb727F04HqJOhMAFBfiGtmyNsMnCJNqEMMeu-vZEd8o3xNeQ>
    <xmx:eH6hZmvksGCArOKbLmM0bRfI9ul6YTZGgjF5eSxN6kg-T_OvZPv2Pemc>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 25 Jul 2024 00:21:40 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: xen | Failed pipeline for staging-4.19 | 2d7b6170
Message-ID: <ZqF-dZETPHofyXQz@mail-itl>
References: <66a0fe638f16a_33beeb0103995@gitlab-sidekiq-catchall-v2-96b77f447-9jjmp.mail>
 <24be503c-7c8a-4db9-aee4-04b0c872c0dc@suse.com>
 <ZqEfi3WkRTzDqRWi@l14>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Wdr+mhhF7fX8ajJp"
Content-Disposition: inline
In-Reply-To: <ZqEfi3WkRTzDqRWi@l14>


--Wdr+mhhF7fX8ajJp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jul 2024 00:21:40 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: xen | Failed pipeline for staging-4.19 | 2d7b6170

On Wed, Jul 24, 2024 at 03:36:44PM +0000, Anthony PERARD wrote:
> On Wed, Jul 24, 2024 at 03:18:50PM +0200, Jan Beulich wrote:
> > On 24.07.2024 15:15, GitLab wrote:
> > >=20
> > >=20
> > > Pipeline #1385987377 has failed!
> > >=20
> > > Project: xen ( https://gitlab.com/xen-project/hardware/xen )
> > > Branch: staging-4.19 ( https://gitlab.com/xen-project/hardware/xen/-/=
commits/staging-4.19 )
> > >=20
> > > Commit: 2d7b6170 ( https://gitlab.com/xen-project/hardware/xen/-/comm=
it/2d7b6170cc69f8a1a60c52d87ba61f6b1f180132 )
> > > Commit Message: hotplug: Restore block-tap phy compatibility (a...
> > > Commit Author: Jason Andryuk ( https://gitlab.com/jandryuk-amd )
> > > Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> > >=20
> > >=20
> > > Pipeline #1385987377 ( https://gitlab.com/xen-project/hardware/xen/-/=
pipelines/1385987377 ) triggered by Jan Beulich ( https://gitlab.com/jbeuli=
ch )
> > > had 3 failed jobs.
> > >=20
> > > Job #7415912260 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/=
7415912260/raw )
> > >=20
> > > Stage: test
> > > Name: qemu-alpine-x86_64-gcc
> >=20
> > This is the one known to fail more often than not, I think, but ...
> >=20
> > > Job #7415912175 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/=
7415912175/raw )
> > >=20
> > > Stage: build
> > > Name: ubuntu-24.04-x86_64-clang
> > > Job #7415912173 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/=
7415912173/raw )
> > >=20
> > > Stage: build
> > > Name: ubuntu-22.04-x86_64-gcc
> >=20
> > ... for these two I can't spot any failure in the referenced logs. What=
's going on
> > there?
>=20
> They are crutial information missing in that email, the actual reason
> given by gitlab for the failures: "There has been a timeout failure or
> the job got stuck." (That message can be seen when going to the url,
> removing "/raw" part, and scrolling to the top. Or looking at the side
> bar and seen a duration that well above 1h)
>=20
> Communication between gitlab and the runner might be broken in those
> cases, or the runner stop working.

This time the runner VM got hit with
https://lore.kernel.org/xen-devel/ZO0WrR5J0xuwDIxW@mail-itl/ . So, I
guess the failure is warranted, just not the one you'd expect...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Wdr+mhhF7fX8ajJp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmahfnUACgkQ24/THMrX
1ywkOAf+OR5meVls0TJqabi8y2X1CuxplE1WUwYUrToHqFO1+q2IKjxc+kWmZqUI
qZWdBYcG2cGw3O7/Bt/DLs4TIbYso6YLRS1HugCm8Pf3gORbOY8J7DRTqdDlqAYM
YLJrV+j9KKjJl1F1W/zBBm0ha0Gk0AjtcYuLtmYSbpRXiQYe7/y2asMjrFUiDedF
5glQ2AI2RKk8huMSni6wEi8BkPO94VusFyRspe1Q7EClTZ4eRNQgemTAHGMSuCwg
wRymmS6tUWk9/a1BvZW+FMDWFIU9SFwUZ407WAaIWzBbMdjddqlnpef2TgK8ZfMc
TxOxfAOA7pyfPZ45jmeSg1p2n76I5A==
=hJ1m
-----END PGP SIGNATURE-----

--Wdr+mhhF7fX8ajJp--

