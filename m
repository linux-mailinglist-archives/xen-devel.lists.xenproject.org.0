Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8062239D962
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 12:13:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137788.255232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqCFB-0002ur-Uy; Mon, 07 Jun 2021 10:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137788.255232; Mon, 07 Jun 2021 10:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqCFB-0002sa-R7; Mon, 07 Jun 2021 10:12:29 +0000
Received: by outflank-mailman (input) for mailman id 137788;
 Mon, 07 Jun 2021 10:12:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rwXN=LB=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lqCFA-0002sU-8Z
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 10:12:28 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.52])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 30027ee2-e03c-4860-8728-2e4c2bf19c78;
 Mon, 07 Jun 2021 10:12:27 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx57ACLJmQ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 7 Jun 2021 12:12:21 +0200 (CEST)
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
X-Inumbo-ID: 30027ee2-e03c-4860-8728-2e4c2bf19c78
ARC-Seal: i=1; a=rsa-sha256; t=1623060742; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=OLr/5ShlgeeBLvCozNg2MV9JHyptXYfUADxbxBV/v9itscU2iGIpMQX9g7XHJN/kCZ
    11LrEmJoQlMTjuOE/MxCFICxLP3aNQoMECQsad7nxt+w085Tq67O3m6HUkrB4gC77/iJ
    2nniuORfQ+bl9IWTYe6tX4Iaga2PllPQ1I9uUdj1F5Tx4680jGkViiRKc72q0shvegaf
    8D1XaYaRd/nu4NzPXUbLgy+XLfioperULUiXWUxGVVaEOFpBqZnEYqmWq3f00RdRvG4p
    8k6kfvgqedTYY0Z1BjB5mDkUS18W1u/awUCjrlR3yWZV3hn6pzaW+LxN1PdAzSZ6Eqom
    KvpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623060742;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=nj/xaU8bzyMpc1TxtWyc6G3ndddmN0N8KicObbiFYYc=;
    b=A5vaMQnOGhfOhxc1c+24O5tTh/D6LeiErwgIhj0qAy0pwrWZPXn4Zr4gk4Z0rENjOo
    0Wl/+E9MxcR5Nkpo5s6t17lt5vOmGr/xRbOrTyKVp4PZT5R1B2nBzzeCohfuu3d4ag5B
    sg+jQtT7FrYCh1eeswYeFIujDFlNwjgzcqDRGKrThPvT838Us5PpSOL6YifW++JXaFSZ
    zfloxqdPbo5d3LSnK6Dwh/wM5bOElRjnTOEX7t8lZUj/bxMNAE2GQObosfwzqhhBt71m
    /OMqXQM6qGynsd06QES3PFgbicQdcKPb16jKjKmxlyQC1ZFRu3VH/+LP5cqEC40zKSTU
    ta0w==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623060742;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=nj/xaU8bzyMpc1TxtWyc6G3ndddmN0N8KicObbiFYYc=;
    b=PAQSTRR9sR/XFTEzIB9STLobwUHEA5ZGLowGj4Op1zXI9ob6J6za2Od8sbQbVTyKNf
    lKhrNQAHNNKN9BlUOzqgt8iJDcndYRNgYlsS0E/XVbigDLV/daD7w3blMSpS415TLI0q
    f/UswpOQLVFWYCOojDYh14if0GnJf1XRcPw9NqjAhwsSq9X0sKBt9tznd10hotp595Xh
    /x89fg3qak5YwrMWBIa8v13HxBIvSwL25vy5f2Z3pGTqDgjtJbKUTyhF87sRS2ZxLrBu
    CKrOAO9rZqXDhR4jIHICT2ENovSZ/7zq9cAVEJds13A6GCuj0lf36+yliwjSSdKJAscs
    BSMA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF/Ax6Fb03sCxOoTBq7r1dZtjiRLxxzC79Iv3HI"
X-RZG-CLASS-ID: mo00
Date: Mon, 7 Jun 2021 12:12:14 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v20210601 07/38] tools: unify type checking for data
 pfns in migration stream
Message-ID: <20210607121214.3119d315.olaf@aepfle.de>
In-Reply-To: <1e0a9a6d-b3b3-29e7-43dc-453711e666a7@suse.com>
References: <20210601161118.18986-1-olaf@aepfle.de>
	<20210601161118.18986-8-olaf@aepfle.de>
	<9045add9-0cd0-7f9d-87ef-26cea15b74cd@suse.com>
	<20210602132114.6fd9ee87.olaf@aepfle.de>
	<1e0a9a6d-b3b3-29e7-43dc-453711e666a7@suse.com>
X-Mailer: Claws Mail 2021.05.24 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a/28k5wF5whY5aFRaErkSBU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/a/28k5wF5whY5aFRaErkSBU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 2 Jun 2021 14:03:40 +0200
schrieb Juergen Gross <jgross@suse.com>:

> Maybe XEN_DOMCTL_PFINFO_XALLOC should no longer be supported, i.e.
> a stream containing it should be rejected? This might be a
> worthwhile modification of patch 5.

If there is a desire to actively break incoming domUs from pre-4.6 hosts, t=
his should probably be done in a separate change.

I have not checked if such migration works today with unmodified xen.git#st=
aging.

Olaf

--Sig_/a/28k5wF5whY5aFRaErkSBU
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmC98P4ACgkQ86SN7mm1
DoAaLQ//dDSVmXiWHoEiwlG0LDIC0ts3T1MEVnCjq13sJ1GTSgd5O18iMM4R2jcO
5nZ3ii2cMs/x942eMPOD2OXcr+fLQAY1wgwUrBoj1G1R/YetvJCwBsV3pYFvsGyZ
n+d/RWvIcg1JRd4cBXMHouLVCbpILp0nEmWVhTjZ88qpYL8VShYCTelCUAjpy47l
axpzf6rzzGwOJrJoSOL1+szD9c/46jLJBamrLxJ28izDk6OtZHH7wU5IVKr1o7gW
Ry5u3g2Rm62M3jXDSobYRRF+kmeus6p9WLxItSniErA17Fxz0ZOWwH0DZJT6EboA
hSNMLrk2lPS0uSCIQciEGGjBqIgoI+MYbLijx6RJkZU5krC6NAwgqtyjG2zPr4uc
SXg3yW6X2IUdAFHfF8f8u4cngnnuTfwBiTZAZhh97o7MzhanuZl7zZxwN4KCekV1
RhI/5SNg7VvIjQrD3/+v8WebkwiqeQ/Q89fA5jL7qdNEKKx8D2g4JEctHAQM4ZFa
TCss0CZq0BYtlmDj3wXi70d5pWeGikbSza7fO6YnxTt4Ftpf0HeZ+chO2k07pMmr
AyusAeSWstpaFTAJUHLu04NqAdQmV6KSwY2fA/6+K+3vfY/8kCW8FqHNOSGtnf2m
5dsVsEN4Oe2egcx/6NFHkp+aCSFcssE2i8e2M4hNIuqvnibXMpE=
=E/Rc
-----END PGP SIGNATURE-----

--Sig_/a/28k5wF5whY5aFRaErkSBU--

