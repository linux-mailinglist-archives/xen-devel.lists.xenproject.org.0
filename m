Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F353762ED
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 12:00:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqwkw-0001z8-1G; Fri, 26 Jul 2019 09:43:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6973=VX=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hqwku-0001z3-M7
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 09:43:16 +0000
X-Inumbo-ID: ca1f8816-af89-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ca1f8816-af89-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 09:43:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3C4DAAC94;
 Fri, 26 Jul 2019 09:43:14 +0000 (UTC)
Message-ID: <02aefa39917a63321ca3c3598e448febfea77e00.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, 
 christopher.w.clark@gmail.com
Date: Fri, 26 Jul 2019 11:43:12 +0200
In-Reply-To: <20190725082550.z7baryjjwxahdmkc@Air-de-Roger>
References: <20190725005326.3553-1-christopher.w.clark@gmail.com>
 <20190725082550.z7baryjjwxahdmkc@Air-de-Roger>
Organization: SUSE
User-Agent: Evolution 3.32.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] tests/cpu-policy: fix format-overflow
 warning by null terminating strings
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: multipart/mixed; boundary="===============3575094783850441322=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3575094783850441322==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-bt7qVlwEIcpnCjXs6rXK"


--=-bt7qVlwEIcpnCjXs6rXK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-07-25 at 10:25 +0200, Roger Pau Monn=C3=A9 wrote:
> On Wed, Jul 24, 2019 at 05:53:26PM -0700,=20
> christopher.w.clark@gmail.com wrote:
> > From: Christopher Clark <christopher.w.clark@gmail.com>
> >=20
> > diff --git a/tools/tests/cpu-policy/test-cpu-policy.c
> > b/tools/tests/cpu-policy/test-cpu-policy.c
> > index ca3b8dd45f..c91408a93a 100644
> > --- a/tools/tests/cpu-policy/test-cpu-policy.c
> > +++ b/tools/tests/cpu-policy/test-cpu-policy.c
> > @@ -35,9 +35,10 @@ static void test_vendor_identification(void)
> >  {
> >      static const struct test {
> >          union {
> > -            char ident[12];
> > +            char ident[13];
> >              struct {
> >                  uint32_t b, d, c;
> > +                char null_terminator;
>=20
> Do you really need this field here, AFAICT it's unused. The compiler
> will add the padding here automatically to match the size of the
> other
> field of the union.
>=20
Yep, I run into this myself (and sent a mail about it yesterday), and,
FWIW, I confirm that just growing the array to 13 both builds, with
GCC9, and works. :-)

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-bt7qVlwEIcpnCjXs6rXK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl06yzAACgkQFkJ4iaW4
c+5YCw//f1YCCKLxb2rlBMRBKMKpmSuSWReYLV1rn3AaUtGiJdfncSs1/fDrOVSZ
OInVnGIJiaZXasIluUyOjv0V1y1F5MP/5sx0x4qhBVRtz9EciaUdocP4jDEtfVVH
oJaaZiE+B56k6tumVb4igOKCP7F2pUZcSxNhRFXlSXJ9Pl7znLh0Czj7ftu3aig7
619qKdqy421xNpa0kg5j2ZSHmrE+TxWf7yat3wTsc8EysvGz0zsrmrv0Ii3ZfXwh
UqpqsUC55EFPT2TrjBc7u9CovFVkryBcSpCHLpHJ3SdxiDE52liKHZqt1NInKcDB
ZKBXsdGldGhyhCXImdL1V2/aOBZBOclLdlsvXJWJTBbGG9nsBx4ePbvz1BCav8PO
NbabMwRQygcTn4VOIqmBGbvicbumpl3zptx0sBqElyXeyftBz7huSZjOVaKY0bPM
7UreVW3fI6H9xcoBiyOYsX1dOxHeSr9ZOxOUmg/nyihbgUzXD6H8Es9ZcPojtowu
Qv4zngMaaoZDECt1kMRNRGJKMQ+Gdnn47wZdTPwUU+7a4c86VS5BTD5bwjqrSt3A
kP+5WqJrScZh4btaVgSE1ODW4W/bvPfqn3EBr+9mgIvJIggdpU0Va7PsrJHIA01I
Ry7f0TZiws61BfsI7tB3BBwaikxzXFZM9gGlKTjcEAYODUkxvxU=
=0IWd
-----END PGP SIGNATURE-----

--=-bt7qVlwEIcpnCjXs6rXK--



--===============3575094783850441322==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3575094783850441322==--


