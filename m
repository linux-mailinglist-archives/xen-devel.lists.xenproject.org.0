Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D411E81F5
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 17:37:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeh3M-0007rY-La; Fri, 29 May 2020 15:36:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BsAk=7L=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jeh3L-0007rT-Gp
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 15:36:11 +0000
X-Inumbo-ID: 1ee629fe-a1c2-11ea-8993-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ee629fe-a1c2-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 15:36:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7B17AAB64;
 Fri, 29 May 2020 15:36:09 +0000 (UTC)
Message-ID: <311bd9fe78078e3e27e877e4b7258604bea65335.camel@suse.com>
Subject: Re: [PATCH v2 4/7] xen: credit2: limit the max number of CPUs in a
 runqueue
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, 
 xen-devel@lists.xenproject.org
Date: Fri, 29 May 2020 17:36:07 +0200
In-Reply-To: <826d5572-0c72-4fd4-f182-38023ca555ef@suse.com>
References: <159070133878.12060.13318432301910522647.stgit@Palanthas>
 <159070138395.12060.9523981885146042705.stgit@Palanthas>
 <826d5572-0c72-4fd4-f182-38023ca555ef@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-J79X0446EziDo6qeBxR8"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-J79X0446EziDo6qeBxR8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-05-29 at 17:23 +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 28.05.20 23:29, Dario Faggioli wrote:
> > In Credit2 CPUs (can) share runqueues, depending on the topology.
> > For
> > instance, with per-socket runqueues (the default) all the CPUs that
> > are
> > part of the same socket share a runqueue.
> >=20
> > On platform with a huge number of CPUs per socket, that could be a
> > problem. An example is AMD EPYC2 servers, where we can have up to
> > 128
> > CPUs in a socket.
> >=20
> > It is of course possible to define other, still topology-based,
> > runqueue
> > arrangements (e.g., per-LLC, per-DIE, etc). But that may still
> > result in
> > runqueues with too many CPUs on other/future platforms. For
> > instance, a
> > system with 96 CPUs and 2 NUMA nodes will end up having 48 CPUs per
> > runqueue. Not as bad, but still a lot!
> >=20
> > Therefore, let's set a limit to the max number of CPUs that can
> > share a
> > Credit2 runqueue. The actual value is configurable (at boot time),
> > the
> > default being 16. If, for instance,  there are more than 16 CPUs in
> > a
> > socket, they'll be split among two (or more) runqueues.
> >=20
> > Note: with core scheduling enabled, this parameter sets the max
> > number
> > of *scheduling resources* that can share a runqueue. Therefore,
> > with
> > granularity set to core (and assumint 2 threads per core), we will
> > have
> > at most 16 cores per runqueue, which corresponds to 32 threads. But
> > that
> > is fine, considering how core scheduling works.
> >=20
> > Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
>=20
> Reviewed-by: Juergen Gross <jgross@suse.com>
>=20
Thanks!

> with one additional question below.
>=20
Sure...

> > +            if ( cpumask_intersects(&rqd->active,
> > per_cpu(cpu_sibling_mask, cpu)) )
> > +            {
> > +                if ( cpumask_weight(&rqd->active) >=3D
> > opt_max_cpus_runqueue )
> > +                {
> > +                        printk("WARNING: %s: more than
> > opt_max_cpus_runqueue "
> > +                               "in a runqueue (%u vs %u), due to
> > topology constraints.\n"
> > +                               "Consider raising it!\n",
> > +                               __func__, opt_max_cpus_runqueue,
>=20
> Is printing the function name really adding any important
> information?
>=20
I personally don't think it does. I am mostly following suite from both
this file and other places, even for this kind of warnings, striving
for consistency.

I'd surely be fine removing it from all the warnings about the boot
time parameter, here in credit2 and in scheduling in general. And if
now it's not the time for doing that, I'm happy to get rid of it from
here, and do the rest later. Or to leave it everywhere for now but
remove it from everywhere later.

And I don't have a too strong opinion myself, so, whatever we think is
best, I can do it.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-J79X0446EziDo6qeBxR8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl7RK+cACgkQFkJ4iaW4
c+5Jdw//RQ8f7MPIz/AiJktLyhfA2+2X3rHN43rYZx3LalfN2mE8yBWZymsYb2MT
8TQpNPqWL8EHL8DQ1C6jZGz+SHBBS4CS0d95+awTFe0b3Ul/ev7B4xc8GN6Viqiv
8BXg7bUGiHzG7/llzRVGTP6UmxCpp/1HkK8LcLw4JNno0K6DWiCFJn+eaKHUSJnP
WU4pI/HjyrXdNbn/ltfnjwiyAtZEJFfwzaAeL1dtiL6EyNFc+vcWBjqXbyTwemZA
2S86jXMJ4N7Jmek0TraI1vm3alV61nspwrrEkdGXvdYH4RlehTXjJR+9o2kZr7fW
hom+5ze+B3uFp3aRbLf/TLR0XmUSAdEeKA/LbLZ1R4hSBz8MkVPQIEpID8/4OMpZ
wegyMHQ2s3CcoFRFPF1AS0P+YZOZik3EmQOdU1gS8lk40qts8Yo0GZ373qvfjAeW
QiOsRQiqxzPr+Gfb8K0bYVVxse27jz1a6xZ/SVH1dA7WHkyNjBiYBtdySK8kf6Tg
TF8oIAOxvuCcWNEkGBgcrMaT74ytkVFAwSHnmT1FaRl+fVwkEt7SqgNgExzfR4YF
HWujf2TnE9DxSgT1z2fBBKPexE6KkXNVvVr1v2TTTVP1McM+PSvLNcbfOeZ1QlYM
0qsTbP5E7HDPsjoxlIvqj5EWYwheb8iYEvXSoccB2e6Z7OIQPVM=
=/f/2
-----END PGP SIGNATURE-----

--=-J79X0446EziDo6qeBxR8--


