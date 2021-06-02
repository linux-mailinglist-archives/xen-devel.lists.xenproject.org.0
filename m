Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4CE398770
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 12:58:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135952.252311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loOZ0-00019G-Hh; Wed, 02 Jun 2021 10:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135952.252311; Wed, 02 Jun 2021 10:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loOZ0-000176-EF; Wed, 02 Jun 2021 10:57:30 +0000
Received: by outflank-mailman (input) for mailman id 135952;
 Wed, 02 Jun 2021 10:57:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NSCb=K4=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1loOYy-00016y-JP
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 10:57:28 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 833b7922-9d5e-40c7-a9db-ddc6ab934193;
 Wed, 02 Jun 2021 10:57:27 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx52AvM4Mj
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 2 Jun 2021 12:57:22 +0200 (CEST)
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
X-Inumbo-ID: 833b7922-9d5e-40c7-a9db-ddc6ab934193
ARC-Seal: i=1; a=rsa-sha256; t=1622631442; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=byYJhIr1Zrx2IYXFJo2Kd+qNouxpnra3+21TAVrii5d0SP1lZS+H3AGjmSGk80rHpv
    a3Cmga07VPtLTii+VUoqwhGoH3i4NB+oRIAm+g2WGIznkAqk/vprUsOMxDHypjQ27pTk
    M4ey/0GusjHTQIW+JXXfvSEQBZVc6uz6CvaJKayBq5MqpNBcXISAUcOrW52hB7yAJxlb
    uRGxT4xoq3F2DKsFZdOaaFVQ0a1/y/W4iyeuT0lIXE/4Fdz+F7/C0wIBuk+wg5kWz23Q
    3pS4pd+26AmVCmnGkaMQQii3V6Bq4VjBWoAGwhknJa08+HnqDGF54tZLvGLnQpUOKcXw
    8Jpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622631442;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=F8geIRzygIdHjqWInOe5Mba3yEzQCyuFZhoHbRoHsQc=;
    b=mtDXc14+ir8G325gupV6sIF9UzxFyfDzPpCeJxw5qhViRCPCgt9DmvPZ4wUWqedgRI
    xYSiC/aYJ0466kVToBpVU/tX0xevvqiTAfS/UL0KdFVELQ0L+/ON1YGPD/wZNwInT0er
    UazSA6qZPYhHIzAGHyc7qXwZrlRAGXGq34FW9DDI1pKeao/wXVJWRX1w4ROjkidkJ8LA
    XAnLXOzL+SHi8n6OCeBKq/NGrfdQ87bL3gjIIT7VNxGU4apCvssC3NE9z4/N6LDgpmKY
    zBP0UwYKoZdZM7gHmwTofRs68n4Iw9Y8Jum6d8RHpqaWBoxi1U1ycKr+x2t0z76zBSIW
    xVLw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622631442;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=F8geIRzygIdHjqWInOe5Mba3yEzQCyuFZhoHbRoHsQc=;
    b=CWUx9dnkAgh3IV8vCZQwpqUNpJol9XCG1XF1UeRhH9zbEdVbzy3KyV67xObRv7vA73
    jRhWtH8D61fksYAdV/Cx3XYyJyXvnwU4jWQq+X7Ul4LhgCtVB/MQyeXxTNertIz/KmDX
    IR9r8mtWK9rxxdXs0vQtBPtJgok3dsHiky3YSeekrCCN0DXQqIgZ5bUsCAnqNR0mFV3c
    iqR/klzqa0m634NBTA1/4NdMG4RgQ/sY3aqyG/UnvM1Ee3NhBpowMDHHsSd2OAeTFj4X
    pDQLdh6RpViK7lQK4w2gG/bB/eaxj0//j0YMkeaWAenePjxjQ6UStbeUEWI1N4KjVmrV
    s0wg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF9Wx7WbE3s+BU2kLCYUBd7t4vRd/ulzKn4R+Wk"
X-RZG-CLASS-ID: mo00
Date: Wed, 2 Jun 2021 12:57:10 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v20210601 04/38] tools: add readv_exact to libxenctrl
Message-ID: <20210602125710.0607a985.olaf@aepfle.de>
In-Reply-To: <23783088-dc59-abd1-c66c-5fcd314d1f5c@suse.com>
References: <20210601161118.18986-1-olaf@aepfle.de>
	<20210601161118.18986-5-olaf@aepfle.de>
	<23783088-dc59-abd1-c66c-5fcd314d1f5c@suse.com>
X-Mailer: Claws Mail 2021.05.24 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_4=byZjwD0_1WiL6z/pNxSS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_4=byZjwD0_1WiL6z/pNxSS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 2 Jun 2021 08:30:08 +0200
schrieb Juergen Gross <jgross@suse.com>:

> On 01.06.21 18:10, Olaf Hering wrote:
> > +int readv_exact(int fd, const struct iovec *iov, int iovcnt)

> > +        if ( len <=3D 0 )
> > +        {
> > +            rc =3D -1; =20
> Is EOF really an error?

I think yes, that's what "exact" implies IMO.


> This will stop the loop, even if idx hasn't reached iovcnt.

Yes, it will trigger yet another readv().

The "while" might be a leftover from a variant which used repeated read_exa=
ct to finish the function. It should become a "if", and the "len =3D 0" can=
 be removed.

Olaf

--Sig_/_4=byZjwD0_1WiL6z/pNxSS
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmC3ZAYACgkQ86SN7mm1
DoASbA/+KpZVU9KuuhQOE+wLxOx7ORkOo0/oKFj42YoUnKZOwHFE6B7/Cg3XAvYd
0dMVONch7rIdwTOEvC+/3tikLV0W795H5hF61H3D0K2dbnVTWbdPWe5TQ6mImav4
v3fXN+F/wvsPIduEVf70v+hEVmYp0682/D35GpCk6RoTsjzCpj0TVst7dWIdj7j7
wQ2fJNU2e9R4CZpZA/zj48DLuKC2j4QPZBEWlz0BZSNq/59mKTy8dNpyQ8WLhpG4
SCTPv2g3QEuiBYWyQKjNZUmr7H0YCoXBLQILKACpCuSc/VSgoTg6iCGSeKbCMasr
xwmumnh9Drn0t73aIJ16WmFURP3+nD/uVaa0kKD5F1LWq8W8oXFiyFmoEizIS9Hc
rxb1pMZMTD/JXRJ8hDp6EIDNbiDFetNi5l25lFYv5Q0wG4vHzJENhh4h0uc6tpmt
NMtxjjCJWAi5I6VUIE5Gb89Y7LHlALq14V71eh7fn3r366cxhIjiRzupNnKP6UdL
GePfTK7hZ6MQCKV7CI88Dl9FA5tbIsAzcrmCvZcpQNwBwoe09FQJyLaRqcyZrTnJ
6nvnuPga9xM6GXonj4BdvG+mZMtdg8JoL4NmIMBC7UySdyHl3E8fGblk5KRh2zuD
aPZCaKm0z5/LDUtYIsFmAXJHWLg1wAAxluX+kGhIkDrDEWo4niE=
=0iip
-----END PGP SIGNATURE-----

--Sig_/_4=byZjwD0_1WiL6z/pNxSS--

