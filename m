Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IFMM1Y71WlY3AcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 19:13:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC833B23D4
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 19:13:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275244.1561158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA9zI-0006v8-7S; Tue, 07 Apr 2026 17:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275244.1561158; Tue, 07 Apr 2026 17:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA9zI-0006sg-4Q; Tue, 07 Apr 2026 17:13:16 +0000
Received: by outflank-mailman (input) for mailman id 1275244;
 Tue, 07 Apr 2026 17:13:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wA9zG-0006sa-Rz
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 17:13:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA9zG-003FRP-4G
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 19:13:14 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d53b0b-bab6-0a2a0a5309dd-0a2a45029b4e-32
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 19:13:14 +0200
Received: from [103.168.172.158] (helo=fhigh-a7-smtp.messagingengine.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d53b28-42fa-0a2a45020019-67a8ac9ecdc9-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 19:13:13 +0200
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 82FC114000F2;
 Tue,  7 Apr 2026 13:13:12 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Tue, 07 Apr 2026 13:13:12 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Apr 2026 13:13:11 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1775581992;
	 x=1775668392; bh=58Z2TUT11hf01tYwYOhIlXRYqnsG5VKeoOJMQ+AknOY=; b=
	qyTrZqR/IXzwMBLZVIkP/EOaCuIGG2vztOZY6YzTsI4kYYV0eiowIgEqrqZk0XI9
	AJGTzFfjuGAYj9rk0UCaW5Q49mrD3q1AUhA+VA4VOZDrcEiNb8jhFodi/ZPTEBKY
	ygpxeuTAAyMyPYV3tPOCZlQqKNblojCEFJNuE1QxWtWtT1ctYOB3GuxR48R1B2S4
	wCwo4eo6obUfWKxCuFYPIJQB2Vp1LMhpDEGT500OUck4dwvja42nWzBPPtmePEiW
	G4HR5kfv7ciyYu2f0R+RDbFJ1jm/HUPppCbAtx4cNxUatIfccDH5ONCpsL8wxmf4
	QSO4yoRI8lKH+GXl+3VddQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775581992; x=1775668392; bh=58Z2TUT11hf01tYwYOhIlXRYqnsG5VKeoOJ
	MQ+AknOY=; b=uYmUpXgs/u8bUee7W/9r5S3tg2gs0mtkqYw2jeWctiwylDUX5dU
	h55V13mTbBwyY+G/e3ikNv9zDZDr32c6XrZLjsBCTlgjViG2Qpcnjqfwb0g+lI88
	bJiIV7YD5LAUjgnv0jCyzN/m60yQEoppCLaq/M7srdFufqpSGIZw9Z2CLTlJ6Yjf
	SMK6mIBPPK6E8FaY4kUvT4SJ3Rd2WLof0RArOa1vNe+jeD7MSBuBziOwRH7v9g16
	NZXXQhWyeqcKl8S3BfUqgMqnIPSHTIgLjg71XS3EAZuUza3rXdVGI42uZCLd1o/a
	TIMfKAYOsYgrjT+78SFPkLxUsd9OIl3QvNg==
X-ME-Sender: <xms:KDvVadZtPMc4LN6eXgBJldzFt0oN11CThdT05uGq2KNC8mqkj3gavw>
    <xme:KDvVaaanRM0UW7YMckORHJdtdPYMi1hV8A862qpbuFPlqgIUOchXqDdJtsM63ffy_
    aQDpSiRnor4PGHWxCIhbzgMg7xNmUaUk1sF-lCiqnJLGJEjbw>
X-ME-Received: <xmr:KDvVadl7K8o7K_KCHqkxgl-e0nC8bp9ApjWQyn5luj8iasBSDP3WXxxtyJIvi3ni9KCor7YO9fmGn5dw2WDWpLL5klSGnQhSp7k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvuddvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuuh
    hsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpeffhffvvefukfhfgggtuggjsehg
    tderredttdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrh
    gvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgt
    ohhmqeenucggtffrrghtthgvrhhnpeefgeefheeiheduuefhtedvheeffeeuhfelieevte
    euhfdvudfgteetteekleekgfenucffohhmrghinhepghhoohhglhgvrdgtohhmnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvg
    hksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohep
    vddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghougihrdiiuhhstghhlhgrgh
    esgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhi
    shhtshdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:KDvVaWz6rqdFuUuhyJWPD3EwtuR_Gqnvo2GKAjJVpftYsR5QG3TyGw>
    <xmx:KDvVabMl1Aci32V9B4fJqi_7PXO_Ruwsswt4eQONft_sfNe1PyhtYw>
    <xmx:KDvVaaTKzodLEZqnSg0p3flV7wQ2FKqzd_YMxPb1oVALgApV78ruhQ>
    <xmx:KDvVaZZS4H8XFq9ffnIpJ9MzN6MwJkVwbBVuBlL92_F68cR2MLLzFw>
    <xmx:KDvVacm2b-cJS4LqKD4uSuo48P6LIoSwdeIoOc37v45GDdHRMNkYNzgv>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 7 Apr 2026 19:13:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Cody Zuschlag <cody.zuschlag@xenproject.org>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [ANNOUNCE] Call for agenda items for April 9 Xen Community Call
 @ 15:00 UTC
Message-ID: <adU7J3fFYtZTexKp@mail-itl>
References: <CAJbE=KyqAjLWvjkfuxsCgM-xX8+HcYUdJwf-gfTKZUtGE50wSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Xmja7yza/4PH/AGb"
Content-Disposition: inline
In-Reply-To: <CAJbE=KyqAjLWvjkfuxsCgM-xX8+HcYUdJwf-gfTKZUtGE50wSw@mail.gmail.com>
X-purgate-ID: tlsNG-720697/1775581994-46D20CD1-497B3F5A/0/0
X-purgate-type: clean
X-purgate-size: 1473
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm2];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:cody.zuschlag@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: EBC833B23D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--Xmja7yza/4PH/AGb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 7 Apr 2026 19:13:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Cody Zuschlag <cody.zuschlag@xenproject.org>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [ANNOUNCE] Call for agenda items for April 9 Xen Community Call
 @ 15:00 UTC

On Mon, Apr 06, 2026 at 11:06:32AM +0200, Cody Zuschlag wrote:
> *Preparation:  *Please take a moment to review and update the agenda ahead
> of the call:
> =F0=9F=91=89 Agenda
> <https://docs.google.com/document/d/1kJmtG6RzNDzqgvLuOZK4JYrriFApdcpl69KH=
JWEPDKE/edit?usp=3Dsharing>

Agenda on google docs this time?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Xmja7yza/4PH/AGb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnVOyYACgkQ24/THMrX
1yxszQf+IYbTprONyaBHM0xdCs+8EeP7YSSPWHnX0e805PzqPs5uxnOkdxQG3FOo
EDM0qCg/natm1dUTftum6aWsIsWSnhwNF6wzV5+xPIrawc9UruCjQJ1DUxMD1xrm
9gbh0F204lT+ORf4SgZE7XwZId3QeSbMWMBKstsRcxJauhQEnpCeCEoKp2vIlCqg
XZTCeTAsI5wxAdY1NdS5kDpAX1uR+aQ+2Z4EFiv/UJMPgm2Vxgd5xewsQKteHnxv
ynKEDnML6J7D3KfsGRADUbueJ5a9WRmfzZPSOkfcPm+ekjUVF9mbyG/JLyhf6Jv6
g1pQpIRTlDePDpxCmTHalc9OcNgd7g==
=eZDJ
-----END PGP SIGNATURE-----

--Xmja7yza/4PH/AGb--

