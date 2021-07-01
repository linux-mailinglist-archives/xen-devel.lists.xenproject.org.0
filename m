Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A326A3B93D1
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 17:18:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148928.275261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyySP-0002ta-DD; Thu, 01 Jul 2021 15:18:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148928.275261; Thu, 01 Jul 2021 15:18:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyySP-0002qD-9Q; Thu, 01 Jul 2021 15:18:25 +0000
Received: by outflank-mailman (input) for mailman id 148928;
 Thu, 01 Jul 2021 15:18:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lyySN-0002q7-LK
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 15:18:23 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 916c577d-da7f-11eb-833c-12813bfff9fa;
 Thu, 01 Jul 2021 15:18:22 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx61FIL7Rm
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 17:18:21 +0200 (CEST)
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
X-Inumbo-ID: 916c577d-da7f-11eb-833c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625152701;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=M0ebOvnNW5hhMGkl7OSyZD6UvWcOLfEJiyQEs07Unyk=;
    b=Nd44gLvNb/EU0v4TzAYlo+ljMN/MkE1qlaaMUNq5FfVALjgVxFelHsVmo9k1GGcWPj
    dHmnjSGj34Gk5Uu+FaOKIpaczF5EXZ/j5sZngwNx61IUPDd/0NiKkICyxmc9fa5lVl/d
    SF1CIVHRciAJDQylULsq5wmOYjyABZtt58oZ8nmUbVuNVNIpHXO+twSawxdv6ZTPTttQ
    KmSc4idpFhvXDFQit+HlTdlhQVQmret8sWoSMBOAVr8V0ga2vlNGiNFKmLu706tbn53Y
    QdfW/DRBWS6QsLxaLKHhDsvkZxps8Hbd8risvDbKe2KQvNSqtN8VdFr3E0UOxOX/shXi
    i3CQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisQsBBSIa03sY9BUY2ao0oygRsMfcqA6zjDLeeWXNg=="
X-RZG-CLASS-ID: mo00
Date: Thu, 1 Jul 2021 17:18:19 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>
Subject: Re: XEN_SYSCTL_cpu_policy_hvm_default truncates leaf count
Message-ID: <20210701171819.67968d4d.olaf@aepfle.de>
In-Reply-To: <48cfe27b-70fe-36aa-833a-7d78e205528c@citrix.com>
References: <20210701125623.593fe3ae.olaf@aepfle.de>
	<20e828c9-e7dc-4401-9307-a6d72eb618d8@citrix.com>
	<20210701170009.5a8be33f.olaf@aepfle.de>
	<48cfe27b-70fe-36aa-833a-7d78e205528c@citrix.com>
X-Mailer: Claws Mail 2021.05.27 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m4YsW8EoIBaGu/zB3IzQXN2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/m4YsW8EoIBaGu/zB3IzQXN2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 1 Jul 2021 16:13:21 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> That logic is definitely incorrect, but using a different constant isn't
> right.

Yeah, that occurred to me after sending this email.
I think in the end the values should probably get closer to 51, not smaller=
 than the current one.


Olaf

--Sig_/m4YsW8EoIBaGu/zB3IzQXN2
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDd3LsACgkQ86SN7mm1
DoC3mRAAjJLu7G7sMzLBGdG25ssHNsvBfA1ylw9kf7OJ7Mp5Z3A7t9SLRGieSFIV
zMrSU0D34FyV7YMqS+UUO8o2tmWR9Tlk3o+aWRL8EYoRhwF+fsHYfsTUok1Kxge7
hE6rPCL0triPJe1iFrRRep5zEMruMDALmsrcu2VFTYz9S74cmpjkhE3fPmHgxhbJ
yOtP8R8xSUudPBBP64URngxEko8xtXkTVJNC77kEXYLWe2Z7T+5pYg/SykoXlNRW
BGODq2Rd25ZCPdJfmWhv1BQNodnV6mo907xPwe4+PfjMRm5Gu2OhlqrB44LfVzWB
UK7VsfXnCuLhIOsHg7E14iOHq64hPzQ9cFdnxdfaexoF+v7PGlEFUUW1jO9I+nfD
OfgAWHf7kbArEP357YCK2wBlLjzbs3EukaNmHP4QS9uWq0rlMgHfiaPZpxNP+Q9j
ZcBD0vHWv5jZB1mkdo+bl5By8ELsog0AxjvCJrsWrwHfGzOqDCWLVlSf7cgN+Bs8
Koak+qvGlXEIf30spvcAdLvIEwvS2edEm4tZv/M0XVa3Fl/l53EPYnIGegmbxPcY
cTXsEfzr9aps78KtmNV1BkFQ2I1AGIB6ohFXwJStnNStw7t7LJiU9Xic32NlwNDf
njPFX4SRsVlOED1np3A3vxF5/BwI2SyTn0Y2ZHKZ53YtOmCmr+Y=
=dn6K
-----END PGP SIGNATURE-----

--Sig_/m4YsW8EoIBaGu/zB3IzQXN2--

