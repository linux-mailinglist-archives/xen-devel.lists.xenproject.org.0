Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOd6J+q4HWrKdAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 18:52:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA61A622D62
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 18:52:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324003.1589672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU5rr-000387-HE; Mon, 01 Jun 2026 16:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324003.1589672; Mon, 01 Jun 2026 16:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU5rr-00036c-EL; Mon, 01 Jun 2026 16:51:59 +0000
Received: by outflank-mailman (input) for mailman id 1324003;
 Mon, 01 Jun 2026 16:51:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wU5rp-00036W-MD
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 16:51:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU5ro-007rbR-J9
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 18:51:56 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a1db8a1-2eae-0a2a0a5409dd-0a2a4502d39c-8
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 18:51:56 +0200
Received: from [202.12.124.149] (helo=fout-b6-smtp.messagingengine.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a1db8aa-af86-0a2a45020019-ca0c7c95ba89-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 18:51:55 +0200
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.stl.internal (Postfix) with ESMTP id 252051D0004D;
 Mon,  1 Jun 2026 12:51:54 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Mon, 01 Jun 2026 12:51:54 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Jun 2026 12:51:51 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm3 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm1 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780332713;
	 x=1780419113; bh=Bp+9MOScam9lOoXhydIkVSIh4E4kHXVGuRysJxb9gAQ=; b=
	ROfkr8u6TADcVQiKvPEpzJs3z9VPhb+pCrDSz0MEwQH0qB7BKz+c8+94KsGKeue6
	wX4OJWaK4SPr+S6PD4+2CrHpbyEIBEhVPCPBz7z+MsJncp5mgj6o0X+5oycw8/6d
	ftCty3uNKuBG95f7xruSc3IH9GRYaA4ZT2nlOSeNzu8eRGYmt5RCNX+YRboMoWmy
	UvVk3XhJYvuqNfOVttO71ja2fYZjpUFEQNREr9QFrba9e4fvvg3yAG5l52RVh9lM
	QTTVN362dYzw23kE8Yqa9FqbrVb4Qc6LIGoBmu9bUqQ2U8DxyYgWafKtAkIwXcvd
	MBhEk4IMHi2D5h6F4oFZ8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780332713; x=1780419113; bh=Bp+9MOScam9lOoXhydIkVSIh4E4kHXVGuRy
	sJxb9gAQ=; b=OLuUmepe+aT6caXlbf9r4gYaySQwsNL6OliLfpj5MfKHFQbqEdZ
	hRlZAESfjPgVadMwCvxY4taW8pb18z3LtUtmmnmHpV3VNi2d+dFUCdV65CILb1Dy
	6Talb7cBrdmOqzFeeEUqIW4HA8P/Tt9EB//PemWz+iEZm8eqvLSRczeOPCrhYnUJ
	m7HLcwsgwRy/ulLSdEoPVWuingR3edNb28u0Jjwv7AvbvhYpSiw/FOyWTK+/Y5t2
	oIhwYAIFFx/JWamcFu3p+HyeCcDUZneicPrpsLGD4qppR8SSwsEb+TIIfJ/7lvOe
	J/rCmkZrNO9qHv6R0jRc6DE4YtssgC6NZDw==
X-ME-Sender: <xms:qbgdanbXP1KSU-l4-R3zSRMrRleIfpUI4VDwxCXT-iB6Q8L5oLOVCw>
    <xme:qbgdatSnt3Bg2vR6THoPM76XNC-oy7UgjqmemWYUvdR-Z1-dVdqhzYpyuWTGNoPyb
    0X8xihviR4ZHh4aJp4V53S1KB39_CJwdGpw4z-HxBvLiKFt>
X-ME-Received: <xmr:qbgdaiSAfTHIfKV4T6AUBKSsDenK1k9GGcBZmMlb61CURD__Q1Rwk9AflV8v>
X-ME-Proxy-Cause: dmFkZTF8ZORvIiqa2GF3r95fxIL7C9UupxJFMVBEs9eVzH/hTahm4J2V0yTCVYD8gOmUnr
    moaZUNsyrJ+Z+Q0dNXg4qoxRe2qHURR6GPUqA3IZ/WpPNrf67x+nmXAEwRyTi7jhpgeOKi
    EbNA4neG9ciWp9hOtu9xXMBQgIhe24QPbCLVG0N6dJZYREDQ0Ea/KlbhGfa/ZCUgVBZrva
    vwZwerOoAqwSo78d4QDtUAQdOJsegnDQq3jaKWDRK6j+zeJE/q670nZCGyvRAkmpNa+kiC
    H+kHUqPW3iP/AJ9wfgEeWamYqTGbSEJ6IcsaiWvEnZN8XfcnasriTC1xIVoJ4rn3Yg4IK1
    SGFmz22jyvktI/gjDvMQwCZHlzgBmU+6zuHuaYTG2qb20GoTGxVPQbajTDhBce7rlo78qh
    DhQWye7mWxhSwDVxdExD/xKF3SwIwXX6ofeD+cYVaWm1Hq22QMddjuYyYuht3B6RbuMbhk
    nthBfbqivTmpYLTeTn7KH6gUY0GwtNDCo+MwNU7kWdq5CjuSKHxaQQDj3I/atjM7Y83Jec
    hneoTv4/Mmd0TB2wqFkkl0kb+tJjCb8r3bw0gBr583lYQRCQWVQIjr+2gju7Vg/GXmpdRf
    WejGRtFGHALvC6dymKsTq43aMrQ9R2HXhy8nXmzqwLaQd0/y8eL8ImvkiBRQ
X-ME-Proxy: <xmx:qbgdapQRYbJP8scUtAaOMZVZe86MqeoC6Mau_MUGgcJcBiN9oXvdhA>
    <xmx:qbgdav4wpeqk9krgF9cjNnG3xxDX09dUIGd37JXUxurRTY3m3c5oWw>
    <xmx:qbgdat1pfsTpUCZf7fkVuC_MBqsyIPn0SoW4pqhz5nBu_NDltXzflg>
    <xmx:qbgdaiDp5NDCMX040B_EZcF4-06UCEhv_dcVbjPfNuTnYy6GBaVdAw>
    <xmx:qbgdasYWswfVcWey13q_POlySTSrYiViRTAbUvFE1g5gaZFfjsTq53Rw>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 1 Jun 2026 18:51:49 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v4 13/13] Setup ssh access to test systems
Message-ID: <ah24pfWb_orPRaJG@mail-itl>
References: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
 <13f837cd9f394d3b4eddb4849156b8ed5d06d31b.1777898148.git-series.marmarek@invisiblethingslab.com>
 <1779458083.8631fc262581453bbf619ec5b2062170.19e4ff78945000f373@vates.tech>
 <alpine.DEB.2.22.394.2605261201180.182011@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JyKwHnCynqH97rP0"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2605261201180.182011@ubuntu-linux-20-04-desktop>
X-purgate-ID: tlsNG-720697/1780332716-8117D161-D5057401/0/0
X-purgate-type: clean
X-purgate-size: 2276
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: DA61A622D62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--JyKwHnCynqH97rP0
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 1 Jun 2026 18:51:49 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v4 13/13] Setup ssh access to test systems

On Tue, May 26, 2026 at 12:02:23PM -0700, Stefano Stabellini wrote:
> On Fri, 22 May 2026, Anthony PERARD wrote:
> > On Mon, May 04, 2026 at 02:35:52PM +0200, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > For this add also bridge package, so xenbr0 can be configured with
> > > /etc/network/interfaces.
> > > This allows extracting more logs out of the test system.
> > >=20
> > > Create empty /etc/network/interfaces, so the 'networking' service sta=
rts
> > > cleanly even if no interfaces are configured this way. This is
> > > necessary, as dropbear service depends on networking.
> > >=20
> > > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethi=
ngslab.com>
> >=20
> > Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
>=20
> Since Anthony has reviewed the entire series, on the whole series:
>=20
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks.

I seem to have forgotten the "test-artifacts" subject tag (adding now).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--JyKwHnCynqH97rP0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmoduKUACgkQ24/THMrX
1yzSzAf/cl2bQdr4zpb2k0MhiPhGWceR70SBbSuG4jRy9QOo5T5nvj0cjn0BK/Lw
W/brm9G0INq47RZ3VbPnhQ6Rla4VMoaKFRcpZ8XY5K5CPUfgywXTAW/ziiwcOTG3
LRyAErfktwyesTGFand9TIHuoOBRYRYIHZ50xA7/gv70hmGo+7Zoqjf9FzkJH6SF
L8Z0mC0BvpWQaJvAk4OvSc0YtWFJM2LyJ55/xMuyUA3vwHxdaAILf97y4bIe9Ll4
VpQGQmj/FAgh5Ej9uzDsaFua2Atyp3BPkZ7eh2OaiIcbIa7/VbhNF1NWN/78DI9R
K1DlnTUaA6jl2kE4y6ievNZ1w6ajjQ==
=6kMR
-----END PGP SIGNATURE-----

--JyKwHnCynqH97rP0--

