Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B456698F4
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 14:45:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477337.740008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGKMP-00052z-Ae; Fri, 13 Jan 2023 13:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477337.740008; Fri, 13 Jan 2023 13:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGKMP-0004zn-5a; Fri, 13 Jan 2023 13:44:45 +0000
Received: by outflank-mailman (input) for mailman id 477337;
 Fri, 13 Jan 2023 13:44:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LVbI=5K=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pGKMN-0004zh-M6
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 13:44:43 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d29503e-9348-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 14:44:41 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 400CD5C00DB;
 Fri, 13 Jan 2023 08:44:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 13 Jan 2023 08:44:39 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jan 2023 08:44:38 -0500 (EST)
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
X-Inumbo-ID: 6d29503e-9348-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1673617479; x=
	1673703879; bh=0Z133yuNnDBtJv8nz69dJpUcuCn5DG8cpUPCJWQzx8A=; b=z
	l4553zvD8JYgHFG3wMoYiQQ2JhzeU1uWwpxFdQjm3MCuSGKGkCw1kLXfYU2b9m4a
	1i81lTazVLPSqKhGyogcWIhBXZ33mrIjV4yd4GJyIVcByGlqqVOJ1sgBuciNA5gP
	uYM7iauI9KzNJFSaJW9hpVmKk5f0yy4ICNompnsm4np+B80gYh3ydo1EDJjzkI4V
	JhnP1DjKYWWtkd3mzgxAl7jLzggIJCxMY0dHVpD4pIzqTS54wTJz1qSX43vfJezQ
	a4d+RH0IXGzmJ9x6a9fVvd0PxkTX0hdLK/q/xCpeiB1Pq42jFSgvewrJ9jQOmoOS
	J45dPikxQTPjJvBt6uGiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1673617479; x=1673703879; bh=0Z133yuNnDBtJv8nz69dJpUcuCn5
	DG8cpUPCJWQzx8A=; b=m4F9K0EXrmeN2vQtWb1amWESEdiE60I8XU7vN0KpEfJT
	25nElse4vJ0Kk6abAP99IPqrLocNSDkxKpv0T7KzC3iw3frus1uylV6b2AVwZUPj
	BrWVL2xsMH6fCkD6nUk4w4eqFxiRExGaPPVXxX4elbNbiX6wrBQ/HiGQnZ1XY4tp
	3FztOBSg8oJElwwOlKXQRIdGht1aDBpypVnH7gRQu+KZOcE4zCNoa2VxiXGI+LD1
	Q4viKCiz4r8yhlSmIVuirDJ5hE2E3VKisQK+o4RXNQBPD5ATwBg4KoSdUl/9c/v6
	xg2KITBJ7myEeghEi4lnQMnzNbqJ0S/hRFZmjwg8nQ==
X-ME-Sender: <xms:R2DBY0I3h9yXTkJlUI97v08oYK-PTd7ODCjB2iGoSc-PnTXbOajZGw>
    <xme:R2DBY0LvBdb1RV0NLWgtYIfn4OPai_408fi2hqTEYS9i0AMfdIV6tbc8FwYf4W86B
    -kEL4ohx-3hzg>
X-ME-Received: <xmr:R2DBY0uDtDlzg7dFypURUO7VGgCNIkiVConBzwFc1NN_2NYhkDwymKN7GGTiubcnHprfYoI16R2_4R7e6QJbHMpGJwQIeOmqrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleekgdehvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduteev
    leevffdvteeludeljeeiieeufffhgfdvfeekudeihfehteehkeekfeffieenucffohhmrg
    hinhepmhgrihhlqdgrrhgthhhivhgvrdgtohhmnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvth
    hhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:R2DBYxa12BeO9P5CAMlPB2YE70IVMP1oq-Ok-lTtTtd-y3ZtfyfEAQ>
    <xmx:R2DBY7aighrGYPTUQ3esH7nA8ozd6PmzRb-UddaFmhwN30rhm0eLdQ>
    <xmx:R2DBY9BnffzYOF5S5KrV8P8n7r19FtsCfflo9hUjbRYMBo5hVSrpDw>
    <xmx:R2DBY8Ce9ESwC2p7_P9AcGdnECsqObGzd9V5dfYgTnVVrWwS-YgOuw>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 13 Jan 2023 14:44:33 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, regressions@lists.linux.dev
Subject: Re: S3 under Xen regression between 6.1.1 and 6.1.3
Message-ID: <Y8FgQyVvpUXqumvS@mail-itl>
References: <Y8DIodWQGm99RA+E@mail-itl>
 <bdea54df-59dc-3d4d-dd0c-8c45403dea24@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a1z64RtYn87d7j8p"
Content-Disposition: inline
In-Reply-To: <bdea54df-59dc-3d4d-dd0c-8c45403dea24@suse.com>


--a1z64RtYn87d7j8p
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Jan 2023 14:44:33 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, regressions@lists.linux.dev
Subject: Re: S3 under Xen regression between 6.1.1 and 6.1.3

On Fri, Jan 13, 2023 at 09:08:35AM +0100, Juergen Gross wrote:
> On 13.01.23 03:57, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >=20
> > 6.1.3 as PV dom0 crashes when attempting to suspend. 6.1.1 works. The
> > crash:
> >=20
> >      [  348.284004] PM: suspend entry (deep)
> >      [  348.289532] Filesystems sync: 0.005 seconds
> >      [  348.291545] Freezing user space processes ... (elapsed 0.000 se=
conds) done.
> >      [  348.292457] OOM killer disabled.
> >      [  348.292462] Freezing remaining freezable tasks ... (elapsed 0.1=
04 seconds) done.
> >      [  348.396612] printk: Suspending console(s) (use no_console_suspe=
nd to debug)
> >      [  348.749228] PM: suspend devices took 0.352 seconds
> >      [  348.769713] ACPI: EC: interrupt blocked
> >      [  348.816077] BUG: kernel NULL pointer dereference, address: 0000=
00000000001c
> >      [  348.816080] #PF: supervisor read access in kernel mode
> >      [  348.816081] #PF: error_code(0x0000) - not-present page
> >      [  348.816083] PGD 0 P4D 0
> >      [  348.816086] Oops: 0000 [#1] PREEMPT SMP NOPTI
> >      [  348.816089] CPU: 0 PID: 6764 Comm: systemd-sleep Not tainted 6.=
1.3-1.fc32.qubes.x86_64 #1
> >      [  348.816092] Hardware name: Star Labs StarBook/StarBook, BIOS 8.=
01 07/03/2022
> >      [  348.816093] RIP: e030:acpi_get_wakeup_address+0xc/0x20
> >      [  348.816100] Code: 44 00 00 48 8b 05 04 a3 82 02 c3 cc cc cc cc =
cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc 0f 1f 44 00 00 48 8b 05 fc 9d =
82 02 <8b> 40 1c c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 90 0f 1f
> >      [  348.816103] RSP: e02b:ffffc90042537d08 EFLAGS: 00010246
> >      [  348.816105] RAX: 0000000000000000 RBX: 0000000000000003 RCX: 20=
c49ba5e353f7cf
> >      [  348.816106] RDX: 000000000000cd19 RSI: 000000000002ee9a RDI: 00=
2a051ed42d7694
> >      [  348.816108] RBP: 0000000000000003 R08: ffffc90042537ca0 R09: ff=
ffffff82c5e468
> >      [  348.816110] R10: 0000000000007ff0 R11: 0000000000000000 R12: 00=
00000000000000
> >      [  348.816111] R13: fffffffffffffff2 R14: ffff88812206e6c0 R15: ff=
ff88812206e6e0
> >      [  348.816121] FS:  00007cb49b01eb80(0000) GS:ffff888189400000(000=
0) knlGS:0000000000000000
> >      [  348.816123] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> >      [  348.816124] CR2: 000000000000001c CR3: 000000012231a000 CR4: 00=
00000000050660
> >      [  348.816131] Call Trace:
> >      [  348.816133]  <TASK>
> >      [  348.816134]  acpi_pm_prepare+0x1a/0x50
> >      [  348.816141]  suspend_enter+0x94/0x360
> >      [  348.816146]  suspend_devices_and_enter+0x198/0x2b0
> >      [  348.816150]  enter_state+0x18d/0x1f5
> >      [  348.816155]  pm_suspend.cold+0x20/0x6b
> >      [  348.816159]  state_store+0x27/0x60
> >      [  348.816163]  kernfs_fop_write_iter+0x125/0x1c0
> >      [  348.816169]  new_sync_write+0x105/0x190
> >      [  348.816176]  vfs_write+0x211/0x2a0
> >      [  348.816180]  ksys_write+0x67/0xe0
> >      [  348.816183]  do_syscall_64+0x59/0x90
> >      [  348.816188]  ? do_syscall_64+0x69/0x90
> >      [  348.816192]  ? exc_page_fault+0x76/0x170
> >      [  348.816195]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> >      [  348.816200] RIP: 0033:0x7cb49c1412f7
> >      [  348.816203] Code: 0d 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb =
b7 0f 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 =
0f 05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
> >      [  348.816204] RSP: 002b:00007ffc125f63f8 EFLAGS: 00000246 ORIG_RA=
X: 0000000000000001
> >      [  348.816206] RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 00=
007cb49c1412f7
> >      [  348.816208] RDX: 0000000000000004 RSI: 00007ffc125f64e0 RDI: 00=
00000000000004
> >      [  348.816209] RBP: 00007ffc125f64e0 R08: 00005c83d772bca0 R09: 00=
0000000000000d
> >      [  348.816210] R10: 00005c83d7727eb0 R11: 0000000000000246 R12: 00=
00000000000004
> >      [  348.816211] R13: 00005c83d77272d0 R14: 0000000000000004 R15: 00=
007cb49c213700
> >      [  348.816213]  </TASK>
> >      [  348.816214] Modules linked in: loop vfat fat snd_hda_codec_hdmi=
 snd_sof_pci_intel_tgl snd_sof_intel_hda_common soundwire_intel soundwire_g=
eneric_allocation soundwire_cadence snd_sof_intel_hda snd_sof_pci snd_sof_x=
tensa_dsp snd_sof snd_sof_utils snd_soc_hdac_hda snd_hda_ext_core snd_soc_a=
cpi_intel_match snd_soc_acpi soundwire_bus snd_hda_codec_realtek snd_hda_co=
dec_generic ledtrig_audio snd_soc_core snd_compress ac97_bus snd_pcm_dmaeng=
ine snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi iTCO_wdt intel_pmc_bx=
t ee1004 iTCO_vendor_support intel_rapl_msr snd_hda_codec snd_hda_core snd_=
hwdep snd_seq snd_seq_device iwlwifi snd_pcm pcspkr joydev processor_therma=
l_device_pci_legacy processor_thermal_device snd_timer snd cfg80211 process=
or_thermal_rfim i2c_i801 processor_thermal_mbox i2c_smbus idma64 rfkill pro=
cessor_thermal_rapl soundcore intel_rapl_common int340x_thermal_zone intel_=
soc_dts_iosf igen6_edac intel_hid intel_pmc_core intel_scu_pltdrv sparse_ke=
ymap fuse xenfs ip_tables dm_thin_pool
> >      ic#2 Part1
> >      [  348.816259]  dm_persistent_data dm_bio_prison dm_crypt i915 crc=
t10dif_pclmul crc32_pclmul crc32c_intel polyval_clmulni polyval_generic drm=
_buddy nvme video wmi drm_display_helper nvme_core xhci_pci xhci_pci_renesa=
s ghash_clmulni_intel hid_multitouch sha512_ssse3 serio_raw nvme_common cec=
 xhci_hcd ttm i2c_hid_acpi i2c_hid pinctrl_tigerlake xen_acpi_processor xen=
_privcmd xen_pciback xen_blkback xen_gntalloc xen_gntdev xen_evtchn uinput
> >      [  348.816281] CR2: 000000000000001c
> >      [  348.816283] ---[ end trace 0000000000000000 ]---
> >      [  348.867991] RIP: e030:acpi_get_wakeup_address+0xc/0x20
> >      [  348.867996] Code: 44 00 00 48 8b 05 04 a3 82 02 c3 cc cc cc cc =
cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc 0f 1f 44 00 00 48 8b 05 fc 9d =
82 02 <8b> 40 1c c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 90 0f 1f
> >      [  348.867998] RSP: e02b:ffffc90042537d08 EFLAGS: 00010246
> >      [  348.867999] RAX: 0000000000000000 RBX: 0000000000000003 RCX: 20=
c49ba5e353f7cf
> >      [  348.868000] RDX: 000000000000cd19 RSI: 000000000002ee9a RDI: 00=
2a051ed42d7694
> >      [  348.868001] RBP: 0000000000000003 R08: ffffc90042537ca0 R09: ff=
ffffff82c5e468
> >      [  348.868001] R10: 0000000000007ff0 R11: 0000000000000000 R12: 00=
00000000000000
> >      [  348.868002] R13: fffffffffffffff2 R14: ffff88812206e6c0 R15: ff=
ff88812206e6e0
> >      [  348.868008] FS:  00007cb49b01eb80(0000) GS:ffff888189400000(000=
0) knlGS:0000000000000000
> >      [  348.868009] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> >      [  348.868009] CR2: 000000000000001c CR3: 000000012231a000 CR4: 00=
00000000050660
> >      [  348.868014] Kernel panic - not syncing: Fatal exception
> >      [  348.868031] Kernel Offset: disabled
> >=20
> > Looking at git log between those two versions, and the
> > acpi_get_wakeup_address() function, I suspect it's this change (but I
> > have _not_ tested it):
> >=20
> > commit b1898793777fe10a31c160bb8bc385d6eea640c6
> > Author: Juergen Gross <jgross@suse.com>
> > Date:   Wed Nov 23 12:45:23 2022 +0100
> >=20
> >      x86/boot: Skip realmode init code when running as Xen PV guest
> >      [ Upstream commit f1e525009493cbd569e7c8dd7d58157855f8658d ]
>=20
> Yes, you are right.
>=20
> Could you please test the attached patch? It is for upstream, but I think=
 it
> should apply to 6.1.3, too.

Yes, this works (you can take it as my T-by), thanks!

But, unrelated to this bug, it did get message like in https://www.mail-arc=
hive.com/xen-devel@lists.xenproject.org/msg107609.html
(WARNING: CPU: 1 PID: 0 at arch/x86/mm/tlb.c:523 switch_mm_irqs_off+0x230/0=
x4a0)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--a1z64RtYn87d7j8p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmPBYEMACgkQ24/THMrX
1yyepAgAgdsyrMMt7iaX4Kyw4pymNgdTRjfqKW6Zceoe/eAINqWrShQhy/d04HBc
5ilg1AIRDn1+yyUUjxc4aN1LHPy96QGomL/X8cCM7JapbTFS8NlBYW10PQmrgCLf
ylBbdv9BR9yOJxBA4RDjyGZvl1gTrn5bMPPM9vW3v3UUAiK2AQNwyIdlgSNNIaUK
pJU7g0aNqPNjpe1S0eZwetfhtDspLk6JOLovCxwLQCy9twkEoPbiGWP5wjuVDSjT
WJgGLXsg0/N5OgI+0Uj4EfKHYJrLMy3EANL37UeWm7HgvNtTkb4RGQvSKB9Irr4V
bhAQSwhvXH2IjLvAWXEq8Oll1ocAMQ==
=7ybj
-----END PGP SIGNATURE-----

--a1z64RtYn87d7j8p--

