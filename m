Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 353223A9E78
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 17:03:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143364.264270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltX46-00076a-8A; Wed, 16 Jun 2021 15:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143364.264270; Wed, 16 Jun 2021 15:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltX46-00073x-2o; Wed, 16 Jun 2021 15:02:50 +0000
Received: by outflank-mailman (input) for mailman id 143364;
 Wed, 16 Jun 2021 15:02:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltX44-00073p-Lt
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 15:02:48 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3101d6e1-cdf3-4913-ad6a-c3a5d47d3639;
 Wed, 16 Jun 2021 15:02:47 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GF2kuV7
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 17:02:46 +0200 (CEST)
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
X-Inumbo-ID: 3101d6e1-cdf3-4913-ad6a-c3a5d47d3639
ARC-Seal: i=1; a=rsa-sha256; t=1623855766; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=KvW1hzRFySl5uI0enubpqYuKtCTNyuoEmbDMlpx7AGSdfH9QMeVrDvyi+69KtSfw7a
    3ILiwtbqCnFJHmWKYHQtvkdICJjRN0VXzctgUxn89iLibn3gQhtqDRij/ZDo5a2gAfXs
    R9WVkwL4i6R6gAEI6UBZSJo4YtFNHUFYaPXsTKzQOm4T2dIWB7EoAiO3Gi9pPBF8trjX
    7L88TCTEpeY+iLW++7RQ7xV4xAUw/X1UPiBR5tYzF5aHRQQNHiwO64doPoL02Ysg5sse
    iada6c+PxrSKHtuiAd7YyRzgxxRgiZRG3oBXNeeKPQAw5RqEDhZu+98KEfwNMN3DS/42
    e/AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623855766;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=MxdCG8G3tmZS3gwuCaeIcp7C7dm8wsQt/HqzUW435yI=;
    b=RvjStZrCth4DBQ6WI4e16hH4CHpEwFv83hjbrIGAQPDpuUwaXXbNhSg9/kCoOEt82E
    OBgiQ4IF5W6Ai4iHeCPZQiYHuseIlgbngk6mwha8d0BpvEkRZMUHQIMMobOcWoZC4ng3
    qqdsW0lo6H7Ln6PJQYRfrr7Ru4J8oR1PY8MTbX7tSr1JNiOAdpzlsI2Cdo9NDOSbxVDw
    faCl0IhgxY6LzPV99M+Y2thxjGr2AeK46QWi+DR0zxCWMCgDxUY/c+y228q3GRC7WDzw
    C+9rRWLReIU2Aj5F7f87CgS9sCmAa8GiBsQhPje+qgOH+RZ5Jj+jdLlNnQgpUm9spyw5
    P9Uw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623855766;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=MxdCG8G3tmZS3gwuCaeIcp7C7dm8wsQt/HqzUW435yI=;
    b=ME610usUe3eedHJtHGdtW/ADg2yGHkZ1C8oNf+QOhH+uRNJMEx9d23N2q6YKYdzBX4
    xhPFVUwel5CtVMSqViTYOUaRBUlcvLgQpNyy9O3Z7EAi9jciq1vFA1Vi3U3sVRylsaj9
    GVLDGK2LJ1PhOw9/6M+eApAQLzUWezloMdWF87Jm2b9WJP/cee7MqE1LEKxcWFxfPTae
    LKrq6X94IRfMk7kpYzVDqFiJfiKfM10bZKH4CMXYIWxSVR1oj/b3VLhAW2oqZ08yS//x
    tHfVq8uIe8SP1F9njibmxiE5nNYRT+IjyvV+4R9aKIs4j1UhfLZ20rdYdiIbKOHUZOE8
    HU9Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisQsVxSIbR7sf0kebs4Z3Zpqv+Sabl5o7CzRq+Ps8Q=="
X-RZG-CLASS-ID: mo00
Date: Wed, 16 Jun 2021 17:02:38 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v20210616 00/36] leftover from 2020
Message-ID: <20210616170238.376cb13d.olaf@aepfle.de>
In-Reply-To: <968713af-3c99-3fe3-8378-9d9c3985098e@citrix.com>
References: <20210616125129.26563-1-olaf@aepfle.de>
	<968713af-3c99-3fe3-8378-9d9c3985098e@citrix.com>
X-Mailer: Claws Mail 2021.05.24 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Boa920dlP4wAxY26fdCZPK+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Boa920dlP4wAxY26fdCZPK+
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Wed, 16 Jun 2021 15:50:24 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 new_max |=3D new_max >> =
32;

Lazy compiler? I hoped this is a compile-time constant, which evaluates to =
zero in 32bit builds.

    if ( sizeof(unsigned long) > 4 )                                       =
    =20

I guess a #ifdef as it is done in old code must be done.

Olaf

--Sig_/Boa920dlP4wAxY26fdCZPK+
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDKEo4ACgkQ86SN7mm1
DoCVew//dh8U8RNU6ewCoKH3Rif8Hd3AOJn1r8Y6EVtPcs6ju5+TxYZzIhHryqM/
P3K/Wu+LeFlZ4NWv7Y2jyFHmEu7H4Gw1albGxCDNa+DP3ldjd75FR5eAY8DtFhmU
/LSOT84lDDkEsY+ID17BfgYikCNP44brNMyWEG73/d0764cH5r2LQ/f10EslpUYG
n1VsiheNr06jL21Z/HD8d9i5BRdobSGq328vmL1nSPQ4ITz9kWhLvT5H8WpriiJV
1Om2a7ayl8eyJoWR3KkSvX+LJJBdg110kBlAO+mFAVxSNzyuJGnv7D/BjcmD7Ase
g6WlDL6Xlcx2Kn329Hb03sEAlLl/aaqOVdcj4i+/bmXb/BDlhWDIC4Jb43w/Igj5
VUO+/ALOdBoGJlOs+TjErfBqdj5uX0AV3mfEWNJugB0/hFssnFM2s3eBTOK1D3GI
3bJ/bEAk1fE0IfOszeZq4ZgMxCpjm+m3kjudYOPiR5crJJRai2c2pOlIPsuQaakL
mbWnO1L0WslI3ZxLhUXsvt4P9Fjd2XqmcJBjBrowOZG7xY8Fe6vPzTHZY+HC38Dz
DHXMvOP9SiIsrxRtOrcMPejqUnh5cIhVukFnKVVkmNc9KwSBcmfr6M6Zr74xb5GP
wg9tNg21sF5Cii1z3laeJ2qyWt8JlhB+SX2Gw3DGrg2OqbXyWnk=
=0WkU
-----END PGP SIGNATURE-----

--Sig_/Boa920dlP4wAxY26fdCZPK+--

