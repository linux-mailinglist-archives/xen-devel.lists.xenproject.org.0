Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF1714C95C
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 12:13:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwlFE-0000ll-Ok; Wed, 29 Jan 2020 11:10:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TcPJ=3S=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iwlFC-0000lg-W8
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 11:10:51 +0000
X-Inumbo-ID: 015189fe-4288-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 015189fe-4288-11ea-8396-bc764e2007e4;
 Wed, 29 Jan 2020 11:10:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0D89AABC4;
 Wed, 29 Jan 2020 11:10:49 +0000 (UTC)
Message-ID: <6edf0c3952593890d6f43970754ce486d9f871b5.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Jim Fehlig <jfehlig@suse.com>, Juergen Gross <JGross@suse.com>, Kevin
 Stange <kevin@steadfast.net>, xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 29 Jan 2020 12:10:47 +0100
In-Reply-To: <30aa7949-0294-bfff-cef3-5d8406f8ada8@suse.com>
References: <ed20195d-3272-6ce8-d3b4-a17e459733c2@steadfast.net>
 <1e150c03-13fc-edd8-90a9-71ac669965f3@suse.com>
 <30aa7949-0294-bfff-cef3-5d8406f8ada8@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] libvirt support for scheduler credit2
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
Content-Type: multipart/mixed; boundary="===============5671632879748934748=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5671632879748934748==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-RYQks7oiq8gEiu4UggoF"


--=-RYQks7oiq8gEiu4UggoF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-01-22 at 18:56 +0000, Jim Fehlig wrote:
> On 1/21/20 10:05 AM, J=C3=BCrgen Gro=C3=9F wrote:
> > On 21.01.20 17:56, Kevin Stange wrote:
> > >=20
> > > Since Xen 4.12, credit2 is the default scheduler, but at least as
> > > of
> > > libvirt 5.1.0 virsh doesn't appear to understand credit2 and
> > > produces
> > > this sort of output:
>=20
> You would see the same with libvirt.git master, sorry. ATM the
> libvirt libxl=20
> driver is unaware of the credit2 scheduler.=20
>
Right. I Just sent the patch:
https://www.redhat.com/archives/libvir-list/2020-January/msg01292.html

> Hmm, as I recall Dario was going to=20
> provide a patch for libvirt :-).=20
>
And in fact, back then, when Credit2 went default, I did check. I don't
recall now, I guess I checked the code and never properly tested
things.

And in the code (although, again, I don't remember the details) I must
have been tricked by the fact that since Credit and Credit2 have the
same parameters, libvirt handling of them is ok for both... And missed
the check that bails out if the scheduler is not Credit! :-/

Or something. IDK. Well, Sorry about that.

> But he is quite busy so it will have to be=20
> added to my very long todo list.
>
I am, but this was an easy one, and was indeed my fault... So I did my
best. Hope the patch is not too terrible. :-)

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-RYQks7oiq8gEiu4UggoF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl4xaDgACgkQFkJ4iaW4
c+565w/+KX5LZmffcMmeLWm/TAv+hD42X8yPbSXnParfyeK9r+LjRPx7ME6PPqEf
xSUebQv6Y/evpDIl6Y5/vBdwYNaqnoBcGRk2CC7Xio9WWsIcW2tQm2lLayXTJ5BQ
F2t4HAuBxRER6gotn+GzLZyFlE1xL/FMFxiPWKTPLORb1C8nh5I5wIwMLc4pCjG7
jRL4HeHzCXXcWctYhRjYKhLTyJ1NrdJXsVXagJyggk7FZHuF3YfA9CCQZtw0D4qa
WtrPc6pmDEBTqrN3oba1JrzJ1GohSj5UvElD7ZGtLMZktgAMv76v7/GeRZfrHa6R
TRnw8L5+hkV3/3Jlt2ovlWXGzAmk02dpGPaCpPyknPicd6mt8DS8oypKbntAg8VL
8LkfsstKvizix1TpAGHZGk+kJx3ugdSAs3ym+Zcd3YUq2eIEeZP7TbkGXbCPad1v
Tck/s4GD6RHgbgsPEh8myNYZa52OJtSLrMUjTbUSW2+GLAapkCK3fBow9wT1oNMh
hFbTojuanhzSQP2vX8dG/3CvLuunBNuVN7nIHrYzyOIpj8/paNHQdMLJfgdK/PQN
NiaepHmnTg6d64qtldMOnYDnnrITpq1iFOAQB9zPrH1cIktcSQg4DH8H+FpiDCKb
SGs6gDU7EmzS6YdUWsbRNB48b6YKPxWiDUydTlMPhwbxvLBIhr0=
=Ap8g
-----END PGP SIGNATURE-----

--=-RYQks7oiq8gEiu4UggoF--



--===============5671632879748934748==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5671632879748934748==--


