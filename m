Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7688B124255
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 10:01:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihVAG-0002aO-W0; Wed, 18 Dec 2019 08:58:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lBFt=2I=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1ihVAE-0002aH-V8
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 08:58:38 +0000
X-Inumbo-ID: 93f51526-2174-11ea-9047-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93f51526-2174-11ea-9047-12813bfff9fa;
 Wed, 18 Dec 2019 08:58:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 36753ACE1;
 Wed, 18 Dec 2019 08:58:36 +0000 (UTC)
Message-ID: <2ee2b27f31eeb85bff40bcfd588a6d45c7e80488.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 18 Dec 2019 09:58:33 +0100
In-Reply-To: <20191218074859.21665-2-jgross@suse.com>
References: <20191218074859.21665-1-jgross@suse.com>
 <20191218074859.21665-2-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/9] xen/sched: move schedulers and cpupool
 coding to dedicated directory
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
Content-Type: multipart/mixed; boundary="===============2202998750942032603=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2202998750942032603==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-snbIcVOZEnXEaPTN1qYy"


--=-snbIcVOZEnXEaPTN1qYy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-12-18 at 08:48 +0100, Juergen Gross wrote:
> Move sched*c and cpupool.c to a new directory common/sched.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  MAINTAINERS                                        |  8 +--
>  xen/common/Kconfig                                 | 66 +-----------
> ----------
>  xen/common/Makefile                                |  8 +--
>  xen/common/sched/Kconfig                           | 65
> +++++++++++++++++++++
>  xen/common/sched/Makefile                          |  7 +++
>  .../{compat/schedule.c =3D> sched/compat_schedule.c} |  2 +-
>  xen/common/{ =3D> sched}/cpupool.c                   |  0
>  xen/common/{ =3D> sched}/sched_arinc653.c            |  0
>  xen/common/{ =3D> sched}/sched_credit.c              |  0
>  xen/common/{ =3D> sched}/sched_credit2.c             |  0
>  xen/common/{ =3D> sched}/sched_null.c                |  0
>  xen/common/{ =3D> sched}/sched_rt.c                  |  0
>  xen/common/{ =3D> sched}/schedule.c                  |  2 +-
>  13 files changed, 80 insertions(+), 78 deletions(-)
>  create mode 100644 xen/common/sched/Kconfig
>  create mode 100644 xen/common/sched/Makefile
>  rename xen/common/{compat/schedule.c =3D> sched/compat_schedule.c}
> (97%)
>  rename xen/common/{ =3D> sched}/cpupool.c (100%)
>  rename xen/common/{ =3D> sched}/sched_arinc653.c (100%)
>  rename xen/common/{ =3D> sched}/sched_credit.c (100%)
>  rename xen/common/{ =3D> sched}/sched_credit2.c (100%)
>  rename xen/common/{ =3D> sched}/sched_null.c (100%)
>  rename xen/common/{ =3D> sched}/sched_rt.c (100%)
>  rename xen/common/{ =3D> sched}/schedule.c (99%)
>=20
Matter of taste, I guess, but what about not repeating 'sched', i.e.:

xen/common/sched_credit.c  --> xen/common/sched/credit.c
xen/common/sched_credit2.c --> xen/common/sched/credit2.c
xen/common/sched_null.c    --> xen/common/sched/null.c
...

schedule.c can be called something like 'core.c', or 'common.c' or just
'sched.c' (the repetition being, in this case, intentional)

?

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-snbIcVOZEnXEaPTN1qYy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl356jkACgkQFkJ4iaW4
c+75Yg//ZlkcU5ANZlabo7pX8szj3r5j3R30VXpGVtsKnYga0dJY6Z7N3ZtuK27O
JEyfCMZolom04V7Q6Ne2p+7PC9lgnLfKWV3D6nsMN4YMaUiQKhirHuHQDcirWEpu
CSxOdU5xRR7TCnfiDLogq3FGpln3dZVy2LZz/KRp2lmQ7vmQlX8W/+qQr+any5Bq
Wgb72bA/qpWzte/lEyVrOUmQE3jmcxphi4Wz4aJsZWAZTPOKx7xvhHMl2JBtLAPu
yxLtvFEuB+4TN5zYSADQ2VCsBkGQsdqZ1obY26a/BJj1heOz4kx7rfgBAlypmA1v
wqY4403wgfXCKRx37+7mdxblN6Ne9sf6a8/1Rikb80oQGof5QJ+7sLXGIlyYyzXD
xdAq81pFbZwbo5AQzY1jleMeLHkW/AgZpB4A9f87T9/ech9TrO/IqFfOeKzT4+E0
xH80DkEwAQiIK4cbydzpBo/3cMVuEftkTENK76TXhy7drScKOO0PcICp/STQxrJP
JW3zKPZ0+Ynsk9WRZQjVtf7IZBgTqI3a1GgpPGimR5LYEWSp5HTC/i4QaXmNl5lS
eGsvZ8TjtQwySO26wdZEflhaPYajKWlQHB5aVBkHX+qd18qi7q1WCK9m5PRZpmKb
CM4ABzQ1+jiksc9tQnUYUO1NsxsmqJ6mnHvv/OvRE/ktcblMEIc=
=MyeP
-----END PGP SIGNATURE-----

--=-snbIcVOZEnXEaPTN1qYy--



--===============2202998750942032603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2202998750942032603==--


