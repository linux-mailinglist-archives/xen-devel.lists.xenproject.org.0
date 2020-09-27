Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A457A27A096
	for <lists+xen-devel@lfdr.de>; Sun, 27 Sep 2020 13:14:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMUdF-00030P-75; Sun, 27 Sep 2020 11:14:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u3DK=DE=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kMUdD-0002zo-2T
 for xen-devel@lists.xenproject.org; Sun, 27 Sep 2020 11:14:15 +0000
X-Inumbo-ID: 4e91951f-bf7d-483c-ad20-684ebb67d323
Received: from wout3-smtp.messagingengine.com (unknown [64.147.123.19])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e91951f-bf7d-483c-ad20-684ebb67d323;
 Sun, 27 Sep 2020 11:14:13 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 44252459;
 Sun, 27 Sep 2020 07:14:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 27 Sep 2020 07:14:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=E1ygS8EhhrSEXPgDlOC9GvIO86YZ3
 nf6Mfj1JipKN5o=; b=rVWyzfSETdjNuk/YuZEhBZn3gzN6K/skyR6AgQcFqlm49
 7DiguHnxhGDBKimsJJhHCo5wNhDPoSZ1CwBqwMZz2+dxscZKCZa1hTBqjzbesfBU
 Xit25QaRxOsWWvrSqZyTdC5Lkc21+4fiPaTRmPu3RR4DV1KOZCnMisTzDynvgmkp
 IhNqo5F8XDbvZIoxhaV7QV/MkAnLeQyCmLKKT6KyVNyueQgWXDs55dVFXkR5X4q4
 JgEM6grUlW1zxYz+v9cDQ5yXKE2qgpjqzxQPxE6F9mJWQq13zMK/rukJxgqNzejq
 FsRhgIJ7BlHOfqCOf0ForD6oGWjaDAdsixxwB0qBA==
X-ME-Sender: <xms:A3RwX3ovPqk7XvK2BABKDOhtDoyWhJVDYK69xgil3wCm27pgtEyD3w>
 <xme:A3RwXxrvj8a02xteArLSrgmtNepp5MzP3T_0HnSEEJVtwZk6V2NurrZa2AubxlXWU
 GDl9gzIrlYxpg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdeggdefkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkgggtugesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
 rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
 gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptddugfetudev
 udeiveevgfetueejlefggffghffhhfehtdfffeefgfduueegfefhnecukfhppeeluddrie
 egrddujedtrdekleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
 hm
X-ME-Proxy: <xmx:A3RwX0OCcsuRbVF6TAUqGM-oSaqH2y-1aaEEyYZISK2uRIqvz4SVKg>
 <xmx:A3RwX64UcfVzFrFKeJB8G-3thH10LBbnvrnvq8a2lHCQyId8WNoL-w>
 <xmx:A3RwX27mZUq5lyqRrTKmhxB1aherXNtUddvtDDE17xbuXhcLba_wOg>
 <xmx:A3RwX8lv5ueT8-vd0sW6sM_9Ur3gUc2W2R8m_X-itkktqx2nCwyEQA>
Received: from mail-itl (unknown [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 18CFF3280059;
 Sun, 27 Sep 2020 07:14:09 -0400 (EDT)
Date: Sun, 27 Sep 2020 13:14:05 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Denis Efremov <efremov@linux.com>, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Roman Shaposhnik <roman@zededa.com>, Thomas Gleixner <tglx@linutronix.de>,
 Juergen Gross <jgross@suse.com>
Subject: Kernel panic on 'floppy' module load, Xen HVM, since 4.19.143
Message-ID: <20200927111405.GJ3962@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="x+WOirvrtTKur1pg"
Content-Disposition: inline
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--x+WOirvrtTKur1pg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Kernel panic on 'floppy' module load, Xen HVM, since 4.19.143

Hi all,

I get kernel panic on 'floppy' module load. If I blacklist the module,
then everything works.
The issue happens in Xen HVM, other virtualization modes (PV, PVH) works
fine. PV dom0 works too. I haven't tried bare metal, but I assume it
works fine too.
The issue happens on newer kernels too (5.8.10 crashes, 5.8.5 works),
but I have it most analyzed on 4.19.x.

Other interesting observations:
- The crash does not manifest when the VM does nothing else than loading
  floppy (by adding systemd.target=3Dmodprobe@floppy.service to kernel
  cmdline).
- This bug is not just another "memory corruption" one, but appears to
  be caused by a hole where the IOAPIC registers are supposed to be
  mapped. If this is a pagetable corruption then this is a blocker.
- No other significant differences in kmsg are observed (In particular,
  I/O APIC appears to be initialised successfully without any
  anomalies).
- Modules linked in: floppy(+) xenfs xen_gntdev xen_gntalloc xen_privcmd
  xen_evtchn overlay xen_blkfront
- Loading floppy early in boot along with the module list above (nopat
  modules-load=3Dxenfs,xen-gntdev,xen-gntalloc,xen-privcmd,xen-evtchn,xen-b=
lkfront,overlay,floppy)
  seems to avoid the crash.
- Even with the above, unloading and reloading floppy still results in a cr=
ash.

I've read git log between 4.19.142 and 4.19.143 and I don't see any
obvious change that could cause this. The only thing that may be remotely
relevant is a "XEN uses irqdesc::irq_data_common::handler_data to store
a per interrupt XEN data pointer which contains XEN specific
information." commit, so I'm adding involved people to this thread.

The actual crash message (this is from 4.19.144, but it is the same on
4.19.143):

[    2.631097] BUG: unable to handle kernel paging request at ffffffffff5f9=
000
[    2.631117] PGD 1220e067 P4D 1220e067 PUD 12210067 PMD 12211067 PTE 0
[    2.631135] Oops: 0002 [#1] SMP PTI
[    2.631147] CPU: 1 PID: 275 Comm: systemd-udevd Tainted: G           O  =
    4.19.144-1.pvops.qubes.x86_64 #1
[    2.631173] Hardware name: Xen HVM domU, BIOS 4.8.5-22.fc25 08/15/2020
[    2.631192] RIP: 0010:ioapic_configure_entry+0x66/0xb0
[    2.631206] Code: 8d 88 04 02 00 00 48 8d 04 c0 44 8d 52 11 4d 8d 1c c0 =
c1 e1 0c 48 63 c9 41 8b 43 14 25 ff 0f 00 00 48 2d 00 10 80 00 48 29 c8 <44=
> 89 10 44 89 48 10 41 8b 43 14 83 c2 10
 25 ff 0f 00 00 48 2d 00
[    2.631251] RSP: 0000:ffffaf4f40353b08 EFLAGS: 00010086
[    2.631265] RAX: ffffffffff5f9000 RBX: ffff8c3155ad7480 RCX: 00000000002=
06000
[    2.631285] RDX: 0000000000000008 RSI: ffff8c314e369640 RDI: 00000000fff=
fffff
[    2.631304] RBP: ffff8c3155914828 R08: ffffffffb09cfac0 R09: 00000000000=
00001
[    2.631324] R10: 0000000000000019 R11: ffffffffb09cfb50 R12: ffff8c31559=
35e00
[    2.631343] R13: ffff8c3155914828 R14: ffff8c3155914960 R15: ffff8c31559=
148a4
[    2.631363] FS:  000072ea2b67fb80(0000) GS:ffff8c3156f00000(0000) knlGS:=
0000000000000000
[    2.631383] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.631399] CR2: ffffffffff5f9000 CR3: 000000000c266005 CR4: 00000000001=
606e0
[    2.631420] Call Trace:
[    2.631433]  mp_irqdomain_activate+0x21/0x40
[    2.631448]  __irq_domain_activate_irq+0x60/0xa0
[    2.631462]  irq_domain_activate_irq+0x25/0x40
[    2.631476]  __setup_irq+0x3ba/0x720
[    2.631486]  request_threaded_irq+0xfa/0x170
[    2.631502]  floppy_module_init+0xa33/0x1d23 [floppy]
[    2.631518]  ? netlink_broadcast_filtered+0x157/0x410
[    2.631533]  ? set_cmos+0x112/0x112 [floppy]
[    2.631548]  do_one_initcall+0x4d/0x1d6
[    2.631559]  ? free_unref_page_commit+0x9f/0x120
[    2.631573]  ? _cond_resched+0x16/0x40
[    2.631584]  ? kmem_cache_alloc_trace+0x169/0x1e0
[    2.631598]  do_init_module+0x5b/0x20e
[    2.631610]  load_module+0x1bb9/0x1fc0
[    2.631624]  ? ima_post_read_file+0xe2/0x120
[    2.631639]  ? __do_sys_finit_module+0xd2/0x100
[    2.631653]  __do_sys_finit_module+0xd2/0x100
[    2.631667]  do_syscall_64+0x5b/0x190
[    2.631679]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[    2.631693] RIP: 0033:0x72ea2c7a137d
[    2.631704] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 =
89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48=
> 3d 01 f0 ff ff 73 01 c3 48 8b 0d eb 6a
 0c 00 f7 d8 64 89 01 48
[    2.631749] RSP: 002b:00007fffafe7b4f8 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000139
[    2.631770] RAX: ffffffffffffffda RBX: 000064f1749ff120 RCX: 000072ea2c7=
a137d
[    2.631790] RDX: 0000000000000000 RSI: 000072ea2c40095d RDI: 00000000000=
00006
[    2.631809] RBP: 0000000000020000 R08: 0000000000000000 R09: 00000000000=
00007
[    2.631828] R10: 0000000000000006 R11: 0000000000000246 R12: 00000000000=
00000
[    2.631848] R13: 000072ea2c40095d R14: 000064f174c89690 R15: 000064f1749=
fedd0
[    2.631868] Modules linked in: floppy(+) iwldvm(+) mac80211 fjes(-) iwlw=
ifi cfg80211 ttm ehci_pci rfkill e1000e(+) drm_kms_helper ehci_hcd ata_gene=
ric pata_acpi i2c_piix4 u2mfn(O) xen_gnt
dev xen_gntalloc xen_blkback xen_evtchn drm xenfs xen_privcmd overlay xen_b=
lkfront
[    2.631932] CR2: ffffffffff5f9000
[    2.631944] ---[ end trace 28ae492a4a502a7c ]---
[    2.631958] RIP: 0010:ioapic_configure_entry+0x66/0xb0
[    2.631972] Code: 8d 88 04 02 00 00 48 8d 04 c0 44 8d 52 11 4d 8d 1c c0 =
c1 e1 0c 48 63 c9 41 8b 43 14 25 ff 0f 00 00 48 2d 00 10 80 00 48 29 c8 <44=
> 89 10 44 89 48 10 41 8b 43 14 83 c2 10
 25 ff 0f 00 00 48 2d 00
[    2.632018] RSP: 0000:ffffaf4f40353b08 EFLAGS: 00010086
[    2.632032] RAX: ffffffffff5f9000 RBX: ffff8c3155ad7480 RCX: 00000000002=
06000
[    2.632051] RDX: 0000000000000008 RSI: ffff8c314e369640 RDI: 00000000fff=
fffff
[    2.632071] RBP: ffff8c3155914828 R08: ffffffffb09cfac0 R09: 00000000000=
00001
[    2.632090] R10: 0000000000000019 R11: ffffffffb09cfb50 R12: ffff8c31559=
35e00
[    2.632109] R13: ffff8c3155914828 R14: ffff8c3155914960 R15: ffff8c31559=
148a4
[    2.632129] FS:  000072ea2b67fb80(0000) GS:ffff8c3156f00000(0000) knlGS:=
0000000000000000
[    2.632149] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.632166] CR2: ffffffffff5f9000 CR3: 000000000c266005 CR4: 00000000001=
606e0
[    2.632185] Kernel panic - not syncing: Fatal exception
[    2.632319] Kernel Offset: 0x2e000000 from 0xffffffff81000000 (relocatio=
n range: 0xffffffff80000000-0xffffffffbfffffff)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--x+WOirvrtTKur1pg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl9wc/4ACgkQ24/THMrX
1yyMdQf/dH9r8NeugaY+cAYdfqxcE/1DAoMej9ICeNfCMmmVFw7dS89VhEgvS2OG
NBOq285IFe12VUDKBL1MrA8zYCTjPhfTTqlYeWNWk/i9DaFmoTTaqroPYHMi9typ
T3+D74sZedNRvXq7/8kQwLdiDAUIdRlU1vdgj2p2gio94S9SVvrfFrwPAI790Ecr
42ksm6cTD/b8fZ+hHqrzieQcwE8/jMnC2fTrD798FM6LzROMbfCohQNXoXpJL0tu
ytrBV1RiVd96e31c4NoPygL8jwcIIFyq00IUWhYu/kiUMGfoPAWouTP67mcM0V/4
qxYWIOY7ny8KHDNUe8oGdL+8vHLG7w==
=6aYG
-----END PGP SIGNATURE-----

--x+WOirvrtTKur1pg--

