Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C75C94AE7
	for <lists+xen-devel@lfdr.de>; Sun, 30 Nov 2025 03:57:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175255.1500099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPXcG-0003vZ-Rs; Sun, 30 Nov 2025 02:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175255.1500099; Sun, 30 Nov 2025 02:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPXcG-0003tJ-Od; Sun, 30 Nov 2025 02:56:48 +0000
Received: by outflank-mailman (input) for mailman id 1175255;
 Sun, 30 Nov 2025 02:56:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B770=6G=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vPXcG-0003tD-2O
 for xen-devel@lists.xenproject.org; Sun, 30 Nov 2025 02:56:48 +0000
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32652a88-cd98-11f0-980a-7dc792cee155;
 Sun, 30 Nov 2025 03:56:42 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id BF7187A0048;
 Sat, 29 Nov 2025 21:56:40 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Sat, 29 Nov 2025 21:56:40 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 29 Nov 2025 21:56:38 -0500 (EST)
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
X-Inumbo-ID: 32652a88-cd98-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1764471400;
	 x=1764557800; bh=uPo4d6C1SsuzKK9LFQrXRnujjP3GN628/AWhH5wC0QA=; b=
	GLYubI8knKw8x//gj42JQe5LrAsmVmaD9A+Wu24RM9OrNHqn2/Hyy6HEfjFtSDDM
	TEoT1poVyQY9udWF54TUkOoEOxi1BslAtwMpgukDUVnabhs9ag8+PxnVra3dt5xZ
	5HoeMP8Y05gBDvOrBLMR6r/3JpL5r4U+wbP0V0oh3h2/DQOUsZlkTJOZ/PD+iqyE
	GD0ph1M9d0Ac3v+PArBQL0sAVhvR0ZJsEf4/N0hwrh8QUxP+KQvkOE7Pl5kFgnzl
	YQxMMVoL88IxLeO1uiWhQR+sod/wWJsBfNVq+jjinAdnWI3MOkPXkdYakb7qH1Iw
	HQLx51b6Nq+TSTB5jFMcbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1764471400; x=1764557800; bh=uPo4d6C1SsuzKK9LFQrXRnujjP3GN628/AW
	hH5wC0QA=; b=X9Vl90GxUmaUbB2Vufu4K27OkLAvTZv3VJYLzG2v1P/36KlJyT4
	q1Wmt5b7+7bxivSPRE/pGKkGWU8hbpQvCPfIQSwlXAmkxjEr1AnFYtsAVv5R2G+H
	d+e/+An7z4MdgDgt8E3c+bt0fIF0XHLcNkxy2rCBLz5nDT6GRGIGzBmGdCfLATm5
	2dW+uGKeZygNwoFckaAndrrarAyx+SFzAO6HjlUr8RoldosrsQwTmT6NsZsxHTyg
	y9KnS0zzIhI9RCYWTpEESGeUOQxpSlqbLq3G5Z8jdYi2eqqA41UJUiMQeUaNZkgE
	OZVzabaX8ZrST0xgVtLVRCK4oK/B1RUGQZQ==
X-ME-Sender: <xms:aLIraefF5gpIm_I8BxBhUTLTrteUhNGl800-zbPJo9Pme2RIaJmlTQ>
    <xme:aLIraY47s0vFBrATPWpkH9g7kbmF2EX0DN_hiwKBiQkZkaP3rLfqgIp9UoQ6L_eS2
    uJUYHSvQu-8D2Ys_PuY63oQLI3b0_014M4DMR_9ezxx_gczsw>
X-ME-Received: <xmr:aLIradvDbpXo-Klg36R-zTlqEWCYaq8Rvy1961WNovvBVAOf_wGQzFdjYmAvarhTDY6QpjQlKpS2xdZANfw3ga0vkdCOh6cfrcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvheefjeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueekteet
    gefggfekudehteegieeljeejieeihfejgeevhfetgffgteeuteetueetnecuffhomhgrih
    hnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehjghhrohhsshesshhushgvrdgtohhmpdhrtghpthhtohepjhgrshhonhdrrghnug
    hrhihukhesrghmugdrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopeholhgvkhhsrghnughrpghthihshhgthhgvnhhkoh
    esvghprghmrdgtohhmpdhrtghpthhtohephigrnhhnrdhsihhonhhnvggruhesvhgrthgv
    shdrthgvtghhpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprh
    hojhgvtghtrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdr
    khgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:aLIraQiGUe743GojbM4XX4MhipxSkEeRj99STK1TFV-Pb9MZhN-iag>
    <xmx:aLIraQqdW6raPgCXeZr3SxJVP8ORcBAFypqUOSPyE7rnNwTcX2iDKw>
    <xmx:aLIraVvUude3l1mxw9JrKFOqHddMdtZaNlRDtXL94IKXeSUOemruRw>
    <xmx:aLIrabbqWRAU5_K099Lby-yFcyt5Ok_2zmea0fHlFd3Y0IxuVWoEHg>
    <xmx:aLIraRMjcXD6DTpKpVOsLsNKm7kn1LRQd-zSowtkie792dsOW-WEXzO2>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 30 Nov 2025 03:56:37 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Yann Sionneau <yann.sionneau@vates.tech>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] xenbus: Use .freeze/.thaw to handle xenbus devices
Message-ID: <aSuyZTFXIpVK-VmH@mail-itl>
References: <20251119224731.61497-1-jason.andryuk@amd.com>
 <20251119224731.61497-2-jason.andryuk@amd.com>
 <1c991699-51b7-4284-8179-6bc78f8f4eac@suse.com>
 <aSWJSb4OK645r3tk@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DJTHw7pL0k1QweeN"
Content-Disposition: inline
In-Reply-To: <aSWJSb4OK645r3tk@mail-itl>


--DJTHw7pL0k1QweeN
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Nov 2025 03:56:37 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Yann Sionneau <yann.sionneau@vates.tech>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] xenbus: Use .freeze/.thaw to handle xenbus devices

On Tue, Nov 25, 2025 at 11:47:37AM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Tue, Nov 25, 2025 at 09:20:55AM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> > On 19.11.25 23:47, Jason Andryuk wrote:
> > > The goal is to fix s2idle and S3 for Xen PV devices.  A domain resumi=
ng
> > > from s3 or s2idle disconnects its PV devices during resume.  The
> > > backends are not expecting this and do not reconnect.
> > >=20
> > > b3e96c0c7562 ("xen: use freeze/restore/thaw PM events for suspend/
> > > resume/chkpt") changed xen_suspend()/do_suspend() from
> > > PMSG_SUSPEND/PMSG_RESUME to PMSG_FREEZE/PMSG_THAW/PMSG_RESTORE, but t=
he
> > > suspend/resume callbacks remained.
> > >=20
> > > .freeze/restore are used with hiberation where Linux restarts in a new
> > > place in the future.  .suspend/resume are useful for runtime power
> > > management for the duration of a boot.
> > >=20
> > > The current behavior of the callbacks works for an xl save/restore or
> > > live migration where the domain is restored/migrated to a new location
> > > and connecting to a not-already-connected backend.
> > >=20
> > > Change xenbus_pm_ops to use .freeze/thaw/restore and drop the
> > > .suspend/resume hook.  This matches the use in drivers/xen/manage.c f=
or
> > > save/restore and live migration.  With .suspend/resume empty, PV devi=
ces
> > > are left connected during s2idle and s3, so PV devices are not changed
> > > and work after resume.
> > >=20
> > > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> >=20
> > Acked-by: Juergen Gross <jgross@suse.com>
> >=20
> > Marek, could you please give this patch a try with QubesOS? I think this
> > patch should be verified not to break your use cases regarding suspend /
> > resume.
>=20
> Sure, but I can't promise it will be this week, I have some deadlines to
> meet...

Regardless of my other response, those two patches appear to work fine
across domU suspend/resume (both the S3 and s2idle variants).
Note for s2idle I tested it together with other qubes patches:
https://github.com/QubesOS/qubes-linux-kernel/

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--DJTHw7pL0k1QweeN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmkrsmUACgkQ24/THMrX
1yyEDgf9H/lvmlm5yVjaPVZIwF4ex5v8T3scudwiA609KA7FDKejFdpGYbZFbFD1
sQM4/cCb+0mbRCM8x0zMLP1rheNdxp/+du7bEI7RfGedtQcI61foBaXVpxde9nE6
aup2+5gkYk6gGM/6qtmIZW0ugt3TPb96q8xeTmBDGLx77hDqBiwd03fsjNlQJslp
J1oU2td3kl4JAxSbug85dkVV4cecPVz99vbYUa02NnePrWGVunaAzHUe/w3lCK43
bIUMF740zEtZTbeJuqlRvF6oPFSeBTSWgeMyfQMN01Agk+IENxCCgvSXZRk+t1q6
xf72v/rqBvVChqJ/FQmX6yr5cXpFrQ==
=nS3x
-----END PGP SIGNATURE-----

--DJTHw7pL0k1QweeN--

