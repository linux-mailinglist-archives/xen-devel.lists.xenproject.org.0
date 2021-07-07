Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1615A3BE9BF
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 16:28:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152315.281408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m18Wn-0004Ru-6b; Wed, 07 Jul 2021 14:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152315.281408; Wed, 07 Jul 2021 14:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m18Wn-0004P6-3Z; Wed, 07 Jul 2021 14:27:53 +0000
Received: by outflank-mailman (input) for mailman id 152315;
 Wed, 07 Jul 2021 14:27:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eUo+=L7=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m18Wl-0004Oh-QM
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 14:27:51 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.54])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d679560d-4b65-44c4-ba20-e060ae8de201;
 Wed, 07 Jul 2021 14:27:50 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx67ERgWge
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 7 Jul 2021 16:27:42 +0200 (CEST)
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
X-Inumbo-ID: d679560d-4b65-44c4-ba20-e060ae8de201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625668063;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=UeTAVglgrcAokD/tB/XMZH2A3va0dTkjIg0XM4rBBYM=;
    b=TXelfCj6WEn6O4XtjwlzqPMxGgavNSdpC5X8F96sbnWeN75JUo6oF4Tcj8B4Oe1Mzz
    ERTXuUbbA2lrw32h0TbheZjWOJkwjx83k7l14v/X4VT0nEF9ObzJPCEMaXR7xoLPIrmC
    h3CYSHNMlwS8aFsjdipHVFqqaPn4Ryf0tQ81F+1369zkD8Ih2mVOE9ieaB6iEzaaP8LH
    QLMZY3YmKfmsAUoI7FNK9KZ55LeJxMxgaDkVhtcAc00GEMb72vUglwtGHKIs8ye2p1Qb
    yn0qUskZv4rg30Qym4N/NBxSu52GCiZpPAL/Dm5QAjYeU2C9jMND7BOEWe8cPG1Ftmsy
    FHEw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Wed, 7 Jul 2021 16:27:36 +0200
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: Re: how handle domU checkpoints properly
Message-ID: <20210707162736.17f93a47.olaf@aepfle.de>
In-Reply-To: <20210707133427.15679-1-olaf@aepfle.de>
References: <20210707133427.15679-1-olaf@aepfle.de>
X-Mailer: Claws Mail 2021.07.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9PbOFI_r=m3RnOOKspek9cT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9PbOFI_r=m3RnOOKspek9cT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed,  7 Jul 2021 15:34:27 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> This is incomplete because repeated checkpoint or pause operations are
> not handled.

Apparently they are, it is just not reported because there is no event when=
 the domU resumes execution.


Olaf

--Sig_/9PbOFI_r=m3RnOOKspek9cT
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDludgACgkQ86SN7mm1
DoAgrw//UsFZT1vWwulma6dCnkmciRA8Fd2tdtKgGXPWo6z/14tjDp1JHRWBRUr/
mBaZl0hTZF+aK8ToDj78f2wlI4yYp3MnMGDX4MGSkJ8lCaeGg3uNOIaf0G4rOZu4
yz5kIB7w2evwEhdaxg1Zm/5bM+KiFiDth1JtJ7sFIQuy7t4GuTk5EUsxVXYJaTu1
rIF7+iE3av6sdziNglH4EjWHRwUlF20q/L70dqYjmv64xC3sMX7uWXYJM0JiwsLm
8/aiJKrK4d7vu7ivGgXIEoGOyvtuzOVCTlLNIdbgsIwWquq8XblRpOGD+Zkruqxm
y/rVqz2z0SIji6G+kIwRzjrgHbC535niWyigqPUOyk+zjKJT9F8UGLJXyo0DI+KL
sfDpnu8iEjMl8uwGrLIscOT7ajSSh3zHtYSgNG87/7jE5sMqDDrIQp0LA5ogpJMt
r5hkU+MSSghrb7xA/QMjP/pjsPp08svPoZvmksUNAI5s3CY+i1/Kp/SUe1TQ68hH
V81dpjvH3/0rRsBo/mzPY2DSp6zVlGDyJwE4VvM9vO1Blk4hzQsd17sAdtiJ3JMt
05vvpzBASmsDfva5jCNFasy6V7/Ts6XwiG84chAgrfcdSBJMO+uH130JcdDEK2Yn
D3/K9Ra7xyJS2gkOzvidK9zBIlvSqrkbv4g/MUWYLPC1TFF3N2E=
=+Lv4
-----END PGP SIGNATURE-----

--Sig_/9PbOFI_r=m3RnOOKspek9cT--

