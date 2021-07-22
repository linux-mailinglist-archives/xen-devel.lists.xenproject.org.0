Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9938A3D276A
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jul 2021 18:16:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159797.293860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6bLb-0002TK-Vt; Thu, 22 Jul 2021 16:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159797.293860; Thu, 22 Jul 2021 16:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6bLb-0002R4-Sm; Thu, 22 Jul 2021 16:14:55 +0000
Received: by outflank-mailman (input) for mailman id 159797;
 Thu, 22 Jul 2021 16:14:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BaDu=MO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m6bLa-0002Qy-J4
 for xen-devel@lists.xenproject.org; Thu, 22 Jul 2021 16:14:55 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.23])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5675333b-ecf3-43c9-85fc-148ef6d04799;
 Thu, 22 Jul 2021 16:14:52 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id t06ddcx6MGEoY3Y
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 22 Jul 2021 18:14:50 +0200 (CEST)
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
X-Inumbo-ID: 5675333b-ecf3-43c9-85fc-148ef6d04799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626970490;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=T8dYJbteQPNpDGLd8a/nQ3UzPtcOM6/ECCoHc+vSoAM=;
    b=iRIbEh5Hmnif3dcoeV7u3l6gCxIRG+wthQw44J3h0H1NEvcPcFOBEoF7ZXfVtcq/XF
    et7/X3y/dXXk0JIkhXTCMBxMBopwIja0R/I5CDqklnEQpAUGV0udmFgGebigRO2DKe7k
    jDvgf+nBuj+0MY3zSWpXnX7zS4PhxKmjOP83b48oUw1yZ1j5cC4n+ZuIjHU8cdAWEGy7
    8zNV9BiCdUSHt7fpVkoSub76Di/+gvWdI1mpKcL1KDeAFI1hFapeef8WMRfcbUZzyZe2
    1gw3ABgjAtlPYxR1IIEitWWwNOTJXaLZflr0dlDCduEvXrBq3WGnzEF60T1cZZUPt7cc
    y0bg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF9UB6Hb03sYAkI/fzmsP3Z1g5sbWs9qexZScQL"
X-RZG-CLASS-ID: mo00
Date: Thu, 22 Jul 2021 18:14:33 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1] automation: collect log files in subdirectories
Message-ID: <20210722181433.2a1477e1.olaf@aepfle.de>
In-Reply-To: <YPbuo/JfpPNGjq2p@perard>
References: <20210708065435.24515-1-olaf@aepfle.de>
	<e84e3fd4-5439-4e15-e363-35c70fa8cad9@citrix.com>
	<20210714093104.52f25e70.olaf@aepfle.de>
	<YPGXm9F3OHqLk/ml@perard>
	<20210716164131.56a7b539.olaf@aepfle.de>
	<YPbuo/JfpPNGjq2p@perard>
X-Mailer: Claws Mail 2021.07.08 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hVQxrZfRruDhjgINKbG8rZ_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hVQxrZfRruDhjgINKbG8rZ_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 20 Jul 2021 16:41:23 +0100
schrieb Anthony PERARD <anthony.perard@citrix.com>:

> Anyway Olaf, I've deleted the repo, feel free to try again, or let me
> now if you want me to set things up.

I'm sure if I create a fresh repo 'xen.git' in a "group" 'olafhering', I wi=
ll be unable to push there because it is empty.
Not sure if I can force-push in case I choose to populate it with just a RE=
ADME and or License file, just to get some initial branch.

But I can try once more and see if I can let gitlab populate it from an exi=
sting repo, such as the main xen.git.


Olaf

--Sig_/hVQxrZfRruDhjgINKbG8rZ_
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmD5mWkACgkQ86SN7mm1
DoCF9A/+MLIylQpks1TaC6hUDY1bOfSiuukBjFchMypk4B3nsoaPscCX8ok4FQ9m
IoV7dykO6qc4RrQz+MC8ANPlQ1LPa5KB3Z4eu75gAHlvmmlSHGIMoJKLgZpR9a/l
0PO0DBiKaux9OFcA///ew9kHnFQbMLJY2fcibjdbus1HHbZ7CVhw6xaXHaeoxqJ4
iip8ExlDX4LdDyTiBQBvESyCNU1qmPng2yr+ZOfhWTYDz+4mM5HO5Q9G8e5czknm
UTTRDkxVGeM0KfxH+3xngT0HWoEewQyUtcBvx4wLagK3rYEEkQQRmp3kfx6s/QkM
6zNZJb1n/Q+yFPizG12qyuCtS7TDThbeiJQa8HeNG6r+bYrKByzGWqoBc5CYeJAL
YAV4dRkJkAtHjbUB3OQ/PLfWhYypQSis+hZZKMHhAydxIKcGpZQ6D/nraVpNHiDN
ryBCLmvkC1ukN+bEcXBGoAOXohUFQMiiWGgQchQZQSl+2Th/ItKJ8ldin8Y1Gqy6
De08GKQKLsVA4QOhrA8jJNNskVIcjpY/B3vXR3u9P3GnTAbpfNwqh9zQONve27a+
mD3rch1tz5mnQ2HMfgs5qZ1Il53uGTJaMQtc5MEGruIphE96bXM8M+MlhkbiR1W1
Wc9P9fKYECfxBg+C+dD+u+4b2Y4D13emu3F7ZySGK5EnPrzTfWE=
=CMTQ
-----END PGP SIGNATURE-----

--Sig_/hVQxrZfRruDhjgINKbG8rZ_--

