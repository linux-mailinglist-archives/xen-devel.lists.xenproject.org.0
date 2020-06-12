Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DCE1F7AEA
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 17:30:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjlco-0003hc-Gn; Fri, 12 Jun 2020 15:29:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u81f=7Z=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jjlcn-0003hV-36
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 15:29:45 +0000
X-Inumbo-ID: 8a4354ed-acc1-11ea-b5e1-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a4354ed-acc1-11ea-b5e1-12813bfff9fa;
 Fri, 12 Jun 2020 15:29:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4A74CACA7;
 Fri, 12 Jun 2020 15:29:46 +0000 (UTC)
Message-ID: <78910b5c27a3711726d53e931feb075c5cc4a64c.camel@suse.com>
Subject: Re: [RFC PATCH v1 4/6] xentop: collect IRQ and HYP time statistics.
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Date: Fri, 12 Jun 2020 17:29:40 +0200
In-Reply-To: <a5d7bbe8-a9ff-1396-bd7f-3b6143bddac7@suse.com>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-5-volodymyr_babchuk@epam.com>
 <2a0ff6f5-1ada-9d0a-5014-709c873ec3e3@suse.com>
 <88eac035-8769-24f7-45e6-11a1c4739ccb@xen.org>
 <a5d7bbe8-a9ff-1396-bd7f-3b6143bddac7@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-E3CEUp2PggUbrhDrBR5L"
User-Agent: Evolution 3.36.3 
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-E3CEUp2PggUbrhDrBR5L
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-06-12 at 14:41 +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 12.06.20 14:29, Julien Grall wrote:
> > On 12/06/2020 05:57, J=C3=BCrgen Gro=C3=9F wrote:
> > > On 12.06.20 02:22, Volodymyr Babchuk wrote:
> > > >=20
> > > > @@ -994,9 +998,22 @@ s_time_t sched_get_time_correction(struct=20
> > > > sched_unit *u)
> > > >               break;
> > > >       }
> > > > +    spin_lock_irqsave(&sched_stat_lock, flags);
> > > > +    sched_stat_irq_time +=3D irq;
> > > > +    sched_stat_hyp_time +=3D hyp;
> > > > +    spin_unlock_irqrestore(&sched_stat_lock, flags);
> > >=20
> > > Please don't use a lock. Just use add_sized() instead which will
> > > add
> > > atomically.
> >=20
> > If we expect sched_get_time_correction to be called concurrently
> > then we=20
> > would need to introduce atomic64_t or a spin lock.
>=20
> Or we could use percpu variables and add the cpu values up when
> fetching the values.
>=20
Yes, either percpu or atomic looks much better than locking, to me, for
this.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-E3CEUp2PggUbrhDrBR5L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl7jn2QACgkQFkJ4iaW4
c+6gQg//QBMNiOfvDBk7sLcjbKTTV5c/G+t1XZj9uy3Y0DHcgOpqwOkdXiNJ2ONm
ld+HkHGsNRkglocNFKCx8ZfLVvQX++KR/ou8BhvBItsqtB9frECppX2X6/ejbnu0
OLHuQzfzM4qR2FEOwqvETq/l531NIqro81N4a4Qf4AGTcFDZsD3kv7s4HBUXoVvv
Ahnt3MYP+ZwO1giV31Vw4XS8Vo89iHsvTV+K7eIhZOu/THa3yO0T8F1znGJ5lE8+
JIR+mX22570m79SDsZui6YISixLStbh0UFizPvbp7OLAPH1C9vew/17JHYN11vEo
lx2rlQ0g7rrf7Fifj4ilRFMTTGsQnR3bRstCqKcw98DvKwhUfkJEMF0AkH0IZXsP
P1NDAvWYa4d1LqwnNC+qzVY7ScOgGzykSIAyrkvnaPX+QBvmjbRhZgZgwOB4lGMq
PJV9HMbPnkMdJIpRfOtTZZlBtJwws78vxKQLow6wOWvKlbZj9qHna6imauN7vh78
G+lurZyPJFCq3iJTP1twddhW8xtOEm/2oPQSWT0PibBjMDKI7+Lv/i/5dIe1PIwC
WYW92qSZkdDIX0gIcauBMOgm7CcAe1vaol9SK9MFEKmwXQI3+oL1VMC4TQeVxYsw
Uke5k8a5vfvHjG8nTPBaReZBlHHM26MOBskszhIFSWu1658tPO4=
=YBDq
-----END PGP SIGNATURE-----

--=-E3CEUp2PggUbrhDrBR5L--


