Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4665206C9
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 14:20:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRFKz-0007dQ-MJ; Thu, 16 May 2019 12:18:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ADxN=TQ=suse.com=ohering@srs-us1.protection.inumbo.net>)
 id 1hRFKy-0007dL-0F
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 12:18:16 +0000
X-Inumbo-ID: ace13000-77d4-11e9-8af8-d333dc6c8213
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ace13000-77d4-11e9-8af8-d333dc6c8213;
 Thu, 16 May 2019 12:18:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 66CC5AD57;
 Thu, 16 May 2019 12:18:12 +0000 (UTC)
Date: Thu, 16 May 2019 14:18:05 +0200
From: Olaf Hering <ohering@suse.com>
To: Wei Liu <wei.liu2@citrix.com>
Message-ID: <20190516141805.281f972e.ohering@suse.com>
In-Reply-To: <20190516140451.06cfcbfe.ohering@suse.com>
References: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
 <20190516110735.67e19d15.ohering@suse.com>
 <20190516104540.7hiqsn6qjeaam2c6@Air-de-Roger>
 <20190516125735.6c1bf1ca.ohering@suse.com>
 <20190516112450.GW2798@zion.uk.xensource.com>
 <20190516133857.742e4f13.ohering@suse.com>
 <20190516115043.GB2798@zion.uk.xensource.com>
 <20190516140451.06cfcbfe.ohering@suse.com>
X-Mailer: Claws Mail 2019.04.26 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] Regression in xen-unstable due to commit
 3802ecbaa9eb36
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============5327555863726489374=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5327555863726489374==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/s4/ms4yeVkDLgI369EHZpr8"; protocol="application/pgp-signature"

--Sig_/s4/ms4yeVkDLgI369EHZpr8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 16 May 2019 14:04:51 +0200
schrieb Olaf Hering <ohering@suse.com>:

> There are quite a few checks for device_model_version, they would be all
> wrong if the assert is removed, or changed back to QEMU_XEN. Perhaps we
> can continue to live with that error. device_model_version could become
> a local variable. If it is not set, assume the caller just wants the
> memory size and enforce QEMU_XEN again within that function.

I think that is what should be done, just for the sake of
libxl_domain_need_memory. If an incomplete b_info is provided, assume
device_model_version=3DQEMU_XEN, maintain that state in a local variable.

If we want to provide another new public API to fill missing defaults,
that could still be done in a separate patch.

Olaf

--Sig_/s4/ms4yeVkDLgI369EHZpr8
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXN1U/QAKCRBdQqD6ppg2
fkffAKCNYh5INArE9YmuocvLyPFhjJvH1gCggi6fEGZWumStTgpQoLk95ed53mM=
=9o5g
-----END PGP SIGNATURE-----

--Sig_/s4/ms4yeVkDLgI369EHZpr8--


--===============5327555863726489374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5327555863726489374==--

