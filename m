Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6052155C
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 10:28:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRYAo-0001qD-9F; Fri, 17 May 2019 08:25:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fDGF=TR=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hRYAm-0001q8-K7
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 08:25:01 +0000
X-Inumbo-ID: 41bdbaf4-787d-11e9-8980-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::12])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 41bdbaf4-787d-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 08:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1558081497;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=ikKw8LttSyVJFQTL+m7syHlWpHYIZRIyMh9UT462qtw=;
 b=smjSdr9GagSeiAJEkcM0c2ArG/KmHX7nAQeSXJpC5KFHgpKTZpeDMGnKC72J/9pjcg
 VnbBHcByoESX0VQYkoq2MIXTifaQVaMSxeEfdjlqXOhcf23VsmogpBDoHSwSHSfuKQrF
 X2u4G9yrqgXMdW5NwlXu0T2Kl99y+E92viWkePYOzRB+rPmWXDsLqj6p9ioqmkLeapJp
 QdI1Pw9SlVtPR+rL/tdDswmG7Ra/KIA1+cAEewfE9x4evzGYAK2XoyYHbh/moZhoSBa8
 /qZyyNL0YzmY7Qkv3vUfez3wXueHW/QYCACY4iyWBU4SnWC0NYgPxr6y0w+1N9d96Plr
 uBvw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuYM9k3Q=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.20 SBL|AUTH)
 with ESMTPSA id U080cav4H8OsIAz
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Fri, 17 May 2019 10:24:54 +0200 (CEST)
Date: Fri, 17 May 2019 10:24:45 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Wei Liu <wei.liu2@citrix.com>
Message-ID: <20190517102445.709835c8.olaf@aepfle.de>
In-Reply-To: <20190516133013.GG2798@zion.uk.xensource.com>
References: <20190516125000.23559-1-olaf@aepfle.de>
 <20190516133013.GG2798@zion.uk.xensource.com>
X-Mailer: Claws Mail 2019.05.14 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v1] libxl: fix device_model_version related
 assert
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============8565585243473874945=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8565585243473874945==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_//8c7EknW2ybWI_Gj=g4myKt"; protocol="application/pgp-signature"

--Sig_//8c7EknW2ybWI_Gj=g4myKt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 16 May 2019 14:30:13 +0100
schrieb Wei Liu <wei.liu2@citrix.com>:

> @@ -457,6 +457,12 @@ int libxl_domain_need_memory(libxl_ctx *ctx,
> +    if (!b_info->device_model_version)
> +       b_info->device_model_version =3D LIBXL_DEVICE_MODEL_XXX;

I think this will work and should be applied to unbreak staging.

The proposed libxl_domain_config_finalyze(libxl_domain_config*) in the
other thread about the regression will most likely be ugly. Something
more elegant has to be found.

Olaf

--Sig_//8c7EknW2ybWI_Gj=g4myKt
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXN5vzQAKCRBdQqD6ppg2
fi90AKCT0PecpQuXD8S90Kg37FUlNhKPUQCg8IQn2RHvfQeGSU5n5A2CNd9gIic=
=kGgl
-----END PGP SIGNATURE-----

--Sig_//8c7EknW2ybWI_Gj=g4myKt--


--===============8565585243473874945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8565585243473874945==--

