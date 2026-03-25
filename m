Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uF1QIe0zxGkAxQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 20:13:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C076F32B11E
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 20:13:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262977.1555242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5TfS-0005k1-HA; Wed, 25 Mar 2026 19:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262977.1555242; Wed, 25 Mar 2026 19:13:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5TfS-0005hF-Dg; Wed, 25 Mar 2026 19:13:26 +0000
Received: by outflank-mailman (input) for mailman id 1262977;
 Wed, 25 Mar 2026 19:13:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w5TfR-0005h9-0Y
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 19:13:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5TfQ-001WkW-Cn
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 20:13:24 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69c433a4-e002-0a2a0a5209dd-0a2a45069d6e-20
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 20:13:24 +0100
Received: from [202.12.124.147] (helo=fout-b4-smtp.messagingengine.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69c433d2-3034-0a2a45060019-ca0c7c93e5f7-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 20:13:23 +0100
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.stl.internal (Postfix) with ESMTP id B34B91D000EA
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 15:13:21 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Wed, 25 Mar 2026 15:13:21 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 15:13:20 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm1 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774466001;
	 x=1774552401; bh=nMQNNNSmSCNW7nA5E6CSZFFUyNcWL9Sr+QS6B/QMb4M=; b=
	XLdjha7zsG63I3jxRL9ngIAiGFbWjRAdcAiawC17RaCmRm0kNRRln7ZHdNbibK5T
	zQKzgp8WmATEPE3or3ZY0WJzq2fxaPp9D5R8iHGt4RGGzMs7cDZthaR9A4S46TnL
	Ps+U/9SVZcBB0bDEvnEJ+RmKwN1Nyu2WqIhS4HyKImnZLngrmuriqQkYwMMma4Eh
	n18k7kl/ldc3fNx0CbH3Yfg0yROnfDOU0QMUWtCjCAEjjaVZDy8Hr9EERQmu2Yw/
	4hzI8gU4RM/zJIPnGi+U4qIzamSKFgvbfISFxYeOFspNasWKOPS/XVFEddpnlVIT
	7FrwhWvBYlmeOEdz7eetzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774466001; x=1774552401; bh=nMQNNNSmSCNW7nA5E6CSZFFUyNcWL9Sr+QS
	6B/QMb4M=; b=RQTvdilcOdqC8sTEVpTdfJCSjZDiOyI2sNRN3wTJ1yoHJpe53Ut
	/xPtYzt7Y26+55N8GbM+0eeORq+tM8r+PHiOOJIro9UW1t+aIR3wsK4ssiJxsGiK
	4W+xgMROycUQAGfr/z/8UVn7w50LB5fzI71B79ORckTlCzrMBjCkJ5kK+wdLQ1vC
	I27817+RPiOi+Vbns1etAFlz79hdG0ZhurCmewz7/AtGpP9WuBpr3nN15KBC8jfR
	mNNQ3zOWAdxU0rF7POradozKzdoaDAKgbrzxN+Rx051KQZD+ZxkhAcR3Vcegc4vw
	ofoRVNkZnwjguR5nzYuGIgg9f5KaXc2N/9w==
X-ME-Sender: <xms:0TPEaZCeF416IXMdx_sC7E6RxBuHzeFw-gNl4aO3XcRXPDkcfscW5w>
    <xme:0TPEaef34_5AwMkojwNOiCDoLYCiXCVYG2_TdDmmXcFibI35nVC1PPeLXNk81qFBx
    mFx49Gz3Y2sm3-Oe2EP9ZE8HsBJReOUPHFSCYYKu3WzcRtOnHU>
X-ME-Received: <xmr:0TPEaaOC4K6L2iwXXSQLMP8Be7xlpSGjtgc-2edIbdf47qQsC4QWlV47WC9PpQlah0wrz8C-bGA9zmtBe_9J4ficJ5gHyPpKFJ4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdehvdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtreertd
    dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
    uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnhepkeegtdfgvdeihefhhedtvdelieeiueetveehteffjeejjedv
    ieejvefhueeffeegnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedupdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdig
    vghnphhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:0TPEaY6Sr1sH13hAam65vvfhIiyNmFnT5rYe_UWzki2cC2ZxR2tEpQ>
    <xmx:0TPEaeLveackY7HGgscQZl4eqol8U73edCh25rrdchpOofYyNocIjA>
    <xmx:0TPEaSccc74wRNXJzzqU-ezsLZJCsBEmBJg9TGBExJdYBfcwB7YGaw>
    <xmx:0TPEaRcQQVefBfQAGpaxk6UdO7KuD55eRvtHnkQZxqtGE4kRLqaD8g>
    <xmx:0TPEaXxETLWqVzKDkJ4otU4EBJr9gSymuFFYMUD3rYD3Myl-f2DAQMbD>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 25 Mar 2026 20:13:18 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Slow (higher scheduling latency?) system after S3 - regression
 4.17 -> 4.19 ?
Message-ID: <acQzzlXNDxNq885V@mail-itl>
References: <aPzBO_eW8mQHM66u@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cdCRxXTfxIus4DWw"
Content-Disposition: inline
In-Reply-To: <aPzBO_eW8mQHM66u@mail-itl>
X-purgate-ID: tlsNG-16d1c6/1774466004-781831C2-BA19E5AE/0/0
X-purgate-type: clean
X-purgate-size: 4630
X-Spamd-Result: default: False [-1.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: C076F32B11E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--cdCRxXTfxIus4DWw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Mar 2026 20:13:18 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Slow (higher scheduling latency?) system after S3 - regression
 4.17 -> 4.19 ?

On Sat, Oct 25, 2025 at 02:23:23PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> Hi,
>=20
> After updating from Xen 4.17 to 4.19 it appears that I have some
> performance issues if system was suspended before. For now this is just
> vague observation, as I don't have much data yet.
>=20
> Generally, the user observable effect is that audio playback (over
> Qubes's PV audio thing) becomes very choppy, beyond usefulness (cannot
> make audio calls anymore, music/video playback also becomes useless with
> some players. For me this suggests some increased latency in scheduling
> - maybe some timer fires too late?
>=20
> This doesn't happen always, but I'd say quite often after S3, sometimes
> may need two or three suspend cycles to trigger the issue. But it's
> possible it is also some other factor, like which pCPU the VM gets
> scheduled on, maybe? But for now I didn't hit this issue before
> performing any S3. I don't have a reliable reproducer yet.
>=20
> While I write it's related to 4.17 -> 4.19 update, there is also slight
> possibility it's related to hardware change (CFL -> MTL). But, it's
> unlikely, since I'd probably get much more bug reports about that (the
> stable Qubes version uses 4.17, and we have many users on MTL).
>=20
> What would be the method to collect some useful debugging info? Some
> debug-keys (r? a?), some cmdline options?

In the meantime (sharing some of it on Matrix already), I managed to
build a much more isolated test. Specifically, a single PVH domU with
VLC, preloading 1s of audio (and not playing it really, the output is
set to a file). The specific command is:

    VLC_VERBOSE=3D3 vlc -I cli -A afile --no-loop --play-and-exit --run-tim=
e 1   ./melodigne-quiz-blind-test-187140.mp3

The domU rootfs (or rather: initramfs) is based on AppImage of VLC,
there is not much more inside, and the above command is called as part
of init script (and domU is terminated shortly after).

There is no persistent state in the test, the whole thing is network
booted from the same base. The only things changing between runs is xen
binary + toolstack.

In the output I'm looking for this line: main input debug: Stream buffering=
 done (1018 ms in 2 ms)

Before S3 it takes 0-2ms, sometimes (rarely) 10ms (not sure why). Just
after S3 it takes very similar amount of time.
Then, I wait 30min, and run that command (or really the whole domU)
again a few times. I consider it "good" if I get at least one result
below 10ms. With this test in hand, I did run bisect between
staging-4.17 and staging-4.19. And here stuff gets interesting:

At 498a4ded74b3f062c52e42568223dc5858d27731 I get the following times
(in ms):

    30m after S3: 2, 2, 10, 10,=20
    1h after S3: 2, 16, 16, 2, 17

At 5effd810c629d9a836e46ee321ca7409dad27212:

    30m after S3: 26, 27, 26, 15
    1h after S3: 24, 25, 37, 37, 25

This doesn't make any sense to me. There is a clear difference, yet
5effd810c629d9a836e46ee321ca7409dad27212 looks like a no-op change (at
least for this Intel system).
The earlier case is still not great, as there is still some
degradation after S3, but it gets significantly worse after that commit.

Console log of both versions:
https://gist.github.com/marmarek/ebcb0ff65dbdb31875e4e69db19e4729

In the "bad" case, I see this extra line:
(XEN) [    6.902973] Platform timer appears to have unexpectedly wrapped 1 =
times.

But in an earlier run of the same build it's not there.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--cdCRxXTfxIus4DWw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnEM84ACgkQ24/THMrX
1yxLdAf+Le2Z/FsOifJWVC7scOVsd8thHkmifsXSBDutriwore/ZIKaami4Dzm96
JRxncqB7J7Rp/jT1FwtD51mmwKrpUQ2Jc7w+I3ArLf9oncswPe73spAd0OUN7J2c
sC6tSw1+AZDEIVfqFoDK2WcB6u+JNnibnr+DWBG7sZf/pDvHfy5FlFYFHz7F/Vsa
LuqVjCeSsXjwiAOgQMKef1xPsdQSgbR8gP3XPD1pGFATTJWYQgoeSB2dXjKBaHAb
pydmBhDanogsell0PNRgrz0eRLIizrZYbCFa2QWHOUiIrWyrW9YI70E3cT/vJgAr
x/UMN3UWq70VsTRveKTvl1WSeP2MHg==
=x2wZ
-----END PGP SIGNATURE-----

--cdCRxXTfxIus4DWw--

