Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92503BEE12
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:08:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDPjQ-0007eD-RG; Thu, 26 Sep 2019 09:06:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k+kJ=XV=suse.de=nsaenzjulienne@srs-us1.protection.inumbo.net>)
 id 1iDPjP-0007e2-Lb
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:06:35 +0000
X-Inumbo-ID: efcc7de0-e03c-11e9-964b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id efcc7de0-e03c-11e9-964b-12813bfff9fa;
 Thu, 26 Sep 2019 09:06:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2BE23AB7D;
 Thu, 26 Sep 2019 09:06:33 +0000 (UTC)
Message-ID: <fcdf6f6325d8afbd6c0b91c782b8ef89ba3dc1d0.camel@suse.de>
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Rob Herring <robh@kernel.org>, Oleksandr Andrushchenko
 <oleksandr_andrushchenko@epam.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>
Date: Thu, 26 Sep 2019 11:06:31 +0200
In-Reply-To: <20190925215006.12056-1-robh@kernel.org>
References: <20190925215006.12056-1-robh@kernel.org>
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [RFC PATCH] xen/gntdev: Stop abusing DT
 of_dma_configure API
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: multipart/mixed; boundary="===============6599430665408421931=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6599430665408421931==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-VZLu1lyfilRACxdtIeDn"


--=-VZLu1lyfilRACxdtIeDn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-09-25 at 16:50 -0500, Rob Herring wrote:
> As the comment says, this isn't a DT based device. of_dma_configure()
> is going to stop allowing a NULL DT node, so this needs to be fixed.
>=20
> Not sure exactly what setup besides arch_setup_dma_ops is needed...
>=20
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Julien Grall <julien.grall@arm.com>
> Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: xen-devel@lists.xenproject.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Just so it isn't forgotten, the same applies here:

diff --git a/drivers/gpu/drm/xen/xen_drm_front.c
b/drivers/gpu/drm/xen/xen_drm_front.c
index ba1828acd8c9..de316a891f39 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -11,7 +11,6 @@
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
=20
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
@@ -718,19 +717,7 @@ static int xen_drv_probe(struct xenbus_device *xb_dev,
        struct device *dev =3D &xb_dev->dev;
        int ret;
=20
-       /*
-        * The device is not spawn from a device tree, so arch_setup_dma_op=
s
-        * is not called, thus leaving the device with dummy DMA ops.
-        * This makes the device return error on PRIME buffer import, which
-        * is not correct: to fix this call of_dma_configure() with a NULL
-        * node to set default DMA ops.
-        */
        dev->coherent_dma_mask =3D DMA_BIT_MASK(32);
-       ret =3D of_dma_configure(dev, NULL, true);
-       if (ret < 0) {
-               DRM_ERROR("Cannot setup DMA ops, ret %d", ret);
-               return ret;
-       }
=20
        front_info =3D devm_kzalloc(&xb_dev->dev,
                                  sizeof(*front_info), GFP_KERNEL);


--=-VZLu1lyfilRACxdtIeDn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl2Mf5cACgkQlfZmHno8
x/4SfAf+NsGqU0loPiWDCjo41LSGYYLj1TAtCnYEFJhWysp82mV30XSwqhdPMdEd
ydFDB1TmNDhAazi+do8Sh47UzN+UQ2e4U3a5zZ949lNlPNG5bOueY+SQ+S39PFfy
G+NP0lHrXfisWnLmslIn9y6Eqi5Ik4Bjb2DqNZLiAoyzYDlwvDMoAI66J54GT84H
c7TGaeDzTpP4mHxW1BbJxk66gtEIvvURo62SOZuaohC4SICm6f26g+iz6CG8Bjdw
+jRf9eff00d4MOwD28lJPMrHcDS80W1nZHcdTEijMB3bK0QWBkSr1g9Mki2jzukA
5DGyncDkT9wSqIzxCXx77+RPs3rLuA==
=7yuB
-----END PGP SIGNATURE-----

--=-VZLu1lyfilRACxdtIeDn--



--===============6599430665408421931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6599430665408421931==--


