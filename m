Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA296784F40
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 05:29:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588877.920504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYeXj-0006tB-As; Wed, 23 Aug 2023 03:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588877.920504; Wed, 23 Aug 2023 03:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYeXj-0006rC-7C; Wed, 23 Aug 2023 03:28:27 +0000
Received: by outflank-mailman (input) for mailman id 588877;
 Wed, 23 Aug 2023 03:28:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t3Wx=EI=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qYeXh-0006r6-Co
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 03:28:25 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1adeb267-4165-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 05:28:22 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id C579F32008FE
 for <xen-devel@lists.xenproject.org>; Tue, 22 Aug 2023 23:28:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 22 Aug 2023 23:28:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Tue, 22 Aug 2023 23:28:16 -0400 (EDT)
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
X-Inumbo-ID: 1adeb267-4165-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1692761297; x=1692847697; bh=gn
	jA2iKUYatWW7hRJF8hQb4zrGwNWXEXT0U/V5VW8HQ=; b=Q+jOJP2jibzWQi0odK
	/Jpuzi/TQexP2noDoc5cSmYnTbq4M6qc5AiayYTxSbnfqLOtGAcv90QeQmyHbvS4
	TYaqGOUIaoU5OYcyW1YHKUa4Brbr081TLuoVPg2cd+2CaIlHeuviMXHamPOiYdJw
	HHlmh/VDWDebAbE8YKgx9m+tD7SVTwbRtuL09C1PQ0Tyirf19eB/McUj4cuLkFRZ
	DOLIcWCMDP5b+fypwHA2Y50von7/i5PSMkCxuNNX64/A1dI9qCmHwmvko2/Prb92
	lKjXJclVvhNbKmG4edtXrBTYH8ljpYE5tzLVusrnBLMB8kXt0PjxU8eWJrJQQ2mp
	Ea7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1692761297; x=1692847697; bh=gnjA2iKUYatWW7hRJF8hQb4zrGwNWXEXT0U
	/V5VW8HQ=; b=v/9kPJmxGDzUtc0Qzn2Zcx7JO+PA5CWdqC49y0L59/cF/wBfAda
	QqIPcQSWXsMR53qqSDFBA316U/+RirkjLDNloSIvHDMTKcW46zPdcSJaxnzlcSoN
	rdlU9Blglsov1xNgjcmwx5f0p88g6XlR7WG+RzwfN5xWKT4zG4IMWiwThyGhy57Y
	6nR+dlIRQ1toB3PAU5zRZytFSuX4qNteY/8i6te10K6GXioY9nYF2Y4aObnt9Btu
	Re8/cQd6YEdWXzSVshK3z6WIVDnR6cXWYj8W+/63/DJGSJ8P8ilh7Pr/vFf+A+fz
	yGij0RN5guOJfzKF08d3X+F0eKsvPCRR9Fw==
X-ME-Sender: <xms:0XzlZNiIxv5DucSKDKJpzLN9VQ2pOeWr94yQ6gz6CbrzWvl0U0fJcw>
    <xme:0XzlZCBwkJjEozEDbluvqVpKpkNrQcxxfdqOpCN5G6Y_lkRpU7TJUgUE1--cuWdAY
    dg2aRmsm2XSIw>
X-ME-Received: <xmr:0XzlZNHVHM9Uwpmqp3O4FlPN-IqzIbIZPBLb4ADrska4leIJLYHX5nvq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddvvddgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
    dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
    uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnhepteduteeiudevkeegvefhtdekhfelgffhhedukedvvdeuuddv
    jeehvddtieehudfgnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:0XzlZCQ88LYx4beZJFddmVjt7M7urLN7FWQdhbc9J1YpS2TMy0Sn_Q>
    <xmx:0XzlZKy3xZ_qYQ1vsL3fJgl-gzUjk1C08y34i4qWTMX8WBFBL72oxA>
    <xmx:0XzlZI5YqqUJjEy8Pf0qfdghKWlQj2jVIAZHxylNJyYDQuuuroGf1w>
    <xmx:0XzlZJ82HqIwSgLchKM-RuOr2NuBLSUGPU6Y_Q_Rfit_tkKP113yIQ>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 23 Aug 2023 05:28:12 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: "rcu_preempt detected stalls" with xen_free_irq involved - regression
Message-ID: <ZOV8zMeie3oprrGg@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7ceitNQtwpiO/KqD"
Content-Disposition: inline


--7ceitNQtwpiO/KqD
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Aug 2023 05:28:12 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: "rcu_preempt detected stalls" with xen_free_irq involved - regression

Hi,

Since updating from 5.15.124 to 6.1.43, I observe rather often an issue
like in the subject. This happens on a domU with heavy vchan usage
(several connections established and released per second).

The domain in question is a PVH with 16 vCPUs and generally is rather
busy (CPU time, but also some noticeable network and disk I/O), but I've
seen this happening also in less intensive times (but still several
vchan connections being handled).

This is running on Xen 4.17.2, AMD EPYC (Zen3), with smt=3Doff.

Any ideas?

Full message:

    rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
    rcu:       9-...0: (0 ticks this GP) idle=3D2364/1/0x4000000000000000 s=
oftirq=3D20505/20505 fqs=3D11999                                           =
                                                     =20
       (detected by 12, t=3D60004 jiffies, g=3D79009, q=3D1863 ncpus=3D16) =
                                                                           =
                                                       =20
    Sending NMI from CPU 12 to CPUs 9:                                     =
                                                                           =
                                               =20
    NMI backtrace for cpu 9                                                =
                                                                           =
                                               =20
    CPU: 9 PID: 18266 Comm: qrexec-agent Not tainted 6.1.43-1.qubes.fc37.x8=
6_64 #1                                                                    =
                                               =20
    RIP: 0010:queued_write_lock_slowpath+0x64/0x124                        =
                                                                           =
                                               =20
    Code: ff 90 0f 1f 44 00 00 5b 5d c3 cc cc cc cc f0 81 0b 00 01 00 00 ba=
 ff 00 00 00 b9 00 01 00 00 8b 03 3d 00 01 00 00 74 0b f3 90 <8b> 03 3d 00 =
01 00 00 75 f5 89 c8 f0 0f b1 13 74 be eb e2 65=20
                                                                           =
                                                                           =
                                               =20
    RSP: 0018:ffffc9000229fd30 EFLAGS: 00000006                            =
                                                                           =
                                               =20
    RAX: 0000000000000500 RBX: ffffffff8468de60 RCX: 0000000000000100      =
                                                                           =
                                               =20
    RDX: 00000000000000ff RSI: ffff8881004b86d8 RDI: ffffffff8468de60      =
                                                                           =
                                               =20
    RBP: ffffffff8468de64 R08: ffff8881004b8860 R09: ffffffff82d47600      =
                                                                           =
                                               =20
    R10: 0000000000000000 R11: 0000000000000000 R12: ffff88810464e3e0      =
                                                                           =
                                               =20
    R13: ffff8881012a76a0 R14: ffff88838d1f5a90 R15: 0000000000000000      =
                                                                           =
                                               =20
    FS:  0000716dc7f6b780(0000) GS:ffff8883dc040000(0000) knlGS:00000000000=
00000                                                                      =
                                               =20
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033                      =
                                                                           =
                                               =20
    CR2: 0000716dc7f7c060 CR3: 00000001e3d0c001 CR4: 0000000000770ee0      =
                                                                           =
                                               =20
    PKRU: 55555554                                                         =
                                                                           =
                                               =20
    Call Trace:                                                            =
                                                                           =
                                               =20
     <NMI>                                                                 =
                                                                           =
                                               =20
     ? show_trace_log_lvl+0x1d3/0x2ef                                      =
                                                                           =
                                               =20
     ? show_trace_log_lvl+0x1d3/0x2ef                                      =
                                                                           =
                                               =20
     ? show_trace_log_lvl+0x1d3/0x2ef                                      =
                                                                           =
                                               =20
     ? __raw_write_lock_irqsave+0x3d/0x50
     ? nmi_cpu_backtrace.cold+0x1b/0x76
     ? queued_write_lock_slowpath+0x64/0x124
     ? nmi_cpu_backtrace_handler+0xd/0x20
     ? nmi_handle+0x5d/0x120
     ? queued_write_lock_slowpath+0x64/0x124
     ? default_do_nmi+0x69/0x170
     ? exc_nmi+0x13c/0x170
     ? end_repeat_nmi+0x16/0x67
     ? queued_write_lock_slowpath+0x64/0x124
     ? queued_write_lock_slowpath+0x64/0x124
     ? queued_write_lock_slowpath+0x64/0x124
     </NMI>
     <TASK>
     __raw_write_lock_irqsave+0x3d/0x50
     xen_free_irq+0x43/0x170
     unbind_from_irqhandler+0x40/0x80
     evtchn_release+0x27/0x8e [xen_evtchn]
     __fput+0x91/0x250
     task_work_run+0x59/0x90
     exit_to_user_mode_loop+0x121/0x150
     exit_to_user_mode_prepare+0xaf/0xc0
     syscall_exit_to_user_mode+0x17/0x40
     do_syscall_64+0x67/0x80
     ? handle_mm_fault+0xdb/0x2d0
     ? preempt_count_add+0x47/0xa0
     ? up_read+0x37/0x70=20
     ? do_user_addr_fault+0x1bb/0x570
     ? exc_page_fault+0x70/0x170
     entry_SYSCALL_64_after_hwframe+0x63/0xcd
    RIP: 0033:0x716dc81077ea
    Code: 48 3d 00 f0 ff ff 77 48 c3 0f 1f 80 00 00 00 00 48 83 ec 18 89 7c=
 24 0c e8 d3 ce f8 ff 8b 7c 24 0c 89 c2 b8 03 00 00 00 0f 05 <48> 3d 00 f0 =
ff ff 77 36 89 d7 89 44 24 0c e8 33 cf f8 ff 8b=20
   =20
    RSP: 002b:00007ffce6ce80e0 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
    RAX: 0000000000000000 RBX: 000055aae7e8c150 RCX: 0000716dc81077ea
    RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000014
    RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
    R10: 0000716dc80086b8 R11: 0000000000000293 R12: 000055aae7e8ad70
    R13: 0000000000000003 R14: 0000716dc8020bf8 R15: 00007ffce6ce81a0
     </TASK>


I've seen also few other flavors of the above, for example:
https://gist.github.com/marmarek/a8b79ef2a877443c7aa57fdca366a701

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--7ceitNQtwpiO/KqD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmTlfM0ACgkQ24/THMrX
1yxtJAf/SNJHhVBEdEWqwRxZcf/jTdTYItl0EI1m+jqFQpslOvPk8s2L7Fc/KRMj
GxD6OUI+OE+28Lpfr1B01qjh8eT+PvV0qaYKgkpJGWyUwoGM2r4mzqVLXNEvZ5fo
BFicSxbxu1BusQQ8luocQJgjx4GX463IkXLQ/rQVjOmPCAwlKO+f71aKBUrIw2OR
h78KwyL+yRxCLBhAtH+OGTmoiyJEm/iDXZ4pOqmff+zRMqHpyo6Se3CGcjQOJoZi
GUBPMrkqYgCaMLwqBGV3i2TNhJkRgHdxzHF5FmXk2rqv4jWlvq/klxpJRNEUrT7p
OErN9B3qThe8yiIcaD4FDboOBrtNhw==
=oS0w
-----END PGP SIGNATURE-----

--7ceitNQtwpiO/KqD--

