Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADDE3BD7CF
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 15:28:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151322.279669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0l7g-0000rs-L1; Tue, 06 Jul 2021 13:28:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151322.279669; Tue, 06 Jul 2021 13:28:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0l7g-0000p2-Hv; Tue, 06 Jul 2021 13:28:24 +0000
Received: by outflank-mailman (input) for mailman id 151322;
 Tue, 06 Jul 2021 13:28:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8sr3=L6=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m0l7f-0000ow-FB
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 13:28:23 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.166])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08c555f8-de5e-11eb-8495-12813bfff9fa;
 Tue, 06 Jul 2021 13:28:22 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx66DSGRuY
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 6 Jul 2021 15:28:16 +0200 (CEST)
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
X-Inumbo-ID: 08c555f8-de5e-11eb-8495-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625578096;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=keEoc9pnTcE1ukWo5zDM6C3DeuCpR3KKawt1PkRpVP8=;
    b=V4aNkEcaxnnTjyPS+ekm6O22DdIQP+l0ld9p+RrjEh5OOMnIHRUsQWrZ7xfcXcQw8G
    weC5q7HyoAYPYUz7acVBYV2KzpbC1dDwhT31iFPwJZt8zHUGXSEjeO6dLC9et27X/nhf
    uec2Nu1il+lZlJRWJ3/aJNhl+Mzv2NX1PUcHovrDLXOj7pzATkAJi9OUL9gdDFnW6XCP
    kM1HssbMhd3ZYk3p8pzRkLWXAYfU/Gf2hngeq+fiYIftDR3F/Vmv3geQWkqbk5Pz9E5X
    9njYjNMQZcjkOv6hjhdQ0lMx8/jEYyi/DFYdnob8L/1MT2qONje/BLSinI+zsqiMSXHQ
    SfCg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Tue, 6 Jul 2021 15:28:09 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
 <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] tools/migration: Fix potential overflow in
 send_checkpoint_dirty_pfn_list()
Message-ID: <20210706152809.49394c1c.olaf@aepfle.de>
In-Reply-To: <902720b3-d71d-82eb-9200-97f2b17dd264@citrix.com>
References: <20210706112332.31753-1-andrew.cooper3@citrix.com>
	<20210706112332.31753-3-andrew.cooper3@citrix.com>
	<20210706145804.1ab98f16.olaf@aepfle.de>
	<902720b3-d71d-82eb-9200-97f2b17dd264@citrix.com>
X-Mailer: Claws Mail 2021.07.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TNOc=r3bKXAGT0UGBrhJhvK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TNOc=r3bKXAGT0UGBrhJhvK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 6 Jul 2021 14:19:21 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> > 20: faults=3D 0 dirty=3D 80 =20
>=20
> What is this showing, other than (unsurprisingly) faults doesn't work
> for an HVM guest?

The dirty count goes down after a while for a domU that constantly touches =
as many pages as it can.
But yes, the current code uses stats.dirty_count in a number of places.
It seems all of the usage is just for reporting, so if these code paths wou=
ld get wrong input nothing bad happens.
precopy_policy may indicate more or less iterations, this is not critical e=
ither.

Olaf

--Sig_/TNOc=r3bKXAGT0UGBrhJhvK
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDkWmkACgkQ86SN7mm1
DoB8xRAAn9Gov/ba+f5N+h/BjGzrVVjG8UW9fREFzrwz49sPF/03CpAEmGKlYXf4
OpFFs07ySTfv9ncXqj/9rmpB5dSc8aj9kVmo6gjrTvM8+WmsaUxp5vg8/p+/xQMW
nq5EaYUCyj5pvR8U5qbnBxM2ogyoOSIYDrDq+iZBDMR6vxQpUZ5Gs8iKQgT8OGgl
jqKjgP2epwjARwyzPMZg/zDbaivm6F6QZ1wq/lPUG2mmHrenRwm+j9+Ye+hohxZL
LQw5XioXcBvMd55DlpO0tXCkAD4/1/OB9vmvb1N8dm2EtkwBXgSNMowkY9FwsOJ2
pQYoTLhRN/jZBx0tUgWKFJOdYQ+OlljV5u9fH1eqeFI+3NfMX7JoZfQCfarddcBM
Bhk9s3dx9CxNyH5QZjAfaFjAVOuNbyKSC3DWxA+jny4mtW+uXpYlRYt5ffANPJlN
iZJHcpVerlTxQgKKCDTCR4vYhCqHyxS1ijIsQH0VJoYHULp/U8doBp//cilzEjqw
7Jei1IgD+F0jr8YII65LGx9rhguEZk01qljHQh/+TCb0iZsUPaG2UEMmRidKbo2t
8lrgtEnKqZtJ66BqaK7B4nnCN0nrL3TYcszO6NFBOW2AxKcaALG6H+pjqaBF5qNo
eViSDJalH42diX3Glrn5l0ScRlu+opV8UjVioXoNNxBBgu5vZPE=
=QKX3
-----END PGP SIGNATURE-----

--Sig_/TNOc=r3bKXAGT0UGBrhJhvK--

