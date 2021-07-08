Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C293C1593
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 17:01:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153204.283042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1VWX-000659-ST; Thu, 08 Jul 2021 15:01:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153204.283042; Thu, 08 Jul 2021 15:01:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1VWX-00062o-PU; Thu, 08 Jul 2021 15:01:09 +0000
Received: by outflank-mailman (input) for mailman id 153204;
 Thu, 08 Jul 2021 15:01:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Di/c=MA=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m1VWW-00062R-0P
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 15:01:08 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.54])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51e0a116-dffd-11eb-858c-12813bfff9fa;
 Thu, 08 Jul 2021 15:01:06 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx68F14b4V
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 8 Jul 2021 17:01:04 +0200 (CEST)
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
X-Inumbo-ID: 51e0a116-dffd-11eb-858c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625756465;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=1jjthxlov89BXy9H91jDQWZa2UZ5mwf9V2WpGOOXsKk=;
    b=b39JeAzulCGFKknzQ3WRo4pUR3zaVuB0nIYcE7TiEe6UBTR4n5bCd8ImlqTD24QPh7
    e+JxDfBP+0myX0IqJ8j5P9r2e23dLuFSov6XQOZhUFxH+0nIboHmYIX/lj6l0XuLz0xv
    oqecCoDXJM1KLBLr6+qvCrmglG3CLnnSrwwjJyr7OLn3P2QR2fB+J6z/Fl3i/Ozt6eAS
    73LjgUnaWTVYbKZXl+AIRaBdvwqZl6WZs6shBlVJoZNybWELA0PIOjobdMj3GyP5kdbo
    yIjg0vY2tsB0FxQtH0ySXywT+6pjJlMM0mXEJkcYTem3sloPOx8cyzmVHk9rws5V07zL
    9L7w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Thu, 8 Jul 2021 17:00:56 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1] automation: use zypper dup in tumbleweed dockerfile
Message-ID: <20210708170056.1286f34e.olaf@aepfle.de>
In-Reply-To: <5710b7ef-5779-6a60-e679-86aced373f4a@citrix.com>
References: <20210708135704.25626-1-olaf@aepfle.de>
	<0b16fc43-9b5b-1edb-0e21-024bd9cd9708@citrix.com>
	<20210708163352.08da715a.olaf@aepfle.de>
	<5710b7ef-5779-6a60-e679-86aced373f4a@citrix.com>
X-Mailer: Claws Mail 2021.07.08 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2HlWygWkIvjS2tOm+XR4EaX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2HlWygWkIvjS2tOm+XR4EaX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 8 Jul 2021 15:44:34 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> Please include it in a series of any/all changes to the tumbleweed
> container, so we can commit all patches around the same time that we
> update the live containers.

I sent out two individual other patches for automation, but nothing substan=
tial.

I think a new image can be built with current staging, further changes will=
 not affect the contents of such image.

Now it gets up to the ipxe failure due to gcc11 being the default compiler =
since a couple of weeks.

Olaf

--Sig_/2HlWygWkIvjS2tOm+XR4EaX
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDnEygACgkQ86SN7mm1
DoD3ag//ZSoY2RJGhOq+aiYLrv4Tp6/EXuXFXcfgKtCAyrNpHJCl9ay5e/AzR6y9
KRSsjbmIas4adk97VJwYkByLjn4pa0fSZdeqeFmQ0bpVd3IbtaBAnRa3T7EC1iiZ
08Dlx9e9OLWbhQ//kBkeUiMOA5Dxt9QsKT16CGCcm4o9XvnfTWBbwem3t4WIz5ZJ
fkIvWewm4yqISfWMMajR3xr30T9UKtgt8mMJGySNytwL9axfXIDFOraoWMjLOpEf
Kv84WhMTGUs9utwfWUYI8jfD5f0f6+3Q6IZl0UNDfDIae98QYkWdrMrccbwzJF29
dJNAvfs+DUP8urOUyQ0H59thTF2a8pYWQllQ9bLAf4vCouZpFVvsI+CHwn1ny77s
1UxrFOYEr02zw0+zpZU2+WVzzsq5+ljF+2PROEVh1Du0G5jiDgI0o2P9pYVw1byt
jY80zGGSk1entvRazO0evng1QChdQXdWRPAtTbiR+BzRxhivOfsdP9XaGn5cr86H
PK7swxKW2OU6gJyMUhD2lV+XUfz3DvHb4cj5iRdaLRDHEVj6qTYcFJjGviZLV4Yg
AL6u6GesUY3uDbKYom/DDMifr2mfyDpvLID6iD/B1PR5lXvQLQWoBkCfBrSnx35L
jenms12cy9uMXv1xslEz8usz191UvgaqSi4usXncajnDXLDxQXI=
=JlpR
-----END PGP SIGNATURE-----

--Sig_/2HlWygWkIvjS2tOm+XR4EaX--

