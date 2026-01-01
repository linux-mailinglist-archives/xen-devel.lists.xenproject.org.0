Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EE3CED876
	for <lists+xen-devel@lfdr.de>; Thu, 01 Jan 2026 23:57:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194792.1512983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vbRao-0000rb-4R; Thu, 01 Jan 2026 22:56:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194792.1512983; Thu, 01 Jan 2026 22:56:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vbRao-0000pg-06; Thu, 01 Jan 2026 22:56:30 +0000
Received: by outflank-mailman (input) for mailman id 1194792;
 Thu, 01 Jan 2026 22:56:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bd48=7G=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vbRam-0000pa-EI
 for xen-devel@lists.xenproject.org; Thu, 01 Jan 2026 22:56:28 +0000
Received: from fout-b7-smtp.messagingengine.com
 (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1986dcc7-e765-11f0-b15e-2bf370ae4941;
 Thu, 01 Jan 2026 23:56:26 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.stl.internal (Postfix) with ESMTP id E7A6C1D000B5;
 Thu,  1 Jan 2026 17:56:24 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Thu, 01 Jan 2026 17:56:25 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Jan 2026 17:56:23 -0500 (EST)
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
X-Inumbo-ID: 1986dcc7-e765-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1767308184; x=1767394584; bh=aV
	Knce9UA3xLzfq4I/i29bc4sVrFPEl/2n54K2rVS1Y=; b=dxTDEVcQXAAvHqAkYZ
	5A8Q+Zxzty4kB7X9kCh8XiqhouAWpQhMfJfw6ddV8UZaIjJDcDMe9jVzPwvZnRh2
	lCsQenFYdAed+0gI8lKWnmLJnNttrnS8r8irJcPR61XaQ1VoVCE3jAtw+WzlMRt1
	jqZ1QRXFzTn+Uw0ii6X+5ljl3uqfV03qppWGuQV00zJ5a0B0k1pKTjrc1Bwi/U1v
	3RuJyspO37ka4S7uRx2sCxW3Hu2B23E1B5nv6kT/zT504N5rn5bQPCQMUYKT8ri7
	rewQ4ggQiJTz1OW8Wuenq8u0NeLA6T3oIUh0F8s7ShW63db3KYrQ4c3jP/eUVxUY
	kVcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767308184; x=
	1767394584; bh=aVKnce9UA3xLzfq4I/i29bc4sVrFPEl/2n54K2rVS1Y=; b=S
	UzJXl1Bqbm/cpkQsxJzT5ASRFnyTMVDV2wms8kkYTxtN6A85LMb3k67m1Qkm/adG
	WSJWP7D0fbsz6S6Z4cC73k78b2u8scEc9dmmuKINScJ5X5FTA7dHgMtR1HTej6e1
	BWLDQEpRyWelDc/711xQ/BT5uCl1pT+9/wXu+OEOguCJQl0kInyOjjqqF9N08SV1
	lK5Eey7zmJaqOmWsxA7VlgQUZaw/+XkyGcjpIeSe/OBvQC/b2IxDgkJDIff2xIIF
	nJIgrNenFxx5QX3CPlAfFRx4bxtlzi7H/ZWQ5PzeHhHkupHcEDF0JTX6EpqeL8xI
	lFaVz9aZ0iXfTtgphpEHg==
X-ME-Sender: <xms:mPtWaShxPe5ctH_NatnA6NTRSYgngqj1874yNGGdOXwEEVKyWreXlw>
    <xme:mPtWaaDe4QePOpg8mDyHPH4t56Au1kalm9o3aRtkj-qTorzLkvtAdtnmZ3OaKCPcu
    BGivKLMvMIqgI43k70GQ4Br6WjlxHjTu-B498FqpAYJW8yH>
X-ME-Received: <xmr:mPtWafGXmbJxR5myMEC3afTxafBHC5gaHiVd1FTtvnJ0o9Hqn9SB_PDXkhKGPpXoG-dTs5MdSZuGXS4bjoe04Ad_4IwaHzp_WzU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekjedtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfggtggusehgtderredttdejnecuhfhrohhmpeforghrvghkucforghr
    tgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgtdfgvdetteff
    leeugfdugfegjeekgfefffdvheffhfdtfeeggfeuhedtffeuleenucffohhmrghinhepqh
    husggvshdqohhsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomhdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtg
    hpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopegrnhgurhgv
    fidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtoheprhhoghgvrhdrph
    gruhestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:mPtWaaJFNPN8I8ic7Tl9ebsJiB-lzbQRnPhB78rwx9Z2zSHRnGxL5A>
    <xmx:mPtWablnat5ZxNzfJwaLRWoMnoDVe3zSXl3aB5nbsflJ7c3LI8VhoA>
    <xmx:mPtWaaStoKf2BK2HYeyQgqeB0HHaQWgvn3ZnRRRU-sJ_uRoAoly37g>
    <xmx:mPtWaVJaho51rUVC1IBuQACYhqSaGNXAis3ZQ0Y5yrmbxQW18kwgcg>
    <xmx:mPtWaXR1bIbKyCRaBw7ve4iRFOIopBPYpdRwRAFaGRE5n-vamq-7sGOX>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 1 Jan 2026 23:56:12 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Dealing with SIOV/IMS
Message-ID: <aVb7jL52nkmSD-Gr@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NBzhMn7VFeiIx1Hq"
Content-Disposition: inline


--NBzhMn7VFeiIx1Hq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 1 Jan 2026 23:56:12 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Dealing with SIOV/IMS

Hi,

I've got yet another report[1] of device failing because (I assume) the
drivers reads MSI/MSI-X values (thinking it sees values actually set in
the HW) and then pass them to the device via some alternative means.
IIUC this is what IMS does.

I'm interested in two things:
1. Some plan for a long term solution - it was briefly discussed on
XenDevel matrix room in September, Roger said:

> urg, that's the spec that also defines IMS IIRC?  I think the only way
> to support anything like that is using vfio/mdev and re-using the
> drivers from Linux.  There's too much device-specific magic to
> implement any of this in Xen, or do our own Xen-specific drivers.

2. A short term workaround for few specific devices. If you look at the
linked threads, users resort to patching the domU driver and then
copying MSI values from dom0's lspci output manually... I think we can
do better than this short term, via some quirks in QEMU. Either let the
domU see the real HW values, or translate IMS writes at QEMU level
(assuming they can be identified). Disclaimer - I haven't looked yet at
this specific driver, nor the SIOV/IMS spec, so I'm not sure if that's
viable approach...

[1] https://forum.qubes-os.org/t/solved-qualcomm-qcnfa765-ath11k-wcn6855-wi=
fi-working-on-thinkpad-p14s-gen4-amd/38192

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--NBzhMn7VFeiIx1Hq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmlW+4wACgkQ24/THMrX
1ywQbAf/Rpii9AUUJGqZCu+T23c77jmTYIL0wp0V/o6DCSlGWAIn4ECJudQ4AGw8
tqn0LAQ/eSIrcPQLgybq5JoDQYmwaCbYMvaL1Uvrl4Ea9DmfCT3yJ2k8majjaeZH
/DMo6nM477N02eULdUQi4Emfika4wbOIDDsZQAte7S0Zup1VBIWdO7rC2hmKmGF1
tQrrwxBoXwYRjA+5iH4S4SZeX9wJs7ehPcCIT+uz173opjrTPBUMNYfM7Nbl724f
xamnTETpU82DNCCRd/q481HNlGiXWTr+JJh319tNBpENRQAyetI5sQOc5bcyTsS8
x2arJHrJKbF4MRDGs5kRAv6ky3+PSw==
=Bnc3
-----END PGP SIGNATURE-----

--NBzhMn7VFeiIx1Hq--

