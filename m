Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD0518A9D2
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 01:32:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEj2m-0007sH-Ga; Thu, 19 Mar 2020 00:28:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BIJ4=5E=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jEj2l-0007sC-70
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 00:28:15 +0000
X-Inumbo-ID: 84adb6a8-6978-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84adb6a8-6978-11ea-a6c1-bc764e2007e4;
 Thu, 19 Mar 2020 00:28:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A8CD3AE4B;
 Thu, 19 Mar 2020 00:28:12 +0000 (UTC)
Message-ID: <413cac496e18bcb04b0691ef633d206f3a14a8e3.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Marek =?ISO-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Date: Thu, 19 Mar 2020 01:28:10 +0100
In-Reply-To: <20200318221006.GS18599@mail-itl>
References: <20200318141635.GW7869@mail-itl>
 <fa845540-fd8e-bc63-a3af-50673dede579@citrix.com>
 <20200318221006.GS18599@mail-itl>
Organization: SUSE
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.de>
Content-Type: multipart/mixed; boundary="===============8349284337159760556=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8349284337159760556==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-mkttsT56z8bkquCZok65"


--=-mkttsT56z8bkquCZok65
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Adding Juergen]

On Wed, 2020-03-18 at 23:10 +0100, Marek Marczykowski-G=C3=B3recki wrote:
> On Wed, Mar 18, 2020 at 02:50:52PM +0000, Andrew Cooper wrote:
> > On 18/03/2020 14:16, Marek Marczykowski-G=C3=B3recki wrote:
> > > Hi,
> > >=20
> > > In my test setup (inside KVM with nested virt enabled), I rather
> > > frequently get Xen crash on resume from S3. Full message below.
> > >=20
> > > This is Xen 4.13.0, with some patches, including "sched: fix
> > > resuming
> > > from S3 with smt=3D0".
> > >=20
> > > Contrary to the previous issue, this one does not happen always -
> > > I
> > > would say in about 40% cases on this setup, but very rarely on
> > > physical
> > > setup.
> > >=20
> > > This is _without_ core scheduling enabled, and also with smt=3Doff.
> > >=20
> > > Do you think it would be any different on xen-unstable? I cat
> > > try, but
> > > it isn't trivial in this setup, so I'd ask first.
> > >=20
Well, Juergen has fixed quite a few issues.

Most of them where triggering with core-scheduling enabled, and I don't
recall any of them which looked similar or related to this.

Still, it's possible that the same issue causes different symptoms, and
hence that maybe one of the patches would fix this too.

But if it's difficult for you to try upstream, let's maybe wait and see
if he has an opinion about this bug.

I have just one question:

> (XEN) Assertion 'c2rqd(ops, sched_unit_master(unit)) =3D=3D svc->rqd'
> failed at sched_credit2.c:2137
> (XEN) ----[ Xen-4.13.0  x86_64  debug=3Dy   Not tainted ]----
> [...]
> (XEN) Xen call trace:
> (XEN)    [<ffff82d08022bee9>] R
> sched_credit2.c#csched2_unit_wake+0x174/0x176
> (XEN)    [<ffff82d0802346c6>] F vcpu_wake+0xdd/0x3ff
> (XEN)    [<ffff82d0802082f1>] F domain_unpause+0x2f/0x3b
> (XEN)    [<ffff82d08020843e>] F
> domain_unpause_by_systemcontroller+0x40/0x60
> (XEN)    [<ffff82d080205ea5>] F do_domctl+0x9e4/0x1952
> (XEN)    [<ffff82d08034d922>] F pv_hypercall+0x548/0x560
> (XEN)    [<ffff82d080354432>] F lstar_enter+0x112/0x120
> (XEN)=20
> (XEN)=20
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Assertion 'c2rqd(ops, sched_unit_master(unit)) =3D=3D svc->rqd'
> failed at sched_credit2.c:2137
> (XEN) ****************************************
> (XEN)=20
>
Do you remember (or can easily test) whether this was also occurring on
Xen 4.12, i.e., without core-scheduling code even being there, when
this ASSERT was:

 ASSERT(c2rqd(ops, vc->processor) =3D=3D svc->rqd );

If no, that might mean we have some scheduling resource and/or master
CPU issue on the S3 resume path.

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-mkttsT56z8bkquCZok65
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5yvJsACgkQFkJ4iaW4
c+69Ug//VIwVK2FJPyT6jvMyBkKy4aDOOGXsEQ3RW3GgHPese+wT2TUouLbVi+so
Rh/9d/mpM/6n40Bcm4j8Yp6s5LPR3tDkfH1FlWN2b9CYTVgkuMdoY0tUBxprT9wU
5uH+vDTGcqzQIIudfm7+HXXT/pvZdY2M4VakgT2E0qjT5XiiIpL3B0XzVPCoI0wm
F/WxXNYqaxYCPfkkp84ZBAsCOT7CJ90xbS2spnRnyFSHBgV1CmwMoa1jwNAWZ1LL
ItAYf5PlC+p7CFxZ2sdeJocag5lBB2iwBA1+06An20wU+7T02ytRtAf66eOOQcXJ
YMelwDSOvXT13Zg3RJPhsWj76B3P0OuDKzyD+Fc892/3VA8mn5cubZ8HKT4dgkDM
ubVsT+sts02DyeWHMt9K28X8kzC5+S6bwPaFciZ63bQi775dAWFyiu9qJi4Wyne6
39XQnbxTZx+j5FXparNozZ/e+JcXx2vN1TekxIjqzRT9JILhlykB1zR0WZkKslm7
cyQswCI658hxCsTvaAiR03+LCpxYciIKqOVSoG7YImTRaNmjxaUOUYzJUKPgdaLz
2TXbEsxv9JKicbqvgFfbepuQzupyanvj3R+eDYglT5mphiuLUU+SwmmoHEdiNaJ5
BOI8HcIoa86d+GOli4VRIm/Kz2N3kr39qp0eCaT2K3lZ4c0o9XI=
=PdMF
-----END PGP SIGNATURE-----

--=-mkttsT56z8bkquCZok65--



--===============8349284337159760556==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8349284337159760556==--


