Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D8B87A3D
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 14:35:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw44j-0003UF-6a; Fri, 09 Aug 2019 12:32:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XXK4=WF=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hw44g-0003Ts-Ra
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 12:32:50 +0000
X-Inumbo-ID: cc070faf-baa1-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cc070faf-baa1-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 12:32:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 652F5AE89;
 Fri,  9 Aug 2019 12:32:48 +0000 (UTC)
Message-ID: <635339af71d7a5defa3c5e88ca1a45abbe66f2e9.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Date: Fri, 09 Aug 2019 14:32:47 +0200
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: [Xen-devel] More QEMU gcc-9.1 build issues
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
Cc: Anthony Perard <anthony.perard@citrix.com>
Content-Type: multipart/mixed; boundary="===============2765834207813278876=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2765834207813278876==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-t1iOmFV2v1ldWCuiZx2N"


--=-t1iOmFV2v1ldWCuiZx2N
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Anthony,

There's more of those issues related to building our QEMU with recent
(the one in openSUSE Tumbleweed) GCC:

gcc version 9.1.1 20190723 [gcc-9-branch revision 273734] (SUSE Linux)

I've just tried building staging, and run into this:

  CC      hw/display/qxl-render.o
/home/dario/src/xen.git/tools/qemu-xen-dir/hw/display/qxl.c: In function =
=E2=80=98init_qxl_ram=E2=80=99:
/home/dario/src/xen.git/tools/qemu-xen-dir/hw/display/qxl.c:50:19: error: t=
aking address of packed member of =E2=80=98struct QXLReleaseRing_ring_el=E2=
=80=99 may result in an unaligned pointer value [-Werror=3Daddress-of-packe=
d-member]
   50 |             ret =3D &(r)->items[prod].el;                          =
       \
      |                   ^~~~~~~~~~~~~~~~~~~~
/home/dario/src/xen.git/tools/qemu-xen-dir/hw/display/qxl.c:429:5: note: in=
 expansion of macro =E2=80=98SPICE_RING_PROD_ITEM=E2=80=99
  429 |     SPICE_RING_PROD_ITEM(d, &d->ram->release_ring, item);
      |     ^~~~~~~~~~~~~~~~~~~~
/home/dario/src/xen.git/tools/qemu-xen-dir/hw/display/qxl.c: In function =
=E2=80=98qxl_push_free_res=E2=80=99:
/home/dario/src/xen.git/tools/qemu-xen-dir/hw/display/qxl.c:50:19: error: t=
aking address of packed member of =E2=80=98struct QXLReleaseRing_ring_el=E2=
=80=99 may result in an unaligned pointer value [-Werror=3Daddress-of-packe=
d-member]
   50 |             ret =3D &(r)->items[prod].el;                          =
       \
      |                   ^~~~~~~~~~~~~~~~~~~~
/home/dario/src/xen.git/tools/qemu-xen-dir/hw/display/qxl.c:762:5: note: in=
 expansion of macro =E2=80=98SPICE_RING_PROD_ITEM=E2=80=99
  762 |     SPICE_RING_PROD_ITEM(d, ring, item);
      |     ^~~~~~~~~~~~~~~~~~~~
/home/dario/src/xen.git/tools/qemu-xen-dir/hw/display/qxl.c: In function =
=E2=80=98interface_release_resource=E2=80=99:
/home/dario/src/xen.git/tools/qemu-xen-dir/hw/display/qxl.c:50:19: error: t=
aking address of packed member of =E2=80=98struct QXLReleaseRing_ring_el=E2=
=80=99 may result in an unaligned pointer value [-Werror=3Daddress-of-packe=
d-member]
   50 |             ret =3D &(r)->items[prod].el;                          =
       \
      |                   ^~~~~~~~~~~~~~~~~~~~
/home/dario/src/xen.git/tools/qemu-xen-dir/hw/display/qxl.c:795:5: note: in=
 expansion of macro =E2=80=98SPICE_RING_PROD_ITEM=E2=80=99
  795 |     SPICE_RING_PROD_ITEM(qxl, ring, item);
      |     ^~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make: *** [/home/dario/src/xen.git/tools/qemu-xen-dir/rules.mak:69: hw/disp=
lay/qxl.o] Error 1

I fixed it by manually importing the following upstream commit:

94932c95c10 "qxl: avoid unaligned pointer reads/writes"

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-t1iOmFV2v1ldWCuiZx2N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1NZ+8ACgkQFkJ4iaW4
c+4/cxAA7f9DyflhgKq77mkw11DOZ1ANeCf5CT8QutcrAqwwCaei0R+W5tqPnMoM
JyRx+DoZ2ZK1R2ugRvCbHalf7HOxk1gN3iOJC5AWHIMP53jLWMUAOyWf5UVL9NWn
cgZJVXFKfennXHy1FDETVvzr30ew9N9kC96uWZ2OEBhsTX45rRPD3/SK1JPOM8VJ
f3FNoArVf4xJmXWhJKzFVM8pFVcfxcnsNgmqEEf0quO/NhTqDuRdEedgs1q+fSlQ
TDFayj1CVf17T6FV3/MmTB//SKW7HB1KSo1Y2Advok6pgUBguIeImkViTuue13DG
ymc9X0WOunWPrf8a5N6XcT5Olpiap+EmtldsPSx007nfWiwn2xxdFdpQ80pxmYdd
j0NbeVJMOJ3ssnuGRMhduF16J2uVtFlTPmJyBhgsbbgmcrlVLHi8MTCw/BwSteTk
zPCQQMxkLCo3PNR+ENb5AuFk+cKhOszg/7MygPlxu5aDl4Xls8ZgO8Kl5MC8fHtU
4gXyGJ6mAqVIk0D69PJxGNukQvNy8Z0S6FDev1D02vxjUuHeKJ6KA6yIq70QEXo6
Vd1Jr7NNQE9Zhhm5TG3Dw1gui/orunzC/n41pK1TKUSYmJBO/fv32SCl5N1qkciY
x2NFiH74d4TIHl9JXtIvdA1sZHaKfXcachXxlwe/ctAenkU05pA=
=8kUr
-----END PGP SIGNATURE-----

--=-t1iOmFV2v1ldWCuiZx2N--



--===============2765834207813278876==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2765834207813278876==--


