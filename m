Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D473BBE32
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 16:25:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150273.277869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0PWv-0003gV-Lf; Mon, 05 Jul 2021 14:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150273.277869; Mon, 05 Jul 2021 14:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0PWv-0003eg-IN; Mon, 05 Jul 2021 14:25:01 +0000
Received: by outflank-mailman (input) for mailman id 150273;
 Mon, 05 Jul 2021 14:24:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N9Vt=L5=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m0PWt-0003eQ-HO
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 14:24:59 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.50])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 327dae56-84da-4c8c-9d38-d95dd18a10de;
 Mon, 05 Jul 2021 14:24:58 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx65EOqMuF
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 5 Jul 2021 16:24:52 +0200 (CEST)
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
X-Inumbo-ID: 327dae56-84da-4c8c-9d38-d95dd18a10de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625495092;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Z0IkIWVecSGOPPqeDUqHlG/6298s4P2T/BMxZcZVPXM=;
    b=jXPReIKZbXe8VomxOQE3nbwYnynGh6jUCUYqNIEw2I+pvZ1DxcjGKGNAm86fuBzpkc
    9wMyR9eeqf/8JvmP6aIeYCab6UuodkDp83aigTjXOFfExrchkUSapQ8UYBea1ny7Alvf
    ebYeuzdPDCaBZ2WkHZkXaRUexbkDVjkSvWL0aZSjzl0CIks2JN5RnLd7mmqayl4F0HhB
    mxJs3S9RZl/3vYEP32xfqm38NgLgbUwenYBLWGriitzIRoqVPXz2bmulzIsahskaE/l6
    fVMe1qVnkdQfFkJFcf/RI7EMZe7ZElyXYQffxcuyoXrkZIk22CB3W588Jp7+sLaX1mYR
    WBZQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Mon, 5 Jul 2021 16:24:45 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v20210701 10/40] tools: add xc_is_known_page_type to
 libxenctrl
Message-ID: <20210705162445.2007bdff.olaf@aepfle.de>
In-Reply-To: <8762eaaf-a8bc-430b-470d-b84f68c06b5b@citrix.com>
References: <20210701095635.15648-1-olaf@aepfle.de>
	<20210701095635.15648-11-olaf@aepfle.de>
	<3c0efa9b-aaff-b4b7-0fd5-9eed32b20e01@citrix.com>
	<20210705102230.48a86473.olaf@aepfle.de>
	<8762eaaf-a8bc-430b-470d-b84f68c06b5b@citrix.com>
X-Mailer: Claws Mail 2021.07.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gUZQcwH7533mzsYNXb1_jws";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gUZQcwH7533mzsYNXb1_jws
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 5 Jul 2021 10:51:50 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> All type fields are uniformly uint32_t elsewhere.

To me it looks like xc_get_pfn_type_batch writes to an array of xen_pfn_t.

Olaf

--Sig_/gUZQcwH7533mzsYNXb1_jws
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDjFi0ACgkQ86SN7mm1
DoAApBAAg7UaSj5ZBgfRymqjFXjB8Xhp2ZiimPCE4e2Z4PVPKXTgSiU1MGONW9Or
g5W1Jju5rhpXrE/cEa3de2FgwpoM64bqZnzABkudd92LB0gyT9HsE17IRMt13rwC
lh82w0k7YhNgKUVVdT7SJG8PFiizp3urySGSVjAxXMvP7Nnnsxc7Yi9yq3vll2JA
xJZoDFMuhzZmATjJyTVkE2MrrMZ3YnGdX/CTXXt1so/JFsGLJW5SWJ+Ixu2d+GJ/
uLMPMAL4M1Rqqlt6ye65IZEfJmRRN4WRK/r9P2PvAvWQ1JQQBm9ICeOPwJmr46ej
6sEPAKsFK26UMIkeutJf/ktzDz/6pgfWPH5EIVEOjactdz8m9NGnndqeIjEChlaW
eNkBRORhDwEebaDGYFGfNbBp6P2aiar7KT6ZowA5HLywDDus+tMaEndUBhl2vnZF
lE66Fle4vPSefcsaOC58AVlWeUAchO2Z+yq8yuaMf10B1HKyS70lpM1jToGORepr
zmgfAg5bdZOlizh2ss6dVThWuhwCZhvcBVKQmi4E4WzbydXBjyDwdRGNZCFynLDV
Yb4Hq2Br7Zt71FS/eqxpgZriR3EIJqCQFAy9HftWggHOV5K8NlSB8J7mVS/ThFy3
O7UofqbuTlFYdFKrxXGQgMWVfz4P6LUS/Up8cIDoKGMfMeGScxM=
=Q5tV
-----END PGP SIGNATURE-----

--Sig_/gUZQcwH7533mzsYNXb1_jws--

