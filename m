Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B1118AAB2
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 03:32:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEktU-0003sx-A8; Thu, 19 Mar 2020 02:26:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hP2b=5E=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jEktS-0003ss-Qe
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 02:26:47 +0000
X-Inumbo-ID: 141ae2ce-6989-11ea-bec1-bc764e2007e4
Received: from out4-smtp.messagingengine.com (unknown [66.111.4.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 141ae2ce-6989-11ea-bec1-bc764e2007e4;
 Thu, 19 Mar 2020 02:26:45 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 7B4525C00E0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Mar 2020 22:26:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 18 Mar 2020 22:26:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=GAEHGZaTessqyn9K6iT5+FfL/DDho
 IHR0/3p79fzjTg=; b=SKsZWnK8lraunzVbwRNCT4+C8eUd2iJZ23ywqiEbjxXxG
 /SJj74f9LijEX3xISAzQbJuuPfWXyQFmCfDZViNzVQMu+XiiIqMSVUJrOpe0UW5T
 bRZDu8xEPi5mc729Enk5grSv4KAi9jwtYlxJ5ROVeiqJu8XrxYbgmoG8DoIJdYfp
 +l2RVqhySCFc55e7N2MjLvSDzmE2ANbxkgcVlvqBXRvJrpVTBlf6DOuufdoh4Q5X
 IsKP2qDRwbi0M/jLkFaNgPGeNuhh95w74T/J6Y/8a9FrGhzVF3bRH95aEfF1Uv61
 9Uzayg5N99Re66lBxAuyNIuon5XtqEDq+3d1sggDA==
X-ME-Sender: <xms:ZdhyXhWKI2uaefNecvkiVKSdNFpZ9-G1dYm6DxST3PY4Y-M1SGrtVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudefkedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
 dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
 uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
 cuffhomhgrihhnpehophgvnhhsuhhsvgdrohhrghdpqhhusggvshdqohhsrdhorhhgnecu
 kfhppeeluddrieehrdefgedrfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhs
 lhgrsgdrtghomh
X-ME-Proxy: <xmx:ZdhyXklaw5zusEQaEtE3k1lNkIpwZ6rtrTtiAChLyIUWo4XsOdPQUQ>
 <xmx:ZdhyXnTjG1wRSaLOG5OZNJUc9DbTPTv9q8fo4mtl-5gJ42TG0i9E_Q>
 <xmx:ZdhyXvYpxdiIaYv-QD9BP9HJlITxhfVvAo0CvzDAMpT75uMUEZHA9g>
 <xmx:ZdhyXkLcSvk6qsRdzc1av7ye8UfSG_ZnU0OaBm0q8leENST1cWkq0Q>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id D852C306215A
 for <xen-devel@lists.xenproject.org>; Wed, 18 Mar 2020 22:26:44 -0400 (EDT)
Date: Thu, 19 Mar 2020 03:26:40 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <20200319022640.GY7869@mail-itl>
MIME-Version: 1.0
Subject: [Xen-devel] PV dom0 crash: kernel NULL pointer dereference in
 evtchn_from_irq
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5811531106125770260=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5811531106125770260==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iFtobK8oO579scb0"
Content-Disposition: inline


--iFtobK8oO579scb0
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: PV dom0 crash: kernel NULL pointer dereference in evtchn_from_irq

Hi,

=46rom time to time, during intensive tests I get the dom0 crash like
below. This is PV dom0, running on Xen nested inside KVM.
I don't really know when it started happening, I've got it on at least
those versions:
 - Xen 4.8.5 + Linux dom0 4.19.94
 - Xen 4.13.0 + Linux dom0 5.4.25
 - at least once also on physical hardware (Xen 4.13.0 + Linux dom0
   5.4.x)

Contrary to the other issue, here suspend is not involved, it is just
intensive system usage - multiple VM startups, involving some I/O,
network traffic etc. This happens rather rarely (I'd say about 1-3% of
tests).
To be honest, I'm not really sure if the bug is in Xen-related code at
all, or if Xen functions are in the call trace only because it is PV
dom0.

Full crash message:

[14474.613706] BUG: kernel NULL pointer dereference, address: 0000000000000=
01c
[14474.615832] #PF: supervisor read access in kernel mode
[14474.617321] #PF: error_code(0x0000) - not-present page
[14474.618702] PGD 0 P4D 0=20
[14474.619452] Oops: 0000 [#1] SMP NOPTI
[14474.620452] CPU: 0 PID: 431254 Comm: rm Not tainted 5.4.25-1.qubes.x86_6=
4 #1
[14474.622900] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
rel-1.12.0-59-gc9ba527-rebuilt.opensuse.org 04/01/2014
[14474.626322] RIP: e030:evtchn_from_irq+0x1f/0x40
[14474.627630] Code: 40 08 c3 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 39 3d =
95 ab 03 01 76 16 e8 3e e8 b2 ff 48 85 c0 74 08 48 8b 40 10 48 8b 40 08 <8b=
> 40 1c c3 89 fe 48 c7 c7 d5 9e 37 82 e8 7d 3d ac ff 0f 0b 31 c0
[14474.632719] RSP: e02b:ffffc90000c03f30 EFLAGS: 00010046
[14474.634143] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00000000000=
00000
[14474.636259] RDX: 0000000000000028 RSI: 000000000000007f RDI: ffffffff826=
5b6e0
[14474.638224] RBP: ffff888052c8f428 R08: ffff888138324000 R09: ffff8881383=
24220
[14474.640238] R10: 0000000000000000 R11: ffffffff8265b6e8 R12: ffff888052c=
8f4a4
[14474.642239] R13: 0000000000000000 R14: ffff88813b542000 R15: ffff88813fe=
26ddc
[14474.644254] FS:  00007a018057f580(0000) GS:ffff88813fe00000(0000) knlGS:=
0000000000000000
[14474.646563] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[14474.648331] CR2: 000000000000001c CR3: 000000004defa000 CR4: 00000000000=
00660
[14474.650352] Call Trace:
[14474.651042]  <IRQ>
[14474.651647]  disable_dynirq+0xd/0x30
[14474.652668]  mask_ack_dynirq+0xe/0x20
[14474.653706]  handle_edge_irq+0xfc/0x190
[14474.655241]  generic_handle_irq+0x24/0x30
[14474.656450]  __evtchn_fifo_handle_events+0x151/0x1a0
[14474.657886]  __xen_evtchn_do_upcall+0x58/0x90
[14474.659093]  xen_evtchn_do_upcall+0x27/0x40
[14474.660252]  xen_do_hypervisor_callback+0x29/0x40
[14474.661538]  </IRQ>
[14474.662150] RIP: e030:xen_hypercall_xen_version+0xa/0x20
[14474.663589] Code: 51 41 53 b8 10 00 00 00 0f 05 41 5b 59 c3 cc cc cc cc =
cc cc cc cc cc cc cc cc cc cc cc cc cc cc 51 41 53 b8 11 00 00 00 0f 05 <41=
> 5b 59 c3 cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc
[14474.668929] RSP: e02b:ffffc9000be0be50 EFLAGS: 00000246
[14474.670357] RAX: 000000000004000d RBX: 0000000000000000 RCX: ffffffff810=
0122a
[14474.672348] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000000=
00000
[14474.674376] RBP: 0000000000000004 R08: 0000000000000000 R09: 00000000000=
00000
[14474.676394] R10: 0000000000000000 R11: 0000000000000246 R12: ffffc9000be=
0bf58
[14474.678298] R13: 00005a5a44d448a0 R14: ffff88804dfc5540 R15: ffff888065b=
3a540
[14474.680207]  ? xen_hypercall_xen_version+0xa/0x20
[14474.681498]  ? xen_force_evtchn_callback+0x9/0x10
[14474.682757]  ? check_events+0x12/0x20
[14474.683759]  ? xen_irq_enable_direct+0x19/0x20
[14474.685048]  ? do_user_addr_fault+0x152/0x450
[14474.686304]  ? do_page_fault+0x31/0x110
[14474.687886]  ? page_fault+0x3e/0x50
[14474.688839] Modules linked in: br_netfilter xt_physdev xen_netback bridg=
e stp llc joydev loop ebtable_filter ebtables ip6table_filter ip6_tables ip=
table_filter snd_hda_codec_generic ledtrig_audio snd_hda_intel snd_intel_nh=
lt snd_hda_codec ppdev snd_hda_core snd_hwdep snd_seq snd_seq_device snd_pc=
m edac_mce_amd snd_timer parport_pc snd pcspkr soundcore parport e1000e i2c=
_piix4 xenfs ip_tables dm_thin_pool dm_persistent_data libcrc32c dm_bio_pri=
son bochs_drm drm_kms_helper drm_vram_helper ttm drm ehci_pci virtio_scsi v=
irtio_console ehci_hcd serio_raw ata_generic pata_acpi floppy qemu_fw_cfg x=
en_privcmd xen_pciback xen_blkback xen_gntalloc xen_gntdev xen_evtchn uinpu=
t pkcs8_key_parser
[14474.705128] CR2: 000000000000001c
[14474.706182] ---[ end trace 19fc15c03d0b00c8 ]---
[14474.707485] RIP: e030:evtchn_from_irq+0x1f/0x40
[14474.708768] Code: 40 08 c3 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 39 3d =
95 ab 03 01 76 16 e8 3e e8 b2 ff 48 85 c0 74 08 48 8b 40 10 48 8b 40 08 <8b=
> 40 1c c3 89 fe 48 c7 c7 d5 9e 37 82 e8 7d 3d ac ff 0f 0b 31 c0
[14474.713814] RSP: e02b:ffffc90000c03f30 EFLAGS: 00010046
[14474.715400] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00000000000=
00000
[14474.717360] RDX: 0000000000000028 RSI: 000000000000007f RDI: ffffffff826=
5b6e0
[14474.719337] RBP: ffff888052c8f428 R08: ffff888138324000 R09: ffff8881383=
24220
[14474.721302] R10: 0000000000000000 R11: ffffffff8265b6e8 R12: ffff888052c=
8f4a4
[14474.723257] R13: 0000000000000000 R14: ffff88813b542000 R15: ffff88813fe=
26ddc
[14474.725232] FS:  00007a018057f580(0000) GS:ffff88813fe00000(0000) knlGS:=
0000000000000000
[14474.727530] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[14474.729222] CR2: 000000000000001c CR3: 000000004defa000 CR4: 00000000000=
00660
[14474.731177] Kernel panic - not syncing: Fatal exception in interrupt

Full (Xen) console log, sadly it doesn't contain more of the Linux
output:
https://openqa.qubes-os.org/tests/6992/file/serial0.txt

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--iFtobK8oO579scb0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl5y2F8ACgkQ24/THMrX
1yxBoAgAiGihibVEkebBks+tNgI/F0ocRg0AWrqYgO9/ma1ulphQH0vHd8Iv0lMM
s6YA7WlxJmxlpe5elLIcrwa+E/qzn/pxxOKEGAN0Zmde75rMSAC2OVrhN2CAjVQ0
4ay061BIt5JJ2Cq1UQcfTg7AIWuHYOw2D5tTpD+fsYPjOZn6Su8rl192hn6Hhzfd
UruPfJW1Pxb7khY5pILCIakdZbrsVUEac/j7jQj7UY8+UdjyCKL31XiJPg8J3SBa
n+HbFnPwQHRWvwgeZv1bxwXL4hPFP0KIDDH9bcvhRjnlqdZEsZTrfbWl6QweXV3o
1si5JTfTfiwo5ADRFHChMzaR3jZVWA==
=5eux
-----END PGP SIGNATURE-----

--iFtobK8oO579scb0--


--===============5811531106125770260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5811531106125770260==--

