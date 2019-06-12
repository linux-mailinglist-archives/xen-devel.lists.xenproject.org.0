Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C8E421DD
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 12:00:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hazzu-0006SL-D8; Wed, 12 Jun 2019 09:56:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kiAS=UL=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hazzs-0006SE-90
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 09:56:48 +0000
X-Inumbo-ID: 61c10d78-8cf8-11e9-aa68-5f3fbc2897d3
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61c10d78-8cf8-11e9-aa68-5f3fbc2897d3;
 Wed, 12 Jun 2019 09:56:43 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Wed, 12 Jun 2019 11:56:42 +0200
Received: from [192.168.0.36] (nwb-a10-snat.microfocus.com [10.120.13.202])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Wed, 12 Jun 2019 10:56:38 +0100
Message-ID: <0889f51d8aed0c95ecfcd038678f945abf2ca42a.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <JBeulich@suse.com>, Juergen Gross <jgross@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Date: Wed, 12 Jun 2019 11:56:36 +0200
In-Reply-To: <5D00C6960200007800237622@suse.com>
References: <20190528103313.1343„1„jgross@suse.com>
	 <20190528103313.1343„4„jgross@suse.com>
	 <afe9fd8d„36b5„e946„2084„36bf8f7dcaba@citrix.com>
	 <4e594f85-b33b-87ca-2253-53a70ab8808f@suse.com>
	 <5D00C6960200007800237622@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 03/60] xen/sched: let sched_switch_sched()
 return new lock address
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Robert VanVossen <Robert.VanVossen@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 Joshua Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============8075320304994891161=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8075320304994891161==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-qNg3kYMY22pvqx3sxQzF"


--=-qNg3kYMY22pvqx3sxQzF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-06-12 at 10:32 +0100, Jan Beulich wrote:
> > > > On 12.06.19 at 10:19, <jgross@suse.com> wrote:
> > On 12.06.19 10:05, Andrew Cooper wrote:
> > > On 28/05/2019 11:32, Juergen Gross wrote:
> > > >=20
> > > > +    per_cpu(scheduler, cpu) =3D new_ops;
> > > > +    sd->sched_priv =3D ppriv;
> > > > +
> > > > +    /*
> > > > +     * (Re?)route the lock to the per pCPU lock as /last/
> > > > thing. In fact,
> > > > +     * if it is free (and it can be) we want that anyone that
> > > > manages
> > > > +     * taking it, finds all the initializations we've done
> > > > above in place.
> > > > +     */
> > > > +    smp_mb();
> > >=20
> > > A full memory barrier is a massive overhead for what should be
> > > smp_wmb().  The matching barrier is actually hidden in the
> > > implicit
> > > semantics of managing to lock sd->schedule_lock (which is trial
> > > an error
> > > anyway), but the only thing that matters here is that all other
> > > written
> > > data is in place first.
> > >=20
> > Not that it would really matter for performance (switching cpus
> > between
> > cpupools is a _very_ rare operation), I'm fine transforming the
> > barrier
> > into smp_wmb().
>=20
> This again is a change easy enough to make while committing. I'm
> recording the above in case I end up being the committer.
>=20
I'm fine (i.e., my Rev-by: remains valid) with this being turned into a
wmb(), and it being done upon commit (thanks Jan for the offer to do
that!).

If we do it, however, I think the comment needs to be adjusted too, and
the commit message needs to briefly mention this new change we're
doing.

Maybe, for the comment, add something like:

"The smp_wmb() corresponds to the barrier implicit in successfully
taking the lock."

And, for the changelog, add:

"While there, turn the full barrier, which was overkill, into an
smp_wmb(), matching with the one implicit in managing to take the
lock."

Or something similar (and again, R-b: still stands with such changes).

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-qNg3kYMY22pvqx3sxQzF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0AzFUACgkQFkJ4iaW4
c+7/9w//ZVBe24ttfMXe+OFxNSUyxwOQOT5g1VeJzUKjXyM8vlclh99Djp2wWPV2
Ruo0JCVwdWzGNxHa8rk+pQTv/VePhTN2MsATKOUOcv/slfMIv8vQbJI3G6WcX2+L
rKIlfZ5/7OdozdUL8sIPS1o6X5gNAgQPmVyV2uF0YXN8nHOGUWKQIuFjYxtN00Rm
td2NJoD9eazEnGUmPwuvJAN/dCW52CVjGLRXfxhlUc8x8UJRt4vmXBtVetCeIpj3
VUCkeGLqG5hG1Jg8pNPAqNol3JDVb65/809rjJfosCkzG/P2G0Mo4vTPrfz6SnlE
f32+nD6t2ljraBpzzmYl2EINXBILzDuwe5lR6qD4lkmfdm1zrDqkMYLxJ9QHgLUt
EwUGta8UEJ/dNUMZIdYXCQ6PQ4gkPeZYavW2/Z8XtFSy6hVFH7JC950YysZyhCYD
PqAq9cKesK83CEbpE7OBwNDKclN9QZzTdckgyGtvjhl20Plofrf80KzQ6R6Gz/7z
r9RdghY8WR07t3LuxDYVn+5gbAGDfw6Fm62QdUxVyAFWgo+mtIuLiJF5ggs1is0O
y6v9IKHu9l2pcE3Ine8KMXn+VCihZ8gSTF/QY2RGVxeFxfAFBn79fAjnG321Z8hJ
xrKSo1H3Mqize/yE5zUj+TpGP/jYVSuPL7R988Mf7Vt4QHkGYqE=
=EAgO
-----END PGP SIGNATURE-----

--=-qNg3kYMY22pvqx3sxQzF--



--===============8075320304994891161==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8075320304994891161==--


