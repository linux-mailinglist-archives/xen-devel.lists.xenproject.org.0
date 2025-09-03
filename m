Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD86BB42632
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 18:04:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108704.1458760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utpxj-00068i-Pk; Wed, 03 Sep 2025 16:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108704.1458760; Wed, 03 Sep 2025 16:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utpxj-00067D-Lx; Wed, 03 Sep 2025 16:03:55 +0000
Received: by outflank-mailman (input) for mailman id 1108704;
 Wed, 03 Sep 2025 16:03:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VGCG=3O=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1utpxi-000677-6Z
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 16:03:54 +0000
Received: from fout-a1-smtp.messagingengine.com
 (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 954fc57b-88df-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 18:03:52 +0200 (CEST)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailfout.phl.internal (Postfix) with ESMTP id C8C69EC0372;
 Wed,  3 Sep 2025 12:03:50 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-09.internal (MEProxy); Wed, 03 Sep 2025 12:03:50 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Sep 2025 12:03:49 -0400 (EDT)
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
X-Inumbo-ID: 954fc57b-88df-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1756915430;
	 x=1757001830; bh=QhuJG5jH3FUiFBRyUodftBCdADSu6DKWopmjVFxsQsQ=; b=
	BWuiuCfEWda9GqGoNOUNV9pV1p1duJgNWmlR3BcXhroMpYa2NcsbTEGZjdgbc4nt
	hc0/yatLw31QibLg3k2QgfrqZ4PtYTbFSChnZ1fCUBVC4gAP9u187PNXAZwhMjgN
	Gfv+GOUcTsS6vusd3cG/c2lfOYBRf10R55eof9kZ6gkiySXRDgR4VUe/9dOkOUKo
	M2p76vZXI/RCVV5ffuiKjuPp2hDMOE0hijGHWLvHPALkTC09QORZB4s7TGJlOCSu
	iozEaLUUS1wOwaVodNbOxPCdUMmDlRCtujekh5fv6uKycHEg0eS7V3BlzT2C/xC8
	mt+JSLerRTDnSJn6lX3wNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1756915430; x=1757001830; bh=QhuJG5jH3FUiFBRyUodftBCdADSu6DKWopm
	jVFxsQsQ=; b=LQvKRqtPxc9uAIwq8N+vRdH4vWIGIKwO4SAT/7zdVz6/iWHPGmf
	oE8et3NyXIFfQWphgrg8AYb7rTY3aabaLloXK1T5D2d2besDbL5/NGjQMeEU5bIp
	gLj9qYiTQd+71RXmioIZx/R0orZrjRaxiaKP0a0mLlarxKJMBDsFX4YyIVtguar3
	SFjfPhf1jPiW57e7LaISZvrafAb5cMGHjz7ET0/agXJKT3jGEA3HNGUsKYQqLRSK
	wZy+Jm/yI2yAxOY/0af/C2E81pm/SJ3vefToQwoJ92OmZfxxmBG/Bo80VCr5j/pZ
	Bg1LLls3XCD6Oqt5tj9plAXWRIA1lnuEoHQ==
X-ME-Sender: <xms:5ma4aJLegugEZ6NFLX4c1CMfy-TDbwDjuRZ96jgyhimAPmtARU_M-A>
    <xme:5ma4aFXmkJKHmQjEzBEjAc59OFQthiCVnmSy7VjX1kp_6-NW_VOM3Zmb-uBDzbmzZ
    bmcwXKWWk1v6Q>
X-ME-Received: <xmr:5ma4aDi52MrEveCgIxSyvC_98IIFH_1sSov--ZckarzRy5OMLQdyTSkmirSeBaqRM-GuaZmbFL-M1BRX497v5NMiSFrON9_KWE8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefheejucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:5ma4aI-qFU4RtYN79MoXkIU9dJguYf2zzyq5yMOnK7J6vxmHBGSFhQ>
    <xmx:5ma4aFAE4pGieRFCCKjkD3dBiiuUO1qatEE4vhChF6tkZtPmFs2U2g>
    <xmx:5ma4aNJocGLtVk5sz5kxyELxnlcSqxVmtgevjQ4jyIVetesxI2JNFQ>
    <xmx:5ma4aAlFc1cCXopVBT6EnKR7D_4xnUQlcBXidGdrFol5iQ_F8oOByA>
    <xmx:5ma4aPUFe0oy_EndIoZe80sVR5sBmgdOiqz9DPklAuNOvwW--CaYf76r>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 3 Sep 2025 18:03:48 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: xen | Failed pipeline for staging-4.18 | 51190865
Message-ID: <aLhm5OMSUjGvQYAW@mail-itl>
References: <68b862c0518f3_2cdd2ac12775d@gitlab-sidekiq-catchall-v2-5996545549-kk9d8.mail>
 <8319cf73-52f9-48e2-a571-452da53c36d9@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SgNpc6CmfrriC82Z"
Content-Disposition: inline
In-Reply-To: <8319cf73-52f9-48e2-a571-452da53c36d9@suse.com>


--SgNpc6CmfrriC82Z
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 3 Sep 2025 18:03:48 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: xen | Failed pipeline for staging-4.18 | 51190865

On Wed, Sep 03, 2025 at 05:58:32PM +0200, Jan Beulich wrote:
> On 03.09.2025 17:46, GitLab wrote:
> >=20
> >=20
> > Pipeline #2019390073 has failed!
> >=20
> > Project: xen ( https://gitlab.com/xen-project/hardware/xen )
> > Branch: staging-4.18 ( https://gitlab.com/xen-project/hardware/xen/-/co=
mmits/staging-4.18 )
> >=20
> > Commit: 51190865 ( https://gitlab.com/xen-project/hardware/xen/-/commit=
/51190865a4918c443c310c0478247d5f9caa5dad )
> > Commit Message: x86/suspend: unconditionally raise a timer soft...
> > Commit Author: Roger Pau Monn=C3=A9
> > Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> >=20
> >=20
> > Pipeline #2019390073 ( https://gitlab.com/xen-project/hardware/xen/-/pi=
pelines/2019390073 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich=
 )
> > had 5 failed jobs.
> >=20
> > Job #11230955404 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/1=
1230955404/raw )
> >=20
> > Stage: test
> > Name: adl-suspend-x86-64-gcc-debug
> > Job #11230955410 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/1=
1230955410/raw )
> >=20
> > Stage: test
> > Name: adl-pci-pv-x86-64-gcc-debug
> > Job #11230955417 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/1=
1230955417/raw )
> >=20
> > Stage: test
> > Name: adl-pci-hvm-x86-64-gcc-debug
> > Job #11233274365 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/1=
1233274365/raw )
> >=20
> > Stage: test
> > Name: adl-smoke-x86-64-gcc-debug
> > Job #11233405609 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/1=
1233405609/raw )
> >=20
> > Stage: test
> > Name: adl-smoke-x86-64-dom0pvh-gcc-debug
>=20
> While the same tests are fine for 4.19 and 4.20, all five show rubbish in=
 the log,
> and then fail. No idea what's going on.

The log says "baudrate is    : 115200", but looking at the state after
the test I see 9600. No idea if that was simply switched back after, or
setting to 115200 didn't work. Anyway I suggest to restart (now that
other jobs completed). I set it manually to 115200 now too (not sure if
that will remain there...).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--SgNpc6CmfrriC82Z
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmi4ZuQACgkQ24/THMrX
1yzTSQf+NTmipxFLJS9WXMocgL9X1Q+PudDLkjXaVdaClXxkYZ7PmLYrSasFPijs
ieiO6dEG+zdrfRwOlVhISYiEAu60EQNy2t8kNtbMYmpI4Bdea2yW/K5aopPW5mJE
aqBcFuVDHqn86ZtrIcDTXacytLjvYe5ASoD3jPPgnX2T4BMO6Rrsy5LiZYGFFqMB
IS5jVA8fgAEaHEoJRyYi3PD7Q0EvHc2e298NpsxzbNMGw2eBZDDbezpBWM3AdzeA
kTVrucF4gqrnLPTngSyJJErb6R3J62WYeMXnXPKx25cWM/PXmoFshtieeQK43kr5
maiZghBRL8g2vEji4rLm5p71BZqlvQ==
=D836
-----END PGP SIGNATURE-----

--SgNpc6CmfrriC82Z--

