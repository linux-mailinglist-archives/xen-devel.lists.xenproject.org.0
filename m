Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A133C919
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 12:38:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hae7k-0005FL-K1; Tue, 11 Jun 2019 10:35:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5o1B=UK=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hae7i-0005EZ-Fg
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 10:35:26 +0000
X-Inumbo-ID: 9e02c62e-8c34-11e9-acc6-3b3f80890d50
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e02c62e-8c34-11e9-acc6-3b3f80890d50;
 Tue, 11 Jun 2019 10:35:23 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Tue, 11 Jun 2019 12:35:22 +0200
Received: from [192.168.0.36] (nwb-a10-snat.microfocus.com [10.120.13.201])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Tue, 11 Jun 2019 11:34:59 +0100
Message-ID: <2901d3d82849f6e01678a2e511702146a5a8fb3b.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, George Dunlap
 <george.dunlap@citrix.com>,  Baodong Chen <chenbaodong@mxnavi.com>,
 xen-devel@lists.xenproject.org
Date: Tue, 11 Jun 2019 12:34:57 +0200
In-Reply-To: <bb5ed3ee-94ac-e06c-6edc-ce07cce00e21@suse.com>
References: <1560244837-31477-1-git-send-email-chenbaodong@mxnavi.com>
 <76828671-6c65-bc1f-d7a1-8324491d2200@citrix.com>
 <bb5ed3ee-94ac-e06c-6edc-ce07cce00e21@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen: superficial clean-ups
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/mixed; boundary="===============1316875950126860252=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1316875950126860252==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-QhD2UR2DwpdUnB2+iIQv"


--=-QhD2UR2DwpdUnB2+iIQv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-06-11 at 12:25 +0200, Juergen Gross wrote:
> On 11.06.19 12:18, George Dunlap wrote:
> > On 6/11/19 10:20 AM, Baodong Chen wrote:
> > > --- a/xen/common/schedule.c
> > > +++ b/xen/common/schedule.c
> > > @@ -1894,9 +1894,11 @@ struct scheduler *scheduler_alloc(unsigned
> > > int sched_id, int *perr)
> > >       return NULL;
> > >  =20
> > >    found:
> > > -    *perr =3D -ENOMEM;
> > >       if ( (sched =3D xmalloc(struct scheduler)) =3D=3D NULL )
> > > +    {
> > > +        *perr =3D -ENOMEM;
> > >           return NULL;
> > > +    }
> > >       memcpy(sched, schedulers[i], sizeof(*sched));
> > >       if ( (*perr =3D SCHED_OP(sched, init)) !=3D 0 )
> >=20
> > I was going to say, this is a common idiom in the Xen code, and the
> > compiler will end up re-organizing things such that the write
> > doesn't
> > happen anyway.  But in this case, its' actually writing through a
> > pointer before and after a function call; I don't think the
> > compiler
> > would actually be allowed to optimize this write away.
> >=20
> > So, I guess I'd be OK with this particular hunk.  Dario, any
> > opinions?
>=20
I'm ok with it too, but...

> I'd rather switch to PTR_ERR() here dropping the perr parameter.
>=20
... I'd be even more ok with this! :-)

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-QhD2UR2DwpdUnB2+iIQv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlz/g9EACgkQFkJ4iaW4
c+78IBAA0GHkmL6fz4xEQRHVaIEFkLiK25IwvWVcgtxME4r3Fe0dRUtszSw4WaFI
uZrdPJgYdTOcsfawfnNROuTKUz4g8u1TiQy9/XUpKVr+O9R0SFxIz42MwZvDeNI0
70qjCqNwxun2YRlNB6W86Trsf2hGK6fW92CP0vZI9fuPp9q+shPDRbA9lEVGCVC0
0QDS1LUJLTpQt2nOJeVxL1CRMPR0FBoYtD/+lf/664AnxKEWPrDr3vL2t9/z4PM1
Ue8FWIVUcrx5dM7DAwAy21P3nftWQUU5yr13I4qpEllLCLOnCmZA4OtgXYRztj1y
dQq7hv+F7a0qstouz7VuMMRVSibV6fwYkXBfAQJ+yMEyJPWIlpvEAOUCl4xuyrzc
p2VvCD0AtfCSWoeFSXFMmjSNlnVWEBLuwgzlopDHhOBlqxzb6cg8C66pZxggZZnr
M/BLDyv5OfgJ/1mrgYQeBTBgTQtaN5znWdi/s5PyBYGwR+3HiHUj3AoMDRoiOyF2
W1MUhRXfcwRDa7ywp8hrBGnokvuAvyERdjxOMAZeO6wv36WNJJfmMdVswjlqlsIS
wkqH4cMfVC5MmBGx7ROoQn40CuJLzHyNNvzS+BK8/65EVdcoqEHkchueqT9du3K5
HxKjF3LeBFbq2Tpbk+3P1cDOe50IZM4hFrgQPmxWLVhGjnqWzwM=
=jqsR
-----END PGP SIGNATURE-----

--=-QhD2UR2DwpdUnB2+iIQv--



--===============1316875950126860252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1316875950126860252==--


