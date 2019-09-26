Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 914EABF6A0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 18:25:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDWWf-0006jV-7w; Thu, 26 Sep 2019 16:21:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cPk2=XV=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDWWd-0006jL-Hb
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 16:21:51 +0000
X-Inumbo-ID: b24f0ae0-e079-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id b24f0ae0-e079-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 16:21:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5AAA8AFE8;
 Thu, 26 Sep 2019 16:21:29 +0000 (UTC)
Message-ID: <8af491d8795a4327c1fc7e464ddca886529a502b.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, 
 xen-devel@lists.xenproject.org
Date: Thu, 26 Sep 2019 18:21:27 +0200
In-Reply-To: <bddb9939-9c68-304d-517e-95368d2fb675@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-48-jgross@suse.com>
 <f6cae9fa652707ec7548cd0929f9aa06fcd8affc.camel@suse.com>
 <bddb9939-9c68-304d-517e-95368d2fb675@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 47/47] xen/sched: add scheduling
 granularity enum
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============8588867809999097558=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8588867809999097558==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ZQah9PagcUMgTiy1KNpP"


--=-ZQah9PagcUMgTiy1KNpP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-09-26 at 14:37 +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 26.09.19 11:46, Dario Faggioli wrote:
> > On Sat, 2019-09-14 at 10:52 +0200, Juergen Gross wrote:
> > > Add a scheduling granularity enum ("cpu", "core", "socket") for
> > > specification of the scheduling granularity. Initially it is set
> > > to
> > > "cpu", this can be modified by the new boot parameter (x86 only)
> > > "sched-gran".
> > >=20
> > > According to the selected granularity sched_granularity is set
> > > after
> > > all cpus are online.
> > >=20
> > > A test is added for all sched resources holding the same number
> > > of
> > > cpus. Fall back to core- or cpu-scheduling in that case.
> > >=20
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > >=20
> > Reviewed-by: Dario Faggioli <dfaggioli@suse.com>
>=20
> Does this still stand with moving all code of this patch to
> cpupool.c? That would avoid making some variables/functions globally
> visible.
>
Yep, I saw this being discussed during review of other patches, but
forgot to mention it here, sorry.

Yes, I'm fine with that, and I'm fine with the consequences of doing
that on this patch (i.e., moving to cpupool.c).

The Reviewed-by still holds.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-ZQah9PagcUMgTiy1KNpP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2M5YcACgkQFkJ4iaW4
c+51jw/9HsTGWX6bv/juwL+RRqeg7FgcbSm9vY5Q67UyyZvx9hnAdwuv+qxRyLM9
XY9HhcWXfugnL84dqRgQ2csEHTAzHxumfkfonPBzQdUDVvKDQQ/1sovtidTloF83
pppCBeGkXfshXLaJktJqqdY33LzaeJNGhTBEr02bzmbFGcoHM7mDlEzyBb1d2eEK
/64d8WYcyOIw1ml/i0MpkRfJnVjqXZIdTx/nvGzCflwuRF4G5eBaTfQCem0GM+hG
ykdp8LJW0ivh+VCtP3V2utomIz9PztFRm2qTa8q7HgKer8JSCNrScxnVtpx8DIfw
pPwdwcXNoRjgwmHLFOLqE+awAPKAacNZzDxsU9B8Dgoyg2xBq5qVN99Rzfgj8aOD
GS6HjaGaHgu+mjrPUb0+KGCQTyb8oHZKLtbdklr79dRxqwJDuf6MVW//UrKI/3tc
dSYjqpk/e2jBLXhFyv36N+kr1CimDKYrvXf7YtZGwcr7RENqB5A+j3nMJX4fbN89
tghbuWc0hfqpDrnn4k51dQIzOsyi29Oi3CT0Fkn08FqwPmfXkF1chDR+2rmvQfi1
Eyo+BbvsR+PH2TVlDxGG87SivzR6PhIxicT46GwegSGMltBrSO+QrOYpJJ/gRnoC
r+YX0cbFmQly13sW/RoVv7tmDf+8FbWjjjAelOEVfp+4eEkhXpY=
=OTcy
-----END PGP SIGNATURE-----

--=-ZQah9PagcUMgTiy1KNpP--



--===============8588867809999097558==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8588867809999097558==--


