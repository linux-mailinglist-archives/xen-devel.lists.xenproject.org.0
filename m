Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9170BE2A8
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 18:40:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDAIb-0000kY-Ft; Wed, 25 Sep 2019 16:37:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zvtg=XU=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDAIZ-0000kQ-UY
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 16:37:51 +0000
X-Inumbo-ID: d06b22ec-dfb2-11e9-9638-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id d06b22ec-dfb2-11e9-9638-12813bfff9fa;
 Wed, 25 Sep 2019 16:37:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2A281AB87;
 Wed, 25 Sep 2019 16:37:50 +0000 (UTC)
Message-ID: <569f998ccb9a3c1c184c4f2c8244401ad730fb33.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, 
 xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2019 18:37:49 +0200
In-Reply-To: <2def1338-8048-58b3-9c5d-a0baf6f3dcb8@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-27-jgross@suse.com>
 <71a73c6c9224bcaaf1b47a3f0cd0c5a304334300.camel@suse.com>
 <2def1338-8048-58b3-9c5d-a0baf6f3dcb8@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 26/47] xen/sched: Change vcpu_migrate_*()
 to operate on schedule unit
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
Content-Type: multipart/mixed; boundary="===============0299586794767450346=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0299586794767450346==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ClY9uf9UwUFB0utUYj+z"


--=-ClY9uf9UwUFB0utUYj+z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-09-25 at 14:04 +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 25.09.19 00:33, Dario Faggioli wrote:
> >=20
> > > As it is needed anyway call vcpu_sync_execstate() for each
> > > vcpu of the unit when changing processors.
> > >=20
> > Again, what do you mean with "As it is needed anyway"?
>=20
> When moving from one cpu to another one the state must be saved in
> struct vcpu (in contrast to being held partially in registers or on
> the
> stack in case only the idle vcpu was scheduled afterwards on the old
> cpu).=20
>
Sure.

> This is done by vcpu_sync_execstate(). Without the explicit call
> it would be done either when the vcpu is being scheduled on the new
> cpu
> or if another non-idle vcpu is becoming active on the old cpu.
>=20
Right. And does this then means that we're now doing it twice (i.e.,
here and either of the other places you mentioned)?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-ClY9uf9UwUFB0utUYj+z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2Ll90ACgkQFkJ4iaW4
c+5xyRAAkPaMCo0uiRtm3UV1aV2mphygDD1oqrAbWYg70HBlwW7iOA2y4pWQankf
nSVugNvDARj8ZNccepRk/PlOfE4FylBj8js9fV131+QrjMY/EU33NMtukbJ8x2NF
u6uprDstZPrgjZXVeLmhUgT9Vp675uu9HS7hb8rPUVvxnnZmlMAGtwe/Ht/qFXit
Deo/z4PzZnqnRFJ2l/LkoIhgBDJayy1CrfjEcrXAEJyjGTqppuBXknmL/1jONcQu
PvWSuVyGfpv3nPWFVWQ0U2FAqefbo+GkfRA2sFs6RZ10O5kQkhMjUs3cI8s0YxiD
hltgSASicUogvK/mCILw76T1/ryYIWzvIvxUDhz/PevFRJLnUMq7nL/FOcRCkT8K
35SOJi7i0Cmk954C4kyKpqXuYlg849QG0094r0H/LjD4eye/PrjKsH5nWTSlv0A3
PY6mB3l7nmX4m3t7sGyN+/KEjXFi6H/gA+8lFDQhJ6DwlyekizeU5G0t/GCUhvTc
nn8olwGkZQ1MiWXROnrASna1chSNjNo+mhHvUABfA7A6Awfcbpl03lgsLwynMRY1
h6EknnbToywyjYf6ly7eauAco/uspm/XkpwGs98w4QPm0pymiMvlf+gKCzF+azcP
lDwdBBBVA+TKMTAtbxKtxrOvMUhVkDrM24AfcbOpgALwjzNkwGo=
=xJO4
-----END PGP SIGNATURE-----

--=-ClY9uf9UwUFB0utUYj+z--



--===============0299586794767450346==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0299586794767450346==--


