Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAzQOQuV+Gn0wgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 398154BD24E
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:46:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299767.1574317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgE-0001bW-L4; Mon, 04 May 2026 12:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299767.1574317; Mon, 04 May 2026 12:45:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsgE-0001YX-HL; Mon, 04 May 2026 12:45:46 +0000
Received: by outflank-mailman (input) for mailman id 1299767;
 Mon, 04 May 2026 12:45:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wJsgC-0001YK-GY
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 12:45:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJsgB-002Q5C-Dt
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:45:43 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f894f6-2eae-0a2a0a5409dd-0a2a45069204-6
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:45:43 +0200
Received: from [202.12.124.154] (helo=fhigh-b3-smtp.messagingengine.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69f894f5-7371-0a2a45060019-ca0c7c9a8653-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:45:42 +0200
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 5E80E7A0088;
 Mon,  4 May 2026 08:45:41 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Mon, 04 May 2026 08:45:41 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 May 2026 08:45:39 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:Message-ID:MIME-Version:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1777898741; x=1777985141; bh=7iadlLD7o7T5q9oaPaN3Fuvzh8+f85PP
	/NJE+PPPmb8=; b=eoJL885QK7PYjTCxK/YqPr+jDf092UDw7xOjdXwqCmOTrKhZ
	OtKUGa0e8GtMNypY1LqKqW81X+pb27tE2fmDJWiZ8Jdb/GHoIxUFUxYR6B/oJZYl
	l95za0rf+qOQrVVJgnNJ64F8NOhX7Isd5/IO5tMeuXT7ih+qYlTr9A0Xly46LyYu
	yAl4NamYb9m6owp1ce72ce290TXA0VRKFN//nA4UiX5NZBNZDpvRl0PABTQ+hevO
	vi0jdhMz3vZJ5eh6ObCpJXivn6Rdl83b2crGarGK+KnbFyhXNI2srQX0bTR2Ji4+
	6iHjosrWCNvcwLmLv33qmmVMutWepL1cDuMijQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1777898741; x=1777985141; bh=7iadlLD7o7T5q9oaPaN3Fuvzh8+f
	85PP/NJE+PPPmb8=; b=Vd5F+0COL/gebIfuXaBDBtot5kzYBBjALdFp2xNmEwap
	XYwztbLa8AdHG0HAoSNBSroD+6uCKWL94z095gnQuYULnN2PBsrzzJFINek0jZp5
	nufi5DVBV70DLhuQGurtQ5XOVM5+DOQRACQY5MckERRr1sKD/CobagnoYRHSNdLk
	TBrD9+kvB6pj4TVIFvn5DVL7LqQ+TCkNWMPd2x8S1SviHBfuJPPUvOw3jiYjssVY
	E8+sv3kJ8wwlpy8v6qNIUW0ERmgiYfQYRMkjAP+qzNJ+CyCcbwksa+rLAwRYuXrv
	MefozsU+OlgaJH7Nfc8Pz53vnmqi/OVlzS+d5OVBkw==
X-ME-Sender: <xms:9JT4aSXOaIKl2NCHYUVdQzYoXU75nbZLa5_xTSBivE8elw4YHS9ryw>
    <xme:9JT4aaGWA3OkVNT3nyPT2UEvlNHnmLoHwgK6l29C0mrCEZYIb0L32wehsvvvIKaAY
    mYsmXKgZf0G0HL8ekZA6tK2VIhZxs84x2izAWgv-zkbygqAx1I>
X-ME-Received: <xmr:9JT4ac3y6DGTUybWnrzqqVRTuh-Brjdl9rsXrg958Z2nVWjBLy6Fu2xN6Ww4RwrreofEazK-BYMtvp5m1hQ1cBAG1lkDAZ-jfeB0W7whoR4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelkeekjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepffeutdekgeeh
    fedvtdfftdfgffeugfehuefhgeevvdeugeevvefhkeeuveeugeejnecuffhomhgrihhnpe
    hgihhtlhgrsgdrtghomhdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
    gvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohephedpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojh
    gvtghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhi
    gidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthho
    pehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:9JT4aUNMZVpKgt4z1moEfLeXVX8mmd4G8NU0Jnm4pV8L4jLlIXI0zQ>
    <xmx:9ZT4aT4EZuuazsay3vsQ0EnFFfPAjB_MotzNPtNtv15K3TPc5noPJA>
    <xmx:9ZT4aW3KoOXpYJMGfYznIsHO_O8BESI6Pzq0mY8CNYnyhYPy3YV_hA>
    <xmx:9ZT4acxfQVXJ2SStFGUSR4yoGE8aep8R3cTlhQb09E1hQokW0DE0Hg>
    <xmx:9ZT4adSKktatCQkd8qxfNTFrUvNUrutdeqSjaGQ9KNxJdHhhMIY5dQ5T>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v4 00/13] Changes for several CI improvements
Date: Mon,  4 May 2026 14:35:39 +0200
Message-ID: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1777898743-52D72D75-2D626FAF/0/0
X-purgate-type: clean
X-purgate-size: 4887
X-Rspamd-Queue-Id: 398154BD24E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,invisiblethingslab.com:dkim,invisiblethingslab.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]

- Alpine update
- Debian trixie
- test arbitrary linux branch
- Linux stubdom
- enable SSH access

Green pipeline: https://gitlab.com/xen-project/people/marmarek/test-artifacts/-/pipelines/2498055947

Example Linux test:

Linux-next (20260504):
    https://gitlab.com/xen-project/people/marmarek/test-artifacts/-/pipelines/2496653697

A few genuine failures there:
- kbl-pci-pv-x86_64-gcc-debug:
   domU gets:

   (domU) [    0.449203] pcifront pci-0: xenbus: state reset occurred, reconnecting
   (domU) [    0.449426] pcifront pci-0: 22 freeing event channel 8

   and no PCI device ever appears

- zen3p-pvshim-x86-64-gcc-debug

    [    1.133364] ------------[ cut here ]------------
    [    1.133398] WARNING: arch/x86/xen/multicalls.c:190 at xen_mc_flush+0x198/0x240, CPU#0: swapper/0/1
    [    1.133457] Modules linked in:
    [    1.133488] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.1.0-rc1-next-20260430-gb9303e6bff70 #1 PREEMPT(lazy)
    [    1.133552] RIP: e030:xen_mc_flush+0x198/0x240
    [    1.133588] Code: 48 8b 43 10 48 8b 7b 20 4c 8b 53 38 4c 8b 43 40 e8 9d 85 14 01 48 89 43 18 48 85 c0 0f 89 1b ff ff ff 8b 3b be 01 00 00 00 90 <0f> 0b 90 65 8b 0d 02 9a 94 02 89 fa 48 c7 c7 78 b5 c1 82 e8 10 6e
    [    1.133693] RSP: e02b:ffffc9004000bcc0 EFLAGS: 00010086
    [    1.133730] RAX: ffffffffffffffff RBX: ffff88801da16c40 RCX: ffff88801da17450
    [    1.133778] RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000001
    [    1.133826] RBP: ffff88801da16c40 R08: 0000000000000000 R09: 0000000000000001
    [    1.133874] R10: 0000000000007ff0 R11: ffffc90040015fff R12: ffff888006570280
    [    1.133936] R13: 0000000000000000 R14: ffffc90040016000 R15: 8000000000000073
    [    1.133992] FS:  0000000000000000(0000) GS:ffff888099e14000(0000) knlGS:0000000000000000
    [    1.134040] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
    [    1.134045] CR2: ffffc9000083f000 CR3: 0000000003034000 CR4: 0000000000050660
    [    1.134045] Call Trace:
    [    1.134045]  <TASK>
    [    1.134045]  ? xen_mc_issue+0x24/0x90
    [    1.134045]  xen_leave_lazy_mmu+0x10/0x50
    [    1.134045]  vmap_range_noflush+0x54d/0x7b0
    [    1.134045]  __ioremap_caller.isra.0+0x174/0x290
    [    1.134045]  ? print_s5_reset_status_mmio+0x1c/0x90
    [    1.134045]  ? __pfx_print_s5_reset_status_mmio+0x10/0x10
    [    1.134045]  print_s5_reset_status_mmio+0x1c/0x90
    [    1.134045]  do_one_initcall+0x58/0x240
    [    1.134045]  kernel_init_freeable+0x1e2/0x240
    [    1.134045]  ? __pfx_kernel_init+0x10/0x10
    [    1.134045]  kernel_init+0x15/0x130
    [    1.134045]  ret_from_fork+0x17e/0x240
    [    1.134045]  ? __pfx_kernel_init+0x10/0x10
    [    1.134045]  ret_from_fork_asm+0x1a/0x30
    [    1.134045]  </TASK>
    [    1.134045] ---[ end trace 0000000000000000 ]---

    Kinda similar to https://lore.kernel.org/xen-devel/aaBH3EAchUwKhrUA@mail-itl/
    (which is still not solved)

- zen3p-smoke-x86-64-dom0pvh-gcc-debug and few other PVH dom0 - dom0 crash without printing panic message

Marek Marczykowski-Górecki (13):
  Add Alpine 3.23 containers
  Switch Linux builds to use Alpine 3.23 container
  Add debian rootfs artifact
  Enable CONFIG_USB_RTL8152 in kernel for hw12 runner
  Include git in the ARM64 build container too
  Support building arbitrary Linux branch/tag/commit
  Add linux-6.12.79-x86_64
  Save Linux config to artifacts too
  Add trigger-test job, to run test on a Linux built from a branch/tag
  Add linux-stubdom dependencies
  Prepare grub for booting x86_64 HVM domU from a disk
  Prepare grub for booting x86_64 HVM domU from a cdrom
  Setup ssh access to test systems

 .gitlab-ci.yml                             |  82 ++++++++++++++++--
 containerize                               |   6 +-
 images/alpine/3.18-arm64-build.dockerfile  |   1 +-
 images/alpine/3.23-arm64-base.dockerfile   |   6 +-
 images/alpine/3.23-arm64-build.dockerfile  |  31 +++++++-
 images/alpine/3.23-x86_64-base.dockerfile  |   6 +-
 images/alpine/3.23-x86_64-build.dockerfile |  43 +++++++++-
 images/debian/13-x86_64-base.dockerfile    |   4 +-
 scripts/alpine-rootfs.sh                   |  24 +++++-
 scripts/build-linux.sh                     |  26 ++++--
 scripts/debian-rootfs.sh                   | 100 ++++++++++++++++++++++-
 11 files changed, 316 insertions(+), 13 deletions(-)
 create mode 100644 images/alpine/3.23-arm64-base.dockerfile
 create mode 100644 images/alpine/3.23-arm64-build.dockerfile
 create mode 100644 images/alpine/3.23-x86_64-base.dockerfile
 create mode 100644 images/alpine/3.23-x86_64-build.dockerfile
 create mode 100644 images/debian/13-x86_64-base.dockerfile
 create mode 100755 scripts/debian-rootfs.sh

base-commit: 76894a5929bc604fb5bdb4aff2f94a6a9df68cdb
-- 
git-series 0.9.1

