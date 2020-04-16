Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFA91ACE28
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 18:56:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP7nw-0004j7-N4; Thu, 16 Apr 2020 16:55:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04wr=6A=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jP7nu-0004j2-Ov
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 16:55:54 +0000
X-Inumbo-ID: 220f0776-8003-11ea-8bd1-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 220f0776-8003-11ea-8bd1-12813bfff9fa;
 Thu, 16 Apr 2020 16:55:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4AAE5ACA1;
 Thu, 16 Apr 2020 16:55:52 +0000 (UTC)
Message-ID: <96263bbd41717d68bb35f14163973267a29ef0e4.camel@suse.com>
Subject: Re: [PATCH OSSTEST 2/2] make-flight: add a core scheduling job
From: Dario Faggioli <dfaggioli@suse.com>
To: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Date: Thu, 16 Apr 2020 18:55:51 +0200
In-Reply-To: <20200416163607.GO28601@Air-de-Roger>
References: <20200415085246.7945-1-roger.pau@citrix.com>
 <20200415085246.7945-2-roger.pau@citrix.com>
 <24215.1729.892903.300149@mariner.uk.xensource.com>
 <ca19a888e95d00ce664b9d777510e366547327cc.camel@suse.com>
 <20200416163607.GO28601@Air-de-Roger>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-2Aw/QhzsplwSlf9tzdzL"
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
Cc: Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-2Aw/QhzsplwSlf9tzdzL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-04-16 at 18:36 +0200, Roger Pau Monn=C3=A9 wrote:
> On Thu, Apr 16, 2020 at 06:28:33PM +0200, Dario Faggioli wrote:
> > On Wed, 2020-04-15 at 14:06 +0100, Ian Jackson wrote:
> > >=20
> > > This seems fine as far as it goes, but all it does is check that
> > > things still work if sched-gran=3Dcore is passed.=20
> > >=20
> > Yep, and that's enough for enabling and starting using ore-
> > scheduling.
> > So, doing like this, core-scheduling should get the same amount and
> > kind of testing that scheduling in general gets.
>=20
> Well, we run a lot more tests without 'sched-gran=3Dcore', but I don't
> think it's feasible to duplicate the matrix to run all tests with and
> without core-scheduling.
>=20
Sure, but again, that's the kind of scheduling testing that we do.
E.g., right now that Credit2 is the default scheduler, we still test
the other schedulers, exactly with "just" a job like this (AFAICR, at
least).

It indeed would be good to have something more specific, not only for
core-scheduling, but for scheduling in general. But it's not there
right now... That was the point. :-)

Of course the default setup (which, currently, has "sched-gran=3Dcpu") is
stressed much more, because all the other jobs also use it, but indeed
it does not appear sensible to replicate the matrix for each job that
we have with a non-default configuration.

> > One question, as my OSSTest-fu is a bit rusty... does this create
> > "sched-gran=3Dcore" tests for all the schedulers? Or just one of them
> > for
> > th default scheduler?
>=20
> Just for the default scheduler ATM, we can expand this if required.
>
Ok, sure. Maybe it would make sense to add just another one for Credit,
sooner rather than later, as I guess there may be people wanting to
continue use Credit, but they may want to try it with core-scheduling.

Of course, this can be done on top of this patch... I was just thinking
out loud here. :-)

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-2Aw/QhzsplwSlf9tzdzL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl6YjhcACgkQFkJ4iaW4
c+7V1w/+PfHN8AlcJCzAjIecPV1EQCW+m2HuVinIwvWq3/LRlHWfHpteQln2zj/b
C2lASOg0+kzr1KFKwyt89VDsqz8P/hTxPTGVpicW10N74s5ZAUrSsXKpEGnm6I4s
JTJE2tbNseTZZetJMgGANgjjXMK4P6NCf6lYK5zTb6n28bEFQI/nFAtTT5kKJv9y
IdWCvTmHbdiiHjXrXJsf1KaA6Sfa/Pt4AVMdeVTs+vrJ8sg9sB5tupzr3bNfZgci
dsAURzV8LShwKWOzI5LuYnAQ3gSts4V9yGjbha69Px/XZ7P1Q12pT48VxB6gPAnB
oDj6VBLbxWUKDfbF4bH4cL+HRrx+L3ac8nHbBPc8XKlh17rQonTDtEZYmE0jdPbq
ODjK5j3JAYTVWN2Osg7LrwtsXivGbeQcaOhOm7BOZs3eOTD9Q6L7pvoClku/7Hzr
Te4boaXQBGDNbkc46yNoYcRkWuAn0GLWlOW95dj5p3GirMZ5SMNEjzPad5miShXy
Zlv4H5i9sOzyKU+61RLbdTtMkx3DVeW/PTq8DtHYSYd2y5RoZ1jK9knGi4rslwn9
Z0mnrDdB5I7TOJ9LUIh53t23kVWWot5eB8L1dPXrZewScj6H2btPo9wjGzf+qcFw
6ucRASJeXMYohKmQdvPzLAZOiylYOQNf+U0yOKuwIwvFKGCctFo=
=OAbZ
-----END PGP SIGNATURE-----

--=-2Aw/QhzsplwSlf9tzdzL--


