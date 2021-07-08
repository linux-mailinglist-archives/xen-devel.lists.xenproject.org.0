Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 848193C1510
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 16:21:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153152.282944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1UtT-0005VP-DW; Thu, 08 Jul 2021 14:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153152.282944; Thu, 08 Jul 2021 14:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1UtT-0005Sn-AA; Thu, 08 Jul 2021 14:20:47 +0000
Received: by outflank-mailman (input) for mailman id 153152;
 Thu, 08 Jul 2021 14:20:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Di/c=MA=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m1UtR-0005Sh-73
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 14:20:45 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.23])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e35a0b36-f64e-4aa0-aff7-2977f4108cdf;
 Thu, 08 Jul 2021 14:20:43 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx68EKfarS
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 8 Jul 2021 16:20:41 +0200 (CEST)
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
X-Inumbo-ID: e35a0b36-f64e-4aa0-aff7-2977f4108cdf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625754042;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=3O4AkGnlRCXNoQoz4cQMzgXir54YFm6vf23izuYy6mA=;
    b=NWxBdwrRlYQQPQlmUx2MVEj4eu0mjIyy2ZOoe+rRwwc0WaBGTbCU4A7uclbr4DZRfU
    bnTdXQ90pwFu9WxK5YkK6pfVuOsQBJltJpI57dAfMbxCaSa8Z6dBe7dGov3gdinJ4Tct
    3R5426X9Jrccy3GKZqmbd0Ltz+BMAeFcDPW7/D5uKkRwrT9xH0ReuoegtxWAtm42FA9t
    KGtGjJ6Ks/L9ufFKzceYQ5ISK+BSw9KzVWo477ZxFocslizU0q3fj8IIAOxsP2zc/ZFf
    U12bG6HsKub7F53vUW4XV/4R40ZdSKjpEzqEFBcW1ShqqDMP5+o72Sg/qtpNmzGomh1a
    /PeA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Thu, 8 Jul 2021 16:20:35 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 2/2] automation: Check if ninja is available before
 building QEMU
Message-ID: <20210708162035.273e2641.olaf@aepfle.de>
In-Reply-To: <8878bdd2-fd3e-92c0-624f-cb0ee9deb280@citrix.com>
References: <20210707164001.894805-1-anthony.perard@citrix.com>
	<20210707164001.894805-3-anthony.perard@citrix.com>
	<e775d987-939c-e7dc-077c-fc61a2883f6e@citrix.com>
	<20210707223551.5462c74e.olaf@aepfle.de>
	<375823a3-8b49-7aab-ca2a-af219234b5e4@citrix.com>
	<20210708023224.6c05ff5b.olaf@aepfle.de>
	<20210708142309.6d093d7e.olaf@aepfle.de>
	<8878bdd2-fd3e-92c0-624f-cb0ee9deb280@citrix.com>
X-Mailer: Claws Mail 2021.07.08 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Kb_Xg6ELy=NzlVCrl5Q8sht";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Kb_Xg6ELy=NzlVCrl5Q8sht
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 8 Jul 2021 13:51:49 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> That said, the tumbleweed containers were rebuilt far more recently than
> that, so something is wonky...

After playing with 'automation/scripts/containerize', docker image ls shows:
registry.gitlab.com/xen-project/xen/suse   opensuse-tumbleweed   f9b84e2346=
f0   7 weeks ago         2.27GB

No idea how that created a container with broken content.
zlib-devel.rpm exists, but libz.so is a broken symlink.

I will update the README to list the required steps for updating.

Olaf

--Sig_/Kb_Xg6ELy=NzlVCrl5Q8sht
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDnCbMACgkQ86SN7mm1
DoByBQ//cw4aKDHy8AQmTmIruHHZZKmPJIRWRMVEELtvQw7CdZlYbBB5ovqUSHwE
b925JBVhDrzEq4GtmeIbX3ZOc4FNxIaDWXC8z5bWWWdIrboQnjKseXSk6y/nTc3n
NJm1t6Qoyeba9qSPiuwJQog5odoV6aJZS3oxI39ZIMjx0oaAPRl8p1nHweTsNt8g
hEX28yBdKSa/ZXY6brH7GSsa4jRt3VYvDfHKtRL2Y7FeH0SLCSN/HIzGGh6/ogbA
FMrZC2TjHmhAhZ67L2r6PTIX/D4OHUtqvbuwtzV7I/dGSEk2ICXZuBh/UTNp+oQ+
/gC7vb4hFCP+q/E+r9PyXlK4/yRkLMeruuNU8QwDoRIEjw2eZ+yBqIgyt7kUi5FD
En2/2UccpxiixTnjGcDs5H7Mpc1Zb1Gy8Ccy0FcR/0vynhe+YiptxryVK+V/6rGt
PpBNapyCH2ZKglaDXQ4PZBPkeY/kTvoyZjvSjCTUe25kb2McQIbVlE1w4muy9ycT
QG8ug43+Lum0cUQveFQSEZ0bHSh2Gdbu2WA4RqRIRkOE6zjM41ncqXwt7ElGVJr4
SADPqTcQkhq7Zxh+dIn1XwdA5QOJaqsjIzIAW+IKzA52X2xG0x+6cFwMIzkeCmz3
l2U5q1tb7NTDEXiHp6E1rOEVdUNxpItO/lhqbGbHQ6Kp3GeHYn8=
=Rqy9
-----END PGP SIGNATURE-----

--Sig_/Kb_Xg6ELy=NzlVCrl5Q8sht--

