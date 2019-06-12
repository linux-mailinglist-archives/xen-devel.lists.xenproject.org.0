Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E45BE422D9
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 12:44:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb0gy-0002xz-RF; Wed, 12 Jun 2019 10:41:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kiAS=UL=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hb0gx-0002xu-8I
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 10:41:19 +0000
X-Inumbo-ID: 99abed74-8cfe-11e9-9a44-ef97507ac55c
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99abed74-8cfe-11e9-9a44-ef97507ac55c;
 Wed, 12 Jun 2019 10:41:14 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Wed, 12 Jun 2019 12:41:13 +0200
Received: from [192.168.0.36] (nwb-a10-snat.microfocus.com [10.120.13.202])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Wed, 12 Jun 2019 11:41:01 +0100
Message-ID: <16945c82f54c6265f17d293d1bf580d3d0018dd9.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
Date: Wed, 12 Jun 2019 12:40:59 +0200
In-Reply-To: <1560332150-27712-1-git-send-email-andrii.anisov@gmail.com>
References: <1560332150-27712-1-git-send-email-andrii.anisov@gmail.com>
Organization: SUSE
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4] schedule: move credit scheduler specific
 member to its privates
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/mixed; boundary="===============5708165275177695916=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5708165275177695916==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-FIMOanSsD6+bfJbR42mT"


--=-FIMOanSsD6+bfJbR42mT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-06-12 at 12:35 +0300, Andrii Anisov wrote:
> From: Andrii Anisov <andrii_anisov@epam.com>
>=20
> The vcpu structure member last_run_time is used by credit scheduler
> only.
> In order to get better encapsulation, it is moved from a generic
> structure to the credit scheduler private vcpu definition. Also,
> rename
> the member to last_sched_time in order to reflect that it is the time
> when the vcpu went through the scheduling path.
>=20
> With this move we have slight changes in functionality:
>  - last_sched_time is not updated for an idle vcpu. But the idle vcpu
> is,
>    in fact, a per-pcpu stub and never migrates so last_sched_time is
>    meaningless for it.
>  - The value of last_sched_time is updated on every schedule, even if
> the
>    vcpu is not being changed. It is still ok, because last_sched_time
> is
>    only used for runnable vcpu migration decision, and we have it
> correct
>    at that moment. Scheduling parameters and statistics are tracked
> by
>    other entities.
>=20
> Reducing code and data usage when not running credit scheduler is
> another
> nice side effect.
>=20
> While here, also:
>   - turn last_sched_time into s_time_t, which is more appropriate.
>   - properly const-ify related argument of
> __csched_vcpu_is_cache_hot().
>=20
> Signed-off-by: Andrii Anisov <andrii_anisov@epam.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-FIMOanSsD6+bfJbR42mT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0A1rsACgkQFkJ4iaW4
c+6wmA//V3YcWPmr7PGDuBWRYL6NjIw91529bWP7HqyplMuivBR6EBg51o8++a2g
bh8BdNtN5v56GSxtV/RRxzww3VdHQVDrMs8m2j9js0NBLLjkWK0rezptyVUmLsGn
dWzk5xcbCwZrVrAQvpswwqFOzYmqCEBWbr2nPnZtl6cUBZgs+e6cISbNOXclKYsd
gL+D1Y5OR1U2cNLmMNujiLqNccIjLBIvQx7kBEDhzycnYM8bJw/Cn3uUEh+9VDpQ
1/9QcIldefdYVrdzivTtZmPorjjg0hWKRptXWZGn/od67OopQqWPz+Zwd5k24jR8
kyHJ54EMAGkWxnXhhMzgPXg7z5IC7YG57lHuU4HqiPUiPKcWKieEcnKomLQHbwkE
m5KK3kkLW8gEyTJ04F8rNLp3rLV4esTEioQVDHuhk7/nows/KfbWD/bsGmkCVRuz
u3SBGrwyu3PDGIJtVNPUD7DTSn6R5ZT6ilX4gWNLlxV/2OLt+12p0AVOEoaZhouR
oB9KZ3iiw/Fdc23NaFwxDVlJPQbQ0iGq95l6ctt+llXa0WsY6S45mbAfIpgzke7b
ogD4OY3VB3n/kPZ2tcBQfqbff9b41VL5sO6kCSSSm2FNTOxhPE18QYdYPOVvbPIR
op04KaR2+AKIVdGOlBJ0Ib6Z2Yj4S6kcyTxqg4XVs32YjBlp+Qg=
=N8QJ
-----END PGP SIGNATURE-----

--=-FIMOanSsD6+bfJbR42mT--



--===============5708165275177695916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5708165275177695916==--


