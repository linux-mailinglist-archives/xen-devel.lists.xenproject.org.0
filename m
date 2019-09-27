Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D2AC026B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 11:35:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDmbm-0001Oi-DE; Fri, 27 Sep 2019 09:32:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=drc8=XW=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDmbl-0001Od-24
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 09:32:13 +0000
X-Inumbo-ID: aed38a18-e109-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id aed38a18-e109-11e9-97fb-bc764e2007e4;
 Fri, 27 Sep 2019 09:32:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CDE5BB01C;
 Fri, 27 Sep 2019 09:32:10 +0000 (UTC)
Message-ID: <d5dbedb2c62b2bec4cfd67c2a447a66fa3c7a279.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 11:32:09 +0200
In-Reply-To: <20190927070050.12405-25-jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
 <20190927070050.12405-25-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 24/46] xen: switch from for_each_vcpu()
 to for_each_sched_unit()
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/mixed; boundary="===============6451243794992394131=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6451243794992394131==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-1l9frIez50b8EUG8EpcE"


--=-1l9frIez50b8EUG8EpcE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-09-27 at 09:00 +0200, Juergen Gross wrote:
> Where appropriate switch from for_each_vcpu() to
> for_each_sched_unit()
> in order to prepare core scheduling.
>=20
> As it is beneficial once here and for sure in future add a
> unit_scheduler() helper and let vcpu_scheduler() use it.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

One thing I spotted is that, here...

> --- a/xen/common/schedule.c
> +++ b/xen/common/schedule.c
> @@ -157,26 +157,32 @@ static inline struct scheduler
> *dom_scheduler(const struct domain *d)
>      return &ops;
>  }
> =20
> -static inline struct scheduler *vcpu_scheduler(const struct vcpu *v)
> +static inline struct scheduler *unit_scheduler(const struct
> sched_unit *unit)
>  {
> -    struct domain *d =3D v->domain;
> +    struct domain *d =3D unit->domain;
> =20
>      if ( likely(d->cpupool !=3D NULL) )
>          return d->cpupool->sched;
> =20
>      /*
> -     * If d->cpupool is NULL, this is a vCPU of the idle domain. And
> this
> +     * If d->cpupool is NULL, this is a unit of the idle domain. And
> this
>       * case is special because the idle domain does not really
> belong to
>       * a cpupool and, hence, doesn't really have a scheduler). In
> fact, its
> -     * vCPUs (may) run on pCPUs which are in different pools, with
> different
> +     * units (may) run on pCPUs which are in different pools, with
> different
>       * schedulers.
>       *
>       * What we want, in this case, is the scheduler of the pCPU
> where this
> -     * particular idle vCPU is running. And, since v->processor
> never changes
> -     * for idle vCPUs, it is safe to use it, with no locks, to
> figure that out.
> +     * particular idle unit is running. And, since unit->res never
> changes
> +     * for idle units, it is safe to use it, with no locks, to
> figure that out.
>       */
> +
>      ASSERT(is_idle_domain(d));
> -    return per_cpu(scheduler, v->processor);
> +    return per_cpu(scheduler, unit->res->master_cpu);
>
... I think we have an helper for `unit->res->master_cpu`
(sched_unit_master())?

But I don't think the patch/series is worth a respin for this. Maybe,
add it to the cleanup series?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-1l9frIez50b8EUG8EpcE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2N1xkACgkQFkJ4iaW4
c+4Wmg//URuT7GkPuBQxcHVqYvDdCWP1S82b43c8qitK5DxPxf9qQ9M1EQaiv6gT
FawoCNCv0PwnOT7kntMZ55ryp1hIUOybf3YQgvxtHp3hp8xh8gal6jlAwFji2LvE
JbZ9B4hq37Q9q4OgG4uVL6LxtAtsluGGG58uvyLoMx0p0EydoWon/LNqRFZhdpCM
DxNAMuArm+ofEReJCMMNgApkqLwzV9eeEwX15TdVyxjSt2q2ywyoaN/EGxMzMRRi
wCTzaoJMV6YYr83jubaRrd3OZqjkIzfamXymPmDI5Hp6q0erFIe0RHyfiXtaqU86
6an54hIYmtd/n3Gx80rVcarTlRgaealuAjpqLDlhIEHClQT//ByvGJviuICiwix4
9nKrVspk/b3Adl9YOj3wvPre0RMUZkqCWTBzPhlrVi9RjFKjGBPraaaJOBgedYP0
49LMxjRypwEgmVQC8Qj7429EX8HinDwvlYzlyBCUdnlQthIe9jicnXfGPVQJ3hkU
65NpP8AnXkZ1EY2gIEX4gr3kLhu32PnVDqwWrwgh3o1Y5bUWVFNbep4c0oTitijG
im6kNOV2bhgt4qwNdGrH6AcYgqL4xWuPNi2mqf9IxKb5dh7QbCQ5A34bVKtYo00l
ud8/Z1ROq0cxqo8qWhi8j20U7SemzeoybOPQEGgDDM0TpM5hmLM=
=aYRu
-----END PGP SIGNATURE-----

--=-1l9frIez50b8EUG8EpcE--



--===============6451243794992394131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6451243794992394131==--


