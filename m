Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7102840211E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 23:36:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180281.326869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNMH3-0004TB-IK; Mon, 06 Sep 2021 21:35:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180281.326869; Mon, 06 Sep 2021 21:35:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNMH3-0004QT-F8; Mon, 06 Sep 2021 21:35:29 +0000
Received: by outflank-mailman (input) for mailman id 180281;
 Mon, 06 Sep 2021 21:35:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k3uM=N4=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1mNMH2-0004QN-A6
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 21:35:28 +0000
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d167496c-c553-4b02-b94b-d68a6f126275;
 Mon, 06 Sep 2021 21:35:25 +0000 (UTC)
Received: from 76-24-144-85.ftth.glasoperator.nl ([85.144.24.76]:59648
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>) id 1mNMGn-0003UQ-35
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 23:35:13 +0200
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
X-Inumbo-ID: d167496c-c553-4b02-b94b-d68a6f126275
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Date:Message-ID:To:Subject:From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=p2NdIgEhC3QeQFfY0U3KvL+PnROpHFsvtadWOxPAqvA=; b=RmMZnXucFtIIpaT/DJfQ7pYpcp
	dbojjmoySx/+QdSwQpAzVMKKElcG6gZ2roHByYsIK2lokmHryAduwES2NXaSn/qet1Bfz/Q3f9jq2
	wH83yrlPCcLmjaMLSoMrId+UW1Xek6tq/DPxISb9SnC5Dyy6RHtHge792hQl2gzFgrO0=;
From: Sander Eikelenboom <linux@eikelenboom.it>
Subject: xen-unstable linux-5.14: 1 of 2 multicall(s) failed: cpu 0
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <9c36205e-cc37-ed9a-3408-0cccc4a83115@eikelenboom.it>
Date: Mon, 6 Sep 2021 23:35:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: nl-NL
Content-Transfer-Encoding: 7bit

L.S.,

On my AMD box running:
     xen-unstable changeset: Fri Sep 3 15:10:43 2021 +0200 git:2d4978ead4
     linux kernel: 5.14.1

With this setup I'm encountering some issues in dom0, see below.

--
Sander

xl dmesg gives:

(XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 63b936 already pinned
(XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 6a0622 already pinned
(XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 6b63da already pinned
(XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 638dd9 already pinned
(XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 68a7bc already pinned
(XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 63c27d already pinned
(XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 6a04f2 already pinned
(XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 690d49 already pinned
(XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 6959a0 already pinned
(XEN) [2021-09-06 18:15:04.089] mm.c:3506:d0v0 mfn 6a055e already pinned
(XEN) [2021-09-06 18:15:04.090] mm.c:3506:d0v0 mfn 639437 already pinned


dmesg gives:

[34321.304270] ------------[ cut here ]------------
[34321.304277] WARNING: CPU: 0 PID: 23628 at arch/x86/xen/multicalls.c:102 xen_mc_flush+0x176/0x1a0
[34321.304288] Modules linked in:
[34321.304291] CPU: 0 PID: 23628 Comm: apt-get Not tainted 5.14.1-20210906-doflr-mac80211debug+ #1
[34321.304294] Hardware name: MSI MS-7640/890FXA-GD70 (MS-7640)  , BIOS V1.8B1 09/13/2010
[34321.304296] RIP: e030:xen_mc_flush+0x176/0x1a0
[34321.304300] Code: 89 45 18 48 c1 e9 3f 48 89 ce e9 20 ff ff ff e8 60 03 00 00 66 90 5b 5d 41 5c 41 5d c3 48 c7 45 18 ea ff ff ff be 01 00 00 00 <0f> 0b 8b 55 00 48 c7 c7 10 97 aa 82 31 db 49 c7 c5 38 97 aa 82 65
[34321.304303] RSP: e02b:ffffc90000a97c90 EFLAGS: 00010002
[34321.304305] RAX: ffff88807d416398 RBX: ffff88807d416350 RCX: ffff88807d416398
[34321.304306] RDX: 0000000000000001 RSI: 0000000000000001 RDI: deadbeefdeadf00d
[34321.304308] RBP: ffff88807d416300 R08: aaaaaaaaaaaaaaaa R09: ffff888006160cc0
[34321.304309] R10: deadbeefdeadf00d R11: ffffea000026a600 R12: 0000000000000000
[34321.304310] R13: ffff888012f6b000 R14: 0000000012f6b000 R15: 0000000000000001
[34321.304320] FS:  00007f5071177800(0000) GS:ffff88807d400000(0000) knlGS:0000000000000000
[34321.304322] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[34321.304323] CR2: 00007f506f542000 CR3: 00000000160cc000 CR4: 0000000000000660
[34321.304326] Call Trace:
[34321.304331]  xen_alloc_pte+0x294/0x320
[34321.304334]  move_pgt_entry+0x165/0x4b0
[34321.304339]  move_page_tables+0x6fa/0x8d0
[34321.304342]  move_vma.isra.44+0x138/0x500
[34321.304345]  __x64_sys_mremap+0x296/0x410
[34321.304348]  do_syscall_64+0x3a/0x80
[34321.304352]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[34321.304355] RIP: 0033:0x7f507196301a
[34321.304358] Code: 73 01 c3 48 8b 0d 76 0e 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 49 89 ca b8 19 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 46 0e 0c 00 f7 d8 64 89 01 48
[34321.304360] RSP: 002b:00007ffda1eecd38 EFLAGS: 00000246 ORIG_RAX: 0000000000000019
[34321.304362] RAX: ffffffffffffffda RBX: 000056205f950f30 RCX: 00007f507196301a
[34321.304363] RDX: 0000000001a00000 RSI: 0000000001900000 RDI: 00007f506dc56000
[34321.304364] RBP: 0000000001a00000 R08: 0000000000000010 R09: 0000000000000004
[34321.304365] R10: 0000000000000001 R11: 0000000000000246 R12: 00007f506dc56060
[34321.304367] R13: 00007f506dc56000 R14: 00007f506dc56060 R15: 000056205f950f30
[34321.304368] ---[ end trace a19885b78fe8f33e ]---
[34321.304370] 1 of 2 multicall(s) failed: cpu 0
[34321.304371]   call  2: op=12297829382473034410 arg=[aaaaaaaaaaaaaaaa] result=-22
[34321.304398] ------------[ cut here ]------------
[34321.304399] WARNING: CPU: 0 PID: 23628 at arch/x86/xen/multicalls.c:102 xen_mc_flush+0x176/0x1a0
[34321.304403] Modules linked in:
[34321.304404] CPU: 0 PID: 23628 Comm: apt-get Tainted: G        W         5.14.1-20210906-doflr-mac80211debug+ #1
[34321.304406] Hardware name: MSI MS-7640/890FXA-GD70 (MS-7640)  , BIOS V1.8B1 09/13/2010
[34321.304407] RIP: e030:xen_mc_flush+0x176/0x1a0
[34321.304410] Code: 89 45 18 48 c1 e9 3f 48 89 ce e9 20 ff ff ff e8 60 03 00 00 66 90 5b 5d 41 5c 41 5d c3 48 c7 45 18 ea ff ff ff be 01 00 00 00 <0f> 0b 8b 55 00 48 c7 c7 10 97 aa 82 31 db 49 c7 c5 38 97 aa 82 65
[34321.304411] RSP: e02b:ffffc90000a97c90 EFLAGS: 00010002
[34321.304413] RAX: ffff88807d416398 RBX: ffff88807d416350 RCX: ffff88807d416398
[34321.304414] RDX: 0000000000000001 RSI: 0000000000000001 RDI: deadbeefdeadf00d
[34321.304415] RBP: ffff88807d416300 R08: aaaaaaaaaaaaaaaa R09: ffff888006160cc0
[34321.304417] R10: deadbeefdeadf00d R11: ffffc90000a97ab8 R12: 0000000000000000
[34321.304418] R13: ffff888009e6a000 R14: 0000000009e6a000 R15: 0000000000000001
[34321.304422] FS:  00007f5071177800(0000) GS:ffff88807d400000(0000) knlGS:0000000000000000
[34321.304423] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[34321.304425] CR2: 00007f506f542000 CR3: 00000000160cc000 CR4: 0000000000000660
[34321.304427] Call Trace:
[34321.304428]  xen_alloc_pte+0x294/0x320
[34321.304431]  move_pgt_entry+0x165/0x4b0
[34321.304433]  move_page_tables+0x6fa/0x8d0
[34321.304436]  move_vma.isra.44+0x138/0x500
[34321.304439]  __x64_sys_mremap+0x296/0x410
[34321.304442]  do_syscall_64+0x3a/0x80
[34321.304444]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[34321.304446] RIP: 0033:0x7f507196301a
[34321.304448] Code: 73 01 c3 48 8b 0d 76 0e 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 49 89 ca b8 19 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 46 0e 0c 00 f7 d8 64 89 01 48
[34321.304449] RSP: 002b:00007ffda1eecd38 EFLAGS: 00000246 ORIG_RAX: 0000000000000019
[34321.304451] RAX: ffffffffffffffda RBX: 000056205f950f30 RCX: 00007f507196301a
[34321.304452] RDX: 0000000001a00000 RSI: 0000000001900000 RDI: 00007f506dc56000
[34321.304453] RBP: 0000000001a00000 R08: 0000000000000010 R09: 0000000000000004
[34321.304455] R10: 0000000000000001 R11: 0000000000000246 R12: 00007f506dc56060
[34321.304456] R13: 00007f506dc56000 R14: 00007f506dc56060 R15: 000056205f950f30
[34321.304457] ---[ end trace a19885b78fe8f33f ]---
[34321.304458] 1 of 2 multicall(s) failed: cpu 0
[34321.304459]   call  2: op=12297829382473034410 arg=[aaaaaaaaaaaaaaaa] result=-22
[34321.304477] ------------[ cut here ]------------
[34321.304478] WARNING: CPU: 0 PID: 23628 at arch/x86/xen/multicalls.c:102 xen_mc_flush+0x176/0x1a0
[34321.304482] Modules linked in:
[34321.304483] CPU: 0 PID: 23628 Comm: apt-get Tainted: G        W         5.14.1-20210906-doflr-mac80211debug+ #1
[34321.304485] Hardware name: MSI MS-7640/890FXA-GD70 (MS-7640)  , BIOS V1.8B1 09/13/2010
[34321.304486] RIP: e030:xen_mc_flush+0x176/0x1a0
[34321.304488] Code: 89 45 18 48 c1 e9 3f 48 89 ce e9 20 ff ff ff e8 60 03 00 00 66 90 5b 5d 41 5c 41 5d c3 48 c7 45 18 ea ff ff ff be 01 00 00 00 <0f> 0b 8b 55 00 48 c7 c7 10 97 aa 82 31 db 49 c7 c5 38 97 aa 82 65
[34321.304490] RSP: e02b:ffffc90000a97c90 EFLAGS: 00010002
[34321.304491] RAX: ffff88807d416398 RBX: ffff88807d416350 RCX: ffff88807d416398
[34321.304493] RDX: 0000000000000001 RSI: 0000000000000001 RDI: deadbeefdeadf00d
[34321.304494] RBP: ffff88807d416300 R08: aaaaaaaaaaaaaaaa R09: ffff888006160cc0
[34321.304495] R10: deadbeefdeadf00d R11: ffffc90000a97ab8 R12: 0000000000000000
[34321.304496] R13: ffff88801833e000 R14: 000000001833e000 R15: 0000000000000001
[34321.304500] FS:  00007f5071177800(0000) GS:ffff88807d400000(0000) knlGS:0000000000000000
[34321.304502] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[34321.304503] CR2: 00007f506f542000 CR3: 00000000160cc000 CR4: 0000000000000660
[34321.304505] Call Trace:
[34321.304506]  xen_alloc_pte+0x294/0x320
[34321.304509]  move_pgt_entry+0x165/0x4b0
[34321.304511]  move_page_tables+0x6fa/0x8d0
[34321.304514]  move_vma.isra.44+0x138/0x500
[34321.304516]  __x64_sys_mremap+0x296/0x410
[34321.304519]  do_syscall_64+0x3a/0x80
[34321.304521]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[34321.304523] RIP: 0033:0x7f507196301a
[34321.304525] Code: 73 01 c3 48 8b 0d 76 0e 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 49 89 ca b8 19 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 46 0e 0c 00 f7 d8 64 89 01 48
[34321.304526] RSP: 002b:00007ffda1eecd38 EFLAGS: 00000246 ORIG_RAX: 0000000000000019
[34321.304528] RAX: ffffffffffffffda RBX: 000056205f950f30 RCX: 00007f507196301a
[34321.304529] RDX: 0000000001a00000 RSI: 0000000001900000 RDI: 00007f506dc56000
[34321.304530] RBP: 0000000001a00000 R08: 0000000000000010 R09: 0000000000000004
[34321.304531] R10: 0000000000000001 R11: 0000000000000246 R12: 00007f506dc56060
[34321.304533] R13: 00007f506dc56000 R14: 00007f506dc56060 R15: 000056205f950f30
[34321.304534] ---[ end trace a19885b78fe8f340 ]---
[34321.304535] 1 of 2 multicall(s) failed: cpu 0
[34321.304536]   call  2: op=12297829382473034410 arg=[aaaaaaaaaaaaaaaa] result=-22

