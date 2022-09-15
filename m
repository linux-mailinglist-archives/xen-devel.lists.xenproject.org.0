Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB855B9B4B
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 14:50:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407351.649833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYoJG-0002JH-0P; Thu, 15 Sep 2022 12:49:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407351.649833; Thu, 15 Sep 2022 12:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYoJF-0002GZ-TO; Thu, 15 Sep 2022 12:49:37 +0000
Received: by outflank-mailman (input) for mailman id 407351;
 Thu, 15 Sep 2022 12:49:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKZT=ZS=eikelenboom.it=linux@srs-se1.protection.inumbo.net>)
 id 1oYoJD-0002GT-VQ
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 12:49:36 +0000
Received: from server.eikelenboom.it (server.eikelenboom.it [91.121.65.215])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8f404a5-34f4-11ed-9761-273f2230c3a0;
 Thu, 15 Sep 2022 14:49:33 +0200 (CEST)
Received: from 76-24-144-85.ftth.glasoperator.nl ([85.144.24.76]:53190
 helo=[10.97.34.6]) by server.eikelenboom.it with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <linux@eikelenboom.it>)
 id 1oYoIy-0006Te-Kw; Thu, 15 Sep 2022 14:49:20 +0200
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
X-Inumbo-ID: d8f404a5-34f4-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:Cc:To:
	Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rF3bpi1+8UCL68aN7n0XDkI9TKmE1wkl48gvchSI0E8=; b=IlaidEycf+9ru/3eSfgD67ti63
	ibDTEULdffpjoFdy95Xvpiiz7hmwvDe/tuxyY61vlemEov17pXDqyNUUlmSQlOibeaBBYy3LSlTMN
	b7iufNEaboQg+BIPUVW77NrH5QX5eOJ2ABYI260Sw46dgJkQ1rGpE2Z2HFMV9NVDCiUU=;
Message-ID: <c38ca372-e3ea-2f72-6cdd-81433002d21e@eikelenboom.it>
Date: Thu, 15 Sep 2022 14:49:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: nl-NL
From: Sander Eikelenboom <linux@eikelenboom.it>
Subject: Bisected: drivers/block/xen-blkback/xenbus.c:327
 xen_blkif_disconnect+0x24f/0x260
To: Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

I'm having trouble booting my DomU's when trying to use a linux-5.19 kernel for both Dom0 and DomU.
A dom0 5.19 kernel with a domU 5.18 kernel boots fine.
I'm using durect kernel boot to boot the domU guest (kernel=  and ramdisk= parameters).

Since both xen-blkback and xen-blkfront could be into play,
I bisected this by keeping dom0 fixed as a 5.19 kernel and do the bisecting on the domU kernel.

Bisecting leads to commit 4573240f0764ee79d7558d74fc535baa1e110d20 "xen/xenbus: eliminate xenbus_grant_ring()"
Reverting this specific commit makes the domU boot fine again.

I have added the splat from dom0 kernel below (from using 5.19.8 kernel for both dom0 and domU),
the domU does not seem to have any interessting logging,
apart from not being able to find the root filesystem.

Do you have any ideas ?

--
Sander




Dom0:

[144007.320877] xen_bridge: port 3(vif17.0) entered blocking state
[144007.320885] xen_bridge: port 3(vif17.0) entered disabled state
[144007.320993] device vif17.0 entered promiscuous mode
[144011.012144] xen-blkback: backend/vbd/17/51712: using 2 queues, protocol 1 (x86_64-abi) persistent grants
[144011.014046] vbd vbd-17-51712: 9 mapping in shared page 9 from domain 17
[144011.015339] vbd vbd-17-51712: 2 mapping ring-ref port 13
[144011.016666] ------------[ cut here ]------------
[144011.016672] WARNING: CPU: 0 PID: 50 at drivers/block/xen-blkback/xenbus.c:327 xen_blkif_disconnect+0x24f/0x260
[144011.016687] Modules linked in:
[144011.016691] CPU: 0 PID: 50 Comm: xenwatch Not tainted 5.19.8-20220913-doflr-mac80211debug+ #1
[144011.016695] Hardware name: MSI MS-7640/890FXA-GD70 (MS-7640)  , BIOS V1.8B1 09/13/2010
[144011.016698] RIP: e030:xen_blkif_disconnect+0x24f/0x260
[144011.016702] Code: 20 48 8d 56 20 48 8d 48 e0 48 3b 54 24 08 0f 84 a7 fe ff ff 4c 8b 74 24 10 48 89 4c 24 10 eb 82 0f 0b 0f 0b 0f 0b 0f 0b 0f 0b <0f> 0b e9 ef fe ff ff b8 f0 ff ff ff e9 34 ff ff ff 41 54 55 48 89
[144011.016705] RSP: e02b:ffffc90000847dd8 EFLAGS: 00010202
[144011.016708] RAX: 0000000000000040 RBX: 0000000000000001 RCX: ffff88802a03bc60
[144011.016710] RDX: 0000000000000000 RSI: 0000000000000200 RDI: 00000000ffffffff
[144011.016711] RBP: ffff88802a03bc00 R08: 0000000000000001 R09: ffffffff82296a93
[144011.016713] R10: 00000000fffffffc R11: 00000000000222cd R12: 0000000000000000
[144011.016715] R13: ffff8880187d5000 R14: ffff88802a03bc40 R15: ffff88801caf0c00
[144011.016730] FS:  0000000000000000(0000) GS:ffff88807d200000(0000) knlGS:0000000000000000
[144011.016732] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[144011.016740] CR2: 00007ffe03596084 CR3: 000000000adee000 CR4: 0000000000000660
[144011.016744] Call Trace:
[144011.016744]  <TASK>
[144011.016747]  frontend_changed+0x3b2/0x470
[144011.016752]  xenwatch_thread+0x9c/0x170
[144011.016757]  ? cpu_core_flags+0x10/0x10
[144011.016764]  ? find_watch+0x50/0x50
[144011.016766]  kthread+0xe3/0x110
[144011.016773]  ? kthread_complete_and_exit+0x20/0x20
[144011.016782]  ret_from_fork+0x22/0x30
[144011.016785]  </TASK>
[144011.016786] ---[ end trace 0000000000000000 ]---
[144011.016796] ------------[ cut here ]------------
[144011.016797] WARNING: CPU: 0 PID: 50 at drivers/block/xen-blkback/xenbus.c:327 xen_blkif_disconnect+0x24f/0x260
[144011.016801] Modules linked in:
[144011.016802] CPU: 0 PID: 50 Comm: xenwatch Tainted: G        W         5.19.8-20220913-doflr-mac80211debug+ #1
[144011.016805] Hardware name: MSI MS-7640/890FXA-GD70 (MS-7640)  , BIOS V1.8B1 09/13/2010
[144011.016806] RIP: e030:xen_blkif_disconnect+0x24f/0x260
[144011.016808] Code: 20 48 8d 56 20 48 8d 48 e0 48 3b 54 24 08 0f 84 a7 fe ff ff 4c 8b 74 24 10 48 89 4c 24 10 eb 82 0f 0b 0f 0b 0f 0b 0f 0b 0f 0b <0f> 0b e9 ef fe ff ff b8 f0 ff ff ff e9 34 ff ff ff 41 54 55 48 89
[144011.016811] RSP: e02b:ffffc90000847dd8 EFLAGS: 00010202
[144011.016813] RAX: 0000000000000040 RBX: 0000000000000001 RCX: ffff88802a03bdd8
[144011.016815] RDX: 0000000000000000 RSI: 0000000000000200 RDI: 00000000ffffffff
[144011.016816] RBP: ffff88802a03bd78 R08: 0000000000000001 R09: ffffffff82296a93
[144011.016818] R10: 00000000fffffffc R11: 00000000000222cd R12: 0000000000000001
[144011.016819] R13: ffff8880187d5000 R14: ffff88802a03bdb8 R15: ffff88801caf0c00
[144011.016824] FS:  0000000000000000(0000) GS:ffff88807d200000(0000) knlGS:0000000000000000
[144011.016825] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[144011.016827] CR2: 00007ffe03596084 CR3: 000000000adee000 CR4: 0000000000000660
[144011.016829] Call Trace:
[144011.016831]  <TASK>
[144011.016832]  frontend_changed+0x3b2/0x470
[144011.016835]  xenwatch_thread+0x9c/0x170
[144011.016837]  ? cpu_core_flags+0x10/0x10
[144011.016840]  ? find_watch+0x50/0x50
[144011.016842]  kthread+0xe3/0x110
[144011.016844]  ? kthread_complete_and_exit+0x20/0x20
[144011.016848]  ret_from_fork+0x22/0x30
[144011.016851]  </TASK>
[144011.016852] ---[ end trace 0000000000000000 ]---
[144011.154673] vif vif-17-0 vif17.0: Guest Rx ready
[144011.154711] xen_bridge: port 3(vif17.0) entered blocking state
[144011.154713] xen_bridge: port 3(vif17.0) entered forwarding state

