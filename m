Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 784A8BEEAA
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:44:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQGy-0003Hq-4v; Thu, 26 Sep 2019 09:41:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cPk2=XV=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDQGw-0003Hl-5B
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:41:14 +0000
X-Inumbo-ID: c66bfc46-e041-11e9-964c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id c66bfc46-e041-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:41:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 492A4AD54;
 Thu, 26 Sep 2019 09:41:11 +0000 (UTC)
Message-ID: <1fbfb1e418e505c3a744c819003d387fd354c56a.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Date: Thu, 26 Sep 2019 11:41:09 +0200
In-Reply-To: <eddf7994-8c09-7d79-bbf9-f1518deec03f@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-41-jgross@suse.com>
 <eddf7994-8c09-7d79-bbf9-f1518deec03f@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 40/47] xen/sched: prepare per-cpupool
 scheduling granularity
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============1149315229019968878=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1149315229019968878==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-d4zlPdihKWWosAw4cAga"


--=-d4zlPdihKWWosAw4cAga
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-09-24 at 15:34 +0200, Jan Beulich wrote:
> On 14.09.2019 10:52, Juergen Gross wrote:
> > --- a/xen/include/xen/sched-if.h
> > +++ b/xen/include/xen/sched-if.h
> > @@ -25,6 +25,15 @@ extern int sched_ratelimit_us;
> >  /* Scheduling resource mask. */
> >  extern const cpumask_t *sched_res_mask;
> > =20
> > +/* Number of vcpus per struct sched_unit. */
> > +enum sched_gran {
> > +    SCHED_GRAN_cpu,
> > +    SCHED_GRAN_core,
> > +    SCHED_GRAN_socket
> > +};
>=20
> Seeing the almost absurd arrangement on my AMD Fam17 system (128 CPUs
> per Credit2 runqueue, for a total of two runqueues) I really wonder
> whether there shouldn't be a plan for a further intermediate
> granularity between "core" and "socket". The other day I did notice
> Linux has gained the concept of "die", which would bring the
> arrangement to a more reasonable 8 runqueues of 32 CPUs each on this
> system. (I'm taking Credit2 as a reference here only.)
>=20
The default Credit2 setup on such system does indeed make no sense.

Introducing DIE (or whatever we want to call it) granularity for
Credit2 runqueues, and, in general, doing something more clever when
deciding how many CPUs should end up in the same runqueue is definitely
something we want.

Actually, there are patches already for specifying, at boot time, a
totally arbitrary runqueue arrangement.... I just need to fish them
from the list, rebase and resubmit. This does not cover the case above,
as we will still need a more sensible default, but it goes in the right
direction, I think.

That's, however, something which although quite important for Credit2,
is less of a concern for core-scheduling. In fact, as said elsewhere
already, I really don't expect anyone to want to use either die-
scheduling, socket-scheduling or anything different than core-
scheduling anytime soon.

I'll look into the Credit2 runqueue issue (for 4.14).

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-d4zlPdihKWWosAw4cAga
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2Mh7UACgkQFkJ4iaW4
c+7Z6RAAgpkqivdVfXTr5R4CsLPZcq7pc4gBG76szNj2DmOEColqM0ggG1ye9sGn
RI9pJfsk0WkQtGEEQdmO+UOolr3AsAAeyJOOvdqsGtALvWYvT0/JaKwM/n9A6qUW
Tqeqggn5VjjjSphjQPNWMvuZYBHOnZW9NvDlZdTxMAXTxJoNYcg6iwCVywWenA8P
xCWS/pqhwtVkn1PhHPVXQvGlLKvlD2ar8Irr1f+RsWVhmJPC/2gFNp/xTqoOOrIN
srNOZxFBAvWikgEK1OHN4IdLfdW+0Ec9C6HHnq5smzlSKzhTlJdd/8qbld7tYgFk
3pNgOllG4Az2+S9guroIELPo1uKwyJ+jdocNJY8IC+hv5UaW7V6RVRmNY1tC++3D
H2h1rDhHt3ZYvuVvQGqXTIpuvm7hp69aP5flq8MUTQ+mgjrsuNkjRuSb59/Xd7/Q
k8Ytk/xomhn6uFuQOwvoCq+mTJV6p8QxmxwBqIwyk4yhOiRAthpIgEVowFR0nEKx
0lMyDaBVK24KH/hD/dnNSQ/otVbi9thVmlgraRFW6AxmqBK5I1qXXscTIINKfHu0
YAFZitoEDmbGE9lKiuCJj1fTdad4PeYujhGBIGU5HN9TFmsqTCBCYeKY8w4GZ9vP
ujuLovcXRAuDc43ls9cASxGCTSocZ61jGf6UWCP2waTaCbBbPrw=
=95FJ
-----END PGP SIGNATURE-----

--=-d4zlPdihKWWosAw4cAga--



--===============1149315229019968878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1149315229019968878==--


