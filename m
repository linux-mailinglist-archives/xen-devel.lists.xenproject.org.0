Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB7BCBD45
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 16:32:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGOaI-0004si-Je; Fri, 04 Oct 2019 14:29:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+uwX=X5=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iGOaG-0004sZ-Pe
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 14:29:28 +0000
X-Inumbo-ID: 5e964888-e6b3-11e9-80e3-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e964888-e6b3-11e9-80e3-bc764e2007e4;
 Fri, 04 Oct 2019 14:29:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DE5A1AEA1;
 Fri,  4 Oct 2019 14:29:26 +0000 (UTC)
Message-ID: <e4a931227e71071a8ae3ab853a1f861d0d295e16.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>,  xen-devel@lists.xenproject.org
Date: Fri, 04 Oct 2019 16:29:25 +0200
In-Reply-To: <7cc89db1-90de-8435-77f3-c69e6e0217e4@citrix.com>
References: <20191004064010.25646-1-jgross@suse.com>
 <7cc89db1-90de-8435-77f3-c69e6e0217e4@citrix.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/sched: fix locking in
 sched_tick_[suspend|resume]()
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============4992748603915585233=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4992748603915585233==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-7K9puvKyGDW0y9p3MadW"


--=-7K9puvKyGDW0y9p3MadW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-10-04 at 08:50 +0100, Andrew Cooper wrote:
> On 04/10/2019 07:40, Juergen Gross wrote:
> > sched_tick_suspend() and sched_tick_resume() should not call the
> > scheduler specific timer handlers in case the cpu they are running
> > on
> > is just being moved to or from a cpupool.
> >=20
> > Use a new percpu lock for that purpose.
> >=20
> > Reported-by: Sergey Dyasli <sergey.dyasli@citrix.com>
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> > ---
> > To be applied on top of my core scheduling series.
>=20
> There is a somewhat interesting stack trace to go with this
>=20
Sorry, I don't think I get this. Does it mean that you see the
stacktrace below _even_with_ the patch applied?

> (XEN) Testing NMI watchdog on all CPUs: ok
> (XEN) ----[ Xen-4.13.0-8.0.12-d  x86_64  debug=3Dy   Not tainted ]----
> (XEN) CPU:    79
> (XEN) RIP:    e008:[<ffff82d0802467dc>] set_timer+0x39/0x1f7
> (XEN) RFLAGS: 0000000000010002   CONTEXT: hypervisor
> <snip>
> (XEN) Xen call trace:
> (XEN)    [<ffff82d0802467dc>] set_timer+0x39/0x1f7
> (XEN)    [<ffff82d08022c1f4>]
> sched_credit.c#csched_tick_resume+0x54/0x59
> (XEN)    [<ffff82d080241dfe>] sched_tick_resume+0x67/0x86
> (XEN)    [<ffff82d0802eda52>] mwait-idle.c#mwait_idle+0x32b/0x357
> (XEN)    [<ffff82d08027939e>] domain.c#idle_loop+0xa6/0xc2
> (XEN)
> (XEN) Running stub recovery selftests...
> (XEN) Pagetable walk from 0000000000000048:
> (XEN) traps.c:1564: GPF (0000): ffff82d0bffff041 [ffff82d0bffff041]
> ->
> ffff82d0803893f2
> (XEN)  L4[0x000] =3D 00000082cfb9c063 ffffffffffffffff
> (XEN) traps.c:759: Trap 12: ffff82d0bffff040 [ffff82d0bffff040] ->
> ffff82d0803893f2
> (XEN)  L3[0x000] =3D 00000082cfb9b063 ffffffffffffffff
> (XEN) traps.c:1098: Trap 3: ffff82d0bffff041 [ffff82d0bffff041] ->
> ffff82d0803893f2
> (XEN)  L2[0x000] =3D 00000082cfb9a063 ffffffffffffffff
> (XEN)  L1[0x000] =3D 0000000000000000 ffffffffffffffff
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 79:
> (XEN) FATAL PAGE FAULT
> (XEN) [error_code=3D0000]
> (XEN) Faulting linear address: 0000000000000048
> (XEN) ****************************************
>=20
> which demonstrates CPU 79 exploding straight out of idle, while the
> BSP
> is continuing to boot.
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-7K9puvKyGDW0y9p3MadW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2XV0UACgkQFkJ4iaW4
c+52rw/9FOKLxDl1/oT6wP7mK1otAvisA2DJ6uuWcWoPZX7TGo28iyDCzomWuevM
YhywT9LcZ/5UBC3aZTu006ahJ/xlgsfwWNvD5szq9lsiYQ0K68woVUp319eGFmVA
dGQyalYeK+zEaMBsge/kPyspDTwlf2IEo/lAriGKD/GshXdE36XFHfLcJdYMsa/a
ZyrIi1uCMW0T9t13LPuVuzx7FiVP4hWyH8I+2x80sAkX3VKvxYHhoPGq9FE039jW
5bJCB3E8H1/cWXc7QthzjnnrCxpRAJp4hxgYseYY5O0uiEM+1sb2SiichmW1AijN
togZx0zYWZemxlDhI2+tYGFf5HN69ZJrVRYmu0pVXiDGdDTNMfxWa9/bfOVPGUcL
mI2Ha2npEUdy89JFuvPxmflCif15n/8GSVapWY4dJe6SP1UZgDm80NYaEgTYyuLZ
aiXQ4iu0VoLRGVcUr2/QiGCyweW4IY8O5GviOCQax2utsilLsA0hFpHCt5ntEb3b
dZYA7cgo1nIADPMMjzgHeiABF2Ht5LN1/qVyKOH9sL7PLdWWWvOO6namf+zAEFPI
BxLksmXKcV6Pz0EcTfYNB2deHVGL0T14Eu9eNZiBYZB7tzSn0zK5vdDVxbmQoM8q
5cPZ2qIRuRekWY07HDQM80EYWrKiqo+cK83bgfBa8By/1SYNlsQ=
=nzkh
-----END PGP SIGNATURE-----

--=-7K9puvKyGDW0y9p3MadW--



--===============4992748603915585233==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4992748603915585233==--


