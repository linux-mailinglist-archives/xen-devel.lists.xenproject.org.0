Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 083601306E1
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jan 2020 10:06:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1io1nZ-0005OP-PU; Sun, 05 Jan 2020 09:02:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3GeW=22=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1io1nY-0005OK-N2
 for xen-devel@lists.xenproject.org; Sun, 05 Jan 2020 09:02:12 +0000
X-Inumbo-ID: 0f2403d3-2f9a-11ea-a9ea-12813bfff9fa
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f2403d3-2f9a-11ea-a9ea-12813bfff9fa;
 Sun, 05 Jan 2020 09:02:11 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 6D45F213F4;
 Sun,  5 Jan 2020 04:02:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Sun, 05 Jan 2020 04:02:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ya9CWZ
 Uvgyi7+CJRlCSwtsLTgHqqoSrHgw41px0XZOk=; b=QCP7tLL5Ne6j0wQvN35EMX
 ObgM1d03ITDNmdSjIR8v4y5Ks74UN/zttwSHlCwWEAQvbgTA9DeMYK0hywJVck5b
 KnPQftEFnGLc7Kgx4Gj0gujBpxV4fMJJrbOM6nf/Wbn6X2Zd6TRTB1AOEiXxGrTU
 R/ftlqBFQ5IPyFipKBHl1Fi5V1uJ482YaH2XRp8VafmMHVRikEAQjr3PhTdNRnr1
 x4vBDZ0FqhfEWRDHsmvA3nvAuz7zIVEdrfKmwCHRbLoDdnM19rPViC85+J+tEGzT
 qJAjQsLavE3GxV3cAXTHc7UW+YKvUlfRooDygqlxCDwFq/1tRFcGYZjBRbROMulQ
 ==
X-ME-Sender: <xms:E6YRXpD5QVzbCBjTfNhNXZ2xIrIX12ryszavKUrcWhnOmaUGfKXw0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdegjedgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:E6YRXj2PuUAxrBjDcgOsbA9rKsoWyr817AXlfWjVRhdx8DDlOnd4IA>
 <xmx:E6YRXnXU7Ub6FV_8jKaBhqMrHFpkxzhodr0QG8W1QcbfTosmIrpg2Q>
 <xmx:E6YRXlkzlArFJ37ilbNmhhnF9T04X4HLmwUvo_ChNgXEPTX5GPAhsw>
 <xmx:E6YRXpiLW7aNelzEisd-babCBYVZvu1HMqf6KGpyex5LBvP6-mHi8Q>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7BB923060741;
 Sun,  5 Jan 2020 04:02:10 -0500 (EST)
Date: Sun, 5 Jan 2020 10:02:06 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <20200105090206.GG1314@mail-itl>
References: <20200104153032.GA2995@mail-itl>
 <5fdae943-3cc7-6dcf-3a2d-33b7df83cec8@citrix.com>
 <20200105073945.GF1314@mail-itl>
 <fe785b74-5e54-26e6-ffc6-6bc2741b35ee@suse.com>
MIME-Version: 1.0
In-Reply-To: <fe785b74-5e54-26e6-ffc6-6bc2741b35ee@suse.com>
Subject: Re: [Xen-devel] Xen crash on S3 resume on 4.13 and unstable if any
 CPU is re-offlined
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?Q?Micha=C5=82?= Kowalczyk <mkow@invisiblethingslab.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============5309203474322720118=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5309203474322720118==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="T7mxYSe680VjQnyC"
Content-Disposition: inline


--T7mxYSe680VjQnyC
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] Xen crash on S3 resume on 4.13 and unstable if any
 CPU is re-offlined

On Sun, Jan 05, 2020 at 09:25:42AM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 05.01.20 08:39, Marek Marczykowski-G=C3=B3recki wrote:
> > On Sun, Jan 05, 2020 at 12:42:30AM +0000, Andrew Cooper wrote:
> > > On 04/01/2020 15:30, Marek Marczykowski-G=C3=B3recki wrote:
> > > > Hi,
> > > >=20
> > > > I have a reliable crash on resume from S3. I can reproduce it on bo=
th
> > > > real hardware and nested within KVM, although call traces are diffe=
rent
> > > > between those platforms. In any case, it happens only if some CPU i=
s to
> > > > be re-offlined after resume (smt=3Doff and/or maxcpus=3D... options=
).
> > > >=20
> > > > I think the crash from the real hardware gives more clues, but the =
one
> > > > from qemu may also be interesting, maybe it's even another bug?
> > > >=20
> > > > The crash message (full console log attached):
=2E..
> > > > (XEN) Xen call trace:
> > > > (XEN)    [<ffff82d08023beb7>] R schedule.c#cpu_schedule_callback+0x=
ea/0x1a1
> > > > (XEN)    [<ffff82d080221289>] F notifier_call_chain+0x6b/0x96
> > > > (XEN)    [<ffff82d080203476>] F cpu.c#cpu_notifier_call_chain+0x1b/=
0x33
> > > > (XEN)    [<ffff82d080203550>] F cpu_down+0x5e/0x15c
> > > > (XEN)    [<ffff82d080203999>] F enable_nonboot_cpus+0x113/0x1fb
> > > > (XEN)    [<ffff82d0802e4240>] F power.c#enter_state_helper+0x107/0x=
51b
> > > > (XEN)    [<ffff82d08020828f>] F domain.c#continue_hypercall_tasklet=
_handler+0x8b/0xb7
> > > > (XEN)    [<ffff82d08023fd39>] F tasklet.c#do_tasklet_work+0x76/0xa9
> > > > (XEN)    [<ffff82d08024001a>] F do_tasklet+0x58/0x8a
> > > > (XEN)    [<ffff82d08027247a>] F domain.c#idle_loop+0x40/0x96
=2E..
> > > > And the one from qemu:
> > > >=20
> > > > (XEN) mce_intel.c:772: MCA Capability: firstbank 1, extended MCE MS=
R 0, SER
> > > > (XEN) Finishing wakeup from ACPI S3 state.
> > > > (XEN) Enabling non-boot CPUs  ...
> > > > (XEN) Assertion 'c2rqd(ops, sched_unit_master(unit)) =3D=3D svc->rq=
d' failed at sched_credit2.c:2137
> > > > (XEN) ----[ Xen-4.14-unstable  x86_64  debug=3Dy   Not tainted ]----
> > > > (XEN) CPU:    1
> > > > (XEN) RIP:    e008:[<ffff82d08022fe1a>] sched_credit2.c#csched2_uni=
t_wake+0x174/0x176
> > > > (XEN) RFLAGS: 0000000000010097   CONTEXT: hypervisor (d0v0)
> > > > (XEN) rax: ffff83013a7313e8   rbx: ffff83013a6bdf40   rcx: 00000000=
00000051
> > > > (XEN) rdx: ffff83013a731160   rsi: ffff83013a7310e0   rdi: 00000000=
00000003
> > > > (XEN) rbp: ffff83013a6f7d98   rsp: ffff83013a6f7d78   r8:  deadbeef=
deadf00d
> > > > (XEN) r9:  deadbeefdeadf00d   r10: 0000000000000000   r11: 00000000=
00000000
> > > > (XEN) r12: ffff83013a6bc7e0   r13: ffff82d08043e720   r14: 00000000=
00000003
> > > > (XEN) r15: 00000003c5ffecac   cr0: 0000000080050033   cr4: 00000000=
00000660
> > > > (XEN) cr3: 000000004b005000   cr2: 0000000000000000
> > > > (XEN) fsb: 00007751649f4740   gsb: ffff888134a00000   gss: 00000000=
00000000
> > > > (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e0=
08
> > > > (XEN) Xen code around <ffff82d08022fe1a> (sched_credit2.c#csched2_u=
nit_wake+0x174/0x176):
> > > > (XEN)  ef e8 1e c1 ff ff eb a7 <0f> 0b 55 48 89 e5 41 57 41 56 41 5=
5 41 54 53 48
> > > > (XEN) Xen stack trace from rsp=3Dffff83013a6f7d78:
> > > > (XEN)    ffff83013a6a3000 ffff83013a6bdf40 ffff83013a6bdf40 ffff830=
13a7313e8
> > > > (XEN)    ffff83013a6f7de8 ffff82d0802391f8 0000000000000202 ffff830=
13a7313e8
> > > > (XEN)    ffff83013a6c1018 0000000000000001 0000000000000000 0000000=
000000000
> > > > (XEN)    ffff83013a6c1018 ffff83013a6a3000 ffff83013a6f7e58 ffff82d=
08020906c
> > > > (XEN)    ffff82d08035d3d4 ffff82d08035d3c8 ffff82d08035d3d4 ffff82d=
08035d3c8
> > > > (XEN)    ffff82d08035d3d4 ffff82d08035d3c8 ffff82d08035d3d4 ffff830=
13a6f7ef8
> > > > (XEN)    0000000000000180 ffff83013a6aa000 deadbeefdeadf00d 0000000=
000000003
> > > > (XEN)    ffff83013a6f7ee8 ffff82d0803570c7 0000000000000001 0000000=
000000001
> > > > (XEN)    0000000000000000 deadbeefdeadf00d deadbeefdeadf00d ffff82d=
08035d3c8
> > > > (XEN)    ffff82d08035d3d4 ffff82d08035d3c8 ffff82d08035d3d4 ffff82d=
08035d3c8
> > > > (XEN)    ffff82d08035d3d4 ffff83013a6aa000 0000000000000000 0000000=
000000000
> > > > (XEN)    0000000000000000 0000000000000000 00007cfec59080e7 ffff82d=
08035d432
> > > > (XEN)    0000000000015120 0000000000000001 0000000000000000 ffff888=
13024a540
> > > > (XEN)    0000000000000000 0000000000000001 0000000000000246 0000000=
000140000
> > > > (XEN)    ffff8880bf7db000 ffffea0004be4508 0000000000000018 fffffff=
f8100130a
> > > > (XEN)    0000000000000000 0000000000000001 0000000000000001 0000010=
000000000
> > > > (XEN)    ffffffff8100130a 000000000000e033 0000000000000246 ffffc90=
000c97c98
> > > > (XEN)    000000000000e02b 0000000000000000 0000000000000000 0000000=
000000000
> > > > (XEN)    0000000000000000 0000e01000000001 ffff83013a6aa000 0000003=
0ba196000
> > > > (XEN)    0000000000000660 0000000000000000 000000013a6e2000 0000040=
000000000
> > > > (XEN) Xen call trace:
> > > > (XEN)    [<ffff82d08022fe1a>] R sched_credit2.c#csched2_unit_wake+0=
x174/0x176
> > > > (XEN)    [<ffff82d0802391f8>] F vcpu_wake+0xea/0x4d8
> > > > (XEN)    [<ffff82d08020906c>] F do_vcpu_op+0x36f/0x687
> > > > (XEN)    [<ffff82d0803570c7>] F pv_hypercall+0x28f/0x57d
> > > > (XEN)    [<ffff82d08035d432>] F lstar_enter+0x112/0x120
> > > > (XEN)
> > > > (XEN)
> > > > (XEN) ****************************************
> > > > (XEN) Panic on CPU 1:
> > > > (XEN) Assertion 'c2rqd(ops, sched_unit_master(unit)) =3D=3D svc->rq=
d' failed at sched_credit2.c:2137
> > > > (XEN) ****************************************
> > >=20
> > > This looks very much like the core scheduling crash found on specific
> > > machines in S5.=C2=A0 From my analysis, it was a use-after-free on a
> > > schedulling resource.
> > >=20
> > > Does switching back to thread mode (as opposed to core mode) make the
> > > crash go away?
> >=20
> > It is the thread mode (unless default has changed).
>=20
> Does the attached patch fix it for you?

Yes, it helps with the issue on the real hardware, thanks! On qemu it helps=
 only
partially - I don't get the crash with "qemu ... -smp 4 -append maxcpus=3D1"
anymore, but still get it with just "qemu ... -smp 4". It looks like a
different issue.

> From f53e105a9789b6d268e7fe4d05e4b989b9143338 Mon Sep 17 00:00:00 2001
> From: Juergen Gross <jgross@suse.com>
> To: xen-devel@lists.xenproject.org
> Cc: George Dunlap <george.dunlap@eu.citrix.com>
> Cc: Dario Faggioli <dfaggioli@suse.com>
> Date: Sun, 5 Jan 2020 09:21:41 +0100
> Subject: [PATCH] xen/sched: fix resuming from S3 with smt=3D0
>=20
> When resuming from S3 and smt=3D0 or maxcpus=3D are specified we must not
> do anything in cpu_schedule_callback(). This is not true today for
> taking down a cpu during resume.
>=20
> If anything goes wrong during resume all the scheduler related error
> handling is in cpupool.c, so we can just bail out early from
> cpu_schedule_callback() when suspending or resuming.
>=20
> This fixes commit 0763cd2687897b55e7 ("xen/sched: don't disable
> scheduler on cpus during suspend").
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>

Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
>  xen/common/schedule.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>=20
> diff --git a/xen/common/schedule.c b/xen/common/schedule.c
> index e70cc70a65..54a07ff9e8 100644
> --- a/xen/common/schedule.c
> +++ b/xen/common/schedule.c
> @@ -2562,6 +2562,13 @@ static int cpu_schedule_callback(
>      unsigned int cpu =3D (unsigned long)hcpu;
>      int rc =3D 0;
> =20
> +    /*
> +     * All scheduler related suspend/resume handling needed is done in
> +     * cpupool.c.
> +     */
> +    if ( system_state > SYS_STATE_active )
> +        return NOTIFY_DONE;
> +
>      rcu_read_lock(&sched_res_rculock);
> =20
>      /*
> @@ -2589,8 +2596,7 @@ static int cpu_schedule_callback(
>      switch ( action )
>      {
>      case CPU_UP_PREPARE:
> -        if ( system_state !=3D SYS_STATE_resume )
> -            rc =3D cpu_schedule_up(cpu);
> +        rc =3D cpu_schedule_up(cpu);
>          break;
>      case CPU_DOWN_PREPARE:
>          rcu_read_lock(&domlist_read_lock);
> @@ -2598,13 +2604,10 @@ static int cpu_schedule_callback(
>          rcu_read_unlock(&domlist_read_lock);
>          break;
>      case CPU_DEAD:
> -        if ( system_state =3D=3D SYS_STATE_suspend )
> -            break;
>          sched_rm_cpu(cpu);
>          break;
>      case CPU_UP_CANCELED:
> -        if ( system_state !=3D SYS_STATE_resume )
> -            cpu_schedule_down(cpu);
> +        cpu_schedule_down(cpu);
>          break;
>      default:
>          break;


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--T7mxYSe680VjQnyC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4Rpg4ACgkQ24/THMrX
1yzhuAf9FsTy7EsPKcl2yq3OEVW1BLqUJv3+bEezIxI6Ulb+ULObJ//RAks24jDo
UHo7fArf5FxO2Mq/swjwLUypEf9ex9wmbKnG+kbr1JPF/13NHBg+bjFwwS0ngQeF
ObhoqL3bv7hmzTrcgztDauLAGx7LQzNDu1QUoQnlC72Auwnu1S3EBiz7oqI8OCLQ
S03Jo+GKhyXS8Is3XUrbThO8wdM/Pbq8Amc6unQ99ji+RsrD5RE5KV9QJIja90MN
lLJ+QzPa/2N61yVes0cH6CCRZ0Zd6fs9XHgDGpjKgg5HSjeo593k7Mq3AZv3Pgw6
560p95kjWHG7qAFfaBJmEkGjrq0nIQ==
=7B+l
-----END PGP SIGNATURE-----

--T7mxYSe680VjQnyC--


--===============5309203474322720118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5309203474322720118==--

