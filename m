Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD571CAB1
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 16:47:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQYfR-00023x-6C; Tue, 14 May 2019 14:44:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZE1V=TO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hQYfP-00023s-K2
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 14:44:32 +0000
X-Inumbo-ID: c6d644fb-7656-11e9-8980-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::11])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c6d644fb-7656-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 14:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1557845068;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=W49+MYCkxho/ivQ/ZhwPNLyTgrjDcbeItpEd/8voulA=;
 b=V32YLSfnUefUAwTPZEN141ri7LlBX2hSx41og6DyJr2JeuJ9Aum/32F7fKJms9CeLM
 bVR+KQhi6typ3xAlR70BkcGPrV8wX62vJeSsrVoa/oHTq3mfB6Pm6uTLQ5hVhp+oi+OZ
 6gf5lsTMFe5y7KwvOK/MGBS5GphAkzHcsjSzIH5hM/1933b6qqXjVDmjS5xRstmLrGCZ
 bzM2YdHxuaCMDQmQ3uJCqnlW5gw4uEnc3kOsdrgfVLiekoIeJDyxfJzZ5Wrfg9GkqDt0
 dbsshc/yTkBgMth5drYjo2ukrf/ZJM7MKVjBf+gNQsP/5DK90Q7Ba7S3kkDeLDKxtErZ
 iHjQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuYMxvZg=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.20 DYNA|AUTH)
 with ESMTPSA id U080cav4EEiO6X5
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Tue, 14 May 2019 16:44:24 +0200 (CEST)
Date: Tue, 14 May 2019 16:44:19 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Wei Liu <wei.liu2@citrix.com>
Message-ID: <20190514164419.23f9f545.olaf@aepfle.de>
In-Reply-To: <20190514143855.GH2798@zion.uk.xensource.com>
References: <20190514080558.14540-1-olaf@aepfle.de>
 <20190514101452.10c40b6e.olaf@aepfle.de>
 <20190514143855.GH2798@zion.uk.xensource.com>
X-Mailer: Claws Mail 2019.04.26 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v5] libxl: fix migration of PV and PVH domUs
 with and without qemu
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============3687344054943145547=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3687344054943145547==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/arOAbLS+/q._=r=CZBn=Sl0"; protocol="application/pgp-signature"

--Sig_/arOAbLS+/q._=r=CZBn=Sl0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 14 May 2019 15:38:55 +0100
schrieb Wei Liu <wei.liu2@citrix.com>:

> > While it is easy for the resume path, doing the same in the suspend path
> > needs more changes. libxl__domain_suspend_device_model would need to re=
ceive
> > the callback and set it if a device model is active. =20
>=20
> What do you mean here? Can't you handle the NONE case just like you do
> in the resume function?

It means calling libxl__domain_suspend_device_model unconditionally, and
let that function decide what to do. Maybe there is no downside to set the
callback unconditionally, I will check that.

Olaf

--Sig_/arOAbLS+/q._=r=CZBn=Sl0
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNrUQwAKCRBdQqD6ppg2
fmy1AJ0boCtGS9MWl4atTTKOmLqxeFlrcACgo6CG+mrp+QzCYCMjzLXBE5fvSpk=
=EsbU
-----END PGP SIGNATURE-----

--Sig_/arOAbLS+/q._=r=CZBn=Sl0--


--===============3687344054943145547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3687344054943145547==--

