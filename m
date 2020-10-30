Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A5E2A0DCC
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 19:51:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.16194.39548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYZUN-0002SE-DK; Fri, 30 Oct 2020 18:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16194.39548; Fri, 30 Oct 2020 18:51:03 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYZUN-0002Rp-9v; Fri, 30 Oct 2020 18:51:03 +0000
Received: by outflank-mailman (input) for mailman id 16194;
 Fri, 30 Oct 2020 18:51:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q/BW=EF=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1kYZUL-0002Rk-Kd
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 18:51:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c49c0763-86d7-4c12-b03f-bbc42b29928d;
 Fri, 30 Oct 2020 18:51:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6BE95AF33;
 Fri, 30 Oct 2020 18:50:59 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Q/BW=EF=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
	id 1kYZUL-0002Rk-Kd
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 18:51:01 +0000
X-Inumbo-ID: c49c0763-86d7-4c12-b03f-bbc42b29928d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c49c0763-86d7-4c12-b03f-bbc42b29928d;
	Fri, 30 Oct 2020 18:51:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604083859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6NnPIfBbWDw6ItzueazDTk0HN2NbGuH1JzTyEv12Z6k=;
	b=sKzz3CX338j047C+qjbjJPQdNsEO3zm4BQ4+l9FoipqDQMGx3/MJR79+GVvIb+kziuQ80h
	ZjlwO6veBGEUR7AKMbgFGB5A/ePo/pWM6CJ8Qb6rwO63HPUys0DjpDc4kIAAuy2i5KlatT
	eRlXe2ZwFDaVZOwL48jURwOM4ygFQoI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6BE95AF33;
	Fri, 30 Oct 2020 18:50:59 +0000 (UTC)
Message-ID: <6e4834fc544b89f723e6a80b7c6f50b9bfcd1fa6.camel@suse.com>
Subject: Re: BUG: credit=sched2 machine hang when using DRAKVUF
From: Dario Faggioli <dfaggioli@suse.com>
To: =?UTF-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>, 
	=?ISO-8859-1?Q?J=FCrgen_Gro=DF?=
	 <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <George.Dunlap@citrix.com>
Date: Fri, 30 Oct 2020 19:50:57 +0100
In-Reply-To: <1747162107.4472424.1603850652584.JavaMail.zimbra@nask.pl>
References: <157653679.6164.1603407559737.JavaMail.zimbra@nask.pl>
	 <a80f05ac-bd18-563e-12f7-1a0f9f0d4f6b@suse.com>
	 <1747162107.4472424.1603850652584.JavaMail.zimbra@nask.pl>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-bbIzAI4rls+5QjaSPH2W"
User-Agent: Evolution 3.38.1 (by Flathub.org) 
MIME-Version: 1.0


--=-bbIzAI4rls+5QjaSPH2W
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Cc-ing George as it's often useful having him in the loop when doing=C2=A0
 all this math on credits]

On Wed, 2020-10-28 at 03:04 +0100, Micha=C5=82 Leszczy=C5=84ski wrote:
> ----- 23 pa=C5=BA, 2020 o 6:47, J=C3=BCrgen Gro=C3=9F jgross@suse.com=C2=
=A0napisa=C5=82(a):
> As I've said before, I'm using RELEASE-4.14.0, this is DELL PowerEdge
> R640 with 14 PCPUs.
>=20
> I have the following additional pieces of log (enclosed below). As
> you could see, the issue is about particular vCPUs of Dom0 not being
> scheduled for a long time, which really decreases stability of the
> host system.
>=20
> ---
>=20
> [=C2=A0 313.730969] rcu: INFO: rcu_sched self-detected stall on CPU
> [=C2=A0 313.731154] rcu:=C2=A0=C2=A0=C2=A0=C2=A0 5-....: (5249 ticks this=
 GP)
> idle=3Dc6e/1/0x4000000000000002 softirq=3D4625/4625 fqs=3D2624
> [=C2=A0 313.731474] rcu:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (t=3D5250 jiffies =
g=3D10309 q=3D220)
> [=C2=A0 338.968676] watchdog: BUG: soft lockup - CPU#5 stuck for 22s!
> [sshd:5991]
> [=C2=A0 346.963959] watchdog: BUG: soft lockup - CPU#2 stuck for 23s!
> [xenconsoled:2747]
> (XEN) *** Serial input to Xen (type 'CTRL-a' three times to switch
> input)
> (XEN) sched_smt_power_savings: disabled
> (XEN) NOW=3D384307105230
> (XEN) Online Cpus: 0,2,4,6,8,10,12,14,16,18,20,22,24,26
> (XEN) Cpupool 0:
> (XEN) Cpus: 0,2,4,6,8,10,12,14,16,18,20,22,24,26
> (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
> (XEN) Scheduler: SMP Credit Scheduler rev2 (credit2)
> (XEN) Active queues: 2
> (XEN)=C2=A0=C2=A0 default-weight=C2=A0=C2=A0=C2=A0=C2=A0 =3D 256
> (XEN) Runqueue 0:
> (XEN)=C2=A0=C2=A0 ncpus=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 7
> (XEN)=C2=A0=C2=A0 cpus=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0,2,4,6,8,10,12
> (XEN)=C2=A0=C2=A0 max_weight=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D 256
> (XEN)=C2=A0=C2=A0 pick_bias=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D 10
> (XEN)=C2=A0=C2=A0 instload=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D 3
> (XEN)=C2=A0=C2=A0 aveload=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =3D 805194 (~307%)
> [...]
> (XEN) Runqueue 1:
> (XEN)=C2=A0=C2=A0 ncpus=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 7
> (XEN)=C2=A0=C2=A0 cpus=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 14,16,18,20,22,24,26
> (XEN)=C2=A0=C2=A0 max_weight=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D 256
> (XEN)=C2=A0=C2=A0 pick_bias=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D 22
> (XEN)=C2=A0=C2=A0 instload=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D 0
> (XEN)=C2=A0=C2=A0 aveload=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =3D 51211 (~19%)
> (XEN)=C2=A0=C2=A0 idlers:
>
That's quite imbalanced... Is there any pinning involved, by any
chance?

> [...]
> (XEN) Domain info:
> (XEN)=C2=A0=C2=A0 Domain: 0 w 256 c 0 v 14
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 1: [0.0] flags=3D20 cpu=3D0 credit=3D-10000=
000 [w=3D256] load=3D4594
> (~1%)
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 2: [0.1] flags=3D20 cpu=3D2 credit=3D913490=
4 [w=3D256] load=3D262144
> (~100%)
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 3: [0.2] flags=3D22 cpu=3D4 credit=3D-10000=
000 [w=3D256]
> load=3D262144 (~100%)
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 4: [0.3] flags=3D20 cpu=3D6 credit=3D-10000=
000 [w=3D256] load=3D4299
> (~1%)
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 5: [0.4] flags=3D20 cpu=3D8 credit=3D-10000=
000 [w=3D256] load=3D4537
> (~1%)
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 6: [0.5] flags=3D22 cpu=3D10 credit=3D-1000=
0000 [w=3D256]
> load=3D262144 (~100%)
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 7: [0.6] flags=3D20 cpu=3D12 credit=3D-1000=
0000 [w=3D256] load=3D5158
>
All these credit =3D -10000000 are a bit weird. The scheduler only allow
a vCPU to run until it has no less than -500000. As soon as a vCPU
reaches that point (actually, as soon as it reaches credit < 0), it
should be preempted. And if there is no other one with positive amount
of credits, credits themselves are reset (by adding 10000000 to them).

So, in an ideal world, we'll see no vCPU with credit < 0  here. We know
tat we're not in a super-ideal world, and that's why we allow for
credits to go a bit lower, until -500000.

And we're not even in an ideal world, so values smaller than -500000
are actually possible, due to timer/IRQ latency, etc. But they
shouldn't be too smaller than that.

If we see -10000000, it seems that a vCPU managed to run form more than
20ms, i.e., the 10ms it's been given at the last reset event plus 10ms
more, which brought it to -10ms. We can't know exacly how much more
than 20ms, because even if it run for 40ms, -10000000 is the lower
limit for the credits, and we clip "more negative" values at that
level.

Point is though, the scheduler is indeed setting timers for making sure
that the vCPU is interrupted when it reaches -500000. It looks that
here, quite a few vCPU are able to ignore such timer interrupts, or the
timer interrupts are not being delivered, or they are, but with some
giant latency/delay.

> (XEN) Runqueue 0:
> (XEN) CPU[00] runq=3D0, sibling=3D{0}, core=3D{0,2,4,6,8,10,12,14,16,18,2=
0,22,24,26}
> (XEN) CPU[02] runq=3D0, sibling=3D{2}, core=3D{0,2,4,6,8,10,12,14,16,18,2=
0,22,24,26}
> (XEN) CPU[04] runq=3D0, sibling=3D{4}, core=3D{0,2,4,6,8,10,12,14,16,18,2=
0,22,24,26}
> (XEN)=C2=A0=C2=A0 run: [0.2] flags=3D22 cpu=3D4 credit=3D-10000000 [w=3D2=
56] load=3D262144 (~100%)
>
And here we see this again. So, they're reporting being stuck, but it's
not that they're stuck as "not being run by the hypervisor. On the
contrary, they're running all the time!

And... well, I'd like to think a bit more about this but I'd say that
the vCPU is running and the functions that do the credit accounting
(like burn_credits()-->t2c_update()) are being called, otherwise we
would not see -10000000.

Also...

> (XEN) CPU[06] runq=3D0, sibling=3D{6}, core=3D{0,2,4,6,8,10,12,14,16,18,2=
0,22,24,26}
> (XEN) CPU[08] runq=3D0, sibling=3D{8}, core=3D{0,2,4,6,8,10,12,14,16,18,2=
0,22,24,26}
> (XEN) CPU[10] runq=3D0, sibling=3D{10}, core=3D{0,2,4,6,8,10,12,14,16,18,=
20,22,24,26}
> (XEN)=C2=A0=C2=A0 run: [0.5] flags=3D22 cpu=3D10 credit=3D-10000000 [w=3D=
256] load=3D262144 (~100%)
> (XEN) CPU[12] runq=3D0, sibling=3D{12}, core=3D{0,2,4,6,8,10,12,14,16,18,=
20,22,24,26}
> (XEN) RUNQ:
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 0: [0.1] flags=3D20 cpu=3D2 credit=3D913490=
4 [w=3D256] load=3D262144 (~100%)
>
... The actual scheduler (csched2_schedule()) is not being invoked. In
fact, there is vCPU d0v1, sitting here in the runqueue.

And if the scheduler would run on either CPU 4 or 12, it would notice
that vCPUs 2 and 5 have -10000000 credits, while there is vCPU 1
waiting with 9134904 credits. And they'd pick it up and preempt.

Or it is running, but is not doing what I just described for whatever
bug we have there, but that I am not currently seeing.

Also, all the other idle vCPUs are not picking d0v1 up either.

Another thing that should not happen.

So, can I see:

# xl info -n
# xl vcpu-list

 ?

In the meantime, I'll continue looking at the code, and maybe come up
with a debug patch, e.g., for figuring out whether csched2_schedule()
is either running but not doing its job, or not running at all.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-bbIzAI4rls+5QjaSPH2W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl+cYJIACgkQFkJ4iaW4
c+692g/+MGNVuhBU2RLKk67pMXp4sjxL5QOpzgkjT/quVoeot5UIWOouuF6MSuAA
Qjig4A3v0OjPrUcZg1nxdXPPmDgQIS/qxWavqNSeu4uLOoBh/y2MK+LItavj6dca
ihoMuPt0PTzJOB9JdbMxxlJonWUE9K1GeIi+vqwsCEB92FjrrouXZAqL7g6IrHdK
wrCVFuuvmT8YkiGJ4QHGUWby7WYSYFy+pmlj3FtvRlDjrH9328Um5YQ3wvFpRxub
/FpusbfK/yZ80bmQLuXlYPpluFwhIKUTtYbUdPXtmo2ucdscLKyafypDBcCx1k53
k+Efl+7e0R4fBvB/wLxYZyTTHxS5pfpIyNYPzjEszgbzGkuhemQJIyzWJDS16Lml
TIskHbu/o1EnLyhGfr/5c2wz8cJJfdQ/K7vChbnjdS+4AK3WBLSE4ryjhO1iZS6N
6Qu/sVm0WjcJBoXyTlGxRWDJsb2015t0d3ZT1eKF1BvR4M1EJaQeG+O7HR5K+mDZ
pDnE/79u/2vqkAIXiH/7G2w1XpjgbqnSossv6C9QQfdj5PTXsDP2KKbIcjoZTk1M
3C3nYe+es+cN8/hNCsxcJRYiovW+nXi2prz3B4wwSHErqb7rBZI6kOmsmMi7eaaS
AhiBezb+llM33WTAFZ+Uy3355Apsa0hcKIRegpNIdrZ3iVVFxsE=
=HvCU
-----END PGP SIGNATURE-----

--=-bbIzAI4rls+5QjaSPH2W--


