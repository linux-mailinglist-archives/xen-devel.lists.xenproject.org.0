Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aiq0GNv0UGov9AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 15:34:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA10673B4AF
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 15:34:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm2 header.b=wzGEfElT;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b=fiL8zwjH;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1359363.1612960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiBMk-0000aH-Mm; Fri, 10 Jul 2026 13:34:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359363.1612960; Fri, 10 Jul 2026 13:34:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiBMk-0000YY-Jt; Fri, 10 Jul 2026 13:34:06 +0000
Received: by outflank-mailman (input) for mailman id 1359363;
 Fri, 10 Jul 2026 13:34:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wiBMj-0000YR-H8
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 13:34:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiBMi-00HC4d-QV
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 15:34:04 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a50f4c0-bab6-0a2a0a5309dd-0a2a4501e7cc-32
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 15:34:04 +0200
Received: from [202.12.124.148] (helo=fout-b5-smtp.messagingengine.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a50f4c9-3ea4-0a2a45010019-ca0c7c949c93-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 15:34:02 +0200
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
 by mailfout.stl.internal (Postfix) with ESMTP id C7A041D000C7;
 Fri, 10 Jul 2026 09:34:00 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-07.internal (MEProxy); Fri, 10 Jul 2026 09:34:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jul 2026 09:33:59 -0400 (EDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1783690440;
	 x=1783776840; bh=WNEdT0A5/CwwUb8sMwObid+3XSCHfreBzBAdf2qsSSo=; b=
	wzGEfElToaTqzzb/7HuWicxaDBBs6yvIksN/ag/S15upGsAPun8kTlGdWIhVXJsY
	ALiTEMJGNsB39vNAQOWfmuYeQRjzPGpnbebdV21Fz9kqS5EJYZQE9DJ9bjlmiHxD
	OrCYDleWPvp9jvzNksTKd4lXrbGhtpgtyA03MYfPtZGHdrSEzM8MM0WlCG1TYytD
	NUuBUzN6ay8YMh3Csh5ttgCGMtJYIFBZKiakT1h27ejhsw+dd4/lZjmzFvXs8MZQ
	saAU7dZLeDBij0FEMGt6AGK2B0f+U98N1EEJ4XnRWHtdtA42B5aKGZlHTlqBSoyS
	WrGaOEhYcrpHWHrhYLCi2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1783690440; x=1783776840; bh=WNEdT0A5/CwwUb8sMwObid+3XSCHfreBzBA
	df2qsSSo=; b=fiL8zwjHEKcXOqTNHj8qpFXoCQ7xTW0eG6SKrrXdY4FVHIVV6N1
	ce5HTfqBCnAV6QHkfmQPhzpzG27c8/+slnHtf252nThrrRLHiTLRF07QLgKsH8WD
	liDVdFtclTFt7C1Qlj+pV6u/lavvlmCAiBFHI12eikCE5UaGX8r0uMoog1VPHx25
	Tgf9biO6Xru2MRrt9Vua65K5zuixFlOgbMV32mnjDiVqlCxNZxAL+x30ssHS0p2G
	YDRO35gu7nyVxJNEm1R8Bj7RAI9hVFmYs1Xh5MGIgV029kVd2rOodaqrYnNiV4EA
	v4tIuiljR4EfYO/vYpv5M4Dv939E9gO7uOA==
X-ME-Sender: <xms:yPRQariSOdrRPuc2UB-mPqZSBg0R4YXLXpCtrc7Q4TqmVgs5AhEkmA>
    <xme:yPRQavCII9lGveoCYwWC7ZQPV9oPrUoFEo70fdPksYXgGXo9TTRYbNkicuosHmXpu
    OQLsrb3YxQVcNkdHeVGYQytgvvJ7bbxYGYlIOXXjaVqOi-->
X-ME-Received: <xmr:yPRQagH8UiwXR6hZxqRzukOu3IRKDt_yPUrcYFWt3fEeTjq-MttxIs7T>
X-ME-Proxy-Cause: dmFkZTFRycsGBbspFF43fjYYheeSlT2FndDz3PXMp9VHfMYlhbcGTzwFLExke2dSHETxgC
    gD+IDo2elx8WImETJmVG8BFGJAXQRCy027g8tm82ppm7gMA1D8zdFK/hu9bwb/JF8Vxd2r
    ykwm55dn7In8fI14dsAh3VfeMQB29sTIzcND5dVuv57+Lu67Eq6MLLJf7tff+JMpaCFjoR
    NBxJzRCKr3DDWAiv8PaXbzp0ZLbeKgG2wh4JUawAGPDTd3O7ZPq+nvX0eGfkiRURTfIlWX
    RlrooBzdRjyD/I8OISlz4WpvBgghoXdAawtg0CKSy9Ss6UGg0ZNgdCUCquk6QSouF5+1Rm
    YfNoEfe9A6NpgOl5viunO5pbbfY0nYUyYFjEfyoPPl5U2ytNKV8bBrPG2+/hqV1Sh9K5sJ
    BFeIFTZmRk1TYyMztk9mgvOP4bUdr8W+LO4nDS2OOIOu+aA0wOlJ0OrMfenHTfHUar/Bzq
    SVk+x/rhsI4La8DdbRgu2iPqBCcU6t8LzgDDmX9USGHH6/MKqghW74RuemVDdHuUmCXe6B
    NGx58urf/c1VGJZY/4aBQrCMX1irF9jMI5CAc965CBir79j2Xo2TpsVfUkGdRQuWSELVDG
    PLixCGQC5BavljOgxUIgDC+ixRBfJZDXxrvZSifHuPAiYqufSKe6mEhv2GBg
X-ME-Proxy: <xmx:yPRQanJAynU99plr0ZSQIzuHLRVFV2Wo1Roabr9iRmJBlB0d1avd5Q>
    <xmx:yPRQakkSXc9Nv604XTKXG01DYCTK7mxkSwxGFym1c9MbIYUe1vJsCA>
    <xmx:yPRQavSs8GC0HD6R6W-yThDsItDTOSi3MwB4svNxx9d7Go1m1Cc9uw>
    <xmx:yPRQamLvtxI4l5Q1fgjhAF2bDJaoZFxjCwZVct9O6lJX4xkvZKSbtw>
    <xmx:yPRQapt4MmHkAX8vft7gMKxo5DADnrhIP3tuyi0DYIGMveyHbQKgEXhN>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 10 Jul 2026 15:33:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 1/2] CI: add PTL runner
Message-ID: <alD0xApLcDH0eni4@mail-itl>
References: <cover.2e3d53e8679d3686e3f6579df0c7acb781c92701.1783626895.git-series.marmarek@invisiblethingslab.com>
 <3a541b59a711fbf8d9ec3d262cfeeacd2db25113.1783626895.git-series.marmarek@invisiblethingslab.com>
 <5850cce1-e36d-4c84-8e40-80a7c8771585@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LkqlGqglO+A0POu8"
Content-Disposition: inline
In-Reply-To: <5850cce1-e36d-4c84-8e40-80a7c8771585@citrix.com>
X-purgate-ID: tlsNG-d62444/1783690442-3D8E90A8-B2A9EC8C/0/0
X-purgate-type: clean
X-purgate-size: 2004
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm2];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:cardoe@cardoe.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:from_mime,invisiblethingslab.com:email,invisiblethingslab.com:dkim,messagingengine.com:dkim];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA10673B4AF


--LkqlGqglO+A0POu8
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 15:33:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 1/2] CI: add PTL runner

On Fri, Jul 10, 2026 at 02:11:30PM +0100, Andrew Cooper wrote:
> On 09/07/2026 8:57 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > For now run similar set of tests as ADL.
> >
> > Exclude suspend test for now. While firmware claims S3 is supported,
> > suspend attempt fails (power LED blinks for a few seconds, and
> > then system reboots). With no messages on the serial console, even with
> > `sync_console`.
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>=20
> I'll need to configure the runner in the right place(s) first.

Yes, you should have access to it already, just add it to relevant
projects.

> Did you sort out the dual NIC problem?

Yes, disabled one in firmware :)

> For the patch, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--LkqlGqglO+A0POu8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmpQ9MQACgkQ24/THMrX
1yzguAf+KGk2lod+lalZXPXke9balmR88g7W1WNk7KfsMOhO5QuKS9zhTDORJjMP
1jYP2RD0qeR83YtAh0wD3RUYZMKfWK+b2FaPH6DhENqP+ljaDaJlLco+mL46a0fT
zNBzFhL9JUO/1UJT4KwhaJuSOXOHU8omvYhnKK/fo9ymJjX2gdCMHIgEABk7Ocxr
bvQyzmaxkEp3p7NKwaAzk5/G7lUkUyk1rR/DH28lhhGCeFrmFl3RzaARlCNEqFFF
HR6M+W42Jf92qsiDtOc2EGoL0eygSjY2qWjcj5FPPcw8J4ZcrEbHLoJKUju0e54l
cWtrwVLP97ABXoDoYVB4kAqBCFo7VA==
=IUWp
-----END PGP SIGNATURE-----

--LkqlGqglO+A0POu8--

