Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C260678BA75
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 23:52:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591777.924274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qak8I-0002Pd-H8; Mon, 28 Aug 2023 21:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591777.924274; Mon, 28 Aug 2023 21:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qak8I-0002NZ-EI; Mon, 28 Aug 2023 21:50:50 +0000
Received: by outflank-mailman (input) for mailman id 591777;
 Mon, 28 Aug 2023 21:50:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LBWR=EN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qak8G-0002NQ-Pu
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 21:50:49 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef2f794a-45ec-11ee-9b0c-b553b5be7939;
 Mon, 28 Aug 2023 23:50:44 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id D9C603200A70
 for <xen-devel@lists.xenproject.org>; Mon, 28 Aug 2023 17:50:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 28 Aug 2023 17:50:41 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Mon, 28 Aug 2023 17:50:39 -0400 (EDT)
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
X-Inumbo-ID: ef2f794a-45ec-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1693259440; x=1693345840; bh=8j
	X1CPCULlXtf0BxGcwUvc6u1/iJzS4MZy2KRvYih30=; b=RYhoEaWzXd+kh9+dZh
	irwJHDgwTXgy1adlb+nPRrcsXuqb4YwI89DX+YUWwsFPbv4kRnG/OZVKYYlWkDWo
	mEMl1m8FqWwlu/tXIbTM6wTsc7rtksvLg/smtOySRGl83SpP7zBR1t/HVXtkBKwm
	p1ePDSqI5Bl4D7pRBb2Lx03irtulM69csMxRg7/qfwQDuGBLNgnJ+bm22xpvaAH0
	6lIhlkGwUnuQpderfr7CJg+wEf95UbtV9vQ0D1bhXHL456XHUFFEPwQBQQWEjkpV
	Q3m5k4g+Icpy++qHgBxBjNIkJj07bqIOdwnLdio/i/vSsBCJI+2cJmIdEJa9o++i
	ECzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1693259440; x=1693345840; bh=8jX1CPCULlXtf0BxGcwUvc6u1/iJzS4MZy2
	KRvYih30=; b=MGq10m8JKD3WGEFQPfktycDqPfo0b40sEGkiVsLaSbL0DoxK/7Z
	1xqxdrzdleYe0Q9LBSvp88zMhwsYufGyfKHfn4eEH9Ud9N0QdwjhbLNO6F/UyVZc
	12y60G9fZJyuTcJUU7cA7CpaVs2DW0F0J/6/AODCk3m9AGaheoPoGMcILhO5RqN3
	cg+3ndEKp9pb1eI+e2CI+ZcWWlm7KIsMNj0AlgeVV8NzkFQMgEsJQHd9ljdac/Em
	xWRuD41UKKir3GTGaxSvnMx2oUZEdzXP5zqj2Txbi0te0mtT5TezBJ929Tj5YoKC
	05XwtWeKeQSdIz5HVUFXt3sJRaJgUF3lBbw==
X-ME-Sender: <xms:sBbtZMytANyynRTT8ylXuR-Vjm033l708qQ7ND4HIhVqOp5mMYTmbw>
    <xme:sBbtZARkdbBfIPy-dyIt6uNbZWmmdyj1X6AI5hgFOvNTmtKMxB25zu_6bsCc3U0e2
    mBgXTGSmMgdzg>
X-ME-Received: <xmr:sBbtZOWF5zwG5BckkMMCdqo5G0hdveAOqrk1mmsVgi63vKcf4G7ASGBQCIoMDlvV-oA_kS32HwY1zYOYD4MRSob3Rf095hicIxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudefhedgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
    dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
    uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnhepleefveeugfeikeeikeehteeuvdfggedvvdelheejkeeiteeh
    uedtgffgvefgtdetnecuffhomhgrihhnpehophgvnhhsuhhsvgdrohhrghdpqhhusggvsh
    dqohhsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:sBbtZKgs3zrvM2-FARX4au9aPsYmbFP1GnizF4jkkVZQhQt1IcTI3A>
    <xmx:sBbtZOC3SKpZhJTp7KJIiQIYW-WwaljQMblKx-hEY3vp4jT_TuPFoA>
    <xmx:sBbtZLImkBnjNPgTKGqQg8EEB-QWD8KWzBeF_5qxq5gXKi58Fz-06Q>
    <xmx:sBbtZBOG1CbzlF_DdatqnRqvdPsJULDwRI6JwttFpzh9t8phXZ7fuA>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 28 Aug 2023 23:50:36 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: NULL pointer dereference in xenbus_thread->...
Message-ID: <ZO0WrR5J0xuwDIxW@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="T2fshvCC4EqYyxxh"
Content-Disposition: inline


--T2fshvCC4EqYyxxh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Aug 2023 23:50:36 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: NULL pointer dereference in xenbus_thread->...

Hi,

I've noticed in Qubes's CI failure like this:

[  871.271292] BUG: kernel NULL pointer dereference, address: 0000000000000=
000
[  871.275290] #PF: supervisor read access in kernel mode
[  871.277282] #PF: error_code(0x0000) - not-present page
[  871.279182] PGD 106fdb067 P4D 106fdb067 PUD 106fdc067 PMD 0=20
[  871.281071] Oops: 0000 [#1] PREEMPT SMP NOPTI
[  871.282698] CPU: 1 PID: 28 Comm: xenbus Not tainted 6.1.43-1.qubes.fc37.=
x86_64 #1
[  871.285222] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
rel-1.16.0-0-gd239552-rebuilt.opensuse.org 04/01/2014
[  871.288883] RIP: e030:__wake_up_common+0x4c/0x180
[  871.292838] Code: 24 0c 89 4c 24 08 4d 85 c9 74 0a 41 f6 01 04 0f 85 a3 =
00 00 00 48 8b 43 08 4c 8d 40 e8 48 83 c3 08 49 8d 40 18 48 39 c3 74 5b <49=
> 8b 40 18 31 ed 4c 8d 70 e8 45 8b 28 41 f6 c5 04 75 5f 49 8b 40
[  871.299776] RSP: e02b:ffffc900400f7e10 EFLAGS: 00010082
[  871.301656] RAX: 0000000000000000 RBX: ffff88810541ce98 RCX: 00000000000=
00000
[  871.304255] RDX: 0000000000000001 RSI: 0000000000000003 RDI: ffff8881054=
1ce90
[  871.306714] RBP: ffffc900400f0280 R08: ffffffffffffffe8 R09: ffffc900400=
f7e68
[  871.309937] R10: 0000000000007ff0 R11: ffff888100ad3000 R12: ffffc900400=
f7e68
[  871.312326] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000=
00000
[  871.314647] FS:  0000000000000000(0000) GS:ffff88813ff00000(0000) knlGS:=
0000000000000000
[  871.317677] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[  871.319644] CR2: 0000000000000000 CR3: 00000001067fe000 CR4: 00000000000=
40660
[  871.321973] Call Trace:
[  871.322782]  <TASK>
[  871.323494]  ? show_trace_log_lvl+0x1d3/0x2ef
[  871.324901]  ? show_trace_log_lvl+0x1d3/0x2ef
[  871.326310]  ? show_trace_log_lvl+0x1d3/0x2ef
[  871.327721]  ? __wake_up_common_lock+0x82/0xd0
[  871.329147]  ? __die_body.cold+0x8/0xd
[  871.330378]  ? page_fault_oops+0x163/0x1a0
[  871.331691]  ? exc_page_fault+0x70/0x170
[  871.332946]  ? asm_exc_page_fault+0x22/0x30
[  871.334454]  ? __wake_up_common+0x4c/0x180
[  871.335777]  __wake_up_common_lock+0x82/0xd0
[  871.337183]  ? process_writes+0x240/0x240
[  871.338461]  process_msg+0x18e/0x2f0
[  871.339627]  xenbus_thread+0x165/0x1c0
[  871.340830]  ? cpuusage_read+0x10/0x10
[  871.342032]  kthread+0xe9/0x110
[  871.343317]  ? kthread_complete_and_exit+0x20/0x20
[  871.345020]  ret_from_fork+0x22/0x30
[  871.346239]  </TASK>
[  871.347060] Modules linked in: snd_hda_codec_generic ledtrig_audio snd_h=
da_intel snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec snd_hda_core snd=
_hwdep snd_seq snd_seq_device joydev snd_pcm intel_rapl_msr ppdev intel_rap=
l_common snd_timer pcspkr e1000e snd soundcore i2c_piix4 parport_pc parport=
 loop fuse xenfs dm_crypt crct10dif_pclmul crc32_pclmul crc32c_intel polyva=
l_clmulni polyval_generic floppy ghash_clmulni_intel sha512_ssse3 serio_raw=
 virtio_scsi virtio_console bochs xhci_pci xhci_pci_renesas xhci_hcd qemu_f=
w_cfg drm_vram_helper drm_ttm_helper ttm ata_generic pata_acpi xen_privcmd =
xen_pciback xen_blkback xen_gntalloc xen_gntdev xen_evtchn scsi_dh_rdac scs=
i_dh_emc scsi_dh_alua uinput dm_multipath
[  871.368892] CR2: 0000000000000000
[  871.370160] ---[ end trace 0000000000000000 ]---
[  871.371719] RIP: e030:__wake_up_common+0x4c/0x180
[  871.373273] Code: 24 0c 89 4c 24 08 4d 85 c9 74 0a 41 f6 01 04 0f 85 a3 =
00 00 00 48 8b 43 08 4c 8d 40 e8 48 83 c3 08 49 8d 40 18 48 39 c3 74 5b <49=
> 8b 40 18 31 ed 4c 8d 70 e8 45 8b 28 41 f6 c5 04 75 5f 49 8b 40
[  871.379866] RSP: e02b:ffffc900400f7e10 EFLAGS: 00010082
[  871.381689] RAX: 0000000000000000 RBX: ffff88810541ce98 RCX: 00000000000=
00000
[  871.383971] RDX: 0000000000000001 RSI: 0000000000000003 RDI: ffff8881054=
1ce90
[  871.386235] RBP: ffffc900400f0280 R08: ffffffffffffffe8 R09: ffffc900400=
f7e68
[  871.388521] R10: 0000000000007ff0 R11: ffff888100ad3000 R12: ffffc900400=
f7e68
[  871.390789] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000=
00000
[  871.393101] FS:  0000000000000000(0000) GS:ffff88813ff00000(0000) knlGS:=
0000000000000000
[  871.395671] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[  871.397863] CR2: 0000000000000000 CR3: 00000001067fe000 CR4: 00000000000=
40660
[  871.400441] Kernel panic - not syncing: Fatal exception
[  871.402171] Kernel Offset: disabled
(XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.

It isn't the first time I see similar crash, but I can't really
reproduce it reliably. Restarted test usually passes.
Note this is Xen nested in KVM, so it could very well be some oddity
about nested virt, although looking at the stack trace, it's unlikely
and more likely some race condition hit only on slower system.

Unfortunately I don't have symbols for this kernel handy, but there is a
single wake_up() call in process_writes(), so it shouldn't be an issue.

Any ideas?

Full log at https://openqa.qubes-os.org/tests/80779/logfile?filename=3Dseri=
al0.txt

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--T2fshvCC4EqYyxxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmTtFq0ACgkQ24/THMrX
1ywsNggAmhUTj+NhltYUMYPdkM27S5jRYSqGGH5WDwKQY9qO/5hDg3WiWvdH/Rv0
jNYKTL2YJdOQgvXx864DHD3jxgN7PS4qKKgFlHGNpRCADl/RxKGQpwKXprj4ij64
BOoQgad8Q3qaS+p8hi6j3km+9YjsSoEeukxnd7uasr1bBi5yE9Ml+YDE9dTJ7UwU
Xnn5YKcjnUPrvh/Ehpphjw3yn57kFhqJnUzHyyJRvim5whtg2yvKzkUQ7t31OmFt
zYeh3CLVFX7C4Jts6et2QB21ZRuZFZtaaw414O7GkmHNPlvwHdFzuYx2aIVuHunZ
GHakNhLIwx0DJYWmdbQ7Aj2XqAefcw==
=DJNt
-----END PGP SIGNATURE-----

--T2fshvCC4EqYyxxh--

