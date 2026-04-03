Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMbHDEMw0Gke4gYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Apr 2026 23:25:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0C43986B5
	for <lists+xen-devel@lfdr.de>; Fri, 03 Apr 2026 23:25:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1273326.1560207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8m01-0003nE-8s; Fri, 03 Apr 2026 21:24:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1273326.1560207; Fri, 03 Apr 2026 21:24:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8m01-0003lI-5j; Fri, 03 Apr 2026 21:24:17 +0000
Received: by outflank-mailman (input) for mailman id 1273326;
 Fri, 03 Apr 2026 21:24:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w8lzz-0003lA-RL
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2026 21:24:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8lzy-006Als-Ua
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2026 23:24:15 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d02fb5-bab6-0a2a0a5309dd-0a2a4507e826-30
 for <xen-devel@lists.xenproject.org>; Fri, 03 Apr 2026 23:24:14 +0200
Received: from [202.12.124.154] (helo=fhigh-b3-smtp.messagingengine.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d02ffc-ba2d-0a2a45070019-ca0c7c9a97bf-3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Apr 2026 23:24:13 +0200
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 3151F7A01CB;
 Fri,  3 Apr 2026 17:24:12 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Fri, 03 Apr 2026 17:24:12 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Apr 2026 17:24:09 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775251451;
	 x=1775337851; bh=wJDhh1aYQ1l4wE/5x0P8ZIQHMCjj0qGX6ZaMgUpSYDs=; b=
	aAt3L47A9yhTQN+76uDqU6NmR6i1x68uMDpeEEV2ENc92vb/nKT/P50ht5Rh7yNH
	zlrAdkk0T9LEJUl2LGaiShm6nrWTQ63f/clxqaXyuUcpcDlT5jSyhvzwX0wJMOwF
	rChvsk0D5T+utpa8GcCE8TKjJ0i4qk9Fl+7jDnjIfM64oQN2MwSD1A/AgYy2DPYN
	qOsh/clXlm1OTfS58WOpqOqCyuckuTmtwrZSCuuc5DWvgAjX2uL2t+K+Wjgh9W3o
	uAstcaF5f0WuACIFuBBRkbiuqe1pbfGqB4NMox9L6llq8Fk6iAuBfohxPQATImp2
	77GrkYqP8XoJ9mibPRegAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775251451; x=1775337851; bh=wJDhh1aYQ1l4wE/5x0P8ZIQHMCjj0qGX6Za
	MgUpSYDs=; b=kXAxLxfti1IaQGTj5DE1eTHOVU3fz2e6HtUfswfA34t2NmT3GYy
	T0ANeA6MPaa7PwVpoMzWJ56wliT+IA004jOEyDytWbpJT3Asvk+ziuyuQy348QBJ
	UC3wzuSvg7PGMPWJPSgScb2oKO170l40zL7u5pPCZONCbWYfAiZlXB3c6t8BApIQ
	wPzPnwVlWFKBeNGVPgtLtHQlBykAbU7xbio1Cpu5FXOXnjrZgv4VY7FgOo6ToIaN
	FDfCTJb+MjFUkXXDKltkUPo21EhsCAw5KAV6e4lV+EpfXWCYZIv1pVDLOPrbi+kj
	ic8ZODfHppRaqjhSSnlaw/e68ivExmWTbwg==
X-ME-Sender: <xms:-y_QaRr1XTAQ9LyrLFOTPLlOumIgLtbXY3IN9h-aKuVs7xuuiFzniw>
    <xme:-y_QaUUm3hDRjGEgKKc4_OY_USIx7Ot-s3oZvcSuPSaQEQOAqZe2qSXhZ9aPDXWVL
    43z0grLVYPrs36reD07Zfpl1j3ZPGmgtb7UCaYPc_A0n9rmBA>
X-ME-Received: <xmr:-y_QacYdSSqSmKaieuB8VmUHk4MphOc0deUQEqblCeedqzy4HW2bcMn21A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeejpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehtvgguugihrdgrshhtihgvsehvrghtvghs
    rdhtvggthhdprhgtphhtthhopehvrghlsehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomhdprhgtphhtthhopeguvghmihhosggvnhhouhhrsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorh
    hgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthho
    phdrohhrghdprhgtphhtthhopehlihhnuhigqdhmmheskhhvrggtkhdrohhrghdprhgtph
    htthhopegrrhhirggunhgvsegrrhhirggunhgvrdhsphgrtggv
X-ME-Proxy: <xmx:-y_QaRfxtirIBioAWRbktAN6gJkuRnR1Ev5RQjHr2vJoizemSi6lTg>
    <xmx:-y_QaW2sjTPblbnJqzQf3RHHa_I6V-7ksolTPLy5osm8Q8GnAQdDgg>
    <xmx:-y_QaYJTIUWPC-0nxvANtutqJl3H2VayrOkd-Hz_jzPH6aNL2eLSZw>
    <xmx:-y_QaVEYnKui8E_TxwxLNAFiA4fij7N4ZS6lWjiBy3_wCrh8LoWPeA>
    <xmx:-y_QadRujxaY6YfeywYpy0HDzSrdZ0nAizMKR0kLY1kncJmTVSVzuRq->
Feedback-ID: i1568416f:Fastmail
Date: Fri, 3 Apr 2026 23:24:07 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Val Packett <val@invisiblethingslab.com>,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	Ariadne Conill <ariadne@ariadne.space>
Subject: Re: Why memory lending is needed for GPU acceleration
Message-ID: <adAv-HfiyKptEVvq@mail-itl>
References: <84462c4b-7813-4ad1-aeb2-862ae4f3a627@gmail.com>
 <c38387fe-beef-4f50-b928-74f96b881b7a@gmail.com>
 <0bbf0349-1006-485f-a2db-6c8b795b4242@invisiblethingslab.com>
 <1de15ce0-9f7e-4253-80a7-ecd94caa4325@vates.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4Ae0y7aT9vuqArIi"
Content-Disposition: inline
In-Reply-To: <1de15ce0-9f7e-4253-80a7-ecd94caa4325@vates.tech>
X-purgate-ID: tlsNG-ef75cf/1775251454-8975241E-EA13BEEB/0/0
X-purgate-type: clean
X-purgate-size: 1920
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,invisiblethingslab.com:dkim];
	FREEMAIL_CC(0.00)[invisiblethingslab.com,gmail.com,lists.xenproject.org,lists.freedesktop.org,kvack.org,ariadne.space];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:val@invisiblethingslab.com,m:demiobenour@gmail.com,m:xen-devel@lists.xenproject.org,m:dri-devel@lists.freedesktop.org,m:linux-mm@kvack.org,m:ariadne@ariadne.space,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 8B0C43986B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--4Ae0y7aT9vuqArIi
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 3 Apr 2026 23:24:07 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Val Packett <val@invisiblethingslab.com>,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	Ariadne Conill <ariadne@ariadne.space>
Subject: Re: Why memory lending is needed for GPU acceleration

On Tue, Mar 31, 2026 at 09:42:22AM +0000, Teddy Astie wrote:
> XEN_GNTDEV_DMABUF has been designed for GPU use-cases, and more
> precisely for paravirtualizing a display. The only issue I would have
> with it is that grants are not scalable for GPU 3D use cases (with
> hundreds of MB to share).

FWIW we do use grants for graphics buffers already - window composition
buffers specifically. We do run xen with extra options for that:
gnttab_max_frames=3D2048 gnttab_max_maptrack_frames=3D4096
And similarly, on domU side:
echo 1073741824 > /sys/module/xen_gntalloc/parameters/limit

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--4Ae0y7aT9vuqArIi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnQL/gACgkQ24/THMrX
1yxbGQf+OgsupCAnm7yeXU50i8UAUbaCxLl6LTgomVWE8BqqFLLzbd1uZRBaxgwi
08KM6UwaNDnWYrJjTzzuVajjgvb364NRxaCcDQMU1gg9QaScwe0rvqNXjTCyyZIZ
KcGYITuyNobu6TEOlxjMZCYe09hjh5Tv6YIAjNytG/v4Wj0BeLd6dpU3y/K79rsz
k5Q2KuSQNJBm0DrX1xHtYDI34Ecs8kMi+QNmTxBNirLjkzswlCpewSvOONNsy8Ff
8k+hGeZuhbRQMidzb/toBQpk5p82359YvtUwGWz6rn/YnryTk6+3x3Vr1octMvgz
5SPKxfVNDvikjgpYpZpWowiX1sDLHw==
=Aya7
-----END PGP SIGNATURE-----

--4Ae0y7aT9vuqArIi--

