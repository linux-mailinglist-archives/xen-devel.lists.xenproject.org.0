Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14418C0019
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 09:34:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDkjz-0002Uw-Qi; Fri, 27 Sep 2019 07:32:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=drc8=XW=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDkjy-0002Uf-CQ
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 07:32:34 +0000
X-Inumbo-ID: f7edabb8-e0f8-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id f7edabb8-e0f8-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 07:32:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7134DB5FD;
 Fri, 27 Sep 2019 07:32:32 +0000 (UTC)
Message-ID: <c996b2b5e210a9733b44c5a29b2e1f77f2471be9.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Jan Beulich
 <jbeulich@suse.com>
Date: Fri, 27 Sep 2019 09:32:31 +0200
In-Reply-To: <739bf431-90d3-018b-8282-191e0bf06fed@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-36-jgross@suse.com>
 <af34c647-ffec-48d5-64f3-7aa00a57fa35@suse.com>
 <95f6907a-9a82-38a9-7937-61286d552138@suse.com>
 <739bf431-90d3-018b-8282-191e0bf06fed@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 35/47] xen/sched: make vcpu_wake() and
 vcpu_sleep() core scheduling aware
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============4919615916768535780=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4919615916768535780==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-7N8lEKWWxwaEBfNSk7Dc"


--=-7N8lEKWWxwaEBfNSk7Dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-09-27 at 06:42 +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 25.09.19 15:07, J=C3=BCrgen Gro=C3=9F wrote:
> > On 24.09.19 13:55, Jan Beulich wrote:
> > > On 14.09.2019 10:52, Juergen Gross wrote:
> > > > @@ -765,16 +774,22 @@ void vcpu_wake(struct vcpu *v)
> > > >   {
> > > >       unsigned long flags;
> > > >       spinlock_t *lock;
> > > > +    struct sched_unit *unit =3D v->sched_unit;
> > > >       TRACE_2D(TRC_SCHED_WAKE, v->domain->domain_id, v-
> > > > >vcpu_id);
> > > > -    lock =3D unit_schedule_lock_irqsave(v->sched_unit, &flags);
> > > > +    lock =3D unit_schedule_lock_irqsave(unit, &flags);
> > > >       if ( likely(vcpu_runnable(v)) )
> > > >       {
> > > >           if ( v->runstate.state >=3D RUNSTATE_blocked )
> > > >               vcpu_runstate_change(v, RUNSTATE_runnable,
> > > > NOW());
> > > > -        sched_wake(vcpu_scheduler(v), v->sched_unit);
> > > > +        sched_wake(vcpu_scheduler(v), unit);
> > >=20
> > > Is this correct / necessary when the unit is not asleep as a
> > > whole?
> > > After all the corresponding sched_sleep() further up is called
> > > conditionally only.
> >=20
> > Oh, indeed. Will change that.
>=20
> It turned out this is not so easy at it seemed.
>=20
> I encountered dom0 boot hangs with making the call conditional, even
> when running in cpu scheduling mode. I guess the reason is that a
> vcpu
> can call do_poll() which will try to put itself to sleep and in some
> cases call vcpu_wake() in case the condition already changed. In that
> case we need the sched_wake() call even if the unit is still running.
>=20
TBH, I think it is ok for this call to be unconditional. Indeed it
looks a bit weird when you compare this to the sched_sleep() calls in
vcpu_sleep_nosync_locked(), as they are conditional, but I think a
comment explaining why this has to be the case would be enough.

E.g., something like what the changelog already say, in
vcpu_sleep_nosync_locked(), and maybe something like what you said
here, in vcpu_wake().

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-7N8lEKWWxwaEBfNSk7Dc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2Nuw8ACgkQFkJ4iaW4
c+4uPA//U/fhGlOcGvh7NiPTXoNxJhSreU/tBNkXtdPnCJsS9bX5UYXRNPm41KqS
PXxYcv5VNOnz17yT0R35c5nB+uD4unUgQosalcjulp/Hox/6o9ky6lG/wn5yju5g
4DKMijbrvXL+ReBAw1EHVk58weRx/6fCfTumi2iHkl6J0AVVebNMV/+veiJeqsl/
2UlGaFFo8PQiboGlkl3P6RcJqVC+TxnnpHax9G0yHA0SfwD4VJlyWmkFazBacD0c
JiN0R8H00ooB12wRbEQc2pmd6b7B6hUhhvJtbacW0VxpJNimt0JpFkRS5Cr2RbA6
5m+7K2GoD5K37u1k/wsqnBo6DCu3RPPll4AbN9JObO1FNJSDjyjHiLk3ZsaTad7Z
FzzVMzFz8+JjwMUOB4fXgYe86dnSVXyst/LE1F8EMqizDesZDKbNpP0stq1idItd
a6fKQIcwiUGG2vp0In13HzgeBdBc6sz1NHsBYQbzGkahMSdtjji311dJs3yuSlu4
NgAxmOXE5h32tprDZNhPdXVzvxv3srEJt5YqRG++/v7UEICL0ZeMsMDeSMjMbPnp
mwfHBgxGRlKAuSEavvsEdmQ4qW/4mD0u3DyEMXCkPTFaOkX/J9Vi3s0SU9Lg0u3A
9SeQAVO8dGLi4hk5CCQ30yFgeX0gjzg0XTgh14DkfK41NqENkCY=
=0foF
-----END PGP SIGNATURE-----

--=-7N8lEKWWxwaEBfNSk7Dc--



--===============4919615916768535780==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4919615916768535780==--


