Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFB21836DA
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 18:05:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCRFP-0007QY-6Q; Thu, 12 Mar 2020 17:03:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yTGL=45=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jCRFN-0007QT-Jm
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 17:03:49 +0000
X-Inumbo-ID: 70e154e4-6483-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70e154e4-6483-11ea-a6c1-bc764e2007e4;
 Thu, 12 Mar 2020 17:03:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 33DFCB21F;
 Thu, 12 Mar 2020 17:03:47 +0000 (UTC)
Message-ID: <7308c02ccc7d741b0c660aaa0110b71a61a887a3.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: George Dunlap <George.Dunlap@citrix.com>
Date: Thu, 12 Mar 2020 18:03:45 +0100
In-Reply-To: <2B668743-662D-4A34-9ADE-F699A7BABF8A@citrix.com>
References: <158402056376.753.7091379488590272336.stgit@Palanthas>
 <158402065414.753.15785539969715690913.stgit@Palanthas>
 <2B668743-662D-4A34-9ADE-F699A7BABF8A@citrix.com>
Organization: SUSE
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/2] xen: credit2: avoid vCPUs to ever reach
 lower credits than idle
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
Cc: Juergen Gross <jgross@suse.com>, Charles Arnold <carnold@suse.com>,
 Tomas Mozes <hydrapolic@gmail.com>, Glen <glenbarney@gmail.com>,
 Jan Beulich <jbeulich@suse.com>, Sarah Newman <srn@prgmr.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============5195844165555322164=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5195844165555322164==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-TUntw4n/ZR1dBBKboK1Z"


--=-TUntw4n/ZR1dBBKboK1Z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-03-12 at 14:45 +0000, George Dunlap wrote:
> > On Mar 12, 2020, at 1:44 PM, Dario Faggioli <dfaggioli@suse.com>
> > wrote:
> >=20
> > This patch makes Credit2 more robust to events like this, whatever
> > the cause is, and should hence be backported (as far as possible).
> >=20
> > Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> > Reported-by: Glen <glenbarney@gmail.com>
> > Reported-by: Tomas Mozes <hydrapolic@gmail.com>
>=20
> Nit: The reported-by=E2=80=99s should be before the SoB (i.e., tags rough=
ly
> in time order).
>=20
Ah, right! :-(

> I think this is a good change to make the algorithm more robust, so:
>=20
> Acked-by: George Dunlap <george.dunlap@citrix.com>
>=20
> But it seems like allowing a guest to rack up -2^63 credits is still
> a bad thing, and it would be nice to have some other backstop / reset
> mechanism. =20
>
I agree. FWIW, this is way it took me a while to get to the bottom of
this. I was assuming it was *entirely* a Credit2 specific issue (caused
by, e.g., something like I found and fixed with patch 2).

When I noticed that things were not exactly like that, I also realized
that we at least need to prevent --under any circumstance-- that idle
vCPUs are preferred over "regular" vCPUs, and even if I did consider
approaches like "compacting" the credits dynamic, I went straight for
the INT_MIN approach.

Considering how this thread is going, I guess we should actually push
this further, and limit the "credit swing".

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-TUntw4n/ZR1dBBKboK1Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5qa3EACgkQFkJ4iaW4
c+47+xAAj1eny+/joS4coQswlfEQDMJ4Iog1Xd8a2LV9im6u0EfWukFwLsWcGKdL
kQpbLQYjc/ly7eoIMrufglbHNl2NzqMBubbB2u8UZxA10uCDy28pe84yJW9n3NUd
FonAMT/GV8HTd6MjhBJaZSEQyoHnlSEzmO10rfqvH+28lsfUrU+OUqRYzuDtEkSQ
4Vrv+f+6WSTtFdQOkDd4Nj2KRuwATgitW47fq1Y+l5V/Dw/pVU9vDSMVgn3Cg4MH
1qvLrvN5xCLfXtX/UhEnblMt47Iw67HmsD7SGT3NARYru4hclyF1cABxjcSsBunU
R5/ZiUoQ4wYTmHPofUwcMPA/eEfSUCeJOGhgFKpnR5sqLOBiYNv6pwVS4sk4GxGY
gT/rTy2R8m36zWUtCd16p9IP1sLFJ3G+wY0aZ4WFgi4HtZlnCROCRfBYwXzD6xrK
qyjAi+DzeJa71i9om1Fyktlj9kPehxI8xQQiJm3V14ZBoOqd/13EWv0rSkSi8ORy
xbAFEz1sGaXrPfWohr/SpTIa1ile03z0KqlaECKvIcJDRmVTR+JzDrTTLuip44fz
gcdVYMB7tAiFAyB0iGzyGwu9H7k79pVoeY/UWBizQB4XlhBO7iW1k0oQs6JHW4/Y
VuTtaTv0Z0UmVOY8T+xfJMfsXust35KFF0Z1yf6xrtGN+n/TZio=
=DK0w
-----END PGP SIGNATURE-----

--=-TUntw4n/ZR1dBBKboK1Z--



--===============5195844165555322164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5195844165555322164==--


