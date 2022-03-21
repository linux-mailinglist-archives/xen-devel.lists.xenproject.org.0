Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8344E32A2
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 23:27:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293227.498080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWQU3-0000v8-Ux; Mon, 21 Mar 2022 22:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293227.498080; Mon, 21 Mar 2022 22:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWQU3-0000sJ-Qz; Mon, 21 Mar 2022 22:26:39 +0000
Received: by outflank-mailman (input) for mailman id 293227;
 Mon, 21 Mar 2022 22:26:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N4tx=UA=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nWQU2-0000sD-HM
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 22:26:38 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7819e94-a965-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 23:26:36 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 040E23200A16;
 Mon, 21 Mar 2022 18:26:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 21 Mar 2022 18:26:34 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Mar 2022 18:26:32 -0400 (EDT)
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
X-Inumbo-ID: f7819e94-a965-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=KcMTqV0C4yKLXV4AELoaumdX8O4rpz8M8oTd2bQmY
	4k=; b=JQHDNU/dW13ncNNN7ZqZJw4WbjClESgU/FxxusGR3vjB4tCIvx5EGdKtd
	AF7ZUeL4+jVLuzpNPU1z+IEqTpHx8ZVQnbx1HkDLBWQzfAt6i8VWUEgaj9PSnVPu
	DunFPKwdm8K8UuVBZtAo24LE/f7OL4zZyKjz+gdlBI27WiMQct5zucqRFEn4QusR
	87McEk52duHugueBk8gXZuEz3uTooCBBgfomWjkmigh4dpj+N7SFeD3za7L+MQor
	G57yNdIxKrtPSupHTVrOe1dL7fuGset1XHLdjBB2HDY27YY+Nzxu6sC0r88eHAST
	zYj+4Jo+nd2ERNgQrB0BkC3UHClnw==
X-ME-Sender: <xms:mfs4YsHVvhsbVYaiL_RUf_dtcTSqh2u2MlA28z_JFlST7dcg2sCoUQ>
    <xme:mfs4YlWFLviS-dvEAKj2OvzyCrecQ8Mv5HMF25-xyYAGoZ-3LkMfQE_XWhbS3UZLd
    KBoiELz_P27QQ>
X-ME-Received: <xmr:mfs4YmJ7VQ97sPpKBE4iKB-KbBDQafQ2DJMbSajibB8CMV_I6ROhEDXGky6j2waKD_THotYB3fxWk1aACVcUPl1Sppqg5ZBeHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegfedgudeiudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkgggtugesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptddugfet
    udevudeiveevgfetueejlefggffghffhhfehtdfffeefgfduueegfefhnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:mfs4YuEAe1MvOAGgwzoZluA-Slr7qlHN2frKJo18WTpq3sMeuzA7dw>
    <xmx:mfs4YiVK2TeSJdgBM6zYMwhId8nxFjt_76USd3q1Brvih8XUL_JkOQ>
    <xmx:mfs4YhNsJPE8DKbKUKr_zQH_D3I0IsbL-vqs1BL630Ey_6683C5fCQ>
    <xmx:mfs4YtAt3GIi_zjN42I225OPCN_fVE906LQrM0i7Dcb0DYauQx5j_Q>
Date: Mon, 21 Mar 2022 23:26:30 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
Subject: "BUG: using smp_processor_id() in preemptible" on resume from S3
Message-ID: <Yjj7liZrbRUXXrvi@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C94NijKclWDAxEp4"
Content-Disposition: inline


--C94NijKclWDAxEp4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Mar 2022 23:26:30 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
Subject: "BUG: using smp_processor_id() in preemptible" on resume from S3

Hi,

After updating from 5.14.15 dom0 kernel to 5.16.13 I started getting
this on resume from S3:

[   88.082751] ACPI: PM: Low-level resume complete
[   88.087933] ACPI: EC: EC started
[   88.091464] ACPI: PM: Restoring platform NVS memory
[   88.097166] xen_acpi_processor: Uploading Xen processor PM info
[   88.103850] Enabling non-boot CPUs ...
[   88.108128] installing Xen timer for CPU 1
[   88.112763] BUG: using smp_processor_id() in preemptible [00000000] code=
: systemd-sleep/7138
[   88.122256] caller is is_xen_pmu+0x12/0x30
[   88.126937] CPU: 0 PID: 7138 Comm: systemd-sleep Tainted: G        W    =
     5.16.13-2.fc32.qubes.x86_64 #1
[   88.137939] Hardware name: Star Labs StarBook/StarBook, BIOS 7.97 03/21/=
2022
[   88.145930] Call Trace:
[   88.148757]  <TASK>
[   88.151193]  dump_stack_lvl+0x48/0x5e
[   88.155381]  check_preemption_disabled+0xde/0xe0
[   88.160641]  is_xen_pmu+0x12/0x30
[   88.164441]  xen_smp_intr_init_pv+0x75/0x100
[   88.169311]  ? xen_read_cr0+0x20/0x20
[   88.173502]  xen_cpu_up_prepare_pv+0x3e/0x90
[   88.178374]  cpuhp_invoke_callback+0x2b8/0x460
[   88.183440]  ? _raw_spin_unlock_irqrestore+0x25/0x40
[   88.189093]  cpuhp_up_callbacks+0x4b/0x170
[   88.193769]  _cpu_up+0xba/0x140
[   88.197374]  thaw_secondary_cpus.cold+0x50/0xaa
[   88.202538]  suspend_enter+0x11e/0x3b0
[   88.206825]  suspend_devices_and_enter+0x165/0x270
[   88.212281]  enter_state+0x125/0x176
[   88.216372]  pm_suspend.cold+0x20/0x6b
[   88.220658]  state_store+0x27/0x50
[   88.224557]  kernfs_fop_write_iter+0x121/0x1b0
[   88.229621]  new_sync_write+0x159/0x1f0
[   88.234006]  vfs_write+0x20d/0x2a0
[   88.237904]  ksys_write+0x67/0xe0
[   88.241703]  do_syscall_64+0x38/0x90
[   88.245797]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[   88.251544] RIP: 0033:0x7eae453da2f7
[   88.255637] Code: 0d 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f =
00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48=
> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
[   88.276779] RSP: 002b:00007ffcbc7d05e8 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000001
[   88.285353] RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 00007eae453=
da2f7
[   88.293438] RDX: 0000000000000004 RSI: 00007ffcbc7d06d0 RDI: 00000000000=
00004
[   88.301525] RBP: 00007ffcbc7d06d0 R08: 00005be912db7c00 R09: 00000000000=
0000d
[   88.309613] R10: 00005be912db3e10 R11: 0000000000000246 R12: 00000000000=
00004
[   88.317699] R13: 00005be912db32d0 R14: 0000000000000004 R15: 00007eae454=
ac700
[   88.325787]  </TASK>
[   88.328711] cpu 1 spinlock event irq 131
[   88.333188] ACPI: \_SB_.CP01: Found 3 idle states
[   88.338833] CPU1 is up

and so on for all CPUs.=20

In recent changes I see e25a8d959992 "x86/Xen: streamline (and fix) PV
CPU enumeration", which was backported to 5.16.11, although that's just
a hunch.

Any ideas? If necessary, I can run bisect to find specific commit, but I
hope the above message gives enough hints.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--C94NijKclWDAxEp4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmI4+5YACgkQ24/THMrX
1yzvGwf/XRCB9CvAfT2kp/jm2xz5uQ37xawq10M1o+16Wvt1i5CEdeWaB0hC5Fgi
tXbBqu+JMThDUp9Xv/wmb0/Dwu43bvzXOjqyaP4iRF6zZklebXsv369EuSPkpIME
lJuV070chBRIo5k4AEHmuFCHI1oQ2FSx2MyIEqMuQxHY/mkt/hb2awO+J3Tjm3ZL
ihgmhSWRGr6+kAML4Ih0SZIi8C5ka+lTcV9dKgoFE+txpOdsT63ojpTFjMEGJoRC
ZFKiCbr8PAtQOFrl7g1vgI5+bA5lJsJc3ZgXogAKntxCQoeDq5pLZF/Ua2ZX4kw0
EYFOWKkjZKh815lRxxVapEde1VwjXw==
=eezW
-----END PGP SIGNATURE-----

--C94NijKclWDAxEp4--

