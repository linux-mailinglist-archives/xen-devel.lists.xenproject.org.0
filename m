Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJcTE7tzi2nFUQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 19:06:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE9F11E38B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 19:06:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226813.1533281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vps84-0000Ua-7b; Tue, 10 Feb 2026 18:06:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226813.1533281; Tue, 10 Feb 2026 18:06:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vps84-0000Rz-4q; Tue, 10 Feb 2026 18:06:28 +0000
Received: by outflank-mailman (input) for mailman id 1226813;
 Tue, 10 Feb 2026 18:06:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TS8X=AO=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vps82-0000Rl-AJ
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 18:06:26 +0000
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36003232-06ab-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 19:06:25 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 819477A012E;
 Tue, 10 Feb 2026 13:06:23 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Tue, 10 Feb 2026 13:06:23 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Feb 2026 13:06:22 -0500 (EST)
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
X-Inumbo-ID: 36003232-06ab-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1770746783; x=1770833183; bh=IA
	yJUHnpo3MFuH2KSk95NDd1cvwrmv1J4g+LIPw45tM=; b=jtcWvHN+G7QSpl3k31
	jKC6mwfoDscjayFNe2QfT4vjOpWEf3k5O+n70VzmlC081EU3y5JiiZZumairrA3b
	xeCuzHSYUtrDrfIXCfj1QBG8BcAZg8ev8UHg1aUpGNg9I45wDA2WBn4B5Egq8AXS
	9iMr0gGWTw6rQPGQiHp2RafVTRNefkBJkaO7gu/OCOB/wGlnSoshs6MW8jsTS5O1
	SAi4BkAfPN4R16ap/b0lyVRUcmcKM03oPYVBhcv+yi7e5I0YcYNN1gESi08i6RUH
	t5V/nkPiXxI/Hn0ooVvuLSbLKYu3FI8Iqb4plkE5O1+FZiHK63BQdRh99TyaNfY9
	x0xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770746783; x=
	1770833183; bh=IAyJUHnpo3MFuH2KSk95NDd1cvwrmv1J4g+LIPw45tM=; b=M
	3mdhojk3iY6/jWgVYeuxC3naQxrGQDaHKMFVQql+JKZyXN8JJpBzykBn+go2ROXF
	5mN1x5BFyEf2fqdOxAuZyFSQcWaGJCxvDgPqQsAJzMnuoOzJEw9Rof/FHT3rG8Ea
	lDpNYWL1M0Hw42egdQf0ScP6wZJXKlycI8MkUi9ZyuKTrVuuSok5wYj5ZFo/YfDX
	FCXm9TUx4xXod9oWkBHow+DAcPrv/AOPuHIAIfBNu+NE6GHr/iJGbmeCC20DkZK9
	Yyk8E5XoVe60d72oFMJg5/qOA1UWrsJKmCUJ/LoVUvRkLJAjk+ijU5hxD6dF1NSq
	s/ou+q1YTzG6L2byODJjw==
X-ME-Sender: <xms:n3OLaZL6KfaXzVapoXGJtJL6y7oOp6VoKRxP7gGPUmE2q4p-Ha3mQA>
    <xme:n3OLaTElcUmTyKebrxC0RYQT9YiX2-37g_gyJYV8WvPp18aLOCVAlYkDgAxSJH10X
    u5pVo_vY1k40iHuzVcnBKM6SUGpebsiaDzM2uuzyoSyYtHK8g>
X-ME-Received: <xmr:n3OLaZRZiZ1RW6NcQMJ2lEAMGKpLneqr0Pndjfi57h6R6Mch88Bg4CMyjIuhk5azEE2aGIQdQtTCHEZ4XesR7qGagQs492LOpUs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtddtfeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfggtggusehgtderredttd
    ejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcu
    oehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpefhffdvjeehiedthfelkefgkefhkeevtdehjeehudetjeeltdef
    ueehfeegfffhudenucffohhmrghinhepqhhusggvshdqohhsrdhorhhgpdhgihhthhhusg
    drtghomhdpfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvg
    hthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhp
    ohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvg
    gtthdrohhrghdprhgtphhtthhopehinhhtvghlqdigvgeslhhishhtshdrfhhrvggvuggv
    shhkthhophdrohhrgh
X-ME-Proxy: <xmx:n3OLaXEH_gP8Xa2gpEQJ32e9zgxIsoOn_lK_3CIA77bTwmx4_rDZ6Q>
    <xmx:n3OLad9jmaNWR2km-y35-hZm8R7r6-hlR6jfi218UcjHweUzeUI5Eg>
    <xmx:n3OLaZLXb52VWPUya8fn6RlD-tHe1Is4ZALVYAtj_LitBcjhlnwL1Q>
    <xmx:n3OLaYb9YQ_dsQsBpdLhk3lMyTfJuklpbKhCjJYFwgpErOdgyAgtPg>
    <xmx:n3OLaQdSZyrhB7QNfuXSG2ZZ3c-CWKcTOfpEyjH-t1YEz-2cvBseEn2C>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 10 Feb 2026 19:06:20 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: intel-xe@lists.freedesktop.org
Subject: Graphical glitches (not refreshing?) with Linux's xe driver + Xen
 4.19
Message-ID: <aYtznP_tT6xNPwf-@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VP75K/iWhXkNFJA+"
Content-Disposition: inline
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm3];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:intel-xe@lists.freedesktop.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,qubes-os.org:url,invisiblethingslab.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 8AE9F11E38B
X-Rspamd-Action: no action


--VP75K/iWhXkNFJA+
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Feb 2026 19:06:20 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: intel-xe@lists.freedesktop.org
Subject: Graphical glitches (not refreshing?) with Linux's xe driver + Xen
 4.19

Hi,

Recently I started testing compatibility with Intel Lunar Lake. This is
the first one that uses "xe" instead of "i915" Linux driver for iGPU.
I test it with Qubes OS 4.3, which uses Xen 4.19.4 and PV dom0 running
Linux 6.17.9 in this test.
The result is rather sad:
https://openqa.qubes-os.org/tests/166691#step/simple_gui_apps/30
or
https://openqa.qubes-os.org/tests/166700#step/desktop_linux_manager_config/=
42

The black windows are mapped from a domU (using grant tables). But if
you watch the video (in the "logs&assets" tab), login window of dom0 is
affected too (background is rendered significantly later than its text
and widgets).=20

I didn't found any relevant errors in kernel (or Xen) messages. Just in
case, full dumps:
https://openqa.qubes-os.org/tests/166700/file/desktop_linux_manager_config-=
journalctl.log
https://openqa.qubes-os.org/tests/166700/file/desktop_linux_manager_config-=
xl-dmesg.log

Some user reported similar issue with Intel Arc Pro B50, which also uses
"xe" driver:
https://github.com/QubesOS/qubes-issues/issues/10661

I tested also Linux 6.19-rc8, no improvements.

My previous tests of the xe driver on older systems (Meteor Lake, Raptor
Lake) resulted in similar behavior, while i915 works fine there. But there
I needed to use force_probe parameter, and blamed the issue on xe not
officially supporting those platforms. I wanted to compare with i915 on
LNL, but i915 doesn't support that model at all (and if I force it, I
get kernel panic in i915_pci_probe...).

Interestingly, it appears to work just fine on Qubes OS 4.2 (Xen 4.17.6,
same Linux dom0 version). I did not tested with Xen 4.21.

In both cases, our Xen has the patch to use Linux's PAT layout applied.
That's a workaround for
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7648, which is
fixed now, but apparently similar bug is still present in a few other
drivers (including binary nvidia one...).

The same Linux kernel started without Xen works just fine.

Any ideas?

Having good and a bad version, I can try to bisect this one, but given
it requires rebuilding Xen toolstack each time too (due to bisection
across releases), I'd rather avoid it if possible...

I'm CC-ing also intel-xe list, maybe somebody there have some ideas how
to debug this.=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--VP75K/iWhXkNFJA+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmLc5wACgkQ24/THMrX
1yw9Owf+JkM97SAK2ek48Wh67U9zNqNtGDeAek2LesR4biLYu6M9NzVL/GsiilxJ
lirOwFwvfBR0vffsawvhpCKBOlICa3d7/vJgk4YvHHUSeBfDxkHp9xhRjzfVJBkQ
Yj6ZRqwcqg866HudQsa1Snd7Yuy92ymkpetTz55SIV4486Xw09026bxP8HN9MyJj
aS7c0uDbB8DOYzvOiCy7U183gImGhmTCJtWXY0F8EAJyJ3anP8AFdNqeDIst02lj
97BVgrzOkyrh/iuNMgHBTroeUnxV1BEhtCGqAAVRiWS5+WKTTyDKimoIhypolkwN
qa4GBeMUVhm/YSRhuJbljMGcLyjHPg==
=SRC/
-----END PGP SIGNATURE-----

--VP75K/iWhXkNFJA+--

