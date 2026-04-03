Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EExzEgXHz2lH0QYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Apr 2026 15:56:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98562394C42
	for <lists+xen-devel@lfdr.de>; Fri, 03 Apr 2026 15:56:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1272940.1560155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8ezT-0008Fy-Lx; Fri, 03 Apr 2026 13:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1272940.1560155; Fri, 03 Apr 2026 13:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8ezT-0008DL-Ir; Fri, 03 Apr 2026 13:55:15 +0000
Received: by outflank-mailman (input) for mailman id 1272940;
 Fri, 03 Apr 2026 13:55:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w8ezS-0008DF-IB
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2026 13:55:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8ezR-008CrE-CZ
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2026 15:55:13 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cfc6b9-bab6-0a2a0a5309dd-0a2a4504c820-16
 for <xen-devel@lists.xenproject.org>; Fri, 03 Apr 2026 15:55:13 +0200
Received: from [103.168.172.152] (helo=fhigh-a1-smtp.messagingengine.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cfc6be-bb33-0a2a45040019-67a8ac9885b9-3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Apr 2026 15:55:11 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 99CF91400396;
 Fri,  3 Apr 2026 09:55:10 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Fri, 03 Apr 2026 09:55:10 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Apr 2026 09:55:09 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775224510;
	 x=1775310910; bh=vGoHzO6shWBU4GS9q1bK9VFcrxVyD7bmDd/q3PRgf4c=; b=
	nsVc+K66eHi1uG618fynDy8fZaGRti1+yYVHiBqMIGYvT5g+VW8lvHLDxvQ5Ienn
	YudjTbcZihJpHNs2mjnvtdnL8Qr7bzE5hIT+0OO0uAtMJbYacI2ww5GwBRaxulGy
	lIXgdUYxTBNGhGRaiTf1R/KCFkfLbiwd5rsUHv+ZxKG6zJpoDOmCCnLIp7hqHx12
	Yb6js1yzSunUPHod/iH8NuKPidg5OuxE3aoNXfCbRpMSUORu8vWKskZ27j5/v12P
	zvviwT0W9UGjfyLjdKfZaCDQv2FvE/Th34HFqq1LeO2/DeD4ymFoklyYq0a5PECx
	vAmStjCZzxHMrtOsYIacKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775224510; x=1775310910; bh=vGoHzO6shWBU4GS9q1bK9VFcrxVyD7bmDd/
	q3PRgf4c=; b=MLWwX0aoe45KjWtgosT0Bh3FA5aUtkifeFt3Xlb6/EpAVWiJcXS
	IVE/onzga8GZNQC8mYDtNdkuX/sGHPcGUjz/1Pg1NEnGdHtzEpR0/9qaWN9wGaVN
	WpvnOvbXUzuoPaWrmqe/mVbiUTXzYExyOHY/NkoXZp1QpUSZu4k/a/YzTOv5oCzb
	/DnU6yABVTmQFECY5eOieyF8arjvKVOlgmq5JAaB6cIpGxmLemIaupeUfNSlakRo
	D7mCEnUqnz68n3HfKLrJ4RxuhHbsu1sUFzCS8XdBxf5SI2BflLaLrO8z4a/AQUb/
	mH3KcKCBfJtbF6MT1NjZk575HeDWh0Z+sqQ==
X-ME-Sender: <xms:vsbPaaZavNrjohpUDTpU_BbjMzm4MEI8zLTp_HE2ZJV0dOne4m4F3w>
    <xme:vsbPaUZ92kO4Frxdiwz_Sfi6NFCzpxpX2p7Gq2UEp2PqBmUpDx-FIbl-PV_s7yOjU
    9ngNtxA5SusRWpdf6xiIl9nK6yI-xHFGnQvIUJhcu2VX-n2bw>
X-ME-Received: <xmr:vsbPaZ9IBs93dWSVw9_JqG6GNID8ik5F6fh524XTW8HpBfRx8piLCL_4WOZJ8r8MFiSsvrgR6wwYLCtDOPZf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeludduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleetfeev
    hfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdp
    rhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdroh
    hrghdprhgtphhtthhopehjghhrohhsshesshhushgvrdgtohhmpdhrtghpthhtoheprhho
    ghgvrhdrphgruhestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:vsbPabjTn3hKrHYtDU__CfVUPQucLew1ldEBpSj8m5NRPveEf8tPkQ>
    <xmx:vsbPaRerJV9HDC2cV6xIzSK7BN48MVENZyV_gs4-0T2vr2n0M_6X7w>
    <xmx:vsbPaarQilSyIOIJVJYP-bawRQywpT-4cQy4AuAE4Gb8eKU8aP4jxw>
    <xmx:vsbPaeCnNgeAS1lWalBvzMatiXG94d8V311o4MeWqj7LJm33Dmnbxg>
    <xmx:vsbPaXWS6Yg1AwVuQ46wZclsSUUU90ZaBgEVxpECHzRCwMf8cM1EFIpz>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 3 Apr 2026 15:55:07 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: Slow (higher scheduling latency?) system after S3 - regression
 4.17 -> 4.19 ?
Message-ID: <ac_Gu2lm4Jnoz7WN@mail-itl>
References: <aPzBO_eW8mQHM66u@mail-itl>
 <acQzzlXNDxNq885V@mail-itl>
 <29775afa-e17b-4c44-a2a8-4ef4bc7cdf0f@suse.com>
 <acUqOL232lp-Lw1v@mail-itl>
 <cbed767b-4ac4-4989-8778-43ff321ae977@suse.com>
 <acVWX8vkhZiFfonP@mail-itl>
 <88c65ec7-b7f7-4d8b-a453-d707440b43cb@suse.com>
 <acZ8ez4dmQay1JSw@mail-itl>
 <ac5l-HgbDRcVkiWb@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IAFUchFxljARC2be"
Content-Disposition: inline
In-Reply-To: <ac5l-HgbDRcVkiWb@mail-itl>
X-purgate-ID: tlsNG-ebf023/1775224512-3212551B-8CF3F5C1/0/0
X-purgate-type: clean
X-purgate-size: 1836
X-Spamd-Result: default: False [-1.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm2];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 98562394C42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--IAFUchFxljARC2be
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 3 Apr 2026 15:55:07 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: Slow (higher scheduling latency?) system after S3 - regression
 4.17 -> 4.19 ?

On Thu, Apr 02, 2026 at 03:02:15PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Fri, Mar 27, 2026 at 01:47:55PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Some further observation, this time regarding timers:
>=20
> In the meantime Roger suggested it might be about C-states. So, I just
> tried booting with max_cstate=3D0. I got this:

We had a design session on this issue, and managed to find (thanks Roger!)
that adding:

    tsc_mode=3D'always_emulate'

to the domU config fixes the issue. Now, the question is how to fix it
properly...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--IAFUchFxljARC2be
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnPxrsACgkQ24/THMrX
1yxMjQf+ISAAxXFtNjrTNrWA/GXqU1GQjp3JY1Rcze1mkNkMkDtKcd7C4f8A4ing
o5uwsZJhHAjOxHqt3RN0RoWw1gb5q70aOe50sBmtZ7+AEQI9LRHHh3Ug2v6v6PS2
7QFN7PrBG6Nh4Q34YzMZ5koZwoJDUJCghGprhR8L+tP/dIgSrMDPIlK0+JcVrXRm
U5uRHG4XYGrRvRSYt0xw8a3zkN2fz2F1KZ51oud9eBacDZeR4YeTrWP0zZAepxP2
qCTnGJiSmu6TJ24kcgb3k0wPxSR+wGDMSdT5DIFzKL77RRMZMtGhEdI47ocwTExh
ZLwXbVvdkB46Y1iKzqTHEKrcDjBaiw==
=wCLO
-----END PGP SIGNATURE-----

--IAFUchFxljARC2be--

