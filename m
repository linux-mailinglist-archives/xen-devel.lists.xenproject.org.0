Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1002D57E0DB
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 13:34:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373154.605231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEquL-0005H7-5G; Fri, 22 Jul 2022 11:33:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373154.605231; Fri, 22 Jul 2022 11:33:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEquL-0005F7-2H; Fri, 22 Jul 2022 11:33:25 +0000
Received: by outflank-mailman (input) for mailman id 373154;
 Fri, 22 Jul 2022 11:33:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbD5=X3=eikelenboom.it=linux@srs-se1.protection.inumbo.net>)
 id 1oEquJ-0005F1-Q1
 for xen-devel@lists.xen.org; Fri, 22 Jul 2022 11:33:24 +0000
Received: from server.eikelenboom.it (server.eikelenboom.it [91.121.65.215])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 173d41a6-09b2-11ed-924f-1f966e50362f;
 Fri, 22 Jul 2022 13:33:22 +0200 (CEST)
Received: from 76-24-144-85.ftth.glasoperator.nl ([85.144.24.76]:35446
 helo=[172.16.1.50])
 by server.eikelenboom.it with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <linux@eikelenboom.it>)
 id 1oEqfb-0007YO-Qg; Fri, 22 Jul 2022 13:18:11 +0200
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
X-Inumbo-ID: 173d41a6-09b2-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
	Subject:From:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RGLlDkwv2j1oXjKi7EcbwVfItOOYy9Qr6zsEcosPC40=; b=WMdqvmuVte5raHIMbAZqipZemh
	gmQ8cYby6HdvxDyhrZtMj4wG3RElCM8f1d/vvgaj32ZyKcDkTC0gOajcW5uHDMrHxALqWAO/XVwa2
	wupcI+reWhGm0MimYVtUHumyWPefJMRtS3sXVeYkT34xs9ShYRhMOsTDo3W7I/k6QnJU=;
Message-ID: <7a474e07-4b5f-b985-1b1f-e2e1ae54a110@eikelenboom.it>
Date: Fri, 22 Jul 2022 13:16:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: nl-NL
To: Juergen Gross <jgross@suse.com>
Cc: Xen-devel <xen-devel@lists.xen.org>
From: Sander Eikelenboom <linux@eikelenboom.it>
Subject: Linux 5.19-rc7: WARNING: CPU: 5 PID: 50 at
 drivers/block/xen-blkback/xenbus.c:322 xen_blkif_disconnect+0x24f/0x260
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,


While trying out linux-5.19-rc7 (both for dom0 and domU's) running under 
Xen, I encounter these warnings below for every domU in my kernel log on 
dom0. The domU's don't boot any further because of lacking a block device.

Normally I use the same kernel for both dom0 and domU while booting with
direct kernel boot,

I also tried the combination of a 5.19-rc7 dom0 kernel and 5.18 domU 
kernel and then no warnings and all domU's boot fine.

Any ideas ?

--
Sander



[  144.137781] ------------[ cut here ]------------
[  144.137782] WARNING: CPU: 5 PID: 50 at 
drivers/block/xen-blkback/xenbus.c:322 xen_blkif_disconnect+0x24f/0x260
[  144.137786] Modules linked in:
[  144.137787] CPU: 5 PID: 50 Comm: xenwatch Tainted: G        W 
5.19.0-rc7-20220722-doflr-mac80211debug+ #1
[  144.137789] Hardware name: MSI MS-7640/890FXA-GD70 (MS-7640)  , BIOS 
V1.8B1 09/13/2010
[  144.137791] RIP: e030:xen_blkif_disconnect+0x24f/0x260
[  144.137794] Code: 20 48 8d 56 20 48 8d 48 e0 48 3b 54 24 08 0f 84 a7 
fe ff ff 4c 8b 74 24 10 48 89 4c 24 10 eb 82 0f 0b 0f 0b 0f 0b 0f 0b 0f 
0b <0f> 0b e9 ef fe ff ff b8 f0 ff ff ff e9 34 ff ff ff 41 54 55 48 89
[  144.137795] RSP: e02b:ffffc90000847dd8 EFLAGS: 00010202
[  144.137797] RAX: 0000000000000040 RBX: 0000000000000001 RCX: 
ffff88800fef8350
[  144.137799] RDX: 0000000000000000 RSI: 0000000000000200 RDI: 
00000000ffffffff
[  144.137800] RBP: ffff88800fef82f0 R08: ffff88807d36fd00 R09: 
0000000000028220
[  144.137802] R10: 000000000002fd60 R11: 0000000000000006 R12: 
0000000000000002
[  144.137803] R13: ffff88801d1cd000 R14: ffff88800fef8330 R15: 
ffff888006c70cc0
[  144.137807] FS:  0000000000000000(0000) GS:ffff88807d340000(0000) 
knlGS:0000000000000000
[  144.137809] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[  144.137810] CR2: 00007f536f443450 CR3: 0000000023000000 CR4: 
0000000000000660
[  144.137813] Call Trace:
[  144.137814]  <TASK>
[  144.137816]  frontend_changed+0x388/0x450
[  144.137819]  xenwatch_thread+0x9c/0x170
[  144.137822]  ? cpu_core_flags+0x10/0x10
[  144.137824]  ? find_watch+0x50/0x50
[  144.137827]  kthread+0xe3/0x110
[  144.137830]  ? kthread_complete_and_exit+0x20/0x20
[  144.137832]  ret_from_fork+0x22/0x30
[  144.137835]  </TASK>
[  144.137836] ---[ end trace 0000000000000000 ]---

