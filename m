Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4985FB15F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 13:22:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419613.664438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiDL6-0000uq-UP; Tue, 11 Oct 2022 11:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419613.664438; Tue, 11 Oct 2022 11:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiDL6-0000rR-RA; Tue, 11 Oct 2022 11:22:24 +0000
Received: by outflank-mailman (input) for mailman id 419613;
 Tue, 11 Oct 2022 11:22:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2VIF=2M=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oiDL5-0000rL-4G
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 11:22:23 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7eecb4a-4956-11ed-8fd0-01056ac49cbb;
 Tue, 11 Oct 2022 13:22:20 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 26A6C5C0165;
 Tue, 11 Oct 2022 07:22:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 11 Oct 2022 07:22:19 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Oct 2022 07:22:17 -0400 (EDT)
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
X-Inumbo-ID: f7eecb4a-4956-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1665487339; x=
	1665573739; bh=CQLvPIi+zS+g8PJ804HomIoSRHPl8Tc4biMEue8VQbo=; b=E
	eZ/qDgPzncG4Sr0f0dYKZVX8++llNC685ahpdV+kNuN1i3Iv38eoURhvRb/7nLhi
	L2px3E0ZfZMAaOefKDGKPahpzPQm7tFBM+auRgOPg99wSZKcxe/8JUP+5x+qT8xH
	5xPL4LQFvMuMYGU/aJzA1h3WWJhXBotNwO4No3X+S5E1oMBKPdJ/FISALxC92wwN
	qGFBzMFOpCdybqD6pD4iQr9rvxmvraxfHFsp2vFsAnGi8MP+VVj8Mqc0Zyux8xm4
	9M1KBox0SurzVTyQ7eeKXn9dEp48qxGtaLXG362C/7iPgTve/YeEp+GXihdgSV5R
	A6hUub4usEpdJKWQn1Ilw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1665487339; x=1665573739; bh=CQLvPIi+zS+g8PJ804HomIoSRHPl
	8Tc4biMEue8VQbo=; b=K2LFOFJC9g3g+nkSLFeBF9Ka8LKdDb2lFrNivLc4fZx/
	2W4xCwXkBN90CrIx+2/md1xmboEdXEFSF8p0jQ2gAlRqRY1iWaCkdbNyc0KncBIb
	W2SIK0wUv1H6h17M4ZuvU+Y+lPuvumTkKIZYoGT4yo09QnvOus3rFFZtdflxHakl
	Idyqr21zLV35IAYiMEWckvyFdAjqFoFyxGxkByWxjBXtNj08xUU6n6xs0317JVxi
	HR+XpDVGG7KkexfPoIHmKaGbavxpfOTwsQmb/efPIQd0jfRKzexz3jmdnvEzLdK8
	Gsrr5C3OkjmiVA1kqLPcH4TICZW0mUy0eu6YS430vg==
X-ME-Sender: <xms:6lFFY2AMuu3AbuWTk_jc7yiKiHetvQd5QTa9jN9tquVV5UOthciiOA>
    <xme:6lFFYwihy09I8YHmlOxG1TkXwtILeX9ANo_mqc8KDg7NMa1s6jA7xq65gx9xgGKq3
    o2mpWQKdHGI9Q>
X-ME-Received: <xmr:6lFFY5kYIUf7RMdOgdgtRxwXh5q1mCxr_DELsGYz5bABVh2Ty3L58X42vgRgc2aZp2Ka5zfCYstiIxSCuBMplx9zp0Qddu6gMLxT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejiedgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptdff
    veffkedvudetvdetvdefffduueeuveelfedtfeevfedtveelgfegtdevvdeunecuffhomh
    grihhnpehgihhthhhusgdrtghomhdprggttghorhguihhnghhlhidrphhinhhgnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvg
    hksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:6lFFY0xbIKUkZHtymVEA3PW7SafJZH8VoyKhhF7UL7jmT9vfHTmFZQ>
    <xmx:6lFFY7TrIK8cWVrQNv0zkbq7v5na6Z5iOFiAxZxnCJvDAug0hEWGlw>
    <xmx:6lFFY_avngfwB1wOeSz2nPHWhFoVoczqJoc8m9HeWgCBHEDhBBLLFQ>
    <xmx:61FFY1fe9KinpiScHmC55r3pP69BNAPQWpJLey5Gw-HNXXHphNeugg>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 11 Oct 2022 13:22:15 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13 and newer
Message-ID: <Y0VR53lPZbbmbR2L@mail-itl>
References: <d243c1b5-712d-a958-0b6c-b232eb4edc80@suse.com>
 <20200929151627.GE1482@mail-itl>
 <ea53b845-5edf-a61e-62ae-7ababc30b3e0@suse.com>
 <20210131021526.GB6354@mail-itl>
 <YWHDIQC3K8J3LD8+@mail-itl>
 <YwJZ3X0HpT9w6Veh@mail-itl>
 <b1df84d5-a1ca-3019-16a7-36d0bb568779@suse.com>
 <YwNTu1fL7uITg0OZ@mail-itl>
 <YymUZCfLZRWl6xr5@mail-itl>
 <e813f296-ba1d-7ff0-a84c-97737d7ac7a5@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hvm1Jo/UDaOd/PS4"
Content-Disposition: inline
In-Reply-To: <e813f296-ba1d-7ff0-a84c-97737d7ac7a5@suse.com>


--hvm1Jo/UDaOd/PS4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Oct 2022 13:22:15 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13 and newer

On Tue, Sep 20, 2022 at 04:30:41PM +0200, Jan Beulich wrote:
> On 20.09.2022 12:22, Marek Marczykowski-G=C3=B3recki wrote:
> > On Mon, Aug 22, 2022 at 12:00:27PM +0200, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> >> On Mon, Aug 22, 2022 at 11:53:50AM +0200, Jan Beulich wrote:
> >>> On 21.08.2022 18:14, Marek Marczykowski-G=C3=B3recki wrote:
> >>>> On Sat, Oct 09, 2021 at 06:28:17PM +0200, Marek Marczykowski-G=C3=B3=
recki wrote:
> >>>>> On Sun, Jan 31, 2021 at 03:15:30AM +0100, Marek Marczykowski-G=C3=
=B3recki wrote:
> >>>>>> I'm resurrecting this thread as it was recently mentioned elsewher=
e. I
> >>>>>> can still reproduce the issue on the recent staging branch (9dc687=
f155).
> >>>>>>
> >>>>>> It fails after the first resume (not always, but frequent enough to
> >>>>>> debug it). At least one guest needs to be running - with just (PV)=
 dom0
> >>>>>> the crash doesn't happen (at least for the ~8 times in a row I tri=
ed).
> >>>>>> If the first resume works, the second (almost?) always will fail b=
ut
> >>>>>> with a different symptoms - dom0 kernel lockups (at least some of =
its
> >>>>>> vcpus). I haven't debugged this one yet at all.
> >>>>>>
> >>>>>> Any help will be appreciated, I can apply some debug patches, chan=
ge
> >>>>>> configuration etc.
> >>>>>
> >>>>> This still happens on 4.14.3. Maybe it is related to freeing percpu
> >>>>> areas, as it caused other issues with suspend too? Just a thought...
> >>>>
> >>>> I have reproduced this on current staging(*). And I can reproduce it
> >>>> reliably. And also, I got (I believe) closely related crash with cre=
dit1
> >>>> scheduler.
> >>>>
> >>>> (*) It isn't plain staging, it's one with my xhci console patches on
> >>>> top, including attempt to make it survive S3. I believe the only
> >>>> relevant part there is sticking set_timer() into console resume path=
 (or
> >>>> just having a timer with rather short delay registered). The actual =
tree
> >>>> at https://github.com/marmarek/xen/tree/master-xue2-debug, including
> >>>> quite a lot of debug prints and debug hacks.
> >>>>
> >>>> Specific crash with credit2:
> >>
> >> (XEN) Assertion 'c2rqd(sched_unit_master(unit)) =3D=3D svc->rqd' faile=
d at common/sched/credit2.c:2274
> >> (XEN) ----[ Xen-4.17-unstable  x86_64  debug=3Dy  Tainted:   C    ]----
> >> (XEN) CPU:    10
> >> (XEN) RIP:    e008:[<ffff82d040247a4d>] credit2.c#csched2_unit_wake+0x=
152/0x154
> >> (XEN) RFLAGS: 0000000000010083   CONTEXT: hypervisor (d0v0)
> >> (XEN) rax: ffff830251778230   rbx: ffff830251768cb0   rcx: 00000032111=
d6000
> >> (XEN) rdx: ffff8302515c1eb0   rsi: 0000000000000006   rdi: ffff8302517=
69000
> >> (XEN) rbp: ffff8302515cfd90   rsp: ffff8302515cfd70   r8:  ffff8302517=
69000
> >> (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 00000000000=
00000
> >> (XEN) r12: ffff830251768dd0   r13: ffff8302515c1d00   r14: 00000000000=
00006
> >> (XEN) r15: ffff82d0405ddb40   cr0: 0000000080050033   cr4: 00000000003=
72660
> >> (XEN) cr3: 000000022f2a1000   cr2: ffff8881012738e0
> >> (XEN) fsb: 0000744bf6a0db80   gsb: ffff888255600000   gss: 00000000000=
00000
> >> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
> >> (XEN) Xen code around <ffff82d040247a4d> (credit2.c#csched2_unit_wake+=
0x152/0x154):
> >> (XEN)  df e8 6f bf ff ff eb ad <0f> 0b f3 0f 1e fa 55 48 89 e5 41 57 4=
1 56 41 55
> >> (XEN) Xen stack trace from rsp=3Dffff8302515cfd70:
> >> (XEN)    ffff83025174b000 ffff830251768cb0 ffff830251778270 ffff82d040=
5c4298
> >> (XEN)    ffff8302515cfdd8 ffff82d04024fcb8 0000000000000202 ffff830251=
778270
> >> (XEN)    ffff83025174b000 0000000000000001 ffff830251769018 0000000000=
000000
> >> (XEN)    0000000000000000 ffff8302515cfe48 ffff82d04020a8c9 ffff888255=
6aedc0
> >> (XEN)    0000000000000003 00001910537e623e 0000000b988f78a6 0000000059=
d4a716
> >> (XEN)    00001901f30fa41e 0000000217f96af6 0000000000000000 ffff830251=
74b000
> >> (XEN)    ffff830251756000 0000000000000002 0000000000000001 ffff830251=
5cfe70
> >> (XEN)    ffff82d0402f7968 ffff830251756000 ffff8302515cfef8 0000000000=
000018
> >> (XEN)    ffff8302515cfee8 ffff82d0402ec6de 0000000000000000 ffffffff82=
f157e0
> >> (XEN)    0000000000000000 0000000000000000 ffff8302515cfef8 0000000000=
000000
> >> (XEN)    0000000000000000 ffff8302515cffff ffff830251756000 0000000000=
000000
> >> (XEN)    0000000000000000 0000000000000000 0000000000000000 00007cfdae=
a300e7
> >> (XEN)    ffff82d0402012bd 0000000000000000 ffffffff82c51120 ffff888100=
36cf00
> >> (XEN)    0000000000000002 000000000001e120 0000000000000002 0000000000=
000246
> >> (XEN)    ffffffff82f157e0 0000000000000001 0000000000000000 0000000000=
000018
> >> (XEN)    ffffffff81e4a30a 0000000000000000 0000000000000002 0000000000=
000001
> >> (XEN)    0000010000000000 ffffffff81e4a30a 000000000000e033 0000000000=
000246
> >> (XEN)    ffffc9004aef7c18 000000000000e02b fb5ee398d214b10c eb5ef398c2=
14a10c
> >> (XEN)    eb56f390c21ca104 ebd6f310c29ca184 0000e0100000000a ffff830251=
756000
> >> (XEN)    0000003211016000 0000000000372660 0000000000000000 8000000296=
3e1002
> >> (XEN) Xen call trace:
> >> (XEN)    [<ffff82d040247a4d>] R credit2.c#csched2_unit_wake+0x152/0x154
> >> (XEN)    [<ffff82d04024fcb8>] F vcpu_wake+0xfd/0x267
> >> (XEN)    [<ffff82d04020a8c9>] F common_vcpu_op+0x178/0x5d1
> >> (XEN)    [<ffff82d0402f7968>] F do_vcpu_op+0x69/0x226
> >> (XEN)    [<ffff82d0402ec6de>] F pv_hypercall+0x575/0x657
> >> (XEN)    [<ffff82d0402012bd>] F lstar_enter+0x13d/0x150
> >> (XEN)
> >> (XEN)
> >> (XEN) ****************************************
> >> (XEN) Panic on CPU 10:
> >> (XEN) Assertion 'c2rqd(sched_unit_master(unit)) =3D=3D svc->rqd' faile=
d at common/sched/credit2.c:2274
> >> (XEN) ****************************************
> >=20
> > Ok, I think I figured it out!
> >=20
> > I added a function that verifies run queues of all the sched units, and
> > called it basically every other line on the resume path. The debug
> > function (if anybody is interested):
> >=20
> >     void verify_sched_units(void)
> >     {  =20
> >         struct domain *d;
> >         const struct sched_unit *unit;
> >        =20
> >         for_each_domain ( d )
> >         {
> >             for_each_sched_unit ( d, unit )
> >             {
> >                 if ( c2rqd(sched_unit_master(unit)) !=3D csched2_unit(u=
nit)->rqd )
> >                 {
> >                     printk(XENLOG_WARNING "d%d sched unit %d: rq=3D%d, =
unit master %d, rq=3D%d\n",
> >                             d->domain_id, unit->unit_id,
> >                             csched2_unit(unit)->rqd ? csched2_unit(unit=
)->rqd->id : -1,
> >                             sched_unit_master(unit),
> >                             c2rqd(sched_unit_master(unit))->id);
> >                     WARN_ON(1);
> >                 }
> >             }
> >         }
> >     }
> >=20
> > It appears that restore_vcpu_affinity() is responsible, specifically
> > this part:
> >=20
> > 1216         /*
> > 1217          * Re-assign the initial processor as after resume we have=
 no
> > 1218          * guarantee the old processor has come back to life again.
> > 1219          *
> > 1220          * Therefore, here, before actually unpausing the domains,=
 we should
> > 1221          * set v->processor of each of their vCPUs to something th=
at will
> > 1222          * make sense for the scheduler of the cpupool in which th=
ey are in.
> > 1223          */
> > ...
> > 1249         res =3D get_sched_res(cpumask_any(cpumask_scratch_cpu(cpu)=
));
> > 1250         sched_set_res(unit, res);
> > 1251=20
> > 1252         spin_unlock_irq(lock);
> > 1253=20
> > 1254         /* v->processor might have changed, so reacquire the lock.=
 */
> > 1255         lock =3D unit_schedule_lock_irq(unit);
> > 1256         res =3D sched_pick_resource(unit_scheduler(unit), unit);
> > 1257         sched_set_res(unit, res);
> > 1258         spin_unlock_irq(lock);
> > 1259=20
> > 1260         if ( old_cpu !=3D sched_unit_master(unit) )
> > 1261             sched_move_irqs(unit);
> >=20
> > It calls sched_set_res() directly, which assigns sched resources, but
> > does _not_ adjust runqueues (if new pcpu happen to be assigned to
> > another runqueue than the one from previous pcpu).
> >=20
> > I have two (non exclusive) ideas here:
> > 1. If old_cpu is actually still available, do not move it at all.
> > 2. Use sched_migrate() instead of sched_set_res().
> >=20
> > Here is the patch that fixes it for me:
> > ---8<---
> > diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> > index 83455fbde1c8..dcf202d8b307 100644
> > --- a/xen/common/sched/core.c
> > +++ b/xen/common/sched/core.c
> > @@ -1246,19 +1246,29 @@ void restore_vcpu_affinity(struct domain *d)
> >              }
> >          }
> > =20
> > -        res =3D get_sched_res(cpumask_any(cpumask_scratch_cpu(cpu)));
> > +        /* Prefer old cpu if available. */
> > +        if ( cpumask_test_cpu(old_cpu, cpumask_scratch_cpu(cpu)) )
> > +            res =3D get_sched_res(old_cpu);
> > +        else
> > +            res =3D get_sched_res(cpumask_any(cpumask_scratch_cpu(cpu)=
));
> >          sched_set_res(unit, res);
> > =20
> >          spin_unlock_irq(lock);
> > =20
> > -        /* v->processor might have changed, so reacquire the lock. */
> > -        lock =3D unit_schedule_lock_irq(unit);
> > -        res =3D sched_pick_resource(unit_scheduler(unit), unit);
> > -        sched_set_res(unit, res);
> > -        spin_unlock_irq(lock);
> > -
> > +        /*
> > +         * If different cpu was chosen, it was random, let scheduler d=
o proper
> > +         * decision.
> > +         */
> >          if ( old_cpu !=3D sched_unit_master(unit) )
> > +        {
> > +            /* v->processor might have changed, so reacquire the lock.=
 */
> > +            lock =3D unit_schedule_lock_irq(unit);
> > +            res =3D sched_pick_resource(unit_scheduler(unit), unit);
> > +            sched_migrate(unit_scheduler(unit), unit, res->master_cpu);
> > +            spin_unlock_irq(lock);
> > +
> >              sched_move_irqs(unit);
> > +        }
> >      }
> > =20
> >      rcu_read_unlock(&sched_res_rculock);
> > ---8<---
> >=20
> > I have several doubts here:
> >=20
> > 1. If old_cpu is available, is sched_set_res() needed at all?
> > 2. Should both calls be changed to sched_migrate()? Currently I changed
> >    only the second one, in case scheduler could be confused about
> >    old_cpu not being available anymore.
> > 3. Are there any extra locking requirements for sched_migrate() at this
> >    stage? The long comment above sched_unit_migrate_start() suggests
> >    there might be, but I'm not sure if that's really the case during
> >    resume.
> > 4. Related to the above - should thaw_domains() be modified to call
> >    restore_vcpu_affinity() for all domains first, and unpause only
> >    later? That could reduce locking requirements, I guess.
>=20
> All questions primarily to the scheduler maintainers - forwarding
> accordingly.

Ping?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--hvm1Jo/UDaOd/PS4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmNFUecACgkQ24/THMrX
1yys5Qf7B2NMRdG9dd8xg5U0EY55HEQr+gFJFba6hJpUA/AykYhirKQkHdYchiUj
dZDgxY1O1LeJuST+zw9TEF4QmoczNwO1d9aIwSGjH+GDmcpd5MCUS0rAqNKYEd8F
/p7yTf4yc4SwhaVUY/f9EJEPsdB9rY2D9b+BhbK8Fs6aLfDA/gd+z3I+C0nlzCor
bOrDZfbCpJtgWUhmRVGZxl0ily1l8vWpeYn2wMrgPktWR5iJzc6bsAFZYtwMqOk5
ouESkOZLhb/Xe4anP7IXsvGZmu+iseRIUgfoyDAk1nh4pAporVRkW8qSOhpB5ojD
/6I2HKl5EI5jwFH1KIOgLKt9IMcahQ==
=2bdb
-----END PGP SIGNATURE-----

--hvm1Jo/UDaOd/PS4--

