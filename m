Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7247F3BF2DD
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 02:29:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152754.282188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Huo-0004Ri-3K; Thu, 08 Jul 2021 00:29:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152754.282188; Thu, 08 Jul 2021 00:29:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Hun-0004Pj-VU; Thu, 08 Jul 2021 00:29:17 +0000
Received: by outflank-mailman (input) for mailman id 152754;
 Thu, 08 Jul 2021 00:29:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Di/c=MA=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m1Hum-0004Pd-P4
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 00:29:16 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89db63ae-8e7b-42e4-b8d2-b0124787c480;
 Thu, 08 Jul 2021 00:29:15 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx680TDXrg
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 8 Jul 2021 02:29:13 +0200 (CEST)
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
X-Inumbo-ID: 89db63ae-8e7b-42e4-b8d2-b0124787c480
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625704153;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=7NCZ+UrRcNjTfDzy1NJMTcfczUd64LlkUpj/dmVl5KI=;
    b=pusSIABDH0JqiCeAwG7eUfH5ThS3wDZJx61vUGRgqKOPG6wQovxgpHs2ca41C2zmUI
    dmBSslimHBKbe+nWgmrvgoo2fIB/JHDZT8vwMRGqVM8xJ5k8fcXG4H0afhR+v+Dh+t0Q
    5dJ7FDPNGhgQc1Zjlz+dX+X5YEJdlOc6kwZelM/EI2G7H/kiUL35lChB0hD85Vv5FFMh
    KYPaHk58P9N5B+mkBYxebZIscBvhdU0rIDJ7ON9xUCyOxDAH80oSITUO8Pt0VLeQCvrN
    Gx4ghT29OwouXbypAUxpbq7Skndtk8Z9oQqono69oq4MFA83pxI+2uoY6Butlw5lCD22
    R+Jg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Thu, 8 Jul 2021 02:29:05 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 2/2] automation: Check if ninja is available before
 building QEMU
Message-ID: <20210708022905.23e53efb.olaf@aepfle.de>
In-Reply-To: <930b58b7-326b-1855-6f24-2e2a4b3ed4a8@citrix.com>
References: <20210707164001.894805-1-anthony.perard@citrix.com>
	<20210707164001.894805-3-anthony.perard@citrix.com>
	<e775d987-939c-e7dc-077c-fc61a2883f6e@citrix.com>
	<20210707215235.76f15361.olaf@aepfle.de>
	<930b58b7-326b-1855-6f24-2e2a4b3ed4a8@citrix.com>
X-Mailer: Claws Mail 2021.07.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U/_DP1ZZ6ew/oBs+i1Z2iBj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/U/_DP1ZZ6ew/oBs+i1Z2iBj
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Wed, 7 Jul 2021 23:44:33 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> On 07/07/2021 20:52, Olaf Hering wrote:
> > Am Wed, 7 Jul 2021 18:46:03 +0100
> > schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
> >> iPXE failure =20
> > it just needs to be updated to ipxe.git#master to make it compatible wi=
th gcc11. =20
> Ah great.=C2=A0 I presume that is your "[PATCH v2] tools: ipxe: update for
> fixing build with GCC11" patch which has been sitting neglected on the li=
st?

Yes, but the build logs indicate gcc10 is used in this container. So it mig=
ht be something else.

Olaf

--Sig_/U/_DP1ZZ6ew/oBs+i1Z2iBj
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDmRtEACgkQ86SN7mm1
DoBcqRAAmz6GKXxqCyqU0nqjvjb2x7klEd4KF8+juPSnXmNJp1omi0t3WRVeJJGp
Te5IXhj/aFACqHMHrHC1P4n93N3Tgtv1ThXLd7i7k0Axr8fUNry8JwldEiXxOVT0
f9E4W8bzHi8LqnimV/qNpI35JakoFW81IEpbnb6MwKYXsuvJKCgLXXSei90Rbo77
nfhkRLyGvEJzsEsaWvKHcrIDYcdO3nDJHifcylZXwNa0KVyXxj4hM2Axydt7lBIO
n/5tdPRUBWWIDc13ZIUlHB1+GCRRXDsjht/gsGG0LulDTJtim5i5v8SncRvLDGAQ
eoQGu7FcHOIbbsBjaHllhm7hBweuDXAh+lLfPLFlGmszf4NLM5TLTDF3hGO/0yDb
fFQ2QVTUDFB7qsKi7DlZTT0Ewd9r1H3gyWvn8r9HO9t7KQ5qiuX6mX8MqiPZgYlc
nDVYvONBnXRkU34WQdiiMV7exPlFSyBr6pOCOib9Gaap6UC2ipXVYGGLSaWCZcJo
ZwItMU7Rhd9ahOj/a1A1e5BBw+y9005UyoBWhZmMDMSBVF4As0PI08qJRZGqwhRX
mMuIxNwexVNqXIi133J7P0ZOhzNc1zb6JLJSsMSs4tNnBNC9XxD0Cki7s5jiY0XL
NAZHpKUYg7+f9+onap+cSoYZevOliNxsbOt1MYfb6Sb0bFN+97w=
=agkk
-----END PGP SIGNATURE-----

--Sig_/U/_DP1ZZ6ew/oBs+i1Z2iBj--

