Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB78F14753F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 01:03:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iumPX-0005Jc-1r; Fri, 24 Jan 2020 00:01:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MUbo=3N=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iumPW-0005JW-4F
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 00:01:18 +0000
X-Inumbo-ID: 9f756678-3e3c-11ea-b833-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f756678-3e3c-11ea-b833-bc764e2007e4;
 Fri, 24 Jan 2020 00:01:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A81F0AF86;
 Fri, 24 Jan 2020 00:01:07 +0000 (UTC)
Message-ID: <53ba68698c171e99f0ce67af74bb9d7fc6e924d6.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 24 Jan 2020 01:01:06 +0100
In-Reply-To: <20200123090323.16272-1-jgross@suse.com>
References: <20200123090323.16272-1-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/sched: avoid cpumasks on stack in
 sched/core.c
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
Content-Type: multipart/mixed; boundary="===============2347924359778415211=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2347924359778415211==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-CJ+V7ixH5bc4oZQq/wq8"


--=-CJ+V7ixH5bc4oZQq/wq8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-01-23 at 10:03 +0100, Juergen Gross wrote:
> There are still several instances of cpumask_t on the stack in
> scheduling code. Avoid them as far as possible.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Just curious...

> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -2586,11 +2582,11 @@ static void schedule(void)
> =20
>      if ( gran > 1 )
>      {
> -        cpumask_t mask;
> +        cpumask_t *mask =3D cpumask_scratch_cpu(cpu);
> =20
>          prev->rendezvous_in_cnt =3D gran;
> -        cpumask_andnot(&mask, sr->cpus, cpumask_of(cpu));
> -        cpumask_raise_softirq(&mask, SCHED_SLAVE_SOFTIRQ);
> +        cpumask_andnot(mask, sr->cpus, cpumask_of(cpu));
> +        cpumask_raise_softirq(mask, SCHED_SLAVE_SOFTIRQ);
>
... why are we keeping the temporary variable (mask) ?

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-CJ+V7ixH5bc4oZQq/wq8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl4qM8IACgkQFkJ4iaW4
c+7fOw/+NEcI7OOMZNH/nE5G90rhvZsycRrmDfT33r7eiBMxH4iDjvxZ8AePLy1V
wDgSZtqKM0WRLMwYmJ+o6YNwOJvllkRO/l/KKz2TGfX+QSjBwinNk8CN3qlTqDzK
ec5NejYOLXauDTscAuEi1u6aGdREpMdkgk5r06arA23IFmi8fseyDmZVDJasoqdy
RZMWFTj5RThMZR9g4XwwKFom0pKpCmNOLNEm3CPWBxQMKhOcEZk/Jl6SW3wXJCgb
vKfGLAR+6JmjA3diQaabhVW6i/qaJCpncqgfVoKlU5ltUcbrTUWUsWYIIHMzN8xU
8Q+K7dYtrnCoXJBzVFR4K2eU1oTMc8GnuRR7569H1CkaFfspNARkUn50Fkecvf3B
xX6tHedbrgL8Ft0clRZTCQfGsQEVTUax63e4J4EpV8zZtXAKhWq+1wh1oZCXN1zi
zO+43DPl817+v8Fr/FyvRdpVz+nXjYGWWWJ6QxJGVt3qUD10CeXpAekuz0mlMry6
GfwYCL3po2d+hbMSTsIdYo7GdRSRTPntxMFbyQ/1OG+LTqk8CNvEod3egSHrmnJj
xjFW2136lbLSRv/J0d+prKTFXbKVwgymRB4QjM0KEndQZfJKJZ/MowE4YIbTyvYu
VT4SQXVmP7QwIiI+EfoaK+XuBT42lzsCsVEPtXqAqT+nfQ5bEyo=
=sGdz
-----END PGP SIGNATURE-----

--=-CJ+V7ixH5bc4oZQq/wq8--



--===============2347924359778415211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2347924359778415211==--


