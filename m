Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5034B43919
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 12:44:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109811.1459229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu7R2-0006oE-JU; Thu, 04 Sep 2025 10:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109811.1459229; Thu, 04 Sep 2025 10:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu7R2-0006lZ-FD; Thu, 04 Sep 2025 10:43:20 +0000
Received: by outflank-mailman (input) for mailman id 1109811;
 Thu, 04 Sep 2025 10:43:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Vqu=3P=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uu7R0-0006lT-LO
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 10:43:18 +0000
Received: from fout-b3-smtp.messagingengine.com
 (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6233262-897b-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 12:43:16 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.stl.internal (Postfix) with ESMTP id 868A81D00291;
 Thu,  4 Sep 2025 06:43:14 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Thu, 04 Sep 2025 06:43:14 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Sep 2025 06:43:13 -0400 (EDT)
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
X-Inumbo-ID: f6233262-897b-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1756982594;
	 x=1757068994; bh=vLKJ8EQ4Q3uf2z4yXyC1FFM1RW9BEz2YR4iv12SQq6w=; b=
	LURMkdxb8sbMyjphe4X9+sdSkSTMK/z3MPLKxcif0eWNtV8nVi8jcphh16y9l9Bu
	Bdhteoyo4+jCc8L+nr2dUluq3u4JJ53yrSyi9JSDID02nQjgr2xRhVGBlcGTmuKl
	V+y87tRRc5JCWqboBwlJOFGaLSfjeEeFm5gxj5lEl6KrBWlp5Wh07QuQ7/GqM493
	Q/Azsj+mlF5tNCgSOHWom1dz3bmEtgwZ0dI+lJg9wfqtYyGXutR+OEFXh/3XF3sa
	A5jYVk0QAARxEaOAgCZnYuUBK+xXtkmVBd7shibvx27Zu/pAhcvRkj1NQFTpyy/1
	SF3yHVdBNlyIBk0GdzzYDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1756982594; x=1757068994; bh=vLKJ8EQ4Q3uf2z4yXyC1FFM1RW9BEz2YR4i
	v12SQq6w=; b=eubCI+C3AX/GECW0qkukQzfkz7fL3mcxVDqIAGOUvJ9kWNyJa0+
	AqPQBtjC69hiQg4mpN8Xdb/2ZxVhoE2h00uMbNd/gIf6/ynpk7Tbh8hJa91fAF7N
	Qqhq3sBOiqXgJV9DtfTmhPcmYfLN/BmLNFkhyTOibNqiBEVXollqFmTb5PiZs5Xu
	MdTp1xXhfBWvv/nY2k49e2bnmY6dxPCZZGWqDpYI2AQW6xqrQv6UZid1uxdRYGtU
	taJU5V3Yj1Ou9n0VjoeCd9WOxu1HVi5mL+WjIaijM2lDo7nvid11shesitk9gBQk
	AA1IC6MRyngConerFn+EbRkDuFF6CsZOrbA==
X-ME-Sender: <xms:Qm25aF_6X38-I0OCO18igIA1Cb2dcNkII8CDU7Y8Dmu4bH7WSgAmFA>
    <xme:Qm25aJ7qq9y3_9vlf7JWXfiv7UkNG2iPyD77j9STydyKfX4ck5Ur2R33QFvIqg8QS
    4i67u5WuANW2Q>
X-ME-Received: <xmr:Qm25aE0if9-JvUMMC8-FM3lenK5o5vco5QKNy1rRKWUfJW1xkCbPFPf0IdzvyQ5SDW1rbP4AsCx6ytXobInrXJuJiR-Z315LxlM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdehkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhephedtfeeuhffgjeehfeetvdevueef
    feehkeetfedujeehgfejudehleegudehgeeunecuffhomhgrihhnpehgihhtlhgrsgdrtg
    homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
    rghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprh
    gtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjsggvuhhlihgt
    hhesshhushgvrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgi
    gvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:Qm25aIBGtbCZKzTAtMXpDKJswfgl-v46rcX9F3_2Gqta-VYLHfkYkQ>
    <xmx:Qm25aO3vHbbdAgAE28ZvXalBWrbv_IPk_Uc9NAR5Cv5IicVdkCEWUQ>
    <xmx:Qm25aKvIXgD-W6AE5VHysfJbxOMs-zhPVALCqPOvGYVItgw056P8lA>
    <xmx:Qm25aG4KG0qR3znVK8Zro3UsylsX0Q3RPGzBu3lTQs6aEjLJT1jtjw>
    <xmx:Qm25aHoZChHcw1ftsncKzkJncO91pL4i4qpQPlRBpttf_-o0UzT_VSsz>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 4 Sep 2025 12:43:11 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: xen | Failed pipeline for staging-4.18 | 51190865
Message-ID: <aLltQFCZyz_JQzqB@mail-itl>
References: <68b862c0518f3_2cdd2ac12775d@gitlab-sidekiq-catchall-v2-5996545549-kk9d8.mail>
 <8319cf73-52f9-48e2-a571-452da53c36d9@suse.com>
 <aLhm5OMSUjGvQYAW@mail-itl>
 <0fb22103-c928-40ff-8be9-bf8d3914f028@suse.com>
 <15650736-585b-4b5c-b2d2-53f4670d8530@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KfBoBeeBXiUIOfsO"
Content-Disposition: inline
In-Reply-To: <15650736-585b-4b5c-b2d2-53f4670d8530@suse.com>


--KfBoBeeBXiUIOfsO
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 4 Sep 2025 12:43:11 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: xen | Failed pipeline for staging-4.18 | 51190865

On Thu, Sep 04, 2025 at 08:27:14AM +0200, Jan Beulich wrote:
> On 04.09.2025 07:58, Jan Beulich wrote:
> > On 03.09.2025 18:03, Marek Marczykowski wrote:
> >> On Wed, Sep 03, 2025 at 05:58:32PM +0200, Jan Beulich wrote:
> >>> On 03.09.2025 17:46, GitLab wrote:
> >>>>
> >>>>
> >>>> Pipeline #2019390073 has failed!
> >>>>
> >>>> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
> >>>> Branch: staging-4.18 ( https://gitlab.com/xen-project/hardware/xen/-=
/commits/staging-4.18 )
> >>>>
> >>>> Commit: 51190865 ( https://gitlab.com/xen-project/hardware/xen/-/com=
mit/51190865a4918c443c310c0478247d5f9caa5dad )
> >>>> Commit Message: x86/suspend: unconditionally raise a timer soft...
> >>>> Commit Author: Roger Pau Monn=C3=A9
> >>>> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> >>>>
> >>>>
> >>>> Pipeline #2019390073 ( https://gitlab.com/xen-project/hardware/xen/-=
/pipelines/2019390073 ) triggered by Jan Beulich ( https://gitlab.com/jbeul=
ich )
> >>>> had 5 failed jobs.
> >>>>
> >>>> Job #11230955404 ( https://gitlab.com/xen-project/hardware/xen/-/job=
s/11230955404/raw )
> >>>>
> >>>> Stage: test
> >>>> Name: adl-suspend-x86-64-gcc-debug
> >>>> Job #11230955410 ( https://gitlab.com/xen-project/hardware/xen/-/job=
s/11230955410/raw )
> >>>>
> >>>> Stage: test
> >>>> Name: adl-pci-pv-x86-64-gcc-debug
> >>>> Job #11230955417 ( https://gitlab.com/xen-project/hardware/xen/-/job=
s/11230955417/raw )
> >>>>
> >>>> Stage: test
> >>>> Name: adl-pci-hvm-x86-64-gcc-debug
> >>>> Job #11233274365 ( https://gitlab.com/xen-project/hardware/xen/-/job=
s/11233274365/raw )
> >>>>
> >>>> Stage: test
> >>>> Name: adl-smoke-x86-64-gcc-debug
> >>>> Job #11233405609 ( https://gitlab.com/xen-project/hardware/xen/-/job=
s/11233405609/raw )
> >>>>
> >>>> Stage: test
> >>>> Name: adl-smoke-x86-64-dom0pvh-gcc-debug
> >>>
> >>> While the same tests are fine for 4.19 and 4.20, all five show rubbis=
h in the log,
> >>> and then fail. No idea what's going on.
> >>
> >> The log says "baudrate is    : 115200", but looking at the state after
> >> the test I see 9600. No idea if that was simply switched back after, or
> >> setting to 115200 didn't work. Anyway I suggest to restart (now that
> >> other jobs completed). I set it manually to 115200 now too (not sure if
> >> that will remain there...).
> >=20
> > The rubbish in the output looks to have gone away, but the adl-* tests =
fail
> > as before. I'm retrying two of them another time, but with little hope.
>=20
> As opposed to 4.19, where we have this
>=20
> minimal cmds is: no
> !! STDIN is not a TTY !! Continue anyway...
> Type [C-a] [C-h] to see available commands
> Terminal ready
>  Xen 4.19.4-pre
> (XEN) [00000043ae35c0c9] Xen version 4.19.4-pre (root@) (gcc (Alpine 12.2=
=2E1_git20220924-r10) 12.2.1 20220924) debug=3Dy Wed Sep  3 12:15:19 UTC 20=
25
>=20
> for 4.18 things (consistently across the tests) look like this
>=20
> minimal cmds is: no
> !! STDIN is not a TTY !! Continue anyway...
> Type [C-a] [C-h] to see available commands
> Terminal ready
> Accessing Gembird #0 USB device 038
> Switched outlet 2 on
> Setting boot mode for 2 to gitlabci... done
> + trap 'ssh control@thor.testnet poweroff; : > /tmp/console-stdin' EXIT
> + '[' -n  ]
> + set +x
>  Xen 4.18.5
> (XEN) Xen version 4.18.5 (root@) (gcc (Alpine 12.2.1_git20220924-r10) 12.=
2.1 20220924) debug=3Dy Wed Sep  3 12:27:30 UTC 2025
>=20
> For 4.19 there's no visible delay between "Terminal ready" and the first =
Xen
> message, whereas for 4.18 there is an approx 1:30min (=C2=B110s) delay af=
ter the
> "+ set +x". That's a lot when the timeout is 2min.

That makes no sense to me, at this point there isn't really much
Xen-specific code running yet, so there shouldn't be any difference
between branches. I think this is only different presentation of the
output, because 4.18 doesn't use expect in that script yet.

As for the actual reason, at least one job ends at "Waiting for uevents
to be processed", which sounds like USB devices enumeration. Just in
case I reset that emulated USB now.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--KfBoBeeBXiUIOfsO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmi5bUAACgkQ24/THMrX
1yySjAf/ZxQ5pIPIxP6YSbdoNIX85J4HFy/lRM4TUCZ4oHZJpq66WlMxVC+rUTte
tJb/CoHoZ83GI9Nlv4urIYdcRxB66DgXm6mimdLuIxTJA5HDb8Hj1I+i4xJsPAmz
nnbX+qiGxpOQrmf61PZw3T9iYK1NcEDbegy5Y+fpz0660qfy30y0+6H76HKXOIpA
lRAdcsJ8SzNjoCqNjSpYXl+eCQ+r0BpdB1+7DDA5IxUkNRhLB1GyFq9rqBsdTHI7
K5M3a6gGvXt6c5qhkZiseiXGjsR6FCi1Z16IkwO5pvjgKKPRh1Rj9j4ijk6tyk+F
tiguG+C2M//PM94rxSdup0kULjlyhw==
=eTPH
-----END PGP SIGNATURE-----

--KfBoBeeBXiUIOfsO--

