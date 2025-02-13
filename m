Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC09DA350A7
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 22:47:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888073.1297494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tih3G-0000eH-5o; Thu, 13 Feb 2025 21:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888073.1297494; Thu, 13 Feb 2025 21:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tih3G-0000bV-33; Thu, 13 Feb 2025 21:47:18 +0000
Received: by outflank-mailman (input) for mailman id 888073;
 Thu, 13 Feb 2025 21:47:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZTDb=VE=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tih3E-0000Bj-Ez
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 21:47:16 +0000
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14db0f9a-ea54-11ef-9896-31a8f345e629;
 Thu, 13 Feb 2025 22:47:13 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id 6540B13808C7;
 Thu, 13 Feb 2025 16:47:11 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Thu, 13 Feb 2025 16:47:11 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Feb 2025 16:47:10 -0500 (EST)
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
X-Inumbo-ID: 14db0f9a-ea54-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1739483231;
	 x=1739569631; bh=xK7Pt+3W6XZk8NbFglBV9FHAhrFxeAunneR2aVlHslo=; b=
	mrcKCMQmzygWl50XxBmUVy6jBUFDns9Q1oKX+fhBGIOkD+FLNvn8ydE8PhvtZxkE
	3X69k+4tVaudtMlvZDhbACr3GYgv4lqtPEsJpRqnSj8y6LIq3fjkzvgYaysiB7le
	bWjAITOg4v6CTsFDY/a4FxxOk17CQ9XGN1kcD4xDkmWhAquBCwTRjoku3hBNloSP
	gezEd/d74j+uaCeMTygMTMWtUDGt55CgBB0qINjHFfRirKtvadvuhnjcFpQygW3O
	GTBBB0UE1cJueyMdZGLClwAYX8h4ZrYyhYz6qlYK2AlHV4NYSaTc8ABX6enbBMRq
	SWiUa/mOZ4rcJ2hJNraohg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1739483231; x=1739569631; bh=xK7Pt+3W6XZk8NbFglBV9FHAhrFxeAunneR
	2aVlHslo=; b=mkBRZaDdpY927iGOGy4nJehlLDHgk7Jh6UYmFwmncxDgaGTgSWJ
	lOuNIWfuRvB9W2Z26HqHb4Yf+tXzRKdj5EUKIXtv+pMUICxXDJRYPnuSzalnLbGf
	Sa9FnXzo6bINI7p29Z3YXg24LG45SOYq8dkRr+aijUnn3ze+8rmKk1LEkIMzv/US
	ETrFkoTpfjF92L6VJqB/H6KA06Ul3eOkhHxsrVLT9hevgXb5q9vaLUL7GOYCSihH
	XAH+bAlU2JWY56HbvuajnsWb1ZwOTpau1r4+1Zt4Mg3zMZDjZm3OOsxGAuqXGbxV
	BuDVXnlF2YhIeUNixkRXMkWhCzM7shbffRQ==
X-ME-Sender: <xms:X2iuZ5KByZz7gSYLW3pKKrWYyCol0Zfxq3vu0spxFPpZ3wWAgWTCfA>
    <xme:X2iuZ1JzwyJa-vpjc6gKW4-KDoHwa0eV_eodn1jCkWW3IBEfCNYEiW-O4uh7KGyLr
    0KU4KZwHjrGNQ>
X-ME-Received: <xmr:X2iuZxsezMlfEtqlDCJkTbAf8GmCOoV8yKEXUemz4ykWQ4qfBYlZWoIzWKIGHsBuZN-414GKhxJ3NLVubzQrMb9UNaD2upNXYQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegjeekkecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:X2iuZ6Z_vL7uPF6UaFGz3CBLAtIGCtN1vLmf1zIVBo9i6dil8yt7qA>
    <xmx:X2iuZwZCPW7lXP8LLiLgmTmyz4_u0fDElECzlHnaRLKoFYjuiFYMeA>
    <xmx:X2iuZ-Ac1YuTnaX-tp1JqKyeOsMXdvXhSmO2PDFX-kWB_To2hFN_Yg>
    <xmx:X2iuZ-YczFLefANQSj0LcDU9MCusUUuJ2AxnN0GV-5Qqqy1josZ5qg>
    <xmx:X2iuZ4E-cJXDYjhm8d6QBlQnzsPTeyxXDvBZVvyylBVRf-YFb6OxLir1>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 13 Feb 2025 22:47:07 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1 2/3] automation: add jobs running tests from
 tools/tests/*
Message-ID: <Z65oW7N64mfdKC44@mail-itl>
References: <cover.068c7421003863de7fca1cbe6aed2af000f061a7.1739409822.git-series.marmarek@invisiblethingslab.com>
 <3fbb4c6be9d9190bb2bd6427ab0f0a933c95dde1.1739409822.git-series.marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2502121802540.619090@ubuntu-linux-20-04-desktop>
 <Z61Yw50tlX-xH9b6@mail-itl>
 <alpine.DEB.2.22.394.2502131111030.619090@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vQDT042XrlGx+RJx"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2502131111030.619090@ubuntu-linux-20-04-desktop>


--vQDT042XrlGx+RJx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Feb 2025 22:47:07 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1 2/3] automation: add jobs running tests from
 tools/tests/*

On Thu, Feb 13, 2025 at 11:14:43AM -0800, Stefano Stabellini wrote:
> On Thu, 13 Feb 2025, Marek Marczykowski-G=C3=B3recki wrote:
> > > > diff --git a/automation/scripts/run-tools-tests b/automation/script=
s/run-tools-tests
> > > > new file mode 100755
> > > > index 000000000000..242a9edad941
> > > > --- /dev/null
> > > > +++ b/automation/scripts/run-tools-tests
> > > > @@ -0,0 +1,47 @@
> > > > +#!/bin/sh
> > >=20
> > > It should be /bin/bash
> >=20
> > That script is running inside SUT (started from initramfs) which is
> > rather minimal. I think it currently has bash, but with the initramfs at
> > over 200MB (compressed) I can see trimming it in the future...
>=20
> Hi Marek, let me clarify a bit more my comment.
>=20
> While I have a preference for bash because that is what we are using for
> all the other shell scripts, it is OK to use /bin/sh but then we need to
> make sure the script is actually /bin/sh compatible and doesn't have any
> bash-isms. Eye-balling the script I had the impression it was using
> bash-isms, so I made the comment about using /bin/bash.

Indeed +=3D is bash-ism. But since I generate xml report now, I don't even
need it anymore.

> But in my experience most /bin/sh implementations today they are
> actually somewhat bash compatible, so in general it is easier to declare
> /bin/bash instead of /bin/sh.

I guess that's fine with the current initramfs. If somebody wants to
reduce it, this can be changed later.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--vQDT042XrlGx+RJx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmeuaFsACgkQ24/THMrX
1yxsswf8CArtNXunNm+pcVqlUB+DtSbHIx2ylgpgUiNlIQjg9Ts/Rt/BPuupNN45
fvanYeKyzF2riMo0w3b4FWi2d4sEFPk4Tm4hr9dyVJ+ZhCwn+wZunWSlg9ZWrsiA
BkPe9wNewrnS82RLY3KCiTBKtIKY074SB48fBYJJjz5Io1sT7HBeSkUnMfU2AaNz
3PhFOO9Zozmrtzm/QGRK/zilT0QUEPeRyFUMmLB4te8ftgmUW69Sp7DQpK0XSnSk
ow7TeZP5nVf7wfXNibLtBtTzHwbnnJWOa8CSpQLcdg2kILkmDtXDTL8xosp2NrJE
eiaXnefaGb1jXcdjmJSTyGsfd1VWdA==
=OY1T
-----END PGP SIGNATURE-----

--vQDT042XrlGx+RJx--

