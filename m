Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B6E3CA053
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 16:12:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156642.289065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m426A-0000oB-GJ; Thu, 15 Jul 2021 14:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156642.289065; Thu, 15 Jul 2021 14:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m426A-0000lq-Cw; Thu, 15 Jul 2021 14:12:22 +0000
Received: by outflank-mailman (input) for mailman id 156642;
 Thu, 15 Jul 2021 14:12:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q7zA=MH=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m4268-0000la-WE
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 14:12:21 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.52])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa3042da-e576-11eb-88d8-12813bfff9fa;
 Thu, 15 Jul 2021 14:12:19 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id t06ddcx6FECA5ti
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 15 Jul 2021 16:12:10 +0200 (CEST)
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
X-Inumbo-ID: aa3042da-e576-11eb-88d8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626358330;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=L9rixT/bSU/Nv4AywOSJTW4LEsS2c94gnjAGXkqKPXs=;
    b=IiLDyVulL6e0yXy0z3yz8lZ432ySMwGgTOUennaVXywWDA3s0/HuHYq95ExqFEJ8sR
    sS65d8CwFJ5RyMXgXr6EcGQr4ez0Ug9bXNpMeDPLY4H0fTyiccP2S5C2S5pOXVU6e1XA
    P/JWDta32XIIoniR/+PvBRHD8xKlf352OMUBkK5uUtHRjnjzsfNYRBtThrYj9NARbTZq
    hn2qya75I4Y+9ry2r/gh9hjOwqN5WuZiMkiqpzavKBOEire7Wpm8qiQdIYVO8+O7f2wL
    jymHYYN0nVXXwWOzd2KNDs0sJeGHNbIKzb0rEfHb5JK39j/htfvXshsgg5zSKhmgT3Tk
    QdzA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Uh7RO03shFRdjHl0ahyOVapB5ArPk3G5dZ8E"
X-RZG-CLASS-ID: mo00
Date: Thu, 15 Jul 2021 16:11:57 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian
 Jackson <ian.jackson@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Anthony
 Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Subject: Re: preparations for 4.15.1 and 4.13.4
Message-ID: <20210715161157.7e85ed9e.olaf@aepfle.de>
In-Reply-To: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
References: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
X-Mailer: Claws Mail 2021.07.08 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uxshyIRnet8XoD2X.eONf9O";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/uxshyIRnet8XoD2X.eONf9O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 15 Jul 2021 09:58:24 +0200
schrieb Jan Beulich <jbeulich@suse.com>:

> Please point out backports you find missing from the respective staging b=
ranches, but which you consider relevant.

Depending on how green the CI is supposed to be:

76416c459c libfsimage: fix parentheses in macro parameters
e54c433adf libfsimage: fix clang 10 build

This will likely turn the Leap clang builds at https://gitlab.com/xen-proje=
ct/xen/-/pipelines/337629824 green.

Olaf

--Sig_/uxshyIRnet8XoD2X.eONf9O
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDwQi0ACgkQ86SN7mm1
DoDowQ//YS5eCfJrHUrMYAxQE6UWJyM7M1B5KvcfAu0BKKFWimuZrEWULmEhZEVp
moUHpXNesKxIXsHcdrShlaNLNgzYpHaSevn6R2rV37CMF4XUodzLS9qMruBK25ne
e5r9k9BPgPMWNRB+ldFOZg/tBKPlgzouKdQlqb0csaD9MW8MNXJFZ76yMq4HX71s
XY3UvhCvhyL3dgXB1bgL2kqilzmz9fmpPiNgtrNhvqUBrPaALnqI5tzfq6i273Rf
fjhKEKdF/vbRnlVByyXRJCiq2RpofMbaWSRF5QGQkIuThisexOQIsXfrWvJBOsJS
94AedoKngAm6/J0BbueIGu9J9uGqFmqrpFA7aaO/AsaPxA3RVPjWUFYCyqdqz9Hb
pcq1YrtQopw62wvpJbl9o20ws/Lmb4t6nIkQDUfhKYSvEe1lwCXcZIc0jq+eK43Z
o6Fjhi798hY9Qho66TOV8WAJJan9knmJFE8QIj+oliFMr9F3GL1wBYKMeNyZ7Pi8
VBnNo0cGgqTS3BVmbh1L/yyRfH/lty2EHvoHwImtNWQzkk9/BI0jxPWyGtkXYEPA
3NcxEbe1vwgtb6Bq1N0A7J6Dx8sOxwLec23gKm9M3ALCmMnK4M2zjpMpFra5ve2w
w3u9fXPRImU2JgW01+g4r6C0QehAsSpFHoGcAe/bNEQyFrgp1l0=
=ijev
-----END PGP SIGNATURE-----

--Sig_/uxshyIRnet8XoD2X.eONf9O--

