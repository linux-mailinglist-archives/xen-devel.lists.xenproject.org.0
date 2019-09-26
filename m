Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7CABEFAA
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 12:33:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDR2p-0000G3-HO; Thu, 26 Sep 2019 10:30:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cPk2=XV=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDR2n-0000Fy-Vv
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 10:30:42 +0000
X-Inumbo-ID: af678554-e048-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id af678554-e048-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 10:30:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0A06FB06B;
 Thu, 26 Sep 2019 10:30:39 +0000 (UTC)
Message-ID: <a385ece8a7123014755ec94f005786989dcf9640.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Thu, 26 Sep 2019 12:30:36 +0200
In-Reply-To: <20190914085251.18816-28-jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-28-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 27/47] xen/sched: move struct task_slice
 into struct sched_unit
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
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============1892751744166103329=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1892751744166103329==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-8BMGXZZnpETnRaOlzV+f"


--=-8BMGXZZnpETnRaOlzV+f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-09-14 at 10:52 +0200, Juergen Gross wrote:
> In order to prepare for multiple vcpus per schedule unit move struct
> task_slice in schedule() from the local stack into struct sched_unit
> of the currently running unit. To make access easier for the single
> schedulers add the pointer of the currently running unit as a
> parameter
> of do_schedule().
>=20
> While at it switch the tasklet_work_scheduled parameter of
> do_schedule() from bool_t to bool.
>=20
> As struct task_slice is only ever modified with the local schedule
> lock held it is safe to directly set the different units in struct
> sched_unit instead of using an on-stack copy for returning the data.
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


--=-8BMGXZZnpETnRaOlzV+f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2Mk00ACgkQFkJ4iaW4
c+7llRAA6y+cy6Tpg42QCighDoTcXuFMnxKROZkeidVOCvc1Ppg8jDQJ5H7D53Qv
4ZUdjedgAL/IAOTwUDphS80ELlOGZbYDLA2uWx05BLSzEeEluFnNR5mYedJKUJiF
Svy4sliBO9PiXGaGIoQIPvMZrPFU1W8vXAhM6xgKyIgQA9vyddF77r4r+JU3m4Ez
RFvwNzDoB8WiT6eYJWf4IUq0Hny4MrLWGiXNmVQgY/XersVkVK1uBWMbZegsPhO/
Hq4Wjc2zU+XDT7YXZKooiyIINq4yrjmZZCUOdIVAY4pqjfUOSGZyOxppL9sfCyUS
1e3EY6eaRSwmOTKaqA84did5Nfwn7RiOuHfb7iaiHBZju31m2WHRph9MKZHdYS1f
P70Z1bNvP4qpU4NO5lEQuBYDeDDah9hAWl11c2ixwKta/Gg+u+3AdBwG0qH/szJq
2AdrRE2P5KAwxiwNjsvJ+0S/pvHz2wfDPiWZ4bjTSKsn86U3+fRW2ettrOTnSKLC
kK7FHMhbOamRO29Og1a9yUIlqgG1TosNY6h9Ok/iHLvoAHLM9eAfN+YHyyu194+e
22ztrWiOpqyn3Ly0pHgS1JcFOfCTtunYdl9Hp1KzLN52Df2p4FQuk2BiDj7Pc8cm
Pmn27IPLFHxfP1JaniappEJAd+pQj2gunuK+m8GNQhsU2pHZue0=
=YEh0
-----END PGP SIGNATURE-----

--=-8BMGXZZnpETnRaOlzV+f--



--===============1892751744166103329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1892751744166103329==--


