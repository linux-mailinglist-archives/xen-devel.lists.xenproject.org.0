Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D03FE7F7484
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 14:04:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640680.999263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6VrT-0000mk-Ir; Fri, 24 Nov 2023 13:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640680.999263; Fri, 24 Nov 2023 13:04:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6VrT-0000jo-FQ; Fri, 24 Nov 2023 13:04:47 +0000
Received: by outflank-mailman (input) for mailman id 640680;
 Fri, 24 Nov 2023 13:04:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qY/0=HF=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1r6VrS-0000T4-7c
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 13:04:46 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.164]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0986e765-8aca-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 14:04:44 +0100 (CET)
Received: from sender by smtp.strato.de (RZmta 49.9.1 AUTH)
 with ESMTPSA id g1b15czAOD4dz4a
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 24 Nov 2023 14:04:39 +0100 (CET)
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
X-Inumbo-ID: 0986e765-8aca-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; t=1700831080; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=e27Lk99MGkXVCQlI9WZjRAI7s7c4N57GUKrQzLUgPyJg15uDGYIrfSiF+7APYeTVm4
    4As3I5vaZQbVmnM6i1aLugevakfXgJ2rplmXQiGGEavensy8+0MZ1o3fd+2DzEUzrKgZ
    VrP1szw2WP4IbA2diYTw8E4K3j8rvD01rVzL89ZzFMKtR89ZQaL5KAr22XSnUoti4s6N
    XDLf3KSMk49D9LAalRw5z7UZh8UlOYBOLjsP2J629OHiy0VUEgzgmck5+P6Is7hRilqT
    fcs1SdJIl2c7eL9h6sGyRyQk15RMpZToqpCL7jG5LFQUNa1asKzX/26Y5YDl2ukscpOt
    HGXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1700831080;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=9TKf/tqiBhMxJLHGBCTMKwbEORd3jvKTVIyEkD2ibxQ=;
    b=Su7S3cZ6dG7Q1hlb+LgdhrjGV6n7T5PbksUIdBnexYzoOllZKyFr0gF2LIvr7SrFZv
    hc5Sd9MtemDZF8t2dVeVQxlsCmehbIroyQz1PiS9TJGEuk2szyJGsR6lLBSE5WR84YOr
    GZIEe6KDHlOQ2QszIsnviIS6+6a8ao9VnncfzdBfwpsatwU73RcVAPB+1A2ws+EAdmSP
    4DU/5/OlqQUy2UVjgOjGNrvlXeYnPzF1ybTUCT6G4Uw+HTGlwCaRk9vLbWsZ5iFoFT66
    YESxP1SY4jbrFp93gMfiaRarXSkgxcaX53IezLkQ+K49xt5saqjBAukZqU/Y1qMX4jki
    E0zw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1700831080;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=9TKf/tqiBhMxJLHGBCTMKwbEORd3jvKTVIyEkD2ibxQ=;
    b=bRU8wCZRNvRNNBGr0Yk8WAbGpzpfbpxNcbJcpR7AM3D76hdMgBgP3+c79GGZ4jwsPL
    RlYX0zhTGr4azyJotk9gppXbpEjDt0Nz9ryLIVryGkN0PtA1MwE/iMX3p+60xRiTPfNX
    I/R/pRaKseeGpRjhw7yvbM/eAmsefT2m+s5GnQsT+xU1H82Hs35mLptj9Bfz9Z0ultMi
    whp9APLnpsU6+7f8SY4Qm8nUxhHeq/5i9U80b4IJrhtE/0l/iRqSlRBsf37pqLYdGckc
    IIDQjiXRMMWk0ZocWA1sHeEgpeOFe9dpYZb9Kd8Sl3wyEWx96eaRXN120apmblbSdJMX
    T5eg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1700831080;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=9TKf/tqiBhMxJLHGBCTMKwbEORd3jvKTVIyEkD2ibxQ=;
    b=Z8n+9zJpRY+j7w6yxHW3653mYAVQ4TjXwyAqotwWU/KKmmcSdaXPK9ODxpDs4hnON9
    TVbqFM4motw8mdqMogAw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5VxOIOx7sW7Yq7k+0gzUhLCSnSrvMYFPvEI3Cdw=="
Date: Fri, 24 Nov 2023 14:04:32 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Juergen Gross <jgross@suse.com>
Cc: Divin Raj <divin.raj@arm.com>, Xen-devel
 <xen-devel@lists.xenproject.org>, "anthony.perard@citrix.com"
 <anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>, Luca Fancellu
 <Luca.Fancellu@arm.com>, Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: [Discussion]: Making "LIBXL_HOTPLUG_TIMEOUT" configurable
 through 'xl.conf'
Message-ID: <20231124140432.53105119.olaf@aepfle.de>
In-Reply-To: <7a4ca8fe-da45-428f-a300-241b2bf0b2f2@suse.com>
References: <4a54e7e7-c041-44d3-a16e-d331e9fdd414@arm.com>
	<20231115182340.505df6c3.olaf@aepfle.de>
	<4f418916-b76d-425a-96a2-05b56a3dc195@suse.com>
	<20231116085629.40a0445b.olaf@aepfle.de>
	<A6D4B8C2-E781-4964-A757-C72F38169246@arm.com>
	<20231116105321.4a59eed4.olaf@aepfle.de>
	<47ec45a1-2004-410c-86c7-861d03c1939b@arm.com>
	<7a4ca8fe-da45-428f-a300-241b2bf0b2f2@suse.com>
X-Mailer: Claws Mail 20230817T113819.a897c59c hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LUj/PFA2cU_wx.cFGsxsjFO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/LUj/PFA2cU_wx.cFGsxsjFO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Fri, 24 Nov 2023 13:47:53 +0100 Juergen Gross <jgross@suse.com>:

> As Olaf has said already: this wouldn't cover actions e.g. by libvirt.

Jim pointed me to /etc/libvirt/libxl.conf. So from this perspective both
xl and libvirt is covered. Now it just takes someone to implement it.


Olaf

--Sig_/LUj/PFA2cU_wx.cFGsxsjFO
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmVgn2AACgkQ86SN7mm1
DoAVCQ/7BnBEdxxYDkYaXc89SSjneOxauYDELN+9uY+jv0tdf1pnfGpAeZPqRzwq
n3MJGMxZyq7Wg+/C/9gyIn7NVkoXCJizeHNz5CQSXiwAA3OYZzuUcQMv/sza8rqw
JjPYoFxvo93kRu2jHrA4WosuajZG/X0AHfb3/T41flDQ8UJ8Jj5f+x9XeOEtO/CS
XStqJytT6pnb8hHNVFs9d6BN5JJ8DPthUCDfOfkYJSkcz9PS2Xe7a0ezY0NN0zyc
WLL75FhbRkKGP7kx8btAsul5hQl36G/uIRnZPy+Osmv0yKAda1UciKuO5pTUNE71
fSGba6zfv7XZFkXAVvK6lSBX1dBLtATNcrig3wJSD/o2b+sYKSP2IPThTYlSQmXk
YsocDWyR2gD2hxIE9II5AdLsfpb+055af80tu72umEv/dTOTJPPzhL5wgGNNMyrq
YGzFI6mZ0XCf6wEGvHxUpeBxBQkfR7tzCw+y8s89fpV7O7sGH6x9HwiM1zyk2aEh
RgQBxOAWd1UEzReNgYtnSJ0D1Q0NElBMzLoi0mbc0y7eLPN0Tkdmf+QhopE/XiEL
vxhKKj9g6ZNbuSk9f3O7RNx5F5GkkzFsVAuzOz6cEUSt8B7jeUiI/Ww/NuOXBpa5
Vaqz9tgb/84nb9TaMK1vvVpwGm/1GFQL+jWE61OhReqy4FAVnSo=
=wAY0
-----END PGP SIGNATURE-----

--Sig_/LUj/PFA2cU_wx.cFGsxsjFO--

