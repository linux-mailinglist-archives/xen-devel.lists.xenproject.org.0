Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8691E14FD39
	for <lists+xen-devel@lfdr.de>; Sun,  2 Feb 2020 14:19:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyF6T-0002B6-DT; Sun, 02 Feb 2020 13:15:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OBbM=3W=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iyF6R-0002B1-6o
 for xen-devel@lists.xenproject.org; Sun, 02 Feb 2020 13:15:55 +0000
X-Inumbo-ID: 237ca55d-45be-11ea-8dad-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 237ca55d-45be-11ea-8dad-12813bfff9fa;
 Sun, 02 Feb 2020 13:15:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6C2BFAE44;
 Sun,  2 Feb 2020 13:15:51 +0000 (UTC)
Message-ID: <131a5f5450e2b62576ae0442efe072c780f7e193.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Julien Grall <julien@xen.org>, Julien Grall
 <julien.grall.oss@gmail.com>,  osstest service owner
 <osstest-admin@xenproject.org>, George Dunlap <george.dunlap@citrix.com>, 
 =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>
Date: Sun, 02 Feb 2020 14:15:31 +0100
In-Reply-To: <529a312b-5d2a-bc66-616d-a3c6ce4200f0@xen.org>
References: <osstest-145796-mainreport@xen.org>
 <CAJ=z9a0FdTZXRADH4mwr4WKwptikPKyGxypsxHxhnGyz0fadZg@mail.gmail.com>
 <88214dba-c307-02d2-91ee-625c630da779@xen.org>
 <8820222f7211983f3d442cfb1a2dcb2f17f7262d.camel@suse.com>
 <529a312b-5d2a-bc66-616d-a3c6ce4200f0@xen.org>
Organization: SUSE
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [xen-unstable test] 145796: tolerable FAIL - PUSHED
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, xumengpanda@gmail.com
Content-Type: multipart/mixed; boundary="===============4619774478781892968=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4619774478781892968==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-3Cv9iQ4+h8687kEnAX7l"


--=-3Cv9iQ4+h8687kEnAX7l
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2020-02-02 at 12:57 +0000, Julien Grall wrote:
> Hi Dario,
>=20
Hi,

> Apologies for the late answer.
>=20
No problem, I also did not had any more time to look into this yet.

> On 22/01/2020 03:40, Dario Faggioli wrote:
> > On Fri, 2020-01-10 at 18:24 +0000, Julien Grall wrote:
> > >=20
> > You have a 2 vCPUs dom0, and how many other vCPUs from other
> > domains?
> > Or do you only have those 2 dom0 vCPUs and you are actually pausing
> > dom0?
>=20
> Only dom0 with 2 vCPUs is running. On every hypercall, it will try
> to=20
> pause/unpause itself.=20
>
Ok, that was my understanding, but I wasn't 100% sure. Thanks for
confirming.

> This is to roughly match the behavior of the Arm=20
> guest atomic helpers.
>=20
Yep, makes sense.

> > If you just have the 2 dom0's vCPUs around (and we call them vCPU A
> > and
> > vCPU B), the only case for which I can imagine runq_pick()
> > returning A
> > on CPU1 would be if CPU0 would be running vCPU B (and invoked the
> > hypercall from it) and CPU1 was idle... is this the case?
>=20
> This is indeed the case. The schedule() on CPU1 has happenned
> because=20
> vCPU A was woken up (e.g an interrupt was received and injected to
> the=20
> vCPU).
>=20
Right.

> > In fact, I'm starting to think that patch 7c7b407e777 "xen/sched:
> > introduce unit_runnable_state()", which added the 'q_remove(snext)'
> > in
> > rt_schedule() might not be correct.
>=20
> I have tested Xen before this commit and didn't manage to reproduce
> the=20
> crash. As soon as I had the commit, it will crash quite quickly.
>=20
Ok, thanks for checking this as well. That's very useful.

> > In fact, if runq_pick() returns a vCPU which is in the runqueue,
> > but is
> > not runnable (e.g., because we're racing with do_domain_pause(),
> > which
> > already set pause_count), it's not rt_schedule() job to dequeue it
> > from
> > anything.
> >=20
> > We probably should just ignore it and pick another vCPU, if any
> > (and
> > idle otherwise). Then, after we release the lock, if will be
> > rt_unit_sleep(), called by do_domain_pause() in this case, that
> > will
> > finish the job of properly dequeueing it...
> >=20
> > Another strange thing is that, as the code looks right now,
> > runq_pick()
> > returns the first unit in the runq (i.e., the one with the earliest
> > deadline), without checking whether it is runnable. Then, in
> > rt_schedule(), if the unit is not runnable, we (only partially, as
> > you
> > figured out) dequeue it, and use idle instead, as our candidate for
> > being the next scheduled unit... But what if there were other
> > *runnable* units in the runqueue?
>=20
> My knowledge of the scheduler is quite limited. Maybe Meng would be
> able=20
> to answer to this question?
>=20
Yes, indeed, here I was pretty much thinking out loud, and trying to
trigger comments from Meng.

Anyway, I'll see about putting together a quick test patch that
implement what I described (next week), and let's see if it works.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-3Cv9iQ4+h8687kEnAX7l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl42y3MACgkQFkJ4iaW4
c+5fDw//bI9/jZ3BFhZ9IHdXK2mntz7ICsrqGIU84UZiem2VswHPsGireibifSBA
7in6EEMcfFRaaZ/BiF3XSJUEzZfWCJmsLruw2I3BanLViHGWIBiga1PFkT7abWwU
JEY9NaSl2fYVWUngj+5aDXNOlR3EaxU3kdpPn+i8RcnWhKDTBk1977rG7rjolV6f
aQsWqYBU4I21cU0i0qHLOzt+P6Jh8r7G52cqOEpFkOOGSB717TJmSj5xE2A4UpXs
Lpd7hcTFWYI+0QROajWPlH+lSgdCfRBzGAViGvUwOdodXCMQAZjHpnakNKmr81LP
ZW/0JjVguVpI6DttIbONLT0c2tbvSp+Sc443EBGLxLTVnkEiDdmHuLtWeIVTlHz/
8Z3n0ro4iNmaBXpDdat/Q3EJhlp+f37UllX3Aq4AYGSpnGICAvvX+/78p2QJGzsu
jtK3S3p0+7FZc5GgflGWSInKgAMa6z6EwXaQGRzVPOScPtGEzXiLycBPjPKqopaW
IcL2LZirkdwfJS/5ymgOqUXOO22QqDl/rFrRqDPMXElvgOToqscZO7xClN2UmWxX
1MYYzr/ScNXnwrgmKhVeOJ4kvN0/6VghOseReNyk62E0BqHe5kM9BgP7v2aJaGGc
SZFV0XWEsyUXjMyOGw6QjZG+C0N9u902F3bCFKcri9Z2OcMysy4=
=akbm
-----END PGP SIGNATURE-----

--=-3Cv9iQ4+h8687kEnAX7l--



--===============4619774478781892968==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4619774478781892968==--


