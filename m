Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GfeJ5W892m5lgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 03 May 2026 23:22:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B6C4B77BB
	for <lists+xen-devel@lfdr.de>; Sun, 03 May 2026 23:22:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299408.1573948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJeFb-0005su-Jk; Sun, 03 May 2026 21:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299408.1573948; Sun, 03 May 2026 21:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJeFb-0005r1-Fy; Sun, 03 May 2026 21:21:19 +0000
Received: by outflank-mailman (input) for mailman id 1299408;
 Sun, 03 May 2026 21:21:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wJeFZ-0005qv-TA
 for xen-devel@lists.xenproject.org; Sun, 03 May 2026 21:21:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJeFY-00GhAp-0W
 for xen-devel@lists.xenproject.org; Sun, 03 May 2026 23:21:16 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f7bc0d-2eae-0a2a0a5409dd-0a2a45019980-10
 for <xen-devel@lists.xenproject.org>; Sun, 03 May 2026 23:21:15 +0200
Received: from [103.168.172.149] (helo=fout-a6-smtp.messagingengine.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f7bc4a-c1f2-0a2a45010019-67a8ac959d43-3
 for <xen-devel@lists.xenproject.org>; Sun, 03 May 2026 23:21:14 +0200
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id CAE51EC0122;
 Sun,  3 May 2026 17:21:13 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Sun, 03 May 2026 17:21:13 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 3 May 2026 17:21:12 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777843273;
	 x=1777929673; bh=LbAibiXl37U+LtHIHL0spSBU25Ad9Cjf/ZBzAVYM5OQ=; b=
	ruOnwgmo7XW+kVGJp6nZxVJXDTT+7hXSMWE0Tj6ZytuB/esNCa7BPpWxlTSG1H5d
	cGCN7Kpj9FTx2r1nTotE/+gykUXY0WXIUgtmKs91zx/8JKUp5VSKBulLhKQQlxTT
	Y+7cWPAw9nr0NuqvDltwot/4m08G5HSSz08yzipizy3LfPjtPXMTjtMWwK1x5qpa
	+KhTvXKObnRvql2+szLmhF+w16VPtVZp25amCo6aA8+z6LXpRIJ7MCRFO2+SmbsY
	9M7aQwVzr+10Nc1wnjLuJxajtAbvgioh+UHqNWJFG4v2k2S5q/nXUz7xMrQPv9Ui
	fV+2+p0gCZVpF4CM5BAizQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1777843273; x=1777929673; bh=LbAibiXl37U+LtHIHL0spSBU25Ad9Cjf/ZB
	zAVYM5OQ=; b=Eyoe3yOjaO6KB9Y1YW0OY8NvR/u0SvjZz5TLUTUJfXfjef9Fn93
	7C7sKKPLYPeQoP4YnLfmRIvsgkcEMbOygmMJ3uoQ10NR9Nnkpfj/fP7fAp/O3bkA
	i/aDh0veiLSJOb8Vi4l8Cxz7N+dmOMo2WoA70PsFLu9mGCy6YBGig4aOpFwGJuPp
	A+NiugRqjcL14mphoqdA6IpD4EW1hZWK5laN5qn9msPJhNOmcs3HPmpTSdcrHh0p
	4PvVMXsUo4D2BzeITwBQS2FZdsNUvtVUK61l66KNB8AM0xTvwG7WLl0zast5vLJL
	33MSeieFmLuC6tg13gBJ/9rJ74FWo9TqV1Q==
X-ME-Sender: <xms:Sbz3acbG7GSGZ3-x2kc_acYrQLlMddn_XRs1XupB-AJvBlW6ezufow>
    <xme:Sbz3aeRsG8GIG-PaSwR0D28uHDAcq7xD2-sK8ZDHw9YkQLCHDmCVHFACb87hyD-mT
    x8Gd-lSfW2XGi8-FQlsbJCLESdpsitS-DQzzVoxMLCeYfpz>
X-ME-Received: <xmr:Sbz3afTHxJn56dm2cFch6qLwmrD05cOLofsMRRZy0s28LlnL-osTgly4ja5kpR0CkZqqjWPvJKRlCnlPzii2JRjE1yIf6n2myAE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeljedtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevueejteeg
    leelteduueevhfetgfffjeevtddvgfeiveehteehleegueelvdejveenucffohhmrghinh
    epghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomhdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepmhhitghhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtohepgigvnhdqug
    gvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghn
    ughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrg
    gsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghu
    segtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:Sbz3aSSF_7ZwaxYiZ_vasZrDnVaPMmYDicR5XN6rZs0b_HO8C7rR2g>
    <xmx:Sbz3aU7Fr6Y2FZS7ytjJOCitCLEAi7SKn7C1xELUGDL0mF89qz9l9A>
    <xmx:Sbz3ae1v_28RmoKkHyyhd5OF24oy19VSvGaNdG1i8qQSiwa5Yeizjw>
    <xmx:Sbz3afDdBjkt6GIrVhRa006VST2y3Ra-4Pn1q4ARlsUjuoYtwtPu7A>
    <xmx:Sbz3aWbbPeANNk_cww6oZyzYibhh323LTl2vaOSwYI5n5D0xoSpWTkMR>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 3 May 2026 23:21:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v3 02/13] Switch Linux builds to use
 Alpine 3.22 container
Message-ID: <afe8RoMFDdI1fLft@mail-itl>
References: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
 <652a2f219b370af5364d8ef29264acc33a89f676.1774999132.git-series.marmarek@invisiblethingslab.com>
 <bf843de8-dbfb-436c-ac33-ea801ac61b53@amd.com>
 <aczB_KRjioY3KCtA@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aTnhuwifSrVovotV"
Content-Disposition: inline
In-Reply-To: <aczB_KRjioY3KCtA@mail-itl>
X-purgate-ID: tlsNG-d62444/1777843275-BEE63FF4-44483B73/0/0
X-purgate-type: clean
X-purgate-size: 2020
X-Rspamd-Queue-Id: D0B6C4B77BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm3];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]


--aTnhuwifSrVovotV
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 3 May 2026 23:21:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v3 02/13] Switch Linux builds to use
 Alpine 3.22 container

On Wed, Apr 01, 2026 at 08:58:04AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Wed, Apr 01, 2026 at 08:46:02AM +0200, Orzel, Michal wrote:
> > Why not 3.23 if it's already there?
>=20
> Because it wasn't yet when I prepared this patch series :)
>=20
> I can update again and see if any other changes are needed with 3.23.
> Other patches are independent of this change.

So, Linux 6.6.56 fails to build there:
https://gitlab.com/xen-project/people/marmarek/test-artifacts/-/jobs/141912=
60643

This is fixed in Linux 6.6.95, but I can't just drop 6.6.56 as stable
branches still use it. Alternatively, I could keep this one building on
Alpine 3.18, as it needs to stay anyway for the same reason.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--aTnhuwifSrVovotV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmn3vEYACgkQ24/THMrX
1yxGxwgAhzEnNXzZ8HzXn+on2k7551wKouzGewas3ilx/uQh6xAB/FQtptAu93Kw
3dYJ1x9b2nNrupOv+Xiwl/wh8jujBnsQ/HYlYSug3ieTid8TiL5dEk9iJIf2R0g5
J2dX9gNZA6Uu/0LpheHMYC5s/5Jr+zzn1JoXDu+y9U5JJu9j4C8sn5326ztT1UnD
OrmOblehPYkpQ29pm+y3CfQy1GkZeSyUqf5pninXmX1ycHZ3oCUuJRAZiVxznPkp
T8uiVEIyNOvspb9Ajl5lJeQwNz7BFEV6j0a/m1mHkv82BkF/0Zs35qsfxmAwCmms
sINU/w4iom9fCcN28/0Z4SROx+dkfg==
=YDxd
-----END PGP SIGNATURE-----

--aTnhuwifSrVovotV--

