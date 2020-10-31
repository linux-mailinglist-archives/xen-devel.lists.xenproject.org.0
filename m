Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4724E2A132A
	for <lists+xen-devel@lfdr.de>; Sat, 31 Oct 2020 03:55:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.16751.41567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYh2Y-0001J9-Fq; Sat, 31 Oct 2020 02:54:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16751.41567; Sat, 31 Oct 2020 02:54:50 +0000
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
	id 1kYh2Y-0001Ik-CI; Sat, 31 Oct 2020 02:54:50 +0000
Received: by outflank-mailman (input) for mailman id 16751;
 Sat, 31 Oct 2020 02:54:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CThl=EG=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kYh2X-0001If-2c
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 02:54:49 +0000
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 211d6e46-31ec-40ec-9739-c90a03cc7173;
 Sat, 31 Oct 2020 02:54:47 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 271CC5C014E;
 Fri, 30 Oct 2020 22:54:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 30 Oct 2020 22:54:47 -0400
Received: from mail-itl (unknown [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id D83FF3064682;
 Fri, 30 Oct 2020 22:54:45 -0400 (EDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CThl=EG=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
	id 1kYh2X-0001If-2c
	for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 02:54:49 +0000
X-Inumbo-ID: 211d6e46-31ec-40ec-9739-c90a03cc7173
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 211d6e46-31ec-40ec-9739-c90a03cc7173;
	Sat, 31 Oct 2020 02:54:47 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 271CC5C014E;
	Fri, 30 Oct 2020 22:54:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 30 Oct 2020 22:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=sZey/y
	FH4J68uGvZZ3Hx+//0gd9LeqAg0EVCMZzazww=; b=BvSizoDRwPfoX4y5W71Ksw
	BUR/9y9hbE4/YTjYrYDto+ZZ9bcm1hKYZ8FDiaRJCzt7Jj+4BxM0LwPZ/0hbyQ5B
	49PlaRWfiAlaGC75cP3lVTIkAH2aPmYxcu4P4hfKlr1itKjTikxgUXF6UrUwRXzi
	62BuIJMRHtHWgUFq4iKHVPiWwO1GtS1zis5YmHkGEjmwD+XMH3zN8KgrR56GvLc6
	gzUkrBU70sqAam17FGNGGw86ypU1pSplrmcj18WY4M3WtLK3FSMuzSsumDwd2fIL
	0eygD6us/KJjkSJRiQBgdMW7LfWgdlUFXyUWj7O820jxIZrlr6d4NwGEEJTRvtIw
	==
X-ME-Sender: <xms:9tGcXyUZujxTUlgxwoh-O2tM7AWVrpEHrp7iVbZ8XEtdVuj2WGDeqA>
    <xme:9tGcX-kO5pl76JBi0ALVjV-iCNSSk8ACDIwB9--fY5RN5iLKIjlvWSp3ypMY1cWGS
    ZkRHBwhBBuwKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleeigdeglecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepfdhmrghrmhgr
    rhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmfdcuoehmrghrmhgrrh
    gvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgv
    rhhnpeehveetfefhfedvtdeuuedvtddtvdeijeeuueejffduvefgvdekledtleduveffve
    enucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeeluddrieegrddujedtrdek
    leenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:9tGcX2YHhvxqpyNdNFENllv_xpxwks7KYO5i8-sB-K_hL0RoW3IyYg>
    <xmx:9tGcX5U2onrPTY5DCrYx37_kSVg_yFy54j9swITacjspWSxQTDUigA>
    <xmx:9tGcX8nfurcB4c5I9mzu9BXSjT3TnmZeKgm4UmUH-bqVuNrNQHizBQ>
    <xmx:99GcXxy97Kv-PqaQZ5BU63SGcbsSrlTrMU3CBxeL-3KQGGkEOGVD_Q>
Received: from mail-itl (unknown [91.64.170.89])
	by mail.messagingengine.com (Postfix) with ESMTPA id D83FF3064682;
	Fri, 30 Oct 2020 22:54:45 -0400 (EDT)
Date: Sat, 31 Oct 2020 03:54:42 +0100
From: "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: Juergen Gross <JGross@suse.com>,
	"frederic.pierret@qubes-os.org" <frederic.pierret@qubes-os.org>,
	"George.Dunlap@citrix.com" <George.Dunlap@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Subject: Re: Recent upgrade of 4.13 -> 4.14 issue
Message-ID: <20201031025442.GF1447@mail-itl>
References: <a8e9113c-70ef-53fa-e340-be15eb3cba57@qubes-os.org>
 <30452e9c-bf27-fce2-cc20-4ce91018a15a@citrix.com>
 <deefd340-ec7a-bbb9-7471-d147da174f4a@suse.com>
 <a333ea82c12086874f705fc9ea9baa991235edd4.camel@suse.com>
 <533ce2f2-f268-a70b-fad7-d8f3f4033209@suse.com>
 <182a90a89cc02beec9760559799e74572e18ce49.camel@suse.com>
 <9632dc14-46d5-83c0-7e44-0c3bd4f5154a@qubes-os.org>
 <ce07254a-0775-d35c-559b-7d9ab642accf@qubes-os.org>
 <b1a18e6ed88db3c40a54c7ca15c3399bdc6f2b9c.camel@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bwMunqOr7B7rzQrh"
Content-Disposition: inline
In-Reply-To: <b1a18e6ed88db3c40a54c7ca15c3399bdc6f2b9c.camel@suse.com>


--bwMunqOr7B7rzQrh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Recent upgrade of 4.13 -> 4.14 issue

On Sat, Oct 31, 2020 at 02:34:32AM +0000, Dario Faggioli wrote:
> On Tue, 2020-10-27 at 17:06 +0100, Fr=C3=A9d=C3=A9ric Pierret wrote:
> >=20
> > Ok the server got frozen just few minutes after my mail and I got
> > now:
> > 'r': https://gist.github.com/fepitre/78541f555902275d906d627de2420571
> >
> From the scheduler point of view, things seems fine:
>=20
> (XEN) sched_smt_power_savings: disabled
> (XEN) NOW=3D770188952085
> (XEN) Online Cpus: 0-15
> (XEN) Cpupool 0:
> (XEN) Cpus: 0-15
> (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
> (XEN) Scheduler: SMP Credit Scheduler rev2 (credit2)
> (XEN) Active queues: 2
> (XEN) 	default-weight     =3D 256
> (XEN) Runqueue 0:
> (XEN) 	ncpus              =3D 8
> (XEN) 	cpus               =3D 0-7
> (XEN) 	max_weight         =3D 256
> (XEN) 	pick_bias          =3D 1
> (XEN) 	instload           =3D 7
> (XEN) 	aveload            =3D 2021119 (~770%)
> (XEN) 	idlers: 00000000,00000000
> (XEN) 	tickled: 00000000,00000000
> (XEN) 	fully idle cores: 00000000,00000000
> (XEN) Runqueue 1:
> (XEN) 	ncpus              =3D 8
> (XEN) 	cpus               =3D 8-15
> (XEN) 	max_weight         =3D 256
> (XEN) 	pick_bias          =3D 9
> (XEN) 	instload           =3D 8
> (XEN) 	aveload            =3D 2097259 (~800%)
> (XEN) 	idlers: 00000000,00000000
> (XEN) 	tickled: 00000000,00000200
> (XEN) 	fully idle cores: 00000000,00000000
>=20
> The system is pretty busy, but not in overload.
>=20
> Below we see that CPU 3 is running the idle vCPU, but it's not marked
> as neither idle nor tickled.
>=20
> It may be running a tasklet (the one that dumps the debug key output, I
> guess).
>=20
> Credits are fine, I don't see any strange values that may indicate
> anomalies or something.
>=20
> All the CPUs are executing a vCPU, and there should be nothing that
> prevent them making progresses.
>=20
> There is one vCPU which apparetnly want to run at 100% in pretty much
> all guests, and more than one in dom0.
>=20
> And I think I saw some spin_lock() in the call stacks, in the partial
> report of '*' debug-key?

Yes, I see:

(XEN) *** Dumping CPU1 host state: ***
(...)
(XEN) Xen call trace:
(XEN)    [<ffff82d040223625>] R _spin_lock+0x35/0x40
(XEN)    [<ffff82d0402233cd>] S on_selected_cpus+0x1d/0xc0
(XEN)    [<ffff82d040284aba>] S vmx_do_resume+0xba/0x1b0
(XEN)    [<ffff82d0402df160>] S context_switch+0x110/0xa60
(XEN)    [<ffff82d04024310a>] S core.c#schedule+0x1aa/0x250
(XEN)    [<ffff82d040222d4a>] S softirq.c#__do_softirq+0x5a/0xa0
(XEN)    [<ffff82d0402d64e6>] S x86_64/entry.S#process_softirqs+0x6/0x20
(...)
(XEN) *** Dumping CPU2 host state: ***
(XEN) Xen call trace:
(XEN)    [<ffff82d040223622>] R _spin_lock+0x32/0x40
(XEN)    [<ffff82d0402233cd>] S on_selected_cpus+0x1d/0xc0
(XEN)    [<ffff82d040284aba>] S vmx_do_resume+0xba/0x1b0
(XEN)    [<ffff82d0402df160>] S context_switch+0x110/0xa60
(XEN)    [<ffff82d04024310a>] S core.c#schedule+0x1aa/0x250
(XEN)    [<ffff82d040222d4a>] S softirq.c#__do_softirq+0x5a/0xa0
(XEN)    [<ffff82d040291b6b>] S vmx_asm_do_vmentry+0x2b/0x30

(XEN) *** Dumping CPU5 host state: ***
(XEN) Xen call trace:
(XEN)    [<ffff82d040223622>] R _spin_lock+0x32/0x40
(XEN)    [<ffff82d0402233cd>] S on_selected_cpus+0x1d/0xc0
(XEN)    [<ffff82d040284aba>] S vmx_do_resume+0xba/0x1b0
(XEN)    [<ffff82d0402df160>] S context_switch+0x110/0xa60
(XEN)    [<ffff82d04024310a>] S core.c#schedule+0x1aa/0x250
(XEN)    [<ffff82d040222d4a>] S softirq.c#__do_softirq+0x5a/0xa0
(XEN)    [<ffff82d040291b6b>] S vmx_asm_do_vmentry+0x2b/0x30

(XEN) *** Dumping CPU6 host state: ***
(XEN) Xen call trace:
(XEN)    [<ffff82d040223625>] R _spin_lock+0x35/0x40
(XEN)    [<ffff82d0402233cd>] S on_selected_cpus+0x1d/0xc0
(XEN)    [<ffff82d040284aba>] S vmx_do_resume+0xba/0x1b0
(XEN)    [<ffff82d0402df160>] S context_switch+0x110/0xa60
(XEN)    [<ffff82d04024310a>] S core.c#schedule+0x1aa/0x250
(XEN)    [<ffff82d040222d4a>] S softirq.c#__do_softirq+0x5a/0xa0
(XEN)    [<ffff82d0402d64e6>] S x86_64/entry.S#process_softirqs+0x6/0x20

(XEN) *** Dumping CPU7 host state: ***
(XEN) Xen call trace:
(XEN)    [<ffff82d040223625>] R _spin_lock+0x35/0x40
(XEN)    [<ffff82d0402233cd>] S on_selected_cpus+0x1d/0xc0
(XEN)    [<ffff82d040284aba>] S vmx_do_resume+0xba/0x1b0
(XEN)    [<ffff82d0402df160>] S context_switch+0x110/0xa60
(XEN)    [<ffff82d04024310a>] S core.c#schedule+0x1aa/0x250
(XEN)    [<ffff82d040222d4a>] S softirq.c#__do_softirq+0x5a/0xa0
(XEN)    [<ffff82d040291b6b>] S vmx_asm_do_vmentry+0x2b/0x30

And so on, for (almost?) all CPUs.

Note the '*' output is (I think) from a different instances of the
freeze, so cannot be correlated with other outputs...

> Maybe they're stuck in the kernel, not in Xen? Thoughs ?

Given the above spin locks, I don't think so. But also, even if they are
stuck in the kernel, it clearly happened after 4.13 -> 4.14 upgrade...

> (XEN) Domain info:
> (XEN) 	Domain: 0 w 256 c 0 v 16
> (XEN) 	  1: [0.0] flags=3D0 cpu=3D5 credit=3D10553147 [w=3D256] load=3D17=
122
> (~6%)
> (XEN) 	  2: [0.1] flags=3D0 cpu=3D4 credit=3D10570606 [w=3D256] load=3D13=
569
> (~5%)
> (XEN) 	  3: [0.2] flags=3D0 cpu=3D7 credit=3D10605188 [w=3D256] load=3D13=
465
> (~5%)
> (XEN) 	  4: [0.3] flags=3D2 cpu=3D11 credit=3D9998469 [w=3D256] load=3D26=
2144
> (~100%)
> (XEN) 	  5: [0.4] flags=3D0 cpu=3D0 credit=3D10533686 [w=3D256] load=3D13=
619
> (~5%)
> (XEN) 	  6: [0.5] flags=3Da cpu=3D9 credit=3D1101 [w=3D256] load=3D0 (~0%)
> (XEN) 	  7: [0.6] flags=3D2 cpu=3D2 credit=3D10621802 [w=3D256] load=3D13=
526
> (~5%)
> (XEN) 	  8: [0.7] flags=3D2 cpu=3D1 credit=3D10670607 [w=3D256] load=3D13=
453
> (~5%)
> (XEN) 	  9: [0.8] flags=3D2 cpu=3D7 credit=3D10649858 [w=3D256] load=3D13=
502
> (~5%)
> (XEN) 	 10: [0.9] flags=3D0 cpu=3D3 credit=3D10550566 [w=3D256] load=3D13=
477
> (~5%)
> (XEN) 	 11: [0.10] flags=3D2 cpu=3D4 credit=3D10644321 [w=3D256] load=3D1=
3539
> (~5%)
> (XEN) 	 12: [0.11] flags=3D2 cpu=3D1 credit=3D10602374 [w=3D256] load=3D1=
3471
> (~5%)
> (XEN) 	 13: [0.12] flags=3D0 cpu=3D6 credit=3D10617262 [w=3D256] load=3D1=
3801
> (~5%)
> (XEN) 	 14: [0.13] flags=3D2 cpu=3D8 credit=3D9998664 [w=3D256] load=3D26=
2144
> (~100%)
> (XEN) 	 15: [0.14] flags=3D0 cpu=3D3 credit=3D10603305 [w=3D256] load=3D1=
7020
> (~6%)
> (XEN) 	 16: [0.15] flags=3D0 cpu=3D5 credit=3D10591312 [w=3D256] load=3D1=
3523
> (~5%)
> (XEN) 	Domain: 1 w 256 c 0 v 2
> (XEN) 	 17: [1.0] flags=3D2 cpu=3D6 credit=3D4916769 [w=3D256] load=3D262=
144
> (~100%)
> (XEN) 	 18: [1.1] flags=3D0 cpu=3D13 credit=3D10500000 [w=3D256] load=3D0=
 (~0%)
> (XEN) 	Domain: 2 w 256 c 0 v 2
> (XEN) 	 19: [2.0] flags=3D2 cpu=3D5 credit=3D4982064 [w=3D256] load=3D262=
144
> (~100%)
> (XEN) 	 20: [2.1] flags=3D0 cpu=3D14 credit=3D10500000 [w=3D256] load=3D0=
 (~0%)
> (XEN) 	Domain: 3 w 256 c 0 v 2
> (XEN) 	 21: [3.0] flags=3D2 cpu=3D1 credit=3D5200781 [w=3D256] load=3D262=
144
> (~100%)
> (XEN) 	 22: [3.1] flags=3D0 cpu=3D5 credit=3D10500000 [w=3D256] load=3D0 =
(~0%)
> (XEN) 	Domain: 4 w 256 c 0 v 2
> (XEN) 	 23: [4.0] flags=3D12 cpu=3D0 credit=3D5395149 [w=3D256] load=3D26=
2144
> (~100%)
> (XEN) 	 24: [4.1] flags=3D0 cpu=3D8 credit=3D10500000 [w=3D256] load=3D0 =
(~0%)
> (XEN) 	Domain: 5 w 256 c 0 v 2
> (XEN) 	 25: [5.0] flags=3D2 cpu=3D2 credit=3D5306461 [w=3D256] load=3D262=
144
> (~100%)
> (XEN) 	 26: [5.1] flags=3D0 cpu=3D15 credit=3D10500000 [w=3D256] load=3D0=
 (~0%)
> (XEN) 	Domain: 6 w 256 c 0 v 8
> (XEN) 	 27: [6.0] flags=3D12 cpu=3D10 credit=3D7915602 [w=3D256] load=3D2=
62144
> (~100%)
> (XEN) 	 28: [6.1] flags=3D0 cpu=3D10 credit=3D10500000 [w=3D256] load=3D0=
 (~0%)
> (XEN) 	 29: [6.2] flags=3D0 cpu=3D15 credit=3D10500000 [w=3D256] load=3D0=
 (~0%)
> (XEN) 	 30: [6.3] flags=3D0 cpu=3D8 credit=3D10500000 [w=3D256] load=3D0 =
(~0%)
> (XEN) 	 31: [6.4] flags=3D0 cpu=3D0 credit=3D10500000 [w=3D256] load=3D0 =
(~0%)
> (XEN) 	 32: [6.5] flags=3D0 cpu=3D6 credit=3D10500000 [w=3D256] load=3D0 =
(~0%)
> (XEN) 	 33: [6.6] flags=3D0 cpu=3D11 credit=3D10500000 [w=3D256] load=3D0=
 (~0%)
> (XEN) 	 34: [6.7] flags=3D0 cpu=3D9 credit=3D10500000 [w=3D256] load=3D0 =
(~0%)
> (XEN) 	Domain: 7 w 256 c 0 v 2
> (XEN) 	 35: [7.0] flags=3D2 cpu=3D4 credit=3D5297013 [w=3D256] load=3D262=
144
> (~100%)
> (XEN) 	 36: [7.1] flags=3D0 cpu=3D11 credit=3D10500000 [w=3D256] load=3D0=
 (~0%)
> (XEN) 	Domain: 8 w 256 c 0 v 4
> (XEN) 	 37: [8.0] flags=3D0 cpu=3D14 credit=3D10500000 [w=3D256] load=3D0=
 (~0%)
> (XEN) 	 38: [8.1] flags=3D2 cpu=3D7 credit=3D5240630 [w=3D256] load=3D262=
144
> (~100%)
> (XEN) 	 39: [8.2] flags=3D0 cpu=3D13 credit=3D10500000 [w=3D256] load=3D0=
 (~0%)
> (XEN) 	 40: [8.3] flags=3D0 cpu=3D8 credit=3D10500000 [w=3D256] load=3D0 =
(~0%)
> (XEN) 	Domain: 9 w 256 c 0 v 2
> (XEN) 	 41: [9.0] flags=3D0 cpu=3D0 credit=3D10500000 [w=3D256] load=3D0 =
(~0%)
> (XEN) 	 42: [9.1] flags=3D12 cpu=3D13 credit=3D7910266 [w=3D256] load=3D2=
62144
> (~100%)
> (XEN) 	Domain: 10 w 256 c 0 v 2
> (XEN) 	 43: [10.0] flags=3D12 cpu=3D12 credit=3D8045458 [w=3D256] load=3D=
262144
> (~100%)
> (XEN) 	 44: [10.1] flags=3D0 cpu=3D8 credit=3D10500000 [w=3D256] load=3D0=
 (~0%)
> (XEN) 	Domain: 11 w 256 c 0 v 2
> (XEN) 	 45: [11.0] flags=3D12 cpu=3D14 credit=3D7575284 [w=3D256] load=3D=
262144
> (~100%)
> (XEN) 	 46: [11.1] flags=3D0 cpu=3D12 credit=3D10500000 [w=3D256] load=3D0
> (~0%)
> (XEN) 	Domain: 12 w 256 c 0 v 2
> (XEN) 	 47: [12.0] flags=3D2 cpu=3D15 credit=3D8014099 [w=3D256] load=3D2=
62144
> (~100%)
> (XEN) 	 48: [12.1] flags=3D0 cpu=3D6 credit=3D10500000 [w=3D256] load=3D0=
 (~0%)
> (XEN) 	Domain: 13 w 256 c 0 v 2
> (XEN) 	 49: [13.0] flags=3D0 cpu=3D7 credit=3D10500000 [w=3D256] load=3D0=
 (~0%)
> (XEN) 	 50: [13.1] flags=3D0 cpu=3D15 credit=3D10500000 [w=3D256] load=3D0
> (~0%)
> (XEN) Runqueue 0:
> (XEN) CPU[00] runq=3D0, sibling=3D{0}, core=3D{0-7}
> (XEN) 	run: [4.0] flags=3D2 cpu=3D0 credit=3D5255200 [w=3D256] load=3D262=
144
> (~100%)
> (XEN) CPU[01] runq=3D0, sibling=3D{1}, core=3D{0-7}
> (XEN) 	run: [3.0] flags=3D2 cpu=3D1 credit=3D5057668 [w=3D256] load=3D262=
144
> (~100%)
> (XEN) CPU[02] runq=3D0, sibling=3D{2}, core=3D{0-7}
> (XEN) 	run: [5.0] flags=3D12 cpu=3D2 credit=3D5180785 [w=3D256] load=3D26=
2144
> (~100%)
> (XEN) CPU[03] runq=3D0, sibling=3D{3}, core=3D{0-7}
> (XEN) CPU[04] runq=3D0, sibling=3D{4}, core=3D{0-7}
> (XEN) 	run: [7.0] flags=3D2 cpu=3D4 credit=3D5215323 [w=3D256] load=3D262=
144
> (~100%)
> (XEN) CPU[05] runq=3D0, sibling=3D{5}, core=3D{0-7}
> (XEN) 	run: [2.0] flags=3D2 cpu=3D5 credit=3D4816142 [w=3D256] load=3D262=
144
> (~100%)
> (XEN) CPU[06] runq=3D0, sibling=3D{6}, core=3D{0-7}
> (XEN) 	run: [1.0] flags=3D2 cpu=3D6 credit=3D4755772 [w=3D256] load=3D262=
144
> (~100%)
> (XEN) CPU[07] runq=3D0, sibling=3D{7}, core=3D{0-7}
> (XEN) 	run: [8.1] flags=3D12 cpu=3D7 credit=3D5175342 [w=3D256] load=3D26=
2144
> (~100%)
> (XEN) RUNQ:
> (XEN) Runqueue 1:
> (XEN) CPU[08] runq=3D1, sibling=3D{8}, core=3D{8-15}
> (XEN) 	run: [0.13] flags=3D2 cpu=3D8 credit=3D9998664 [w=3D256] load=3D26=
2144
> (~100%)
> (XEN) CPU[09] runq=3D1, sibling=3D{9}, core=3D{8-15}
> (XEN) 	run: [0.5] flags=3Da cpu=3D9 credit=3D1101 [w=3D256] load=3D0 (~0%)
> (XEN) CPU[10] runq=3D1, sibling=3D{10}, core=3D{8-15}
> (XEN) 	run: [6.0] flags=3D2 cpu=3D10 credit=3D7764532 [w=3D256] load=3D26=
2144
> (~100%)
> (XEN) CPU[11] runq=3D1, sibling=3D{11}, core=3D{8-15}
> (XEN) 	run: [0.3] flags=3D2 cpu=3D11 credit=3D9998469 [w=3D256] load=3D26=
2144
> (~100%)
> (XEN) CPU[12] runq=3D1, sibling=3D{12}, core=3D{8-15}
> (XEN) 	run: [10.0] flags=3D2 cpu=3D12 credit=3D7967846 [w=3D256] load=3D2=
62144
> (~100%)
> (XEN) CPU[13] runq=3D1, sibling=3D{13}, core=3D{8-15}
> (XEN) 	run: [9.1] flags=3D12 cpu=3D13 credit=3D7832232 [w=3D256] load=3D2=
62144
> (~100%)
> (XEN) CPU[14] runq=3D1, sibling=3D{14}, core=3D{8-15}
> (XEN) 	run: [11.0] flags=3D2 cpu=3D14 credit=3D7509378 [w=3D256] load=3D2=
62144
> (~100%)
> (XEN) CPU[15] runq=3D1, sibling=3D{15}, core=3D{8-15}
> (XEN) 	run: [12.0] flags=3D2 cpu=3D15 credit=3D7971164 [w=3D256] load=3D2=
62144
> (~100%)
> (XEN) RUNQ:
> (XEN) CPUs info:
> (XEN) CPU[00] current=3Dd4v0, curr=3Dd4v0, prev=3DNULL
> (XEN) CPU[01] current=3Dd3v0, curr=3Dd3v0, prev=3DNULL
> (XEN) CPU[02] current=3Dd5v0, curr=3Dd5v0, prev=3DNULL
> (XEN) CPU[03] current=3Dd[IDLE]v3, curr=3Dd[IDLE]v3, prev=3DNULL
> (XEN) CPU[04] current=3Dd7v0, curr=3Dd7v0, prev=3DNULL
> (XEN) CPU[05] current=3Dd2v0, curr=3Dd2v0, prev=3DNULL
> (XEN) CPU[06] current=3Dd1v0, curr=3Dd1v0, prev=3DNULL
> (XEN) CPU[07] current=3Dd8v1, curr=3Dd8v1, prev=3DNULL
> (XEN) CPU[08] current=3Dd0v13, curr=3Dd0v13, prev=3DNULL
> (XEN) CPU[09] current=3Dd0v5, curr=3Dd0v5, prev=3DNULL
> (XEN) CPU[10] current=3Dd6v0, curr=3Dd6v0, prev=3DNULL
> (XEN) CPU[11] current=3Dd0v3, curr=3Dd0v3, prev=3DNULL
> (XEN) CPU[12] current=3Dd10v0, curr=3Dd10v0, prev=3DNULL
> (XEN) CPU[13] current=3Dd9v1, curr=3Dd9v1, prev=3DNULL
> (XEN) CPU[14] current=3Dd11v0, curr=3Dd11v0, prev=3DNULL
> (XEN) CPU[15] current=3Dd12v0, curr=3Dd12v0, prev=3DNULL
>=20



--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--bwMunqOr7B7rzQrh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl+c0fMACgkQ24/THMrX
1ywgmQf/UhU+Md2Zt3o/m5Ux0c6dVpjFrh8NsDs9H2MnEi8kWhPyAb714yZU5Ha9
hz0jO2s8kO7iSvIOYQdf45RGorCL0vP971dqhPClrfEZ+MY88Yyb93CYdqUva5af
UJnGowutOanXQcuvJMRS1yaa9gfSPXRNPqjfg4Ky6L6CDBhb/ceK9jmq8W8Dn/2R
ZNS9XEuxEC3Q94V88eGiSUPPozsguokI5apg/amHMiBamjZ9fD9RiIZkuNNDoEDr
3Uh7cjc9sZlzGBc0+H7pxSmOPbD8sx8G2PLbJQ/EJivYZA1blzPLPUUB3HjdrTKh
spqO1IhyPrx4SxdAgVoMocDS9fqeHQ==
=NNx7
-----END PGP SIGNATURE-----

--bwMunqOr7B7rzQrh--

