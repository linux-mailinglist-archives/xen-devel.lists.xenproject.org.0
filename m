Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61597164DCC
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 19:40:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4UDz-0007Oh-6p; Wed, 19 Feb 2020 18:37:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NMhh=4H=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1j4UDx-0007Oc-5c
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 18:37:29 +0000
X-Inumbo-ID: e0b9c2cc-5346-11ea-8425-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0b9c2cc-5346-11ea-8425-12813bfff9fa;
 Wed, 19 Feb 2020 18:37:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5F914AE8A;
 Wed, 19 Feb 2020 18:37:26 +0000 (UTC)
Message-ID: <865b2b41d62a236f62a70e67bdc424e4ed336886.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Date: Wed, 19 Feb 2020 19:37:24 +0100
In-Reply-To: <6aff04ca-904b-cf27-d6f4-af9a146e4c04@suse.com>
References: <20200123085504.30911-1-jgross@suse.com>
 <95f651ddc1639d1c498067e4af71759585aa48b3.camel@suse.com>
 <6aff04ca-904b-cf27-d6f4-af9a146e4c04@suse.com>
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 George Dunlap <george.dunlap@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============1085625909484384169=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1085625909484384169==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-l7SE/uWiuEr4nstZg2I7"


--=-l7SE/uWiuEr4nstZg2I7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-02-19 at 17:52 +0100, Jan Beulich wrote:
> On 19.02.2020 17:47, Dario Faggioli wrote:
> > On Thu, 2020-01-23 at 09:55 +0100, Juergen Gross wrote:
> > > --- a/xen/common/sched/credit2.c
> > > +++ b/xen/common/sched/credit2.c
> > > @@ -849,51 +822,71 @@ static inline bool same_core(unsigned int
> > > cpua,
> > > unsigned int cpub)
> > >             cpu_to_core(cpua) =3D=3D cpu_to_core(cpub);
> > >  }
> > > =20
> > > -static unsigned int
> > > -cpu_to_runqueue(const struct csched2_private *prv, unsigned int
> > > cpu)
> > > +static struct csched2_runqueue_data *
> > > +cpu_add_to_runqueue(struct csched2_private *prv, unsigned int
> > > cpu)
> > >  {
> > > -    const struct csched2_runqueue_data *rqd;
> > > -    unsigned int rqi;
> > > +    struct csched2_runqueue_data *rqd, *rqd_new;
> > > +    struct list_head *rqd_ins;
> > > +    unsigned long flags;
> > > +    int rqi =3D 0;
> > > +    bool rqi_unused =3D false, rqd_valid =3D false;
> > > +
> > > +    rqd_new =3D xzalloc(struct csched2_runqueue_data);
> > > =20
> > >=20
> > So, I'm not sure I see why it's better to allocating this here, and
> > then free it if we didn't need it, instead than allocating it
> > later,
> > only if we actually need it... What am I missing? :-)
>=20
> Where possible we should try to avoid calling allocation functions
> with locks held.
>=20
Ah, sure, that's a very good reason indeed, my bad not noticing that
doing this like that the allocation sits outside of the write_lock()
section.

Nevertheless, I'd add a quick comment about that, to make it even more
obvious. :-)

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-l7SE/uWiuEr4nstZg2I7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5NgGQACgkQFkJ4iaW4
c+7+Mw/+M/9UPfx8tMJ7C8IteDv+dzOpUY8KqTUWEjAqsZU6GTF9qulSvIVTKzSP
pXNxOrECkPkKdjSomixj6IE71TlWfZHOfo3p2JDkD+F0OJpYHXTozKX9mD8ix4ui
Wio1Y2suqbXSKzekq3GG3NWXnDNx5w179Jrx8L0CJiJjpFm6FxeHk3cCWI/E1r77
Omdw/hAwPDRzNTzXiMdkxNBgKoBPlGRRBoV7nItuRT2aNYLlh0aQr0moJHljVZ5E
MdX7/HEzc7YgmbJBdKN6xUdaiHbjGb+2Z66LrMAadduE2KJkUVW/pWBIG5nanPa9
/RDkeNKaW9wXnf+NwDGxwICIIYyaNdRs4m2A8NZJfozbpzwaAJjLUTsMOT+fzyLX
an/HPcQB1PUCJSFraFaV5hWYAq02GOPVi3b2w+r5GkJi0PdrijtDTmlRw5qPmwVS
TJy4J8+hV/aD5RM7UVIvg30/B9dd3M9AFGEryigbSc7zt7skijpCcG3v2kZmh6LC
v5Wy3/eH/XqgLWuu2KGojTFwlDaLZV6KOajMu1lx3W0xQmkzg7/eqUsa7gKsVXSa
CFAmXy2gl0LegtmNWmEQ6v3ZLAqB5/Gh84MnRGmDF+VeOFOlSxqpicsrPdSHWHIX
kbo9roKQI6pJQ4l8+Mjw484mm+yyCuqzlxSObjEdw7SteG2+mEo=
=cbnp
-----END PGP SIGNATURE-----

--=-l7SE/uWiuEr4nstZg2I7--



--===============1085625909484384169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1085625909484384169==--


