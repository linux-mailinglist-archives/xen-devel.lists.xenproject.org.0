Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F047673F7
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 19:53:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571527.895594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPRde-0000W2-In; Fri, 28 Jul 2023 17:52:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571527.895594; Fri, 28 Jul 2023 17:52:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPRde-0000Tw-EL; Fri, 28 Jul 2023 17:52:30 +0000
Received: by outflank-mailman (input) for mailman id 571527;
 Fri, 28 Jul 2023 17:52:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z7ET=DO=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1qPRdd-0000Tk-7c
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 17:52:29 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8357ee8c-2d6f-11ee-b24e-6b7b168915f2;
 Fri, 28 Jul 2023 19:52:26 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.6.6 AUTH)
 with ESMTPSA id jd2f5az6SHqJGEJ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 28 Jul 2023 19:52:19 +0200 (CEST)
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
X-Inumbo-ID: 8357ee8c-2d6f-11ee-b24e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1690566739; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=MLhHZEfki9S1wUCUpAIeq0mEEk7XZry3D6dpefpfZRi/gwh9OHXJFCLt/ES9ODSWnx
    fqg6+OIYKp2aWy7wGKk2hyl4raltWi3yWt47jd9vE5O2dLgJb5dpYBCICM2jpTG0eQv+
    r58sfQVxmLT1r37+SWzJJX52AHx8uy2n4zg54sIm52/xVkn/VkOcPJrZzh15+HvUPtcb
    3ATA9xzLN+RFaxboni0nQ1T8XfbGoBzf+L//djqHCc8Xfc6Y3BEnWPcPouyu/4j7e6Po
    tUlbpn7x6fhuEu8tG0lDUwyfFcJoSl+wfkbIwPNJwk5SLx9I35H2seakBhk3eJugOShe
    wHFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1690566739;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=dMqsAPOUePXAb3/kfVDyt+5XInlBaF90fkWPaXo0r9c=;
    b=LJlKf9lwgR/YZyxb/YKRv1/5y3U+FG/FmYvm7eaXnlemuENYASdLm9gQMzK/DnbYOQ
    mVbWz2wPb92VmWkXG5aJ2cIGqpz2KwiAzbgWtz5nxUY9gQUS4Ju2bLlC0Ig9GYZmhZad
    FsLvrWn4L+vqj9ut9+UIWD57K7LIPUwjKljFXBAnjJT9TdxRAh7/Tyyk51/KmrUM0mWW
    6gGfwoXi0xySFLc7blHMSoT5Y5w+0DckMHRoaPnieX1GF+RFbtnCHrpIJnYcYYuOlCVm
    dbsQJXvIWSI6XpBr8akIgHHFCk/rd+5e3TfOMsBLzxHmJmtKAMBDJRTOeH4oy2AOxTs1
    LRkA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1690566739;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=dMqsAPOUePXAb3/kfVDyt+5XInlBaF90fkWPaXo0r9c=;
    b=g1lOLJUmim9XCsuhe3Oa/rhk3g222Bd+dvOzKgdysolc0aAnPcBtu1l+A8NCGpT/OS
    iHVVd3ApsRSZ253r4HQlntKGogW7wzgtUuQidYeNHVKMmHscYqr0gyUn13PmUopvhCuJ
    iceKBFjyYPt7tKdRIgPihLwCQKd2cUwmg8ayykZNrW90ogx2ZQNeEgETqbBakBEwQxe6
    0hI7iVgzZPL2QX08/h88kDfdcZ03r42Fj8KLjqL5HBVSVPLlry4PtNfTF5T55iJACzXA
    DLqFLdMjvvjMHRAfsRXCnkHO7yzBMfvk6OPnaYeYrfsmZCqqh/vK7PT9GFgj9ntS9Fja
    MG9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1690566739;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=dMqsAPOUePXAb3/kfVDyt+5XInlBaF90fkWPaXo0r9c=;
    b=AoFSlnqz7lDMqmJBz+eo5QoRHEnmMSNG3+EUKYHydFDdLL7JXkoFA6Aylbn0jtDRT0
    7jPtj5O8eD/TaGAgQCCA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5U0GIOxzsQPrGAhfM0BJebfTWeDWMtcJLtvI+aQ=="
Date: Fri, 28 Jul 2023 19:52:10 +0200
From: Olaf Hering <olaf@aepfle.de>
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: Re: [PATCH v1 2/7] xentrace: use correct output format for pit and
 rtc
Message-ID: <20230728195210.66faf194.olaf@aepfle.de>
In-Reply-To: <CA+zSX=bZ5zo9cxWTq9s9QOUGZ-9NMEugewR90z1w8C++sruSVw@mail.gmail.com>
References: <20230601142742.15489-1-olaf@aepfle.de>
	<20230601142742.15489-3-olaf@aepfle.de>
	<CA+zSX=bZ5zo9cxWTq9s9QOUGZ-9NMEugewR90z1w8C++sruSVw@mail.gmail.com>
X-Mailer: Claws Mail 20230724T063118.58ae3d58 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZuTyVo4HpPE6Ufnyd1xNIdU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/ZuTyVo4HpPE6Ufnyd1xNIdU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Fri, 28 Jul 2023 17:47:11 +0100 George Dunlap <george.dunlap@cloud.com>:

> Just a couple of notes on the whole series.  First, you didn't CC me on 0=
/7
> or 1/7.  Secondly, patch 7 seems to be corrupted (see e.g., Patchew's
> attempt to apply the series [1]).

The cover letter can not be easily fixed, this is a bug in git send-email.
It should be able to collect all recipients and put them in the cover lette=
r.
I think I already pointed that out a while ago on git-devel...

I think #1 can be fixed by adjusting the MAINTAINERS file.
Not sure why #7 fails to apply.

I will rebase and resend next week.


Olaf

--Sig_/ZuTyVo4HpPE6Ufnyd1xNIdU
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmTEAEoACgkQ86SN7mm1
DoBU3w/6AlXjPiyuMYOYm/PNbSiC3/8p8cfHP6UfnFzTLEhCKmny1jDL80ib/nIS
v4lLFR0EpfTJi6rmPFMjpfxSIpoi7sty3uMHHS4NtryjjV39QcrUPchGencGBmbj
sz6KqzCs4JC2lWQHiahx9vVZaR3C50SGSQOjPvXAFm+HN1/+pE37hkq+RuwgVbwP
dmnPCNomvjri/vrM21CF+dxdskpeucovy3Mbgs8qkLbJncL29oVYrJQMxjMDcoAZ
O4rzr2U2J3KIM3SbzQQVbdZIaYRC5wlEVCiI5LQD+HQXe3dDmILMzxjYwc7v6Ni8
plyqZoUefIt/P084/DQiyIcqKJ/8d4wNnMoI3/mzyYFRe9Sx8jfhjm7V7P9aH6lT
sndySqlT9JQU6b7C2ivPtyFkspjjE6Zg5f8OJg/18X92LSprgfRkiDyqj2st6PzW
lRlceoDTxtHTHrTTUHEuRIsdio4Vwn5eEj8uP6MyXJY3ezoCwOInaD1jU4O417IE
lrXrFFsFBpPRsW9g885+UPMqiXh5VEit5nI8kPQzPogWrteLdh8NGmEIfIiCQjV7
Wqbn2p6teDKMhZlSgBH2HfIOPe4QEdZsg2zL3ZiJStFUE7fj0Q/jka4BA2GX7Ztj
1BM+Y/lTve9u3Nrr9fv88cBAEEkT8DL7J/jBcBtdWAA0fZP5utE=
=jKFG
-----END PGP SIGNATURE-----

--Sig_/ZuTyVo4HpPE6Ufnyd1xNIdU--

