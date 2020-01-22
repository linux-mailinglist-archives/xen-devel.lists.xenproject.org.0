Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C29144A81
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 04:45:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu6sI-0005ji-Ak; Wed, 22 Jan 2020 03:40:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fyJD=3L=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iu6sH-0005jd-5S
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 03:40:13 +0000
X-Inumbo-ID: e43ce8dd-3cc8-11ea-bbdb-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e43ce8dd-3cc8-11ea-bbdb-12813bfff9fa;
 Wed, 22 Jan 2020 03:40:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 42061AD12;
 Wed, 22 Jan 2020 03:40:10 +0000 (UTC)
Message-ID: <8820222f7211983f3d442cfb1a2dcb2f17f7262d.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Julien Grall <julien@xen.org>, Julien Grall
 <julien.grall.oss@gmail.com>,  osstest service owner
 <osstest-admin@xenproject.org>, George Dunlap <george.dunlap@citrix.com>, 
 =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>
Date: Wed, 22 Jan 2020 04:40:08 +0100
In-Reply-To: <88214dba-c307-02d2-91ee-625c630da779@xen.org>
References: <osstest-145796-mainreport@xen.org>
 <CAJ=z9a0FdTZXRADH4mwr4WKwptikPKyGxypsxHxhnGyz0fadZg@mail.gmail.com>
 <88214dba-c307-02d2-91ee-625c630da779@xen.org>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============1488726023059337997=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1488726023059337997==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-F55CzNV7AX1/pUN9597k"


--=-F55CzNV7AX1/pUN9597k
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-01-10 at 18:24 +0000, Julien Grall wrote:
> Hi all,
>=20
Hi Julien,

I was looking at this, and I have a couple of questions...

> On 08/01/2020 23:14, Julien Grall wrote:
> > On Wed, 8 Jan 2020 at 21:40, osstest service owner
> > <osstest-admin@xenproject.org> wrote:
> > ****************************************
> > Jan  8 15:02:26.943794 (XEN) Panic on CPU 1:
> > Jan  8 15:02:26.945872 (XEN) Assertion '!unit_on_replq(svc)' failed
> > at
> > sched_rt.c:586
> > Jan  8 15:02:26.951492 (XEN)
> > ****************************************
> >=20
> So I managed to reproduce it on Arm by hacking the hypercall path to
> call:
>=20
> domain_pause_nosync(current->domain);
> domain_unpause(current->domain);
>=20
> With a debug build and with a 2 vCPU dom0 the crash happen in a few=20
> seconds. When the unit is not scheduled, rt_unit_wake() expects the
> unit=20
> to be in none of the queues.
>=20
> The interaction is as following:
>=20
> CPU0                   		| CPU1
>                         		|
> do_domain_pause()      		|
>   -> atomic_inc(&d->pause_count)	|
>   -> vcpu_sleep_nosync(vCPU A) 	|  schedule()
> 				|	-> Lock
>                                  |       -> rt_schedule()
>                                  |          -> snext =3D runq_pick(...)
>                                  |          /* return unit A (aka
> vCPU A)
> 				|          /* Unit is not runnable */
> 				|  	   -> Remove from the q
>                                  | 	 [....]
> 				|       -> Lock
>     -> Lock			|
>     -> rt_unit_sleep()		|
>      /* Unit not scheduled */	|
>      /* Nothing to do */		|
>=20
Thanks a lot for the analysis. As said above, just a few questions, to
be sure I'm understanding properly what is happening.

You have a 2 vCPUs dom0, and how many other vCPUs from other domains?
Or do you only have those 2 dom0 vCPUs and you are actually pausing
dom0?

In general, what is running (I mean which vcpu) on CPU0, when the
domain_pause() happens? And what is running on CPU1 when schedule()
happens?

If you just have the 2 dom0's vCPUs around (and we call them vCPU A and
vCPU B), the only case for which I can imagine runq_pick() returning A
on CPU1 would be if CPU0 would be running vCPU B (and invoked the
hypercall from it) and CPU1 was idle... is this the case?

> When schedule() grab the lock first (as shown above), the unit will
> only=20
> be removed from the Q. However, when vcpu_sleep_nosync() grab the
> lock=20
> first and the unit was not scheduled, rt_unit_sleep() will remove
> the=20
> unit from two queues (runQ/depleteQ and replenishQ).
>=20
> So I think we want schedule() to remove the unit from the 2 queues if
> it=20
> is not runnable. Any opinions?
>=20
Mmm... that may work, but I'm not sure.

In fact, I'm starting to think that patch 7c7b407e777 "xen/sched:
introduce unit_runnable_state()", which added the 'q_remove(snext)' in
rt_schedule() might not be correct.

In fact, if runq_pick() returns a vCPU which is in the runqueue, but is
not runnable (e.g., because we're racing with do_domain_pause(), which
already set pause_count), it's not rt_schedule() job to dequeue it from
anything.

We probably should just ignore it and pick another vCPU, if any (and
idle otherwise). Then, after we release the lock, if will be
rt_unit_sleep(), called by do_domain_pause() in this case, that will
finish the job of properly dequeueing it...

Another strange thing is that, as the code looks right now, runq_pick()
returns the first unit in the runq (i.e., the one with the earliest
deadline), without checking whether it is runnable. Then, in
rt_schedule(), if the unit is not runnable, we (only partially, as you
figured out) dequeue it, and use idle instead, as our candidate for
being the next scheduled unit... But what if there were other
*runnable* units in the runqueue?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-F55CzNV7AX1/pUN9597k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl4nxBgACgkQFkJ4iaW4
c+5bNQ/+Mz3oMUTIf461EECMzQD5i4NmoritFfhD4PyZIW+kE6JIi7x2YKL+XVPD
mOmqvq294UQIcB/dZDGkiB83/+PwlICS++/+apJkh0cwsLK3a528e5FzYDtp7o4f
fJvXBo/OeBCaQTLHUAyDO4wng96hALYQ2rmget+kQGOAUSbgIkyasd96atBtwuu0
ulWwLOPDJJi55x0xZFKoJkGkCpn7y06P/eUFQ1G1G35B0PTT6x6iwmDMMmsvk72/
L1nkYLOtTId6ZF6ITFBgfUh+v4YckEWdkCAVR7KWOgsaIpintRLsTxsNxdVEA7o5
x0ILtnOiXv/f26r1ICsS7S6JhYKBzSQIEFewto4P2pfkAXoYgQz/f1jDuXVTSimo
ZdD55GDtyaH4Z2MbvRyrBMi0NdWcLxTCQDF866xm17sCiSWDYycEB2FXgM72w1IB
BKYh5qcPdi+W0PVkBG863hSenv4lIJl9CYzYAWPKF1522AARIGFajOiY5dvmUQEb
gvAhdPSJAitnMOWefHiOXwLwbOv3FVeNR+TsBTVzjz0q9y9YeC9T9lc56KXUPKi1
vqQuRBYX2Dxb76Daxe5LyAhCN47mfGn9DhANS5A7ftBKVAw3p1AaMHGayniRjGHV
u5DaHzSxrZ12vn7qTkQ9i5T/MQtdjMwKLxa7/bdBPs6hUbLGTIg=
=eZeZ
-----END PGP SIGNATURE-----

--=-F55CzNV7AX1/pUN9597k--



--===============1488726023059337997==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1488726023059337997==--


