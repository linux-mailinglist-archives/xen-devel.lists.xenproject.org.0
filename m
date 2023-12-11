Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 397F980DC4A
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 22:01:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652532.1018433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCnP2-0002Wy-3S; Mon, 11 Dec 2023 21:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652532.1018433; Mon, 11 Dec 2023 21:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCnP2-0002Uk-0T; Mon, 11 Dec 2023 21:01:24 +0000
Received: by outflank-mailman (input) for mailman id 652532;
 Mon, 11 Dec 2023 21:01:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jRWc=HW=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rCnP0-0002Ue-Sn
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 21:01:23 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dfd1259-9868-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 22:01:20 +0100 (CET)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailout.west.internal (Postfix) with ESMTP id CAC25320194B;
 Mon, 11 Dec 2023 16:01:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Mon, 11 Dec 2023 16:01:17 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Dec 2023 16:01:15 -0500 (EST)
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
X-Inumbo-ID: 6dfd1259-9868-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1702328476; x=1702414876; bh=9nyOUlz9xLs7Zxj7qPb/UfndicVFNiPM4Wz
	/Q1tLYLs=; b=hWoRZr6y1E2kmiJwHJDHZasJ3WxXC+2Qff/ZR/JnoSXc1O+7kti
	sWZBFo4XOIRCqW5P3rxLL2QSr1kta0mlVtnDUUMxur3qsFIr0MGugCBPETBcSigH
	e4YTrF4eEwitm3+hYfdN88Blwz5+FXoRH5MOmo+yGYZTUV49A42yVyZAQQV7zMeN
	3c4/x9KOZ9rGFC3/UsgVS3Lx+CurHIbgzumZ4wJiGtKTTaXq/tblNeWATsfEZ6SU
	hxEVIW9CHfa9KEh4yGuPf+98JLDn+SwXWLuPnvPTaKHCuVJXiprMuOjf1LBziIKD
	LcvGghp1828HEOBgFI8SsCviAWb5uGcBKSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1702328476; x=1702414876; bh=9nyOUlz9xLs7Z
	xj7qPb/UfndicVFNiPM4Wz/Q1tLYLs=; b=AnuASVGUuR33rnL+ADyohKDdLoUz/
	mLLnKl8ZJ1Zx7I0hxMtNemm2dFIen2ZNG5qyG6Fr2X/cvIvsWE6e41WBuYxTWfGs
	1O1UxNGKGd4y/RJT6/LegITyDVmn76nHIrSR8zAHN9dZWtYlVC1RuWqXTnYNiM7U
	ZOirWXM9MWqnwPsJfbK+T+KFDPBIEXENe8TBwxZbt5quz3DbtUe9sKr9lgvqZ3a0
	78+r1LDYVqMZhOADZCB+1lTC/zj6WE+XnYhco4L2TX661QirpNDZC1SPzSzn4+9Q
	w5OpN5bSBFLgExGxM2lq4/ryXjsSRFhtLv6zdIHAiVabLG4aT+SlNMepA==
X-ME-Sender: <xms:m3h3ZWde92h7LEfzprROlZ33pt9IGmJyBSR0t6k3ajogHG9tUL3LDA>
    <xme:m3h3ZQPYDZEB_LdRtTW-WOcCRkb6v-SICliIzJuiakX2ShuVdU_8AhAOHBfRHoQwn
    xKnaj9DLC2HcA>
X-ME-Received: <xmr:m3h3ZXgDHOcLLa0EhC4wYFcb7y8FLz3N9r2n3sEv-GgSOXeqGDTrG615PwXnM7DRlpZ2YwJGjPDvYBFPtVWT5OVdnjf7thaK-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudelvddgudegiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    udelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:m3h3ZT-2jhk_KfiMUqjvhrsVkcto6NFaceEsLo93Gx8k6o9WJSAXZQ>
    <xmx:m3h3ZSv31_mlHMGI1E8hF5plWmBk8UVblHpShrSSffY7sVHINNHpnA>
    <xmx:m3h3ZaF7jw_56vptCBtsGlONhpRDjaSNNetg1u1AAc3UDyWopyciKg>
    <xmx:nHh3ZT7oJdH3G7ODyFZPr31-TfTgBbr6CG3aNkvAojSFj3tNgmauiQ>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 11 Dec 2023 22:01:12 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] security-process.pandoc: Statement on issuing XSAs for
 older versions of Xen
Message-ID: <ZXd4mHml7lo1AF8+@mail-itl>
References: <20231027142602.57037-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0+26f8Jimsz8z4+5"
Content-Disposition: inline
In-Reply-To: <20231027142602.57037-1-george.dunlap@cloud.com>


--0+26f8Jimsz8z4+5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 Dec 2023 22:01:12 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] security-process.pandoc: Statement on issuing XSAs for
 older versions of Xen

On Fri, Oct 27, 2023 at 03:26:02PM +0100, George Dunlap wrote:
> We recently had a situation where a security issue was discovered
> which only affected versions of Xen out of security support from an
> upstream perspective.  However, many downstreams (including XenServer
> and SUSE) still had supported products based on the versions affected.
>=20
> Specify what the security team will do in this situation in the
> future.  As always, the goal here is to be fair and helpful, without
> adding to the workload of the security team.  Inviting downstreams to
> list versions and ranges, as well as expecting them to be involved in
> the patch, gives organizations without representation in the security
> team the opportunity to decide to engage in the security process.  At
> the same time, it puts he onus of determining which products and which
> versions might be affected, as well as the core work of creating and
> testing a patch, on downstreams.
>=20
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

Hi George,

This is interesting proposal, indeed it looks fair, given XenServer and
SUSE basically have this option already. In practice, I'm not sure how
useful that would be for Qubes OS, given we don't consider DoS-only bugs
security issues needing coordinated disclosure. It feels like infoleak
or privesc bugs are either found earlier or affect newer versions too
and in both cases they fall into standard security support anyway. But
that very well might be just an impression due to no such policy
earlier.=20

In any case, in Qubes OS we support Xen 4.17 and 4.14 - the latter only
for about 6 months more.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--0+26f8Jimsz8z4+5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmV3eJgACgkQ24/THMrX
1yxpZQf/flUzV7BqyWgfyuFJsB+mNyV5eiBtIOZFZb13iiG4LrSUB452GV6B16in
3yJTlHCb6bROGw4S8OnDb+xPjkK2IJsixeCVmi/8qYk5rSSq9qbCz9mi1MqltT2O
dj1K7ZwpatMDd80dPFVM60hPbRhrMKedm0Bv3RuFakfNSFbOU8UpxgC51eCkUbIv
Ihqg6gt6rWE8xJhs6EN3xestLC2uiMrH1nJPlKDU0XaewvW3Qi0JHSZ/gYbDKNf/
wWpbn6zSlH63HLct3GUiiCCJmjfEqXjMsUeMXHXQy98esVPEe3EKqwclLatmfNHJ
dLKsvzL8oGb7CHNjlXzjj/zKp3nrUA==
=+5vr
-----END PGP SIGNATURE-----

--0+26f8Jimsz8z4+5--

