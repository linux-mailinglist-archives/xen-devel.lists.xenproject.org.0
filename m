Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGeqHqDR02m6mgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 17:30:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C32B83A4BA3
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 17:30:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274229.1560400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9ltw-00023y-HT; Mon, 06 Apr 2026 15:30:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274229.1560400; Mon, 06 Apr 2026 15:30:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9ltw-00021d-EC; Mon, 06 Apr 2026 15:30:08 +0000
Received: by outflank-mailman (input) for mailman id 1274229;
 Mon, 06 Apr 2026 15:30:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w9ltu-0001yI-Sq
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 15:30:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w9ltt-001E1I-Od
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 17:30:05 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d3d15a-2eae-0a2a0a5409dd-0a2a4501e71a-42
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 17:30:05 +0200
Received: from [103.168.172.151] (helo=fout-a8-smtp.messagingengine.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d3d17b-6fc9-0a2a45010019-67a8ac97a193-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 17:30:04 +0200
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.phl.internal (Postfix) with ESMTP id 5A028EC03FD;
 Mon,  6 Apr 2026 11:30:02 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Mon, 06 Apr 2026 11:30:02 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Apr 2026 11:30:00 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775489402;
	 x=1775575802; bh=0sQ1pmUCsIAULZ6+kpDaBqJOkWcTJ+PmOvsnYD2tNLc=; b=
	mDWMz2S3AwyfHzecVu8tSEYVEFQrhkhQ9m2hZl4ZLBRyBpOIDp/I39Z23f412D5X
	Hg1oALXcNmOl6lJ0zFUr6g68platPKNO06DEo8OfBxq1ti+nRyhsszqOaWGazv60
	MEEaYIouR3ibsgR3JKjkRljV/29mBmON9XXQLbBkCkhmupld/66utzd+on5Qq60y
	BOA2HqMj2/BBQE+Uw0AsFoTDJOX1tHXBU4bJuK7d2n4g8bG/cjnXUpDz8izCu9jT
	rF+jSCdXNcF6jVNYoqqKsqrczOw+B3YCHIBmGPaXjpqVBBwRx2QT3wKc/AYGLm3H
	b75n/u0pNpMKfN1ft3iniw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775489402; x=1775575802; bh=0sQ1pmUCsIAULZ6+kpDaBqJOkWcTJ+PmOvs
	nYD2tNLc=; b=o5ry1wnS6FC549d+HELAr/PD9Za4Uz3432rvWFhXC7/37JjWKje
	U9ogjzPZpBT51g1YnGxrNM8h+f/KpJcDZVmoA17qQtte1IuzaKq7YI4z14TUfxL+
	jzFqn28Yxw/2FbSZTnkWu3T94rpJclj4qV8OEXTKgGZcwe4yp/n3amV9rGEpGmZF
	S+0F5LIzUgpUuXZRHETouu8wq1+sZArI7pNobvCRD/yir7f/pkoJXyW2Gz/u4yh9
	HKG3VKSs6/xWXWKftDh0lVNoewBjAlVGZEt1cY17WpE6S7kmSWdWskGdtnuHSRCy
	coOeozHSMsdF9EUgwLldXeUXVS1FBIGJo9Q==
X-ME-Sender: <xms:edHTaRT0wMMo9r9PNyztsNytDPXE8ogAM5C3bjYGYbIP1ttXAeuTnQ>
    <xme:edHTaRylEHLlYPEHqV1bZni4RWBc_N_Txdu-1POwERG673CH5edhrQcT7jwDG1a1y
    t5tDm0vg3uL_kU0giFtU4_of6b0EqQ6RMBShRxnGhlE-51O>
X-ME-Received: <xmr:edHTab2CJ3ESCZMxXUU9LSxf0tWPI4oX6wxwuXQ2zjMGHNfP7YxYLgGGzQJmHG4iCPFS1ZisU9fUFbxVV-_d_QEQg0BsFQEY25k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddukedtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeukeegleef
    uedvffekleefveeggedtueejhfeggfeflefgieejhedtkeejheffjeenucffohhmrghinh
    epnhhtphdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehj
    sggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslh
    hishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepjhhgrhhoshhssehs
    uhhsvgdrtghomhdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:edHTaX6GpPLzOK7FiPeIajuZZoka5iug9AnmSPL33sQUj7e4NiWTlQ>
    <xmx:edHTaWWtSw4pW4UAqf4ljmaoN5x2SKVk9aRT49yJxS-SnUa9vutOLw>
    <xmx:edHTaeDfs9GdMzFlQruC4ULel8MecFbcspJEmvIwZrgcj1_S_zX8cg>
    <xmx:edHTad6lJA9x04ifEPN8nVeGs_6spvUDmS46d3wpNj8CQPs5sEKj-Q>
    <xmx:etHTacPTdHHo6j-SK6E_4WSl_SdRauuF3gEyCeOwq3lq3r76yJ6FcBlR>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 6 Apr 2026 17:29:58 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: Slow (higher scheduling latency?) system after S3 - regression
 4.17 -> 4.19 ?
Message-ID: <adPRdiCTLZEXtXpq@mail-itl>
References: <aPzBO_eW8mQHM66u@mail-itl>
 <acQzzlXNDxNq885V@mail-itl>
 <29775afa-e17b-4c44-a2a8-4ef4bc7cdf0f@suse.com>
 <acUqOL232lp-Lw1v@mail-itl>
 <cbed767b-4ac4-4989-8778-43ff321ae977@suse.com>
 <acVWX8vkhZiFfonP@mail-itl>
 <88c65ec7-b7f7-4d8b-a453-d707440b43cb@suse.com>
 <acZ8ez4dmQay1JSw@mail-itl>
 <ac5l-HgbDRcVkiWb@mail-itl>
 <ac_Gu2lm4Jnoz7WN@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="F629bKJhvAiDwbl3"
Content-Disposition: inline
In-Reply-To: <ac_Gu2lm4Jnoz7WN@mail-itl>
X-purgate-ID: tlsNG-d62444/1775489405-BC766185-E61D7C9F/0/0
X-purgate-type: clean
X-purgate-size: 3042
X-Spamd-Result: default: False [-1.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:dkim];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
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
X-Rspamd-Queue-Id: C32B83A4BA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--F629bKJhvAiDwbl3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 6 Apr 2026 17:29:58 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: Slow (higher scheduling latency?) system after S3 - regression
 4.17 -> 4.19 ?

On Fri, Apr 03, 2026 at 03:55:07PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Thu, Apr 02, 2026 at 03:02:15PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Fri, Mar 27, 2026 at 01:47:55PM +0100, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > Some further observation, this time regarding timers:
> >=20
> > In the meantime Roger suggested it might be about C-states. So, I just
> > tried booting with max_cstate=3D0. I got this:
>=20
> We had a design session on this issue, and managed to find (thanks Roger!)
> that adding:
>=20
>     tsc_mode=3D'always_emulate'
>=20
> to the domU config fixes the issue. Now, the question is how to fix it
> properly...

I also did another test with NTP inside domU (after host S3):

$ ntpdate -q pool.ntp.org
2026-04-06 00:07:01.559218 (+0200) -0.216281 +/- 0.012486 pool.ntp.org 141.=
144.241.16 s2 no-leap
$ ntpdate -q pool.ntp.org
2026-04-06 00:57:40.852612 (+0200) -0.255782 +/- 0.013022 pool.ntp.org 185.=
252.140.125 s2 no-leap
$ ntpdate -q pool.ntp.org
2026-04-06 13:07:57.647126 (+0200) -0.791802 +/- 0.056578 pool.ntp.org 185.=
248.188.98 s1 no-leap
$ ntpdate -q pool.ntp.org
2026-04-06 13:08:01.844118 (+0200) -0.832599 +/- 0.012563 pool.ntp.org 185.=
248.188.98 s1 no-leap
$ ntpdate -q 141.144.241.16
2026-04-06 13:08:47.835271 (+0200) -0.819725 +/- 0.028655 141.144.241.16 s2=
 no-leap
$ ntpdate -q 141.144.241.16
2026-04-06 13:08:51.290526 (+0200) -0.833668 +/- 0.015501 141.144.241.16 s2=
 no-leap
$ ntpdate -q 141.144.241.16
2026-04-06 13:08:56.136567 (+0200) -0.832294 +/- 0.014493 141.144.241.16 s2=
 no-leap
$ ntpdate -q 141.144.241.16
2026-04-06 17:21:41.017554 (+0200) -1.044511 +/- 0.021817 141.144.241.16 s2=
 no-leap

So, domU's clock definitely drifts.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--F629bKJhvAiDwbl3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnT0XYACgkQ24/THMrX
1yynEwf/eRO74GKeVMvcaA9wOJKDjsLG/ZweEvDhjBWJRfwMXyWfOFb/CbUfBWDc
CBcOa5DtGph5YQnU9ckWdyN16HlW0GiDSuY/X99KfcUpCFXaJLdxSLlJdRBXFHvh
vinuBwUty868tWz8wED0OvRlmZOK6X8SwAi26ea6ur4FJ5JRC2Gjjv8efqY2HLjM
kEqg5jxUCMSGivAl/HVrlYSIGiZZhQ6f0/647JlFMzww6zNS0Xvew+80egOQniqy
rrOLtyrIWSnmHJj/dqAKfTmj2WwwWmgBJNpuU/LS93C16lgLqnUMHdxbCK2jfYu6
xJkXeln+ATuroCLIbyouNn+N59LlTw==
=tz0q
-----END PGP SIGNATURE-----

--F629bKJhvAiDwbl3--

