Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8C+OGl4qxWnb7gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 13:45:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B29B43356BB
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 13:45:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263964.1555718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5k4t-0005JO-72; Thu, 26 Mar 2026 12:44:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263964.1555718; Thu, 26 Mar 2026 12:44:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5k4t-0005Hb-4L; Thu, 26 Mar 2026 12:44:47 +0000
Received: by outflank-mailman (input) for mailman id 1263964;
 Thu, 26 Mar 2026 12:44:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w5k4r-0005HT-DJ
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 12:44:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5k4q-009c9r-P7
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 13:44:44 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69c52a39-2eae-0a2a0a5409dd-0a2a45048a3e-8
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 13:44:44 +0100
Received: from [202.12.124.144] (helo=fout-b1-smtp.messagingengine.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69c52a3b-c823-0a2a45040019-ca0c7c90844d-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 13:44:44 +0100
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.stl.internal (Postfix) with ESMTP id E7B901D000E8;
 Thu, 26 Mar 2026 08:44:42 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Thu, 26 Mar 2026 08:44:43 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Mar 2026 08:44:41 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm1 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774529082;
	 x=1774615482; bh=pQwJsngGFYorTGBf8FmLYGEiqapvMhi1HGAp9Pb5pgg=; b=
	rxqH8+vgyZA/C1Ae3TJgg0ed+LWNg1PKOhQwMG4aZGb64SmelcGlxuaP7bJ3hIDE
	82EuUwlTDMTRwL8Z3aEdtU1TJMRLY8LKuNtJek1XgznNvq1mGXLNumE5unYkgg4H
	3M3mral+7dnGrEysO2AaVYuXFRrTb94I+Mvy33RjpTmGdop+n6K+ZAtzl0VPbqGx
	xY7dHxroA0Wt+Ln2FbJD/GMdBK6xWNLLzcom2Sc7TX6ScLa2OdrR5EuLYHUiCs4E
	9YNjYBpG5BR6VpRiVBtKtRMGrwEKxz2qa1hTYqvgPd97jVghdlc5EjKOFMrZfLDX
	zStpMZk93j2RUedn3VPR3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774529082; x=1774615482; bh=pQwJsngGFYorTGBf8FmLYGEiqapvMhi1HGA
	p9Pb5pgg=; b=UK3wozv42hL4aPtwLe+c1ls5oj/CHYgDC0ggd9KHmJkxcY1iF/S
	PpHX49CZcWDJU7SICT9rAj4+P0/VI3rPhrTb2z5GarKrGNLu0DWrRTOKb63dexqo
	dY7rXM/4aGAdnKTQ24C+yh/fLzh4mUpgcQVYSCMtLOgjFx0l4sReYQa8b2p2k8/i
	uhKIW5Jugol7WFTF3Re+VjbFyMQRpMsNVrwcWJh30hADuj5akyCa/1LnOqtvlnJR
	8nXmfR/LasVtpZJ1Pz1BeOnfCtSxpwZhEBFmzw29ehg2O6QiT7xjFwstkRFJ+qJk
	n412RvsiBoZVPgPOOKcqTCuRyrBZnKu11lQ==
X-ME-Sender: <xms:OirFabPbHgZDd44Gr08oOSDKcAwH7UOR-lSSU6YWFvKOzH3g9xfiYQ>
    <xme:OirFab_8HfBT1dnod70g9mJ53VtT1u9HFWmNzCLh9PyP85BFXg2ukZgC8IEC3_SmK
    tlYOxzsoQ8pirLFm6pYtHv4BKb7WrQR52g5_v2WmB1ETbBm5g>
X-ME-Received: <xmr:OirFaX4tNQRtZ0wby3_VibHpU2qnev1UNHKw5WN8ZusIGYKnjsxmf55FMMZftF7rwZVI8l9LsLQYKkNXhh1PCt5NGMWU4WDtuNE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdejgeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueefuedt
    iedtvdeltddtieejgefhueejfeeiteelleeugeetkeevtdeifedvfeevnecuffhomhgrih
    hnpehquhgsvghsqdhoshdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtohepgigvnhdqug
    gvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:OirFaa3bhe3AHETypVw3Dzm52ImSu6VN6o7Z8YxVXzwywh58oPTQUg>
    <xmx:OirFaWB0ntgzEFIB2CZqFDQUAbqLGCYaSOPZygk31ll9Ro43403bGA>
    <xmx:OirFaU24Hb5MGAuXZreEDQlzGr2usL-jXQbLFLTdMWR_z-TuaCX8jQ>
    <xmx:OirFaYtZzS4I1CHew68Yx-DZczfPBrcmbU-MtGK6KWSHw3R-TiOKRw>
    <xmx:OirFaZjLBKef1a7OjJaxy4OMgvz3ppv-554HJUM2B5zA9i6fj8qZ96LZ>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 26 Mar 2026 13:44:40 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Slow (higher scheduling latency?) system after S3 - regression
 4.17 -> 4.19 ?
Message-ID: <acUqOL232lp-Lw1v@mail-itl>
References: <aPzBO_eW8mQHM66u@mail-itl>
 <acQzzlXNDxNq885V@mail-itl>
 <29775afa-e17b-4c44-a2a8-4ef4bc7cdf0f@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lCKMT5P1F6dXhpSG"
Content-Disposition: inline
In-Reply-To: <29775afa-e17b-4c44-a2a8-4ef4bc7cdf0f@suse.com>
X-purgate-ID: tlsNG-ebf023/1774529084-B9E809D1-82D4BD39/0/0
X-purgate-type: clean
X-purgate-size: 5386
X-Spamd-Result: default: False [-1.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:dkim,messagingengine.com:dkim,qubes-os.org:url];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: B29B43356BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--lCKMT5P1F6dXhpSG
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Mar 2026 13:44:40 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Slow (higher scheduling latency?) system after S3 - regression
 4.17 -> 4.19 ?

On Thu, Mar 26, 2026 at 09:27:56AM +0100, Jan Beulich wrote:
> On 25.03.2026 20:13, Marek Marczykowski-G=C3=B3recki wrote:
> > On Sat, Oct 25, 2025 at 02:23:23PM +0200, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> >> Hi,
> >>
> >> After updating from Xen 4.17 to 4.19 it appears that I have some
> >> performance issues if system was suspended before. For now this is just
> >> vague observation, as I don't have much data yet.
> >>
> >> Generally, the user observable effect is that audio playback (over
> >> Qubes's PV audio thing) becomes very choppy, beyond usefulness (cannot
> >> make audio calls anymore, music/video playback also becomes useless wi=
th
> >> some players. For me this suggests some increased latency in scheduling
> >> - maybe some timer fires too late?
> >>
> >> This doesn't happen always, but I'd say quite often after S3, sometimes
> >> may need two or three suspend cycles to trigger the issue. But it's
> >> possible it is also some other factor, like which pCPU the VM gets
> >> scheduled on, maybe? But for now I didn't hit this issue before
> >> performing any S3. I don't have a reliable reproducer yet.
> >>
> >> While I write it's related to 4.17 -> 4.19 update, there is also slight
> >> possibility it's related to hardware change (CFL -> MTL). But, it's
> >> unlikely, since I'd probably get much more bug reports about that (the
> >> stable Qubes version uses 4.17, and we have many users on MTL).
> >>
> >> What would be the method to collect some useful debugging info? Some
> >> debug-keys (r? a?), some cmdline options?
> >=20
> > In the meantime (sharing some of it on Matrix already), I managed to
> > build a much more isolated test. Specifically, a single PVH domU with
> > VLC, preloading 1s of audio (and not playing it really, the output is
> > set to a file). The specific command is:
> >=20
> >     VLC_VERBOSE=3D3 vlc -I cli -A afile --no-loop --play-and-exit --run=
-time 1   ./melodigne-quiz-blind-test-187140.mp3
> >=20
> > The domU rootfs (or rather: initramfs) is based on AppImage of VLC,
> > there is not much more inside, and the above command is called as part
> > of init script (and domU is terminated shortly after).
> >=20
> > There is no persistent state in the test, the whole thing is network
> > booted from the same base. The only things changing between runs is xen
> > binary + toolstack.
> >=20
> > In the output I'm looking for this line: main input debug: Stream buffe=
ring done (1018 ms in 2 ms)
> >=20
> > Before S3 it takes 0-2ms, sometimes (rarely) 10ms (not sure why). Just
> > after S3 it takes very similar amount of time.
> > Then, I wait 30min, and run that command (or really the whole domU)
> > again a few times. I consider it "good" if I get at least one result
> > below 10ms. With this test in hand, I did run bisect between
> > staging-4.17 and staging-4.19. And here stuff gets interesting:
> >=20
> > At 498a4ded74b3f062c52e42568223dc5858d27731 I get the following times
> > (in ms):
> >=20
> >     30m after S3: 2, 2, 10, 10,=20
> >     1h after S3: 2, 16, 16, 2, 17
> >=20
> > At 5effd810c629d9a836e46ee321ca7409dad27212:
> >=20
> >     30m after S3: 26, 27, 26, 15
> >     1h after S3: 24, 25, 37, 37, 25
> >=20
> > This doesn't make any sense to me. There is a clear difference, yet
> > 5effd810c629d9a836e46ee321ca7409dad27212 looks like a no-op change (at
> > least for this Intel system).
>=20
> Pretty odd indeed. I assume you double checked the effect by going back
> and forth between the two commits.

Yes...

> If the effect persists, could you make
> both binaries (xen-syms or xen.efi respectively, depending on which one
> you use of the system) available somewhere for inspection? There has to
> be some relevant difference, e.g. by addresses shifting slightly.

Sure, here: https://salmon.qubes-os.org/~marmarek/xen-perf-weird.tar.gz

> Another possible further step may be to move forward from that commit,
> putting a revert of 5effd810c629 on top. If the behavioral effect is due
> to particular layout of the linked images, the effect should re-surface
> later (likely again at a seeming innocent change).

Good idea, will check.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--lCKMT5P1F6dXhpSG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnFKjgACgkQ24/THMrX
1yy/ZwgAjvHhx3jUtXuwanLrziMWfltl0d8xxW/DOMOchAVqJwbYm+EGw1RmWTc2
fTshUGocxXEvqxsOHKOAHcF41tffRJklcy2XlGdy5oreGSAtrwDtFEhmVdrdxllt
52T0e9c9iCZ3Hohic1wIchDz9PQCu+QAPqCraXr2JnZl1VGym0CiFkPvOALaoqC2
rSDqNcXR31nH+qx9bzJpalZX3Sg3VwAswvCrVUJJjowikOgkB9wdz6o9ftaux8L1
WXcb6MfihOrua2A4tZxp78YEV2wVNiJpWfPZ86sICdoJ6bRLh9VbWBe3mQSpiCy2
ykcQwL7UlAlpqG1VAqbozyqa6WTF4Q==
=SXok
-----END PGP SIGNATURE-----

--lCKMT5P1F6dXhpSG--

