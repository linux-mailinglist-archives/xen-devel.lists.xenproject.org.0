Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0L+wI4ZWxWkk9gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 16:53:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A3C337E91
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 16:53:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264411.1555979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5n1D-0002hE-5z; Thu, 26 Mar 2026 15:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264411.1555979; Thu, 26 Mar 2026 15:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5n1D-0002en-2h; Thu, 26 Mar 2026 15:53:11 +0000
Received: by outflank-mailman (input) for mailman id 1264411;
 Thu, 26 Mar 2026 15:53:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w5n1A-0002eh-Tp
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 15:53:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5n19-002xBv-U3
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 16:53:08 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69c55651-bab6-0a2a0a5309dd-0a2a4509ae0c-34
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 16:53:07 +0100
Received: from [202.12.124.150] (helo=fout-b7-smtp.messagingengine.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69c55662-e484-0a2a45090019-ca0c7c96dfbd-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 16:53:07 +0100
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.stl.internal (Postfix) with ESMTP id C1FC91D001C5;
 Thu, 26 Mar 2026 11:53:05 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Thu, 26 Mar 2026 11:53:05 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Mar 2026 11:53:04 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774540385;
	 x=1774626785; bh=0AQV6UBJyfScC5+IgZOHN9pPm8iVLUpfGNzquD1O+EA=; b=
	QDFNVP8OI53iBe256U8wY59cToWjbrjx+YpM8GTH03GYCf2xNXtpljXhCNutp7oZ
	r4rVm0lVWrXjR0N+lJBWf5xSohukuL+YUzhg2Fn+l9aLlq+kTc9do/AVXGiJMm9f
	VFrfoZ3nZ1jAggTCMzL4KjKZYUaqOmaj9I9BAKVqOAVTGmD2m1c1yr8fM/3gAzqi
	2T6BTUktQrcFSqwBc7W3ihdBYLKUov2H3lyd0V1XDb5V8FKoLAdFG/F46c/XvmZX
	fzwgJkborU/Q89xlgpesZetC7Xnb+EZYiqYTiuoVmTGVKoUIoXtAGwrpB5YT5QpB
	GiZph4v5BXh4xwhFcri5yQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774540385; x=1774626785; bh=0AQV6UBJyfScC5+IgZOHN9pPm8iVLUpfGNz
	quD1O+EA=; b=2MTXl24BV/630r0DPSvj47HnUbou3kVDSJ1SjHPeskdsokot2yn
	Z1Rl7SIfine4rJz5/heQAFWO8G+3UDsZ13qCpBGPIwO+pv6nXb+UHxJUkU43elIi
	WgceRsTa5tKvSjKuB9necXXwvNxhKcXGZO0wHJL81v5qNNrlBs2xu6hqQ4iXtEQh
	pLf0A5M+390eTTMNkxyg7BpcwgVls7yuLHsumAGWKVzGatWbM3rqwZNl5d79+4HH
	6pzAcndyJlFwkBkeBOAe7mTErFUL3sYZsENJEM1uQRr+4ffPEmTQNgKpZTyzm6aC
	/wsLcqJ7f1s5RKsEq5eCZu7kLw07JQL1g0A==
X-ME-Sender: <xms:YVbFaX7Jm6xY5U2MQoddzeOSL2KMgrv5ERgNk6rORtfjg6EFhVGgjw>
    <xme:YVbFaS6eF1JFcrXi7jOTNQqguZBRFovaSJCJASeBQY3QhSTwDic4ILOePS3QFzQKq
    JaCxrzj4q1ckPhWJwLKvrwKkSrgqzolCDyYyv5slhs_GjuTXlU>
X-ME-Received: <xmr:YVbFacGj3Bbb_LOGnDnQsP3Eea0JDq-ARSuTvrMAcZGO0H-_mP5Hj5EKBar53cTmcFOPx5W4zhX9SEEctjtWN2A2DR5S5VTFFoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdejjeelucetufdoteggodetrf
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
X-ME-Proxy: <xmx:YVbFaTRo13J0gnEMtcqAG7keAk4scRYVolT7mBRjN_nV2YXKN7nGeQ>
    <xmx:YVbFaduTDH8pDoNfdxxaDQ2_6o7VGfY4VqH18AzIea4hAl84ZF_ltA>
    <xmx:YVbFaayhrTrQVJ2LHRBi6XMjyTljBfYTaSDv-OF_QbRP9Jcq5c3qAQ>
    <xmx:YVbFaf4QUwmyYY9fSnVygEb2njTcRU26PU4cjms2Z0KMfvNFAHNmqw>
    <xmx:YVbFaYPoyhmMRtTA1-KqlY-Q5-KJDTYoa9PssCGJIUHM-p-xOjYLhljf>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 26 Mar 2026 16:53:03 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Slow (higher scheduling latency?) system after S3 - regression
 4.17 -> 4.19 ?
Message-ID: <acVWX8vkhZiFfonP@mail-itl>
References: <aPzBO_eW8mQHM66u@mail-itl>
 <acQzzlXNDxNq885V@mail-itl>
 <29775afa-e17b-4c44-a2a8-4ef4bc7cdf0f@suse.com>
 <acUqOL232lp-Lw1v@mail-itl>
 <cbed767b-4ac4-4989-8778-43ff321ae977@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8HmKRw480TDIdQJ/"
Content-Disposition: inline
In-Reply-To: <cbed767b-4ac4-4989-8778-43ff321ae977@suse.com>
X-purgate-ID: tlsNG-bad1c0/1774540387-630A9A73-B5956EF4/0/0
X-purgate-type: clean
X-purgate-size: 6115
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim];
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
X-Rspamd-Queue-Id: C3A3C337E91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--8HmKRw480TDIdQJ/
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Mar 2026 16:53:03 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Slow (higher scheduling latency?) system after S3 - regression
 4.17 -> 4.19 ?

On Thu, Mar 26, 2026 at 02:20:04PM +0100, Jan Beulich wrote:
> On 26.03.2026 13:44, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Mar 26, 2026 at 09:27:56AM +0100, Jan Beulich wrote:
> >> On 25.03.2026 20:13, Marek Marczykowski-G=C3=B3recki wrote:
> >>> On Sat, Oct 25, 2025 at 02:23:23PM +0200, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> >>>> Hi,
> >>>>
> >>>> After updating from Xen 4.17 to 4.19 it appears that I have some
> >>>> performance issues if system was suspended before. For now this is j=
ust
> >>>> vague observation, as I don't have much data yet.
> >>>>
> >>>> Generally, the user observable effect is that audio playback (over
> >>>> Qubes's PV audio thing) becomes very choppy, beyond usefulness (cann=
ot
> >>>> make audio calls anymore, music/video playback also becomes useless =
with
> >>>> some players. For me this suggests some increased latency in schedul=
ing
> >>>> - maybe some timer fires too late?
> >>>>
> >>>> This doesn't happen always, but I'd say quite often after S3, someti=
mes
> >>>> may need two or three suspend cycles to trigger the issue. But it's
> >>>> possible it is also some other factor, like which pCPU the VM gets
> >>>> scheduled on, maybe? But for now I didn't hit this issue before
> >>>> performing any S3. I don't have a reliable reproducer yet.
> >>>>
> >>>> While I write it's related to 4.17 -> 4.19 update, there is also sli=
ght
> >>>> possibility it's related to hardware change (CFL -> MTL). But, it's
> >>>> unlikely, since I'd probably get much more bug reports about that (t=
he
> >>>> stable Qubes version uses 4.17, and we have many users on MTL).
> >>>>
> >>>> What would be the method to collect some useful debugging info? Some
> >>>> debug-keys (r? a?), some cmdline options?
> >>>
> >>> In the meantime (sharing some of it on Matrix already), I managed to
> >>> build a much more isolated test. Specifically, a single PVH domU with
> >>> VLC, preloading 1s of audio (and not playing it really, the output is
> >>> set to a file). The specific command is:
> >>>
> >>>     VLC_VERBOSE=3D3 vlc -I cli -A afile --no-loop --play-and-exit --r=
un-time 1   ./melodigne-quiz-blind-test-187140.mp3
> >>>
> >>> The domU rootfs (or rather: initramfs) is based on AppImage of VLC,
> >>> there is not much more inside, and the above command is called as part
> >>> of init script (and domU is terminated shortly after).
> >>>
> >>> There is no persistent state in the test, the whole thing is network
> >>> booted from the same base. The only things changing between runs is x=
en
> >>> binary + toolstack.
> >>>
> >>> In the output I'm looking for this line: main input debug: Stream buf=
fering done (1018 ms in 2 ms)
> >>>
> >>> Before S3 it takes 0-2ms, sometimes (rarely) 10ms (not sure why). Just
> >>> after S3 it takes very similar amount of time.
> >>> Then, I wait 30min, and run that command (or really the whole domU)
> >>> again a few times. I consider it "good" if I get at least one result
> >>> below 10ms. With this test in hand, I did run bisect between
> >>> staging-4.17 and staging-4.19. And here stuff gets interesting:
> >>>
> >>> At 498a4ded74b3f062c52e42568223dc5858d27731 I get the following times
> >>> (in ms):
> >>>
> >>>     30m after S3: 2, 2, 10, 10,=20
> >>>     1h after S3: 2, 16, 16, 2, 17
> >>>
> >>> At 5effd810c629d9a836e46ee321ca7409dad27212:
> >>>
> >>>     30m after S3: 26, 27, 26, 15
> >>>     1h after S3: 24, 25, 37, 37, 25
> >>>
> >>> This doesn't make any sense to me. There is a clear difference, yet
> >>> 5effd810c629d9a836e46ee321ca7409dad27212 looks like a no-op change (at
> >>> least for this Intel system).
> >>
> >> Pretty odd indeed. I assume you double checked the effect by going back
> >> and forth between the two commits.
> >=20
> > Yes...
> >=20
> >> If the effect persists, could you make
> >> both binaries (xen-syms or xen.efi respectively, depending on which one
> >> you use of the system) available somewhere for inspection? There has to
> >> be some relevant difference, e.g. by addresses shifting slightly.
> >=20
> > Sure, here: https://salmon.qubes-os.org/~marmarek/xen-perf-weird.tar.gz
>=20
> While said commit changes the size of init_nonfatal_mce_checker() by 4
> bytes, that doesn't lead to any other changes. I.e. all addresses remain
> the same. I.e. I'm completely lost as to explaining the observed behavior
> (or even just making a wild guess).

With staging-4.19 from a week ago +
5effd810c629d9a836e46ee321ca7409dad27212 reverted, I got the following
results:

30m after S3: 23, 22, 22, 23
1h after S3: 7, 25, 22, 8, 25

So, there are some fast runs, but most are in line with the "bad" case
above...

But, I have another idea why that seemingly no-op commit may change
something: maybe it's about stack content during/after the function
call, influencing some uninitialized variable down the road?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--8HmKRw480TDIdQJ/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnFVl8ACgkQ24/THMrX
1yyoMwf8C2RBDp4cI7LxVITcO0lToqg85ycJL2rPA0mC9Fp/n+wV9fccbNgVm8au
AHWadR9KOCZA/K6JRA7BtvzhboAs28dF+KG63/Z6pVRPfAElqjYhx+0O8ihr7qW1
419OG8Ouq1s6yawawbtrUodgr+vxMidNSI1MLtYK9Pz7ebPey+kCOrBpi3NwXeQi
GKMIOmBRqHptvFwgokH8ZQjDz4f16DVchZ70ZkQ53G2dsntiRisjsEtmjgJEHUnS
X8E9tLY+EM5FeTdnYNSaKLq998cmoCuCH0iHdNqmm7PGqgLjlGeh1bkutlVFQ3un
KzyiRN6FcPr/mIFIyg7jSx4t7+J1MA==
=R05i
-----END PGP SIGNATURE-----

--8HmKRw480TDIdQJ/--

