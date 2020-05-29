Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 307DD1E7C32
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:46:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedT1-0005ZJ-SA; Fri, 29 May 2020 11:46:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BsAk=7L=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jedT0-0005Z9-FS
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:46:26 +0000
X-Inumbo-ID: 05b69920-a1a2-11ea-a89d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05b69920-a1a2-11ea-a89d-12813bfff9fa;
 Fri, 29 May 2020 11:46:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 36F00AD93;
 Fri, 29 May 2020 11:46:23 +0000 (UTC)
Message-ID: <ab810b293ca8324ca3fba22476401a58435243fa.camel@suse.com>
Subject: Re: [PATCH 0/2] xen: credit2: limit the number of CPUs per runqueue
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 29 May 2020 13:46:21 +0200
In-Reply-To: <158818022727.24327.14309662489731832234.stgit@Palanthas>
References: <158818022727.24327.14309662489731832234.stgit@Palanthas>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-+qL9EtQohQ8xfVPoO4tS"
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-+qL9EtQohQ8xfVPoO4tS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

So,

I felt like providing some additional thoughts about this series, from
a release point of view (adding Paul).

Timing is *beyond tight* so if this series, entirely or partly, has any
chance to go in, it would be through some form of exception, which of
course comes with some risks, etc.

I did work hard to submit the full series, because I wanted people to
be able to see the complete solution. However, I think the series
itself can be logically split in two parts.

Basically, if we just consider patches 1 and 4 we will end up, right
after boot, with a system that has smaller runqueues. They will most
likely be balanced in terms of how many CPUs each one has, so a good
setup. This will likely (actual differences seems to depend *quite a
bit* on the actual workload) be an improvement for very large systems.

This is a path will get a decent amount of testing in OSSTests, from
now until the day of the release, I think, because booting with the
default CPU configuration and setup is what most (all?) OSSTests' jobs
do.

If the user starts to create pools, we can get to a point where the
different runqueues are unbalanced, i.e., each one has a different
number of CPUs in them, wrt the others. This, however:
* can happen already, as of today, without this patches. Whether these
  patches may make things "better" or "worse", from this point of view,
  it's impossible to tell, because it actually depends on what CPUs=20
  the user moves among pools or put offline, etc.
* this means that the scheduler has to deal with unbalanced runqueues=20
  anyway, and if it doesn't, it's a bug and, again, it seems to me=20
  that these patches don't make things particularly better or worse.

So, again, for patches 1 and 4 alone, it looks to me that we'd get
improvements, at least in some cases, the codepath will get some
testing and they do not introduce additional or different issues than
what we have already right now.

They also are at their second iteration, as the original patch series
was comprised of exactly those two patches.

So, I think it would be interesting if these two patches would be given
a chance, even just of getting some reviews... And I would be fine
going through the formal process necessary for making that to happen
myself.

Then, there's the rest, the runqueue rebalancing thing. As said above,
I personally would love if we'd release with it, but I see one rather
big issue. In fact, such mechanism is triggered and stressed is
stressed by the dynamic creation and manipulation of cpupools (and CPU
on/off-lining), and we don't have an OSSTests test for that. Therefore,
we are not in the best position for catching issues it may have
introduced.

I can commit to do some testing myself, but it's not the same thing has
having them in our CI, I know that very well. So, I'd be interested in
hearing what others think about these other patches as well, and I am
happy to do my best to make sure that they are working fine, if we
decide to try to include them too, but I do see this as much more of a
risk myself.

So, any thoughts? :-)

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-+qL9EtQohQ8xfVPoO4tS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl7Q9g0ACgkQFkJ4iaW4
c+7EnhAAwTimyy3I+yI3AWOYUv40ynQ4r7V9hyj4vYIu8Z5pUi2NnuIaL4InpmLc
Pfg56ITTRxAHtxMtBO3mnthd1hRKmMlNja9QEoqlELvlFWVLZiXc2p5q9dyKN7UE
g46asOTFsAaD9T0Dqj4KnZvPf7BE4RjigxD85XpmVZdlHZ0itV5CvCGmFWood43W
cCVptXztg6T+P9JZnZ6s61qTQb/aRCtFKDoI8nVdP8LCQ94NqLQ1XCghbfJdXwyv
XwMpWEjJyQbpHvMx3BrOsr1VWxd+ZmzEBxaEZnOu3KniuViPlGhcBnBADiENaBeM
bSLSsFt+TFdfwteV/PTQ2yW5MCyGV+6Z57V1GXHvCiamZ4gmKlxTxdDa3KQPWJ7D
c81RtfEm1wQQUg2Q2bcBxOxn4hqaDRTc+/tBFDTw3OO12afscsRIBmHMshZL24yD
+bvN4eEeQuApUTNv5Oen5xJyoBHgGGTBmAPnUnOPS/C43kdMO2jy0zeKDq0k0+hH
RT8BsNeY0P2vgsA/q3a8I36+kSKDzNvYZb66WDEyxWemJCDva14J7AYE51H6W1u3
wJfIuxsgQMH3rnJPcekfgU6sJZb2UsH9SP2WlJf/rCBRskzbPZsx10cUEFsDT00l
146zGalxSIFb9RZPh/83nM078MPUoLxfp0fMyW5HOliNqrGQgkQ=
=UvJw
-----END PGP SIGNATURE-----

--=-+qL9EtQohQ8xfVPoO4tS--


