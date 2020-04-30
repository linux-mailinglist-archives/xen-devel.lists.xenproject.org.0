Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D21491BF836
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 14:29:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU8IU-0000EQ-6s; Thu, 30 Apr 2020 12:28:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0VdV=6O=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jU8IS-0000EL-RP
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 12:28:08 +0000
X-Inumbo-ID: 0bdf434a-8ade-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0bdf434a-8ade-11ea-b9cf-bc764e2007e4;
 Thu, 30 Apr 2020 12:28:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2073AAB3D;
 Thu, 30 Apr 2020 12:28:06 +0000 (UTC)
Message-ID: <d60d5b917d517b1dfa8292cfb456639c736ec173.camel@suse.com>
Subject: Re: [PATCH 2/2] xen: credit2: limit the max number of CPUs in a
 runqueue
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, 
 xen-devel@lists.xenproject.org
Date: Thu, 30 Apr 2020 14:28:05 +0200
In-Reply-To: <b368ccef-d3b1-1338-6325-8f81a963876d@suse.com>
References: <158818022727.24327.14309662489731832234.stgit@Palanthas>
 <158818179558.24327.11334680191217289878.stgit@Palanthas>
 <b368ccef-d3b1-1338-6325-8f81a963876d@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-s/aWSZG5acsW9gBFj9A8"
User-Agent: Evolution 3.36.1 
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


--=-s/aWSZG5acsW9gBFj9A8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-04-30 at 09:35 +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 29.04.20 19:36, Dario Faggioli wrote:
> >=20
> > Therefore, let's set a limit to the max number of CPUs that can
> > share a
> > Credit2 runqueue. The actual value is configurable (at boot time),
> > the
> > default being 16. If, for instance,  there are more than 16 CPUs in
> > a
> > socket, they'll be split among two (or more) runqueues.
>=20
> Did you think about balancing the runqueues regarding the number of
> cpus? E.g. in case of max being 16 and having 20 cpus to put 10 in
> each
> runqueue? I know this will need more logic as cpus are added one by
> one,
> but the result would be much better IMO.
>
I know. Point is, CPUs not only are added one by one, but they can,
once the system is running, be offlined/onlined or moved among
cpupools.

Therefore, if we have 20 CPUs, even if we put 10 in each runqueue at
boot, if the admin removes 4 CPUs that happened to be all in the same
runqueue, we end up in an unbalanced (6 vs 10) situation again. So we'd
indeed need full runqueue online rebalancing logic, which will probably
end up being quite complex and I'm not sure it's worth it.

That being said, I can try to make things a bit more fair, when CPUs
come up and are added to the pool. Something around the line of adding
them to the runqueue with the least number of CPUs in it (among the
suitable ones, of course).

With that, when the user removes 4 CPUs, we will have the 6 vs 10
situation. But we would make sure that, when she adds them back, we
will go back to 10 vs. 10, instead than, say, 6 vs 14 or something like
that.

Was something like this that you had in mind? And in any case, what do
you think about it?

> > --- a/xen/common/sched/cpupool.c
> > +++ b/xen/common/sched/cpupool.c
> > @@ -37,7 +37,7 @@ static cpumask_t cpupool_locked_cpus;
> >  =20
> >   static DEFINE_SPINLOCK(cpupool_lock);
> >  =20
> > -static enum sched_gran __read_mostly opt_sched_granularity =3D
> > SCHED_GRAN_cpu;
> > +enum sched_gran __read_mostly opt_sched_granularity =3D
> > SCHED_GRAN_cpu;
>=20
> Please don't use the global option value, but the per-cpupool one.
>=20
Yep, you're right. Will do.

> > +/* Additional checks, to avoid separating siblings in different
> > runqueues. */
> > +static bool
> > +cpu_runqueue_smt_match(const struct csched2_runqueue_data *rqd,
> > unsigned int cpu)
> > +{
> > +    unsigned int nr_sibl =3D
> > cpumask_weight(per_cpu(cpu_sibling_mask, cpu));
>=20
> Shouldn't you mask away siblings not in the cpupool?
>=20
So, point here is: if I have Pool-0 and Pool-1, each with 2 runqueues
and CPU 0 is in Pool-1, when I add CPU 1 --which is CPU 0's sibling--
to Pool-0, I always want to make sure that there is room for both CPUs
0 and 1 in the runqueue of Pool-0 where I'm putting it (CPU 0). Even if
CPU 1 is currently in another pool.

This way if, in future, CPU 1 is removed from Pool-1 and added to
Pool-0, I am sure it can go in the same runqueue where CPU 0 is. If I
don't consider CPUs which currently are in another pool, we risk that
when/if they're added to this very pool, they'll end up in a different
runqueue.

And we don't want that.

Makes sense?

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-s/aWSZG5acsW9gBFj9A8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl6qxFUACgkQFkJ4iaW4
c+7aQxAA2saLKaSV21pfDWZRUmzV547i+wZJDXjspbfOMC8Vmm2oVmQ9/213+fLf
0wN7PWSWxjw1YTRXT7FsWOcWsbv1Z3mxeqOcwcCYOyzt/fpsLZayw3N2/5dPogqg
riXTBdIIL7hUEvGBneH7P7KdGFcjjMAZofH7fFT4PvcuKbDTt9iOFVrpTWOwqPS6
+zfFFEfFeN4egYKlp25X6M95GiC+TA56GrlMhWWuwRBESKkaRwvo8qvX1qF1waVP
6UCOfBr65XjoQTRNI0xdkCdebQ9enDMWJRLqYKOBGsY9Yl4MRgPnePEg+XhxQeoe
6AfqrcBfAFAuE08K32YO4RPmRM31kjJV0ouTpl6v97J+JgVmqNwNbNcW8TV92Il1
1TU6+lny2MZ/VcolS+M9/1D7xGvEgRDAoy2ibt1Lw57HeTKb5ko+GckpAR0bWhbl
epdzPuQlfBLpGOvt/nC0dBlbL+lAFJS1StzoG1UEa0a+rPpxqUp92gBsyEMqO0uv
25fZL4o2bH2l46ui2p2Om3wX4Yh2fxEfx5MmadVGE8x3Xzntb8DhKzsySfhCUEWd
S+0m3mWdTVCN/+lRMeQLvy86gi8LsqWdg3TS/s5EpNcX02HwDuxuiN8Bg3pA9oO0
WjUydtPkUDFcIjYgxHMhKvzP+GDirPxyUoVfWOmqZ/u4JGsG0qM=
=3ATS
-----END PGP SIGNATURE-----

--=-s/aWSZG5acsW9gBFj9A8--


