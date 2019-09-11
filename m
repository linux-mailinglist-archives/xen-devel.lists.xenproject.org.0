Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DC8B00E2
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 18:06:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i854V-0007Cs-Q9; Wed, 11 Sep 2019 16:02:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2ltH=XG=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1i854T-0007Cm-MA
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 16:02:17 +0000
X-Inumbo-ID: 85cc00fe-d4ad-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85cc00fe-d4ad-11e9-978d-bc764e2007e4;
 Wed, 11 Sep 2019 16:02:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 72569B67A;
 Wed, 11 Sep 2019 16:02:14 +0000 (UTC)
Message-ID: <3b82cd499348c140a6c86b1969f7891a0d011b8c.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Date: Wed, 11 Sep 2019 18:02:11 +0200
In-Reply-To: <d8be4beb-642c-4ab3-3940-10e67d1c69ed@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-9-jgross@suse.com>
 <22dc77b0-7ffa-a7ba-c3e5-14833f0b0b72@suse.com>
 <dfec18bc-e323-bb28-7333-2e5a459d0ec7@suse.com>
 <9a48c9ac-1aba-2102-d444-a135a588b30f@suse.com>
 <d8be4beb-642c-4ab3-3940-10e67d1c69ed@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 08/48] xen/sched: switch
 vcpu_schedule_lock to unit_schedule_lock
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>,
 xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============6479768484113681813=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6479768484113681813==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-AWd6J0Fvsa8s8S4sxOXu"


--=-AWd6J0Fvsa8s8S4sxOXu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-09-04 at 17:02 +0200, Juergen Gross wrote:
> On 04.09.19 16:54, Jan Beulich wrote:
> > On 04.09.2019 16:41, Juergen Gross wrote:
> > > On 04.09.19 16:02, Jan Beulich wrote:
> > > >=20
> > > > At the example of this: The more coarse granularity of the lock
> > > > means that no two vCPU-s within a unit can obtain their
> > > > runstate
> > > > in parallel. While this may be acceptable for core scheduling,
> > > > I'm afraid it's too restrictive for sockets or nodes as units.
> > > > Therefore I think this lock needs to either be split (I'm not
> > > > sure that's feasible) or become an r/w lock.
> > >=20
> > > You are aware that even today with credit2 all cpus of a socket
> > > share
> > > the same lock (if not modified via boot parameter)?
> >=20
> > No, I wasn't (explicitly; I could have deduced it). Not very
> > helpful,
> > I'm afraid, but unlikely to be bad enough to go back to credit1
> > (but
> > people having an issue with this could be told to switch back).
>=20
> Well, performance tests have shown that this is the most performant
> setting. And before going back to credit1 they still can use another
> lock setting (core or cpu).
>=20
Yeah, but it's not only locking. It's the entire load balancing
mechanism.

And yes, the scalability test we did showed that per-socket runqueues
was better. I think it is possible to improve locking scalability of
Credit2 (or, at least, I have some ideas.. but no code yet).

All that being said, I think it would be rather difficult to implement
sub-unit locking. And I don't think it's worth to do it right now, out
of concerns of potential scalability issues for socket-scheduling.

We're discussing about merging core-scheduling, but keeping it disabled
for now. We're not even sure if/when people will start to use *it*. I
currently don't see much use cases for socket-scheduling (although it
is indeed cool that we get the implementation basically for free!), and
hence I won't block patches or complicate the work for something like
that.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-AWd6J0Fvsa8s8S4sxOXu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl15GoQACgkQFkJ4iaW4
c+53vQ/9EXlHRm06WlhoBDIIwEgNH3UUiNU745eD3QY709V46tYnRp9xDHpn14EX
t5B5tAs5XX6fHUV79KMUevaV8AYLqOEllDaoWMxyqt+XHlEA+XPkFGlCDr42CA6z
C31NEaJPEIc2etCQadGvJMMQUDi5Fd5Tp4Krpbj30dZEUoYoiRuMKgTvwkLljb3l
s8o7HLR7E/oZ4PIihpeB1te+v78a87mHQbdVjs1KGHl77j48sUbwMQS4gZuIIUuV
jLvyV5oECFeMEnvIzvf12P1iR4axFe4222VAMD4tbIITXaAglWjJmiFCQcifmA5+
t327cwZ0HZ0P3+rEnQr8Uo7ek4tGqacZBYLvnW4aJB9ndD3kaMpwXRwP1tqQjmzc
/dt8XbAOqPaJfp6s2WXWjFKiuaXQFXONmPGJYmIMbwAlwFcBIImbQF+IJ3B9jpg2
MgDQootjeMxryLPSPK8AcibMgej5sVnRa3GQ2PoqYFlQymcAWhaWfeXe8b4ogCaI
wsJx/22qYdeg0Cy7HXH6FUoYBGvkCPJWftnhiUX/S/E8viTAGeh1h3LWoxbKaiJE
8kzUXc7yvb1d1OA5VCIhy9hO4w2fjdQP+ygAmdxkie0US49U3WgIcPixdPybpEBk
5T09u3SZuAsqCZOYK8sxoqmnkOnzediCoxQThZ5GqqeltKHRhIk=
=l2pD
-----END PGP SIGNATURE-----

--=-AWd6J0Fvsa8s8S4sxOXu--



--===============6479768484113681813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6479768484113681813==--


