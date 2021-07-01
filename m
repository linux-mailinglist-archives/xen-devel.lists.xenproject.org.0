Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A11C13B94B0
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 18:32:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148964.275329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyzcB-0005VM-7a; Thu, 01 Jul 2021 16:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148964.275329; Thu, 01 Jul 2021 16:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyzcB-0005T4-4B; Thu, 01 Jul 2021 16:32:35 +0000
Received: by outflank-mailman (input) for mailman id 148964;
 Thu, 01 Jul 2021 16:32:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lyzcA-0005Sy-5W
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 16:32:34 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8da98a7-81f9-4a80-86bd-e6db86daf426;
 Thu, 01 Jul 2021 16:32:33 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx61GWV7iX
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 18:32:31 +0200 (CEST)
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
X-Inumbo-ID: e8da98a7-81f9-4a80-86bd-e6db86daf426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625157152;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=SZ8Fozes6rdvs8EE03cNo6FUdtEDZhZS+j9Mr6fLabc=;
    b=M3+6Dnu+8a/OcGv7v7viNn4SWJhYeTg3dC6RZk0YWFvR3V+yE41+hjZmivdl3SYuf0
    NEExnm2XaMpEhcfuo+/EGLIIRiNJ5U6PZytg05CfCsZx1JpKYENTPxWN1hbYDNs6UBiV
    zLkZSndErpXicfyH1LmjbB0OpMYy/VzQOcNcp7hIBcSKvXmzrNW0nCDe7ni9bt+MdYDJ
    PJSxfXR3M6lUfEAjHRjFrE6Gjp/7XKMP4CGHwbD440CBxrPeNNvSmVXvlHFoMF7vAjVV
    ytqod8O8jqFDJlxl0t9LIlxlShogKY/HVxKvtY1f/04pcyoDfhPAhLdBie90pXfVjvi1
    I1/w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisQsBBSIa03sY9BUY2ao0oygRsMfcqA6zjDLeeWXNg=="
X-RZG-CLASS-ID: mo00
Date: Thu, 1 Jul 2021 18:32:28 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>
Subject: Re: XEN_SYSCTL_cpu_policy_hvm_default truncates leaf count
Message-ID: <20210701183228.1f8fce35.olaf@aepfle.de>
In-Reply-To: <967b6463-c1bd-6ced-bec6-bafe02310e09@citrix.com>
References: <20210701125623.593fe3ae.olaf@aepfle.de>
	<20e828c9-e7dc-4401-9307-a6d72eb618d8@citrix.com>
	<20210701170009.5a8be33f.olaf@aepfle.de>
	<48cfe27b-70fe-36aa-833a-7d78e205528c@citrix.com>
	<20210701171819.67968d4d.olaf@aepfle.de>
	<dc9af473-b613-721c-87b8-d259a2448c09@citrix.com>
	<20210701182303.53756e1e.olaf@aepfle.de>
	<967b6463-c1bd-6ced-bec6-bafe02310e09@citrix.com>
X-Mailer: Claws Mail 2021.05.27 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ty1JdHR.1N6X/Iy9fAyrNi2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Ty1JdHR.1N6X/Iy9fAyrNi2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 1 Jul 2021 17:28:25 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> 0x8000001c

Dues this need to be tagged as unsigned with a trailing U?

Olaf

--Sig_/Ty1JdHR.1N6X/Iy9fAyrNi2
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDd7hwACgkQ86SN7mm1
DoCzXhAAjFSj9QS1/D0i46vC6isNk/+CkpqcQAgOLlmDgdOxF4EFjufGKXNkKixx
XN/ErlxqOK0uyrKFVH58QLJAOIDSdy593WELqc9tu3o3oYxAoyBSFFxol3EORJqr
e9iA7Tp2a+4dVmQ3iRXw6s5Zapo4r/G/pKoTapWW/lpH1aG02GwBO+p088T88eTp
bkaaaaK+8rKO1la1dPgRqIjhhpXS3o3kCVhEM6tAlbw9VREXQP8ubZ0Larigyn5W
TdEJwPrJrBsKqgITfUrY831a/4X/ceqimTe/ZSseY/MA2Py5uWpFJ/GSzFAm4aI/
KxEW3fWY2TIk1eki3SqWDy3e+lsaS+k1A0ut0cVr38gy7LBCaZ80PC2Hvcur/vqW
Zizsgu/uV3jwwwc0HFhi6Ukn0/7lZPK4NHtDewsDyzsHjEQUqTLIug7ioYG14a66
RuXdWL/NpIrEID2KNlLjY6isvthW9BAzHUSmwA5rW6pquDjj1ULm43k3Z6c684fP
UtFeNmR93iAar4Wn2650hCTpuiKAuruZZw1lNoL+51E3YTGzPQORBw/xyhOPLhNc
x9p3e0GFcl2yTpwzHvKYyCkSLI5zWTfFbvTrCMjs9TfOTVP4Kb7/sDPsdYkpYM4C
77PXaGR5elYEeFsfS9zlCllITofCNUZLcJvd3SmD0BV1W5sbEdc=
=+Aaz
-----END PGP SIGNATURE-----

--Sig_/Ty1JdHR.1N6X/Iy9fAyrNi2--

