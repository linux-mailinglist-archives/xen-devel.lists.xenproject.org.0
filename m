Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 072B259BD43
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 12:00:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391310.629086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ4Ea-0003B4-5N; Mon, 22 Aug 2022 10:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391310.629086; Mon, 22 Aug 2022 10:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ4Ea-00039C-2Q; Mon, 22 Aug 2022 10:00:40 +0000
Received: by outflank-mailman (input) for mailman id 391310;
 Mon, 22 Aug 2022 10:00:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YSJC=Y2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oQ4EX-0002yL-N2
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 10:00:38 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43ac5768-2201-11ed-9250-1f966e50362f;
 Mon, 22 Aug 2022 12:00:35 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id A4ACE3200956;
 Mon, 22 Aug 2022 06:00:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 22 Aug 2022 06:00:33 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Aug 2022 06:00:30 -0400 (EDT)
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
X-Inumbo-ID: 43ac5768-2201-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1661162432; x=
	1661248832; bh=SqiJO05mCS/vaEij4EWYIwBIQ2OzY4Sb5qGlUoKuGQQ=; b=j
	4b7kdCtN9nMWCZcVhHfzOe0Xzx8IbutpJ/uKAJAGR8O7qwsnkSp8ABIjA5Hu7nqX
	UWbe6YUjaI0MGJd6YHvOBC3k45pvabI6VBNfeXUTFOngpr9zTFFDGPJtJ0P1JWfY
	qlQV/xxlOjhb1W4T9hqWOHDu3w4viYWvgGigTQdBKrmkiDZVZlTFI/C3sIIIYETX
	AA+8V9Fc5mtinSxW4GXdLclBpGxliJVgwY1nTFUjuGXxEcNyOmwU30JNB4tJE4JN
	50vfOKerDnTjLoMwqL4Q1yytXBO3tF2Km+e0jgB82mK9z0dILyMcTwdQrov4W7uL
	W2JyovnqeOag5sBUJAuJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661162432; x=1661248832; bh=SqiJO05mCS/vaEij4EWYIwBIQ2Oz
	Y4Sb5qGlUoKuGQQ=; b=JBVeJyBSwAvNaXHnWUY1yCC+N9ugth/i8jxyGaDUfL2B
	L7+PqYBovhCHvvNlcysPaeG+sB7teKwVoxRVUddrJZY4o2Cj2nuYbbHRG2LputLs
	uXaAzIyXPgh4849WiJY4sy2w0WpXnrorNpQDjtkY+XsAIuYMLOSM8FJITBunyc2Z
	wHChlJmp2hNwHJic01gadyBN6e2Uv9Mk/LUNDwYM0okdE7ZvQLcxsAe4ZULyss2/
	wx+BsUGNj5ckcSQRajQ7StBSBSAi/PBsaMYM43gx+SOdH8o+KUUVZNIQ5auB/ivN
	k6Sp44a36CpQwQNpOSUKKbXeXSZZr8EZ9q3TkjTl7A==
X-ME-Sender: <xms:v1MDY49cMsc6e0TBj0WDPdIB6QYFqI8lrG-cewnGbVYylowTaoMp-Q>
    <xme:v1MDYwv_Y62io-PpiuLLoQe89b4xo2sm6YTgvzMc96vzMXKK7JrHkua8asjJ5B9UJ
    fmTMObKCLlrvQ>
X-ME-Received: <xmr:v1MDY-DRO0oG7uJ5ZUMkXRWW6jeSzQZPs3IYLjM2wJtn2ht7D8vMcakCCsCN0m4PoWuqKTcfbhRpLSCRKmHey4or0KBXFHiaP7hr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeijedgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueek
    teetgefggfekudehteegieeljeejieeihfejgeevhfetgffgteeuteetueetnecuffhomh
    grihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:wFMDY4cIa1msNgrde9hPs66ASzuWSMWs0EztZEtM2ITnP4rgzPQu9Q>
    <xmx:wFMDY9Ov82ZVopXTRYF2AtLblOAyRZaD24GGKP0FmWbTX5Bv-ggm7A>
    <xmx:wFMDYykLJFc1qoRGGsdZfR5Qj2Hw8VFLp-D74r-ndxNSX87GT6hejA>
    <xmx:wFMDY-pMKZirln8DHiFwrx6K4g9LeV9h9eKr6M7Tdsi_jLYgS1vR8Q>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 22 Aug 2022 12:00:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.de>, Dario Faggioli <dfaggioli@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13 and newer
Message-ID: <YwNTu1fL7uITg0OZ@mail-itl>
References: <413cac496e18bcb04b0691ef633d206f3a14a8e3.camel@suse.com>
 <20200323000946.GH18599@mail-itl>
 <20200929142730.GA25731@mail-itl>
 <d243c1b5-712d-a958-0b6c-b232eb4edc80@suse.com>
 <20200929151627.GE1482@mail-itl>
 <ea53b845-5edf-a61e-62ae-7ababc30b3e0@suse.com>
 <20210131021526.GB6354@mail-itl>
 <YWHDIQC3K8J3LD8+@mail-itl>
 <YwJZ3X0HpT9w6Veh@mail-itl>
 <b1df84d5-a1ca-3019-16a7-36d0bb568779@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="beQDCF4MHbKoMK6Q"
Content-Disposition: inline
In-Reply-To: <b1df84d5-a1ca-3019-16a7-36d0bb568779@suse.com>


--beQDCF4MHbKoMK6Q
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Aug 2022 12:00:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.de>, Dario Faggioli <dfaggioli@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13 and newer

On Mon, Aug 22, 2022 at 11:53:50AM +0200, Jan Beulich wrote:
> On 21.08.2022 18:14, Marek Marczykowski-G=C3=B3recki wrote:
> > On Sat, Oct 09, 2021 at 06:28:17PM +0200, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> >> On Sun, Jan 31, 2021 at 03:15:30AM +0100, Marek Marczykowski-G=C3=B3re=
cki wrote:
> >>> On Tue, Sep 29, 2020 at 05:27:48PM +0200, J=C3=BCrgen Gro=C3=9F wrote:
> >>>> On 29.09.20 17:16, Marek Marczykowski-G=C3=B3recki wrote:
> >>>>> On Tue, Sep 29, 2020 at 05:07:11PM +0200, J=C3=BCrgen Gro=C3=9F wro=
te:
> >>>>>> On 29.09.20 16:27, Marek Marczykowski-G=C3=B3recki wrote:
> >>>>>>> On Mon, Mar 23, 2020 at 01:09:49AM +0100, Marek Marczykowski-G=C3=
=B3recki wrote:
> >>>>>>>> On Thu, Mar 19, 2020 at 01:28:10AM +0100, Dario Faggioli wrote:
> >>>>>>>>> [Adding Juergen]
> >>>>>>>>>
> >>>>>>>>> On Wed, 2020-03-18 at 23:10 +0100, Marek Marczykowski-G=C3=B3re=
cki wrote:
> >>>>>>>>>> On Wed, Mar 18, 2020 at 02:50:52PM +0000, Andrew Cooper wrote:
> >>>>>>>>>>> On 18/03/2020 14:16, Marek Marczykowski-G=C3=B3recki wrote:
> >>>>>>>>>>>> Hi,
> >>>>>>>>>>>>
> >>>>>>>>>>>> In my test setup (inside KVM with nested virt enabled), I ra=
ther
> >>>>>>>>>>>> frequently get Xen crash on resume from S3. Full message bel=
ow.
> >>>>>>>>>>>>
> >>>>>>>>>>>> This is Xen 4.13.0, with some patches, including "sched: fix
> >>>>>>>>>>>> resuming
> >>>>>>>>>>>> from S3 with smt=3D0".
> >>>>>>>>>>>>
> >>>>>>>>>>>> Contrary to the previous issue, this one does not happen alw=
ays -
> >>>>>>>>>>>> I
> >>>>>>>>>>>> would say in about 40% cases on this setup, but very rarely =
on
> >>>>>>>>>>>> physical
> >>>>>>>>>>>> setup.
> >>>>>>>>>>>>
> >>>>>>>>>>>> This is _without_ core scheduling enabled, and also with smt=
=3Doff.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Do you think it would be any different on xen-unstable? I cat
> >>>>>>>>>>>> try, but
> >>>>>>>>>>>> it isn't trivial in this setup, so I'd ask first.
> >>>>>>>>>>>>
> >>>>>>>>> Well, Juergen has fixed quite a few issues.
> >>>>>>>>>
> >>>>>>>>> Most of them where triggering with core-scheduling enabled, and=
 I don't
> >>>>>>>>> recall any of them which looked similar or related to this.
> >>>>>>>>>
> >>>>>>>>> Still, it's possible that the same issue causes different sympt=
oms, and
> >>>>>>>>> hence that maybe one of the patches would fix this too.
> >>>>>>>>
> >>>>>>>> I've tested on master (d094e95fb7c), and reproduced exactly the =
same crash
> >>>>>>>> (pasted below for the completeness).
> >>>>>>>> But there is more: additionally, in most (all?) cases after resu=
me I've got
> >>>>>>>> soft lockup in Linux dom0 in smp_call_function_single() - see be=
low. It
> >>>>>>>> didn't happened before and the only change was Xen 4.13 -> maste=
r.
> >>>>>>>>
> >>>>>>>> Xen crash:
> >>>>>>>>
> >>>>>>>> (XEN) Assertion 'c2rqd(sched_unit_master(unit)) =3D=3D svc->rqd'=
 failed at credit2.c:2133
> >>>>>>>
> >>>>>>> Juergen, any idea about this one? This is also happening on the c=
urrent
> >>>>>>> stable-4.14 (28855ebcdbfa).
> >>>>>>>
> >>>>>>
> >>>>>> Oh, sorry I didn't come back to this issue.
> >>>>>>
> >>>>>> I suspect this is related to stop_machine_run() being called during
> >>>>>> suspend(), as I'm seeing very sporadic issues when offlining and t=
hen
> >>>>>> onlining cpus with core scheduling being active (it seems as if the
> >>>>>> dom0 vcpu doing the cpu online activity sometimes is using an old
> >>>>>> vcpu state).
> >>>>>
> >>>>> Note this is default Xen 4.14 start, so core scheduling is _not_ ac=
tive:
> >>>>
> >>>> The similarity in the two failure cases is that multiple cpus are
> >>>> affected by the operations during stop_machine_run().
> >>>>
> >>>>>
> >>>>>      (XEN) Brought up 2 CPUs
> >>>>>      (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
> >>>>>      (XEN) Adding cpu 0 to runqueue 0
> >>>>>      (XEN)  First cpu on runqueue, activating
> >>>>>      (XEN) Adding cpu 1 to runqueue 1
> >>>>>      (XEN)  First cpu on runqueue, activating
> >>>>>
> >>>>>> I wasn't able to catch the real problem despite of having tried lo=
ts
> >>>>>> of approaches using debug patches.
> >>>>>>
> >>>>>> Recently I suspected the whole problem could be somehow related to
> >>>>>> RCU handling, as stop_machine_run() is relying on tasklets which a=
re
> >>>>>> executing in idle context, and RCU handling is done in idle contex=
t,
> >>>>>> too. So there might be some kind of use after free scenario in case
> >>>>>> some memory is freed via RCU despite it still being used by a task=
let.
> >>>>>
> >>>>> That sounds plausible, even though I don't really know this area of=
 Xen.
> >>>>>
> >>>>>> I "just" need to find some time to verify this suspicion. Any help=
 doing
> >>>>>> this would be appreciated. :-)
> >>>>>
> >>>>> I do have a setup where I can easily-ish reproduce the issue. If th=
ere
> >>>>> is some debug patch you'd like me to try, I can do that.
> >>>>
> >>>> Thanks. I might come back to that offer as you are seeing a crash wh=
ich
> >>>> will be much easier to analyze. Catching my error case is much harde=
r as
> >>>> it surfaces some time after the real problem in a non destructive way
> >>>> (usually I'm seeing a failure to load a library in the program which
> >>>> just did its job via exactly the library claiming not being loadable=
).
> >>>
> >>> Hi,
> >>>
> >>> I'm resurrecting this thread as it was recently mentioned elsewhere. I
> >>> can still reproduce the issue on the recent staging branch (9dc687f15=
5).
> >>>
> >>> It fails after the first resume (not always, but frequent enough to
> >>> debug it). At least one guest needs to be running - with just (PV) do=
m0
> >>> the crash doesn't happen (at least for the ~8 times in a row I tried).
> >>> If the first resume works, the second (almost?) always will fail but
> >>> with a different symptoms - dom0 kernel lockups (at least some of its
> >>> vcpus). I haven't debugged this one yet at all.
> >>>
> >>> Any help will be appreciated, I can apply some debug patches, change
> >>> configuration etc.
> >>
> >> This still happens on 4.14.3. Maybe it is related to freeing percpu
> >> areas, as it caused other issues with suspend too? Just a thought...
> >=20
> > I have reproduced this on current staging(*). And I can reproduce it
> > reliably. And also, I got (I believe) closely related crash with credit1
> > scheduler.
> >=20
> > (*) It isn't plain staging, it's one with my xhci console patches on
> > top, including attempt to make it survive S3. I believe the only
> > relevant part there is sticking set_timer() into console resume path (or
> > just having a timer with rather short delay registered). The actual tree
> > at https://github.com/marmarek/xen/tree/master-xue2-debug, including
> > quite a lot of debug prints and debug hacks.
> >=20
> > Specific crash with credit2:
>=20
> Are you sure this is Credit2? Both ...
>=20
> >     (XEN) Assertion 'sched_unit_master(currunit) =3D=3D cpu' failed at =
common/sched/credit.c:928
>=20
> ... here and ...
>=20
> >     (XEN) ----[ Xen-4.17-unstable  x86_64  debug=3Dy  Tainted:   C    ]=
----
> >     (XEN) CPU:    0
> >     (XEN) RIP:    e008:[<ffff82d0402434bf>] credit.c#csched_tick+0x2d4/=
0x494
> >     (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d0v4)
> >     (XEN) rax: ffff82d0405c4298   rbx: 0000000000000002   rcx: 00000000=
00000002
> >     (XEN) rdx: ffff8302517f64d0   rsi: ffff8302515c0fc0   rdi: 00000000=
00000002
> >     (XEN) rbp: ffff830256227e38   rsp: ffff830256227de0   r8:  00000000=
00000004
> >     (XEN) r9:  ffff8302517ac820   r10: ffff830251745068   r11: 00000088=
cb734887
> >     (XEN) r12: ffff83025174de50   r13: ffff8302515c0fa0   r14: ffff8302=
5174df40
> >     (XEN) r15: ffff8302515c0cc0   cr0: 0000000080050033   cr4: 00000000=
00372660
> >     (XEN) cr3: 00000001bacbd000   cr2: 000077e5ec02a318
> >     (XEN) fsb: 000077e5fe533700   gsb: ffff888255700000   gss: 00000000=
00000000
> >     (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e0=
08
> >     (XEN) Xen code around <ffff82d0402434bf> (credit.c#csched_tick+0x2d=
4/0x494):
> >     (XEN)  01 00 00 e9 2a 01 00 00 <0f> 0b 0f 0b 0f 0b 48 8b 41 20 0f b=
7 00 89 45 cc
> >     (XEN) Xen stack trace from rsp=3Dffff830256227de0:
> >     (XEN)    ffff830256227fff 0000000000000000 0000000256227e10 ffff82d=
04035be90
> >     (XEN)    ffff830256227ef8 ffff830251745000 ffff82d0405c3280 ffff82d=
0402431eb
> >     (XEN)    0000000000000002 00000088c9ba9534 0000000000000000 ffff830=
256227e60
> >     (XEN)    ffff82d04022ee53 ffff82d0405c3280 ffff8302963e1320 ffff830=
2515c0fc0
> >     (XEN)    ffff830256227ea0 ffff82d04022f73f ffff830256227e80 ffff82d=
0405c9f00
> >     (XEN)    ffffffffffffffff ffff82d0405c9f00 ffff830256227fff 0000000=
000000000
> >     (XEN)    ffff830256227ed8 ffff82d04022d26c ffff830251745000 0000000=
000000000
> >     (XEN)    0000000000000000 ffff830256227fff 0000000000000000 ffff830=
256227ee8
> >     (XEN)    ffff82d04022d2ff 00007cfda9dd80e7 ffff82d0402f03c6 ffff888=
10c005c00
> >     (XEN)    0000000000000031 0000000000000100 00000000fffffe00 0000000=
000000031
> >     (XEN)    0000000000000031 ffffffff82d45d28 0000000000000e2e 0000000=
000000000
> >     (XEN)    0000000000000032 00000000ffffef31 0000000000000000 ffff888=
12244a700
> >     (XEN)    0000000000000005 ffff88812244a780 000000fa00000000 fffffff=
f818db55f
> >     (XEN)    000000000000e033 0000000000000246 ffffc900409b7c50 0000000=
00000e02b
> >     (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000=
000000000
> >     (XEN)    0000e01000000000 ffff830251745000 0000000000000000 0000000=
000372660
> >     (XEN)    0000000000000000 800000025620b002 000e030300000001 0000000=
000000000
> >     (XEN) Xen call trace:
> >     (XEN)    [<ffff82d0402434bf>] R credit.c#csched_tick+0x2d4/0x494
> >     (XEN)    [<ffff82d04022ee53>] F timer.c#execute_timer+0x45/0x5c
> >     (XEN)    [<ffff82d04022f73f>] F timer.c#timer_softirq_action+0x71/0=
x278
> >     (XEN)    [<ffff82d04022d26c>] F softirq.c#__do_softirq+0x94/0xbe
> >     (XEN)    [<ffff82d04022d2ff>] F do_softirq+0x13/0x15
> >     (XEN)    [<ffff82d0402f03c6>] F x86_64/entry.S#process_softirqs+0x6=
/0x20
>=20
> ... here the only references are to credit.c, i.e. Credit1 code.

Wrong paste, sorry, this is the credit2 one:

(XEN) Assertion 'c2rqd(sched_unit_master(unit)) =3D=3D svc->rqd' failed at =
common/sched/credit2.c:2274
(XEN) ----[ Xen-4.17-unstable  x86_64  debug=3Dy  Tainted:   C    ]----
(XEN) CPU:    10
(XEN) RIP:    e008:[<ffff82d040247a4d>] credit2.c#csched2_unit_wake+0x152/0=
x154
(XEN) RFLAGS: 0000000000010083   CONTEXT: hypervisor (d0v0)
(XEN) rax: ffff830251778230   rbx: ffff830251768cb0   rcx: 00000032111d6000
(XEN) rdx: ffff8302515c1eb0   rsi: 0000000000000006   rdi: ffff830251769000
(XEN) rbp: ffff8302515cfd90   rsp: ffff8302515cfd70   r8:  ffff830251769000
(XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
(XEN) r12: ffff830251768dd0   r13: ffff8302515c1d00   r14: 0000000000000006
(XEN) r15: ffff82d0405ddb40   cr0: 0000000080050033   cr4: 0000000000372660
(XEN) cr3: 000000022f2a1000   cr2: ffff8881012738e0
(XEN) fsb: 0000744bf6a0db80   gsb: ffff888255600000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <ffff82d040247a4d> (credit2.c#csched2_unit_wake+0x152=
/0x154):
(XEN)  df e8 6f bf ff ff eb ad <0f> 0b f3 0f 1e fa 55 48 89 e5 41 57 41 56 =
41 55
(XEN) Xen stack trace from rsp=3Dffff8302515cfd70:
(XEN)    ffff83025174b000 ffff830251768cb0 ffff830251778270 ffff82d0405c4298
(XEN)    ffff8302515cfdd8 ffff82d04024fcb8 0000000000000202 ffff830251778270
(XEN)    ffff83025174b000 0000000000000001 ffff830251769018 0000000000000000
(XEN)    0000000000000000 ffff8302515cfe48 ffff82d04020a8c9 ffff8882556aedc0
(XEN)    0000000000000003 00001910537e623e 0000000b988f78a6 0000000059d4a716
(XEN)    00001901f30fa41e 0000000217f96af6 0000000000000000 ffff83025174b000
(XEN)    ffff830251756000 0000000000000002 0000000000000001 ffff8302515cfe70
(XEN)    ffff82d0402f7968 ffff830251756000 ffff8302515cfef8 0000000000000018
(XEN)    ffff8302515cfee8 ffff82d0402ec6de 0000000000000000 ffffffff82f157e0
(XEN)    0000000000000000 0000000000000000 ffff8302515cfef8 0000000000000000
(XEN)    0000000000000000 ffff8302515cffff ffff830251756000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 00007cfdaea300e7
(XEN)    ffff82d0402012bd 0000000000000000 ffffffff82c51120 ffff88810036cf00
(XEN)    0000000000000002 000000000001e120 0000000000000002 0000000000000246
(XEN)    ffffffff82f157e0 0000000000000001 0000000000000000 0000000000000018
(XEN)    ffffffff81e4a30a 0000000000000000 0000000000000002 0000000000000001
(XEN)    0000010000000000 ffffffff81e4a30a 000000000000e033 0000000000000246
(XEN)    ffffc9004aef7c18 000000000000e02b fb5ee398d214b10c eb5ef398c214a10c
(XEN)    eb56f390c21ca104 ebd6f310c29ca184 0000e0100000000a ffff830251756000
(XEN)    0000003211016000 0000000000372660 0000000000000000 80000002963e1002
(XEN) Xen call trace:
(XEN)    [<ffff82d040247a4d>] R credit2.c#csched2_unit_wake+0x152/0x154
(XEN)    [<ffff82d04024fcb8>] F vcpu_wake+0xfd/0x267
(XEN)    [<ffff82d04020a8c9>] F common_vcpu_op+0x178/0x5d1
(XEN)    [<ffff82d0402f7968>] F do_vcpu_op+0x69/0x226
(XEN)    [<ffff82d0402ec6de>] F pv_hypercall+0x575/0x657
(XEN)    [<ffff82d0402012bd>] F lstar_enter+0x13d/0x150
(XEN)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 10:
(XEN) Assertion 'c2rqd(sched_unit_master(unit)) =3D=3D svc->rqd' failed at =
common/sched/credit2.c:2274
(XEN) ****************************************


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--beQDCF4MHbKoMK6Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmMDU7wACgkQ24/THMrX
1yzBMAf8C7Lu00bfICF5Y987hdF36qqjnW/I3C5MizY1AH9yDYP5nCib8zSSpiLA
nks9pfrG4lxgoGXgIetdgtFS45t55j0rmku0+3YpUBrgwp59XSbHnwdHBpmvOVvX
Rxoyrddd2K3I3o8HFNpGCdCoB7+mXlbVZFm078vC4dlPXNnLQwCkOYC9J07yi+1+
YF90jiFYgPQayJH5kTwEGPUdVYq0KwKwZXkCzYkUghaFiSzBD+wCBOM24N1I5xNG
RJqUJBmXYMo8tIzKW3a2sr7comVSLU52XZZzu0psf9H0utCXk2/bA76OL68++Wg0
IBt6kg10Jwdn5H4J/bCVB4SKGixQQw==
=jV4O
-----END PGP SIGNATURE-----

--beQDCF4MHbKoMK6Q--

