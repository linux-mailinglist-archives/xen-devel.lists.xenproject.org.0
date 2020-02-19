Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC37A16448D
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 13:44:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4Oex-00026e-3l; Wed, 19 Feb 2020 12:40:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NMhh=4H=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1j4Oev-00026Z-St
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 12:40:57 +0000
X-Inumbo-ID: 1329c752-5315-11ea-bc8e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1329c752-5315-11ea-bc8e-bc764e2007e4;
 Wed, 19 Feb 2020 12:40:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 69B78C0E6;
 Wed, 19 Feb 2020 12:40:56 +0000 (UTC)
Message-ID: <694b0aab633ae6eeef9f3aaa3e27facbfbd2b779.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 19 Feb 2020 13:40:54 +0100
In-Reply-To: <20200213125449.14226-4-jgross@suse.com>
References: <20200213125449.14226-1-jgross@suse.com>
 <20200213125449.14226-4-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 3/8] xen/sched: don't use irqsave locks in
 dumping functions
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Meng Xu <mengxu@cis.upenn.edu>
Content-Type: multipart/mixed; boundary="===============0934646744313821089=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0934646744313821089==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Rv9u+BbGO9Fq4cvcjDk1"


--=-Rv9u+BbGO9Fq4cvcjDk1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-02-13 at 13:54 +0100, Juergen Gross wrote:
> All dumping functions invoked by the "runq" keyhandler are called
> with
> disabled interrupts, so there is no need to use the irqsave variants
> of any locks in those functions.
>=20
>=20
To me, this patch looks pretty independent from the series. I.e.,
whatever it is that we will do with locking for keyhandlers, it's ok
(actually, it's better!) to just use spin_lock() in scheduler specific
code.

So:

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


--=-Rv9u+BbGO9Fq4cvcjDk1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5NLNcACgkQFkJ4iaW4
c+4qbg/8DGrgb3IGn6sU/WJbBBEmhuJ+VXVMX1I95uLEUEPU53wtnP36EV3UIBIg
6CCncXilG3uquIXHuj/wCZPUbipdxQIeN0gvG9/ZlS92mQlIkExw0lIJNmCD0WTF
eOMN82TYDhAvckHP+0rfPIOOCdjJ+EerQWQ86g9qxkDeG3sEAEIBWEVqFyvQLeuz
ajQoS9nwDfMmCKcKTlRFX71RYSWMlHubJsTedmBeAiqhgTJkPV2Uwr04KDfF2OhI
Oeb70/ckY5t7RkQMEq1FF/4xU2AoBhu4NaSK4WRKqXWwdEDkKpL4QXB0QwaCINOi
sKvt8zsUtLHb5E0/Kav8m/fmwZDR+TzDE5bJZ3+YbMnirbxuu1+akV2sO/DcwtJQ
5yamVsfE4IF1Xx/uwmfMyQf1xMeyFE5QpAfpOKeQYlcG9KFeOVFTp4Ba25yQxo+g
X3KRhUMRe6ZWj6ftad87BgjRsHfxedzHS30KxFv1hljPNP5BkgmuACm1T6mv56Ya
jGDqAZ3dRBXPtcZQ93iczLtrgGbOpJGCyS8xe/5tJ1P3j92TFTJlYc8PVoC/Gxll
KSoICIOFlA4UF2ddipIreCjCCoaPbAbxDt0yUYQzaFeQB0hPif9ntCgs1r3XZ7IF
OYH6rO+sZgB53jHQPV5Yv+lo+zuKa+RXvAoASXnuyc039g/RCDY=
=KEr4
-----END PGP SIGNATURE-----

--=-Rv9u+BbGO9Fq4cvcjDk1--



--===============0934646744313821089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0934646744313821089==--


