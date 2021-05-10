Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 662E8377E4F
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 10:36:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124905.235134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg1Mx-000282-1G; Mon, 10 May 2021 08:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124905.235134; Mon, 10 May 2021 08:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg1Mw-00026E-PD; Mon, 10 May 2021 08:34:26 +0000
Received: by outflank-mailman (input) for mailman id 124905;
 Mon, 10 May 2021 08:34:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1j8I=KF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lg1Mu-00025R-Kg
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 08:34:24 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49f4bf9f-9fc0-4f77-8d5d-3fe1335a3a2c;
 Mon, 10 May 2021 08:34:23 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.25.6 AUTH)
 with ESMTPSA id n023e2x4A8YIBIX
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 10 May 2021 10:34:18 +0200 (CEST)
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
X-Inumbo-ID: 49f4bf9f-9fc0-4f77-8d5d-3fe1335a3a2c
ARC-Seal: i=1; a=rsa-sha256; t=1620635658; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ezwGmzIK7uUptoq0zt7/ZAkICh3UjfePda8dlk24Mq2RmiO/DOTXOhr4Jnsyt1FTRd
    FKk1AR7lkItFZ7Cn1mhC1Im4nZlgpK9K7uPTO4jFqXj71OXuIQhOz7wIWJLDYIJDa43s
    //2zS/WJKhQ3H/CrNlbh3ZZbdDGG9NnSP3mAkfm57v0i7qKZVRMHHtQ2uPUBvBDZ1tAo
    rMMH/kMyn1G1Cj7tSskL2uAKYfk4xB4Ve8CEP2i74dza1XIQUZGEWwCVMgnxe+zUB7yb
    cces0Nnh2PaoKYNT0VhxHO6LIP2bTzWnB2ruxM4qXWxqXa6O9klD8ybAoV5gVS4xnxQ1
    fR3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620635658;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=VuNIj8OZCR2Wp97RCIeA5syRszNX2zYH4073027fukA=;
    b=AqTON6vcVzprVD5/2QH4vuuThu99H4vYwVbTk/5T/l/QSQNGTfq1YMdhaopKrn3sfZ
    +Alw6PXDJ7lZa4310yxnaybPr0tceGOfQE+XDWRmvUbWHPngmiPoXOu7Fqw7PBldKyeh
    2rMSuWi2jJL0b153z7kRpCytRRp0BjiLhvhjlZX4JGSLlaOoAqdwbUNocasaBJyOqGRv
    DIz6nqEuOln3LrP31gWojBXt6Mx54jivodGJIhP7wOa1nKVyfsF+c+Vy77CogPRndUsa
    1H14qIoBMOE1KI/hka98khWHSuDFWViuLrGTEjD+t/R8U4UuYxpqC1jP3YBjzKg3hJFu
    2ElA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620635658;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=VuNIj8OZCR2Wp97RCIeA5syRszNX2zYH4073027fukA=;
    b=nPc2sSPV1gWc9MO8kDHfKAXyuP6y4398y6Eqp3Apxo/tPSfts2jqR8utfmWu3vSyNk
    TckATOIPn44lMx3obKazydu8+SDYWAkLI3rpDjAYrj3phkTl7cjl9MpSLqvzJmB9AQ0c
    /g+iaENTHeHPsdbAs1+cDJZHjATF/5cTn/iYIjssCoWXAMmPYvaaXVLbQmykDAyBoBZP
    eSXX6NB2QOwco8GCT2TGLj98mJSSM1luwGcg7/bWO3d3gAnFqFXGN+bkQygjb1RgDZIl
    MPwfjhixq8ZCUUgbgngTvVS9VSe2zSloFVbpxbPUxc8qXmxR9sH2LVjrWcvBfwjwbqVG
    C5vg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF/Wx6Ea03sAi8O4Y0c9DLMc9kgmB2KMHkQZ2le"
X-RZG-CLASS-ID: mo00
Date: Mon, 10 May 2021 10:34:00 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v1] tools: add newlines to xenstored WRL_LOG
Message-ID: <20210510103400.2df2cc9b.olaf@aepfle.de>
In-Reply-To: <17f8a84f-13c3-2d55-13b0-79abc7f83855@suse.com>
References: <20210503154712.508-1-olaf@aepfle.de>
	<17f8a84f-13c3-2d55-13b0-79abc7f83855@suse.com>
X-Mailer: Claws Mail 2021.04.23 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lZBIBSAVPf4818zyxdXm+bs";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/lZBIBSAVPf4818zyxdXm+bs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 10 May 2021 09:31:41 +0200
schrieb Juergen Gross <jgross@suse.com>:

> Mind doing the same for the two syslog() calls in xenstored_core.c
> lacking the newline?

I will send a separate patch for them.

Olaf

--Sig_/lZBIBSAVPf4818zyxdXm+bs
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmCY7/gACgkQ86SN7mm1
DoCJFBAAm/LR/z2bmOg2ej7KEe9peae0gWxwJh/BMvQIFnLkyJvBobRa9LkrQ4ay
IcqAoicCEXiE2muWHgA2DT0NlhngW0bbOeYbfCk7f8hMJQ+sClexHP4c5P/vjySC
4xBFEm47cdhkxuFmDfHPwQU/B9GUqm3DXoK0g2+toOZndZ9XSrKeHyp7cAg8webX
02a6iCs0gwc4b4CR/ED/xq9pHIbAi9+ycqWESBM0cs0UFxft0XaR1W6Rr7Dqcza6
YUTAJE18nDVg5VNoCY4xyjlFxUtZ6svNnNGpjMMdPYuTcnSaNmNH6A7WLFw8ZOwq
hgfTwE0YmF99/vP/VRWRQx3Ol9CMEIDKZ3bWvn8BJisPbpJZZPX7LFTOvcaPR4jJ
VmPjJ591CwWUKArynFjv5wsnK/DuSHCRw8DklCtVHTbWQbT/2qXi9sdR2znbOLIt
VjtQ29YMfymmznFTh74450Ly/l9cotresM7bh9n4BYzavBqEyr8UewxH1nZ2Uj+A
/xxDv+/jL4pFMPffBdL28dGaszdCksZUJtfILUFvdQDhTf++BxBywGyaxSKIv4qZ
hTzh+B0BWkA6tCOEe9qteeDZ1szHyDbsD0pG7EssplzRlL4P4P4pKtNmrsOh7aXZ
MgBf+IdSFzHe9OQt4IfL3tHhn5hNS6a/DX5pDyhP30Qpo4Jcguc=
=f0y4
-----END PGP SIGNATURE-----

--Sig_/lZBIBSAVPf4818zyxdXm+bs--

