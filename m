Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8972758B69
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 22:13:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgail-0002no-7v; Thu, 27 Jun 2019 20:10:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ljtp=U2=gmail.com=denisobrezkov@srs-us1.protection.inumbo.net>)
 id 1hgaij-0002ni-AP
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 20:10:13 +0000
X-Inumbo-ID: 9154cea2-9917-11e9-8980-bc764e045a96
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9154cea2-9917-11e9-8980-bc764e045a96;
 Thu, 27 Jun 2019 20:10:12 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id m10so8291059edv.6
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2019 13:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=rbhk9NPhDGGdTh+MKf33VwPfxghv/thoQsPR3ZpHPrE=;
 b=FiHBjj7ip20XZ8b/ohAT6W5hTzPNNMNN8G2crj2TNm0Dt3eM/CKF0llT3zfkX0hRdR
 VCBzt02X0nHMS51orWESA3xlFWYDzzYwUEUBP+ypK2e2Cfc+TmzlGpF9e8GTm0QfBhMn
 BdVtp7eLXDAPi0+Z2Mp2u54q1EJ0MxrpUJJ6lPlES30VdfbnzgwnnTQNjbFJhOzO//DF
 9mJOSBBDe0piFax+tZu/+gAtb1gLwtCfMCfqPjZkPVe8Stm8s8ff24ZsX++yL4Oh1fPD
 GIsGh5GDJEB8d9LTK4YYUuSpfFxVpzWdf9/Yb8iiWkz1afQHUse69Brx/sFCqECQSFLP
 IL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to;
 bh=rbhk9NPhDGGdTh+MKf33VwPfxghv/thoQsPR3ZpHPrE=;
 b=G7/FahyNprZwC3k9w8k2PQ4Oy3GPOnQRqcCjK17qVuNJFuD831Ep0h6AzKjo9GJPph
 uA2OsBZN7/lWH5mCs3c5gttA0CxOVvg8jbS+2d5eB/rHeZIXhxuD/kkMIjZPd6xyoStR
 xbowZn/osE6e+Cx5bN9lvF9xUowpmdM9/0Mdg/aLE2Xos8fdOxCU2UzowjRBLiC4tefh
 VfXe4Y/D0TgFQcRVHLk9gNbU0iqeuj8b0IkqYcpFy3Jo0iqmBovohnikG89O/jBhHZYs
 CL0zlFnSwx2tMkJtNfVjXG680BwBEdc5KEMsMiN3dTyIMbq2Oxb0XY9Ovf4jTdWsTbWE
 fW1w==
X-Gm-Message-State: APjAAAVzqCt6PZ5y/2iWPmXGlBL9GFQ/mgGjoN39HMidJlPNTLGNZk8W
 PO/aoQpP7mBHi1XMD0NUWhw=
X-Google-Smtp-Source: APXvYqyN4DYHgKjYYd5fAquF5cGK5L5cH1JTgwKJgOXe2/+vGT9bnAVxUzWSiGOdda8W5uvVAsH30w==
X-Received: by 2002:a50:a48a:: with SMTP id w10mr6771615edb.1.1561666210792;
 Thu, 27 Jun 2019 13:10:10 -0700 (PDT)
Received: from ?IPv6:2001:16b8:66e7:2e00:1e4b:d6ff:fef9:46e6?
 (200116b866e72e001e4bd6fffef946e6.dip.versatel-1u1.de.
 [2001:16b8:66e7:2e00:1e4b:d6ff:fef9:46e6])
 by smtp.gmail.com with ESMTPSA id g16sm1045283edc.76.2019.06.27.13.10.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 13:10:09 -0700 (PDT)
From: Denis Obrezkov <denisobrezkov@gmail.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Iain Hunter <drhunter95@gmail.com>, Hunyue Yau <hy-gsoc@hy-research.com>
References: <ed5ec761-ec79-1c5a-0b88-f20bfb99cead@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=denisobrezkov@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c9cd784e-ecf3-c442-5b70-e4ca43ce6b64@gmail.com>
Date: Thu, 27 Jun 2019 22:10:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <ed5ec761-ec79-1c5a-0b88-f20bfb99cead@gmail.com>
Subject: Re: [Xen-devel] xen on beagleboard-x15: fails to access PRCM MPU
 register
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
Content-Type: multipart/mixed; boundary="===============2101017629394461020=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2101017629394461020==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vqTrwM4ixRrIlBnDCYiiKfFeyYl7d1U3Z"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vqTrwM4ixRrIlBnDCYiiKfFeyYl7d1U3Z
Content-Type: multipart/mixed; boundary="uho1ycw2xGF8Q1CzzsxodG9D9lq7iUZDD";
 protected-headers="v1"
From: Denis Obrezkov <denisobrezkov@gmail.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Iain Hunter <drhunter95@gmail.com>, Hunyue Yau <hy-gsoc@hy-research.com>
Message-ID: <c9cd784e-ecf3-c442-5b70-e4ca43ce6b64@gmail.com>
Subject: Re: xen on beagleboard-x15: fails to access PRCM MPU register
References: <ed5ec761-ec79-1c5a-0b88-f20bfb99cead@gmail.com>
In-Reply-To: <ed5ec761-ec79-1c5a-0b88-f20bfb99cead@gmail.com>

--uho1ycw2xGF8Q1CzzsxodG9D9lq7iUZDD
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

CC'ed other GSoC mentors

On 6/27/19 9:52 PM, Denis Obrezkov wrote:
> Hello all,
>=20
> I have a failure when I am trying to boot Linux with Xen on bb-x15, her=
e
> is the log:
> https://pastebin.com/BBAFPkVU
>=20
> and, as Julien (cc'ed) suggested here is the DT debug information for x=
en:
> https://drive.google.com/open?id=3D15YTsCKYUTbG2i-siWezJXKWuG0H1VfQz
>=20
> So, what I was able to figure out:
> In omap4_prminst_read_inst_reg it tries to read from _prm_bases[part].v=
a
> (arch/arm/mach-omap2/prminst44xx.c).
> _prm_bases[part].va has a value of prm_base or prcm_mpu_base depending
> on part value(arch/arm/mach-omap2/prminst44xx.c:44)
> Failure happens when _prm_bases[OMAP4430_PRCM_MPU_PARTITION] is read.
> It's value set up in arch/arm/mach-omap2/prcm_mpu44xx.c:54.
> The installed value is obtained with OMAP_L4_IO_ADDRESS macro
> (mach_omap2/io.c:667). Here is its definition (arch/arm/mach_omap2/ioma=
p.h):
> #define OMAP2_L4_IO_OFFSET  0xb2000000
> #define OMAP2_L4_IO_ADDRESS(pa) IOMEM((pa) + OMAP2_L4_IO_OFFSET) /* L4 =
*/
>=20
> and IOMEM (arch/arm/include/asm/io.h):
> #define IOMEM(x)    ((void __force __iomem *)(x))
>=20
> I don't understand what is happening and how to overcome it.
>=20

--=20
Regards, Denis Obrezkov


--uho1ycw2xGF8Q1CzzsxodG9D9lq7iUZDD--

--vqTrwM4ixRrIlBnDCYiiKfFeyYl7d1U3Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEAREIAB0WIQTG5lj1j5VIuKBD/kz7iQsTJJ7s+QUCXRUimQAKCRD7iQsTJJ7s
+YXwAP0Ru2aWpCY2hrM8JxNj+owNGUpgBCcaksuw7mj49OrJdwEAuL1tGLOnf0Hx
/WrbG1qnIUDIAfHeMBlVzHazbBv3ke0=
=0lK9
-----END PGP SIGNATURE-----

--vqTrwM4ixRrIlBnDCYiiKfFeyYl7d1U3Z--


--===============2101017629394461020==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2101017629394461020==--

