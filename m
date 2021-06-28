Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EE33B5D29
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 13:31:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147797.272794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxpTr-0000o4-BI; Mon, 28 Jun 2021 11:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147797.272794; Mon, 28 Jun 2021 11:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxpTr-0000lk-88; Mon, 28 Jun 2021 11:31:11 +0000
Received: by outflank-mailman (input) for mailman id 147797;
 Mon, 28 Jun 2021 11:31:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fuEk=LW=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lxpTp-0000le-T0
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 11:31:10 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.50])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b422aef-a92a-42be-801c-3b9c06dcea82;
 Mon, 28 Jun 2021 11:31:08 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.5 AUTH)
 with ESMTPSA id j0443ex5SBV6Hvh
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 28 Jun 2021 13:31:06 +0200 (CEST)
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
X-Inumbo-ID: 2b422aef-a92a-42be-801c-3b9c06dcea82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1624879867;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=t6fonBeM1ZIQREKeKpKSaAJXsi23EtV7j1QuiSSldmQ=;
    b=Q+c1orLZitFnZAeN7Yzt+nbEcrst5qvNtAb1QIdM5YcGhznp3u+QTSAQkI7TETnSdC
    19ZetgOYUeIp8dO7+RX7a0oSt3lMGLWlG2xpgaacoUaCY4NI8QgK8e4ysSIdQYSlfq5n
    qinDFAFb2fuz9zIZSRfO4vlXIaZkW9uOc1iIN31iTvcvqDMLyScHIgwuf9re8ldG/uoq
    RBetI/Wdq8hAIcblDCEk6Yry1R58g7PHEjS8tTc1I3zpRih8a9vY+ND+A9/FiVnt+6kv
    ZauHis8+T97LhAIg/GpilTFxK7MN17lR2upJaNcUhb/4oIT+tibdMQ0PLDjnhxpWSHw7
    OEuA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF1Uh6FPk3sesKYv+F4ULcnddTEqNLurekxi0Bc"
X-RZG-CLASS-ID: mo00
Date: Mon, 28 Jun 2021 13:30:57 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger
 Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Juergen Gross
 <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 02/12] libxenguest: deal with log-dirty op stats
 overflow
Message-ID: <20210628133057.14fbbc30.olaf@aepfle.de>
In-Reply-To: <3e90f06d-9410-4778-bf93-61940bd95456@suse.com>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
	<46831816-a5f2-2eb4-bb91-aba345448feb@suse.com>
	<5e725a42-953a-c96f-3e72-f0c741b0ce16@citrix.com>
	<4e3afc8e-1ed8-2e27-b583-476d35352efd@suse.com>
	<20210628131022.3f2f2c4b.olaf@aepfle.de>
	<3e90f06d-9410-4778-bf93-61940bd95456@suse.com>
X-Mailer: Claws Mail 2021.05.27 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eBBqE7SmUe8OQCF/D0z=ws+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/eBBqE7SmUe8OQCF/D0z=ws+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 28 Jun 2021 13:20:06 +0200
schrieb Jan Beulich <jbeulich@suse.com>:

> But if a field named dirty_count was intended to convey the P2M size
> (and then only on the first iteration), this very certainly would
> have needed writing down somewhere.

Sure. Right now the only documentation for the precopy_policy callback is s=
end_memory_live itself.


Olaf

--Sig_/eBBqE7SmUe8OQCF/D0z=ws+
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDZsvEACgkQ86SN7mm1
DoBYtg//UY2SGAi3w0deuLxZDVoHWcWdBcDa6lrTa7f08lqCD2rP6Vu7qx0f7tct
WYewV4bT5QLSnG260DaR+KBdtlrNTOP7XFCkXrwtsQfYyda1vZji5FnetqMzj/Q7
xkAxJv+c5Ux3VJpHciX+S/mHPnKHYwQn5X9TLPgqrQQo9SzTumrZcvvxd31sxUO6
PhdOteOJy7jg93seguoy66AI59VR/cM3eEehRaEL2AEiwKoRvlzbSUKfDwGBs6Pt
j7UJqOiBnFKug8J1nP0vnVJwg6yzcV4W076EibzA017mVI5g8orVWqk4ngEed1ig
I8wGCvXKiUCTPOUUfvFRlb/aLE//0Z+Rpy+/BtFIt1mx3pEGupZ9pLnBGgVOdsUa
XY40W5uI+O28dcK+4Jpzta3SzYygJEnLyKV0eOltK8teySi7C+apWVyl0nHS7HXc
T+Ayt8xpdbh1CabylMMDuFpcdsdmTndAxHTbITjb4ujKfd5Ucz69SO4eLb+t2jaG
fJt53d9Ydd7P70jUYX6UxadBi5/FFQ1EGn+ETDCnGqdHbFaqPNz5nixqzDwGlnYn
pTiU+jY4bIxDrgK6giJiOuhaD8Q5uqN3TJ57T5TZC7MKb7S6DuFx2Waogdfj3Fp6
0pyNLjJ5zvHLNJ4SDb1MJFAV0c+SjlLc8ULiEBlM82h0+v5N95c=
=9fff
-----END PGP SIGNATURE-----

--Sig_/eBBqE7SmUe8OQCF/D0z=ws+--

