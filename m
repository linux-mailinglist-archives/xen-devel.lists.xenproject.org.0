Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE7EC0192
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 10:55:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDlzr-0003wm-CP; Fri, 27 Sep 2019 08:53:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=drc8=XW=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDlzq-0003wh-HA
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 08:53:02 +0000
X-Inumbo-ID: 35c5dd60-e104-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 35c5dd60-e104-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 08:53:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7C323AE65;
 Fri, 27 Sep 2019 08:53:00 +0000 (UTC)
Message-ID: <e202c297e139a4082af81da1c25e88426a3fc76e.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 10:52:59 +0200
In-Reply-To: <20190927070050.12405-11-jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
 <20190927070050.12405-11-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 10/46] xen/sched: add scheduler helpers
 hiding vcpu
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
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============5871170874983976410=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5871170874983976410==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-wl+IWaGr0IF/uqvRVlYx"


--=-wl+IWaGr0IF/uqvRVlYx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-09-27 at 09:00 +0200, Juergen Gross wrote:
> Add the following helpers using a sched_unit as input instead of a
> vcpu:
>=20
> - is_idle_unit() similar to is_idle_vcpu()
> - is_unit_online() similar to is_vcpu_online() (returns true when any
>   of its vcpus is online)
> - unit_runnable() like vcpu_runnable() (returns true if any of its
>   vcpus is runnable)
> - sched_set_res() to set the current scheduling resource of a unit
> - sched_unit_cpu() to get the current processor of a unit (returns
>
    ^sched_unit_master() ?

>   the master_cpu of the scheduling resource of a unit)
> - sched_{set|clear}_pause_flags[_atomic]() to modify pause_flags of
> the
>   associated vcpu(s) (modifies the pause_flags of all vcpus of the
>   unit)
> - sched_idle_unit() to get the sched_unit pointer of the idle vcpu of
> a
>   specific physical cpu
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
With that fixed:

Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-wl+IWaGr0IF/uqvRVlYx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2NzesACgkQFkJ4iaW4
c+4fYBAAiIMU6fWjX5WDI+s5om3Pclm1wULmNRuBH+yxKancbCdZw+oaZd+IrcDM
aySVr1ZjTho8i0R1BVkc4o6Vrd0ATHkgAoxUVDbXIyj5oBxrl8oI+rUjoazxp08m
H6lZvdnc+kl3AaMjT+1lAvW7as7P0zzr6s392chKp+KegghRIvGG2WsHU5vcyujB
uE/9Ez0r0Ns8lYXGZaJSq/weMqwk1l68ha7kOaQdYdC1QGGXUmevK6hdZi2n2lbc
wLvknF6GvP0TilB04PrqAac3jKEsaU7rrzLmvXwIaKpmy4pOc2IFpWtgLOOJNrqZ
pdoNJpnmzE6tfBuwIRTXammpYHsO3Yj93FpDUKHdlw0W3232cVLxOUDh9+P+WDjP
axORXx17ZweCc5tT8JTVxjEFKszM2MGoDUzqWkmxoQD0fFLLaeoPX/QV/qwQFcPN
qF/A0BrCAlG3PfagIvIaOEIbD+5YlMym04BhAI3QTb4rBACimwmVDHuHs1s6P2RQ
o3uu0dmstPjJmbqu31gr3uUIXNgyS5R+WTsr+VjXfI04/YU5kW2Jlix75mJHiRaS
+aZahrFVB1wgxQAeYfRdcI4c3p8dnZFdn+xIwW7l4TGehRjC/94F0HtPpJd1bn1E
OIG0wOuUXh/1sN3cBA0c7ysi8jlfojCzKqvO0TvWYkG+QJVdaZ0=
=J9/W
-----END PGP SIGNATURE-----

--=-wl+IWaGr0IF/uqvRVlYx--



--===============5871170874983976410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5871170874983976410==--


