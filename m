Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UM9EHjozmGleCgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 11:11:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E491C166B3A
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 11:11:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236981.1539458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtNTK-0007z0-2R; Fri, 20 Feb 2026 10:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236981.1539458; Fri, 20 Feb 2026 10:10:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtNTJ-0007wj-VI; Fri, 20 Feb 2026 10:10:53 +0000
Received: by outflank-mailman (input) for mailman id 1236981;
 Fri, 20 Feb 2026 10:10:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8OLq=AY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vtNTI-0007wd-V8
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 10:10:53 +0000
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e7c9d63-0e44-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 11:10:50 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.phl.internal (Postfix) with ESMTP id E328A14001B5;
 Fri, 20 Feb 2026 05:10:48 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Fri, 20 Feb 2026 05:10:48 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Feb 2026 05:10:47 -0500 (EST)
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
X-Inumbo-ID: 6e7c9d63-0e44-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1771582248;
	 x=1771668648; bh=mBa/rxqyGOz8z4KUxwUkeM95z2yAE/9O9KfIU3FMucg=; b=
	bXdOSH/ITOMiaI8jjgj+Mkwa/D+hnZo6qroPQbTUgJC2sAgDLhRG3sEaNQE7Oh5Q
	1pajw29Zv4twGcqwySBakeA5dEPcEhngd8WYy+WQzPmEfr6i58VjoVipda1OIdyh
	0nOSpNXxmMXRwNKScep0t1ljYAeriNE9py41kd46h2InDBTNgeI+3NYOH5uWc1nt
	fHuuxkA8FXN+rKotfSQ3BmaXrytVMHFaj2D2qUSJaaI3B42ikenUCAJholZnmlYC
	Btp88z9BKu53sDlfxcXWwhLhAKqvLXT88cUbmGiLnpaYzA8du/vYCGQuHphZ33N/
	L1go6ttJDfLbhUlav45fJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771582248; x=1771668648; bh=mBa/rxqyGOz8z4KUxwUkeM95z2yAE/9O9Kf
	IU3FMucg=; b=s26cuJ/bW5Zj1PEdGxbFzRVAqYoYKhpO1ugO3C4Bi+GsQUmUndW
	UKKC5Vqz2OIH0uV1v+6Abvns0v1pCP8ItxPyJngUbaJLZ8dFWcZ8/iSDdNWTAuxY
	WoYnk5v53Ul1GYpWZye44PhY7D5E5g9R3nZJkYp6kNe1P5xd5HSlxcP2ySLCd1lK
	yi2CPJe2ZmjjcbDdGKhp04H9JhiOa1CSXxCM1GKzSpThLD6chmAVxOi6v13STHvn
	g4ekeKWf1JQj4ES02HVFWAttV6+7AicZ2OwaMDbtevfGiDRXX4HRZ5zNozvz3Sml
	e1YpUOZRg4H/jPJsUx2vMot/qclCcHiBv8A==
X-ME-Sender: <xms:KDOYaZnAuzvvDMLB4WnVGJfr_B6yf6TPW6dctqJAtAle3upQ7DOWNw>
    <xme:KDOYacRu2Aqwq2dW83zTK9x0hYfSPnWuizgyslNiaM03nfPs257Jk_hBR2KAHO2Qe
    HuBduzZ0aJtcELlPuzJqXcT1d42UGT1s4TTJ19OAc3i4TpoOA>
X-ME-Received: <xmr:KDOYadBJ2VpRgZsQagGT-WFFTZ4fN8OH4YOWhnsKJTU9B2pT-2_PxFMBCUHG4IBrNZBewYpO9sXu8vCsItnXuu3L55Vet4r0PrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvdekudehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptdetvdfh
    kedutedvleffgeeutdektefhtefhfffhfeetgefhieegledvtddtkedtnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepfedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtgho
    mhdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpd
    hrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdho
    rhhg
X-ME-Proxy: <xmx:KDOYaTTRXzueHeudwtaRT5062kF78C27lp-m8BrEVwDQQV04MnU95g>
    <xmx:KDOYabpGEry-v-BhUrpDfvhcT5C0TIKZzXTclVR52UAmQicvOI2Odw>
    <xmx:KDOYaVy6XAlfQIErs1W-kxq1YxCX_6w0WIQiUdN7dEMxoppmWwM2Og>
    <xmx:KDOYaQILjU4CbZFb_-l3KHZdnmQzNBhOL5VKNL3EGFBjOCmvS_FBxw>
    <xmx:KDOYaZieFgVXyG8WFH3yjOLLZl7UU521W2UI3OB76Z77uV5wos1syl3q>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 20 Feb 2026 11:10:46 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] tools: specify C standard explicitly
Message-ID: <aZgzJkTdGtHdKwHd@mail-itl>
References: <20260220004344.1980775-1-marmarek@invisiblethingslab.com>
 <aZexPYiQ5UF6t5uz@mail-itl>
 <1415f4df-8191-4e94-a60a-9b7f0f2599be@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HKXlsan698c3NGvQ"
Content-Disposition: inline
In-Reply-To: <1415f4df-8191-4e94-a60a-9b7f0f2599be@suse.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,messagingengine.com:dkim,invisiblethingslab.com:dkim];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: E491C166B3A
X-Rspamd-Action: no action


--HKXlsan698c3NGvQ
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Feb 2026 11:10:46 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] tools: specify C standard explicitly

On Fri, Feb 20, 2026 at 08:34:08AM +0100, Jan Beulich wrote:
> Is it possible that it's not so much the compiler, but glibc, which is the
> problem here?

Indeed, that's glibc. I tested it starting with CI container and updated
packages one by one - it's about glic 2.42 -> 2.43.

> > So, I guess iterate on v1?
>=20
> Perhaps. As per above it first needs to become clear where the issue is
> actually coming from. Otoh making the code suitably C23-const-correct will
> want to happen at some point anyway, I suppose.

I'll sent v3 with remarks from your review on v1 applied.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--HKXlsan698c3NGvQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmYMyYACgkQ24/THMrX
1yzdWgf8Cpg67921Ysro8oub0wobDe5cTBa0vWOWo9hBZlahhRbvyO5O9jtH/Ftj
Syhl/Y2XwiIp20Qn3Qxd5v0xmr0nG2bSDmK9jKhbNI8NGO2nxk3TT5bPaCfhGC6v
BgUChZR2xrdbmh/arTk65jMBxl5CrHvslEdyZl39b7hV0+LwxLMbG/MZfQC4Uoqf
3KNNRuVlsU/dPNz/NXfekw4TFWSFmCWIc1bXT8Iv7XZ1lEMmiuheqb2bM4ohDuRr
8cMHkxN457QyG7BVyOArOEKP4/+IEYdYAY5XWDDWZtUETG5b3t+zjZYAFTjBHo5v
9C/DBOB6FBlt0MFh1xjnzi2B59WT3A==
=iqBY
-----END PGP SIGNATURE-----

--HKXlsan698c3NGvQ--

