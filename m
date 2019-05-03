Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 012FF12FE4
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 16:15:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMYul-0004s2-OM; Fri, 03 May 2019 14:11:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1b8=TD=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hMYuj-0004rl-K9
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 14:11:50 +0000
X-Inumbo-ID: 62bd8bd1-6dad-11e9-843c-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::10])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 62bd8bd1-6dad-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 14:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1556892706;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=/MKrlFXOXewmKPZCpDsy/lRs0J4Qy09THxd7on9/Cu8=;
 b=CKtBbQt9nEZCso1e5hed4jkX4E0CaYjlK4wGNab3Ajhw7GiqW0nXfoa6PHmB0NRFwg
 I9E2AbKVNyZqk8GPMkqsbZXC3+P0kWUlKtCftRryyyGi/mu1mwnKPlHdQcVLgDPcf0Vq
 GTsUqKeao54GD6f5ZvN0jzY/b+15k5PoUek5QReREkER6YCQb3ihYaPzlLfPRvC66vDU
 OIMf5ICnDkgX0Nq6PtI92siYptSkeLcM90jSog09cIXQScBD0nkqFDqNID6l+MxZ0atO
 zVdhgLTwpyaws0/OXxXVlMDBGkfgbaJ8P4UrddhVW4dKByXEFACuWXe9fup9HKvbLNSo
 Essg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4Afztr72gK4M57t5rnDow=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.18 DYNA|AUTH)
 with ESMTPSA id 60a847v43EBbLeX
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Fri, 3 May 2019 16:11:37 +0200 (CEST)
Date: Fri, 3 May 2019 16:11:32 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190503161132.06f85271.olaf@aepfle.de>
In-Reply-To: <20190503110411.so4kiwmji4en3ugc@Air-de-Roger>
References: <20190503094251.16148-1-olaf@aepfle.de>
 <20190503110411.so4kiwmji4en3ugc@Air-de-Roger>
X-Mailer: Claws Mail 2019.04.26 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] libxl: fix migration of PV and PVH domUs
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: multipart/mixed; boundary="===============8120724134591746262=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8120724134591746262==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/Y/9umE.ddGPOtXYour46sqS"; protocol="application/pgp-signature"

--Sig_/Y/9umE.ddGPOtXYour46sqS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Fri, 3 May 2019 13:04:11 +0200
schrieb Roger Pau Monn=C3=A9 <roger.pau@citrix.com>:

> Wouldn't it be easier to leave libxl__need_xenpv_qemu alone and just
> use the contents of the migration stream to decide whether to launch a
> QEMU for the PV backends or not? ie: just parsing the domain config on
> the migration stream should be enough for the destination side to
> decide whether a QEMU is needed in order to handle the PV backends?

I think that is done anyway. How would the receiving side know what to do?

I will see how to handle the stubdom case.

Olaf

--Sig_/Y/9umE.ddGPOtXYour46sqS
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXMxMFAAKCRBdQqD6ppg2
fk7zAJ9jXOql2fHQfxYrl/os1CQo0A8XqwCgnDxvvtxUl6y95d43tm8UPjIdLDo=
=IVEl
-----END PGP SIGNATURE-----

--Sig_/Y/9umE.ddGPOtXYour46sqS--


--===============8120724134591746262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8120724134591746262==--

