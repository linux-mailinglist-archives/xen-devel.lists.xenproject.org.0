Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F7D1AE004
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 16:36:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPS6f-0000q4-Ob; Fri, 17 Apr 2020 14:36:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H8UU=6B=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jPS6e-0000pz-Hh
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 14:36:36 +0000
X-Inumbo-ID: d681210c-80b8-11ea-8d07-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d681210c-80b8-11ea-8d07-12813bfff9fa;
 Fri, 17 Apr 2020 14:36:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C352BAC6C;
 Fri, 17 Apr 2020 14:36:33 +0000 (UTC)
Message-ID: <71fec2ed355f62bedff97d54a4d5ad9166a5a9c9.camel@suse.com>
Subject: Re: [PATCH] sched: print information about scheduler granularity
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Sergey Dyasli
 <sergey.dyasli@citrix.com>, xen-devel@lists.xenproject.org
Date: Fri, 17 Apr 2020 16:36:32 +0200
In-Reply-To: <3dacf98c-c4b7-a263-01d3-f8562619ff53@suse.com>
References: <20200416083341.21122-1-sergey.dyasli@citrix.com>
 <d2577c4b4ff040c8f256d203e647619d9d4d6ebb.camel@suse.com>
 <3dacf98c-c4b7-a263-01d3-f8562619ff53@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-NSFr/7Jsh560HfIcFVSf"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
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
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-NSFr/7Jsh560HfIcFVSf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-04-17 at 09:57 +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 16.04.20 18:43, Dario Faggioli wrote:
> > On Thu, 2020-04-16 at 09:33 +0100, Sergey Dyasli wrote:
> > >=20
> > > +char *sched_gran_str(char *str, size_t size)
> > > +{
> > > +    char *mode =3D "";
> > > +
> > > +    switch ( opt_sched_granularity )
> > > +    {
> > > +    case SCHED_GRAN_cpu:
> > > +        mode =3D "cpu";
> > > +        break;
> > > +    case SCHED_GRAN_core:
> > > +        mode =3D "core";
> > > +        break;
> > > +    case SCHED_GRAN_socket:
> > > +        mode =3D "socket";
> > > +        break;
> > > +    default:
> > > +        ASSERT_UNREACHABLE();
> > > +        break;
> > > +    }
> > > +
> > > +    if ( sched_granularity )
> > > +        snprintf(str, size, "%u-way %s", sched_granularity,
> > > mode);
> > >=20
> > I'm not sure about using the value of the enum like this.
>=20
> enum? sched_granularity holds the number of cpus per scheduling
> resource. opt_sched_granularity is the enum.
>=20
Ah, indeed! I failed to see that the if and the snprintf above use
that, and not opt_sched_granularity! Sorry for the confusion.

> > So I'd just go with "cpu", "core" and "socket" strings.
>=20
> No, this is not a good idea. With e.g. smt=3D0 you'll be able to have
> "1-way core" which is much more informative than "core".
>=20
True. And thinking to this cases, I agree that it makes sense to
provide an information that takes that into account too.

I'm now not sure whether something like "1-way core-scheduling (or "1-
way core-scheduling more") is really the best way to tell the user
we're using using core-scheduling, but we have disabled SMT... Perhaps
something like:

Scheduling granularity: core, 1CPU(s) per sched-resource

Or something like that?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-NSFr/7Jsh560HfIcFVSf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl6ZvvAACgkQFkJ4iaW4
c+7ZFBAAs5Q7OHht7ajtsaC1asDDRswP7bb8PbaZTxoLTVLu1Cgbj1sOKdHbCjSh
N97/HmP18U9mhqRPFPdS1+cDFCwqpkufcqsKxjQv9gvzyz8DyjnKwzxwpa8FmaHa
zci/ApSC3eX4lLrkeLKDFPWGxfKGwhbnWyqx6ZUjOsTgbSsFZ7y4IJeIwU0V1WA3
U6oRIZgIy7Y+7j6nKH6ovK/gR1+SYt8hD/dVPSaabS+PvxF28EJ0IbfQP7s96eFb
BAdLT8mqOjh2CfhRWmIOq9B0+PGQt5OpQrH+LvyZW7DOTPjZA88CqZSaq/GRx/Lk
pTfgux3YKljnkEyECeM/4wDlUA3CWapqaes3K04lNX4+FS8VymSIvZuB85GipiaP
CtwGYvnMDsVoAqos9ZG9OOI9cfEq6YA00pKgASRe3aUehRFMs6XvJvLLrUxw2vqg
Rvf+BR39jr0A/+rTA4uJUDIj1mc+eRqnNgmLR0gU1TZUXy0aZurTY6zXKlS9/4G8
ZgAUbZqSPlgxKFBLCqt5DuEQ8kKdZ5uF2I1qF0BH0uJBhxBGSk2Yo8LBmtBRrilJ
rSOSan94hB/OXck+L/ABBEtyoM0uYdeMn+BhExxt9yJQDA6M75FGbViz0F8jzr+e
mw4pQo2wcsLWRhIF5DhjimszD09Eb6Cs8g5bWfweXilfKygW/FI=
=v8Ak
-----END PGP SIGNATURE-----

--=-NSFr/7Jsh560HfIcFVSf--


