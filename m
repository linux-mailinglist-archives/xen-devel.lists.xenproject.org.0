Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F3A5AE86F
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 14:35:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399827.641164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVXnU-0002Hu-Ll; Tue, 06 Sep 2022 12:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399827.641164; Tue, 06 Sep 2022 12:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVXnU-0002F8-Ih; Tue, 06 Sep 2022 12:35:20 +0000
Received: by outflank-mailman (input) for mailman id 399827;
 Tue, 06 Sep 2022 12:35:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WBQK=ZJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oVXnT-0002Eu-60
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 12:35:19 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b1356c6-2de0-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 14:35:16 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 85D7532007D7;
 Tue,  6 Sep 2022 08:35:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 06 Sep 2022 08:35:13 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Sep 2022 08:35:10 -0400 (EDT)
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
X-Inumbo-ID: 5b1356c6-2de0-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1662467712; x=
	1662554112; bh=nGfaxhLBr4/YrjbWe1CZXQFAEaOkkaaweyLMlfdKZN4=; b=h
	++ay8hAqpMuC5tcRsHrG2wg4aNeBuNDfB3txTpn4ml9D5OS5cPpqfSAaqBceR+XZ
	cnyWO04s/LQMTKAQlJ1fl7S76G+Xbh01Gy8osYzUuzaKiyyyQGdO90SzHT+g41Zr
	ng4hP1juzRAkXjvzjTsR5A85DmnJKpkgaHU9VQ/Sny1ernW44MlUQgtO2GF2UWQz
	zQXtcxblrImpP+Dwci/q/+Lr9zdfIEA8Ky0idvMinhZVpoiA1d6JFXl9c0WIhMkp
	41s70XWxMU3XXdXc+C3kyKFlfQPnbov4Mooj56207RBJdKGTiXdXpkztgABE6nhV
	HEdYoarhD58xZrg1MoRFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1662467712; x=1662554112; bh=nGfaxhLBr4/YrjbWe1CZXQFAEaOk
	kaaweyLMlfdKZN4=; b=HRuhg9XkTHFcFbxIAuuoecxMtJ3RU79MBibGVJgjMPdn
	J0yiPmYGimjZyt8CTVqaDTfR7/fsP3JEMI6ocnKzTgGx5Y07MkIf3ful4hL4rSST
	8wIEzqAbNhRq5kQsNbzC/7i9QD0rsXUvTVaNtksJU9uRR/M1NIP++V8YgLVsF+/e
	Mfbrw/oW1VKQskuGBKX7H6XIstHMNUTrxgXTCiwZBcwmu7NMOk/Lk5l/h/czWEv7
	sOIOZWhyxj5jClmNrHQ68oIvVzjwB0oRFiJhRHCemyvnBiCpkSKXgjiEqu1VRAXH
	1ABVT390gWcpuDTzcfGQYMHg74pWV3/fIh9PG32NwQ==
X-ME-Sender: <xms:fz4XY1li5eOYzy4_qVfdAEL0_14M_JHjcjuNaHuJV_qk_petRif7gQ>
    <xme:fz4XYw3yCD9mV2fbbcoklDlUZuLeLeYsmeD0uGUVFsK2iaTTtkTf2qJac-9jMtHZJ
    IxFmAdBjsjrmg>
X-ME-Received: <xmr:fz4XY7oVo0E3m0nzYdChLeNCkdxb00RSpptC-LUxK8cdOR5roxPKMpG5iGnc8yHODVCdXH6lMZe-F2eh53bgvNgLZodZbwJG29kR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdelkedgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueek
    teetgefggfekudehteegieeljeejieeihfejgeevhfetgffgteeuteetueetnecuffhomh
    grihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:fz4XY1nIUBD6I-fNg19LRsP7RFdbllAzTjKT-5p6QFYZwA9QcVpFYw>
    <xmx:fz4XYz0ItaLt5SYWFSAfymy1bFOLSDstmGDu5L9kHqCclt_OgbJesw>
    <xmx:fz4XY0vsnes-YHWkUpUKIZ2ZVwV_AsvwqX1BxDCy8hc3fVph-QVpMA>
    <xmx:gD4XY0xwnRY_3C99JYpoiZVaq78YIKkvdQwITON_D0GJyU95rGdFHQ>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 6 Sep 2022 14:35:08 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: Juergen Gross <jgross@suse.de>, Dario Faggioli <dfaggioli@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13 and newer
Message-ID: <Yxc+fIlyKWU94/VM@mail-itl>
References: <20200323000946.GH18599@mail-itl>
 <20200929142730.GA25731@mail-itl>
 <d243c1b5-712d-a958-0b6c-b232eb4edc80@suse.com>
 <20200929151627.GE1482@mail-itl>
 <ea53b845-5edf-a61e-62ae-7ababc30b3e0@suse.com>
 <20210131021526.GB6354@mail-itl>
 <YWHDIQC3K8J3LD8+@mail-itl>
 <YwJZ3X0HpT9w6Veh@mail-itl>
 <31f99f6b-0781-795b-731b-d5a9f1105887@suse.com>
 <919e328a-000e-0eeb-2253-6a4381b5ccaa@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="plCgYlfOmdnx8632"
Content-Disposition: inline
In-Reply-To: <919e328a-000e-0eeb-2253-6a4381b5ccaa@suse.com>


--plCgYlfOmdnx8632
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 6 Sep 2022 14:35:08 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: Juergen Gross <jgross@suse.de>, Dario Faggioli <dfaggioli@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13 and newer

On Tue, Sep 06, 2022 at 01:46:55PM +0200, Juergen Gross wrote:
> On 22.08.22 17:34, Juergen Gross wrote:
> > On 21.08.22 18:14, Marek Marczykowski-G=C3=B3recki wrote:
> > > On Sat, Oct 09, 2021 at 06:28:17PM +0200, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > On Sun, Jan 31, 2021 at 03:15:30AM +0100, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > On Tue, Sep 29, 2020 at 05:27:48PM +0200, J=C3=BCrgen Gro=C3=9F w=
rote:
> > > > > > On 29.09.20 17:16, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > On Tue, Sep 29, 2020 at 05:07:11PM +0200, J=C3=BCrgen Gro=C3=
=9F wrote:
> > > > > > > > On 29.09.20 16:27, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > > On Mon, Mar 23, 2020 at 01:09:49AM +0100, Marek Marczykow=
ski-G=C3=B3recki wrote:
> > > > > > > > > > On Thu, Mar 19, 2020 at 01:28:10AM +0100, Dario Faggiol=
i wrote:
> > > > > > > > > > > [Adding Juergen]
> > > > > > > > > > >=20
> > > > > > > > > > > On Wed, 2020-03-18 at 23:10 +0100, Marek Marczykowski=
-G=C3=B3recki wrote:
> > > > > > > > > > > > On Wed, Mar 18, 2020 at 02:50:52PM +0000, Andrew Co=
oper wrote:
> > > > > > > > > > > > > On 18/03/2020 14:16, Marek Marczykowski-G=C3=B3re=
cki wrote:
> > > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > In my test setup (inside KVM with nested virt e=
nabled), I rather
> > > > > > > > > > > > > > frequently get Xen crash on resume from S3. Ful=
l message below.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > This is Xen 4.13.0, with some patches, includin=
g "sched: fix
> > > > > > > > > > > > > > resuming
> > > > > > > > > > > > > > from S3 with smt=3D0".
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > Contrary to the previous issue, this one does n=
ot happen always -
> > > > > > > > > > > > > > I
> > > > > > > > > > > > > > would say in about 40% cases on this setup, but=
 very rarely on
> > > > > > > > > > > > > > physical
> > > > > > > > > > > > > > setup.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > This is _without_ core scheduling enabled, and =
also with smt=3Doff.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > Do you think it would be any different on xen-u=
nstable? I cat
> > > > > > > > > > > > > > try, but
> > > > > > > > > > > > > > it isn't trivial in this setup, so I'd ask firs=
t.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > Well, Juergen has fixed quite a few issues.
> > > > > > > > > > >=20
> > > > > > > > > > > Most of them where triggering with core-scheduling en=
abled, and I don't
> > > > > > > > > > > recall any of them which looked similar or related to=
 this.
> > > > > > > > > > >=20
> > > > > > > > > > > Still, it's possible that the same issue causes diffe=
rent symptoms, and
> > > > > > > > > > > hence that maybe one of the patches would fix this to=
o.
> > > > > > > > > >=20
> > > > > > > > > > I've tested on master (d094e95fb7c), and reproduced exa=
ctly the same crash
> > > > > > > > > > (pasted below for the completeness).
> > > > > > > > > > But there is more: additionally, in most
> > > > > > > > > > (all?) cases after resume I've got
> > > > > > > > > > soft lockup in Linux dom0 in smp_call_function_single()=
 - see below. It
> > > > > > > > > > didn't happened before and the only change was Xen 4.13=
 -> master.
> > > > > > > > > >=20
> > > > > > > > > > Xen crash:
> > > > > > > > > >=20
> > > > > > > > > > (XEN) Assertion
> > > > > > > > > > 'c2rqd(sched_unit_master(unit)) =3D=3D
> > > > > > > > > > svc->rqd' failed at credit2.c:2133
> > > > > > > > >=20
> > > > > > > > > Juergen, any idea about this one? This is also happening =
on the current
> > > > > > > > > stable-4.14 (28855ebcdbfa).
> > > > > > > > >=20
> > > > > > > >=20
> > > > > > > > Oh, sorry I didn't come back to this issue.
> > > > > > > >=20
> > > > > > > > I suspect this is related to stop_machine_run() being calle=
d during
> > > > > > > > suspend(), as I'm seeing very sporadic issues when offlinin=
g and then
> > > > > > > > onlining cpus with core scheduling being active (it seems a=
s if the
> > > > > > > > dom0 vcpu doing the cpu online activity sometimes is using =
an old
> > > > > > > > vcpu state).
> > > > > > >=20
> > > > > > > Note this is default Xen 4.14 start, so core scheduling is _n=
ot_ active:
> > > > > >=20
> > > > > > The similarity in the two failure cases is that multiple cpus a=
re
> > > > > > affected by the operations during stop_machine_run().
> > > > > >=20
> > > > > > >=20
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (XEN) Brought up 2 CPUs
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (XEN) Scheduling granularity: =
cpu, 1 CPU per sched-resource
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (XEN) Adding cpu 0 to runqueue=
 0
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0 First cpu on runqu=
eue, activating
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (XEN) Adding cpu 1 to runqueue=
 1
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0 First cpu on runqu=
eue, activating
> > > > > > >=20
> > > > > > > > I wasn't able to catch the real problem despite of having t=
ried lots
> > > > > > > > of approaches using debug patches.
> > > > > > > >=20
> > > > > > > > Recently I suspected the whole problem could be somehow rel=
ated to
> > > > > > > > RCU handling, as stop_machine_run() is relying on tasklets =
which are
> > > > > > > > executing in idle context, and RCU handling is done in idle=
 context,
> > > > > > > > too. So there might be some kind of use after free scenario=
 in case
> > > > > > > > some memory is freed via RCU despite it still being used by=
 a tasklet.
> > > > > > >=20
> > > > > > > That sounds plausible, even though I don't really know this a=
rea of Xen.
> > > > > > >=20
> > > > > > > > I "just" need to find some time to verify this suspicion. A=
ny help doing
> > > > > > > > this would be appreciated. :-)
> > > > > > >=20
> > > > > > > I do have a setup where I can easily-ish reproduce the issue.=
 If there
> > > > > > > is some debug patch you'd like me to try, I can do that.
> > > > > >=20
> > > > > > Thanks. I might come back to that offer as you are seeing a cra=
sh which
> > > > > > will be much easier to analyze. Catching my error case is much =
harder as
> > > > > > it surfaces some time after the real problem in a non destructi=
ve way
> > > > > > (usually I'm seeing a failure to load a library in the program =
which
> > > > > > just did its job via exactly the library claiming not being loa=
dable).
> > > > >=20
> > > > > Hi,
> > > > >=20
> > > > > I'm resurrecting this thread as it was recently mentioned elsewhe=
re. I
> > > > > can still reproduce the issue on the recent staging branch (9dc68=
7f155).
> > > > >=20
> > > > > It fails after the first resume (not always, but frequent enough =
to
> > > > > debug it). At least one guest needs to be running - with just (PV=
) dom0
> > > > > the crash doesn't happen (at least for the ~8 times in a row I tr=
ied).
> > > > > If the first resume works, the second (almost?) always will fail =
but
> > > > > with a different symptoms - dom0 kernel lockups (at least some of=
 its
> > > > > vcpus). I haven't debugged this one yet at all.
> > > > >=20
> > > > > Any help will be appreciated, I can apply some debug patches, cha=
nge
> > > > > configuration etc.
> > > >=20
> > > > This still happens on 4.14.3. Maybe it is related to freeing percpu
> > > > areas, as it caused other issues with suspend too? Just a thought...
> > >=20
> > > I have reproduced this on current staging(*). And I can reproduce it
> > > reliably. And also, I got (I believe) closely related crash with cred=
it1
> > > scheduler.
> > >=20
> > > (*) It isn't plain staging, it's one with my xhci console patches on
> > > top, including attempt to make it survive S3. I believe the only
> > > relevant part there is sticking set_timer() into console resume path =
(or
> > > just having a timer with rather short delay registered). The actual t=
ree
> > > at https://github.com/marmarek/xen/tree/master-xue2-debug, including
> > > quite a lot of debug prints and debug hacks.
> > >=20
> > > Specific crash with credit2:
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) Assertion 'sched_unit_master(currunit)=
 =3D=3D cpu' failed at
> > > common/sched/credit.c:928
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) ----[ Xen-4.17-unstable=C2=A0 x86_64=
=C2=A0 debug=3Dy=C2=A0 Tainted:=C2=A0=C2=A0 C=C2=A0=C2=A0=C2=A0 ]----
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) CPU:=C2=A0=C2=A0=C2=A0 0
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) RIP:=C2=A0=C2=A0=C2=A0 e008:[<ffff82d0=
402434bf>] credit.c#csched_tick+0x2d4/0x494
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) RFLAGS: 0000000000010202=C2=A0=C2=A0 C=
ONTEXT: hypervisor (d0v4)
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) rax: ffff82d0405c4298=C2=A0=C2=A0 rbx:=
 0000000000000002=C2=A0=C2=A0 rcx: 0000000000000002
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) rdx: ffff8302517f64d0=C2=A0=C2=A0 rsi:=
 ffff8302515c0fc0=C2=A0=C2=A0 rdi: 0000000000000002
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) rbp: ffff830256227e38=C2=A0=C2=A0 rsp:=
 ffff830256227de0=C2=A0=C2=A0 r8:=C2=A0 0000000000000004
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) r9:=C2=A0 ffff8302517ac820=C2=A0=C2=A0=
 r10: ffff830251745068=C2=A0=C2=A0 r11: 00000088cb734887
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) r12: ffff83025174de50=C2=A0=C2=A0 r13:=
 ffff8302515c0fa0=C2=A0=C2=A0 r14: ffff83025174df40
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) r15: ffff8302515c0cc0=C2=A0=C2=A0 cr0:=
 0000000080050033=C2=A0=C2=A0 cr4: 0000000000372660
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) cr3: 00000001bacbd000=C2=A0=C2=A0 cr2:=
 000077e5ec02a318
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) fsb: 000077e5fe533700=C2=A0=C2=A0 gsb:=
 ffff888255700000=C2=A0=C2=A0 gss: 0000000000000000
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) ds: 0000=C2=A0=C2=A0 es: 0000=C2=A0=C2=
=A0 fs: 0000=C2=A0=C2=A0 gs: 0000=C2=A0=C2=A0 ss: 0000=C2=A0=C2=A0 cs: e008
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) Xen code around <ffff82d0402434bf> (cr=
edit.c#csched_tick+0x2d4/0x494):
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0 01 00 00 e9 2a 01 00 00 <0f> 0b =
0f 0b 0f 0b 48 8b 41 20
> > > 0f b7 00 89 45 cc
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) Xen stack trace from rsp=3Dffff8302562=
27de0:
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 ffff830256227fff 000=
0000000000000 0000000256227e10 ffff82d04035be90
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 ffff830256227ef8 fff=
f830251745000 ffff82d0405c3280 ffff82d0402431eb
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 0000000000000002 000=
00088c9ba9534 0000000000000000 ffff830256227e60
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 ffff82d04022ee53 fff=
f82d0405c3280 ffff8302963e1320 ffff8302515c0fc0
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 ffff830256227ea0 fff=
f82d04022f73f ffff830256227e80 ffff82d0405c9f00
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 ffffffffffffffff fff=
f82d0405c9f00 ffff830256227fff 0000000000000000
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 ffff830256227ed8 fff=
f82d04022d26c ffff830251745000 0000000000000000
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 fff=
f830256227fff 0000000000000000 ffff830256227ee8
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 ffff82d04022d2ff 000=
07cfda9dd80e7 ffff82d0402f03c6 ffff88810c005c00
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 0000000000000031 000=
0000000000100 00000000fffffe00 0000000000000031
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 0000000000000031 fff=
fffff82d45d28 0000000000000e2e 0000000000000000
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 0000000000000032 000=
00000ffffef31 0000000000000000 ffff88812244a700
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 0000000000000005 fff=
f88812244a780 000000fa00000000 ffffffff818db55f
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 000000000000e033 000=
0000000000246 ffffc900409b7c50 000000000000e02b
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 000=
0000000000000 0000000000000000 0000000000000000
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 0000e01000000000 fff=
f830251745000 0000000000000000 0000000000372660
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 800=
000025620b002 000e030300000001 0000000000000000
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) Xen call trace:
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d0402434bf>]=
 R credit.c#csched_tick+0x2d4/0x494
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d04022ee53>]=
 F timer.c#execute_timer+0x45/0x5c
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d04022f73f>]=
 F timer.c#timer_softirq_action+0x71/0x278
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d04022d26c>]=
 F softirq.c#__do_softirq+0x94/0xbe
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d04022d2ff>]=
 F do_softirq+0x13/0x15
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d0402f03c6>]=
 F x86_64/entry.S#process_softirqs+0x6/0x20
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) **************************************=
**
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) Panic on CPU 0:
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) Assertion 'sched_unit_master(currunit)=
 =3D=3D cpu' failed at
> > > common/sched/credit.c:928
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) **************************************=
**
> > >=20
> > > Specific crash with credit1:
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) ASSERT FAIL! cpu 4, sched_unit_master =
0, currunit id 4
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) Assertion 'sched_unit_master(currunit)=
 =3D=3D cpu' failed at
> > > common/sched/credit.c:936
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) ----[ Xen-4.17-unstable=C2=A0 x86_64=
=C2=A0 debug=3Dy=C2=A0 Tainted:=C2=A0=C2=A0 C=C2=A0=C2=A0=C2=A0 ]----
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) CPU:=C2=A0=C2=A0=C2=A0 0
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) RIP:=C2=A0=C2=A0=C2=A0 e008:[<ffff82d0=
4024355c>] credit.c#csched_tick+0x2f7/0x4b7
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) RFLAGS: 0000000000010202=C2=A0=C2=A0 C=
ONTEXT: hypervisor (d0v4)
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) rax: ffff8302517f64d0=C2=A0=C2=A0 rbx:=
 0000000000000004=C2=A0=C2=A0 rcx: 0000000000000000
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) rdx: ffff830256227fff=C2=A0=C2=A0 rsi:=
 000000000000000a=C2=A0=C2=A0 rdi: ffff82d0404786b8
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) rbp: ffff830256227e38=C2=A0=C2=A0 rsp:=
 ffff830256227de0=C2=A0=C2=A0 r8:=C2=A0 0000000000000087
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) r9:=C2=A0 0000000000000001=C2=A0=C2=A0=
 r10: 0000000000000001=C2=A0=C2=A0 r11: 0000000000000004
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) r12: ffff83025174de50=C2=A0=C2=A0 r13:=
 ffff830251778100=C2=A0=C2=A0 r14: ffff83025174df40
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) r15: ffff8302515c0cc0=C2=A0=C2=A0 cr0:=
 0000000080050033=C2=A0=C2=A0 cr4: 0000000000372660
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) cr3: 000000024ac10000=C2=A0=C2=A0 cr2:=
 0000000000000000
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) fsb: 0000000000000000=C2=A0=C2=A0 gsb:=
 ffff888255700000=C2=A0=C2=A0 gss: 0000000000000000
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) ds: 002b=C2=A0=C2=A0 es: 002b=C2=A0=C2=
=A0 fs: 0000=C2=A0=C2=A0 gs: 0000=C2=A0=C2=A0 ss: 0000=C2=A0=C2=A0 cs: e008
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) Xen code around <ffff82d04024355c> (cr=
edit.c#csched_tick+0x2f7/0x4b7):
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0 58 70 0f 84 bf fe ff ff <0f> 0b =
0f 0b 0f 0b 48 8b 40 20
> > > 0f b7 00 89 45 cc
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) Xen stack trace from rsp=3Dffff8302562=
27de0:
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 000000000046692a fff=
f8302515c0bc0 000000044025ae27 002191c0517f64e8
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 ffff82d0405c33e0 fff=
f8302517c8590 ffff82d0405c3280 ffff82d040243265
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 0000000000000004 000=
00026d27a80a7 0000000000000000 ffff830256227e60
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 ffff82d04022ee94 fff=
f82d0405c3280 ffff8302517e7df0 ffff830251778120
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 ffff830256227ea0 fff=
f82d04022f77a ffff830256227e80 ffff82d0405c9f00
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 ffffffffffffffff fff=
f82d0405c9f00 ffff830256227fff 0000000000000000
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 ffff830256227ed8 fff=
f82d04022d26c ffff830251745000 0000000000000000
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 fff=
f830256227fff 0000000000000000 ffff830256227ee8
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 ffff82d04022d2ff 000=
07cfda9dd80e7 ffff82d0402f0496 0000000000000001
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 ffffc90040127ddc fff=
fc90040127dd0 ffffc90040127dd4 ffffc90040127dd8
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 00000000756e6547 000=
0000000000000 0000000000000000 ffffc90040127ddc
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 ffffc90040127dd0 000=
000000000000d 000000006c65746e 0000000049656e69
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 ffffc90040127dd4 fff=
fc90040127dd8 000000fa00000000 ffffffff8101c5a4
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 000000000000e033 000=
0000000000293 ffffc90040127db8 000000000000e02b
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 000=
0000000000000 0000000000000000 0000000000000000
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 0000e01000000000 fff=
f830251745000 0000000000000000 0000000000372660
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 800=
000025620b002 000e030300000001 0000000000000000
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) Xen call trace:
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d04024355c>]=
 R credit.c#csched_tick+0x2f7/0x4b7
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d04022ee94>]=
 F timer.c#execute_timer+0x45/0x5c
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d04022f77a>]=
 F timer.c#timer_softirq_action+0x71/0x278
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d04022d26c>]=
 F softirq.c#__do_softirq+0x94/0xbe
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d04022d2ff>]=
 F do_softirq+0x13/0x15
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d0402f0496>]=
 F x86_64/entry.S#process_softirqs+0x6/0x20
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN)
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) **************************************=
**
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) Panic on CPU 0:
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) Assertion 'sched_unit_master(currunit)=
 =3D=3D cpu' failed at
> > > common/sched/credit.c:936
> > > =C2=A0=C2=A0=C2=A0=C2=A0 (XEN) **************************************=
**
> > >=20
> > > I'm not sure about the nature of credit2 crash, but for credit1 it lo=
oks
> > > much simpler to understand. Credit1 registers a timer for each pcpu (=
in
> > > init_pdata()). Then, the timer function
> > > (csched_tick()->csched_unit_acct()) asserts if it was really called on
> > > correct CPU. The issue is that suspend path migrates all timers to CP=
U0
> > > (timerc.:cpu_callback->migrate_timers_from_cpu()), and restore path
> > > doesn't migrate them back. All this while not unregistering pCPUs from
> > > the scheduler (sched_deinit_pdata() / init_pdata() is not called -
> > > confirmed via debug prints).
> > >=20
> > > I'm not exactly sure if that's the same issue that applies to credit2,
> > > but I think it's likely. A naive fix could be unregistering all pCPUs
> > > from the scheduler (an registering them back on resume), but this may
> > > mess up CPU pools, and probably few other things. Any better ideas? I
> > > can test various patches, provide more debug info etc - should be rat=
her
> > > straightforward given I have reliable reproducer now.
> >=20
> > Unregistering the cpus from the scheduler would break core scheduling.
> >=20
> > I'll have a look if the timers can just be deactivated in order not to
> > have them migrated to cpu0.
>=20
> Could you test the attached patch, please?

I did a test with only dom0 running, and it works now. It isn't a
comprehensive test, but just dom0 was enough to crash it before, and it
stays working now. Thanks!

Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

>=20
>=20
> Juergen

> From a2c224bee53e2216d41b34518bb2d11b64d63b6a Mon Sep 17 00:00:00 2001
> From: Juergen Gross <jgross@suse.com>
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Wei Liu <wl@xen.org>
> Date: Tue, 6 Sep 2022 13:39:48 +0200
> Subject: [PATCH] xen/timer: don't migrate timers away from cpus during su=
spend
>=20
> During a suspend/resume cycle timers on all cpus but cpu 0 will be
> migrated to cpu 0, as the other cpus are taken down.
>=20
> This is problematic in case such a timer is related to a specific vcpu,
> as the vcpus are not migrated to another cpu during suspend (migrating
> them would break cpupools and core scheduling).
>=20
> In order to avoid the problems just try to keep the timers on their
> cpus. Only migrate them away in case resume failed. Doing so isn't
> problematic, as any vcpu on a cpu not coming back to life would be
> migrated away, too.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  xen/common/timer.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>=20
> diff --git a/xen/common/timer.c b/xen/common/timer.c
> index 9b5016d5ed..6b5473e5f1 100644
> --- a/xen/common/timer.c
> +++ b/xen/common/timer.c
> @@ -637,6 +637,13 @@ static void free_percpu_timers(unsigned int cpu)
>          ASSERT(ts->heap =3D=3D dummy_heap);
>  }
> =20
> +static void deinit_timers(unsigned int cpu)
> +{
> +    migrate_timers_from_cpu(cpu);
> +    if ( !park_offline_cpus )
> +        free_percpu_timers(cpu);
> +}
> +
>  static int cf_check cpu_callback(
>      struct notifier_block *nfb, unsigned long action, void *hcpu)
>  {
> @@ -655,13 +662,14 @@ static int cf_check cpu_callback(
>          }
>          break;
> =20
> -    case CPU_UP_CANCELED:
>      case CPU_DEAD:
> -    case CPU_RESUME_FAILED:
> -        migrate_timers_from_cpu(cpu);
> +        if ( system_state !=3D SYS_STATE_suspend )
> +            deinit_timers(cpu);
> +        break;
> =20
> -        if ( !park_offline_cpus && system_state !=3D SYS_STATE_suspend )
> -            free_percpu_timers(cpu);
> +    case CPU_UP_CANCELED:
> +    case CPU_RESUME_FAILED:
> +        deinit_timers(cpu);
>          break;
> =20
>      case CPU_REMOVE:
> --=20
> 2.35.3
>=20






--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--plCgYlfOmdnx8632
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmMXPnwACgkQ24/THMrX
1yzsSwgAk6kBxfw+L5Nw2HZKhKUNYpM3+UJhrr2bl2HH8k9G3/RI0aJBU3K5P+YE
Z/15IpZtKlACUdiIvFVWt9N5Hp+ZmFdO5rRtxdSx1VMmXt9kIz6t9YeCXor3Alg4
c6Ph69WyLuXom+SgBh1qN/yAhp/ObrbZc44D2KRmd5Cua7qBOtny3hqZCGKb7Z0z
21vHURtn1OYx/ltC37TIWo3ERqN+ZswnEHQNG3XA39pGZEWZl0Ns4hsVNKP9Yihg
Xb772o4HishRTtq+sbfJyHYPx5d69M4owgp8aq49KbDSzI8wZl8H9itk+CmfZ0EC
4f7tFZQ1Uu5UTxSaCzZMLb4Ls7GKTQ==
=WKhE
-----END PGP SIGNATURE-----

--plCgYlfOmdnx8632--

