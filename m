Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF5F3755BF
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 16:37:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123606.233170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lef7V-0000I0-Kg; Thu, 06 May 2021 14:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123606.233170; Thu, 06 May 2021 14:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lef7V-0000FQ-Hc; Thu, 06 May 2021 14:36:53 +0000
Received: by outflank-mailman (input) for mailman id 123606;
 Thu, 06 May 2021 14:36:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PObI=KB=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lef7T-0000FJ-Lj
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 14:36:51 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::8])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6fed315e-0670-4af7-a42c-d1f5a6aa8de8;
 Thu, 06 May 2021 14:36:50 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.25.6 AUTH)
 with ESMTPSA id V0bf6dx46Eai09q
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 6 May 2021 16:36:44 +0200 (CEST)
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
X-Inumbo-ID: 6fed315e-0670-4af7-a42c-d1f5a6aa8de8
ARC-Seal: i=1; a=rsa-sha256; t=1620311805; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=A0fi9cxmEccSeZo13VD187rseUtue+ML/C3IYMpapeT7OUUsl0ueG8yIJcAL2na0JR
    1xwTx1PJfXjpbMygq10zJNdIxOogmw6IYjm0P70dW3CbFwhoBg7kSY5ABxCqq0V/ZTBh
    gB3aZ+V2+JW4BlU8EGLXtpq+vIIfvmT0VCmhBp6FlsegID3u5CQ6C0cPh23qouNxBqyD
    g5ziy79NwZyS4xQplIAcO1FY1CcYq5l+Ey4qGsLbOWT9Vo0dky7HQm9DknEL/xZKHM1I
    mwbhe91Vp0vWINAdmmV9mRSw5VlZN8mdwGtdyZb+29i0FHionSU5ZazPcz/fMDuyx1qv
    LT3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620311805;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=ozekZX4ssam+kLWNjeFPeBX66g31SOfC75RWGeZRjD8=;
    b=hrzID5RoCFQMdFIMmLuuJl4HJu4cReH0BoWvE6yJWeLSqg0O49ygth9vySmvP8wuqc
    Ekz7ITWH6RvyGNmfUUXzTl+pbsXSSvaNIXb/pFsqnCtO6nmHGMPUwj7VHsogoRpeA0d/
    h5xFHjspjWBfB6rnQkkii3G7OETgzR2Mt2kJYguNmbCwsd9vIMiXTr4LQdYmR+yMKLMc
    jo+uYje+h/7Jk4bJFt6xGr5duvf9q1+xPCs8Ko9O2GdadWiUuSgxsDyeOfFLxROcwmh8
    62EmQ4iDbWc9p0MgraC5NRoAcyub9dcehRltFdBWaiP5xpa7VsMCZLOEkAdZYnX4Jm7k
    XK/w==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620311805;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=ozekZX4ssam+kLWNjeFPeBX66g31SOfC75RWGeZRjD8=;
    b=aw/+6PZg5RrTDs3UDzQ63wHA5Cjb+mq2tTW+1ShkXjQGVMkBo5L6U4r+7/3jLrnBIF
    YVbnMmGU9IDZ2n4oJM8I6bp+F9vTk3CzfvgB5rljIqTo7+3S7+d2OEfyogK5B/w7IiF2
    DHQPZvFXWWs5wcDSuSaAOYvRdIihXCv7XbQzPK/SkN5K8DnxDcx/bGPgAJoU7+660jCl
    l4Ex2VR9fOuXM5KWcJBKEsAwid83CwZILiAakgIsd8oYb633CNrpKabyJSNsCuUbNexw
    OWUmC3W6sPlcph1hUl4eODohjr2Yh3NEBbbMXgn+cOAegstrJTFvIcOlV+lV5ATjfj7J
    R/ng==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisEsVR6GbU3svGYLiH9zFD0wpO7hNb2D/K88Gfjs"
X-RZG-CLASS-ID: mo00
Date: Thu, 6 May 2021 16:36:27 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v1] tools: fix incorrect suggestions for
 XENCONSOLED_TRACE on FreeBSD
Message-ID: <20210506163627.12d191cc.olaf@aepfle.de>
In-Reply-To: <c71658e6-422b-4852-6d21-4688d09d8b8e@citrix.com>
References: <20210504135021.8394-1-olaf@aepfle.de>
	<c71658e6-422b-4852-6d21-4688d09d8b8e@citrix.com>
X-Mailer: Claws Mail 2021.04.23 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//BBTQIA3Ch69rwHHbimLKXV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//BBTQIA3Ch69rwHHbimLKXV
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Tue, 4 May 2021 18:47:12 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> I'd also be tempted to fold this and the NetBSD change together.=C2=A0 It=
's
> not as if these bugfixes are distro-specific.

I will redo the BSD patches as you suggested.

Olaf

--Sig_//BBTQIA3Ch69rwHHbimLKXV
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmCT/usACgkQ86SN7mm1
DoCOBA/9GUb+i7nmx088f5C3OPm/jQDCmVbnm7q+MFcEhcNNCM2nZyoqRxL3z20A
zMKeRna9esNj4gh9B3I/XAnXTkN/1dC7jkztPpuKopjTkjuVk8CR0b44yldfQDTq
f0kJ3mdOi2PvotQ6mm5BQc0Vqq4yiauQD4aV/i3vPupzcclcn/1YQiRgm1YyHlrH
fjl22W7CARrPWAvEMMI61cO7Uc1dSuDgQBrNNBdsxAfTrgKb+PKHE8wJ6ICGHpZ0
cFQ0hPOG9HvboZl8KUSyIckJs3tCsOxPfB2eBUNYw5gxKdCYTayj+c+pYSGBZ0Bb
D1zV6NyJ9XA1gIXmb8Bfosf1NwyCOrEihPpOXRmXf9H7EhJtl6T8X7yDQFHmVkoi
dGxZR5V/Eg2Hb0L8KBuCdCD4Q/oW/5WoosjASClWorquNG+QJn0vyTuFAEBQqcHL
sUkah25f4aeDs6m3cPbbp7erjt8Q+7ex9D4V6rX5hOjfZxsMhu43su5j8niKUTB3
kA8xzbxv/bP40a9DyQOBtd+lMP948eu4S64050knKjAjZopS2A6KO3epHY0VET6v
WFEkE0uM3IxDCzArBZ9KfOYKMQDHpqb9zQ/7xGp74Fayhj1fsbjnbaimNwb+39g2
bEqeLBuwj2VGKiUOj5UKkE40x9sY9cLjpSigt62GaeiPZAs6wpw=
=glPz
-----END PGP SIGNATURE-----

--Sig_//BBTQIA3Ch69rwHHbimLKXV--

