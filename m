Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 925FE30FD1
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 16:17:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWiJT-0005Oz-1o; Fri, 31 May 2019 14:15:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=agGR=T7=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hWiJR-0005Om-PS
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 14:15:17 +0000
X-Inumbo-ID: 823e5674-83ae-11e9-8980-bc764e045a96
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 823e5674-83ae-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 14:15:15 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Fri, 31 May 2019 16:15:13 +0200
Received: from [192.168.0.36] (nwb-a10-snat.microfocus.com [10.120.13.201])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Fri, 31 May 2019 15:15:08 +0100
Message-ID: <5509cdf7d7fb706e045e4627e1d3e24619e122e6.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
Date: Fri, 31 May 2019 16:15:07 +0200
In-Reply-To: <5ea454f1-79f7-2974-0736-3262870446ab@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-55-jgross@suse.com>
 <5CED1FDC0200007800233141@prv1-mh.provo.novell.com>
 <5ea454f1-79f7-2974-0736-3262870446ab@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 54/60] xen/sched: add minimalistic idle
 scheduler for free cpus
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
Content-Type: multipart/mixed; boundary="===============1466069064504856208=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1466069064504856208==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-YTBWYxd+05p2oNmujdwO"


--=-YTBWYxd+05p2oNmujdwO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-05-28 at 13:58 +0200, Juergen Gross wrote:
> On 28/05/2019 13:47, Jan Beulich wrote:
> > > > > On 28.05.19 at 12:33, <jgross@suse.com> wrote:
> > > Instead of having a full blown scheduler running for the free
> > > cpus
> > > add a very minimalistic scheduler for that purpose only ever
> > > scheduling
> > > the related idle vcpu. This has the big advantage of not needing
> > > any
> > > per-cpu, per-domain or per-scheduling unit data for free cpus and
> > > in
> > > turn simplifying moving cpus to and from cpupools a lot.
> >=20
> > And the null scheduler is not minimalistic enough?
>=20
> The main disadvantage of the null scheduler are the need for private
> data (which has to be allocated/freed on scheduler switch), its not
> yet perfect stability, and its "complexity" (e.g. 900 lines vs. 50).
>=20
Yes, I absolutely agree with this approach of having an even simpler
idle scheduler, for the idle vcpus, and not selectable and usable by
the user for other things.

It would, actually, be rather useful in other ways and places, so I'm
actually rather happy to see it appearing (I started multiple times
doing something like this myself, but never finished :-/)

For instance, the fact that we put cpus that are not in any pool in the
default scheduler, was weird (to say the least) from a conceptual point
of view, forced us to do some extra checks (in the form of, e.g.,
cpumask() operations) to avoid actually scheduling vcpus on them and
was causing accounting issues in Credit1.

Now that the free cpus can go and stay in their own "idle scheduler",
those things can all be solved, in the (IMO) best and most clean way.

And, yes, it has to be as simple as possible, even simpler than null...
And I think we can easily see why that's the case, just by looking at
what code this patch let us remove (e.g., the need for some of the
checking of `system_state` in cpupool or scheduler code, just to
mention one).

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-YTBWYxd+05p2oNmujdwO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlzxNusACgkQFkJ4iaW4
c+6Csg//R7ZvO6oI7I18r/f8gOSJZZE1QMskUKLFB/yOv4O2FOxLomUNb+W07efq
T1O8LFwLKn4c7rLJSEIYHpKzAWOVLbdvryYrawSD5Swcqw8KCQRaKd2zow9KL525
SS8dN7VuuwcO9HMIMZnElNGtXEucebt9iIbLKgc+jSLzuqEAnjQrf0wM9i+oCBc2
oZE5z/qy6BCgOl2g5YlzKBWhFUDBCI+iVD8mwQ7X9PgonCBB1qHp2cDRDUUrAIxV
uHbh28k7uUFq8LxcsFsuBXi8X2lJh7J+NRYtA0icTIFozFNY22WKx4m9OrzWlMmO
vIIP8qui84ZWM4zvxAf2blXxuLZgfAyQQvVGik72uDZC9L4Sv2hQC/HfMPRx2Wfe
U02eime/tb0RJ8GnWp2u5aj7gYPATRBgkDRtveVCTLS8QvzCYCvnAavOEOemHhO+
1UqBQOOMuKRNuwEVWT4pB3I2kUXHTZ1zLSc7ZGoXd1GL0f5espXOorsheKyKkcM9
jGEt49Dx8WZmHa0QmOPgaN7kzpg5EmEJuwsseu1CD99tZQJ36d8S7BGZ33UrJMt/
IelWz/+BNxgU8RoBiMt5VgjhdUv569bVfetAFKrr/+8opVS5MlAjJc9ofrhpSwOS
KnmqwHI0qGPs1wUut9EPPp7jPAaQT5KNSqVB4Gx6QRlE6tZZ/eU=
=fhSQ
-----END PGP SIGNATURE-----

--=-YTBWYxd+05p2oNmujdwO--



--===============1466069064504856208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1466069064504856208==--


