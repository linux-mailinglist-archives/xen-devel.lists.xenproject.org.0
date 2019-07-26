Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3480075C1D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 02:29:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqo2H-0004Jo-Uj; Fri, 26 Jul 2019 00:24:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6973=VX=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hqo2G-0004Io-Ex
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 00:24:36 +0000
X-Inumbo-ID: bdace1e5-af3b-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bdace1e5-af3b-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 00:24:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D6F9FB023;
 Fri, 26 Jul 2019 00:24:32 +0000 (UTC)
Message-ID: <d206a5664c849747d4086f3fef9131f5bbf09ff8.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Organization: SUSE
MIME-Version: 1.0
Date: Fri, 26 Jul 2019 02:24:23 +0200
User-Agent: Evolution 3.32.3 
Subject: [Xen-devel] Failing to build qemu-xen (in dev-mtp.c) with GCC9
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "Ian.Jackson" <Ian.Jackson@citrix.com>
Content-Type: multipart/mixed; boundary="===============0962426210131240936=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0962426210131240936==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-fWGZMji/6DBSaIZ6zgbS"


--=-fWGZMji/6DBSaIZ6zgbS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey,

openSUSE Tumbleweed has: gcc version 9.1.1 20190703

And this fails to build QEMU, like this:

  CC      hw/watchdog/wdt_ib700.o
/build/tools/qemu-xen-dir/hw/usb/dev-mtp.c: In function =E2=80=98usb_mtp_wr=
ite_metadata=E2=80=99:
/build/tools/qemu-xen-dir/hw/usb/dev-mtp.c:1715:36: error: taking address o=
f packed member of =E2=80=98struct <anonymous>=E2=80=99 may result in an un=
aligned pointer value [-Werror=3Daddress-of-packed-member]
 1715 |                             dataset->filename);
      |                             ~~~~~~~^~~~~~~~~~

This seems to be fixed, for me, if I apply upstream patch 1259f27ec2
("usb-mtp: fix alignment of access of ObjectInfo filename field").

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-fWGZMji/6DBSaIZ6zgbS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl06SDIACgkQFkJ4iaW4
c+6v9Q//bodK88NW0rTRRgwIFdz8KEu/mPl0TnqWGGWslm4mJPpFNOd8UJe5wR1Q
Y4XPFGMLvJ7nbSJYPkbnoIMf8FwVuu1t0HAOtRulvfk3wfO3aM47C8lupP833k8T
HkuTEtuyb9tE4wirj2BgLFVo6+GFYeJxTVu9EiUG4HLa6cI9HWMn0BEuVgny6Yyp
lF53K0TjiUTypsrYyeieCdLnU8Ac29QFJZG6Uc9QEJk1Z/LbrZQazvpXZBRhxj08
0q9XRxpmo4IxOK/fn0MStXdkhiuSlrBC4iVjwSIYHKEYuSAFWL3foK9JjTUi9Ixd
pbHfG6xw3/Ypr7ZnH50p+RxoAHxGku/LHqEFY4KW7Az+k0lUo+wtYbKMbiK9Ik+8
c7PvUUWadTpz25d+Pm46WHe89Cs7Jx3TSmVWtknroruBFY+Bqnu65rynzsDkNeK2
H6UtlNqAsvUv2cs+qs8LUm/fDBjEWCiHxfRC20eR++T4EVfhoktY94MVfnPUPPq4
6W6K2+EzvbazLpQKlubaRuNkkIJE2ahK7tZCuGpGUFEl8ZsnkOgZ69aDmlFZuT7T
pj1mvi5XD/rdXYBRe/Ux6CCsgJ7ojnSeHPgL0fhvyuyn3/wpyYfxyHQstzWEsHnh
PjNN9gNKjetJsv5BGHvPCoDWrmUqR92cDjR6NwRUmbbJr/6akkA=
=tRYR
-----END PGP SIGNATURE-----

--=-fWGZMji/6DBSaIZ6zgbS--



--===============0962426210131240936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0962426210131240936==--


