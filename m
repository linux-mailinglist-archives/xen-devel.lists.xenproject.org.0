Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C99EB0CD2
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 12:26:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8MFl-00042T-Tp; Thu, 12 Sep 2019 10:23:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uvwM=XH=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1i8MFk-00042O-3B
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 10:23:04 +0000
X-Inumbo-ID: 4d2916ac-d547-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d2916ac-d547-11e9-b299-bc764e2007e4;
 Thu, 12 Sep 2019 10:23:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 03288AF24;
 Thu, 12 Sep 2019 10:23:01 +0000 (UTC)
Message-ID: <8e1c6d03d20c4eeb0b57af9ce4f87dc17e1dcdae.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Date: Thu, 12 Sep 2019 12:22:59 +0200
In-Reply-To: <a637c5a4-d1f6-bf43-6eb2-c9702a79ca48@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-31-jgross@suse.com>
 <a637c5a4-d1f6-bf43-6eb2-c9702a79ca48@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 30/48] xen/sched: introduce
 unit_runnable_state()
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============5046489645024012609=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5046489645024012609==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-t1jRxyX/FyKmAO90x21i"


--=-t1jRxyX/FyKmAO90x21i
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-09-11 at 12:30 +0200, Jan Beulich wrote:
> On 09.08.2019 16:58, Juergen Gross wrote:
> >=20
> > --- a/xen/include/xen/sched-if.h
> > +++ b/xen/include/xen/sched-if.h
> > @@ -75,6 +75,20 @@ static inline bool unit_runnable(const struct
> > sched_unit *unit)
> >      return vcpu_runnable(unit->vcpu_list);
> >  }
> > =20
> > +static inline bool unit_runnable_state(const struct sched_unit
> > *unit)
> > +{
> > +    struct vcpu *v;
> > +    bool runnable;
> > +
> > +    v =3D unit->vcpu_list;
> > +    runnable =3D vcpu_runnable(v);
> > +
> > +    v->new_state =3D runnable ? RUNSTATE_running
> > +                            : (v->pause_flags & VPF_blocked)
> > +                              ? RUNSTATE_blocked :
> > RUNSTATE_offline;
> > +    return runnable;
> > +}
>=20
> Especially for understanding the (correctness of the) credit1
> changes it would be rather helpful if once again this function
> actually iterated over all vCPU-s right away (even if there's
> only one per unit right now), to see how their varying states
> get combined.
>=20
Yep, I agree.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-t1jRxyX/FyKmAO90x21i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl16HIQACgkQFkJ4iaW4
c+616hAAuexjUhHKLF7fnvjkzli7Lab2JjcRDoj+iheYZaDPbjOSKE+KJFh+eO/6
IS4Ig1Rb3FWXBPJCs9ndw11cufiI32A9RXyj5gIMLbVapj6uw2zLpozc5Vdinn5h
ewoUzcMvmvFKFIrXMbvHL9xiK1e89tRxIJpfEqhje3s+2I6AIkc54VfVo1M4DuTI
fUGeoGQYaYYzd0jzYxZYRFdz14z0bpHD0Gltf5lZLI9sSsL/x8W4amOjdVBlpIKx
hBJ1b4+flJaf51AxeTnyG332eIGJpZ6lh6OI+mZkzS1fXV9VlqDd0d90hzotSkBc
RDpW3+uBNbLuez7bW4GM+m6Z/S9NwwfjThtodRPtIIDvoLrqx7bESE6+aBGQuzmU
0pkjtsX2U/LvVv6A/DbyYHpwUn0P2ThgTlmINcVEpFIc6I0jKwgP53IczWJKra3r
ovgof3cWfB6KUm6UJSCwGaCkE7DfCQeqMAN82KylqOhXygpcDlV23xzgNYyeMF6c
2HYEhZE62cK4URUF5h2uBVzfWpioezamkMnZX/il96STAq4CmxRDkAnFmumpbyYg
U2vRF9DovRR7QegHfUQ9CxwNlod0kfFzj1VjihmVVZTtMAeABQyyN1fqyc1HP6Y/
hl2nLXBeNKRDd/ktTjGTqc6K1Y9LLduZ86dKCrhNfRlZ67IxQB0=
=vkeE
-----END PGP SIGNATURE-----

--=-t1jRxyX/FyKmAO90x21i--



--===============5046489645024012609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5046489645024012609==--


