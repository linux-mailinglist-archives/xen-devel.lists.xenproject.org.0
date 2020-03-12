Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7781836C7
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 18:02:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCRBh-0006Yk-BQ; Thu, 12 Mar 2020 17:00:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yTGL=45=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jCRBf-0006W3-SC
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 16:59:59 +0000
X-Inumbo-ID: e7d85be8-6482-11ea-b1dc-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7d85be8-6482-11ea-b1dc-12813bfff9fa;
 Thu, 12 Mar 2020 16:59:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 32865AECA;
 Thu, 12 Mar 2020 16:59:58 +0000 (UTC)
Message-ID: <54fc0576bd7aa1ad213f5a07fef856c894e2d65f.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Jan Beulich
 <jbeulich@suse.com>
Date: Thu, 12 Mar 2020 17:59:56 +0100
In-Reply-To: <21abe34e-54f0-70e3-d2f1-cf6984b5773a@suse.com>
References: <158402056376.753.7091379488590272336.stgit@Palanthas>
 <158402065414.753.15785539969715690913.stgit@Palanthas>
 <2e53ee4c-e2d9-f892-c8c3-62bff0c526ab@suse.com>
 <21abe34e-54f0-70e3-d2f1-cf6984b5773a@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/2] xen: credit2: avoid vCPUs to ever reach
 lower credits than idle
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
Cc: Charles Arnold <carnold@suse.com>, Glen <glenbarney@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>, Tomas Mozes <hydrapolic@gmail.com>,
 Sarah Newman <srn@prgmr.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============0562615538336083528=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0562615538336083528==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-u6qEquGuV79ALqmyEBrM"


--=-u6qEquGuV79ALqmyEBrM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-03-12 at 17:00 +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 12.03.20 16:26, Jan Beulich wrote:
> > On 12.03.2020 14:44, Dario Faggioli wrote:
> > > --- a/xen/common/sched/credit2.c
> > > +++ b/xen/common/sched/credit2.c
> > > @@ -234,7 +234,7 @@
> > >    * units does not consume credits, and it must be lower than
> > > whatever
> > >    * amount of credit 'regular' unit would end up with.
> > >    */
> > > -#define CSCHED2_IDLE_CREDIT          (-(1U<<30))
> > > +#define CSCHED2_IDLE_CREDIT          INT_MIN
> >=20
> > The title saying "lower than", is "equal" actually fine? Looking
> > at e.g. runq_insert() I'm getting the impression it's not.
> >=20
> > Looking at t2c_update() I'm also getting the impression that
> > there's UB when the subtraction underflows. After all, if
> > -1 << 30 wasn't small enough a value, I don't see why -1 << 31
> > would be.
>=20
> Yes, I'd limit svc->credit in t2c_update() to CSCHED2_IDLE_CREDIT+1
>=20
Right, after having spoken with George as well, I guess I'll go for
something like that (by imposing some boundaries to `val`, in that
function, I think).

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-u6qEquGuV79ALqmyEBrM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5qaowACgkQFkJ4iaW4
c+6UuBAA8DLOkP39NR7W5J01jADUqCQpBRQ0TeNVaZtWWbKDpBo3ouZ2Iykks2ww
/jw68VgT7gLmo85001hGP9374Ayuo+cfSRSZdSXvcE1NOm5fmIhPi2wTXw9eewnW
a0PHL6xaYDn9rYHIqVJLECr7xPvoCxaw7tV9RT/Vig8I2Gd2lgYPa/YnulQ3bJEy
4cZNhVY1Hf17fAOA8lmJ3QWlMp1lME7WT5edAAOZwg+pdQv0V/mzqd3BGOMIniL7
lKs3u7jYs7THsL/fG1WOGf+UchjCL77YB5cEiWMvIeUPwQ8yxJGycpRg+0wNiOn9
fuanoc7rdHffXLh6JK43uA++PXV1gg6bwk7L4dQevpg4JGIuRyMo3gGxrpxyv7En
OruNSVYme75fCZfttSn3A7XR40y300Om/+DON972QEt+nrqm57E2wRou0QFEtoT0
RhxtIFHGzjaYW48QQMgZ8oQK/ddGpMoL1ShfINieRKVwg7todybmEyGdcz/H9cyo
qeBJWyU+XJGbDOVxDcTsiZFq6Onwwf6OL9D1Tnr/uj9Zs1IOiR2nBbc6fIEzEcFv
rUBypby0KsRSSYf5xI5H2u55A2JMbJ6ypBlTfDrbLBRbptcUoMlNCu18nL6nPdLr
7mhQjlP4EyJekudBfQc3mOXAZv+ycsD8QJvZPF9XeNZVnqzsHrs=
=TSBO
-----END PGP SIGNATURE-----

--=-u6qEquGuV79ALqmyEBrM--



--===============0562615538336083528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0562615538336083528==--


