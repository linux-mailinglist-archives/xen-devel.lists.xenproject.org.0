Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 665A23BD7EE
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 15:39:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151346.279713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0lIg-00049N-K9; Tue, 06 Jul 2021 13:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151346.279713; Tue, 06 Jul 2021 13:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0lIg-00046p-H9; Tue, 06 Jul 2021 13:39:46 +0000
Received: by outflank-mailman (input) for mailman id 151346;
 Tue, 06 Jul 2021 13:39:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8sr3=L6=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m0lIf-00046h-KK
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 13:39:45 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.165])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f61522c-de5f-11eb-8495-12813bfff9fa;
 Tue, 06 Jul 2021 13:39:44 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx66DdcRy6
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 6 Jul 2021 15:39:38 +0200 (CEST)
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
X-Inumbo-ID: 9f61522c-de5f-11eb-8495-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625578779;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Ow8/0SeTKlMbjhHQK5rVbSQQoxKu6szh8DJgSdjqW8Y=;
    b=JNBHV8EJbxlj7FETCPm1Pu8JM05BKQkfrYtv6TbjqJc0g8i2tB6K7j6A6RIMLignjE
    MRKCpWtH50XzaFb1Xg+ZuANw9RRfqURp30OVwfkeoh/1/lfWkt+gudkIt4JRqCsPIU64
    DV2udShK8v5I6yJukEZ6RwqFYrh2oE1iLTnXeqleq3ifz+X/M+8lVLrno4vbtvL/FxhO
    jZiR7GS07yJCo+h+J16PMRHwg3wzZ/pgQs9ExIzL1Phx4wPSiYd9Kkz6fz4PR9Ed7qlE
    01Dl3SSp9BltOqvutVnGuMF9jwu9+KxvQWTBxP1gsxzmPNXmt+pBS1BN7kFxlgbb9ItN
    pypw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Tue, 6 Jul 2021 15:39:31 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
 <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] tools/migration: Fix potential overflow in
 send_checkpoint_dirty_pfn_list()
Message-ID: <20210706153931.67481153.olaf@aepfle.de>
In-Reply-To: <1fd51108-82d2-4605-5c37-410c3f4c65a0@citrix.com>
References: <20210706112332.31753-1-andrew.cooper3@citrix.com>
	<20210706112332.31753-3-andrew.cooper3@citrix.com>
	<20210706145804.1ab98f16.olaf@aepfle.de>
	<902720b3-d71d-82eb-9200-97f2b17dd264@citrix.com>
	<1fd51108-82d2-4605-5c37-410c3f4c65a0@citrix.com>
X-Mailer: Claws Mail 2021.07.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3/ya=Q0GSez/PMlgaAvCmng";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3/ya=Q0GSez/PMlgaAvCmng
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Tue, 6 Jul 2021 14:22:58 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> What hardware is this on?=C2=A0 i.e. is the Page Modification Logging fea=
ture
> in use?

At least it gets reported as VMX feature during boot, this is a CoyotePass =
system.

Olaf

--Sig_/3/ya=Q0GSez/PMlgaAvCmng
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDkXRMACgkQ86SN7mm1
DoDU8BAAnJXkyUixaIPaWhsifQ0KtklRosB25eBFyy0hfQ6ADlHFxsKQVJ7OvfFd
aCXnjWzHWd8FUHULKJd8mmn2oVoM4ZDsDSwddvz6akMfCRvuzdnNwo/FzKkHH6t6
/ls534APVHPgoZBvGBDw7HUGIFDFvFCDX+ZJlpxQt2yAJCeZYXbHk+einRmBLFw2
mI5uzZa4vtD2nVWdKXV1TwQ6ASsDmuq6hw26gcbKb9OS8wUWR/m5wKi2Vek39Ar6
3/5cDvfQujHxCijhz7Jxc6NV7wq+zb3PJasBT4OkFQCR+g0Eaomia66Bh0+mz8Sj
DxwsDojNIYxWaYuVshoCqFGApkIkxZOY+ItvTcmKN3AqtpVXSPUUMHOVYARquZJ5
9E5cS8Q3bsmKThycG/HgXJZsoUcC1Q1GpTUz6MJfDy+HPj7Rkp1p757JcgHc6XT9
g3sRZ5QBd5lSwXD7sAEv6POaBRjn3YnU8jl7cEgAOnNrEa2vCSG1a8HI72kESJnf
fUxX81XJY1+bVOmnMGnVGOYtoLa4eDLNCG02r1WVCgBCCMun9yI0LbWv4YnPD5DR
2wPhSa/ADsF1o6TSVLq6xeQCFwHhgbVwNxpa5s1hbNyaIStSzgLfuNuQ4f4VD1FV
vqfbT4wMQeHCMbcvqVfqe7BhbhRG6EHer9ggT90yZzCqCw/F8mc=
=8AfA
-----END PGP SIGNATURE-----

--Sig_/3/ya=Q0GSez/PMlgaAvCmng--

