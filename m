Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D01E3A9FB3
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 17:38:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143436.264369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltXcp-00072k-3D; Wed, 16 Jun 2021 15:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143436.264369; Wed, 16 Jun 2021 15:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltXco-00070y-W0; Wed, 16 Jun 2021 15:38:42 +0000
Received: by outflank-mailman (input) for mailman id 143436;
 Wed, 16 Jun 2021 15:38:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltXcn-00070s-Ej
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 15:38:41 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 02bcbec8-0e21-44d8-8b56-fcd97d9fe283;
 Wed, 16 Jun 2021 15:38:40 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GFccueh
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 17:38:38 +0200 (CEST)
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
X-Inumbo-ID: 02bcbec8-0e21-44d8-8b56-fcd97d9fe283
ARC-Seal: i=1; a=rsa-sha256; t=1623857918; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=rXHzJ8PefZYdVyW2zZc++KIaC/+smyKlvlKRsyM3bj2Zq53opkZ71rRHfVTqU7KCrt
    KLhgILi9mSubGpan0oGsxMtsm8kf4+r2ocMbhzDt7SRxXCK8eyNHR6y0k6srEiWvXHob
    k4RxEZbBAcuEBnLEhH9o6YlsE8499CQOx3lnE4s1hMogs2ClwscZ6mrU4XXeJRUMod26
    ZoRyn2CqjCpmfgHnQHtd2eq3btEOh/c2LCZWDG657jKrtkszIVtgjBVjeLdqR6JiAieu
    Kh+MOqPSJFj/Lg9zcQnRBCAM0P6jYHij/Gi169jBszYimZvLJqjz5xizDH+B3jumYUcO
    KSdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623857918;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Yqvfuu9UZegYYzHJL+ypLT9elgylsIYFTThnKpnRGSQ=;
    b=cD8VGMjkfhjlCL89hB95brrBZEvTVUNJKLA6jXklCQVTQ7x53+Ls2x6JYQdjrS6uik
    vIq9QWk0tAVXIwDWm+w3t7r9YIXo5UI4jeuYhOypgyNaTZnPrH+yqZcyNx/ncODH3SCG
    RQ3wcyDpZDYO2v8XrnVmo2iNnEP/6W1DvlO+QV1rI+pMVfuoupdvbaKHyh4xIVeSU+vB
    dEUDYlVAlwd4WvIDjna0vFUGrn1/YonnHUPWK7mOLe/RNCXUPnqn4OHrnYuCs5+IaU22
    UMEaNRmLlQhpGNGuiuBu8S1MldBhy5k629GfKnA/fksFhXQo6fEVsNfhoD5PrJCsrK9M
    G3IQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623857918;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Yqvfuu9UZegYYzHJL+ypLT9elgylsIYFTThnKpnRGSQ=;
    b=fSoTL3VCFwRlI2o+fKMeOK0du/MGqRZDDbzr0OC4Z/y093/Mn6O3Kozni/G5zYr1vb
    VzTDqQUJWeTnucvwnGLz2Kto0bt/4eRS+xDdDeEPmY6trew8STXJY2d7mEUMzjTPqAQ4
    jfnT0I+/+cAu5eqBmFAQbSK+nFdWn0gfSz3gwBSnC/qSMOOTI/0sUnnvpr4Phanxfxjo
    nms7INPTHQ47Staq0DPqDZuBoESwiph+tlfDklbKPRb+8N0yTcoLuUE2mBbNJD5EFv+u
    fxysv8Ms0sCAqgjs98MXlG3scFGGJiZzPQQyPLmdhAFcRILfKagrPjXipna4wGHqzG+R
    CzSw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisQsVxSIbR7sf0kebs4Z3Zpqv+Sabl5o7CzRq+Ps8Q=="
X-RZG-CLASS-ID: mo00
Date: Wed, 16 Jun 2021 17:38:31 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v20210616 00/36] leftover from 2020
Message-ID: <20210616173831.5e8214bc.olaf@aepfle.de>
In-Reply-To: <968713af-3c99-3fe3-8378-9d9c3985098e@citrix.com>
References: <20210616125129.26563-1-olaf@aepfle.de>
	<968713af-3c99-3fe3-8378-9d9c3985098e@citrix.com>
X-Mailer: Claws Mail 2021.05.24 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PRMvHEXRp7n8BNSmXZ70aZi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PRMvHEXRp7n8BNSmXZ70aZi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 16 Jun 2021 15:50:24 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> 32bit toolstack build

as in i386?
How is this used in practice?
I guess such build should be marked as CONFIG_MIGRATE=3Dn in config/x86_32.=
mk?

Olaf

--Sig_/PRMvHEXRp7n8BNSmXZ70aZi
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDKGvcACgkQ86SN7mm1
DoA8+g//ZAagq6PreHucLtraLk0capVlSKgSR9Xs2LArbtVmP+FmH3bFZhMmLb2o
IgdTckM+1TvUPEuOKFtFQENiomDAoc8kHjUT+xv6XpaQIPmY7u5qKAz5YQjPznyf
43pgvs/+7nqzbrL7pdBJWE+B3V4SaqVcThCKXdG94sV7MMFMJHaMw6KB9zRytsI+
v7CiCa8bRD6zr9FdNKaDWEWJeLZiltWn7kaVx+3Zup/H0Vg65sH5j3yhViHRE+y/
6JZ0fP7bENxyWwaxpbdVdKmzUDwrKk6pbtNV55tFHA97EDlOQqb1PYSefymNTZcW
eaD+asQ+a+p7Egyo46M9uwCtRR4dwdJaGkyn4nI20/xMfA3Gx8Mjyc6MhEtiOaKo
w+ilpH8+x7nJjRA32go8WbQUIT0Hw8x4JEi9/NQxC1v53vEEv1QvR6cYBF2GKJDc
eD4vanJugL/g/9zXE6L64wGtFwpylscTUtcDCjaaZOHCWuVehBOmEhE0lmPxAbBj
02wGzSvKsTvv5ifmcJIIyWR8jnXSjMl5tLxl/zPpbLACMQCXS6oHnpEy6hyBGNzo
s16eLtXUCR0PZ4pp1r4n0iY8iGU6rbIl6IbRnYaiGo9ca5TssbZTijum7hfjU2nq
az37pf2oSnQXH5bs49XRFcBGinkraEUb9myPM1+43fAuauOs8Z4=
=HFW+
-----END PGP SIGNATURE-----

--Sig_/PRMvHEXRp7n8BNSmXZ70aZi--

