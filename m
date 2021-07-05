Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4843BB8B0
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 10:19:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149894.277233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Job-0005gO-OC; Mon, 05 Jul 2021 08:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149894.277233; Mon, 05 Jul 2021 08:18:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Job-0005eW-K7; Mon, 05 Jul 2021 08:18:53 +0000
Received: by outflank-mailman (input) for mailman id 149894;
 Mon, 05 Jul 2021 08:18:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N9Vt=L5=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m0Joa-0005eQ-5o
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 08:18:52 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a08dc4ba-dd69-11eb-843f-12813bfff9fa;
 Mon, 05 Jul 2021 08:18:50 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx658IjKh5
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 5 Jul 2021 10:18:45 +0200 (CEST)
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
X-Inumbo-ID: a08dc4ba-dd69-11eb-843f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625473125;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=p+Os4nWW2/EfYs3AdH+v+c1xdUv0OHbHha3a92jlNLA=;
    b=YPJUKZIsn94iV0CtlRLYy+mp5fwwISb0QRsOWgktxznHJPswp4D7pd9Mo2iaG2YJn1
    CMKN6MYSXlF45k96Q4TiqiMOrMvXj8iIc0N+2JhMy6Yh6sn3MXQwKrMO6pRt1k/Utc9f
    ByKPopAZBOJgC1IQoCz6qUm1GeDvl/RwjFp9Pn7MOBI2r7tFaf+okH/sW1szDnseniCC
    8DcvyAiZY8n4wZQ7XaJsgmIPEc0tf2NNOlNI5bFDQVO5RB5xBtEaQ3HJVqfNGU0EYDfz
    fNFf8oXKkzKb9z2l/e60Dw40j2zOBH3c9VemwpYST9PvJ9BXhSVKJLQ9DNB3kCA23Zod
    LH0A==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Mon, 5 Jul 2021 10:18:38 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Marek =?UTF-8?B?TWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>, <xen-devel@lists.xenproject.org>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v20210701 06/40] tools: fix Python3.4 TypeError in
 format string
Message-ID: <20210705101838.2f760ed9.olaf@aepfle.de>
In-Reply-To: <e285cef0-4c85-35a1-37a9-f56ec9122002@citrix.com>
References: <20210701095635.15648-1-olaf@aepfle.de>
	<20210701095635.15648-7-olaf@aepfle.de>
	<YN88m0tvHKxF7+NI@mail-itl>
	<e285cef0-4c85-35a1-37a9-f56ec9122002@citrix.com>
X-Mailer: Claws Mail 2021.05.27 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vjqlvP02Sqe5JcDvh8/KeO2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vjqlvP02Sqe5JcDvh8/KeO2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 2 Jul 2021 17:39:54 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> However, the % (phys, ) with the trailing comma is deliberate to work
> around a common python error, so wants to remain if you're keeping the
> %-formatting.

What error is that?

Olaf

--Sig_/vjqlvP02Sqe5JcDvh8/KeO2
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDiwF4ACgkQ86SN7mm1
DoCZEw//RgDM8GOUVPL5r5QukLmJy/ZteSw8A6QzvLK4Trtsk+0ASHNCyjdmAY/2
tgK0+PMZcsZUykwA5DDoV0fBKytaMrQG3MRKSCNCtlJkBZq87BngUQI6WCKBqitc
zrfT38gAC/B51Oh9PEjj4G2C/99VkQsAYuMsBepfkcu50Sh04KhBrmAh1h/ZXscd
E2n0qO/ohZWcuEx0eR5nBksju3CPXeo22qv2H3dFNPfsqaSZk1ICtzEQDCtjJ+HN
yYEeQmxlGsikhOq3pJ+H4lE4ZmMj+bcMt+bq3Vch/+74uRNBWBghCsTeLwEvNJHQ
f89/J1LAnxOFPf6/4dDOU2aMGNbTOSMWa529uDOSkyXocWCixl4Rqq4Wam9SYvno
qdNFyKgoMpg4rj9SurxNBcy4zOkuiivHuqmoostUIhzd1t0yTri2p54Zswizl8Hw
U91Btmn+JwR2LTnFUf/wiEuNvTuJxKm3FlRK2adeBpL4a+s7tsPl9DUBLz03e921
T/HG7LFgAmsh4EXvx9FukYGMZSS22sa1s1T2BvYTof6HAkqeQqvRugFbaAUkPfl4
sufhk0z6DS9npMT4BjWrQ0lrQZBOQoaUctu+/y2FwaHL1PtUsSRNXp+I465d8eCC
ajmR9yg5xBgW7IGueIlU3q0ayT/ZlpRoTC+iO0RgRVLTANgtAQw=
=ChGU
-----END PGP SIGNATURE-----

--Sig_/vjqlvP02Sqe5JcDvh8/KeO2--

