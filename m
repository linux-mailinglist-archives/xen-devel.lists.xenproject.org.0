Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDFE1E310E
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 23:20:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdgy3-0002mo-FJ; Tue, 26 May 2020 21:18:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KCAZ=7I=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jdgy1-0002mj-TR
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 21:18:33 +0000
X-Inumbo-ID: 728b1426-9f96-11ea-a6bd-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 728b1426-9f96-11ea-a6bd-12813bfff9fa;
 Tue, 26 May 2020 21:18:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 784E4AD4F;
 Tue, 26 May 2020 21:18:32 +0000 (UTC)
Message-ID: <8bf86f0c2bcce449cf7643aa9b98aa26ea558c2c.camel@suse.com>
Subject: Re: [PATCH 2/2] xen: credit2: limit the max number of CPUs in a
 runqueue
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, 
 xen-devel@lists.xenproject.org
Date: Tue, 26 May 2020 23:18:27 +0200
In-Reply-To: <7e039c65-4532-c3ea-8707-72a86cf48e0e@suse.com>
References: <158818022727.24327.14309662489731832234.stgit@Palanthas>
 <158818179558.24327.11334680191217289878.stgit@Palanthas>
 <b368ccef-d3b1-1338-6325-8f81a963876d@suse.com>
 <d60d5b917d517b1dfa8292cfb456639c736ec173.camel@suse.com>
 <7e039c65-4532-c3ea-8707-72a86cf48e0e@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-UKAJFAljL5IxqXECkPZ6"
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
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-UKAJFAljL5IxqXECkPZ6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-04-30 at 14:52 +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 30.04.20 14:28, Dario Faggioli wrote:
> > That being said, I can try to make things a bit more fair, when
> > CPUs
> > come up and are added to the pool. Something around the line of
> > adding
> > them to the runqueue with the least number of CPUs in it (among the
> > suitable ones, of course).
> >=20
> > With that, when the user removes 4 CPUs, we will have the 6 vs 10
> > situation. But we would make sure that, when she adds them back, we
> > will go back to 10 vs. 10, instead than, say, 6 vs 14 or something
> > like
> > that.
> >=20
> > Was something like this that you had in mind? And in any case, what
> > do
> > you think about it?
>=20
> Yes, this would be better already.
>=20
So, a couple of thoughts. Doing something like what I tried to describe
above is not too bad, and I have it pretty much ready.

With that, on an Intel system with 96 CPUs on two sockets, and
max_cpus_per_runqueue set to 16, I got, after boot, instead of just 2
giant runqueues with 48 CPUs in each:

 - 96 CPUs online, split in 6 runqueues (3 for each socket) with 16=20
   runqueues in each of them

I can also "tweak" it in such a way that, if one for instance boots
with "smt=3Dno", we get to a point where we have:

 - 48 CPUs online, split in 6 runqueues, with 8 CPUs in each

Now, I think this is good, and actually better than the current
situation where on such a system, we only have two very big runqueues
(and let me repeat that introducing a per-LLC runqueue arrangement, on
which I'm also working, won't help in this case, as NUMA node =3D=3D LLC).

So, problem is that if one starts to fiddle with cpupools and cpu on
and offlining, things can get pretty unbalanced. E.g., I can end up
with 2 runqueues on a socket, one with 16 CPUs and the other with just
a couple of them.

Now, this is all possible as of now (I mean, without this patch)
already, although at a different level. In fact, I can very well remove
all-but-1 CPUs of node 1 from Pool-0, and end up again with a runqueue
with a lot of CPUs and another with just one.

It looks like we need a way to rebalance the runqueues, which should be
doable... But despite having spent a couple of days trying to come up
with something decent, that I could include in v2 of this series, I
couldn't get it to work sensibly.

So, this looks to me like an improvement, that would need being
improved further, but I'm not sure we have the time for it right now
(Cc-ing Paul). Should we still go for what's ready? I think yes, but
I'd be interested in opinions...

Also, if anyone has any clever ideas on how to implement a mechanism
that rebalance the CPUs within the runqueue, I'm all ears and am up for
trying implementing. :-)

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-UKAJFAljL5IxqXECkPZ6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl7Nh6QACgkQFkJ4iaW4
c+4WCQ//Rlw01mXUpz2TGQ3s+MTXAn76wT6CVBJG1ChBEqxyZsLpgl71KByVwozB
gIZFm9a7mEslNch0BmfYswsrr+SIl12YhzRdclXwdGlud8pKkkSYNq2GnKrFjjlf
sttMkU2dXla+ZNPa/T9zpilF1Eu+V1baWEwCYZXg+dJ9hZBZLymxTpc1MoHlR4pM
lUogKuPpznQWYaA9t5Dpp606BSTbgAmwPLjHUJfgA/46d4W1OsY+nXHK59VuZDNb
ObT9qmYZNFgdPfXf0Rc8ofi7+TJZ0addKIGQZ9AxgpCgTYV+owsJRl8zR2z68s6d
kvZOWKb3aZRzVxvO+OedjkSphottwqYmqznuUIft2d30YzIUkH8MWJ3PUNaerMoU
vs4FxVlUYDgFJ1y2Z4+fis3rcZbTGtsoXfBH3u+l72XbFDNjGU3gwwnqC3bUy1SC
nloFJviZhg+7c++Rlbtg3HvCAdWoS4b4XTyNklHEZ8+eU7MT8q1WzQd5ZOLmay3P
BuoceEDi4Yd87M6NdjQGGM/CKOLCV6Sj7gIPjx/BdEp2k1nRnbc4RcY4b4ZDeg3i
IS3XIJlST/s6bHolT5lraJ6bUG4V7t4y2QX8ElbTNHrtpr9D+XxpBCdVnpc6JTVo
kiLJ75gAY6YDpVP1E3hLDE4vcL1Jrtm/YQW3D+LreYxGla1iDBw=
=uLmS
-----END PGP SIGNATURE-----

--=-UKAJFAljL5IxqXECkPZ6--


