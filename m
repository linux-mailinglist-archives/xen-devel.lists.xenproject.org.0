Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD5E7FE6D1
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 03:34:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644355.1005206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Wss-00048L-JO; Thu, 30 Nov 2023 02:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644355.1005206; Thu, 30 Nov 2023 02:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Wss-00045z-Gb; Thu, 30 Nov 2023 02:34:34 +0000
Received: by outflank-mailman (input) for mailman id 644355;
 Thu, 30 Nov 2023 02:34:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q+jP=HL=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1r8Wsq-00045t-Qw
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 02:34:33 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcd4cfd9-8f28-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 03:34:31 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 3E61A5C027C
 for <xen-devel@lists.xenproject.org>; Wed, 29 Nov 2023 21:34:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 29 Nov 2023 21:34:29 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Wed, 29 Nov 2023 21:34:28 -0500 (EST)
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
X-Inumbo-ID: fcd4cfd9-8f28-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1701311669; x=1701398069; bh=hk
	+FTahq6rokPyMruZvxcrKBpvVM8Z+zIc3d878ZT0g=; b=AZOwW1df43K7tt942I
	2xetEAEkn2TDTXgmBy2a3/ZPiyyJmNc84oZLiTSbl1tNI+FqB5l1D/Dm7uCHiETO
	29W0M6ANsLfnj+lc7q2qsn2n1iahQNsU431t+aAjti3Mva1BV+z+htm/tuz8EiB2
	+ixvTzT4VNYCPALnBDXlvFUFRWrbfsGPZslZUGEExorQ0KFyKHUWjqW0aXqgT0RX
	3I8WZzEKoIyvy3f33nlz+5GZrWrZGi6CICMecqNG0csyelQtdd3WIyOsePf5UkCL
	7VRM+yv1JovAcr/4TLYIhd/gwac9yEcyg/NhUiBRJDWI/xjmzaIHMcWYIHcLtcGg
	AJIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1701311669; x=1701398069; bh=hk+FTahq6rokPyMruZvxcrKBpvVM8Z+zIc3
	d878ZT0g=; b=UjSUUMtuqUsJpEbseI2i/pakU04m351Hfpq3YqKg/R4xMqzuvdP
	/dZowb7TG7UA9wLwDPaff6/Zrf70woQwJ/jHXJOhJS1pPBrhcQU83N4FsWlDvvxD
	2YAs2foR9f5ly+dz1cj6nltcWnTOfmbuIS+/mh+tyNbQarzhsWKPRoXTm4OkVJ68
	AItGrBIYVbQWXy8DZoH2yu6nNRjC5X2w0QzPvFVnWsAKyrYPHHnBGInj7Kx6Bt3G
	h4QNMuV+EVWBZZoIlfgJVsA5qLfp4rnZiijJS2tcVXezWJx66A8s/Feqg8fABe1M
	3eqAinTrQYrnfPxyDp72n9km245UnfWedbA==
X-ME-Sender: <xms:tfRnZXUOznajXcl0c_FU3POETGd9PyClBrMynbFrAoldt-zbGnRWfQ>
    <xme:tfRnZflhi8hmlK7mQSkn3c3ayXgPIFR1nxAKWn0KbO_SkGJ-iDH67mfBhuMGltbV2
    T06fyT93oGW9g>
X-ME-Received: <xmr:tfRnZTbFStQO4Fle1d6TmB906yljAly-LWjyJAJcEZApzyoIMkkUBe_5-gdtLSVNo6p-idGxZeRn-r3V3zoIQbziNQA4hOZIqQI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeiiedggeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
    dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
    uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnhepleefveeugfeikeeikeehteeuvdfggedvvdelheejkeeiteeh
    uedtgffgvefgtdetnecuffhomhgrihhnpehophgvnhhsuhhsvgdrohhrghdpqhhusggvsh
    dqohhsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:tfRnZSXor3fAksL_OKgLWCmorT10jhLbzxzH2asVW6lMdVz3fVmuLg>
    <xmx:tfRnZRna1lTXuABbRSJsWROPF1zjHlf7JRE-TAE3eoaIhUDMUdtlvA>
    <xmx:tfRnZffuX2WWWCbYOmhMDggr4L2GRSsDArTouchq4VL-jgh85IbOag>
    <xmx:tfRnZdzyw5mWV9qKETO4auZt2tnIM7fGtq6gnIDK0Ti9k3v3VS2mSg>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 30 Nov 2023 03:34:24 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Linux 6.7-rc1+: WARNING at drivers/xen/evtchn.c:167 evtchn_interrupt
Message-ID: <ZWf0sWey05VnpH7X@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7k85XbRgLXnFXML5"
Content-Disposition: inline


--7k85XbRgLXnFXML5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Nov 2023 03:34:24 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Linux 6.7-rc1+: WARNING at drivers/xen/evtchn.c:167 evtchn_interrupt

Hi,

While testing 6.7-rc3 on Qubes OS I found several warning like in the
subject in dom0 log. I see them when running 6.7-rc1 too. I'm not sure
what exactly triggers the issue, but my guess would be unbinding an
event channel from userspace (closing vchan connection).

Specific message:

[   83.973377] ------------[ cut here ]------------
[   83.975523] Interrupt for port 77, but apparently not enabled; per-user =
00000000a0e9f1d1
[   83.979083] WARNING: CPU: 1 PID: 2432 at drivers/xen/evtchn.c:167 evtchn=
_interrupt+0xb6/0xc0 [xen_evtchn]
[   83.982869] Modules linked in: joydev intel_rapl_msr intel_rapl_common s=
nd_hda_codec_generic ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel=
_sdw_acpi ppdev snd_hda_codec snd_hda_core snd_hwdep snd_seq snd_seq_device=
 snd_pcm parport_pc parport pcspkr snd_timer snd e1000e i2c_piix4 soundcore=
 fuse loop xenfs dm_thin_pool dm_persistent_data dm_bio_prison crct10dif_pc=
lmul crc32_pclmul crc32c_intel polyval_clmulni polyval_generic ghash_clmuln=
i_intel sha512_ssse3 sha256_ssse3 sha1_ssse3 virtio_scsi bochs serio_raw dr=
m_vram_helper xhci_pci xhci_pci_renesas floppy drm_ttm_helper xhci_hcd ttm =
ata_generic pata_acpi qemu_fw_cfg virtio_console xen_privcmd xen_pciback xe=
n_blkback xen_gntalloc xen_gntdev xen_evtchn scsi_dh_rdac scsi_dh_emc scsi_=
dh_alua uinput dm_multipath
[   84.019753] CPU: 1 PID: 2432 Comm: qrexec-client Not tainted 6.7.0-0.rc3=
=2E1.qubes.1.fc37.x86_64 #1
[   84.027045] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
rel-1.16.2-3-gd478f380-rebuilt.opensuse.org 04/01/2014
[   84.033828] RIP: e030:evtchn_interrupt+0xb6/0xc0 [xen_evtchn]
[   84.037814] Code: ba 01 00 00 00 be 1d 00 00 00 48 8d bb 88 00 00 00 e8 =
ce 93 27 c1 eb b4 8b 76 20 48 89 da 48 c7 c7 70 52 21 c0 e8 0a 5c f0 c0 <0f=
> 0b e9 61 ff ff ff 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90
[   84.048932] RSP: e02b:ffffc90041e7fd60 EFLAGS: 00010082
[   84.051252] RAX: 0000000000000000 RBX: ffff888104fc9a80 RCX: 00000000000=
00027
[   84.054569] RDX: ffff88813ff21608 RSI: 0000000000000001 RDI: ffff88813ff=
21600
[   84.057606] RBP: ffff88810522a280 R08: 0000000000000000 R09: ffffc90041e=
7fbf8
[   84.060864] R10: 0000000000000003 R11: ffffffff82f460c8 R12: ffff888105d=
5b6a4
[   84.064043] R13: ffff888105d5b760 R14: ffff88810522a280 R15: ffff888105d=
5b600
[   84.066598] FS:  000075ee3eb8ed40(0000) GS:ffff88813ff00000(0000) knlGS:=
0000000000000000
[   84.069251] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[   84.071293] CR2: 00007b86fa0f0f5c CR3: 0000000106e18000 CR4: 00000000000=
40660
[   84.073911] Call Trace:
[   84.074746]  <TASK>
[   84.075471]  ? evtchn_interrupt+0xb6/0xc0 [xen_evtchn]
[   84.077448]  ? __warn+0x81/0x130
[   84.078671]  ? evtchn_interrupt+0xb6/0xc0 [xen_evtchn]
[   84.080507]  ? report_bug+0x171/0x1a0
[   84.081830]  ? prb_read_valid+0x1b/0x30
[   84.083682]  ? handle_bug+0x41/0x70
[   84.084952]  ? exc_invalid_op+0x17/0x70
[   84.086314]  ? asm_exc_invalid_op+0x1a/0x20
[   84.088520]  ? evtchn_interrupt+0xb6/0xc0 [xen_evtchn]
[   84.090300]  __free_irq+0x114/0x2b0
[   84.091478]  free_irq+0x32/0x70
[   84.092522]  unbind_from_irqhandler+0x31/0xb0
[   84.094035]  evtchn_release+0x2b/0xa0 [xen_evtchn]
[   84.095643]  __fput+0x9a/0x2c0
[   84.096734]  __x64_sys_close+0x3d/0x80
[   84.097995]  do_syscall_64+0x63/0xe0
[   84.099188]  ? __vm_munmap+0xbb/0x150
[   84.100431]  ? syscall_exit_work+0x103/0x130
[   84.101854]  ? syscall_exit_to_user_mode+0x2b/0x40
[   84.103509]  ? do_syscall_64+0x6f/0xe0
[   84.104757]  ? syscall_exit_to_user_mode+0x2b/0x40
[   84.106350]  ? do_syscall_64+0x6f/0xe0
[   84.107587]  ? exit_to_user_mode_prepare+0xbc/0xd0
[   84.109180]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
[   84.110863] RIP: 0033:0x75ee3ed15a0a
[   84.111999] Code: 00 00 0f 05 48 3d 00 f0 ff ff 77 44 c3 0f 1f 00 48 83 =
ec 18 89 7c 24 0c e8 33 bc f8 ff 8b 7c 24 0c 89 c2 b8 03 00 00 00 0f 05 <48=
> 3d 00 f0 ff ff 77 36 89 d7 89 44 24 0c e8 93 bc f8 ff 8b 44 24
[   84.118267] RSP: 002b:00007ffff0ad0f70 EFLAGS: 00000293 ORIG_RAX: 000000=
0000000003
[   84.120756] RAX: ffffffffffffffda RBX: 000055d3d8f70970 RCX: 000075ee3ed=
15a0a
[   84.123675] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000000=
0000f
[   84.126012] RBP: 0000000000000000 R08: 0000000000000000 R09: 00000000000=
00000
[   84.128366] R10: 000075ee3ec31468 R11: 0000000000000293 R12: 00000000000=
00000
[   84.130699] R13: 0000000000000000 R14: 00007ffff0ad2eaa R15: 000055d3d8f=
6f2a0
[   84.133050]  </TASK>
[   84.133810] ---[ end trace 0000000000000000 ]---

Full log: https://openqa.qubes-os.org/tests/86647/logfile?filename=3Dserial=
0.txt

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--7k85XbRgLXnFXML5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmVn9LEACgkQ24/THMrX
1yzVuggAmbq/80nJhV1ul5r64abCsij9Qq+XUIp9hfvJmpCxOQMxiv/C0l3KiiWU
uNBFjAto2apSODV1rBNa6WhW4ErdtpfCG2cf/XOIzabJ/9AnB0EZgox8ezfc/n1/
h2pjHTSp+xum2LCtqa2/g93tefRNpxQ5N3aluoi4fN65H5h+0APhHzrBRxH1Y+cx
wSk9GfT3We4bAGwBU43j6bTmBbeaBYawKvAYCVixWKfNuS5mJqhlP5xToLJvov/T
R9f5G9Jqn2SUkzMqh/LsuFeBe2474Fl7HGSoElH27xV0nfIAZC9ORBVfY1DXIe3D
yD94soKhDqVo6g01aVKUYrCpKkHo7Q==
=bq4G
-----END PGP SIGNATURE-----

--7k85XbRgLXnFXML5--

