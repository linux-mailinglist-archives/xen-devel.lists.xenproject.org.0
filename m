Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C323987A4
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 13:05:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135959.252321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loOgj-0002oN-B5; Wed, 02 Jun 2021 11:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135959.252321; Wed, 02 Jun 2021 11:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loOgj-0002mQ-7N; Wed, 02 Jun 2021 11:05:29 +0000
Received: by outflank-mailman (input) for mailman id 135959;
 Wed, 02 Jun 2021 11:05:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NSCb=K4=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1loOgh-0002mK-97
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 11:05:27 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.54])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c982436f-a875-4d01-81b8-d2dfc6ae6edc;
 Wed, 02 Jun 2021 11:05:26 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx52B5K4P7
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 2 Jun 2021 13:05:20 +0200 (CEST)
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
X-Inumbo-ID: c982436f-a875-4d01-81b8-d2dfc6ae6edc
ARC-Seal: i=1; a=rsa-sha256; t=1622631920; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=oBwNBlC4YklEwQyOooA0XQdZdLPTkql78IQaU+Z5BpHmb46oXZxLJrPwFMXuZf6Q1s
    iDereLW2aBbtfmjz7NixaZPr837ersCZAbndvmJ5IixFGxt9rfGZUbe4J1f6WRXD6vY/
    0e37QqHgBuYMAirUhtVfLRz5J4cFr7R8hc1i2kMTsmpvI1yPtMpytBApH1naUppRka3Y
    JgEOnN9SmjqWjgkFvDL8sy3h0KIIz7gmGaBcuG60Bfir9mlnTO25vDQODYXTSqZaSjEZ
    pOCOGC+6lbJukUDSHl4OAzm0glgn4EAsKMC+YyNY9ZqcpPKJ7WAu3XBFDJLltb63+0O6
    GxYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622631920;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=mmwAcczl400Nz90EdzHL45etZJkSIEL2HdzsRVjHS/o=;
    b=bcxGcFYlC+ShPevvdADUhieQGevYTDPSercDItCAapvcu07LfQYYPBTEY4oGSa7PsB
    Kqc3dGka2UaVml9JP5Jyod8wY+GWoxy//VNrnjEGPwXMRPuF3mwrdqtVPRR6aGU1q7/+
    Zow06NU779h+L3347dji+c9d9vcJ2I0yU1+jyCRe4oY/u/VyMs1sjCOdCuDu3l5FReqO
    dX00Aq+jeAhmZcUzoeARHbsN0bfU8S0ZHKXL+s7WeXfdbSIz8F+poR2VFOPKgES76pZX
    3R7+PpvbIkZjrKmklXpwKuHE1YBMzuopTQWxUdSmSRjApuKkVxqqlYVQeCZPHOtArGqm
    1GNw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622631920;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=mmwAcczl400Nz90EdzHL45etZJkSIEL2HdzsRVjHS/o=;
    b=PanaoPCr+7hjucM0F4O2Ds9KgaWZflyr1ZUDs1drZHm0VizBodZG1zLXhCRcoiGPlT
    7NfdDYZgDzP5RhdKGWtC/GxieNBGi1nhGNoEzpgbSvAj3IcmFq8y7Ez3CPnbJ9/6kBck
    vUaITkiwJECSu0AeBsCSMdRJPzmI3KHK21A/rZvh0sDA/kCg6bH7V1m7MUNtITINF3Wc
    ZGWR0UJMfH9+ACWXZMrmqFIVL/MKippuFZWR2CmiQPYyIB4KhMrg0dGMXz/nlp1meXF3
    HpPAGkKjRrHUdJgqSxRE5Xm2/LkPdpltILpvRVhCmn2BAvXdQU8wlALNn2ACuUJFbeIl
    gxAw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF9Wx7WbE3s+BU2kLCYUBd7t4vRd/ulzKn4R+Wk"
X-RZG-CLASS-ID: mo00
Date: Wed, 2 Jun 2021 13:05:11 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v20210601 04/38] tools: add readv_exact to libxenctrl
Message-ID: <20210602130511.79c4eb15.olaf@aepfle.de>
In-Reply-To: <20210602125710.0607a985.olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
	<20210601161118.18986-5-olaf@aepfle.de>
	<23783088-dc59-abd1-c66c-5fcd314d1f5c@suse.com>
	<20210602125710.0607a985.olaf@aepfle.de>
X-Mailer: Claws Mail 2021.05.24 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7t8xgqfuvRz/yde5nnr0v1d";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7t8xgqfuvRz/yde5nnr0v1d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 2 Jun 2021 12:57:10 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> > This will stop the loop, even if idx hasn't reached iovcnt. =20
>=20
> Yes, it will trigger yet another readv().
>=20
> The "while" might be a leftover from a variant which used repeated read_e=
xact to finish the function. It should become a "if", and the "len =3D 0" c=
an be removed.

I think the code is correct.

The while() loop checks if the last iov had a short read, and finishes that=
 iov with read_exact.

I will add a comment, if that helps.

Olaf

--Sig_/7t8xgqfuvRz/yde5nnr0v1d
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmC3ZecACgkQ86SN7mm1
DoAycQ//TEQ88cyhy0SnmTPYQT6HV2VnDMSoLRnznJfN7S2Up7OJKQjZHPsoCIrE
ENwPfTky6N6QrCYWccFxY3zpv6v9aXWgLZBksqmmP4eGm1KMTgEUHCrFX5BI9Hir
DRJqzugpz1gzDns2qgKhVYfiiHlDonF3TOT4zal7V3sCU7gTP/Qv58Kxdw6O0pHD
fuYB6m4MGQYC84GC3YHK2/ikXBWfn4MZjrCBCjVdrOe1yUmIxTCVAYnPOrpZQtg+
8aSNNj2qpi7MsJaPHyzrSfNvs2t3BdcYySkzvvGjsJACtXOoLWw+XCC6uGt+IU/U
xJQwe/aW3M839IKhSf9FUCXQrgRcwpa6MpJlfef+0LzZTytFm3gvWVt8S5wtHwmn
LKUbRcqzbiIrAuzX3uU4bfIEczvRbFlKlwDDALDeZupJEa/C3OrKoH7SnV4Pxeac
ZXqLbafR3iRShgzdai3aHz9qm/cWoZCPzsAzfxrHUnFH6JRhGp41HRG0N8IU1gW0
yb+VDtBuemginwDdWwclSi1CcUn9TiAsWZENXDoznXDd+HPU3vwUss5RBnGJ3ET+
KC6pI+ajA86yq5qCwMAkKwoxP1GC4LMNFmC7Sp7OOCkPz+qKRdspfkDNcriwqXcm
g4NEcP5RQ090smnOv+wlcmZkfxgRpmSPCng8qBH3A47V2l4l/E0=
=XUOE
-----END PGP SIGNATURE-----

--Sig_/7t8xgqfuvRz/yde5nnr0v1d--

