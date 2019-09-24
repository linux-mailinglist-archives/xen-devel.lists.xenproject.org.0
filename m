Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E442BD065
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 19:15:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCoM2-0002B0-3X; Tue, 24 Sep 2019 17:11:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OCa0=XT=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iCoM1-0002Av-8h
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 17:11:57 +0000
X-Inumbo-ID: 685fb22c-deee-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 685fb22c-deee-11e9-bf31-bc764e2007e4;
 Tue, 24 Sep 2019 17:11:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E210FAE6F;
 Tue, 24 Sep 2019 17:11:53 +0000 (UTC)
Message-ID: <c0e9663a68766e607c1f09b329de849a086b9b93.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Jan Beulich
 <jbeulich@suse.com>
Date: Tue, 24 Sep 2019 19:11:52 +0200
In-Reply-To: <6e7b8475-bd13-94fc-2715-1d8b4f510eb4@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-8-jgross@suse.com>
 <19409170-4a99-e336-dae3-b439db509111@suse.com>
 <6e7b8475-bd13-94fc-2715-1d8b4f510eb4@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 07/47] xen/sched: move per cpu scheduler
 private data into struct sched_resource
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
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============4909103684933582483=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4909103684933582483==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-YEQzm16YIPgIVbQQytmi"


--=-YEQzm16YIPgIVbQQytmi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-09-24 at 13:41 +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 19.09.19 17:27, Jan Beulich wrote:
> > On 14.09.2019 10:52, Juergen Gross wrote:
> > > =20
> > > -DECLARE_PER_CPU(struct schedule_data, schedule_data);
> > > +#define curr_on_cpu(c)    (get_sched_res(c)->curr)
> >=20
> > By moving this a few lines down if could become an inline function
> > as it seems, if (see above) its use as an lvalue is not intended.
>=20
> I like that idea. Will change to inline function.
>=20
Yes, definitely better. With this (turning to inline func) done:

Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-YEQzm16YIPgIVbQQytmi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2KTlgACgkQFkJ4iaW4
c+78sBAAtMoVgcwJa8FoTd71N1j0rhe0jTn4uiqto2WcTY1fdzsdvtFwTagPKrY1
xkFpPv74UrFsByz1MwQUCPP2tl/mRKG5UJEPL4GVV1FU8juqpxh5IPQJ4WK2p0j6
mqJc8ysSF2829iCm/dDUGaY3y2pepBbkN0VE6dk82OrJjxxUEDyFwXTzCtJdXpzo
+LEDnNyMWoTl5Y/73Et+b4XAbLiRvtH9dYe03iBefUGMDIElFZAiMqyGwErZ6iSR
GiB/vKbFwmXeCN+5dO1TF3vMSkmaYwTsVrKic1wQz7FzKdnl82XAVHVevnPxphPS
2m2hL5u9cIXZsG/AFvqg3SSeILmWW30nOKEQKaP2DKFNfFto62+OZMn27I8DV7Dv
PmGpeiHhLhsIwZXJwIuoSTKUnNSy02UfqrgimMDjz6jKecmJ2YfB1NJrUcOhwMPT
cRxVJVQw9zgcV70W+JMsCUj2F0n4UzffS/UGNwJR6WGKwDtc7Oa37YL9y4i8wJpn
SSs9kx8bY26tE3Nyvlrf6yW8TNrqkeHUPBx79nHhNhAtfIpHN8M6WRxfbd2CBQG3
05j9iNvM00AzGgerccL4et/U2gZXLORp656PeTQ5HKtnssf3Pr8q1sihOARay9wI
B1CNDhWmGzzahk10zyY3KxVYdOco1QHN/9nhyUJqmQqgI+2fvsA=
=Q/vn
-----END PGP SIGNATURE-----

--=-YEQzm16YIPgIVbQQytmi--



--===============4909103684933582483==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4909103684933582483==--


