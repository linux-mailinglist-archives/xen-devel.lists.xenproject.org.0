Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E55621242FD
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 10:25:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihVXy-0005la-BA; Wed, 18 Dec 2019 09:23:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lBFt=2I=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1ihVXw-0005lT-S9
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 09:23:08 +0000
X-Inumbo-ID: fbd85f10-2177-11ea-a914-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fbd85f10-2177-11ea-a914-bc764e2007e4;
 Wed, 18 Dec 2019 09:23:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7D7F2AB71;
 Wed, 18 Dec 2019 09:22:59 +0000 (UTC)
Message-ID: <a27482ae6e7b32e24aaa0e0495e32c97bad32867.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 18 Dec 2019 10:22:58 +0100
In-Reply-To: <20191218074859.21665-9-jgross@suse.com>
References: <20191218074859.21665-1-jgross@suse.com>
 <20191218074859.21665-9-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 8/9] xen/sched: eliminate
 sched_tick_suspend() and sched_tick_resume()
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============3857690091920427196=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3857690091920427196==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-rl9ypR1ZNdkeDbf3Ioea"


--=-rl9ypR1ZNdkeDbf3Ioea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-12-18 at 08:48 +0100, Juergen Gross wrote:
> sched_tick_suspend() and sched_tick_resume() only call rcu related
> functions, so eliminate them and do the rcu_idle_timer*() calling in
> rcu_idle_[enter|exit]().
>=20
Yep, I remember us talking about this, and I'm really happy to see
these go away. :-)

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


--=-rl9ypR1ZNdkeDbf3Ioea
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl357/IACgkQFkJ4iaW4
c+4meBAAsFxCuoTyKnIix6IyF+kbGWM5TU5LIPqyg5h/m60hKTBM7dTLv935a83m
Lnv+YJTLYycFU2KvspGg677hiiD8ccJ7f8GD5mZu/hOsdI3T/4VvEhb/7kfzgPYO
yCoZjKfYPSZ6vphYuAFBjXk4b88SxYEeaxaznQBMYJ5+UacTrbqrYQ2utdSS54Qf
eKqKVjoPJPe2Wh4xpnVSRMEABJIWfu/iWx1SAsGjXwJAhWqc/8K1XCGL61iuaLHT
2IaZDcEoymIBfLUVzV553pE4l7tBCebhKBqaKVYm29TMbOqWgbNRZWzGx/vK3j3U
92WzFqY1H+5JnVIjLO/1Y4RAp5hxPpnLXUZGVdTdgibd42vi0U97HOIKKuRG8HHC
345bwPYdgwgpBTS9FpKewg9mMtNnraisqE0srrW1Q/26N2lq400CEFzKLT2sqOUG
BLi7t+pIzkAkjz+JRwlTBPHdzIzGHz+7mM9Pg1z3DQT0Uwz5Ym/eXF7iWKpD8CxQ
3fd3jsrpSg9xlO6m4c0DzMeMEUA5S/v590hO+9j5tGKrFoGoFYqPwc6RD9f1eJge
pfA9PCglNKqxyeH6b1ga/mZqhDGOjl3QeOFAkiG76kZNtY9zJ/sK9tG0ue2DN3Ik
ezZIw10AOacnaUDWZfQ8qRASTO059kVU6e8j5UF9HtUnrM8ojlA=
=fG7g
-----END PGP SIGNATURE-----

--=-rl9ypR1ZNdkeDbf3Ioea--



--===============3857690091920427196==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3857690091920427196==--


