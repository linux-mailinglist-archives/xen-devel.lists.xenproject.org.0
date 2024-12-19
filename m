Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E5B9F7F29
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 17:16:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861353.1273281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOJB1-00053u-U4; Thu, 19 Dec 2024 16:15:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861353.1273281; Thu, 19 Dec 2024 16:15:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOJB1-00050j-RL; Thu, 19 Dec 2024 16:15:03 +0000
Received: by outflank-mailman (input) for mailman id 861353;
 Thu, 19 Dec 2024 16:15:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2LI=TM=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tOJAz-00050d-Vh
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 16:15:02 +0000
Received: from fout-b2-smtp.messagingengine.com
 (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6414c78b-be24-11ef-a0d8-8be0dac302b0;
 Thu, 19 Dec 2024 17:14:58 +0100 (CET)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfout.stl.internal (Postfix) with ESMTP id 7B6AD1140162
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 11:14:57 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Thu, 19 Dec 2024 11:14:57 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 11:14:56 -0500 (EST)
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
X-Inumbo-ID: 6414c78b-be24-11ef-a0d8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1734624897; x=1734711297; bh=+qZge1U3yN
	JTy1trbgqrNjkQxeSGxxlbu+AlcLUwwi8=; b=CvhQlTQsWjK4fLGVbBgfKVJHIs
	6dQbFUOWTQa8VOOZZ2WfIL9sY79wCOIvnTcjw1Vs0XYUIEnItIB0BTrJ0ffodJQ7
	0IRZ6vj22EGF56BvpXyY7Uw/t5/qgOmfcXd8QQF0kAJXU21irAj9LMR79WNcrzsM
	+d1Ob6/+NLZ2FfE7U7a0R/oJEza5Tme8Xm1H3ah7ZnIfqscPmAACoL71uArbJ4ar
	FpoaJTGmINUw3PANv8Dint6esHNJVdEVpwlu7/I5D7duDBXuBei0IH+dwWXh+Cq/
	4Il+lM5b5eWnHHRfM0CV5sAsiMGFfaOKEMxBdIndH6diCdD+UDfnVFmSWmvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734624897; x=
	1734711297; bh=+qZge1U3yNJTy1trbgqrNjkQxeSGxxlbu+AlcLUwwi8=; b=M
	C6HBJX9XIQMySSjlPg7RD/bMgpt8f64kmlBTK2Sv7zKdXU+hZKzAxZudCgZ3zcHp
	+cZ8mFSPwF34QmmmZR6DU8IiPOsklcZEQPzoPz4kEW3GRfYZoH6dUW/yAsGn0AEt
	7IoYJ3YhGh5pRTEZNVyhQHOVH88WEVmxH+KcBWdZ5jyJkQPV0kWeC6cXt7B2WfIC
	aekeKC1Kd3Y6CBliaQF6QFP+dQSA+3X+G6IEJlUa2/mZEijPf0LtBnJMHZrpkw+1
	WK40W0RXU3Xvqi5nWjp61BxfcghZ78JgRlvlmES06FwOg4dyimzgs2DclYC8i91Y
	nPVz9JM43el1DL0lmY39A==
X-ME-Sender: <xms:gEZkZ9vNsXjYfaqapljI7x2BQIZ048GamprJBobqifjjpdvWsfx0ag>
    <xme:gEZkZ2eEgRrQ0F-uP3sIjyqx3bosKf3fbw_fSU-zLtCef1OFT17nvQSGG2yaFDjA2
    jm_2od1HoUjrg>
X-ME-Received: <xmr:gEZkZwxCbv4UcAUBnnchu3Xmn4Bcl_1z0-ywDwtMMAb_c0q-CE5Bmr27R6ka_9MDA7fPS3I-NIS5xJhWtblJf22WPpJ0oqvRUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddttddgkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuf
    fkgggtugesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihs
    khhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptddugfeuhfehfeetueeujeeiieeg
    gfdthfdtuedvudekjeetiedtfeejtedvjeejnecuffhomhgrihhnpehqvghmuhdrohhrgh
    dpqhhusggvshdqohhsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomhdpnhgspghrtghpthhtohepuddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:gEZkZ0NTPPQJgxuMGRK_4tj7u1_pnq3Ab8Jku3pjLAhIB3i2a1OyOw>
    <xmx:gEZkZ99phUjk9MWv37U2BOJ-08Yg9bwooX7-Y_PwzghLO8EH3txszw>
    <xmx:gEZkZ0UKZzqfmqXBClscqPobi27VNLuS-0GLU9dZwPi-aQTF30dQwQ>
    <xmx:gEZkZ-fuUjGIq1gst4oCIkJK0KJji_KMaS5z_S1yxTLQDq55d_SHTw>
    <xmx:gUZkZ_ljg7T0M_X3Ntc6UVSS630fQ7PvckIoPJdyymhfVkiMh2v6bbHO>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 19 Dec 2024 17:14:52 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Linux 6.13-rc3 many different panics in Xen PV dom0
Message-ID: <Z2RGfpJkO0z_nKV6@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="q36KIBHH+nmi0JO5"
Content-Disposition: inline


--q36KIBHH+nmi0JO5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Dec 2024 17:14:52 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Linux 6.13-rc3 many different panics in Xen PV dom0

Hi,

It crashes on boot like below, most of the times. But sometimes (rarely)
it manages to stay alive. Below I'm pasting few of the crashes that look
distinctly different, if you follow the links, you can find more of
them. IMHO it looks like some memory corruption bug somewhere. I tested
also Linux 6.13-rc2 before, and it had very similar issue.

The traces below are all from nested virt (Xen inside KVM), tests with
Xen directly on the hardware are still in progress. But -rc2 failed all
of them too, so if it's the same issue, I guess they will looks similar.

Who should I CC here? The failures are all over the place... linux-mm?

[    1.743728] ------------[ cut here ]------------
[    1.744911] WARNING: CPU: 0 PID: 105 at arch/x86/xen/multicalls.c:188 xe=
n_mc_flush+0x226/0x4f0
[    1.746474] Modules linked in:
[    1.747093] CPU: 0 UID: 0 PID: 105 Comm: modprobe Not tainted 6.13.0-0.r=
c3.2.qubes.1.fc41.x86_64 #1
[    1.748722] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel=
-1.16.3-2-gc13ff2cd-prebuilt.qemu.org 04/01/2014
[    1.750634] RIP: e030:xen_mc_flush+0x226/0x4f0
[    1.751484] Code: c0 48 c1 e0 05 48 05 00 70 3c 81 e8 d4 98 0e 01 48 89 =
45 18 48 85 c0 0f 89 b6 fe ff ff 44 8b b3 e0 f2 01 00 41 bf 01 00 00 00 <0f=
> 0b 65 8b 0d bd 34 d4 7f 44 89 f2 44 89 fe 48 c7 c7 70 0f d5 81
[    1.754715] RSP: e02b:ffffc900404e7978 EFLAGS: 00010086
[    1.755688] RAX: fffffffffffffff0 RBX: ffff88817fe00000 RCX: ffff88817fe=
1f2f0
[    1.756971] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff88817fe=
1faf0
[    1.758258] RBP: ffff88817fe1f2e0 R08: 0000000000000000 R09: ffff8881016=
95dc0
[    1.759540] R10: 0000000000007ff0 R11: 00000000000000e4 R12: 00000000000=
00042
[    1.760829] R13: 0000000000000000 R14: 0000000000000001 R15: 00000000000=
00001
[    1.762122] FS:  0000709a60dc5740(0000) GS:ffff88817fe00000(0000) knlGS:=
0000000000000000
[    1.763575] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.764633] CR2: 00007ffd77bc48c8 CR3: 0000000100a22000 CR4: 00000000000=
50660
[    1.765921] Call Trace:
[    1.766431]  <TASK>
[    1.766891]  ? show_trace_log_lvl+0x1b0/0x2f0
[    1.767726]  ? show_trace_log_lvl+0x1b0/0x2f0
[    1.768560]  ? xen_leave_lazy_mmu+0x15/0x60
[    1.769349]  ? xen_mc_flush+0x226/0x4f0
[    1.770093]  ? __warn.cold+0x93/0xf2
[    1.770795]  ? xen_mc_flush+0x226/0x4f0
[    1.771535]  ? report_bug+0xff/0x140
[    1.772236]  ? handle_bug+0x58/0x90
[    1.772924]  ? exc_invalid_op+0x17/0x70
[    1.773659]  ? asm_exc_invalid_op+0x1a/0x20
[    1.774448]  ? xen_mc_flush+0x226/0x4f0
[    1.775188]  ? xen_mc_flush+0x20c/0x4f0
[    1.775923]  ? xen_extend_mmu_update+0x4e/0xd0
[    1.776764]  xen_leave_lazy_mmu+0x15/0x60
[    1.777526]  set_ptes.constprop.0+0x1f/0x30
[    1.778322]  __text_poke+0x18c/0x4a0
[    1.779017]  ? __pfx_text_poke_memcpy+0x10/0x10
[    1.779877]  text_poke_copy_locked+0x63/0xa0
[    1.780696]  text_poke_copy+0x32/0x50
[    1.781408]  post_relocation+0xfd/0x190
[    1.782146]  load_module+0x480/0x810
[    1.782843]  init_module_from_file+0x86/0xc0
[    1.783661]  idempotent_init_module+0x115/0x310
[    1.784519]  __x64_sys_finit_module+0x65/0xc0
[    1.785351]  do_syscall_64+0x82/0x160
[    1.786064]  ? syscall_exit_to_user_mode+0x15/0x210
[    1.786975]  ? do_syscall_64+0x8e/0x160
[    1.787708]  ? xen_extend_mmu_update+0x4e/0xd0
[    1.788552]  ? xen_leave_lazy_mmu+0x15/0x60
[    1.789342]  ? set_ptes.isra.0+0x79/0x90
[    1.790100]  ? _raw_spin_unlock+0xe/0x30
[    1.790847]  ? do_anonymous_page+0x103/0x4a0
[    1.791664]  ? __handle_mm_fault+0x39a/0x6f0
[    1.796723]  ? do_syscall_64+0x8e/0x160
[    1.797457]  ? __count_memcg_events+0xc0/0x180
[    1.798310]  ? count_memcg_events.constprop.0+0x24/0x30
[    1.799274]  ? handle_mm_fault+0x20d/0x330
[    1.800055]  ? do_user_addr_fault+0x55a/0x7b0
[    1.800885]  ? exc_page_fault+0x83/0x180
[    1.801640]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[    1.802598] RIP: 0033:0x709a60ebca5d
[    1.803300] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 =
89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48=
> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 83 73 0f 00 f7 d8 64 89 01 48
[    1.806707] RSP: 002b:00007ffd77bc7868 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000139
[    1.808096] RAX: ffffffffffffffda RBX: 0000644519919a00 RCX: 0000709a60e=
bca5d
[    1.809386] RDX: 0000000000000000 RSI: 00006444e143f715 RDI: 00000000000=
00000
[    1.810935] RBP: 00007ffd77bc7920 R08: 0000709a60fb4b20 R09: 00000000000=
00000
[    1.812182] R10: 0000644519919e50 R11: 0000000000000246 R12: 00006444e14=
3f715
[    1.813422] R13: 0000000000040000 R14: 0000644519919c40 R15: 00006445199=
19470
[    1.814662]  </TASK>
[    1.815124] ---[ end trace 0000000000000000 ]---
[    1.815967] 1 of 1 multicall(s) failed: cpu 0
[    1.816769]   call  1: op=3D1 arg=3D[ffff88817fe1faf0] result=3D-16
[    1.817799] BUG: unable to handle page fault for address: 00006a042c1ac0=
00
[    1.818988] #PF: supervisor write access in kernel mode
[    1.819930] #PF: error_code(0x0002) - not-present page
[    1.820847] PGD 100085067 P4D 100085067 PUD 100086067 PMD 100087067 PTE 0
[    1.822021] Oops: Oops: 0002 [#1] PREEMPT SMP NOPTI
[    1.822900] CPU: 0 UID: 0 PID: 105 Comm: modprobe Tainted: G        W   =
       6.13.0-0.rc3.2.qubes.1.fc41.x86_64 #1
[    1.824686] Tainted: [W]=3DWARN
[    1.825275] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel=
-1.16.3-2-gc13ff2cd-prebuilt.qemu.org 04/01/2014
[    1.827109] RIP: e030:memcpy+0xc/0x20
[    1.827799] Code: 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 90 90 90 90 =
90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 48 89 f8 48 89 d1 <f3=
> a4 c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 66 90 90 90
[    1.830926] RSP: e02b:ffffc900404e79f0 EFLAGS: 00010006
[    1.831859] RAX: 00006a042c1ac000 RBX: 0000000000001000 RCX: 00000000000=
01000
[    1.833091] RDX: 0000000000001000 RSI: ffffc900400c5000 RDI: 00006a042c1=
ac000
[    1.834324] RBP: ffffffffc0401000 R08: 0000000000000000 R09: 3120206c6c6=
16320
[    1.835559] R10: 0000000000007ff0 R11: 20206c6c61632020 R12: ffff8881000=
8f380
[    1.836792] R13: 0000000000000000 R14: 0000000000001000 R15: ffff8881000=
8d280
[    1.838029] FS:  0000709a60dc5740(0000) GS:ffff88817fe00000(0000) knlGS:=
0000000000000000
[    1.839461] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.840591] CR2: 00006a042c1ac000 CR3: 0000000100082000 CR4: 00000000000=
50660
[    1.841834] Call Trace:
[    1.842328]  <TASK>
[    1.842782]  ? show_trace_log_lvl+0x1b0/0x2f0
[    1.843588]  ? show_trace_log_lvl+0x1b0/0x2f0
[    1.844417]  ? __text_poke+0x250/0x4a0
[    1.845298]  ? __die_body.cold+0x8/0x12
[    1.846055]  ? page_fault_oops+0x146/0x160
[    1.846824]  ? exc_page_fault+0x7e/0x180
[    1.847584]  ? asm_exc_page_fault+0x26/0x30
[    1.848372]  ? memcpy+0xc/0x20
[    1.848977]  __text_poke+0x250/0x4a0
[    1.849647]  ? __pfx_text_poke_memcpy+0x10/0x10
[    1.850481]  text_poke_copy_locked+0x63/0xa0
[    1.851270]  text_poke_copy+0x32/0x50
[    1.851963]  post_relocation+0xfd/0x190
[    1.852675]  load_module+0x480/0x810
[    1.853353]  init_module_from_file+0x86/0xc0
[    1.854148]  idempotent_init_module+0x115/0x310
[    1.855022]  __x64_sys_finit_module+0x65/0xc0
[    1.855846]  do_syscall_64+0x82/0x160
[    1.856567]  ? syscall_exit_to_user_mode+0x15/0x210
[    1.857531]  ? do_syscall_64+0x8e/0x160
[    1.858247]  ? xen_extend_mmu_update+0x4e/0xd0
[    1.859062]  ? xen_leave_lazy_mmu+0x15/0x60
[    1.859830]  ? set_ptes.isra.0+0x79/0x90
[    1.860555]  ? _raw_spin_unlock+0xe/0x30
[    1.861277]  ? do_anonymous_page+0x103/0x4a0
[    1.862077]  ? __handle_mm_fault+0x39a/0x6f0
[    1.862873]  ? do_syscall_64+0x8e/0x160
[    1.863586]  ? __count_memcg_events+0xc0/0x180
[    1.864407]  ? count_memcg_events.constprop.0+0x24/0x30
[    1.865349]  ? handle_mm_fault+0x20d/0x330
[    1.866120]  ? do_user_addr_fault+0x55a/0x7b0
[    1.866947]  ? exc_page_fault+0x83/0x180
[    1.867674]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[    1.868591] RIP: 0033:0x709a60ebca5d
[    1.869271] Code: Unable to access opcode bytes at 0x709a60ebca33.
[    1.870358] RSP: 002b:00007ffd77bc7868 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000139
[    1.871697] RAX: ffffffffffffffda RBX: 0000644519919a00 RCX: 0000709a60e=
bca5d
[    1.872938] RDX: 0000000000000000 RSI: 00006444e143f715 RDI: 00000000000=
00000
[    1.874178] RBP: 00007ffd77bc7920 R08: 0000709a60fb4b20 R09: 00000000000=
00000
[    1.875420] R10: 0000644519919e50 R11: 0000000000000246 R12: 00006444e14=
3f715
[    1.876656] R13: 0000000000040000 R14: 0000644519919c40 R15: 00006445199=
19470
[    1.877893]  </TASK>
[    1.878348] Modules linked in:
[    1.878946] CR2: 00006a042c1ac000
[    1.879585] ---[ end trace 0000000000000000 ]---
[    1.880429] RIP: e030:memcpy+0xc/0x20
[    1.881112] Code: 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 90 90 90 90 =
90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 48 89 f8 48 89 d1 <f3=
> a4 c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 66 90 90 90
[    1.884228] RSP: e02b:ffffc900404e79f0 EFLAGS: 00010006
[    1.885158] RAX: 00006a042c1ac000 RBX: 0000000000001000 RCX: 00000000000=
01000
[    1.886388] RDX: 0000000000001000 RSI: ffffc900400c5000 RDI: 00006a042c1=
ac000
[    1.887619] RBP: ffffffffc0401000 R08: 0000000000000000 R09: 3120206c6c6=
16320
[    1.888852] R10: 0000000000007ff0 R11: 20206c6c61632020 R12: ffff8881000=
8f380
[    1.890128] R13: 0000000000000000 R14: 0000000000001000 R15: ffff8881000=
8d280
[    1.891377] FS:  0000709a60dc5740(0000) GS:ffff88817fe00000(0000) knlGS:=
0000000000000000
[    1.892788] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.893805] CR2: 00006a042c1ac000 CR3: 0000000100082000 CR4: 00000000000=
50660
[    1.895039] Kernel panic - not syncing: Fatal exception
[    1.895971] Kernel Offset: disabled

Full log:
https://openqa.qubes-os.org/tests/122879/logfile?filename=3Dserial0.txt

Another failure looks like this:

[    1.813118] BUG: unable to handle page fault for address: ffffea66666666=
48
[    1.814401] #PF: supervisor read access in kernel mode
[    1.815428] #PF: error_code(0x0000) - not-present page
[    1.816472] PGD 7f7d1067 P4D 7f7d1067 PUD 0=20
[    1.817286] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
[    1.818157] CPU: 0 UID: 0 PID: 214 Comm: modprobe Not tainted 6.13.0-0.r=
c3.2.qubes.1.fc41.x86_64 #1
[    1.819864] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel=
-1.16.3-2-gc13ff2cd-prebuilt.qemu.org 04/01/2014
[    1.821711] RIP: e030:migration_entry_wait_on_locked+0x69/0x2e0
[    1.823058] Code: 00 48 c7 44 24 20 00 00 00 00 f3 48 ab e9 56 01 00 00 =
48 b8 ff ff ff ff ff 00 00 00 48 21 d0 48 c1 e0 06 48 03 05 0f 97 89 01 <48=
> 8b 48 08 49 89 c6 f6 c1 01 0f 85 39 02 00 00 0f 1f 44 00 00 48
[    1.826206] RSP: e02b:ffffc90041187940 EFLAGS: 00010282
[    1.827138] RAX: ffffea6666666640 RBX: ccccccccccccccc0 RCX: 00000000000=
00000
[    1.828377] RDX: 6401999999999999 RSI: ffffc90041187968 RDI: ffffc900411=
879a0
[    1.829631] RBP: 6401999999999999 R08: 0000000000000067 R09: ffffc900411=
87ad8
[    1.830885] R10: 0000000000000000 R11: 0000000000000000 R12: 02000000000=
00080
[    1.832143] R13: 0000000183689067 R14: 0000000000000af0 R15: ffff88810a5=
07660
[    1.833504] FS:  0000000000000000(0000) GS:ffff88817fe00000(0000) knlGS:=
0000000000000000
[    1.835186] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.836379] CR2: ffffea6666666648 CR3: 0000000100a0e000 CR4: 00000000000=
50660
[    1.837763] Call Trace:
[    1.838316]  <TASK>
[    1.838784]  ? show_trace_log_lvl+0x1b0/0x2f0
[    1.839652]  ? show_trace_log_lvl+0x1b0/0x2f0
[    1.840513]  ? migration_entry_wait+0xf0/0x100
[    1.841366]  ? __die_body.cold+0x8/0x12
[    1.842100]  ? page_fault_oops+0x146/0x160
[    1.842887]  ? exc_page_fault+0x170/0x180
[    1.843671]  ? asm_exc_page_fault+0x26/0x30
[    1.844466]  ? migration_entry_wait_on_locked+0x69/0x2e0
[    1.845436]  ? __raw_callee_save_xen_pmd_val+0x15/0x30
[    1.846431]  migration_entry_wait+0xf0/0x100
[    1.847227]  do_swap_page+0x4a9/0xeb0
[    1.847940]  ? xen_pmd_val+0x35/0x70
[    1.848615]  ? __raw_callee_save_xen_pmd_val+0x15/0x30
[    1.853785]  ? __pfx_default_wake_function+0x10/0x10
[    1.854676]  __handle_mm_fault+0x39a/0x6f0
[    1.855426]  ? mt_find+0x213/0x570
[    1.856074]  handle_mm_fault+0x115/0x330
[    1.856816]  do_user_addr_fault+0x1ca/0x7b0
[    1.857576]  exc_page_fault+0x7e/0x180
[    1.858280]  asm_exc_page_fault+0x26/0x30
[    1.859018] RIP: e030:elf_load+0x20f/0x240
[    1.859773] Code: 39 d9 73 16 41 f6 c4 02 0f 84 1a ff ff ff 49 c7 c5 f2 =
ff ff ff e9 4d fe ff ff 0f 1f 00 b9 00 10 00 00 48 89 df 48 29 c1 31 c0 <f3=
> aa 0f 1f 00 0f 1f 00 48 85 c9 75 0d 48 8b 75 28 48 8b 4d 20 e9
[    1.862907] RSP: e02b:ffffc90041187d08 EFLAGS: 00010246
[    1.863841] RAX: 0000000000000000 RBX: 000070b32bcc0104 RCX: 00000000000=
00efc
[    1.865081] RDX: 000070b32bcc02e0 RSI: 0000000000000000 RDI: 000070b32bc=
c0104
[    1.866321] RBP: ffff888108b59470 R08: ffff88810a506668 R09: 00000000000=
00035
[    1.867568] R10: 0000000000000000 R11: 0000000000000040 R12: 00000000000=
00003
[    1.868809] R13: 000070b32bcbd000 R14: ffff88810a750000 R15: 00000000000=
00000
[    1.870056]  ? elf_load+0xa8/0x240
[    1.870707]  load_elf_interp.isra.0+0x1b5/0x330
[    1.871542]  load_elf_binary+0xa35/0xf30
[    1.872268]  search_binary_handler+0xd3/0x260
[    1.873083]  exec_binprm+0x54/0x180
[    1.873750]  bprm_execve.part.0+0x144/0x1e0
[    1.874516]  kernel_execve+0x112/0x140
[    1.875215]  call_usermodehelper_exec_async+0xd0/0x190
[    1.876135]  ? __pfx_call_usermodehelper_exec_async+0x10/0x10
[    1.877167]  ret_from_fork+0x34/0x50
[    1.877847]  ? __pfx_call_usermodehelper_exec_async+0x10/0x10
[    1.878871]  ret_from_fork_asm+0x1a/0x30
[    1.879601]  </TASK>
[    1.880056] Modules linked in:
[    1.880659] CR2: ffffea6666666648
[    1.881296] ---[ end trace 0000000000000000 ]---
[    1.882142] RIP: e030:migration_entry_wait_on_locked+0x69/0x2e0
[    1.883198] Code: 00 48 c7 44 24 20 00 00 00 00 f3 48 ab e9 56 01 00 00 =
48 b8 ff ff ff ff ff 00 00 00 48 21 d0 48 c1 e0 06 48 03 05 0f 97 89 01 <48=
> 8b 48 08 49 89 c6 f6 c1 01 0f 85 39 02 00 00 0f 1f 44 00 00 48
[    1.886323] RSP: e02b:ffffc90041187940 EFLAGS: 00010282
[    1.887258] RAX: ffffea6666666640 RBX: ccccccccccccccc0 RCX: 00000000000=
00000
[    1.888501] RDX: 6401999999999999 RSI: ffffc90041187968 RDI: ffffc900411=
879a0
[    1.889748] RBP: 6401999999999999 R08: 0000000000000067 R09: ffffc900411=
87ad8
[    1.890990] R10: 0000000000000000 R11: 0000000000000000 R12: 02000000000=
00080
[    1.892225] R13: 0000000183689067 R14: 0000000000000af0 R15: ffff88810a5=
07660
[    1.893468] FS:  0000000000000000(0000) GS:ffff88817fe00000(0000) knlGS:=
0000000000000000
[    1.894881] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.895902] CR2: ffffea6666666648 CR3: 0000000100a0e000 CR4: 00000000000=
50660
[    1.897143] Kernel panic - not syncing: Fatal exception
[    1.898079] Kernel Offset: disabled

Full log:
https://openqa.qubes-os.org/tests/122881/logfile?filename=3Dserial0.txt

Or this:

[    1.672650] Kernel panic - not syncing: corrupted stack end detected ins=
ide scheduler
[    1.674030] CPU: 1 UID: 0 PID: 107 Comm: cryptomgr_test Not tainted 6.13=
=2E0-0.rc3.2.qubes.1.fc41.x86_64 #1
[    1.676339] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel=
-1.16.3-2-gc13ff2cd-prebuilt.qemu.org 04/01/2014
[    1.678240] Call Trace:
[    1.678743]  <TASK>
[    1.679185]  ? __pfx_cryptomgr_test+0x10/0x10
[    1.679998]  dump_stack_lvl+0x5d/0x80
[    1.680690]  panic+0x155/0x30f
[    1.681283]  schedule_debug.isra.0.cold+0xc/0xc
[    1.682151]  __schedule+0x6f/0x600
[    1.682819]  ? __pfx_cryptomgr_test+0x10/0x10
[    1.683616]  do_task_dead+0x42/0x50
[    1.684279]  do_exit+0x331/0x4a0
[    1.684902]  kthread_exit+0x28/0x30
[    1.685565]  __module_put_and_kthread_exit+0x1a/0x20
[    1.686458]  cryptomgr_test+0x3f/0x40
[    1.687195]  kthread+0xd2/0x100
[    1.687813]  ? __pfx_kthread+0x10/0x10
[    1.688545]  ret_from_fork+0x34/0x50
[    1.689299]  ? __pfx_kthread+0x10/0x10
[    1.690150]  ret_from_fork_asm+0x1a/0x30
[    1.690938]  </TASK>
[    1.691417] Kernel Offset: disabled


Full log:
https://openqa.qubes-os.org/tests/122877/logfile?filename=3Dserial0.txt



--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--q36KIBHH+nmi0JO5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmdkRn4ACgkQ24/THMrX
1yygWwf/XXE1g8GUkGOMnrWhA0DD11qZAcvPVA5qbBPbcxz80hbAfRwVbwxU68AF
JblGyM8VxBlqH9vHrLamFgu8WM45Hftyx4JqZTUyCbd5xWXIxH9InlyI6bpj3qrr
O+q2E8sWJoyg4lCpgnqlGLMXJkV5ufSnbSaPbDhqqWosewlaH69AAAnLLDkCj4bq
3qi+gn7BCZzIdqUU5UNYTol0eT5fuphgw7K5U1i0WYhaCF7Zw3z0IovVGhKJ5vKW
g4vGob7OpujERb/8By+txydUAGRKD0C752DplEJH6T9x630aqFGSfV2ppaDnEtQx
D3h7jiEAMRZ9PCaT3zR8ndQt0HRGxA==
=5fQ1
-----END PGP SIGNATURE-----

--q36KIBHH+nmi0JO5--

