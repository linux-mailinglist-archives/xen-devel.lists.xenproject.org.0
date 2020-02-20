Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6650C165A36
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 10:32:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4i8b-0002WR-BZ; Thu, 20 Feb 2020 09:28:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=10iu=4I=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1j4i8Z-0002WM-Sa
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 09:28:51 +0000
X-Inumbo-ID: 66f096c8-53c3-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66f096c8-53c3-11ea-ade5-bc764e2007e4;
 Thu, 20 Feb 2020 09:28:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 79894AD2C;
 Thu, 20 Feb 2020 09:28:49 +0000 (UTC)
Message-ID: <19decaf1ecf3e3b2aaaa0896a586b178ef65fbe4.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Date: Thu, 20 Feb 2020 10:28:48 +0100
In-Reply-To: <40a41da6-64a0-d332-c544-0eb937204fa6@suse.com>
References: <20200123085504.30911-1-jgross@suse.com>
 <95f651ddc1639d1c498067e4af71759585aa48b3.camel@suse.com>
 <6aff04ca-904b-cf27-d6f4-af9a146e4c04@suse.com>
 <865b2b41d62a236f62a70e67bdc424e4ed336886.camel@suse.com>
 <40a41da6-64a0-d332-c544-0eb937204fa6@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/sched: rework credit2 run-queue
 allocation
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/mixed; boundary="===============7058660224419480801=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7058660224419480801==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-+txdXoK5ZHNQkrZPxQ4b"


--=-+txdXoK5ZHNQkrZPxQ4b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-02-20 at 07:56 +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 19.02.20 19:37, Dario Faggioli wrote:
> > On Wed, 2020-02-19 at 17:52 +0100, Jan Beulich wrote:
> > >=20
> > Nevertheless, I'd add a quick comment about that, to make it even
> > more
> > obvious. :-)
>=20
> Do we really need that?
>=20
> Calling any of the alloc functions with interrupts off will crash the
> system (at least in debug builds).
>=20
> I don't think we want to add such comments all over the code.
>=20
No, and that is not what I am suggesting we do. :-)

Neither I want to push to hard (or slow the patch down) just for this.

But, yes, I feel that considering how the code looks, in this
particular case, it is not entirely obvious to immediately realize that
that is the actual reason. Even more so, if we consider that it is not
such a common issue in scheduling code, where there is an (as much as
possible) clear split between allocation and init / usage phases (all
the *_alloc_*data() stuff).

Having just a one liner here would, I think, save people reading this
code some brain power, which they'll be able to use for focusing on
more scheduler specific issues.

Something like:

/* In case we need it, allocate a new runq now, before taking the lock. */

Anyway, as said, I don't want to push too hard on this. If you feel
strongly about not having something like that, I won't block the patch.

If I then decide that I really want such a comment, I will submit a
patch myself, and maybe we'll discuss the pros & cons of having it in
that thread. :-)

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-+txdXoK5ZHNQkrZPxQ4b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5OUVAACgkQFkJ4iaW4
c+6rnhAAqPhyzPmhUSHMuJNV0B3Z1OCKveztOCM1XTL1YDvtbcfLHoHvv7KxqI0m
q5jRZZY0jDISN02R4f5VLoOeIsjIqSeQy8DSg6XsiC9uX+XZ+bh8HYuAobMxsL0q
4NKsc5Bv3Y7jou8Q3PER/HnDXj5ZcSbmXNZzYt0NzhCU/Hj8eab/ylGChdPjWJWt
w6wv0CjqxQ4slPO3CQN4FHD3WS4atBH31LBF3yELE903FySMW5nR3RU4V0W98o4X
wELZN1k1SrjNNN6YA1jIx6BVxMlyEsS5FT3LPg47LO0hy1A9a/8g+OYcvEfVuMtX
vxXFTENrs5GiMkWFHbOc3V0GBGn9lQ7u7okV5CNGPvDfhwxB5NstWJajdU/B81Tc
+AQxqi8jvmG0KmbAm02iqzAu9mkUK4PCdplhhRmckv0IPwQ7kPvRJAY2gW9DEDoS
ZiPot+3gvkTiKMvBr1v6+OaKEIBq7RX0Ll6Y4lNLHKE/HluD7ZKYYcgzVLSRokQ3
oAow+ZydUtgNcqYJBQJpgCshTEIvu26Rj06pLmC0eGCqFDB5ANBWIASxQ7UG6ptY
HLlolQJimfnuSGyUMHyDsThfIymch2WxItg+P5PCICJuvxHxcct8AhuNYQXj4VOW
ijWOb6Ys9BxccfAeHmRt4qVeXHrkEU2BcMwvCripCf9V3Bd6BFs=
=Y3wv
-----END PGP SIGNATURE-----

--=-+txdXoK5ZHNQkrZPxQ4b--



--===============7058660224419480801==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7058660224419480801==--


