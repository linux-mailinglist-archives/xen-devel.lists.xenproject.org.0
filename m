Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F18A6689CE
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 03:58:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476481.738675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGAGK-0006wX-3M; Fri, 13 Jan 2023 02:57:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476481.738675; Fri, 13 Jan 2023 02:57:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGAGK-0006tz-04; Fri, 13 Jan 2023 02:57:48 +0000
Received: by outflank-mailman (input) for mailman id 476481;
 Fri, 13 Jan 2023 02:57:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LVbI=5K=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pGAGI-0006tt-Gq
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 02:57:46 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c470ef4-92ee-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 03:57:44 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 0E4895C0126;
 Thu, 12 Jan 2023 21:57:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 12 Jan 2023 21:57:42 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jan 2023 21:57:40 -0500 (EST)
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
X-Inumbo-ID: 0c470ef4-92ee-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1673578662; x=1673665062; bh=rlS+RQUHqs
	IC3xC0I9xDTjyCMxue/C52cDH/kXBJLMA=; b=C+ElV/kndUUGybHtXj6FDOybbi
	8tkS4VoLc7k2v08A4l6p9OeozmKpI6dqtnmYQNx3xdALBt0Q6aCa5aYXqLiNo1e+
	mc8jq5mmRvDg/jJ3LiAG3G/3VK72sd1kjwl4nRALrQN7mo/hmKXkuzVdIIMPN8j4
	AaB28hv+kvaAo66eHtAn8LKAMLchSlx9dkpewe/ySeX3Su8BVqIEoUKrriJZGNwS
	3tZJHpgn4L2xICKg1koNqRMJBJWxtH31K0+xvr9k1zAnNaVH5+MNK1AKaEmB6B0r
	sz8R4GJU3ZXijqD9dNTxcuAO6ERBmPtD0+9S2Rj4NiHbOI3/ycOi3lweybhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673578662; x=
	1673665062; bh=rlS+RQUHqsIC3xC0I9xDTjyCMxue/C52cDH/kXBJLMA=; b=l
	tIjns746EPB75MWgq7jph9EOTuXM1Zp1v0RYKgtNcgV+hr8gjo3W3lzDexiyUZ48
	ukO8fEyplAh2Hhf/EIcMQN0FUVAWn7kXrbyephnLZsoPC8Gyl/E1b9qoSKPxhxNF
	cVTYo4a4ETi0PBELGfJW09zKTxeB8MnLdgdthwE5eJkP7pwmEOYOyLr8/QcFzd53
	mUVr+vvEFFh09pChiXR6C8KwqvJcr27KmlLcqVCb5UWeuZkIGwjhq105b0y7LQ6Q
	7P0u3dBPJqbW4rG3tXQoU417up4XUGBHdT1tHaOkSavKBxsXQYK8WjDu8Dm8KIYT
	EpHCqh62p/1Od+CaO1AfA==
X-ME-Sender: <xms:pcjAY4TrV4rbZavQ2GMAvIQwxFsHr_vHfpuIRsF-dcDMr7mmLsRbbA>
    <xme:pcjAY1z7rcJFpE9KZ84xwMRpeqUB_YxBenrL1HvAh2ZhRsAwybwPGxjsqC9uOHqg8
    evx5OsbG_GmUw>
X-ME-Received: <xmr:pcjAY10GGaxVpVPzsrXBElzKxiZgX1D2GKEOw4QyXl1eFsNRlbf5hbmu8W4xYKlw9CjbqMYe4oFAUVGCFuCMxKhnf7Mz4c8uwA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleejgdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfggtggusehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedttedtlefg
    leetfeejjefftefhjeffheeiheevvddvkedukefguedvudffleefieenucffohhmrghinh
    epkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomh
X-ME-Proxy: <xmx:pcjAY8Cv_orcabPmI9qc3Bdv6Zp_w_H41P7jnIsdJxZ1Z8sKOWfLVg>
    <xmx:pcjAYxgZm8Glhoi_vv1Kw36sFdlpbBQWLHbmknfBCNJmTuMqdyOr4A>
    <xmx:pcjAY4rbmzoxPNljZt3ZdOKaaQiDW04pisxhfq6ATDd4BnbdctPtwg>
    <xmx:psjAYxKy65CSBUn8UrRPHU-iJsG9x6sQqN9gL_9xHmTQ1pjX3y79XA>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 13 Jan 2023 03:57:37 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>
Cc: regressions@lists.linux.dev
Subject: S3 under Xen regression between 6.1.1 and 6.1.3
Message-ID: <Y8DIodWQGm99RA+E@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5xaRNTg0gQ8/F2e0"
Content-Disposition: inline


--5xaRNTg0gQ8/F2e0
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Jan 2023 03:57:37 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>
Cc: regressions@lists.linux.dev
Subject: S3 under Xen regression between 6.1.1 and 6.1.3

Hi,

6.1.3 as PV dom0 crashes when attempting to suspend. 6.1.1 works. The
crash:

    [  348.284004] PM: suspend entry (deep)
    [  348.289532] Filesystems sync: 0.005 seconds
    [  348.291545] Freezing user space processes ... (elapsed 0.000 seconds=
) done.
    [  348.292457] OOM killer disabled.
    [  348.292462] Freezing remaining freezable tasks ... (elapsed 0.104 se=
conds) done.
    [  348.396612] printk: Suspending console(s) (use no_console_suspend to=
 debug)
    [  348.749228] PM: suspend devices took 0.352 seconds
    [  348.769713] ACPI: EC: interrupt blocked
    [  348.816077] BUG: kernel NULL pointer dereference, address: 000000000=
000001c
    [  348.816080] #PF: supervisor read access in kernel mode
    [  348.816081] #PF: error_code(0x0000) - not-present page
    [  348.816083] PGD 0 P4D 0=20
    [  348.816086] Oops: 0000 [#1] PREEMPT SMP NOPTI
    [  348.816089] CPU: 0 PID: 6764 Comm: systemd-sleep Not tainted 6.1.3-1=
=2Efc32.qubes.x86_64 #1
    [  348.816092] Hardware name: Star Labs StarBook/StarBook, BIOS 8.01 07=
/03/2022
    [  348.816093] RIP: e030:acpi_get_wakeup_address+0xc/0x20
    [  348.816100] Code: 44 00 00 48 8b 05 04 a3 82 02 c3 cc cc cc cc cc cc=
 cc cc cc cc cc cc cc cc cc cc cc cc cc 0f 1f 44 00 00 48 8b 05 fc 9d 82 02=
 <8b> 40 1c c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 90 0f 1f
    [  348.816103] RSP: e02b:ffffc90042537d08 EFLAGS: 00010246
    [  348.816105] RAX: 0000000000000000 RBX: 0000000000000003 RCX: 20c49ba=
5e353f7cf
    [  348.816106] RDX: 000000000000cd19 RSI: 000000000002ee9a RDI: 002a051=
ed42d7694
    [  348.816108] RBP: 0000000000000003 R08: ffffc90042537ca0 R09: fffffff=
f82c5e468
    [  348.816110] R10: 0000000000007ff0 R11: 0000000000000000 R12: 0000000=
000000000
    [  348.816111] R13: fffffffffffffff2 R14: ffff88812206e6c0 R15: ffff888=
12206e6e0
    [  348.816121] FS:  00007cb49b01eb80(0000) GS:ffff888189400000(0000) kn=
lGS:0000000000000000
    [  348.816123] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
    [  348.816124] CR2: 000000000000001c CR3: 000000012231a000 CR4: 0000000=
000050660
    [  348.816131] Call Trace:
    [  348.816133]  <TASK>
    [  348.816134]  acpi_pm_prepare+0x1a/0x50
    [  348.816141]  suspend_enter+0x94/0x360
    [  348.816146]  suspend_devices_and_enter+0x198/0x2b0
    [  348.816150]  enter_state+0x18d/0x1f5
    [  348.816155]  pm_suspend.cold+0x20/0x6b
    [  348.816159]  state_store+0x27/0x60
    [  348.816163]  kernfs_fop_write_iter+0x125/0x1c0
    [  348.816169]  new_sync_write+0x105/0x190
    [  348.816176]  vfs_write+0x211/0x2a0
    [  348.816180]  ksys_write+0x67/0xe0
    [  348.816183]  do_syscall_64+0x59/0x90
    [  348.816188]  ? do_syscall_64+0x69/0x90
    [  348.816192]  ? exc_page_fault+0x76/0x170
    [  348.816195]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
    [  348.816200] RIP: 0033:0x7cb49c1412f7
    [  348.816203] Code: 0d 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f=
 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05=
 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
    [  348.816204] RSP: 002b:00007ffc125f63f8 EFLAGS: 00000246 ORIG_RAX: 00=
00000000000001
    [  348.816206] RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 00007cb=
49c1412f7
    [  348.816208] RDX: 0000000000000004 RSI: 00007ffc125f64e0 RDI: 0000000=
000000004
    [  348.816209] RBP: 00007ffc125f64e0 R08: 00005c83d772bca0 R09: 0000000=
00000000d
    [  348.816210] R10: 00005c83d7727eb0 R11: 0000000000000246 R12: 0000000=
000000004
    [  348.816211] R13: 00005c83d77272d0 R14: 0000000000000004 R15: 00007cb=
49c213700
    [  348.816213]  </TASK>
    [  348.816214] Modules linked in: loop vfat fat snd_hda_codec_hdmi snd_=
sof_pci_intel_tgl snd_sof_intel_hda_common soundwire_intel soundwire_generi=
c_allocation soundwire_cadence snd_sof_intel_hda snd_sof_pci snd_sof_xtensa=
_dsp snd_sof snd_sof_utils snd_soc_hdac_hda snd_hda_ext_core snd_soc_acpi_i=
ntel_match snd_soc_acpi soundwire_bus snd_hda_codec_realtek snd_hda_codec_g=
eneric ledtrig_audio snd_soc_core snd_compress ac97_bus snd_pcm_dmaengine s=
nd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi iTCO_wdt intel_pmc_bxt ee1=
004 iTCO_vendor_support intel_rapl_msr snd_hda_codec snd_hda_core snd_hwdep=
 snd_seq snd_seq_device iwlwifi snd_pcm pcspkr joydev processor_thermal_dev=
ice_pci_legacy processor_thermal_device snd_timer snd cfg80211 processor_th=
ermal_rfim i2c_i801 processor_thermal_mbox i2c_smbus idma64 rfkill processo=
r_thermal_rapl soundcore intel_rapl_common int340x_thermal_zone intel_soc_d=
ts_iosf igen6_edac intel_hid intel_pmc_core intel_scu_pltdrv sparse_keymap =
fuse xenfs ip_tables dm_thin_pool
    ic#2 Part1
    [  348.816259]  dm_persistent_data dm_bio_prison dm_crypt i915 crct10di=
f_pclmul crc32_pclmul crc32c_intel polyval_clmulni polyval_generic drm_budd=
y nvme video wmi drm_display_helper nvme_core xhci_pci xhci_pci_renesas gha=
sh_clmulni_intel hid_multitouch sha512_ssse3 serio_raw nvme_common cec xhci=
_hcd ttm i2c_hid_acpi i2c_hid pinctrl_tigerlake xen_acpi_processor xen_priv=
cmd xen_pciback xen_blkback xen_gntalloc xen_gntdev xen_evtchn uinput
    [  348.816281] CR2: 000000000000001c
    [  348.816283] ---[ end trace 0000000000000000 ]---
    [  348.867991] RIP: e030:acpi_get_wakeup_address+0xc/0x20
    [  348.867996] Code: 44 00 00 48 8b 05 04 a3 82 02 c3 cc cc cc cc cc cc=
 cc cc cc cc cc cc cc cc cc cc cc cc cc 0f 1f 44 00 00 48 8b 05 fc 9d 82 02=
 <8b> 40 1c c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 90 0f 1f
    [  348.867998] RSP: e02b:ffffc90042537d08 EFLAGS: 00010246
    [  348.867999] RAX: 0000000000000000 RBX: 0000000000000003 RCX: 20c49ba=
5e353f7cf
    [  348.868000] RDX: 000000000000cd19 RSI: 000000000002ee9a RDI: 002a051=
ed42d7694
    [  348.868001] RBP: 0000000000000003 R08: ffffc90042537ca0 R09: fffffff=
f82c5e468
    [  348.868001] R10: 0000000000007ff0 R11: 0000000000000000 R12: 0000000=
000000000
    [  348.868002] R13: fffffffffffffff2 R14: ffff88812206e6c0 R15: ffff888=
12206e6e0
    [  348.868008] FS:  00007cb49b01eb80(0000) GS:ffff888189400000(0000) kn=
lGS:0000000000000000
    [  348.868009] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
    [  348.868009] CR2: 000000000000001c CR3: 000000012231a000 CR4: 0000000=
000050660
    [  348.868014] Kernel panic - not syncing: Fatal exception
    [  348.868031] Kernel Offset: disabled

Looking at git log between those two versions, and the
acpi_get_wakeup_address() function, I suspect it's this change (but I
have _not_ tested it):

commit b1898793777fe10a31c160bb8bc385d6eea640c6
Author: Juergen Gross <jgross@suse.com>
Date:   Wed Nov 23 12:45:23 2022 +0100

    x86/boot: Skip realmode init code when running as Xen PV guest
   =20
    [ Upstream commit f1e525009493cbd569e7c8dd7d58157855f8658d ]
   =20
    When running as a Xen PV guest there is no need for setting up the
    realmode trampoline, as realmode isn't supported in this environment.
   =20
    Trying to setup the trampoline has been proven to be problematic in
    some cases, especially when trying to debug early boot problems with
    Xen requiring to keep the EFI boot-services memory mapped (some
    firmware variants seem to claim basically all memory below 1Mb for boot
    services).
   =20
    Introduce new x86_platform_ops operations for that purpose, which can
    be set to a NOP by the Xen PV specific kernel boot code.
   =20
      [ bp: s/call_init_real_mode/do_init_real_mode/ ]
   =20
    Fixes: 084ee1c641a0 ("x86, realmode: Relocator for realmode code")
    Suggested-by: H. Peter Anvin <hpa@zytor.com>
    Signed-off-by: Juergen Gross <jgross@suse.com>
    Signed-off-by: Borislav Petkov <bp@suse.de>
    Link: https://lore.kernel.org/r/20221123114523.3467-1-jgross@suse.com
    Signed-off-by: Sasha Levin <sashal@kernel.org>


# regzbot introduced v6.1.1..v6.1.3

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--5xaRNTg0gQ8/F2e0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmPAyKIACgkQ24/THMrX
1yxjsQf/W72vRWCEJuBqXmvxNSIdKZyzkRUf51j+IiWDY8g3j4abHSBvgzVe4trM
6KKhKa6yk3ThfRKe/vnHLx3932/DIi43vJEmSSOb26/De4ncspyUPK7IHgZsKaRd
hbUzf4b3XSNfaiQYVGABDScMf4+7715T2TfKtTPKMM1SYYMqY9Rgz1wszcnhsd02
TkSfdV1Hx6SvdrYdoNDjYuRhTp+u5gwcTl2G265NPqADE3IT62/GabkvSoPTfZ4w
jdoYhdmeBJwrx6g0M/gaiGTBHKPRn+I5RsFqYem13Cx5Vhk1BLBaBulCTo2faxWk
Rz+Yki0pER8kY09DKiibjifxxdDlQA==
=i4hv
-----END PGP SIGNATURE-----

--5xaRNTg0gQ8/F2e0--

