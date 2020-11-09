Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E49AA2AC421
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 19:48:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22857.49386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcCCu-0005aE-Vt; Mon, 09 Nov 2020 18:48:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22857.49386; Mon, 09 Nov 2020 18:48:00 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcCCu-0005Zp-Sf; Mon, 09 Nov 2020 18:48:00 +0000
Received: by outflank-mailman (input) for mailman id 22857;
 Mon, 09 Nov 2020 18:47:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+c5I=EP=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kcCCs-0005Zk-Jp
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 18:47:58 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.22])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fef92ffc-035f-4ebb-a4bb-96c49e6fd660;
 Mon, 09 Nov 2020 18:47:56 +0000 (UTC)
Received: from aepfle.de by smtp.strato.de (RZmta 47.3.3 DYNA|AUTH)
 with ESMTPSA id j03b7dwA9IltCiO
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 9 Nov 2020 19:47:55 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+c5I=EP=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kcCCs-0005Zk-Jp
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 18:47:58 +0000
X-Inumbo-ID: fef92ffc-035f-4ebb-a4bb-96c49e6fd660
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.22])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fef92ffc-035f-4ebb-a4bb-96c49e6fd660;
	Mon, 09 Nov 2020 18:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1604947676;
	s=strato-dkim-0002; d=aepfle.de;
	h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=Yb6nN3Nh6cDmNZ8Fkmuf6nIsjsFWSPeytv34C6bY18E=;
	b=LOqBJ/2iZCweu9+SYbb6lXXeo/ymrw9TgvKZa2itnsf3YAO1SgGhWH/8Z/RU5gRtyd
	ffhTfw+ksnaa7dUxNV3anDE3nC1btC4NEV90tqZpQCDFIK/0vbuaCyyfWHfI3ibQxL7E
	Sv+p2F6m09qMdkYHWe3W84n6XSGAn3yGR00WBgbmVMgN6plTuJeWdvU7gJaBx0Sn8A9R
	IlhcsHYq3rMT/o2HBgRVrWspTgX/20b7DHURS3z4y11RP/aVc+FomTMBGCWVBDLpFbjh
	cVTo1pTylllAis+N2QKDZbC3mryKpSFJs9bOKo9OaeLXuKP6fyYMACfKjIrCeM04Rj1S
	YErA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3GhJjw=="
X-RZG-CLASS-ID: mo00
Received: from aepfle.de
	by smtp.strato.de (RZmta 47.3.3 DYNA|AUTH)
	with ESMTPSA id j03b7dwA9IltCiO
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
	Mon, 9 Nov 2020 19:47:55 +0100 (CET)
Date: Mon, 9 Nov 2020 19:47:50 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Tools backport request for Xen 4.14
Message-ID: <20201109184750.GA15148@aepfle.de>
References: <54fcf6ea-f400-c96a-cde6-4f55f909c2d6@xen.org>
 <20201009184930.GA65219@mattapan.m5p.com>
 <24489.33893.98470.334969@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline
In-Reply-To: <24489.33893.98470.334969@mariner.uk.xensource.com>


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Nov 09, Ian Jackson wrote:

> I have now backported all of the GCC10 fixes to all the supported Xen
> branches (ie back to 4.12).

Please consider also these commits:

55ab292c42 stubdom/vtpm: include stdio.h for declaration of printf
c3999835df libxl: Offer API versions 0x040700 and 0x040800
f1d376a825 stubdom/vtpm: add extern to function declarations

Olaf

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl+pjtEACgkQ86SN7mm1
DoD1BA/9Gg9b0zo6Qi5EPG7FDNvel6pTPwzUxNgrGXPWntBLyD+dUar7R8Eo48FP
M6QKT/IeqGoyV1CHhS0R2I+npCzYYzxb79/g1Rrt8Hc5BflyLb7ucpHJjwQj00KA
piIwpAeT1cgJRkZsVEewQT9E5ehQOO3xpYX1SV6zXMswFJlZdU8aAwzq3gBREciW
YX7V5M0sgtzOsp3cXl2NCEHa6BN7xnah90DKTDW2qJ7IBFeD2WnkXWbD45ivxJH2
6xfalCFf6tyzNlwQKG6ij3R5RTwAlxHUlbCz2DMqK4e8lY+FP3y0d/ZhZnAXV4RA
6y3UFhVg7MYK+4C7s7FWqWQgLOeNyUVJ1SrHJScfIK0bctrVT5k3fo+lo26V6U9n
tP8Oi/pP1kFJ8pj05g1hul3xUjqO4J23yLrvBF4Mc2YaRotlM74zhbP2fLw1R7au
kFO7Ge1JlUJV6OwVU6D4nPOFERgaWG5u2sdkdI9xe3TVxeKPST2PuqMkrjRBWA3j
tuFyqZ0VqSgB1ZEchqH9O55gR4AhY4TQz9T29z0vp7I7QdMAo93EJQJbC1I5cRIJ
7rSX6bOCGCTDqCV9UORqa1e9ZmQuwt1hwzcsroFgn/3kRG97aTaCQWOSpkevrQeu
q54bIkoMawShunhRhH8bAMJWDQC6uQ8eICbTYcIZTjaj3Ul7a/Q=
=3BMs
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--

