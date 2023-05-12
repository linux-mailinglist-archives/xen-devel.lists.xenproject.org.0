Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A98EB7006D4
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 13:29:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533792.830733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxQxb-0000PF-SZ; Fri, 12 May 2023 11:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533792.830733; Fri, 12 May 2023 11:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxQxb-0000MW-PK; Fri, 12 May 2023 11:29:19 +0000
Received: by outflank-mailman (input) for mailman id 533792;
 Fri, 12 May 2023 11:29:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3Uaj=BB=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1pxQxa-0000MQ-4v
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 11:29:18 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a2e6d43-f0b8-11ed-8611-37d641c3527e;
 Fri, 12 May 2023 13:29:16 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4CBTCJIz
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 12 May 2023 13:29:12 +0200 (CEST)
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
X-Inumbo-ID: 3a2e6d43-f0b8-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1683890953; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=HqkWQ/TLEvR95XxBJ1DQ8CV31L6NrxpA3As6VHVlPVd4G9TQO2IWm7pfKlOtv9XqDM
    AFUFZ/ogsTPWLz1To3INbkl1Hk9/xDDtRN12yBL00iAv1yN9ZgmhVB3fLVtLI+jCsPHd
    ApbRUZ4XD9QVG+bz2SHMOMXtC2dSEvBD4euoEP41qqcsOTt8lzX2EVozW7iK63MYBj+l
    ii3/jObAopS3fD3WcLL4zALSc7EwykGY9kVn5YHTg49TsYgfXuYOG37usskN8moHaaNi
    of9rhDWXP9ejCuSLIm3GwkAfyKStvljPWDGrpgtF31GPgh5/v657Qr7sou9rAM7R3iMF
    fAfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683890953;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=tE6ZYixG65UnttHybhoHc5k4Gq9LVP8y0+vdkXhUX+Q=;
    b=BgtmZG94n7YIRz4DjnU5g4LE6NAUOTajNfxxi9aLfZizYhwhriMcoqYecXFiC8rzND
    IOL2eogtKWPRsk64q8rvo4b8aXSO1O0wmUcaZVXkZJZJxVPE4q77x5FY8awseCGBTTZG
    Tz71P13548X4LH9pXxF4cRTF+FEbT1HM99l3JV5HoPQGHXYGswgiN0S8OT/ngWv1iz6W
    3iszQe3B7NV4pbRkP1tNaukpc7ZHF0j/eqz0yOZ9OdR9l+Wf0avAnFEr2tFxiXu5dTH7
    wn+MHF8E/0v6x3AnpY0vGiwdrxNFBsQBZBAtFvjRkQ0Pb5dyvQDMNXOEA5yyUa34RewO
    E1iQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683890953;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=tE6ZYixG65UnttHybhoHc5k4Gq9LVP8y0+vdkXhUX+Q=;
    b=rtuIG7ZX0jWdaR2OpQoO9i4uALwDIcx0flTuuKDl9KaQVkflt6WxJB8S1YhrXwJY8U
    3bJvcQ0hHBLkjXgVlohfqHKPIO4NSnspTe5FCQI/mjUjEvwM4Ef/TK/xhO0FV2WoSQQ/
    uSTygKfUEsBfdlP9Y6nl0lEUfmAgJ/nNIig37RNCHsA+nP1TerRFIiehoEsj8SdQW9bb
    2nD0u9FqHposWdH49S2JHiFl7oOLOEc1fJqALi6k0nRPtOrN5cW/1cxCgsBu0B4Zc5ZS
    Y19ksxIN4Bhd43uytQilaC4G6asVB/QlGWC7VDmmRVqpU32FbicVJ6nV30E1qNeOfgYB
    xShw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683890953;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=tE6ZYixG65UnttHybhoHc5k4Gq9LVP8y0+vdkXhUX+Q=;
    b=XKNwrKE16kVT5BXBvY+JXV4zmPc5KyADNgT9LCERpxC+3/k4IMZl4/t/K3qpSuFlBN
    mTqUODH5Ln6CTemJpvDg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR4ARWIYxzstZKeVom+bauo0LKSCjuo5iX5xLikmg=="
Date: Fri, 12 May 2023 13:29:05 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>, Wei
 Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2] Fix install.sh for systemd
Message-ID: <20230512132905.23b87694.olaf@aepfle.de>
In-Reply-To: <3d0b1c1b-02e5-a0f3-221a-45dbdba1b411@citrix.com>
References: <20230508171437.27424-1-olaf@aepfle.de>
	<0785a316-1920-f5de-61d3-ed21ddbff0b9@citrix.com>
	<20230512131819.02b3a128.olaf@aepfle.de>
	<3d0b1c1b-02e5-a0f3-221a-45dbdba1b411@citrix.com>
X-Mailer: Claws Mail 20230504T161344.b05adb60 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+k8Kho5OzHg9lFOIZ9ZB9el";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/+k8Kho5OzHg9lFOIZ9ZB9el
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Fri, 12 May 2023 12:22:08 +0100 Andrew Cooper <andrew.cooper3@citrix.com>:

> Does this allow for making any of these files no longer
> preprocessed by ./configure ?=C2=A0 (i.e. cease being .in files)

The path to hotplugpath.sh is variable, so each consumer needs to be a .in =
file.


Olaf

--Sig_/+k8Kho5OzHg9lFOIZ9ZB9el
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmReIwEACgkQ86SN7mm1
DoAgcg/9GMkV6h2abB5E3pll5DBRROAChHnOW6vALdODJzvrMHPabTlnIzFX+PFq
geeTPV97A5BOllCpHQwJmGNab+vCp282mfLhb976253sU5Taha3qUndjXo+RSi+s
re/9w7C4+TP1H3/6VDnS4TEZ4HoaOgXMRAjzrj2SS81DE4AdnGdSKa861zVpXeLW
ifG02POOY1BM1GMUuH0lEUdZR3F75re28PzVNxVvJFCBGFbtiLa4t1qDTvbhQQ8x
7UMV5yZ5opOQQ/94JxQYk/adjuDyDsucCeRQAE3De0RzNk9niGlC0dMKQKbW4Ik9
HJn5hS0H8/wIWqak3RHI6EWe8/vueWNz7UQ3iLAKBhsHCQ095qVWRkN7i2NyLdxC
e5aBF/OjR21PTUjqrfKT3+sz8O5+GZDCuft33HmtipqyhBGYaSDkAypMNTt49cYD
dBKkwOqUCfQkqjYtbRTSu9GN5NU1YhQh0MWoYNWjDlcF4ELcbEnrh1OblHjm6JFX
PNAGIE1g9iStYxUeHCHkWx6MCLJeXXQ+aMgnqO6TEHHkW9rPULgx6iTuQ/LFv5Nb
6lQuS6TkDEsJSrBSazLFoikE5g7s15pLDwDMaQbBFpT6FgsWRY2aj48rHuk8z5cX
5y7CE7Q7eZndHNNwCx0L95Gkr+2PCsbjcmORuiLfxGQxf5g4SUU=
=5CZE
-----END PGP SIGNATURE-----

--Sig_/+k8Kho5OzHg9lFOIZ9ZB9el--

