Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D55BA6FA4A7
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 12:01:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531344.826948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvxfy-0007mw-PS; Mon, 08 May 2023 10:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531344.826948; Mon, 08 May 2023 10:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvxfy-0007lF-MJ; Mon, 08 May 2023 10:01:02 +0000
Received: by outflank-mailman (input) for mailman id 531344;
 Mon, 08 May 2023 10:01:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fEaP=A5=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1pvxfx-0007l9-7i
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 10:01:01 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.160]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3be2076e-ed87-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 12:01:00 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz48A0qzp8
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 8 May 2023 12:00:52 +0200 (CEST)
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
X-Inumbo-ID: 3be2076e-ed87-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1683540053; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=C8RfRDt9q8ZIHNKnF/GJYgSvQ3FPjV6nUWGp+BeLTCzZMWxLTD6uEKsvGxVwyzYr//
    ll0H1DEmJQlaR1s/HK4j5XRQOwuGgN0C1JwKX4wEbrdUTk+u2DsbITSCxalUh1G9AFzi
    LKVzCmJP2ZyUbNnCOG0W+aKBXCyQdRlTs7zh+ZzwF5mZ/Bw4hhfA5fMmY6hRu2bEvW4G
    Flo9pp1jvY8x9faf45+9A8mPpSLYaOjOwpnD2gwW8r0O+VLbx5pyEZ+buRiFbuL8+j7f
    cSWXrEWARbJRW8n3IEn8wj2fr9EZDiMmph5ZNxL9SjjCHm6l89vrl4jqqCv278SWd9Rq
    8daQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683540053;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=aZByrSjFH0yqleLqhT4Rj8ItPXbhzHGznL0O1xXh5es=;
    b=DmgxL+VoKlAXTEoz6y2lQYGA4g2J3O7ktfXsHjrrBNWz68WB/1tGxSIWZlhw12OZZ9
    uglZvxX7rxSVGJug9Lc6dukDqeNuozpd4JliNRcrEEr/i2JU9gL7jQdtHcARnNL2oc0m
    929hKAzm6jiDypqnmJGk6CHuoppzMwa74DAZXxRTblPEOlToa+918CTBUFFFcvcGCFvT
    xzBMoYl7CuvJvm5RhSCfJ3mSZ+42F8pJ+FIQyIjhJM47Grani1eM9J+sIZTW8JWrorAF
    8wGppusiVfhs8il0XTEKzP2u14WkI67ravE4c9VWUi2yg1MnMmPtL6cmPZlFAq1JKBsP
    J2/A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683540053;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=aZByrSjFH0yqleLqhT4Rj8ItPXbhzHGznL0O1xXh5es=;
    b=iNVj+Vwpk0J+vuDQ+0IIeOQC5VRWdFjoW+FN3WutVjwuKW7E/Du7RlWdvpui+41pt0
    J44oxXQ3O60DJ3KT8I9ZLjxqHC7Vghate9aWEE9WDvKaP5UUphAXIymZ0N/3he49c9y7
    MYefUOvfrwytlLokcJ2k3j8L/ZblRSmW+ineTY5DEsTHqF78apBSvN8CmLQR3B4cY2jK
    Aj9VT6Ujg1DOTyUg33a68DxwE/SfwXQrTDh5xJX/npvU193iat2UpSKm50ukCE052Jtx
    1R2Ubu3QMDOjYe12mUeYXASbIfyDyv9PfvrrxbrKu+ljEv8VK3vd0wrTptGRKIObN4Yh
    rlIw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683540053;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=aZByrSjFH0yqleLqhT4Rj8ItPXbhzHGznL0O1xXh5es=;
    b=ZJi7MYJMkFleSzwr4FB01GFsS2M/NnmtxNBZ/azVkqNqUxO2xvmZLu8VJv61PJ1zDr
    4xW6elgnBS4ERlHfnnBg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR4ARWIYxzstZKeVom+bauo0LKSCjuo5iX5xLikmg=="
Date: Mon, 8 May 2023 12:00:38 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v1] tools: convert bitfields to unsigned type
Message-ID: <20230508120038.74246111.olaf@aepfle.de>
In-Reply-To: <d8224847-ffc5-3faf-1bc5-6ad3d7966b26@suse.com>
References: <20230503150142.4987-1-olaf@aepfle.de>
	<d8224847-ffc5-3faf-1bc5-6ad3d7966b26@suse.com>
X-Mailer: Claws Mail 20230504T161344.b05adb60 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/glmW5p0I8X7ORaw7EpscoEJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/glmW5p0I8X7ORaw7EpscoEJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Mon, 8 May 2023 11:06:11 +0200 Juergen Gross <jgross@suse.com>:

> > -    int short_summary_done:1, prealloc_unpin:1, wrmap_bf:1;
> > +    unsigned short_summary_done:1, prealloc_unpin:1, wrmap_bf:1; =20
> Please use "unsigned int" instead of a pure "unsigned".

The entire file uses just 'unsigned' for bitfields.

Olaf

--Sig_/glmW5p0I8X7ORaw7EpscoEJ
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmRYyEYACgkQ86SN7mm1
DoA6uw//RLr3DtYxH/Z1tht+kPZQeqyhjfeErQeBDI6NxJ1V9gldO7GhcKBQ72nv
iFf10IdLrcPgRpNlpkhbglMSk6og2sBvN0gngWRfGlR8Bf5223mZpECyod9S93iR
EcXb6ZzA/KDxzynDjddFr7MVBYY77bp6gHs5Bs7PjCrtSaV7ziSHvrn4lZYrbhjj
QDlCWcWKOVPlsNPDkr4hCOcHJ865L/xi6l9Uyz/KgXgAsO078/RYXjVA03Cc0M8Y
kR7vOijzt6F1/4oYwrcMwK5Hsf5/H9aSwTXvxfmfGMTlDvLPsipoHtHdLMY5J9nA
LWLpiHj7zBtkBio2tEmLOa0tKJ2YQzjEVifz/gZgKiGFucMu14QX62jewRw/ssTC
s4EdGAd3st/V03R84p7Yz0a+EgL3fLpzPqC1WsM4LhP0gWS/X8vysOTmk499jXE0
HvFwMCVLgdAApvcqbCdGeyLhskMslUeibQoKJf+XJ+PeAQCoUjYeiMxMz8j2OgGN
7yVEzxX1RTZzRztaSA4nDqOrh68Wc4nq6gh4/yia5IOqdPOAbTFNhFbvsCoRTTs7
taV3iwwS7rz0lSj/QRfekPfKS6EuU7f9gO5xykJiUQJ6YCiMs1D9e/eXeVxveNIr
K9hurDOp2H2tOskQUzFLAyu1WLy3pkxVPdcGJncQND/fEEoD6ag=
=KWgt
-----END PGP SIGNATURE-----

--Sig_/glmW5p0I8X7ORaw7EpscoEJ--

