Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 712D44212B
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 11:39:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hazgT-0004ga-Jd; Wed, 12 Jun 2019 09:36:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kiAS=UL=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hazgS-0004gQ-GG
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 09:36:44 +0000
X-Inumbo-ID: 96230be7-8cf5-11e9-8980-bc764e045a96
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 96230be7-8cf5-11e9-8980-bc764e045a96;
 Wed, 12 Jun 2019 09:36:43 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Wed, 12 Jun 2019 11:36:41 +0200
Received: from [192.168.0.36] (nwb-a10-snat.microfocus.com [10.120.13.202])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Wed, 12 Jun 2019 10:36:29 +0100
Message-ID: <98ebac8ac279d42e0b8fbf73f6e7109e68d9c82f.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
Date: Wed, 12 Jun 2019 11:36:28 +0200
In-Reply-To: <180b9637-f922-902b-add5-9a32e275d0a9@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-50-jgross@suse.com>
 <5CED1F030200007800233129@prv1-mh.provo.novell.com>
 <180b9637-f922-902b-add5-9a32e275d0a9@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 49/60] xen/sched: reject switching smt
 on/off with core scheduling active
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============2084446318416814347=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2084446318416814347==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-5y0IegWwDWXKlacq74au"


--=-5y0IegWwDWXKlacq74au
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-05-28 at 13:52 +0200, Juergen Gross wrote:
> On 28/05/2019 13:44, Jan Beulich wrote:
> > > > > On 28.05.19 at 12:33, <jgross@suse.com> wrote:
> > > --- a/xen/arch/x86/sysctl.c
> > > +++ b/xen/arch/x86/sysctl.c
> > > @@ -200,7 +200,8 @@ long arch_do_sysctl(
> > > =20
> > >          case XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE:
> > >          case XEN_SYSCTL_CPU_HOTPLUG_SMT_DISABLE:
> > > -            if ( !cpu_has_htt || boot_cpu_data.x86_num_siblings
> > > < 2 )
> > > +            if ( !cpu_has_htt || boot_cpu_data.x86_num_siblings
> > > < 2 ||
> > > +                 sched_disable_smt_switching )
> > >              {
> > >                  ret =3D -EOPNOTSUPP;
> > >                  break;
> >=20
> > I'm not convinced -EOPNOTSUPP is an appropriate error code for
> > this new case. -EPERM, -EACCES, or -EIO would all seem more
> > appropriate to me (and perhaps there are further ones).
>=20
> I think -EIO or -EBUSY would be the best fit.
>=20
I agree, with mild preference for EBUSY.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-5y0IegWwDWXKlacq74au
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0Ax5wACgkQFkJ4iaW4
c+7AyBAA5jRPesv9H77J+/d37MaHKa4dF2YdksU7tAa9paztp1noapRL7WkOUaFp
qJEodtHrEz8IBVZOrk7HT9cs5iL6v7GbO8XtrWad9ynJEU+SwqXjX/xtTjEPEmtg
WkMWP1VXXt06YS4QiU9vIimXrsG9rFifxDSZSPqd/UWXttbkqbpYooIMA2QLeOEW
9YOoB9v2spGdni60JCFd+mTq8WiwXniWK9oSktoM7jf2/+BeRWhFAJdnW2dth6h6
nY4kqimwRcgrKkyxQkanWQQFNxRJjQkptfztaP5LqCMjsRnUJwOH2Kk1w5LUV4tt
vdvdLHaCLrYrbvWVTS6xh5i0Dcyh0/S3wty8TvnIW08UasXqokYqWJgzt2/S139q
/y+xq/J/0fLZR8234kRsqmtt3Q9j3p6sXC2CAey9TvrutplqZmOmVn3D8S76UtgU
WdjKA1cGdpLVs0nMaRtvSOLMh+GcQszCvwlNj1ud+alhEzz7pe1u0V5zEMtVlP/D
JEMe1EA5Gx2ExZjDAdsbYErBqFufKKCoVsvh4TT+zhNQHCZUr2p5KTadTu8sOhVq
BzltsYJFutdisgdeO9lyK1vW1cgEZlwJNsfXdWAp+5NYA4c/RM9eqrO5OAZ/iVOO
SyHka4YWnKmhu71mV+lOzsLg6sD9U3ahnTtiq3mBkZWCBKQwuMs=
=qGjS
-----END PGP SIGNATURE-----

--=-5y0IegWwDWXKlacq74au--



--===============2084446318416814347==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2084446318416814347==--


