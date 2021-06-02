Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C013987FC
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 13:21:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135976.252343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loOve-0005ph-0d; Wed, 02 Jun 2021 11:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135976.252343; Wed, 02 Jun 2021 11:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loOvd-0005ne-TP; Wed, 02 Jun 2021 11:20:53 +0000
Received: by outflank-mailman (input) for mailman id 135976;
 Wed, 02 Jun 2021 11:20:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NSCb=K4=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1loOvc-0005nY-JL
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 11:20:52 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.83])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffb40af4-4180-4ef1-b201-e70d7205610f;
 Wed, 02 Jun 2021 11:20:51 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx52BKi4Tj
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 2 Jun 2021 13:20:44 +0200 (CEST)
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
X-Inumbo-ID: ffb40af4-4180-4ef1-b201-e70d7205610f
ARC-Seal: i=1; a=rsa-sha256; t=1622632844; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=n0buuWcaiDcnOfO5XQDQ1bYiEV2zWbGEiwEyfMkk+9Zy3VT2H8uKE5L+4RqnC9GtQv
    UTq8ZLtsOuqscDuel50WuERbebjUggieahXv85Hv/hUzUGq/TmONslpLgDKOqFXakEDD
    UP2tunA/vuvHItJbKD2npAIdEGsIDA8l/G6XLfVIqxqUI9iklJSQbYCijNNswEYH5zRH
    sX/HjrG2XCrVOYa53AeLUOAogkann7BDsyEaOtPB23AZiSHMLWMivX+kJGNdW98tUAFZ
    VRoqhhmQRqwIQu8XXDH4j8oTmfNZ1CiTlO1jOZ2Ceb5fHymx6TG4txrh3UeFNfDe8qCe
    Q7gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622632844;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=KfK4MvOZX1Mw3hMEr+laTlUUuHLc0mlK9XtSeXAWDB4=;
    b=n1b3GPXkN3IRNg1uPiyBEMYbZJZAamJBfSVcg7Ipo4cg7W4pzOFyr0gAQTYwjp9sf4
    J0jMN82rQOSKVvBqzAlhDIimMdXDpDfnvMxj3k3dBGk/WpgnrMdnwndkYDV3wvEsLCNA
    QdCkAgd9HvAEKwTTugNu+dHVv5d7BTaKMWeLkVJGqeVJzFfc5HjzdqxLCTgzowzSqwiT
    vJc74TMAMVkNgByhQjGQabUMZf8Y7F3xjUoU0DYfGENxNP17XbwZm2qBxy1gY7+U+7aL
    B1n2CsrqQs5D/MuobRYSPo5Azc1t+mNjlmqWNePKTNiQxLDpIvLW3XnUhA1BsfcuIG/O
    RaLA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622632844;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=KfK4MvOZX1Mw3hMEr+laTlUUuHLc0mlK9XtSeXAWDB4=;
    b=pw16oXufDDazmJ/GZ0vOyCzFPGqW7C8ltUh/3bvi5A/hSxuF59YREs7CE8DeKYWJen
    /L6rTxFlPGJCiT9nmWw2O6NsfJBq2dDFouzMfE0QWD0SRCQjrFk5FonbkJ8zW81kyo0b
    VH1x2+5rTPjkLy7lSrRaf/F+HYLx3ld6ouckkLEo40Ml0q50wvElOyX8b/iumZ49/vOy
    yk7ilJo1zC8WHTQ0KsjNPOjHQKxM25bSTPY1LsnBbcdVUfLzKvLVvkie4B4vrmwNdcbq
    OBR2Loo9cuZqadP7xnESe+zS07BdWbJjwfWpnLmnQ5d4Slj+OPfMTcsFdPVJ1XuVo8sf
    dffQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF9Wx7WbE3s+BU2kLCYUBd7t4vRd/ulzKn4R+Wk"
X-RZG-CLASS-ID: mo00
Date: Wed, 2 Jun 2021 13:20:36 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Joshua Otto <joshua.t.otto@gmail.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 wei.liu2@citrix.com, Joshua Otto <jtotto@uwaterloo.ca>
Subject: Re: [Xen-devel] [PATCH RFC v2 00/23] Design document and
 performance evaluation for post-copy live migration
Message-ID: <20210602132036.68e60184.olaf@aepfle.de>
In-Reply-To: <1529230714-30455-1-git-send-email-joshua.t.otto@gmail.com>
References: <1529230714-30455-1-git-send-email-joshua.t.otto@gmail.com>
X-Mailer: Claws Mail 2021.05.24 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3V.L3j.n+kYMS2GGUuC+xFn";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3V.L3j.n+kYMS2GGUuC+xFn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Sun, 17 Jun 2018 03:18:11 -0700
schrieb Joshua Otto <joshua.t.otto@gmail.com>:

> A little over a year ago, I posted a patch series implementing support for
> post-copy live migration via xenpaging [1].

That that went anywhere, or was this a wasted effort?


Olaf

--Sig_/3V.L3j.n+kYMS2GGUuC+xFn
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmC3aYQACgkQ86SN7mm1
DoBCfg//aCC24yeBB5+IAoUFQU3V26iJrGaigxPPd92cfKfS9+tlTeFfCnVoGy6c
8MJB2SL2pqMPh/UnhxO2Zi3TEWBeZ0Y+eUghW2+0BN56e7WbsbkoXyiyLdRW5q3B
Ow2N9W81Dbe3eyHinDzdXO/LUpozgc+xdDbTcEACUHclUhOeXvb6GDBQKbDsT4w0
RHYaTll2w5DxT3YqTFlH42Bd/P1AaD3g0nor1xtexbRr9dWATHH4uG2mZnGDt4tD
nVMXqVuVXIE/dC878CtmwHsU2fyOEonA3bs4aeWZQR2qeBDz1ViU/uLfY7CYeYrQ
jTceMkCQY+rRy+hfZ5gslsb4xCPTaGJkfxizdFAaqaL7tO0ChhmGZUz5mVfI8v0h
0P76juHlORG1m5/YsXIyFquM2Er8WVqwHtZtclG63Y4b1Q9Grl2y9YzPpMUPal+C
ywOKwis6daAToo1e2MnafT5+gC/QeZsY8LAvlb0r76zex17PC6cL/4ueDn5Lk7xx
jQgh0imV96lmwX7uUTf+gLvzyoczIZiEFbcCz7AidWEpgixc+73pRHjFhVMUz0eT
+n1yrcjD/RMaPxowAFsdi8TVZi2jare2td9o5RyZkA9j6EsqZVNilyMg8DjzRoYR
7XbbipaAoRwqKmwmRwwq6xVV34DmKrzRpnortfZBj7duOiZ190g=
=kfsJ
-----END PGP SIGNATURE-----

--Sig_/3V.L3j.n+kYMS2GGUuC+xFn--

