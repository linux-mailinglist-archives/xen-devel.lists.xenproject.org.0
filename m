Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C403B3AC81A
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 11:55:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144384.265753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luBDU-0001Hy-H0; Fri, 18 Jun 2021 09:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144384.265753; Fri, 18 Jun 2021 09:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luBDU-0001Ec-DG; Fri, 18 Jun 2021 09:55:12 +0000
Received: by outflank-mailman (input) for mailman id 144384;
 Fri, 18 Jun 2021 09:55:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ygMg=LM=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1luBDS-0001EW-FL
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 09:55:10 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.167])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82e0e802-2a7c-419d-b1a6-44bfd868d6ed;
 Fri, 18 Jun 2021 09:55:09 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.3 AUTH)
 with ESMTPSA id x0a371x5I9sx35T
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 18 Jun 2021 11:54:59 +0200 (CEST)
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
X-Inumbo-ID: 82e0e802-2a7c-419d-b1a6-44bfd868d6ed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1624010099;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=a782ZQObEIVx2Ci6TYWBQEYT3BMvOnOng+Nmakl4Drk=;
    b=dkwXdu1Aikow0YuilOZM0Yg+VAmIU1U/Ex5dUqWN62L0ZOvlp8klZkHiWa6Xpqe4Vw
    iKI3oT1ag8Kt4Y0pzNpAMp8QSPXOJprt1GkbYFpAP2gT3mtIHXAUdgyADdg7Xt0bjfCA
    G5ebyGBafsACU3fwl2Qd0QkdMDjf/Bq9Mhx7wIo8L1uK7mojnMTc1e8W6GeRYRypwJ8s
    h7zWithdKqRI3n/vrDeUtcxSs6TepdoLkHnm6vT3b3tPVtMEPo5zAcFwJ5FZsFmnAqVq
    31L3x5busgVqMWwDIAghwdYd/fECh9fmzhdt5CFYOxLKSU5qYZtPlyXsTsfBsr1vN8wx
    J10Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisQsVxSIbR7sf0kebs4Z3Zpqv+Sabl5o7CzRq+Ps8Q=="
X-RZG-CLASS-ID: mo00
Date: Fri, 18 Jun 2021 11:54:47 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, Marek =?UTF-8?B?TWFyY3p5a293c2tpLUc=?=
 =?UTF-8?B?w7NyZWNraQ==?= <marmarek@invisiblethingslab.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1] tools: use integer division in convert-legacy-stream
Message-ID: <20210618115447.190922a4.olaf@aepfle.de>
In-Reply-To: <8a9be55a-ad6a-d06d-9ddd-0f2d656e4fac@citrix.com>
References: <20210618093114.1640-1-olaf@aepfle.de>
	<8a9be55a-ad6a-d06d-9ddd-0f2d656e4fac@citrix.com>
X-Mailer: Claws Mail 2021.05.24 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2Z7qax8sLXjOX1d1U0i61Sv";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2Z7qax8sLXjOX1d1U0i61Sv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 18 Jun 2021 10:42:58 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> This is a Py2 vs Py3 difference.

Indeed, my build wrapper changes every 'env python' to 'python3.4' in 4.14+=
 builds.
That explains why it happens to work with my 4.13 builds, which changes eve=
ry 'env python' to 'python2.7'.

Olaf

--Sig_/2Z7qax8sLXjOX1d1U0i61Sv
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDMbWcACgkQ86SN7mm1
DoCshQ/9GDIo4Tj5vAmXaUqae2lcDem+0joYdFyAofzjo/63Tm4mfn7x9epIapIt
AxL/6RbUMqIhI30Gv7uabur20VLAMJGH1dNlZBWTV14JvkLepbgy5ib8jpjUb0Ue
SJEhLsbfgKSvgAX9gulR9xe3xxxGu6+STKsJaGh1oBmsv7nqmTxKaq6WtcwalyE+
LAxMQHe/HQOqG5pBqh1xPngIxmlXLmwhnfvk4JMg6VdQFMlXEfrXOGaMnHkD9oly
E0Alrlb0h7j6ZEdRAlOnNF/Gou9o/AGs+VeE8K4trX6PNth0Rnvr7LCOlpLjDcWA
FaWr4+K8grNz8/ORbxKfMO/dFr3pzkrwd51QC0eg2va7RltE1SE+N/XQhSTya2Sw
somPsmRFIeCW6huapZ8eX8nOLFT1kdpS021BV3xkGPc4tNEARz1zOSMGHwl2zYLU
OqthbdDWn6kROMybgFQ1rKUw8eWnd52NtzXDNIio/BbR4gPIAakxcI3q1/bIi6lL
5j7Gl5cvmRZ6afIdr1xfN7B4A50h4ZciowvmWvspJChesj4muKqdw7O+mLlWpu0G
QKt9PINVQUzX5qTF4kwuQpbZnt3rRTaMepODU2oXwBUBREo6aCiC8BvcKMbQct2w
N1gmm2E507opvqgyKDmmVLaCWgdl2wHRPog/fSrL7Q/1UwCpi5Y=
=4yt1
-----END PGP SIGNATURE-----

--Sig_/2Z7qax8sLXjOX1d1U0i61Sv--

