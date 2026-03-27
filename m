Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QP3DAzZjxmm+JAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 12:00:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3554A343026
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 12:00:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265395.1556349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w64uw-0005OZ-CH; Fri, 27 Mar 2026 10:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265395.1556349; Fri, 27 Mar 2026 10:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w64uw-0005Md-9k; Fri, 27 Mar 2026 10:59:54 +0000
Received: by outflank-mailman (input) for mailman id 1265395;
 Fri, 27 Mar 2026 10:59:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w64uu-0005MX-HM
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 10:59:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w64ut-00CvAN-TB
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 11:59:51 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69c66318-5cb7-0a2a0a5109dd-0a2a4502d7fa-34
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 11:59:51 +0100
Received: from [202.12.124.148] (helo=fout-b5-smtp.messagingengine.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69c66326-63bb-0a2a45020019-ca0c7c94921d-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 11:59:51 +0100
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
 by mailfout.stl.internal (Postfix) with ESMTP id 503F11D0024B;
 Fri, 27 Mar 2026 06:59:50 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-07.internal (MEProxy); Fri, 27 Mar 2026 06:59:50 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Mar 2026 06:59:48 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774609190;
	 x=1774695590; bh=FcdK16LBUGMAvFrGVeURP8c4G98XF6VCNzM+p4nvso0=; b=
	EYRFTQf+6+vZlAEerxBM/km04ijgUs2594+8j5BUghvzXWSreSpbeIAyL9bJpoTF
	l3AW3AnSnISrvrPCPTjTERKE6LSoUUNq8bAeWtPi0DEST3Se1JoRe/CqIGBsjfpw
	u6MiZzORDpiff8V558Zb75nKv/Cg6ResIIxp9GyOu2AGtf2hqYiLKiYenZBvYo3V
	+k4MIbMjWe3xVoemr4/EiVYSpvb8T9R4/yvLSHvy22VrKFGKxfx+WhC3kycpEMuM
	W1rtj/tTRBeqXA+ztVstcSt7NIU6qaF118gQqEzerKZ/As4gACckhrjhjF1n8pKd
	uiLsX25uQlxXQrsy1MHM6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774609190; x=1774695590; bh=FcdK16LBUGMAvFrGVeURP8c4G98XF6VCNzM
	+p4nvso0=; b=WdF6XvMmSb7Qql0yPT1KQpFMVSzKBrXRumRklCs6+AyEJLV+xEE
	iew/mTrVEsErVoTYZrQggUBhYWrth2Abu/TS2F1Snej/iEnbvHG9fjQaB5zxTRzw
	bZrvQFkHhAueXtanxHRkint61uvHGRTZSaiJkHanrtGv0QM1aqXv/tA0e0on9BO/
	g91ayXIvNbCWd5n1pOO8OQugRt1xeFAyOV+o4KQ+4Rbn9W3CyAL63U/aPzzqUutk
	Kdkoeaa97SB5gusQnGIvrxX/IstThkLnAD//prLzo1IyXyPKIuQ0Kc9sTiVRwoL3
	rB/lGVD5i+7I4SjygnizejQcNCVrPloFrOg==
X-ME-Sender: <xms:JWPGabfmjm7tdl8nelG8Gmh7IMpd0I8I_I8M2uPGLvubj_8Jr264wQ>
    <xme:JWPGaYqdpoqiaPwJ0BLBk6RCVLMtkdTSIlkMfn9E_RRjOThOffGI4BTebPkxN25II
    -laKAri07RrwLJsMkXKc4HjRUE9glHly2e8JHxtszdLSvBo9A>
X-ME-Received: <xmr:JWPGaR4YMdaj8RQtFGz2wZDMWBzn__eTqwptVYVog_ZQjWqNyfYSSdrZUg1njjnBGQIDOX3NUuwDN0EMrvsfG5voCYkgax5DJQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffedtuddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepffeigfdv
    ledvffetheeigeeuhfekjedtudfhtdfgtdeftdfguddvteetueelvdffnecuffhomhgrih
    hnpehgihhtlhgrsgdrtghomhdpvddurdhishenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthh
    hinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehtvgguugihrdgrshhtihgvsehvrghtvghsrdhtvggthhdprhgtph
    htthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdp
    rhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhm
X-ME-Proxy: <xmx:JWPGaWq8BHcVoOvIJETtqxsy755EgktULTo-hJwHIxKwDdwQiuHOpw>
    <xmx:JWPGabjwZPaycxCIFanNeb1gszk2deV4CjUatUHMjyDesSztjffOng>
    <xmx:JWPGaYJPcR2NwXWq1mm09V3pQNieUy-RIHiUHEoAIvwLglb8PJRV7A>
    <xmx:JWPGaTCwWMxImlPefsu49v-4B-rqqjqdqwkeydZh4YJ4jLNqwO112g>
    <xmx:JmPGabEcWTk1P5gyIGvbtQnAf96qypaTpXtZHtX6Z-Tyn-t3jXCAGR7d>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 27 Mar 2026 11:59:47 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: IOMMU faults after S3
Message-ID: <acZjI-9keWFyTQ4I@mail-itl>
References: <acZZmGXIJlmN3KGm@mail-itl>
 <dc88adaf-401d-4585-b310-7647220a3739@vates.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1yxRQQcmYgEP4lfK"
Content-Disposition: inline
In-Reply-To: <dc88adaf-401d-4585-b310-7647220a3739@vates.tech>
X-purgate-ID: tlsNG-720697/1774609191-BF48FDB8-0FDFDC83/0/0
X-purgate-type: clean
X-purgate-size: 2419
X-Spamd-Result: default: False [-2.23 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:dkim];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 3554A343026
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--1yxRQQcmYgEP4lfK
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Mar 2026 11:59:47 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: IOMMU faults after S3

On Fri, Mar 27, 2026 at 10:56:43AM +0000, Teddy Astie wrote:
> Le 27/03/2026 =C3=A0 11:19, Marek Marczykowski-G=C3=B3recki a =C3=A9crit=
=C2=A0:
> > Hi,
> >
> > I noticed that on some systems, there are a lot of IOMMU faults after
> > S3. I can see it also on a laptop with MTL, but it affects also the ADL
> > gitlab runner:
> >
> >      https://gitlab.com/xen-project/hardware/xen/-/jobs/13661033722
> >      (XEN) [   37.201160] [VT-D]DMAR:[DMA Write] Request device [0000:0=
0:1e.6] fault addr 0
> >      (XEN) [   37.201164] [VT-D]DMAR: reason 02 - Present bit in contex=
t entry is clear
> >      (XEN) [   37.202332] [VT-D]DMAR:[DMA Write] Request device [0000:0=
0:1e.6] fault addr 0
> >      (XEN) [   37.202339] [VT-D]DMAR: reason 02 - Present bit in contex=
t entry is clear
> >
> > Interestingly, the 0000:00:1e.6 device is not even listed by lspci.
> >
> > The issue is present only on staging, not staging-4.21.
> >
>=20
> Is there a 1e.0 device ? That could be a "phantom" PCI device.

On ADL - no, there is 1c.2, and then 1f.0.
But on that MTL, yes:
00:1e.0 Communication controller [0780]: Intel Corporation Meteor Lake-P Se=
rial IO UART Controller #0 [8086:7e25] (rev 20)

(I wish there would be a connector populated on the board...)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--1yxRQQcmYgEP4lfK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnGYyMACgkQ24/THMrX
1ywiYwf+IvMuS4HDusawLlbhHZozr8a0BCYDH01PyqI0mhAt1MBjPCO2SpVN9fC8
ObY8r+rm3/1AKQWdFNVHrPBy92PUqkQh0zm9vzKY+YWwuxgKAuYgE4IlFn2okFhm
xHU2d9bQpxPvbIOVUGJe3eJteUSgouAz8MDbatahWhd9D55VVgnl6WwsWaDjglDQ
8jlfKpH1VwfdkxGBPEY4daYMUx6kdfksDgZ2bak66OL79icem0oTzZiRS5rkadUT
PWR8Hhj1kfs5fojFiZVxuNtoAfbCPIO3mEJtaksPAE/YzDUX+OGjSADANpED6IKX
lAj2IzWbnGiHct4iC/krswKCUhoHcA==
=SA29
-----END PGP SIGNATURE-----

--1yxRQQcmYgEP4lfK--

