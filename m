Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40751BDC96
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 13:02:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD508-0004NO-FV; Wed, 25 Sep 2019 10:58:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zvtg=XU=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iD506-0004NJ-E1
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 10:58:26 +0000
X-Inumbo-ID: 6579e9e8-df83-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 6579e9e8-df83-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 10:58:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 55E68AD1A;
 Wed, 25 Sep 2019 10:58:24 +0000 (UTC)
Message-ID: <3680e42053297d29e9642d3e7bced8803089dd00.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2019 12:58:22 +0200
In-Reply-To: <20190925070503.13850-3-jgross@suse.com>
References: <20190925070503.13850-1-jgross@suse.com>
 <20190925070503.13850-3-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/2] xen/sched: fix freeing per-vcpu data in
 sched_move_domain()
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
Content-Type: multipart/mixed; boundary="===============2866579588630888825=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2866579588630888825==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-WLcyr4aVXk+r7jwD0ShT"


--=-WLcyr4aVXk+r7jwD0ShT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-09-25 at 09:05 +0200, Juergen Gross wrote:
> In case of an allocation error of per-vcpu data in
> sched_move_domain()
> the already allocated data is freed just using xfree(). This is wrong
> as some schedulers need to do additional operations (e.g. the
> arinc653
> scheduler needs to remove the vcpu-data from a list).
>=20
> So instead xfree() make use of the sched_free_vdata() hook.
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


--=-WLcyr4aVXk+r7jwD0ShT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2LSE4ACgkQFkJ4iaW4
c+7iqxAAuPxcEo9/weqAI1tgYsXQxT23EDvjWHPt9u3J7l0r0B9PNSlu04wJj5Yk
fPnvMF6rrugpQWehkhESXKGgWMNRC9JU2QWqIqqMHSHkMT299s4SGQ7C3UWiK54b
JyJGuvnS5VNeuPjaNKUKR3jXUKwf7o3M0tyyQzDBkeO3Wl1VYL7OB+c83fCYXhZX
tSWKwF0onQ+9yHUm3jb2ktFOfakWHoLXcooGnrHXzNQwUqGf35HxkjjNKYJbJ7cN
x1HFlJ82OQfLClvFnOp0QQhX0sUQBxvhYUHnzamSjVdAbtKx06nKjvw8ru5r0+nF
2oIUjMZR+OvShqgrJObXgRkev58NOgC7V+Y/fGKkfANkPX3lKv8Mtb+c6nSy0Lo1
n+hCPx4Tf2Xe1MUiFBe5faPf21pNrjNbt+M+DGcaGFyae1QFfERRn5iRHY09D2gn
0sIERSyJ2A3VNGaIGsgu2LOagoHNHaXLu16EkLWYsC9QVhzDQO44wl+2ZbQSBArS
R9ni2OsrQUo6zrMv7h+cvY+Wegthr07lk4Bu8rDmhssS3FNKOaAuhOpuerm4brh0
CTJ1W/mdgOiZandijp56dDzKbSXgyVJw+ql5lalP5ANG8fkUITa7BuIFsYYc3YIH
RRxsWf/OE0q7oolQfL2RQfydro6KjXFoohSpZK4gW6SHiATnDfU=
=1J4s
-----END PGP SIGNATURE-----

--=-WLcyr4aVXk+r7jwD0ShT--



--===============2866579588630888825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2866579588630888825==--


