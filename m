Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 237E03C2169
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 11:21:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153505.283610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1mgw-0008Mb-CT; Fri, 09 Jul 2021 09:21:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153505.283610; Fri, 09 Jul 2021 09:21:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1mgw-0008JA-9S; Fri, 09 Jul 2021 09:21:02 +0000
Received: by outflank-mailman (input) for mailman id 153505;
 Fri, 09 Jul 2021 09:21:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AxIF=MB=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m1mgu-0008J2-L7
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 09:21:00 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.52])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e39f9a5-3ff7-4b13-a5a8-09929b9ac25a;
 Fri, 09 Jul 2021 09:20:59 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx699KldeT
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 9 Jul 2021 11:20:47 +0200 (CEST)
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
X-Inumbo-ID: 2e39f9a5-3ff7-4b13-a5a8-09929b9ac25a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625822447;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=5eochGW7odPx77rwB+QMk7QUCNnEiHfeIjBN466b8q0=;
    b=rSodZlMXwXN7lBHcvAXIfqrrIHGwkYOKGyzG1AyrS/G+HPGlJiafy0n0u33Av8oNcf
    EmOhJZmfrxKXJ6iFJ2ZzhCoLH5RJCn9PGC+D2OOPARY5uDwyqBcNeDGr1R+yoAqTxChX
    YXe2vI2+cRbDMa2dT3NPZUAqxkzDRR7RNvvlS/2U1umrdB6HsUzRwmmwXvMUWGiDJROC
    JvzesEAkSx+xVZ+epTKIOiV0nu7XHVM35RTOPbKHsYTKvxamSz9Yeph0HjdG5fSPKVD+
    rNzIT/PJPQszInPc0eTuFvL0nXydASZGzSC74gxHFi9ixFhbPglDIsGvCwqGLAmAw7kU
    pqdg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Fri, 9 Jul 2021 11:20:40 +0200
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v20210701 07/40] tools: create libxensaverestore
Message-ID: <20210709112040.2dd4ec8d.olaf@aepfle.de>
In-Reply-To: <20210701095635.15648-8-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
	<20210701095635.15648-8-olaf@aepfle.de>
X-Mailer: Claws Mail 2021.07.08 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XUSGmeNa2Dx+F8hKNYzMB91";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XUSGmeNa2Dx+F8hKNYzMB91
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu,  1 Jul 2021 11:56:02 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> Move all save/restore related code

This is now 6 months old.

What is blocking approval?


Olaf

--Sig_/XUSGmeNa2Dx+F8hKNYzMB91
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDoFOgACgkQ86SN7mm1
DoDEIQ//dhOo/oTj9sPng39SsmZQ/H88HUCXU+DU7fSS4WPD5AuUiEx2i97Dyerh
z7zow1xis6Pkx0xxIT878kzbG3yfqJAs9P0OLLgkhCu/lsOa4Iqa/K1BpZkk1YaH
n9v0M2fxZ6htXMM1nWH1ykV6WUEkqzpQoI3mMgz40s/6ENxv/PnE7RGv+F/r+51/
8jvcGCvsRyqyNufYISqLOAhlBJk7WWaWsD98nVWySycQvfmR7XPIDrDA1ZYLKYPc
GOKkpU21yooTxpAgMPBwde57G1YyoeqmRosKHUd/PIIiIp5L6HtAlyMGPcuXPh86
+If7mKsZeY24ZO2rOYd8qakIs+gflm7HZ6DV2k6yW6Ga04JKEIoMQP0u7JGjqhMd
PRu1LmPA6DLdhozJGnAO14wfUT5FmZxm45moCsZJjwvQJeEt79VsaUt8Ekow5xPB
fqsfydQdxuDklQq2Y33zmiKugfvD0rqE62hjrM42xmiclkqFYAUTEe57MWfj/j6x
Pce8KUMeA3t1pfa0YYgWSOnOtE196dee8WAy3Ac/UonLbykHfjmSXCHj6Li7P+SD
lb+i/rt5TgkLuR+Pa3o+CY7o125t5PjSD2sFN6BG9EstJdGJ1Igk5rvsxpQr+HGs
Ww6PVpPWPgONLUzjbQDrLhXqXuB+fOHHrK3I3bokol0feeBiiKQ=
=riy0
-----END PGP SIGNATURE-----

--Sig_/XUSGmeNa2Dx+F8hKNYzMB91--

