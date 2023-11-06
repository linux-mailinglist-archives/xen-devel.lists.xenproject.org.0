Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6227E1F09
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 11:59:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627910.978818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzxJx-0001We-SF; Mon, 06 Nov 2023 10:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627910.978818; Mon, 06 Nov 2023 10:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzxJx-0001UJ-OG; Mon, 06 Nov 2023 10:59:05 +0000
Received: by outflank-mailman (input) for mailman id 627910;
 Mon, 06 Nov 2023 10:59:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DhA2=GT=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1qzxJw-0001U5-Gq
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 10:59:04 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f10d95c-7c93-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 11:59:03 +0100 (CET)
Received: from sender by smtp.strato.de (RZmta 49.9.1 AUTH)
 with ESMTPSA id 0b3125zA6Ax2mGc
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 6 Nov 2023 11:59:02 +0100 (CET)
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
X-Inumbo-ID: 7f10d95c-7c93-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; t=1699268342; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=bFuA7owH4v+A2nizifOQqXwr6xMdGPWSCAv3xhb6ArTYl6oEoE+Us51pksvJ04C9Vo
    CHpkLeCUnet6O5l40eoQrKgh0yl5QeYg2BMapKOYYs0XjgZnG7QBTaj2D2+ANPxKVDG/
    JaaER43Um1u7tNBkAjsxU2BFc8iGyoByPlUGR84S7OENmjC+PuBSnvqrF68RYxSzWft7
    kRFOfnUBVg5PSMKXvCEBSkUsieekWPWoS+weCRA38ChtoGNWgDfnTwQJQKi1J45NxZCw
    6zfB4oeD/Wz3yBxLVB5ogDTNCcIm7ZKjluwLhZBvsfoG9BILUje1vE5L+rR+hsvD9SAh
    3G4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1699268342;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=s1opiu+sP0b9Q9aml9+moy2gSuLh4TtEsvY0kONdsBQ=;
    b=NGADdmYeQ6v0TSqvgxWdKd14V9EKtSWyVPg1jEv/jlVLGPNRttr2cLojqFLRsPMBIF
    tUDvFUzSexA9oge1PZREKHOPhVBFVMZuzTSQx6t9HgQZmJSFi96/UI/0Gu2Ga9L+ry8w
    3sGtJzft0koFAGqPy4HOJnwPM6vqoybVjPc/VeMKpM/FHzAZ5ULtvdFnpFnCH8hEK1Ey
    VIe7as52vonEtL3BNrxqZQSMJ3eTuVsvV1XnbAAKr/TIn/AoUCIA81Dp7c99/v7D85xW
    C7NwXBlLB/ABJHXDkTH4I880sRxmwhztdaW+eA6sqWRByvlAHnSptC1c5S2/zQurg4bn
    ooxA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1699268342;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=s1opiu+sP0b9Q9aml9+moy2gSuLh4TtEsvY0kONdsBQ=;
    b=j0vPn3AoyiC/1PdOay2hQVsxRNAp0enEPtGLtpxmY6k74E2duaBOvVZWMQrfphUsjs
    RgKa8Pco/DjfjtmOX/w2/NENdbTo3D/ER5U8RsPXbBdO2Vmu7G+h8p24xB0UhaOQ0LZW
    A0eWlrmOJl4/CrqNAfWTe8oU6EzhCo1dLexf4cLNiN4rHaF7R7YhiQUKKE6YRkCWKTHX
    mYdv12OQRWHfWaciFUDraCL9zVrVVXByjFjTQdVQrMQip6kzrFg+NoI9M4gFQ+yzfpci
    dFYrFJoSNrHBGqwXPJQGDnwbwO8N5K/67V5Es96TLOm64JU96+Got3fsERgHdLAaViNp
    y2tw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1699268342;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=s1opiu+sP0b9Q9aml9+moy2gSuLh4TtEsvY0kONdsBQ=;
    b=i28BquZQotovZpBHgNDVmfrdl2QYgv1Aa6HD3xBDXIV+3sP/d4ogMKGOAxEPrX1sJB
    nrjyWl6KkheGwiS8I4AA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5BhaIaRnsNaqJN2h0dTFZeqQ89seVgD7Tlo9gNQ=="
Date: Mon, 6 Nov 2023 11:58:52 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] tools: Remove all DECLARE_* op macros in xc
Message-ID: <20231106115852.31df968d.olaf@aepfle.de>
In-Reply-To: <20231106081946.1055-1-alejandro.vallejo@cloud.com>
References: <20231106081946.1055-1-alejandro.vallejo@cloud.com>
X-Mailer: Claws Mail 20230817T113819.a897c59c hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8tl.52dIfAi_EQHgOYW1sh0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/8tl.52dIfAi_EQHgOYW1sh0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Mon,  6 Nov 2023 08:19:46 +0000 Alejandro Vallejo <alejandro.vallejo@cloud.=
com>:

> +    struct xen_sysctl sysctl =3D {0};

What is that zero doing here? I think a plain {} will do it as well.


Olaf

--Sig_/8tl.52dIfAi_EQHgOYW1sh0
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmVIxuwACgkQ86SN7mm1
DoDeWA/+L5jKXs81KmCTEY/W1wbM0Y0XFKF+0HtMGMg8N/9i9DQ6a17TkW+NU/3i
QksXhp7PgyqK+yxkNNFxCw9UUyUePc77sMatbstGOri5MiSYth30ufMADvzo1a/o
Z+Yq9ur4qvpL8oqqoKbSqzuj4hG+Yh5BulgTzW3DmsqKiObMql1HBp0f8WTVtURK
vz/MWMHK1g6DGVP8otHRK4s1QT84uxTCLUScUWQlCivuzVUm5sYImJ0Zhs9B+SjP
t7V+DtT8iTQGaYvI4qjIrCHzsvwNH4W2aRUALu1gutd8g4Xqb4YGXqqQ3ki4VNo1
RDBLhJ7sZsY//Bbwqd6+IJT3UqUxE+V8VRKjeugk61QeCZV1Hd5jU5uJE6INQi4c
OfRf5kkofYBgMLhagXvII1S9XXLqbpu+Ia2HgpR+qiD+m4cBtKWo+WbfQTJ6GvCb
KV0rO0cuUpTP0OrcV6Oqj6ptUze7IHUiVJFsHNoaGGA2JxeUuPdSj/vJ5ehzjnza
wJzZrr5QH10OLheCa7jystWfdeCsrMzWmX/kpYgRnM6O3XMmmO/l67XdF9z1pLDE
AwMdIb+DiZ2AdAKzFlnuyO1QsHPLQHqf0sYP0LDs2UBOBfPkbcVpnav+9FsyuUNm
gZBkIvTzfDc8RfJKmNca1tf+vix4Qnugp084pZEdOgrxxuzc5ec=
=h/VO
-----END PGP SIGNATURE-----

--Sig_/8tl.52dIfAi_EQHgOYW1sh0--

