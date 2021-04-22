Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7683680CB
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 14:47:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115397.220120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZYj2-0007sN-0P; Thu, 22 Apr 2021 12:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115397.220120; Thu, 22 Apr 2021 12:46:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZYj1-0007ry-Tm; Thu, 22 Apr 2021 12:46:31 +0000
Received: by outflank-mailman (input) for mailman id 115397;
 Thu, 22 Apr 2021 12:46:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/jO3=JT=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lZYj0-0007rt-D6
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 12:46:30 +0000
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:400:200::9])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fecbfc7-ee35-494c-8e40-42a0597751d6;
 Thu, 22 Apr 2021 12:46:29 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.24.3 DYNA|AUTH)
 with ESMTPSA id g00c91x3MCkIVYL
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 22 Apr 2021 14:46:18 +0200 (CEST)
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
X-Inumbo-ID: 1fecbfc7-ee35-494c-8e40-42a0597751d6
ARC-Seal: i=1; a=rsa-sha256; t=1619095579; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ANlq9i/CU/JMb5nr52+zYsR25mKXL15Sd5qH4nf6qZYfpmqzHuPaKPSghnszf5Pwu5
    YIj4Xtd4OQeNRr1yuRuBRDhzsi1E9p2R2TUVmYr1mQX0VH64MHOSOl1F2kieiFh5wNVk
    kptLZCMGjrSnd6RSTTyYbdUbEfnjnpWZ0XKivZUvUtDaOC7s9rS04mBx/8sz+FlyBu/G
    IJQoIr2oKMv2f6pzIZ3zCrIDp4RluGVzt0lwPNdl+CtMT/UpvdnkWa5/VPTDnFjW0db1
    X67cntAyVGvqTKlZ7qLglLlLf5NjosePINzkiS9nJ0Hlfpn651SICxMiA7tM9U3gimW0
    /KbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1619095579;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=sQzkzInOgjc+XLwJaAkPHspeeHwOyrVSEVrAFvCJpiA=;
    b=RdSMpQPOs7zO1J78H27/YV7zoVTtUFL6klo9xGLvlidoHZQI60u8r9l0MjwN4NX94S
    jHMyAzGHZhJiX/Xpa93M++R5WaMFvnCJhk1by4CaIDkdDfqhTKREK1JkpDQu5ZaaYF9p
    bw5V6IuSO1tCGC/vDSslsiDSLunsWV0NW9SKtCaRQHD6ztKQwkFkbPjexI2G2tZ3xNsQ
    VqO5EpMGJ6By+n7lHkulMYfCoUzTLa16SaM+qYo4XYw3Hu/eQ8U0jM3A0gQ8ljMkNPlo
    v1TcWsV/jkoYHnyd8SRqi8YWlA5qtnQt62cHBff7wxY1Vy+5QcSegCuDF+cGVs50BwF0
    Owzw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1619095579;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=sQzkzInOgjc+XLwJaAkPHspeeHwOyrVSEVrAFvCJpiA=;
    b=lk41IxL/ZzsUh1N2/7crrjb8M1tRitOURoCDfQvgUNN3UuhTK3JmDiiSORK+hv/31w
    g/wE74T6iTIwEaetYQd7FDBd6yR95ETyQQKDpdYnOui9jPmjXivgAdi/knK51CIMSbDt
    rShA2j9DE8TQpxto/PA7IBXMlX4GMhKj0itlifuFeUFeB/t8KYiIJXOcK4+fXZX/vJIb
    alJuzvb+0mwttLUro3KJAjXJqxkjLM9H9aNuw553RmWRy5ii3ckOPkPBIJxCpkUpA77+
    RJB+ZKzK4zmnHVq0YBjA2eIYIO4oeOC90rnj7HDn6DvchBaKdgqManF9l7y+6S8nicAM
    6a2w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXmEVBDI4vdCIUVoI+BBGA=="
X-RZG-CLASS-ID: mo00
Date: Thu, 22 Apr 2021 14:46:10 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, George Dunlap
 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: Re: [PATCH v4] tools: create libxensaverestore
Message-ID: <20210422144610.45216c0f.olaf@aepfle.de>
In-Reply-To: <39eb928b-161d-4870-93d2-8c15929aa32f@citrix.com>
References: <20210415131138.8709-1-olaf@aepfle.de>
	<39eb928b-161d-4870-93d2-8c15929aa32f@citrix.com>
X-Mailer: Claws Mail 2021.03.05 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_uNtWg=STt1g7QL8C7CVfIL"; protocol="application/pgp-signature"

--Sig_/_uNtWg=STt1g7QL8C7CVfIL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Thu, 22 Apr 2021 12:49:14 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> That said, if you've dropped the plans for the static version, I don't
> see what the point is.=C2=A0 You're literally saving 15 pages of memory (=
so
> nothing in the grand scheme of a userspace process), at the cost of
> added effort for the dynamic loader.

For some reason I omitted this paragraph.

What do you mean with "plans for the static version"?

Olaf

--Sig_/_uNtWg=STt1g7QL8C7CVfIL
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmCBcBMACgkQ86SN7mm1
DoDfWA/+JJFgznwihHc7bDGxx6BRr418xjyNHGS80ygY3CjFkd4dH0og4nUaJlzH
gJxCwkJOfEnViic+MOiPUF0p9Jdk93DO4CoMj1ZN5hjN/HfeWKd3B1nF/zzHI4bX
KzH9Ftrj070yy+8e9HgRpr5Wk/c7/9BEOMNS9t9KO1Rvbk9E7TZLRgcj5tPNAnsW
WXWwYfKmkhCCtF0rP9IOZy0xz4gRrC/PI459jmZ1SkkAapZM+YWLFbcZzzFyfwym
nXaJsTM0OtmPRvpO9u6jBpncTMK9PKTMMjGhbnCEOP4K9HOSYf8SHh7TG2pq3QL4
pUoTlHIWNCtJs1ZzP2Szfp0kkL9RBJEqFFF/ENN62OkbyihgD72oaZE1pE2oO5+v
hqaMWhqbCG3JyaVlyBbKIE4LL/pJMKmg2wm5HPeKJXD6JFMNgU+BQKVAoGgaF9rV
U1tNKh3btlgxFjCsVyXnOUEyDcARJk9nS4UKfun4CKY3g2/Jsu0gQCDADii/kDQc
DH+xyCUc053d6sw/EQtGSIYDCCwI3fYDcLigDrwx9cq7ysU6asA4rFJNh6FLykJV
hP9jNEccrS/arBM2T5S0lDwIbNOn/2aOSPIhlfwowNyfbQzyOMlDRCDBLo+ZVG/H
Ec1CLVS1IfwHCrc0QmXrAVUKh98CHvUKugvLdRRtHkuKw6vTvks=
=2z/0
-----END PGP SIGNATURE-----

--Sig_/_uNtWg=STt1g7QL8C7CVfIL--

