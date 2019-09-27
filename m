Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA2FC08A8
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 17:33:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDsD7-0005DS-Lb; Fri, 27 Sep 2019 15:31:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=drc8=XW=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDsD5-0005DN-Op
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 15:31:07 +0000
X-Inumbo-ID: d2809d34-e13b-11e9-967e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id d2809d34-e13b-11e9-967e-12813bfff9fa;
 Fri, 27 Sep 2019 15:31:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A0C25AEF6;
 Fri, 27 Sep 2019 15:31:05 +0000 (UTC)
Message-ID: <3a734f15f48affdd93532dc196c1a28880593bbf.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 17:31:04 +0200
In-Reply-To: <20190927070050.12405-40-jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
 <20190927070050.12405-40-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 39/46] xen/sched: prepare per-cpupool
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
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============6545293498045913772=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6545293498045913772==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-GVtNikOaCu9zF897dNH0"


--=-GVtNikOaCu9zF897dNH0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-09-27 at 09:00 +0200, Juergen Gross wrote:
> On- and offlining cpus with core scheduling is rather complicated as
> the cpus are taken on- or offline one by one, but scheduling wants
> them
> rather to be handled per core.
>=20
> As the future plan is to be able to select scheduling granularity per
> cpupool prepare that by storing the granularity in struct cpupool and
> struct sched_resource (we need it there for free cpus which are not
> associated to any cpupool). Free cpus will always use granularity 1.
>=20
> Store the selected granularity option (cpu, core or socket) in the
> cpupool as well, as we will need it to select the appropriate cpu
> mask
> when populating the cpupool with cpus.
>=20
> This will make on- and offlining of cpus much easier and avoids
> writing code which would needed to be thrown away later.
>=20
> Move the granularity related variables to cpupool.c as they are now
> used form there only.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-GVtNikOaCu9zF897dNH0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2OKzgACgkQFkJ4iaW4
c+5yzg//RFmRV+MekLiIj3Z9caIuDjKSUnU1nXkfOhOR/oGvgG8Tqml5rGLQXhLS
RWoUnNbjxDQDxrC71YQGnZQ1mVNyG0Ad2RkGrpQmpqTgfe/JjTWXOhmc7qDDvTqM
cuMLi8IiUWCmzchiK9kkhrInkCXhtyBK6GJxUpy1P1rV8ziVIzN+TmJiBXkk93XG
MKa23Av5SgcDZ/8F6qOzp4Cy4Q4zkT5XwEKOA7gHnc+ykEy1pl14/JSdGPu6RGpq
0++cziB6AGdbf2JfMHhAA0rTTtaB2CZV0riKaJUW1FgiO0jEWt5MgcwtVzJowGBS
U9jL8O1zt15A3oogF5cxV6E8eo7oXcVOH3FZjJ0nYQ0oN8oRJAuA/Y4zEYyYn75l
JWdsE2l156gpoU0N2yUDDEuO1PouQLm1ssyEoRWaDjLm9z3InGsZrlGyyPISwz6A
14PAbyqeo5lhcRx1ErujarsO23f3iA40vFAl6jEXnrThJK8h/bhZIh2L3MGvaeLx
NZ0pKuML7dvnRwdZm6JIcXkBa4wkpGRQq2tkNmr6c8zXBO9tDzbecrWn7+QiMpiA
QwDMR5COAZTf2owJbShib9aI8W2qHBjx/lUqv7hKqyk5QBULJrnpi9NuMaDmtsGF
8e76xo+kDHkvfuDqK5YyuYNrFEKKRqILxIOTptBrIfP6QZtcPSY=
=N8Fy
-----END PGP SIGNATURE-----

--=-GVtNikOaCu9zF897dNH0--



--===============6545293498045913772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6545293498045913772==--


