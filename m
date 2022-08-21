Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9CE59B560
	for <lists+xen-devel@lfdr.de>; Sun, 21 Aug 2022 18:15:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391016.628679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPnaq-00007W-Pq; Sun, 21 Aug 2022 16:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391016.628679; Sun, 21 Aug 2022 16:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPnaq-0008Vh-N2; Sun, 21 Aug 2022 16:14:32 +0000
Received: by outflank-mailman (input) for mailman id 391016;
 Sun, 21 Aug 2022 16:14:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fiUs=YZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oPnao-0008Vb-Vx
 for xen-devel@lists.xenproject.org; Sun, 21 Aug 2022 16:14:31 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 540f7948-216c-11ed-9250-1f966e50362f;
 Sun, 21 Aug 2022 18:14:28 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 831285C0178;
 Sun, 21 Aug 2022 12:14:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sun, 21 Aug 2022 12:14:26 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 21 Aug 2022 12:14:24 -0400 (EDT)
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
X-Inumbo-ID: 540f7948-216c-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1661098466; x=
	1661184866; bh=rcHnuqZjnBm7oQZogD9jp+omWTJLPwmVOLYHYTsax+M=; b=B
	JZ1gZdvX2Ihcne2PH2aZbRpldINKmIUnhiesEwYGXb8oDoqPkkkE0VaZqx45Dgp+
	mZ2g4MMCI1NnRJ5oUQ0y9JYMe0vbkuZa4MuRDWNqe6lSuA97VEUK7rwKN6VbAIqj
	L+RQCjxELLX6x9D6P8QzPycpPnJzOdzFTy3GpuJuyK+z6ltrrp+ZgA32cV4GQ1cr
	D8gC41SOv+29okQkYArwigE46Mh5KMbbK5nkaF8G/xjUOzYqCGOWXsMS0pLScdTP
	uBoA0u2ZyBRiP0hFaggCRBBfjA9nfCvFZ05oIpZAcXVux63T6OUgxTpS/dlJyQR5
	s1rkow7SOvN5nDeAoNH2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661098466; x=1661184866; bh=rcHnuqZjnBm7oQZogD9jp+omWTJL
	PwmVOLYHYTsax+M=; b=kuxH9UsWminHkj3gnbkqrsluhucDsqkfWVmpu3sYP8St
	LW/xWKhZyAPvnWpD2VmnjO28Pa3c2sM/L/J8siSKWSzrxHv5Rh8OE1iAB55fzuWF
	JTltZUUNPmWBq9BRMJnkckW2zCcR3++e2hJ/JDRq+Mo8u5X8gShJ6mVprmc3dGmF
	qD+q9hE+00dWCOdrkKv/T+N6SE6ZT2Dtbv7rM/unFf4dEQHgcp8A6IgY/d4u+ULO
	iPrQbJA4aSvO7aOkR2xythNLsQ60nYN9bUxou687cccr+LeDqcTMHY5hGhMRFyzd
	DxjGUfV3CXZs0OQBpn8imt2mKyttUM3QIh8isCq3Bg==
X-ME-Sender: <xms:4lkCY5j4qN9eCnQoTa1k1-INl0e5H0HERyPGe_RVEG2RJBQ77M_FTQ>
    <xme:4lkCY-CEYE6L0TKx-Qz7DAC9X_RAP0JwsLJAwTfAtWmKHkt_hbovt85V0ad4jvHrQ
    seaKP6QkX1Ilg>
X-ME-Received: <xmr:4lkCY5ErWszPNNZ8jhDaUgFDX-goOfLFUz4eU0NS3dBP33FBqfFoKlY0LUOnEavaPXDr1v7f3lVuO_xjRyKF9IxbnhRCkd_u-j33>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeihedgleelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueek
    teetgefggfekudehteegieeljeejieeihfejgeevhfetgffgteeuteetueetnecuffhomh
    grihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:4lkCY-Q-GDIxbLb5rBhDkp7h_0q33295qOIZIw4jd_PFMHxWtbsQUA>
    <xmx:4lkCY2xjRwu4FcDY9ofEvW-tHZfF3W6IrblXj5sP7nQ0IDYjOZ4Szw>
    <xmx:4lkCY075LsHpixJ5MT22sWtBw7OjOD0EoEW7XxSckATPyc7qCZb2UQ>
    <xmx:4lkCY6_603NmjMm6AwNa6Eei3PBnODySj9cygIDfNoXjbgh2iSJGCg>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 21 Aug 2022 18:14:21 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Juergen Gross <jgross@suse.de>, Dario Faggioli <dfaggioli@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13 and newer
Message-ID: <YwJZ3X0HpT9w6Veh@mail-itl>
References: <fa845540-fd8e-bc63-a3af-50673dede579@citrix.com>
 <20200318221006.GS18599@mail-itl>
 <413cac496e18bcb04b0691ef633d206f3a14a8e3.camel@suse.com>
 <20200323000946.GH18599@mail-itl>
 <20200929142730.GA25731@mail-itl>
 <d243c1b5-712d-a958-0b6c-b232eb4edc80@suse.com>
 <20200929151627.GE1482@mail-itl>
 <ea53b845-5edf-a61e-62ae-7ababc30b3e0@suse.com>
 <20210131021526.GB6354@mail-itl>
 <YWHDIQC3K8J3LD8+@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/F1yDzZ+nkRqe7pw"
Content-Disposition: inline
In-Reply-To: <YWHDIQC3K8J3LD8+@mail-itl>


--/F1yDzZ+nkRqe7pw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 21 Aug 2022 18:14:21 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Juergen Gross <jgross@suse.de>, Dario Faggioli <dfaggioli@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13 and newer

On Sat, Oct 09, 2021 at 06:28:17PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Sun, Jan 31, 2021 at 03:15:30AM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Tue, Sep 29, 2020 at 05:27:48PM +0200, J=C3=BCrgen Gro=C3=9F wrote:
> > > On 29.09.20 17:16, Marek Marczykowski-G=C3=B3recki wrote:
> > > > On Tue, Sep 29, 2020 at 05:07:11PM +0200, J=C3=BCrgen Gro=C3=9F wro=
te:
> > > > > On 29.09.20 16:27, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > On Mon, Mar 23, 2020 at 01:09:49AM +0100, Marek Marczykowski-G=
=C3=B3recki wrote:
> > > > > > > On Thu, Mar 19, 2020 at 01:28:10AM +0100, Dario Faggioli wrot=
e:
> > > > > > > > [Adding Juergen]
> > > > > > > >=20
> > > > > > > > On Wed, 2020-03-18 at 23:10 +0100, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > > > > > On Wed, Mar 18, 2020 at 02:50:52PM +0000, Andrew Cooper w=
rote:
> > > > > > > > > > On 18/03/2020 14:16, Marek Marczykowski-G=C3=B3recki wr=
ote:
> > > > > > > > > > > Hi,
> > > > > > > > > > >=20
> > > > > > > > > > > In my test setup (inside KVM with nested virt enabled=
), I rather
> > > > > > > > > > > frequently get Xen crash on resume from S3. Full mess=
age below.
> > > > > > > > > > >=20
> > > > > > > > > > > This is Xen 4.13.0, with some patches, including "sch=
ed: fix
> > > > > > > > > > > resuming
> > > > > > > > > > > from S3 with smt=3D0".
> > > > > > > > > > >=20
> > > > > > > > > > > Contrary to the previous issue, this one does not hap=
pen always -
> > > > > > > > > > > I
> > > > > > > > > > > would say in about 40% cases on this setup, but very =
rarely on
> > > > > > > > > > > physical
> > > > > > > > > > > setup.
> > > > > > > > > > >=20
> > > > > > > > > > > This is _without_ core scheduling enabled, and also w=
ith smt=3Doff.
> > > > > > > > > > >=20
> > > > > > > > > > > Do you think it would be any different on xen-unstabl=
e? I cat
> > > > > > > > > > > try, but
> > > > > > > > > > > it isn't trivial in this setup, so I'd ask first.
> > > > > > > > > > >=20
> > > > > > > > Well, Juergen has fixed quite a few issues.
> > > > > > > >=20
> > > > > > > > Most of them where triggering with core-scheduling enabled,=
 and I don't
> > > > > > > > recall any of them which looked similar or related to this.
> > > > > > > >=20
> > > > > > > > Still, it's possible that the same issue causes different s=
ymptoms, and
> > > > > > > > hence that maybe one of the patches would fix this too.
> > > > > > >=20
> > > > > > > I've tested on master (d094e95fb7c), and reproduced exactly t=
he same crash
> > > > > > > (pasted below for the completeness).
> > > > > > > But there is more: additionally, in most (all?) cases after r=
esume I've got
> > > > > > > soft lockup in Linux dom0 in smp_call_function_single() - see=
 below. It
> > > > > > > didn't happened before and the only change was Xen 4.13 -> ma=
ster.
> > > > > > >=20
> > > > > > > Xen crash:
> > > > > > >=20
> > > > > > > (XEN) Assertion 'c2rqd(sched_unit_master(unit)) =3D=3D svc->r=
qd' failed at credit2.c:2133
> > > > > >=20
> > > > > > Juergen, any idea about this one? This is also happening on the=
 current
> > > > > > stable-4.14 (28855ebcdbfa).
> > > > > >=20
> > > > >=20
> > > > > Oh, sorry I didn't come back to this issue.
> > > > >=20
> > > > > I suspect this is related to stop_machine_run() being called duri=
ng
> > > > > suspend(), as I'm seeing very sporadic issues when offlining and =
then
> > > > > onlining cpus with core scheduling being active (it seems as if t=
he
> > > > > dom0 vcpu doing the cpu online activity sometimes is using an old
> > > > > vcpu state).
> > > >=20
> > > > Note this is default Xen 4.14 start, so core scheduling is _not_ ac=
tive:
> > >=20
> > > The similarity in the two failure cases is that multiple cpus are
> > > affected by the operations during stop_machine_run().
> > >=20
> > > >=20
> > > >      (XEN) Brought up 2 CPUs
> > > >      (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
> > > >      (XEN) Adding cpu 0 to runqueue 0
> > > >      (XEN)  First cpu on runqueue, activating
> > > >      (XEN) Adding cpu 1 to runqueue 1
> > > >      (XEN)  First cpu on runqueue, activating
> > > >=20
> > > > > I wasn't able to catch the real problem despite of having tried l=
ots
> > > > > of approaches using debug patches.
> > > > >=20
> > > > > Recently I suspected the whole problem could be somehow related to
> > > > > RCU handling, as stop_machine_run() is relying on tasklets which =
are
> > > > > executing in idle context, and RCU handling is done in idle conte=
xt,
> > > > > too. So there might be some kind of use after free scenario in ca=
se
> > > > > some memory is freed via RCU despite it still being used by a tas=
klet.
> > > >=20
> > > > That sounds plausible, even though I don't really know this area of=
 Xen.
> > > >=20
> > > > > I "just" need to find some time to verify this suspicion. Any hel=
p doing
> > > > > this would be appreciated. :-)
> > > >=20
> > > > I do have a setup where I can easily-ish reproduce the issue. If th=
ere
> > > > is some debug patch you'd like me to try, I can do that.
> > >=20
> > > Thanks. I might come back to that offer as you are seeing a crash whi=
ch
> > > will be much easier to analyze. Catching my error case is much harder=
 as
> > > it surfaces some time after the real problem in a non destructive way
> > > (usually I'm seeing a failure to load a library in the program which
> > > just did its job via exactly the library claiming not being loadable).
> >=20
> > Hi,
> >=20
> > I'm resurrecting this thread as it was recently mentioned elsewhere. I
> > can still reproduce the issue on the recent staging branch (9dc687f155).
> >=20
> > It fails after the first resume (not always, but frequent enough to
> > debug it). At least one guest needs to be running - with just (PV) dom0
> > the crash doesn't happen (at least for the ~8 times in a row I tried).
> > If the first resume works, the second (almost?) always will fail but
> > with a different symptoms - dom0 kernel lockups (at least some of its
> > vcpus). I haven't debugged this one yet at all.
> >=20
> > Any help will be appreciated, I can apply some debug patches, change
> > configuration etc.
>=20
> This still happens on 4.14.3. Maybe it is related to freeing percpu
> areas, as it caused other issues with suspend too? Just a thought...

I have reproduced this on current staging(*). And I can reproduce it
reliably. And also, I got (I believe) closely related crash with credit1
scheduler.

(*) It isn't plain staging, it's one with my xhci console patches on
top, including attempt to make it survive S3. I believe the only
relevant part there is sticking set_timer() into console resume path (or
just having a timer with rather short delay registered). The actual tree
at https://github.com/marmarek/xen/tree/master-xue2-debug, including
quite a lot of debug prints and debug hacks.

Specific crash with credit2:

    (XEN) Assertion 'sched_unit_master(currunit) =3D=3D cpu' failed at comm=
on/sched/credit.c:928
    (XEN) ----[ Xen-4.17-unstable  x86_64  debug=3Dy  Tainted:   C    ]----
    (XEN) CPU:    0
    (XEN) RIP:    e008:[<ffff82d0402434bf>] credit.c#csched_tick+0x2d4/0x494
    (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d0v4)
    (XEN) rax: ffff82d0405c4298   rbx: 0000000000000002   rcx: 000000000000=
0002
    (XEN) rdx: ffff8302517f64d0   rsi: ffff8302515c0fc0   rdi: 000000000000=
0002
    (XEN) rbp: ffff830256227e38   rsp: ffff830256227de0   r8:  000000000000=
0004
    (XEN) r9:  ffff8302517ac820   r10: ffff830251745068   r11: 00000088cb73=
4887
    (XEN) r12: ffff83025174de50   r13: ffff8302515c0fa0   r14: ffff83025174=
df40
    (XEN) r15: ffff8302515c0cc0   cr0: 0000000080050033   cr4: 000000000037=
2660
    (XEN) cr3: 00000001bacbd000   cr2: 000077e5ec02a318
    (XEN) fsb: 000077e5fe533700   gsb: ffff888255700000   gss: 000000000000=
0000
    (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
    (XEN) Xen code around <ffff82d0402434bf> (credit.c#csched_tick+0x2d4/0x=
494):
    (XEN)  01 00 00 e9 2a 01 00 00 <0f> 0b 0f 0b 0f 0b 48 8b 41 20 0f b7 00=
 89 45 cc
    (XEN) Xen stack trace from rsp=3Dffff830256227de0:
    (XEN)    ffff830256227fff 0000000000000000 0000000256227e10 ffff82d0403=
5be90
    (XEN)    ffff830256227ef8 ffff830251745000 ffff82d0405c3280 ffff82d0402=
431eb
    (XEN)    0000000000000002 00000088c9ba9534 0000000000000000 ffff8302562=
27e60
    (XEN)    ffff82d04022ee53 ffff82d0405c3280 ffff8302963e1320 ffff8302515=
c0fc0
    (XEN)    ffff830256227ea0 ffff82d04022f73f ffff830256227e80 ffff82d0405=
c9f00
    (XEN)    ffffffffffffffff ffff82d0405c9f00 ffff830256227fff 00000000000=
00000
    (XEN)    ffff830256227ed8 ffff82d04022d26c ffff830251745000 00000000000=
00000
    (XEN)    0000000000000000 ffff830256227fff 0000000000000000 ffff8302562=
27ee8
    (XEN)    ffff82d04022d2ff 00007cfda9dd80e7 ffff82d0402f03c6 ffff88810c0=
05c00
    (XEN)    0000000000000031 0000000000000100 00000000fffffe00 00000000000=
00031
    (XEN)    0000000000000031 ffffffff82d45d28 0000000000000e2e 00000000000=
00000
    (XEN)    0000000000000032 00000000ffffef31 0000000000000000 ffff8881224=
4a700
    (XEN)    0000000000000005 ffff88812244a780 000000fa00000000 ffffffff818=
db55f
    (XEN)    000000000000e033 0000000000000246 ffffc900409b7c50 00000000000=
0e02b
    (XEN)    0000000000000000 0000000000000000 0000000000000000 00000000000=
00000
    (XEN)    0000e01000000000 ffff830251745000 0000000000000000 00000000003=
72660
    (XEN)    0000000000000000 800000025620b002 000e030300000001 00000000000=
00000
    (XEN) Xen call trace:
    (XEN)    [<ffff82d0402434bf>] R credit.c#csched_tick+0x2d4/0x494
    (XEN)    [<ffff82d04022ee53>] F timer.c#execute_timer+0x45/0x5c
    (XEN)    [<ffff82d04022f73f>] F timer.c#timer_softirq_action+0x71/0x278
    (XEN)    [<ffff82d04022d26c>] F softirq.c#__do_softirq+0x94/0xbe
    (XEN)    [<ffff82d04022d2ff>] F do_softirq+0x13/0x15
    (XEN)    [<ffff82d0402f03c6>] F x86_64/entry.S#process_softirqs+0x6/0x20
    (XEN)=20
    (XEN)=20
    (XEN) ****************************************
    (XEN) Panic on CPU 0:
    (XEN) Assertion 'sched_unit_master(currunit) =3D=3D cpu' failed at comm=
on/sched/credit.c:928
    (XEN) ****************************************

Specific crash with credit1:

    (XEN) ASSERT FAIL! cpu 4, sched_unit_master 0, currunit id 4
    (XEN) Assertion 'sched_unit_master(currunit) =3D=3D cpu' failed at comm=
on/sched/credit.c:936
    (XEN) ----[ Xen-4.17-unstable  x86_64  debug=3Dy  Tainted:   C    ]----
    (XEN) CPU:    0
    (XEN) RIP:    e008:[<ffff82d04024355c>] credit.c#csched_tick+0x2f7/0x4b7
    (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d0v4)
    (XEN) rax: ffff8302517f64d0   rbx: 0000000000000004   rcx: 000000000000=
0000
    (XEN) rdx: ffff830256227fff   rsi: 000000000000000a   rdi: ffff82d04047=
86b8
    (XEN) rbp: ffff830256227e38   rsp: ffff830256227de0   r8:  000000000000=
0087
    (XEN) r9:  0000000000000001   r10: 0000000000000001   r11: 000000000000=
0004
    (XEN) r12: ffff83025174de50   r13: ffff830251778100   r14: ffff83025174=
df40
    (XEN) r15: ffff8302515c0cc0   cr0: 0000000080050033   cr4: 000000000037=
2660
    (XEN) cr3: 000000024ac10000   cr2: 0000000000000000
    (XEN) fsb: 0000000000000000   gsb: ffff888255700000   gss: 000000000000=
0000
    (XEN) ds: 002b   es: 002b   fs: 0000   gs: 0000   ss: 0000   cs: e008
    (XEN) Xen code around <ffff82d04024355c> (credit.c#csched_tick+0x2f7/0x=
4b7):
    (XEN)  58 70 0f 84 bf fe ff ff <0f> 0b 0f 0b 0f 0b 48 8b 40 20 0f b7 00=
 89 45 cc
    (XEN) Xen stack trace from rsp=3Dffff830256227de0:
    (XEN)    000000000046692a ffff8302515c0bc0 000000044025ae27 002191c0517=
f64e8
    (XEN)    ffff82d0405c33e0 ffff8302517c8590 ffff82d0405c3280 ffff82d0402=
43265
    (XEN)    0000000000000004 00000026d27a80a7 0000000000000000 ffff8302562=
27e60
    (XEN)    ffff82d04022ee94 ffff82d0405c3280 ffff8302517e7df0 ffff8302517=
78120
    (XEN)    ffff830256227ea0 ffff82d04022f77a ffff830256227e80 ffff82d0405=
c9f00
    (XEN)    ffffffffffffffff ffff82d0405c9f00 ffff830256227fff 00000000000=
00000
    (XEN)    ffff830256227ed8 ffff82d04022d26c ffff830251745000 00000000000=
00000
    (XEN)    0000000000000000 ffff830256227fff 0000000000000000 ffff8302562=
27ee8
    (XEN)    ffff82d04022d2ff 00007cfda9dd80e7 ffff82d0402f0496 00000000000=
00001
    (XEN)    ffffc90040127ddc ffffc90040127dd0 ffffc90040127dd4 ffffc900401=
27dd8
    (XEN)    00000000756e6547 0000000000000000 0000000000000000 ffffc900401=
27ddc
    (XEN)    ffffc90040127dd0 000000000000000d 000000006c65746e 00000000496=
56e69
    (XEN)    ffffc90040127dd4 ffffc90040127dd8 000000fa00000000 ffffffff810=
1c5a4
    (XEN)    000000000000e033 0000000000000293 ffffc90040127db8 00000000000=
0e02b
    (XEN)    0000000000000000 0000000000000000 0000000000000000 00000000000=
00000
    (XEN)    0000e01000000000 ffff830251745000 0000000000000000 00000000003=
72660
    (XEN)    0000000000000000 800000025620b002 000e030300000001 00000000000=
00000
    (XEN) Xen call trace:
    (XEN)    [<ffff82d04024355c>] R credit.c#csched_tick+0x2f7/0x4b7
    (XEN)    [<ffff82d04022ee94>] F timer.c#execute_timer+0x45/0x5c
    (XEN)    [<ffff82d04022f77a>] F timer.c#timer_softirq_action+0x71/0x278
    (XEN)    [<ffff82d04022d26c>] F softirq.c#__do_softirq+0x94/0xbe
    (XEN)    [<ffff82d04022d2ff>] F do_softirq+0x13/0x15 =20
    (XEN)    [<ffff82d0402f0496>] F x86_64/entry.S#process_softirqs+0x6/0x20
    (XEN)
    (XEN) ****************************************
    (XEN) Panic on CPU 0:
    (XEN) Assertion 'sched_unit_master(currunit) =3D=3D cpu' failed at comm=
on/sched/credit.c:936
    (XEN) ****************************************

I'm not sure about the nature of credit2 crash, but for credit1 it looks
much simpler to understand. Credit1 registers a timer for each pcpu (in
init_pdata()). Then, the timer function
(csched_tick()->csched_unit_acct()) asserts if it was really called on
correct CPU. The issue is that suspend path migrates all timers to CPU0
(timerc.:cpu_callback->migrate_timers_from_cpu()), and restore path
doesn't migrate them back. All this while not unregistering pCPUs from
the scheduler (sched_deinit_pdata() / init_pdata() is not called -
confirmed via debug prints).

I'm not exactly sure if that's the same issue that applies to credit2,
but I think it's likely. A naive fix could be unregistering all pCPUs
=66rom the scheduler (an registering them back on resume), but this may
mess up CPU pools, and probably few other things. Any better ideas? I
can test various patches, provide more debug info etc - should be rather
straightforward given I have reliable reproducer now.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--/F1yDzZ+nkRqe7pw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmMCWd0ACgkQ24/THMrX
1yxA2Qf8DLHOlgbWeqXUxRxzol+sc48yir6gQ7aYjNPpJFr+daE6Px3EA55QaTdq
bj4jtI4WHSYsfc7xRBtBabfuwlASVra5hkwYc20irV07I52RvE0b64FZfssvZnwR
18faD2wPDq75xl6WP3B1BHpc67WPjFFqGVtFRKSdz9t4R7San2KRZB9zaRSX7mNA
tSS8mZ9uVOsC7GSO7GfoMhpG8O3LZ5863iqSFBzCMbC0w7nKVChzpgV4W5sBvgQx
/3jgBJn+4BFrsFLdgnU+QnX7FD5/liW+iYERIKrLjIaHNa4blBW6Tan7kNDmQjVF
4vULuwTwxyxeS+xfad4caDj3L2BggQ==
=fc++
-----END PGP SIGNATURE-----

--/F1yDzZ+nkRqe7pw--

