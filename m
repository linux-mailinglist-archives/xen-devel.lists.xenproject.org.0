Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6756EA56
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 19:47:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoWwB-0001DZ-BU; Fri, 19 Jul 2019 17:44:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7nr=VQ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hoWwA-0001DU-PE
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 17:44:54 +0000
X-Inumbo-ID: e9618534-aa4c-11e9-b3b3-ffc32c053358
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9618534-aa4c-11e9-b3b3-ffc32c053358;
 Fri, 19 Jul 2019 17:44:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7E382AF19;
 Fri, 19 Jul 2019 17:44:51 +0000 (UTC)
Message-ID: <faf676d237290b6de194b8daccb5f5fbaf8d2476.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
In-Reply-To: <20190528103313.1343-9-jgross@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-9-jgross@suse.com>
Organization: SUSE
MIME-Version: 1.0
Date: Fri, 19 Jul 2019 19:43:03 +0200
User-Agent: Evolution 3.32.3 
Subject: Re: [Xen-devel] [PATCH 08/60] xen/sched: introduce struct
 sched_resource
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============6357939591077237146=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6357939591077237146==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-30nU+LWPMQT18QlezMG2"


--=-30nU+LWPMQT18QlezMG2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-05-28 at 12:32 +0200, Juergen Gross wrote:
> Add a scheduling abstraction layer between physical processors and
> the
> schedulers by introducing a struct sched_resource. Each scheduler
> unit
> running is active on such a scheduler resource. For the time being
> there is one struct sched_resource per cpu, but in future there might
> be one for each core or socket only.
>=20
I only have two questions:

> @@ -1618,6 +1623,13 @@ static int cpu_schedule_up(unsigned int cpu)
>  {
>      struct schedule_data *sd =3D &per_cpu(schedule_data, cpu);
>      void *sched_priv;
> +    struct sched_resource *res;
> +
> +    res =3D xzalloc(struct sched_resource);
> +    if ( res =3D=3D NULL )
> +        return -ENOMEM;
> +    res->processor =3D cpu;
> +    set_sched_res(cpu, res);
> =20
>      per_cpu(scheduler, cpu) =3D &ops;
>      spin_lock_init(&sd->_lock);
> @@ -1682,6 +1694,9 @@ static void cpu_schedule_down(unsigned int cpu)
>      sd->sched_priv =3D NULL;
> =20
>      kill_timer(&sd->s_timer);
> +
> +    set_sched_res(cpu, NULL);
> +    xfree(sd);
>  }
>=20
What's that xfree(sd) about?
=20

> @@ -334,7 +349,10 @@ static inline void sched_migrate(const struct
> scheduler *s,
>      if ( s->migrate )
>          s->migrate(s, unit, cpu);
>      else
> +    {
>          unit->vcpu->processor =3D cpu;
> +        unit->res =3D per_cpu(sched_res, cpu);
> +    }
>
  unit->res =3D get_sched_res(cpu)

?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-30nU+LWPMQT18QlezMG2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0yASQACgkQFkJ4iaW4
c+4vkhAAnr1z2kocUCgoi3ONxyEJqn34ieqoY6J8gJscsS+/qXKtlf3cGY0/gaZd
luxXvbxXMeYBRIROO8GW1A4iyhx0HHUF1DZt0L0qtWoaaV5emCbfcAshxJpLQXj9
T5EWIDuf9VZNzNi4ZzZs/MOB+/5uJb7+55BPxK6UaPVzr+nQ2M8CJpAKCxSjMVxu
tjs147r0+3LnPyQW6ia2qHd518KsR4cq7Y680keN6omkgee+tO6yuaQdObHC+mCo
ClNPhoiVtnygaGH6JWTDEk6WkiV0BD81c1xkoiMojpexjstj9Tnina/8JamDoIdo
IuKiZA3ZxDlhME3YajNI6wiXIQdu5oDP4UakbDXUfteDbroSjT21OwB+L1MZFT/L
495yiamDOoEgTwe2tpJQlMrvASYf7Z974MRrO/sFH6NjpOBv8G3RuR8lv32mubsy
8adn9ZQJt1iCRDql9pkg7iKFYfnOcr09AEGW+tiE8OGlfPt4/c15OCPZr2bKamn/
ru6GzzR/ehsBPT7h0vIKogjv5bniB2r1IR1CbFHauDqRNui4FF1iskTCGzj3J6Ey
BJ5AfzruVD4LUrGAXvdUK0Bkk3yj3xFeW8RvexbjkInmgtDr56i0VBY1IQdcxmsw
cCJHXDMK2XsxBUvjyYfKMucY6bAFCKkO0Q3tnmjaHvqHw2a1Sr8=
=kodg
-----END PGP SIGNATURE-----

--=-30nU+LWPMQT18QlezMG2--



--===============6357939591077237146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6357939591077237146==--


