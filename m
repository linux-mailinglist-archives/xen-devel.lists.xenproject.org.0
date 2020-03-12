Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A72E61835E7
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 17:13:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCQQt-0002FN-UP; Thu, 12 Mar 2020 16:11:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yTGL=45=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jCQQt-0002FI-0p
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 16:11:39 +0000
X-Inumbo-ID: 26ca3210-647c-11ea-b1d0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26ca3210-647c-11ea-b1d0-12813bfff9fa;
 Thu, 12 Mar 2020 16:11:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5C07BABF4;
 Thu, 12 Mar 2020 16:11:37 +0000 (UTC)
Message-ID: <94b27cbc655806ea2853e5f3c099d2a4a93ee5ce.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Date: Thu, 12 Mar 2020 17:11:35 +0100
In-Reply-To: <2e53ee4c-e2d9-f892-c8c3-62bff0c526ab@suse.com>
References: <158402056376.753.7091379488590272336.stgit@Palanthas>
 <158402065414.753.15785539969715690913.stgit@Palanthas>
 <2e53ee4c-e2d9-f892-c8c3-62bff0c526ab@suse.com>
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
Cc: Juergen Gross <jgross@suse.com>, Charles Arnold <carnold@suse.com>,
 Glen <glenbarney@gmail.com>, George Dunlap <george.dunlap@citrix.com>,
 Tomas Mozes <hydrapolic@gmail.com>, Sarah Newman <srn@prgmr.com>,
 xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============5589919716530191349=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5589919716530191349==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-/1VS1ktCrCxKR5YOodoz"


--=-/1VS1ktCrCxKR5YOodoz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-03-12 at 16:26 +0100, Jan Beulich wrote:
> On 12.03.2020 14:44, Dario Faggioli wrote:
> > --- a/xen/common/sched/credit2.c
> > +++ b/xen/common/sched/credit2.c
> > @@ -234,7 +234,7 @@
> >   * units does not consume credits, and it must be lower than
> > whatever
> >   * amount of credit 'regular' unit would end up with.
> >   */
> > -#define CSCHED2_IDLE_CREDIT          (-(1U<<30))
> > +#define CSCHED2_IDLE_CREDIT          INT_MIN
>=20
> The title saying "lower than", is "equal" actually fine? Looking
> at e.g. runq_insert() I'm getting the impression it's not.
>=20
In Credit2, we don't have the idle vCPUs in the runqueue. So we will
never compare non-idle with idle while inserting.

But this is a good point, in general, and I think we may need to turn
the ">"
in a ">=3D" in runq_candidate().

> Looking at t2c_update() I'm also getting the impression that
> there's UB when the subtraction underflows. After all, if
> -1 << 30 wasn't small enough a value, I don't see why -1 << 31
> would be.
>=20
Mmm... not sure I am getting. Are you suggesting we should apply a cap
to val?

If yes, this looks like an issue independent from what the value of
CSCHED2_IDLE_CREDIT is, but yeah, we can do that. Or am I missing
something?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-/1VS1ktCrCxKR5YOodoz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5qXzcACgkQFkJ4iaW4
c+4XPA//efHPOnybwNTkemnXDQA+ycr4O0QDSNLpzyyCABxXTQFafJLxuYjttcR8
N6Li+xpbYE8bErEwA/1AvOqQFU2+27AgFiJzaXppPLxhfU/yPNhQDZeDuTaP2qLR
y8f7hCKYPpj7lIfoudT2S3d5NH6ZEwmv2x9QOBKF+UD07RqBD7C3eRkiW3D7BOK9
h5e32+AWiDSiXZBjO0zDL0wrz7WHArQFhCP/V534aZZUXggGv0WmN/zdRPFsqQM3
2i+h3yQoutPEQ+GMOsXgsJnv2HAFCFdLMqk+1ne82AtpXEc70DBLyvtQJah8RHRH
pGUFURWrdugLOei2827NRfffBLpQ9TRENw8hihxt7kXnrcM9PxPp2l4KZiQFtQoG
ujgUBghZzJuWFE5b/dj3pwR2PLzaAYAttiU8jG2d3Hl9yI8kmioqesaWxOnzH1V0
6mR3ISala/nf3db8jOLuYMurcJVozLhOxgsbRAoeEX4Fl+wL/RLr4xg/Da3DIdkJ
ir0YgvjPA+4rXlecRZD0XeXN9rKWbhQUYYfbVvVq6cfZpcw5a/rqLVdjqGCr8oUF
wCeU7WaFOMjhzw03E1RwErJ91AeAGsQTQCXH/mlwWI9wehUU8UW1sHUCntd5kkFq
dvSjLZz2+7vA4vUJI5yfU/Cu4RmpRptzB0GLBN1wrgS4krPs88Q=
=O1Ck
-----END PGP SIGNATURE-----

--=-/1VS1ktCrCxKR5YOodoz--



--===============5589919716530191349==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5589919716530191349==--


