Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CEE176064
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 17:51:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8oFe-0000X6-JJ; Mon, 02 Mar 2020 16:49:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L2M6=4T=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1j8oFc-0000X1-Vd
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 16:49:05 +0000
X-Inumbo-ID: b942c71c-5ca5-11ea-8616-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b942c71c-5ca5-11ea-8616-bc764e2007e4;
 Mon, 02 Mar 2020 16:49:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C6A82AD86;
 Mon,  2 Mar 2020 16:49:02 +0000 (UTC)
Message-ID: <96b8db2cab78470bd7cab97b6bbca3049999dfd3.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Date: Mon, 02 Mar 2020 17:49:01 +0100
In-Reply-To: <9b3423b9-6cf1-1cc3-5011-f383979f12aa@suse.com>
References: <9b3423b9-6cf1-1cc3-5011-f383979f12aa@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] credit2: avoid NULL deref in
 csched2_res_pick() when tracing
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
Cc: Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>
Content-Type: multipart/mixed; boundary="===============4521992699468882626=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4521992699468882626==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-lPg6cK9v0YGeqGuR7C9r"


--=-lPg6cK9v0YGeqGuR7C9r
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-03-02 at 09:58 +0100, Jan Beulich wrote:
> The issue here results from one of the downsides of using goto: The
> early "goto out" and "goto out_up" in the function very clearly
> bypass
> any possible initialization of min_rqd, yet the tracing code at the
> end
> of the function consumes the value. There's even a comment regarding
> the
> trace record not being accurate in this case.
>=20
> CID: 1460432
> Fixes: 9c84bc004653 ("sched: rework credit2 run-queue allocation")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
Acked-by: Dario Faggioli <dfaggioli@suse.com>

> ---
> It took me a little to convince myself that
>=20
>     new_cpu =3D cpumask_cycle(min_rqd->pick_bias,
> cpumask_scratch_cpu(cpu));
>     min_rqd->pick_bias =3D new_cpu;
>=20
> are safe, i.e. min_rqd can't be NULL here. I think though that this
> could do with making more obvious, at the very least by e.g.
>=20
>    @@ -2360,6 +2360,8 @@
>                         unit->cpu_soft_affinity);
>             cpumask_and(cpumask_scratch_cpu(cpu),
> cpumask_scratch_cpu(cpu),
>                         &min_s_rqd->active);
>    +
>    +        BUG_ON(!min_rqd);
>         }
>         else if ( min_rqd )
>         {
>=20
> possibly accompanied by a comment. Thoughts?
>=20
Yes, I think this is a good idea.

Personally, I'd put the BUG_ON() outside of the "if {} else if {} else
{}" block (i.e., just above the cpumask_cycle().

I can send a patch for that.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-lPg6cK9v0YGeqGuR7C9r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5dOP0ACgkQFkJ4iaW4
c+5Diw//YUqb+i/I9lyuUVXJ/TSFY8IXA4EJZevlu36M1gjbd6M1NRbwIRAMwH1A
Jy8Ga6riRMv6zb/OmGAgWJ6YkMzHI5gqdKaoF3cUcoePGt2tLRMccP1WpSuB+TxB
LvYZ+NsrIiHmGcWty9kUrCUvyXLGLMIflazI3IuhdXhGb8JwH3VQ/3P86eZpuQN5
ZveOINp7OlcZQK0enqKMdZby6smu7NBXG2alt7No/sK8N1Cf30/X8vPXi2gnKOtw
b+zBjgAzhXXh0qc4jLQFUlpHDSTW0Xt8RieoVOnuHgrQ/rkYz6cxnoN+UpOD6NMp
lVLqLXxaDXiDL6eFyFAZ+HEJeh3tQSYuAR8JFV92gyUoyqOdkaSLYXRSJU+o0vM/
dByCQXNA+E5HKNQ7rlweb7b5k+NipZqHVa70ro6TMo4KD+Olie1DHvw4BZb5aKr+
qQyybgTeALWMMHjVb7u7yKWFR8oQD498cXHkpGtI1x3dY5FeDoZgfesBk0L4OTCT
3+0g7hLA8hq/HCENaqugj21+l6wOew3Pq+eqWpxcqENPz4ZVS8SiGWaaY0u96eD2
jaA58Py+7m7JHXEQgHBqP3wDwNtukgLfi7RlT2Vp6TORlNAR763UZdDUNk7I5lRE
YKaMti6oNFr9AzgGTHoLf2lsbD+LLTh49OlNF4/dT/uHx15acd4=
=mH88
-----END PGP SIGNATURE-----

--=-lPg6cK9v0YGeqGuR7C9r--



--===============4521992699468882626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4521992699468882626==--


