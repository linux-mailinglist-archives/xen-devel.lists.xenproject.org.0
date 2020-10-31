Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C153C2A1363
	for <lists+xen-devel@lfdr.de>; Sat, 31 Oct 2020 05:09:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.16767.41594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYiBl-0007VU-7F; Sat, 31 Oct 2020 04:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16767.41594; Sat, 31 Oct 2020 04:08:25 +0000
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
	id 1kYiBl-0007V5-3n; Sat, 31 Oct 2020 04:08:25 +0000
Received: by outflank-mailman (input) for mailman id 16767;
 Sat, 31 Oct 2020 04:08:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CThl=EG=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kYiBj-0007V0-FH
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 04:08:23 +0000
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12f4fab8-4f74-4eff-a87f-b6b8f78a636d;
 Sat, 31 Oct 2020 04:08:22 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 13BFE5C00FB;
 Sat, 31 Oct 2020 00:08:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 31 Oct 2020 00:08:22 -0400
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id D1FB13280063;
 Sat, 31 Oct 2020 00:08:20 -0400 (EDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CThl=EG=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
	id 1kYiBj-0007V0-FH
	for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 04:08:23 +0000
X-Inumbo-ID: 12f4fab8-4f74-4eff-a87f-b6b8f78a636d
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 12f4fab8-4f74-4eff-a87f-b6b8f78a636d;
	Sat, 31 Oct 2020 04:08:22 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 13BFE5C00FB;
	Sat, 31 Oct 2020 00:08:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sat, 31 Oct 2020 00:08:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+PAx6r
	Uq+oxuTLVOrzZ1M1wnf5y1nOwQIKtU+KCWbVo=; b=CMQhY+hZ+Ve3M/nkA8c9nu
	fPpOXweVrLGdGXs+7ZzFzpLIg+EGmvrD7s9wB009rERu0I03bSRSNntFJQaWHneC
	ApjeOtJKea1sVqGU7sr9CoT/ywYtlQwAX7OcYzv+m8MztAFRvS7ogqVXbktkHCrT
	OCxfFljL+Fh9Q8rCwL/r9tu7vnbf99oVkqthqKs2RxE/N2T64Bb7KPJTv3OrIZdP
	F/qmsWy61UdKkzJ3Ou053TF9ou5gxEZPAZZzWoUBadqNETuzZAqElhhV1ikoMtlX
	G3USJ85V5adKWmPNhTM5k47zbTlNwDRH0qhmj+6cN2RdgHAdnigDSLKwZ0IXh6sA
	==
X-ME-Sender: <xms:NeOcX2y6Vtxg_ioPp6TWRuJ2C6oqbag1ufH284QH28eWRyGdNw4FdA>
    <xme:NeOcXySE8Iexr6uYQ6uZke198KwpqJ0AOK7pbJZarOn3NBlatLQCPDv3rZmWo8L5z
    o7OMIq4wjgOlA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleeigdeigecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepfdhmrghrmhgr
    rhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmfdcuoehmrghrmhgrrh
    gvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgv
    rhhnpeegieffhefgvedtteelueegtedtkedvkefhhfekgeduheefgfefheelveefiefgvd
    enucfkphepledurdeigedrudejtddrkeelnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhih
    hnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:NeOcX4XzsPgQY14pqTDEfKbhQFtWv5eaKprg0chvLhgvHSi4AmtBFg>
    <xmx:NeOcX8iZoPfppcQhod2eerL6dJbhYvo99ZgOtU1g_1IYeXLg1Vd9eg>
    <xmx:NeOcX4DuLiqdYFtdf4-W6IAwRzG_gHa8igsUWY78BLoEDTZWJC9E9A>
    <xmx:NuOcX7NLeUvTqzepxZKvpQd7PTVoM66amVUt4xKs8njUIjle9qOW7A>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de [91.64.170.89])
	by mail.messagingengine.com (Postfix) with ESMTPA id D1FB13280063;
	Sat, 31 Oct 2020 00:08:20 -0400 (EDT)
Date: Sat, 31 Oct 2020 05:08:17 +0100
From: "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: Juergen Gross <JGross@suse.com>,
	"frederic.pierret@qubes-os.org" <frederic.pierret@qubes-os.org>,
	"George.Dunlap@citrix.com" <George.Dunlap@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Subject: Re: Recent upgrade of 4.13 -> 4.14 issue
Message-ID: <20201031040817.GG1447@mail-itl>
References: <30452e9c-bf27-fce2-cc20-4ce91018a15a@citrix.com>
 <deefd340-ec7a-bbb9-7471-d147da174f4a@suse.com>
 <a333ea82c12086874f705fc9ea9baa991235edd4.camel@suse.com>
 <533ce2f2-f268-a70b-fad7-d8f3f4033209@suse.com>
 <182a90a89cc02beec9760559799e74572e18ce49.camel@suse.com>
 <9632dc14-46d5-83c0-7e44-0c3bd4f5154a@qubes-os.org>
 <ce07254a-0775-d35c-559b-7d9ab642accf@qubes-os.org>
 <b1a18e6ed88db3c40a54c7ca15c3399bdc6f2b9c.camel@suse.com>
 <20201031025442.GF1447@mail-itl>
 <c17e7a152a7e1922bd9c729f70a96acf4ca5240b.camel@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TXtjXAp+Y+VkYOQB"
Content-Disposition: inline
In-Reply-To: <c17e7a152a7e1922bd9c729f70a96acf4ca5240b.camel@suse.com>


--TXtjXAp+Y+VkYOQB
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Recent upgrade of 4.13 -> 4.14 issue

On Sat, Oct 31, 2020 at 04:27:58AM +0100, Dario Faggioli wrote:
> On Sat, 2020-10-31 at 03:54 +0100, marmarek@invisiblethingslab.com
> wrote:
> > On Sat, Oct 31, 2020 at 02:34:32AM +0000, Dario Faggioli wrote:
> > (XEN) *** Dumping CPU7 host state: ***
> > (XEN) Xen call trace:
> > (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d040223625>] R _spin_lock+0x35/0x40
> > (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d0402233cd>] S on_selected_cpus+0x1d/0x=
c0
> > (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d040284aba>] S vmx_do_resume+0xba/0x1b0
> > (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d0402df160>] S context_switch+0x110/0xa=
60
> > (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d04024310a>] S core.c#schedule+0x1aa/0x=
250
> > (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d040222d4a>] S softirq.c#__do_softirq+0=
x5a/0xa0
> > (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d040291b6b>] S vmx_asm_do_vmentry+0x2b/=
0x30
> >=20
> > And so on, for (almost?) all CPUs.
>
> Right. So, it seems like a live (I would say) lock. It might happen on
> some resource which his shared among domains. And introduced (the
> livelock, not the resource or the sharing) in 4.14.
>=20
> Just giving a quick look, I see that vmx_do_resume() calls
> vmx_clear_vmcs() which calls on_selected_cpus() which takes the
> call_lock spinlock.
>=20
> And none of these seems to have received much attention recently.
>=20
> But this is just a really basic analysis!

I've looked at on_selected_cpus() and my understanding is this:
1. take call_lock spinlock
2. set function+args+what cpus to be called in a global "call_data" variable
3. ask CPUs to execute that function (smp_send_call_function_mask() call)
4. wait for all requested CPUs to execute the function, still holding
the spinlock
5. only then - release the spinlock

So, if any CPU does not execute requested function for any reason, it
will keep the call_lock locked forever.

I don't see any CPU waiting on step 4, but also I don't see call traces
=66rom CPU3 and CPU8 in the log - that's because they are in guest (dom0
here) context, right? I do see "guest state" dumps from them.
The only three CPUs that do logged xen call traces and are not waiting on t=
hat
spin lock are:

CPU0:
(XEN) Xen call trace:
(XEN)    [<ffff82d040240f89>] R vcpu_unblock+0x9/0x50
(XEN)    [<ffff82d0402e0171>] S vcpu_kick+0x11/0x60
(XEN)    [<ffff82d0402259c8>] S tasklet.c#do_tasklet_work+0x68/0xc0
(XEN)    [<ffff82d040225a59>] S tasklet.c#tasklet_softirq_action+0x39/0x60
(XEN)    [<ffff82d040222d4a>] S softirq.c#__do_softirq+0x5a/0xa0
(XEN)    [<ffff82d040291b6b>] S vmx_asm_do_vmentry+0x2b/0x30

CPU4:
(XEN) Xen call trace:
(XEN)    [<ffff82d040227043>] R set_timer+0x133/0x220
(XEN)    [<ffff82d040234e90>] S credit.c#csched_tick+0/0x3a0
(XEN)    [<ffff82d04022660f>] S timer.c#timer_softirq_action+0x9f/0x300
(XEN)    [<ffff82d040222d4a>] S softirq.c#__do_softirq+0x5a/0xa0
(XEN)    [<ffff82d0402d64e6>] S x86_64/entry.S#process_softirqs+0x6/0x20

CPU14:
(XEN) Xen call trace:
(XEN)    [<ffff82d040222dc0>] R do_softirq+0/0x10
(XEN)    [<ffff82d0402d64e6>] S x86_64/entry.S#process_softirqs+0x6/0x20

I'm not sure if any of those is related to that spin lock,
on_selected_cpus() call, or anything like that...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--TXtjXAp+Y+VkYOQB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl+c4zEACgkQ24/THMrX
1yxW9wf/ZPjzMYLiq0CsKNmHRuOGrKJyIwcynFReZ2Fe7UmppKsmw9DF7j15m/kQ
mHcS024GreWDMyNuNkgJTMcpaVSpxXa1khFDnBt3Dp3VA9mrdrTRrY8kio2cQkdJ
Wt2Vn/dHxAjFCmKsidEBij+3BzVDxkH6vOxT6+XPe4aLOMY4xGTSg8BI0YNi+IT6
C9srC8rHWqgfd4k2DdWX6iNbKlxl591Cshb8Sh0RfIjRFdEALM+PAmhmk6A8x7db
We/fh3cwI8UqeRqImVSvgPwdCCLPaTKt20p14roJ194DMtxrWLtH4zoDiWWAS2hi
9RmhiOviKbJQwpyEtkexAGWHPVlcAg==
=L++n
-----END PGP SIGNATURE-----

--TXtjXAp+Y+VkYOQB--

