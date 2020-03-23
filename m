Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8ED18ED72
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 01:14:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGAfE-0002kz-Oi; Mon, 23 Mar 2020 00:09:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wsDW=5I=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jGAfC-0002kt-QA
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 00:09:54 +0000
X-Inumbo-ID: 9e1b2d77-6c9a-11ea-81f8-12813bfff9fa
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e1b2d77-6c9a-11ea-81f8-12813bfff9fa;
 Mon, 23 Mar 2020 00:09:54 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id D1F673C8;
 Sun, 22 Mar 2020 20:09:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 22 Mar 2020 20:09:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Krh8EY
 ngi39gkQMItmOaAJFpmjvdmU0O1qEFjuFW8r4=; b=dCdc+pGJV3Wuu0Xtm40ZNk
 TSikIZ3ULPjTGKajV8uB1rghMkZywwhWL+1nKtcZidONy3KHV3WKTl/u5HCPKgmc
 O8Nlq50rJyqTUA/95v3+3ia7nszcroeyGtevXc2xBSTYs5QcTFQNaW65iyKJCJRd
 Z1r4Em7gSSIxA9Hrl3/nYl3llbraZC62mBDs1JFpb9H01t7L8lum+TBpnXBWZ1RL
 RVWUm8Y7S99kKWr3eyrM9w4XoGA1xrkTElmOlAlK8kFFTvdGlT/rhySLJX3nONMx
 /fsaLy+7+F9ZeWseM0tlbr+BditFdNOYr5E/uBHjUCiw7PMCjj9f6inb8Po/9jeg
 ==
X-ME-Sender: <xms:UP53Xjk0ydbVtE5arFEjpzyzVNxtnxO3QW2u8BFNGO1UFpgqra89yw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudegjedgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinhepohhpvghnshhu
 shgvrdhorhhgnecukfhppeeluddrieehrdefgedrfeefnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgs
 lhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:UP53XvMKZzXOM1RLtjDu12pOwj8DWeIQXlcIqpJinaDTSD2SUjkwww>
 <xmx:UP53Xr1Tfk2vUOGGgtuOzVscWFPyR9sFwi9AllzNqt80HbQoYfCcJQ>
 <xmx:UP53Xjann4eETVRuXC29UeJdwoqnxmNOfiq3QRWjwSMMzij7dPEYjQ>
 <xmx:UP53XocMGfChzSsilEgUug3uXgzPpM8SAel9DcIInq22_HbQMYbkOw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 85C58328005E;
 Sun, 22 Mar 2020 20:09:51 -0400 (EDT)
Date: Mon, 23 Mar 2020 01:09:46 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Dario Faggioli <dfaggioli@suse.com>
Message-ID: <20200323000946.GH18599@mail-itl>
References: <20200318141635.GW7869@mail-itl>
 <fa845540-fd8e-bc63-a3af-50673dede579@citrix.com>
 <20200318221006.GS18599@mail-itl>
 <413cac496e18bcb04b0691ef633d206f3a14a8e3.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <413cac496e18bcb04b0691ef633d206f3a14a8e3.camel@suse.com>
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.de>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============3786756082450786425=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3786756082450786425==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ET6UV2goafmXLl1s"
Content-Disposition: inline


--ET6UV2goafmXLl1s
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13

On Thu, Mar 19, 2020 at 01:28:10AM +0100, Dario Faggioli wrote:
> [Adding Juergen]
>=20
> On Wed, 2020-03-18 at 23:10 +0100, Marek Marczykowski-G=C3=B3recki wrote:
> > On Wed, Mar 18, 2020 at 02:50:52PM +0000, Andrew Cooper wrote:
> > > On 18/03/2020 14:16, Marek Marczykowski-G=C3=B3recki wrote:
> > > > Hi,
> > > >=20
> > > > In my test setup (inside KVM with nested virt enabled), I rather
> > > > frequently get Xen crash on resume from S3. Full message below.
> > > >=20
> > > > This is Xen 4.13.0, with some patches, including "sched: fix
> > > > resuming
> > > > from S3 with smt=3D0".
> > > >=20
> > > > Contrary to the previous issue, this one does not happen always -
> > > > I
> > > > would say in about 40% cases on this setup, but very rarely on
> > > > physical
> > > > setup.
> > > >=20
> > > > This is _without_ core scheduling enabled, and also with smt=3Doff.
> > > >=20
> > > > Do you think it would be any different on xen-unstable? I cat
> > > > try, but
> > > > it isn't trivial in this setup, so I'd ask first.
> > > >=20
> Well, Juergen has fixed quite a few issues.
>=20
> Most of them where triggering with core-scheduling enabled, and I don't
> recall any of them which looked similar or related to this.
>=20
> Still, it's possible that the same issue causes different symptoms, and
> hence that maybe one of the patches would fix this too.

I've tested on master (d094e95fb7c), and reproduced exactly the same crash
(pasted below for the completeness).=20
But there is more: additionally, in most (all?) cases after resume I've got
soft lockup in Linux dom0 in smp_call_function_single() - see below. It
didn't happened before and the only change was Xen 4.13 -> master.

Xen crash:

(XEN) Assertion 'c2rqd(sched_unit_master(unit)) =3D=3D svc->rqd' failed at =
credit2.c:2133
(XEN) ----[ Xen-4.14-unstable  x86_64  debug=3Dy   Not tainted ]----
(XEN) CPU:    1
(XEN) RIP:    e008:[<ffff82d08023a3c5>] credit2.c#csched2_unit_wake+0x14f/0=
x151
(XEN) RFLAGS: 0000000000010002   CONTEXT: hypervisor (d0v1)
(XEN) rax: ffff8301ba8fafb0   rbx: ffff8300912238b0   rcx: 0000000000000000
(XEN) rdx: ffff8301ba8d81f0   rsi: 0000000000000000   rdi: ffff8301ba8d8016
(XEN) rbp: ffff830170db7d30   rsp: ffff830170db7d10   r8:  deadbeefdeadf00d
(XEN) r9:  deadbeefdeadf00d   r10: 0000000000000000   r11: 0000000000000000
(XEN) r12: ffff8300912239a0   r13: ffff82d080433780   r14: 0000000000000000
(XEN) r15: 0000005bdb5286ad   cr0: 0000000080050033   cr4: 0000000000000660
(XEN) cr3: 000000010e53c000   cr2: 00005ec1b2f56280
(XEN) fsb: 000079872ee29700   gsb: ffff88813ff00000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <ffff82d08023a3c5> (credit2.c#csched2_unit_wake+0x14f=
/0x151):
(XEN)  df e8 f9 c5 ff ff eb ad <0f> 0b 55 48 89 e5 41 57 41 56 41 55 41 54 =
53 48
(XEN) Xen stack trace from rsp=3Dffff830170db7d10:
(XEN)    ffff830090a33000 ffff8300912238b0 ffff8300912238b0 ffff8301ba8d8010
(XEN)    ffff830170db7d78 ffff82d08024253b 0000000000000202 ffff8301ba8d8010
(XEN)    ffff830090a33000 ffff8300a864b000 000079872c600010 0000000000000000
(XEN)    0000000000000001 ffff830170db7d90 ffff82d080206e09 ffff8300a864b000
(XEN)    ffff830170db7da8 ffff82d080206f1c 0000000000000000 ffff830170db7ec0
(XEN)    ffff82d080204de7 ffff8301ba8cb001 ffff830170db7fff 0000000470db7e10
(XEN)    0000000000000000 ffff82e0021d0160 ffff88813ff15b28 ffff8301ba8cb000
(XEN)    ffff8301ba8cb000 ffff8301ba88b000 ffff830170db7e10 0000001200000004
(XEN)    0000798728000005 0000000000000001 0000000000000005 000079872ee286e0
(XEN)    000079872c109e77 000000030000001c 00007986ec0013c0 ffff010a00000005
(XEN)    000000000002a240 000000000002bb30 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000001 00000005d1ea5ab2 0000000000000001
(XEN)    7ba0548d00000000 ffff830170db7ef8 ffff8301ba88b000 0000000000000001
(XEN)    0000000000000000 0000000000000000 ffff830170db7ee8 ffff82d0802d779d
(XEN)    ffff8301ba88b000 0000000000000000 0000000000000000 00007cfe8f2480e7
(XEN)    ffff82d080355432 ffff88813a1bef00 000079872ee28590 000079872ee28590
(XEN)    ffff8881358e9c40 ffff88813a1bef00 ffff88813a1bef01 0000000000000282
(XEN)    0000000000000000 ffffc90001923e08 0000000000000000 0000000000000024
(XEN)    ffffffff8100148a 0000000000000000 0000000000000000 000079872c600010
(XEN)    0000010000000000 ffffffff8100148a 000000000000e033 0000000000000282
(XEN) Xen call trace:
(XEN)    [<ffff82d08023a3c5>] R credit2.c#csched2_unit_wake+0x14f/0x151
(XEN)    [<ffff82d08024253b>] F vcpu_wake+0xdd/0x3ff
(XEN)    [<ffff82d080206e09>] F domain_unpause+0x2f/0x3b
(XEN)    [<ffff82d080206f1c>] F domain_unpause_by_systemcontroller+0x40/0x60
(XEN)    [<ffff82d080204de7>] F do_domctl+0x9e1/0x16f1
(XEN)    [<ffff82d0802d779d>] F pv_hypercall+0x548/0x560
(XEN)    [<ffff82d080355432>] F lstar_enter+0x112/0x120
(XEN)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 1:
(XEN) Assertion 'c2rqd(sched_unit_master(unit)) =3D=3D svc->rqd' failed at =
credit2.c:2133
(XEN) ****************************************
(XEN)
(XEN) Reboot in five seconds...


Linux dom0 soft lockup:

[  524.742089] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [systemd:1]
[  524.747897] Modules linked in: joydev br_netfilter xt_physdev xen_netbac=
k bridge stp llc loop ebtable_filter ebtables ip6table_filter ip6_tables ip=
table_filter snd_hda_codec_generic ledtrig_audio ppdev snd_hda_intel snd_in=
tel_nhlt snd_hda_codec snd_hda_core edac_mce_amd snd_hwdep snd_seq snd_seq_=
device snd_pcm pcspkr snd_timer snd parport_pc e1000e soundcore parport i2c=
_piix4 xenfs ip_tables dm_thin_pool dm_persistent_data libcrc32c dm_bio_pri=
son bochs_drm drm_kms_helper drm_vram_helper ttm drm serio_raw ehci_pci ehc=
i_hcd virtio_console virtio_scsi ata_generic pata_acpi floppy qemu_fw_cfg x=
en_privcmd xen_pciback xen_blkback xen_gntalloc xen_gntdev xen_evtchn uinpu=
t pkcs8_key_parser
[  524.768696] CPU: 1 PID: 1 Comm: systemd Tainted: G        W         5.4.=
25-1.qubes.x86_64 #1
[  524.771407] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
rel-1.12.0-59-gc9ba527-rebuilt.opensuse.org 04/01/2014
[  524.775056] RIP: e030:smp_call_function_single+0xe0/0x110
[  524.776755] Code: 65 48 33 0c 25 28 00 00 00 75 3b c9 c3 4c 89 c2 4c 89 =
c9 48 89 e6 e8 5f fe ff ff 8b 54 24 18 83 e2 01 74 0b f3 90 8b 54 24 18 <83=
> e2 01 75 f5 eb ca 8b 05 3b 92 e0 01 85 c0 75 80 0f 0b e9 79 ff
[  524.783649] RSP: e02b:ffffc90000c0fc60 EFLAGS: 00000202
[  524.788857] RAX: 0000000000000000 RBX: ffff888136632540 RCX: 00000000000=
00040
[  524.791207] RDX: 0000000000000003 RSI: ffffffff82824c60 RDI: ffffffff820=
107c0
[  524.793610] RBP: ffffc90000c0fca0 R08: 0000000000000000 R09: ffff88813b0=
007e8
[  524.795737] R10: 0000000000000000 R11: ffffffff8265b6e8 R12: 00000000000=
00001
[  524.797847] R13: ffffc90000c0fdb0 R14: ffffffff82feb744 R15: ffff88813b7=
c6800
[  524.800156] FS:  000074e59239e5c0(0000) GS:ffff88813ff00000(0000) knlGS:=
0000000000000000
[  524.802883] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[  524.804661] CR2: 000074e59345a400 CR3: 00000001337e0000 CR4: 00000000000=
00660
[  524.807097] Call Trace:
[  524.807959]  ? perf_cgroup_attach+0x70/0x70
[  524.809433]  ? _raw_spin_unlock_irqrestore+0x14/0x20
[  524.811179]  ? cgroup_move_task+0x109/0x150
[  524.812623]  task_function_call+0x4d/0x80
[  524.814179]  ? perf_cgroup_switch+0x190/0x190
[  524.815738]  perf_cgroup_attach+0x3f/0x70
[  524.817125]  cgroup_migrate_execute+0x35e/0x420
[  524.818704]  cgroup_attach_task+0x159/0x210
[  524.820158]  ? find_inode_fast.isra.0+0x8e/0xb0
[  524.822055]  cgroup_procs_write+0xd0/0x100
[  524.823692]  cgroup_file_write+0x9b/0x170
[  524.825220]  kernfs_fop_write+0xce/0x1b0
[  524.826598]  vfs_write+0xb6/0x1a0
[  524.827776]  ksys_write+0x67/0xe0
[  524.828969]  do_syscall_64+0x5b/0x1a0
[  524.830083]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  524.831599] RIP: 0033:0x74e5933894b7
[  524.832696] Code: 64 89 02 48 c7 c0 ff ff ff ff eb bb 0f 1f 80 00 00 00 =
00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48=
> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
[  524.838570] RSP: 002b:00007ffdfc2df548 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000001
[  524.841100] RAX: ffffffffffffffda RBX: 0000000000000005 RCX: 000074e5933=
894b7
[  524.843469] RDX: 0000000000000005 RSI: 00007ffdfc2df70a RDI: 00000000000=
00017
[  524.846368] RBP: 00007ffdfc2df70a R08: 0000000000000000 R09: 00007ffdfc2=
df590
[  524.848816] R10: 0000000000000000 R11: 0000000000000246 R12: 00000000000=
00005
[  524.851009] R13: 00006149cb4f3800 R14: 0000000000000005 R15: 000074e5934=
5a700

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--ET6UV2goafmXLl1s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl53/koACgkQ24/THMrX
1ywp9Qf/XpkUJk1wY9wBf9+aL8gnRfXASKCKBXytW+YgbEvdeOeLvzNJ3PTrtCYN
3/sq+w7kGC1IP19wu7MyVQNtChGOq4sfhqvYZ6kFx5a3Nv0bQyneYbDjUmKbSG+J
cYguFJXQGytQhrF443aa6wvNIw5Ij5fUx6aDDcgbpPgmgjK/68Ttg6tir2LI+/wr
mgWiJoXitxXtBegFC76EQURs5TonwAjawponWTHo3Brbes+LYJ3QEe/IQMoMRILs
pQ0n63qCJ9mEpqFwulz1tui6sJrAwJ3CXYbX5E6MbxGulIH2IZ7T0Kq5bVQtykpU
PvXVk6L8IxvBVrOPrng8gE8b4PnuOg==
=PArY
-----END PGP SIGNATURE-----

--ET6UV2goafmXLl1s--


--===============3786756082450786425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3786756082450786425==--

