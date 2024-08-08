Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1D494BB12
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 12:32:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773881.1184315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc0Ql-0007CH-Oi; Thu, 08 Aug 2024 10:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773881.1184315; Thu, 08 Aug 2024 10:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc0Ql-0007Ap-M0; Thu, 08 Aug 2024 10:31:39 +0000
Received: by outflank-mailman (input) for mailman id 773881;
 Thu, 08 Aug 2024 10:31:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6I4s=PH=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sc0Qj-0007Aj-OR
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 10:31:38 +0000
Received: from fhigh2-smtp.messagingengine.com
 (fhigh2-smtp.messagingengine.com [103.168.172.153])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61b583d2-5571-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 12:31:34 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id A269C1146C2A;
 Thu,  8 Aug 2024 06:31:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 08 Aug 2024 06:31:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Aug 2024 06:31:31 -0400 (EDT)
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
X-Inumbo-ID: 61b583d2-5571-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1723113092; x=1723199492; bh=MX
	44/EWhOUxV2E2PRqPcKlXwkRrpynBXksdVpdffh/o=; b=Sfzg6hgXJ1wKHB9P/L
	+Fel/YzCpIfhYgYm/2ItWvfwPJRzbHti4ZIUPmVBCvaZYLlnjPW78aHFUpWsZHbT
	AQFOU/RWjxM6F6StxaKYPoC1+4vrR0qLmazfcnUbwHfjwN3RwJEM5bEgs5ZnNm0H
	xTJFKOoSAFqgkGVH5ovD73lTbj5iD9eL4Ic0rzxqBzRK5VdKcoSn6rliFrmiELtr
	AKBpksKgFzOvPgG+q6TpguvENTi0KzaZN4dGXsTVxAgduGWkBUy2GiftfpIUAaRZ
	jhfAxdGXdFukphepXXQegqdObXN2T2/bIaDGSLw8tyRGwPzO3SC32ECMMAO9yqBk
	QzMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1723113092; x=1723199492; bh=MX44/EWhOUxV2E2PRqPcKlXwkRrpynBXksd
	Vpdffh/o=; b=k+p26n/Y3/RUqrhpgNcikgQf5f/0GmeD7IPqTmvi+EofKyVm734
	TjADUpCWWvFZ4nnMnivCcpEeT0oo2gaG4HZjhUrU1v1aXSh8LJAV6Sw/OPzUd/08
	2D9isZCEol7pojvle//jXE8IiuHe2WfwSbfpnpgDepAzvyuWlegADrCXODsK6nsy
	pELW6o4IxH/nlkux0dirrP9xlfY7N+3Nul0CCHZCfObUEALteAfMORVf4vSn9ZLN
	dgjLWzzsy4RZIiklUQcsw+fU4oUtAqDLcB1/Pot6UEXYJN4HPYjqC04bLsWQ4Xeo
	CIkzNZm5MyjDY+Oao8IOZ+dTG6LZgtiAlQg==
X-ME-Sender: <xms:hJ60ZgECmiSryqumJyj4CpKH6jbimkWZO4XJJrSfAK2Ywcq9QapKgQ>
    <xme:hJ60ZpXcQfLAkcBNYklqZ206ZhST5MegOG5jP1QeTsVcSc3SE2PBvuVbXB1yT2AF3
    XOn4KG7d2Aang>
X-ME-Received: <xmr:hJ60ZqIh9djv6u8XbYmWzfoQ-HKLiFvPwxIpDnkdpKZ9Uy3e1OnJ-IA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrledvgddvlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfggtggusehgtderredttdejnecuhfhr
    ohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmh
    grrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrght
    thgvrhhnpeehgfeuvdejkeeikeeludelteevfeegffegteefffetheetffduudejuedugf
    dvteenucffohhmrghinhepqhhusggvshdqohhsrdhorhhgpdhgihhthhhusgdrtghomhen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmh
    grrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphht
    thhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlse
    hlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehjghhrohhsshes
    shhushgvrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepohhlvghkshgrnhgurhgpthihshhhtghhvghnkhhosegvphgr
    mhdrtghomhdprhgtphhtthhopehrvghgrhgvshhsihhonhhssehlihhsthhsrdhlihhnuh
    igrdguvghv
X-ME-Proxy: <xmx:hJ60ZiFK0l7BtgmVhziBoIOkfp6sZckUZStschxVBC9zR2ytrNAj9w>
    <xmx:hJ60ZmX60n78_jvGaZmsCaYL6EymfslYmknDzO1CJplaPCk3sIOfRA>
    <xmx:hJ60ZlP3zXhYPP-iRvLbxHrdS2cOpZ6khrTYzNQBmp4UG7D2WJlYAw>
    <xmx:hJ60Zt1xCOmu9eXBsSpXeM9hTXsFX4q4g77MOeNupKAK9lXM8tesBg>
    <xmx:hJ60Zkx_sVU4AhNMumtRm3FetoBMlX98_yXouWAjz0O3_EO9Rt-3XwHY>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 8 Aug 2024 12:31:13 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	regressions@lists.linux.dev
Subject: [REGRESSION] kernel NULL pointer dereference in xen-balloon with mem
 hotplug
Message-ID: <ZrSecpuTN9zgtqYu@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kt7u1tiUe8A/rt3t"
Content-Disposition: inline


--kt7u1tiUe8A/rt3t
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 8 Aug 2024 12:31:13 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	regressions@lists.linux.dev
Subject: [REGRESSION] kernel NULL pointer dereference in xen-balloon with mem
 hotplug

Hi,

When testing Linux 6.11-rc2, I've got the crash like below. It's a PVH
guest started with 400MB memory, and then extended via mem hotplug (I
don't know to what exact size it was at this time, but up to 4GB), it
was quite early in the domU boot process, I suspect it could be the
first mem hotplug even happening there.
Unfortunately I don't have reliable reproducer, it crashed only once
over several test runs. I don't remember seeing such crash before, so it
looks like a regression in 6.11. I'm not sure if that matters, but it's
on ADL, very similar to the qubes-hw2 gitlab runner.

The crash message:

    [    3.606538] BUG: kernel NULL pointer dereference, address: 000000000=
0000000
    [    3.606556] #PF: supervisor read access in kernel mode
    [    3.606568] #PF: error_code(0x0000) - not-present page
    [    3.606580] PGD 0 P4D 0=20
    [    3.606590] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
    [    3.606603] CPU: 1 UID: 0 PID: 45 Comm: xen-balloon Not tainted 6.11=
=2E0-0.rc2.1.qubes.1.fc37.x86_64 #1
    [    3.606623] RIP: 0010:phys_pmd_init+0x96/0x500
    [    3.606636] Code: 89 ed 48 c1 e8 12 48 81 e7 00 00 e0 ff 25 f8 0f 00=
 00 4c 8d af 00 00 20 00 4c 8d 24 03 48 8b 1c 24 4c 39 fd 0f 83 89 02 00 00=
 <49> 8b 0c 24 48 f7 c1 9f ff ff ff 0f 84 b6 01 00 00 48 8b 05 d2 99
    [    3.606680] RSP: 0018:ffffc90000987b90 EFLAGS: 00010287
    [    3.606695] RAX: 0000000000000000 RBX: 8000000000000163 RCX: 0000000=
000000004
    [    3.606713] RDX: 0000000090000000 RSI: 0000000080000000 RDI: 0000000=
080000000
    [    3.606729] RBP: 0000000080000000 R08: 8000000000000163 R09: 0000000=
000000001
    [    3.606748] R10: 0000000000000000 R11: 0000000000ffff0a R12: 0000000=
000000000
    [    3.606766] R13: 0000000080200000 R14: 0000000000000000 R15: 0000000=
090000000
    [    3.606784] FS:  0000000000000000(0000) GS:ffff888018500000(0000) kn=
lGS:0000000000000000
    [    3.606802] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    [    3.606819] CR2: 0000000000000000 CR3: 00000000107bc000 CR4: 0000000=
000750ef0
    [    3.606840] PKRU: 55555554
    [    3.606847] Call Trace:
    [    3.606854]  <TASK>
    [    3.606862]  ? __die+0x23/0x70
    [    3.606876]  ? page_fault_oops+0x95/0x190
    [    3.606887]  ? exc_page_fault+0x76/0x190
    [    3.606900]  ? asm_exc_page_fault+0x26/0x30
    [    3.606917]  ? phys_pmd_init+0x96/0x500
    [    3.606927]  phys_pud_init+0xe8/0x4f0
    [    3.606940]  __kernel_physical_mapping_init+0x1d5/0x380
    [    3.606955]  ? synchronize_rcu_normal.part.0+0x45/0x70
    [    3.606971]  init_memory_mapping+0xb0/0x1f0
    [    3.606983]  arch_add_memory+0x2f/0x50
    [    3.606997]  add_memory_resource+0xff/0x2c0
    [    3.607008]  reserve_additional_memory+0x162/0x1d0
    [    3.607026]  balloon_thread+0xe4/0x490
    [    3.607041]  ? __pfx_autoremove_wake_function+0x10/0x10
    [    3.607060]  ? __pfx_balloon_thread+0x10/0x10
    [    3.607076]  kthread+0xcf/0x100
    [    3.607090]  ? __pfx_kthread+0x10/0x10
    [    3.607101]  ret_from_fork+0x31/0x50
    [    3.607112]  ? __pfx_kthread+0x10/0x10
    [    3.607123]  ret_from_fork_asm+0x1a/0x30
    [    3.607135]  </TASK>
    [    3.607141] Modules linked in: xenfs binfmt_misc nft_reject_inet nf_=
reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nf_conntrack nf_defrag_ipv6 nf=
_defrag_ipv4 nf_tables nfnetlink intel_rapl_msr intel_rapl_common intel_unc=
ore_frequency_common crct10dif_pclmul crc32_pclmul crc32c_intel polyval_clm=
ulni polyval_generic ghash_clmulni_intel sha512_ssse3 sha256_ssse3 sha1_sss=
e3 xen_netfront xen_privcmd xen_gntdev xen_gntalloc xen_blkback xen_evtchn =
loop fuse ip_tables overlay xen_blkfront
    [    3.607266] CR2: 0000000000000000
    [    3.607277] ---[ end trace 0000000000000000 ]---
    [    3.607291] RIP: 0010:phys_pmd_init+0x96/0x500
    [    3.607307] Code: 89 ed 48 c1 e8 12 48 81 e7 00 00 e0 ff 25 f8 0f 00=
 00 4c 8d af 00 00 20 00 4c 8d 24 03 48 8b 1c 24 4c 39 fd 0f 83 89 02 00 00=
 <49> 8b 0c 24 48 f7 c1 9f ff ff ff 0f 84 b6 01 00 00 48 8b 05 d2 99
    [    3.607356] RSP: 0018:ffffc90000987b90 EFLAGS: 00010287
    [    3.607371] RAX: 0000000000000000 RBX: 8000000000000163 RCX: 0000000=
000000004
    [    3.607389] RDX: 0000000090000000 RSI: 0000000080000000 RDI: 0000000=
080000000
    [    3.607406] RBP: 0000000080000000 R08: 8000000000000163 R09: 0000000=
000000001
    [    3.607428] R10: 0000000000000000 R11: 0000000000ffff0a R12: 0000000=
000000000
    [    3.607449] R13: 0000000080200000 R14: 0000000000000000 R15: 0000000=
090000000
    [    3.607469] FS:  0000000000000000(0000) GS:ffff888018500000(0000) kn=
lGS:0000000000000000
    [    3.607488] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    [    3.607504] CR2: 0000000000000000 CR3: 00000000107bc000 CR4: 0000000=
000750ef0
    [    3.607525] PKRU: 55555554
    [    3.607533] Kernel panic - not syncing: Fatal exception
    [    3.607599] Kernel Offset: disabled

Full domU log:
https://openqa.qubes-os.org/tests/108883/file/system_tests-qubes.tests.inte=
g.vm_qrexec_gui.TC_20_NonAudio_whonix-workstation-17.test_105.guest-test-in=
st-vm2.log
Other logs, including dom0 and Xen messages:
https://openqa.qubes-os.org/tests/108883#downloads

Kernel config is build from merging
https://github.com/QubesOS/qubes-linux-kernel/blob/005ae1ac3819d957379e48fb=
2cfd33f511a47275/config-base
with
https://github.com/QubesOS/qubes-linux-kernel/blob/005ae1ac3819d957379e48fb=
2cfd33f511a47275/config-qubes
(options set in the latter takes precedence)
Especially, it has:
CONFIG_XEN_BALLOON_MEMORY_HOTPLUG=3Dy
CONFIG_XEN_UNPOPULATED_ALLOC=3Dy

#regzbot introduced: v6.10..v6.11-rc2

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--kt7u1tiUe8A/rt3t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAma0nnIACgkQ24/THMrX
1yyw4wf/VHGBECVm870HmY0iwiXw0Wjf7qkIVuUbdK4O/z3R5o8tcv1MnkMM8wQG
otXtOP6C3QN5GP0iILNlObzmsrtFpNXFDoDi8fWZkHJ2nOHo3tr9iGaOzlB+L2KM
XpAT5n9JFSHAz8xY/DbU81m2CGGMvvRXTq9o6d/B5wO9lYbqOSN5yjPZHCifsHb9
Vsnf3c0hzk2qBCzb5wq806kOit37+8RHjYy0vPQVjPwaZmTwT6NRxvunDmTjCXz2
H2F93zXnRaC/6KGICTFJCjOYOYyLGhXUbYO+EOuVys6XDHQFO1YXa5Ob/1ylFVFg
CI79rS8pTHkv9Il8KfiwnNc8ovwEAQ==
=ZqgP
-----END PGP SIGNATURE-----

--kt7u1tiUe8A/rt3t--

