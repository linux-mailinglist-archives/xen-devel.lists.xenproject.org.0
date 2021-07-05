Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 958183BBE0B
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 16:12:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150249.277825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0PJy-0000K4-J8; Mon, 05 Jul 2021 14:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150249.277825; Mon, 05 Jul 2021 14:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0PJy-0000GR-FM; Mon, 05 Jul 2021 14:11:38 +0000
Received: by outflank-mailman (input) for mailman id 150249;
 Mon, 05 Jul 2021 14:11:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N9Vt=L5=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m0PJv-0000GF-Uu
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 14:11:36 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.50])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ba1cccf-aae0-4e27-babd-adc706ddacf1;
 Mon, 05 Jul 2021 14:11:34 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx65EBRMph
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 5 Jul 2021 16:11:27 +0200 (CEST)
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
X-Inumbo-ID: 7ba1cccf-aae0-4e27-babd-adc706ddacf1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625494288;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=A7Ab40+AHdWu5VhwpLoEgm/N9OiNWEJxT/Htt5QNPD4=;
    b=BNShVJYVNYLPspNZQ1qxk1u2FZpMRZdTpQM/nm/e2kUeua9CsEKz6KNMpvxJkYIZHq
    jucTBaInJBQQosE61XHeUfwkJB6GNVkPscI9yMiY6jY8oj4oxYYrwBg4Zc/TGOT2siw4
    vjysY7/Cc3S8hJycczrswcN+GmX4sHF39gQKf7Rq6A+mrFc1rV1mu0gzZ9/jqULsgU5/
    gLuq9l66/sddR+Ctyfd53Bsd3mY2x6I20IXNq1/9M+uCsAT3mw2QHbSHx04qrZTgMFZJ
    A1F0p82XqrjUFuzRZVvbidsUNkYFY5ZuLwLtwn+EsNTx50NOnZClR9V2XBVZ+FWjOty7
    MC/Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Mon, 5 Jul 2021 16:11:09 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v20210701 15/40] tools: prepare to allocate saverestore
 arrays once
Message-ID: <20210705161109.15d2d4e0.olaf@aepfle.de>
In-Reply-To: <6bd5fbb4-881f-e41c-46f5-d31c93a7ff7a@citrix.com>
References: <20210701095635.15648-1-olaf@aepfle.de>
	<20210701095635.15648-16-olaf@aepfle.de>
	<644a7a4c-4fab-07be-2e69-2637254de859@citrix.com>
	<20210705132700.05d92744.olaf@aepfle.de>
	<6bd5fbb4-881f-e41c-46f5-d31c93a7ff7a@citrix.com>
X-Mailer: Claws Mail 2021.07.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AwbfuAJr5v5S2cv7GxAgSow";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AwbfuAJr5v5S2cv7GxAgSow
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Mon, 5 Jul 2021 14:01:07 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> > The last one is always way faster because apparently map/unmap is less =
costly with a stopped guest. =20
> That's suspicious.=C2=A0 If true, we've got some very wonky behaviour in =
the
> hypervisor...

At least the transfer rate this last iteration is consistent.
Since the only difference I can see is the fact that the domU is suspended,=
 I suspect the mapping.
I did no investigation where the time is spent, I should probably do that o=
ne day to better understand this specific difference.

> > Right now the code may reach up to 15Gbit/s. The next step is to map th=
e domU just once to reach wirespeed. =20
>=20
> We can in principle do that in 64bit toolstacks, for HVM guests.=C2=A0 But
> not usefully until we've fixed the fact that Xen has no idea what the
> guest physmap is supposed to look like.

Why would Xen care?
My attempt last year with a new save/restore code did just 'map' the memory=
 on both sides. The 'unmap' was done in exit().

With this approach I got wirespeed in all iterations with a 10G link.

> At the moment, the current scheme is a little more resilient to bugs
> caused by the guest attempting to balloon during the live phase.

I did not specifically test how a domU behaves when it claims and releases =
pages while being migrated.
I think this series would handle at least parts of that:
If a page appears or disappears it will be recognized by getpageframeinfo.
If a page disappears between getpageframeinfo and MMAPBATCH I expect an err=
or.
This error is fatal right now, perhaps the code could catch this and move o=
n.
If a page disappears after MMAPBATCH it will be caught by later iterations.


> Another area to improve, which can be started now, is to avoid bounce
> buffering hypercall data.=C2=A0 Now that we have /dev/xen/hypercall which=
 you
> can mmap() regular kernel pages from, what we want is a simple memory
> allocator which we can allocate permanent hypercall buffers from, rather
> than the internals of every xc_*() hypercall wrapper bouncing the data
> in (potentially) both directions.

That sounds like a good idea. Not sure how costly the current approach is.

> Oh - so the speedup might not be from reduced data handling?

At least not on the systems I have now.

Perhaps I should test how the numbers look like with the NIC and the toolst=
ack in node#0, and the domU in node#1.


Olaf

--Sig_/AwbfuAJr5v5S2cv7GxAgSow
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDjEv0ACgkQ86SN7mm1
DoCXTw/8CSnsnnrIxWB9tn2aPd1KoMRHzVA3R1beCHEm1CvBxG2VOxH2lSbbV1g0
DBHvG6LCOcSrSpenp7NYa30kGLt6fEjjFwjU0vl8VSD7KxL5hpN3CE84n43hQaBL
fIDP+PtKD8x6FdMGT7wcbrBEckGy9TMsQK2FjYxNGt9peFjc3g/xKieVtPZy9f1k
ta7cLD6tCtCC5HkpJ+euiL/uMKLKnFn8iJPl9DGr8qIf+9uVTG7/K0vEDvFqtl0A
Y39+u5gsckc50YngtCjr0hN3f/oOwkEViMP9y3diuOUv55mGAhb+KsxdBkDBVDOh
LNzRSDbXjPnJm3tsF+OMtiKu682jiXkJjSFinXpmnJOHnXoGGNrS4LRl2xv9GY7w
Quy7w3YXh6ntXw7ob6c6XdjrNeERSYihUVRmG7SUOa4WR0mTWBUSDoMYV4n9m3Et
us5QrRXB7BVabxgQ0VCZDeE2gOREaFnQb2nVaCvHNFY9DwdSGyTKHs/OLcJsKYlu
SjySsNP24EiyHa2WFjtJJavUujAPNpfGkMuTae2ZJY8aKfaZHC8SNgNqdpTu5b6R
begD/DkSTRD0JH0eSY6GvvXR/HacmlchqvTunt1wQEAlrZHluzU7dsFd4yftfOBP
5S0ZNOQHtrvNoyAUS+IXF5NFnJaUQ8XSw+71yNbvh/Rf5qeDQjU=
=+TQk
-----END PGP SIGNATURE-----

--Sig_/AwbfuAJr5v5S2cv7GxAgSow--

