Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 619E83BD828
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 16:11:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151397.279805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0lnU-0003S7-Uq; Tue, 06 Jul 2021 14:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151397.279805; Tue, 06 Jul 2021 14:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0lnU-0003PK-Rj; Tue, 06 Jul 2021 14:11:36 +0000
Received: by outflank-mailman (input) for mailman id 151397;
 Tue, 06 Jul 2021 14:11:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8sr3=L6=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m0lnT-0003Ov-Ao
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 14:11:35 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.164])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1100dfe9-de64-11eb-8499-12813bfff9fa;
 Tue, 06 Jul 2021 14:11:34 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx66EBRS8B
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 6 Jul 2021 16:11:27 +0200 (CEST)
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
X-Inumbo-ID: 1100dfe9-de64-11eb-8499-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625580688;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=cDMD1gNWE5j8OLTHFeB1kRoYn5Myc7ogHwXW4cwdSIU=;
    b=LSSMWOLlp3PCpEwGf4mcmQvxS9mR5wxyJipQdyBZEIzHqJJUIOXk2RLtc+xHuTD0R9
    vVODq+6K9mWSvT0VA+v1YbsUhYPtAAyKnm94euvlduk/lmxFD1yNWij9OpmBEcwQnTq6
    2qr+zJr/BlWKizKTZWSTYWCpfRUyqy1ZW+12Ml+Yi9LVHWwDNvimV44+xkQklZIEDFXc
    ACsPiTaiVSXLAbJ7rBp1HL9ixJzMcWvLBaR6tY1xIcK7JbHrZAE2K1jk65LDRkZsjArk
    vj0iQifIjVtclTTBKkTcUGMbbu7ApBG8y7FkmgbR0/fqn2l5/+RRluS2C+feqVvWBrqN
    QB2g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Tue, 6 Jul 2021 16:11:20 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
 <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] tools/migration: Fix potential overflow in
 send_checkpoint_dirty_pfn_list()
Message-ID: <20210706161120.2b6394a9.olaf@aepfle.de>
In-Reply-To: <20210706145804.1ab98f16.olaf@aepfle.de>
References: <20210706112332.31753-1-andrew.cooper3@citrix.com>
	<20210706112332.31753-3-andrew.cooper3@citrix.com>
	<20210706145804.1ab98f16.olaf@aepfle.de>
X-Mailer: Claws Mail 2021.07.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nQVoWiQY2H7L4lc8CE240yE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nQVoWiQY2H7L4lc8CE240yE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 6 Jul 2021 14:58:04 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> the reporting is broken since a while

A quick check on a Dell T320 with E5-2430L, which does not have "Page Modif=
ication Logging", indicates that staging-4.5 appears to work, but reporting=
 in staging-4.6 is broken.


Olaf

--Sig_/nQVoWiQY2H7L4lc8CE240yE
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDkZIgACgkQ86SN7mm1
DoCo9hAAlGe7Scoremb7ogQYmoT6MO/2LxRLprlcnbe7q4YzH3URFvrtN+Z6H7D+
BINw68PQi4jqZfycwGw8VBUtA/xUb205Zp0JvHy907UbeDKTFeGuTUg3Y24Duk9h
5JwsmahxZuaIGMRzJMqAXLHgeZkcfCYocZ1WcsAqsts05dV7N8YrWhrc+oxFjY//
kzqYfE673bnyXq8CZrf8IlOK7O2CLnfGFYcXkUHKcwo1Zc4tfVd7Rbwf4bTxKXcH
vuIBQnveXBrRNJlU1vxiXuu+CAO9UPHMFbQ/V9jLsYt7aS9OAWnEdVgATv2z5GWI
U43sZ7yndaOYpV0+BY3fWyZSsyn02TNqtM2r4aQrE3ym9Zc33vfm5FBqLwEJ6ihS
Z1bPwYlPIPX3eHJui09GjyZeHe8AhpAh+zBhwdBuWz5110rPqTbxsCmnwzTOjYhE
8A9L5mdEs5Bga9kpx+5Z3ZhrPTu4YEleM2956vVBkBYxwRlJk8YZ8izHCT96NF+w
jRjAsAQc6JuAYJUpXEGqJNDQFdQFrDhbWQG55B9DgBTHiwsaMbvw6yoAbugwNJvH
fajvfqWQqOkvDZCRtnaTsWA7MXkNcrWXRnV+zhG3/oAGHJIherlDBSnzRugdPxi4
IatTiJFx1yKJNVBBVunpzzsYOve86BoEMSyAEsn3sCbjqbLVTxI=
=pWiU
-----END PGP SIGNATURE-----

--Sig_/nQVoWiQY2H7L4lc8CE240yE--

