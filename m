Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13893BF480
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 15:55:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDUDA-0003ki-M2; Thu, 26 Sep 2019 13:53:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cPk2=XV=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDUD9-0003kF-0X
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 13:53:35 +0000
X-Inumbo-ID: 0773683d-e065-11e9-9654-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 0773683d-e065-11e9-9654-12813bfff9fa;
 Thu, 26 Sep 2019 13:53:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0F605AE79;
 Thu, 26 Sep 2019 13:53:33 +0000 (UTC)
Message-ID: <15e6d49da77d4cb1a8bd4b1b1adca5939bd3cf4b.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>, =?ISO-8859-1?Q?J=FCrgen_Gro=DF?=
 <jgross@suse.com>, George Dunlap <George.Dunlap@eu.citrix.com>
In-Reply-To: <7962de1d-8ad5-13ef-3377-3b16c07b9afd@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-31-jgross@suse.com>
 <2ad8a8ce-4530-93c7-0161-9b806a38b05d@suse.com>
 <0e4a75eb-61cc-2c9c-0d8a-f854163acd57@suse.com>
 <6288a88b-a5d8-dbd6-15c7-45ed19324510@suse.com>
 <29772d95-7528-2902-890a-1a11235f5b2e@suse.com>
 <e00a1ec0-63ba-d2b6-9bb8-7695cd8bd7fd@suse.com>
 <aecf79bf-029d-6033-aa27-5eb4ef9af650@suse.com>
 <7962de1d-8ad5-13ef-3377-3b16c07b9afd@suse.com>
Organization: SUSE
MIME-Version: 1.0
Date: Thu, 26 Sep 2019 15:53:26 +0200
User-Agent: Evolution 3.32.4 
Subject: Re: [Xen-devel] [PATCH v3 30/47] xen/sched: add support for
 multiple vcpus per sched unit where missing
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============8866289838202507788=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8866289838202507788==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-24anOW90jlVA4SGv6G8S"


--=-24anOW90jlVA4SGv6G8S
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-09-25 at 15:07 +0200, Jan Beulich wrote:
> On 25.09.2019 14:40, J=C3=BCrgen Gro=C3=9F  wrote:
> > On 24.09.19 17:22, Jan Beulich wrote:
> > > On 24.09.2019 17:09, J=C3=BCrgen Gro=C3=9F wrote:
> > > > On 24.09.19 17:00, Jan Beulich wrote:
> > > > > On 24.09.2019 16:41, J=C3=BCrgen Gro=C3=9F wrote:
> > > > > > for_each_sched_unit_vcpu() for an idle
> > > > > > unit might end premature when one of the vcpus is running
> > > > > > in another
> > > > > > unit (idle_vcpu->sched_unit !=3D idle_unit).
> > > > >=20
> > > > > Oh, that (v)->sched_unit =3D=3D (i) in the construct is clearly
> > > > > unexpected.
> > > > > Is this really still needed by the end of the series? I
> > > > > realize that
> > > > > _some_ check is needed, but could this perhaps be arranged in
> > > > > a way
> > > > > that you'd still hit all vCPU-s when using it on an idle
> > > > > unit, no
> > > > > matter whether they're in use as a substitute in a "real"
> > > > > unit?
> > > >=20
> > > > I could do that by having another linked list in struct vcpu.
> > > > This way
> > > > I can avoid it.
> > >=20
> > > Oh, no, not another list just for this purpose. I was rather
> > > thinking
> > > of e.g. a comparison of IDs.
> >=20
> > That would result either in something like:
> >=20
> > (v)->vcpu_id < (u)->unit_id + (u)->res->cpupool->granularity
> >=20
> > requiring to make struct sched_resource public as keyhandler.c
> > needs
> > for_each_sched_unit_vcpu() plus being quite expensive,
>=20
> I agree this is not a good option.
>=20
> > or:
> >=20
> > !(u)->next_in_list || (v)->vcpu_id < (u)->next_in_list->unit_id
> >=20
> > which seems to be more expensive as the current variant, too.
>=20
> It's not this much more expensive, and it eliminates unexpected
> (as I would call it) behavior, so I think I'd go this route.=20
>
So, I honestly like the way it's currently done in Juergen's pathes.

However, I'm not sure I understand what it is the issue that Jan thinks
that has, and in what sense the code/behavior is regarded as
"unexpected".

Can you help me see the problem? Maybe, if I realize it, I'd change my
preference...

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-24anOW90jlVA4SGv6G8S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2MwtIACgkQFkJ4iaW4
c+63eA//VPw3IoL0fqT08BZrgc5gN+23AX/KY0W5eA+lQ1TzQx6wt9yateksEbdD
Ew+0JyuQkoPPSAAlTZCBEYSVRdOO2NEd1oxerDa5BxNLgpjeJ8u9Hxju140llJkF
VfcVLq63NcWW2A0decYWV7tVGoYMptHDX5WCiLNcv5kW7ffjgBZAZl97+/V0GeG3
lriqu+DnT8OJozONABghYWWTzmRukXRO9ByWLHrFZkaVQotnvwICr0RQ5Di8xIwb
x1uMmQYrtBuP43NFtwUymwSVvf6y+nGIvL3ikF9OcF2u15Z7Y5LhxUPOp7dfU05L
vAeQsHM+ZX1dWxk+K5EdeCoEFeSgjGBC791bG6yOmOBIHQmRvu3wzrSLzEMqDPsv
wzq9p4N7tjGRDuZBJLin8bQSbkBrYvPUJLZJSPN+G0DucDC6xNzBfMP0w1sYYUR/
ROV7eC4sPavcvq0bXEcT9x2Dnj5pEnhoegstPTKtX/YjPMQy1onIYgJ+v+qZmcWZ
dtfjQKQshl7rfxI+AnOc/EkKdfDlaOTvpbG/HpOvBFHKLLzarsQP7Uvf54Fjb1jK
vEjCazssMQ2dedET7bJtP3AAsxNiO8xUFZa2L60jGkRXIjA0R86hZ/tXvBC495EM
cN2aG/cBfP++rVl/mNgaTQN3UbOdvT5ada41KUC1uOR15jyXY+o=
=Gk8U
-----END PGP SIGNATURE-----

--=-24anOW90jlVA4SGv6G8S--



--===============8866289838202507788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8866289838202507788==--


