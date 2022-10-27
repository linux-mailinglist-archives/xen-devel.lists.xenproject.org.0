Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB3560FFF4
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 20:14:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431143.683750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo7NS-0003f8-9L; Thu, 27 Oct 2022 18:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431143.683750; Thu, 27 Oct 2022 18:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo7NS-0003c8-5z; Thu, 27 Oct 2022 18:13:14 +0000
Received: by outflank-mailman (input) for mailman id 431143;
 Thu, 27 Oct 2022 18:13:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4k8K=24=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oo7NQ-0003c2-D2
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 18:13:12 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01b50e3d-5623-11ed-91b5-6bf2151ebd3b;
 Thu, 27 Oct 2022 20:13:09 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 95F273200ACA;
 Thu, 27 Oct 2022 14:13:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 27 Oct 2022 14:13:06 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Oct 2022 14:13:03 -0400 (EDT)
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
X-Inumbo-ID: 01b50e3d-5623-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1666894385; x=
	1666980785; bh=yHOCAXYXPvmZdJ2Y3WExOCbtnTnjCGpfS6blLilQoBY=; b=O
	ZaA2L0RmJE0afsVed7G17BCN/0QzsvBTDH61xUMG2qlcQPUB/yPQecRL5phb2Fb/
	3T3VPohi2y7kLC8DKqb8BraHoUvBfb7Mx/GRc2EWMYO2E4eFzj69sCYhM1O93+QJ
	Hn/AEpJac+I+3VIylEb+77ibcezm/0fMi/fIOs4Q/pCdGy4yqvbJdFL8+IhNpewQ
	PRBab2QZO724LnW7YUd3mUVjFZSWu+Ap2RRolhFoPogX4SJCxoZRU4I6SHawKZz7
	P/rf7zr8o72UrjfvvODYedud+OTHbdV31dBcwLrQScn89PCJ1S6/z4s45YCsMUAI
	wNF3AUumYlU64miWZa0hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666894385; x=1666980785; bh=yHOCAXYXPvmZdJ2Y3WExOCbtnTnj
	CGpfS6blLilQoBY=; b=OwdjQOBFOerlE0dSfISAuvhbXwLMJFFidooqvkIA6cvB
	udYH3EltDa7oMtmlHHiMlsR2/JVAwPDZhljycYeU3ieXZCY6CrjhOcp8HVSTlWvA
	BvrD5kpnSgEqXVVa3/tJLS/EuKMCEHqtrdjIt6MpzQD56p1+1YXNJOU2Bj5uqR+z
	9V9DPl/gx6rDtX3RXu6cv/5vNiP84i7Znbbml0IXUcI8MvQOB1HM+OROJ80PaTE4
	k8GUUz/A2SI9ljnRiW7CN509pNQY8sPYl9Rgo5wk79iIjvUlFfrJ24EDqqdbMfA4
	2Eb49nYEODILZZcfjRkl+us5NdtlQMSWs2vVsTWX2Q==
X-ME-Sender: <xms:MMpaY2HfGLWiuTU_jVwjsUjUnK3K25ZWIxshtkMGUyDxtTqh_jlQQQ>
    <xme:MMpaY3VeqsfcsXsBUcTa4rQOOD4mfy3r8CS69LritKdpkWx8njFfZftNaVM0F1XWb
    Osvkw_9PR9mEQ>
X-ME-Received: <xmr:MMpaYwKuo5WVpFKUqS5TbiJIM4jhbhdUt236pkG1_mwR6NyJ6FTRWEjK5jDz-uf305-ejSfev7JW_VY_YWBxQVxANwyq6VyRleMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdeggdduvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:McpaYwFPwi_pH-g0q10dE_axtM_0ZrYWjBGIiT7fyMCpZDHOtlbvoQ>
    <xmx:McpaY8VN5tetw3IIKKbkBos6pyIXL3rsXiL817QB7lQwya5uX0CO4A>
    <xmx:McpaYzO3cN_wyA6qjrwUZOw34sGjUn8LYBaEDKhOVTIBZnaZTEZttQ>
    <xmx:McpaYzSwV9zJL3mGEfyEztCy2FHtDtP2F0IxB8-X2JMFFKCSk_tYQw>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 27 Oct 2022 20:13:00 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH-for-4.17] xen/sched: migrate timers to correct cpus after
 suspend
Message-ID: <Y1rKLJP/p+E+eVi7@mail-itl>
References: <20221021145357.17931-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dMEw57xvfhB1YxK7"
Content-Disposition: inline
In-Reply-To: <20221021145357.17931-1-jgross@suse.com>


--dMEw57xvfhB1YxK7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Oct 2022 20:13:00 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH-for-4.17] xen/sched: migrate timers to correct cpus after
 suspend

On Fri, Oct 21, 2022 at 04:53:57PM +0200, Juergen Gross wrote:
> Today all timers are migrated to cpu 0 when the system is being
> suspended. They are not migrated back after resuming the system again.
>=20
> This results (at least) to problems with the credit scheduler, as the
> timer isn't handled on the cpu it was expected to occur.
>=20
> Add migrating the scheduling related timers of a specific cpu from cpu
> 0 back to its original cpu when that cpu has gone up when resuming the
> system.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>

I tested it in my setup, but it crashed:

(XEN) arch/x86/cpu/mcheck/mce_intel.c:770: MCA Capability: firstbank 0, ext=
ended MCE MSR 0, BCAST, CMCI
(XEN) CPU0 CMCI LVT vector (0xf1) already installed
(XEN) Finishing wakeup from ACPI S3 state.
(XEN) Enabling non-boot CPUs  ...
(XEN) Platform timer appears to have unexpectedly wrapped 3 times.
(XEN) ----[ Xen-4.17-rc  x86_64  debug=3Dy  Tainted:   C    ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d040250c7e>] sched_migrate_timers+0x4d/0xc9
(XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor
(XEN) rax: ffff82d0405c5298   rbx: 0000000000000000   rcx: 0000000000000001
(XEN) rdx: 0000003211219000   rsi: 0000000000000004   rdi: 0000000000000001
(XEN) rbp: ffff830256227d20   rsp: ffff830256227d18   r8:  ffff82d0405d2f78
(XEN) r9:  ffff82d0405ef8a0   r10: 00000000ffffffff   r11: 00000000002191c0
(XEN) r12: 0000000000000000   r13: 0000000000000001   r14: 0000000000000004
(XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 00000000003526e0
(XEN) cr3: 0000000049677000   cr2: 0000000000000070
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d040250c7e> (sched_migrate_timers+0x4d/0xc9):
(XEN)  48 8b 14 ca 48 8b 1c 02 <39> 7b 70 74 51 48 8d 05 56 34 37 00 48 89 =
e2 48
(XEN) Xen stack trace from rsp=3Dffff830256227d18:
(XEN)    0000000000000001 ffff830256227d58 ffff82d04023f1a0 ffff82d04047a308
(XEN)    ffff82d04047a300 ffff82d04047a060 0000000000000004 0000000000000000
(XEN)    ffff830256227da0 ffff82d040226a04 0000000000000000 0000000000000001
(XEN)    0000000000000001 0000000000000000 0000000000000001 ffff830256227fff
(XEN)    ffff82d04046c520 ffff830256227db8 ffff82d040207e75 0000000000000001
(XEN)    ffff830256227de0 ffff82d040208243 ffff82d04047a220 0000000000000001
(XEN)    0000000000000010 ffff830256227e18 ffff82d040208428 0000000000000200
(XEN)    0000000000000000 0000000000000003 ffff830256227ef8 ffff82d0405de6c0
(XEN)    ffff830256227e48 ffff82d04027a2df ffff830251491490 ffff830251757000
(XEN)    0000000000000000 0000000000000000 ffff830256227e68 ffff82d040209c73
(XEN)    ffff8302517571b8 ffff82d040479618 ffff830256227e88 ffff82d04022e484
(XEN)    ffff82d0405c41a0 ffff82d0405c41b0 ffff830256227eb8 ffff82d04022e76e
(XEN)    0000000000000000 0000000000007fff ffff82d0405caf00 ffff82d0405c41b0
(XEN)    ffff830256227ef0 ffff82d0402f455d ffff82d0402f44e5 ffff830251757000
(XEN)    ffff830256227ef8 ffff8302517f5000 0000000000000000 ffff830256227e18
(XEN)    0000000000000000 ffffc90040b43d60 0000000000003403 0000000000000000
(XEN)    0000000000000003 ffffffff82e37868 0000000000000246 0000000000000003
(XEN)    0000000000003403 0000000000003403 0000000000000000 ffffffff81e4a0ea
(XEN)    0000000000003403 0000000000000010 deadbeefdeadf00d 0000010000000000
(XEN)    ffffffff81e4a0ea 000000000000e033 0000000000000246 ffffc90040b43c30
(XEN) Xen call trace:
(XEN)    [<ffff82d040250c7e>] R sched_migrate_timers+0x4d/0xc9
(XEN)    [<ffff82d04023f1a0>] F cpupool.c#cpu_callback+0x13d/0x47e
(XEN)    [<ffff82d040226a04>] F notifier_call_chain+0x6c/0x96
(XEN)    [<ffff82d040207e75>] F cpu.c#cpu_notifier_call_chain+0x1b/0x36
(XEN)    [<ffff82d040208243>] F cpu_up+0xaf/0xc8
(XEN)    [<ffff82d040208428>] F enable_nonboot_cpus+0x7b/0x1ef
(XEN)    [<ffff82d04027a2df>] F power.c#enter_state_helper+0x156/0x5dc
(XEN)    [<ffff82d040209c73>] F domain.c#continue_hypercall_tasklet_handler=
+0x50/0xbf
(XEN)    [<ffff82d04022e484>] F tasklet.c#do_tasklet_work+0x7b/0xac
(XEN)    [<ffff82d04022e76e>] F do_tasklet+0x58/0x8a
(XEN)    [<ffff82d0402f455d>] F domain.c#idle_loop+0x78/0xe6
(XEN)=20
(XEN) Pagetable walk from 0000000000000070:
(XEN)  L4[0x000] =3D 00000002517fb063 ffffffffffffffff
(XEN)  L3[0x000] =3D 00000002517fa063 ffffffffffffffff
(XEN)  L2[0x000] =3D 00000002517f9063 ffffffffffffffff
(XEN)  L1[0x000] =3D 0000000000000000 ffffffffffffffff
(XEN)=20
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) FATAL PAGE FAULT
(XEN) [error_code=3D0000]
(XEN) Faulting linear address: 0000000000000070
(XEN) ****************************************

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--dMEw57xvfhB1YxK7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmNayi0ACgkQ24/THMrX
1ywtEwf/RtLpNcPpYjAHTuJpdiUQS46/uilMBQzJ9WbnatCUEPfyPNCyr/I1IaYE
PzOL6m39i3d5sKsbIyVoKLfoMY6A16WG8BufCU82vkBXADMcaDPAq2OAk11awu5m
4YbEJMqMl1/YiJ3Au/Qaga3QQI1juLvHKvLrICVQMb/RBgTfmsRQmZ48+Ru1kSej
9lyWZm+PdX3WDnfKgqf0v/BVpC3Z5OOggUtoEYOXvc6ksTXbT0V5/AeFGHRQsqzu
vH/PrEX0YxA0qfrkTAlRunxRp+dZ3W9faCuJ7IgK/w1lzpXZ85O/QvQgKIW85Mh6
MGYjdnWgQ6fRuRqAlGQn+IwKQ7Q7Pg==
=u11S
-----END PGP SIGNATURE-----

--dMEw57xvfhB1YxK7--

