Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D0A3C9B38
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 11:17:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156527.288879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3xTy-0002Q6-3N; Thu, 15 Jul 2021 09:16:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156527.288879; Thu, 15 Jul 2021 09:16:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3xTx-0002N3-Vi; Thu, 15 Jul 2021 09:16:37 +0000
Received: by outflank-mailman (input) for mailman id 156527;
 Thu, 15 Jul 2021 09:16:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u0p9=MH=redhat.com=vkuznets@srs-us1.protection.inumbo.net>)
 id 1m3xTw-0002Mx-E7
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 09:16:36 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 6e8784d2-9e60-4d93-9a65-b9728f8f4f4c;
 Thu, 15 Jul 2021 09:16:35 +0000 (UTC)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-76S1QWT3Mf6HcuRBsgdy8g-1; Thu, 15 Jul 2021 05:16:33 -0400
Received: by mail-ej1-f72.google.com with SMTP id
 k1-20020a17090666c1b029041c273a883dso1953924ejp.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jul 2021 02:16:33 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id q9sm1608796ejf.70.2021.07.15.02.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 02:16:31 -0700 (PDT)
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
X-Inumbo-ID: 6e8784d2-9e60-4d93-9a65-b9728f8f4f4c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626340595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=rQkCwB3PjmSSNkHN1xOfrruRwkpvkiUrPRk/ObYbxmg=;
	b=NbChIgxj507ClMpaN8m9o8aFF/8Nzmcvp0XiW30kGt5RombUdeAV98aTR9uy/MiwBL2SgG
	d9hniWh3xxk8nzLx5UJmAtBIa2YUNUiuBtRyAQHcSYhiu6EKBWeilaIoVoYYb0K1+Y/wp4
	Spor/MGKGJBYm6GGukGYoiBQT61jwrQ=
X-MC-Unique: 76S1QWT3Mf6HcuRBsgdy8g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
        bh=rQkCwB3PjmSSNkHN1xOfrruRwkpvkiUrPRk/ObYbxmg=;
        b=JWUIFQGELRSo8hj6XSlEDsCgwwz+wUsuJoFO7QxHTakc4SQE5GhUoM3ZdyiXzHcUNP
         kxdrn/ADR+rzXRYEJc/RTZJ2fVp/sHHkoUdgxssj59b4/4InZhrQii2CCJq1W/zIAnXp
         QQQWZbVgjxy/UvP32SigaLdAZjdqfZ1v4Yksn72ocarjjuHr4wg2mV1vvryRaimy8jfw
         E9tVx8tGlXvkcCDFIbOos7uUnU2StzI+pz0c2WH6Wh8ynqMVD2v/OG6CpbFbd+tyyHZb
         SB66e4v56cKSBNOtP7o2MoGEMgIKMva5XicMuNRf1py0OdnMHxNiHsbuoojO+dz6fKXD
         NJbA==
X-Gm-Message-State: AOAM531HH6rpjzA/kRBW6WMztoR99NFmBr23r6O5yTwcSJnXmC8o01dq
	t9t7w9tVlYYi1TujMgkOB2b87YHcY5Amm48G5p3BnBIxlsbeplBfMBfKlbTA2VG4IC7KOX1gXd+
	W4iWI/UXKOEI+U9DFctT4IjKxHwI=
X-Received: by 2002:a17:907:2d23:: with SMTP id gs35mr4464164ejc.222.1626340592562;
        Thu, 15 Jul 2021 02:16:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrF1DeIlWLw3NJml16Su+o7SSbmg9PG4wFP14gBmcJwEXfXtkYQ4qqpERXjhYqJbulctjJhg==
X-Received: by 2002:a17:907:2d23:: with SMTP id gs35mr4464141ejc.222.1626340592359;
        Thu, 15 Jul 2021 02:16:32 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: xen-devel@lists.xenproject.org
Cc: linux-block@vger.kernel.org, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 Christoph Hellwig <hch@lst.de>
Subject: [BUG report] Deadlock in xen-blkfront upon device hot-unplug
Date: Thu, 15 Jul 2021 11:16:30 +0200
Message-ID: <87pmvk0wep.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

I'm observing a deadlock every time I try to unplug a xen-blkfront
device. With 5.14-rc1+ the deadlock looks like:

[  513.682405] ============================================
[  513.686617] WARNING: possible recursive locking detected
[  513.691020] 5.14.0-rc1+ #370 Not tainted
[  513.694272] --------------------------------------------
[  513.698528] xenwatch/144 is trying to acquire lock:
[  513.702424] ffff96dc4a4c1d28 (&disk->open_mutex){+.+.}-{3:3}, at: del_gendisk+0x53/0x210
[  513.708768] 
               but task is already holding lock:
[  513.713320] ffff96dc4a4c1d28 (&disk->open_mutex){+.+.}-{3:3}, at: blkback_changed+0x118/0xeb9 [xen_blkfront]
[  513.720369] 
               other info that might help us debug this:
[  513.724901]  Possible unsafe locking scenario:

[  513.729241]        CPU0
[  513.731326]        ----
[  513.733404]   lock(&disk->open_mutex);
[  513.736679]   lock(&disk->open_mutex);
[  513.739988] 
                *** DEADLOCK ***

[  513.745524]  May be due to missing lock nesting notation

[  513.751438] 2 locks held by xenwatch/144:
[  513.755344]  #0: ffffffff8c9f3c70 (xenwatch_mutex){+.+.}-{3:3}, at: xenwatch_thread+0xe6/0x190
[  513.762137]  #1: ffff96dc4a4c1d28 (&disk->open_mutex){+.+.}-{3:3}, at: blkback_changed+0x118/0xeb9 [xen_blkfront]
[  513.770381] 
               stack backtrace:
[  513.774785] CPU: 1 PID: 144 Comm: xenwatch Not tainted 5.14.0-rc1+ #370
[  513.780131] Hardware name: Xen HVM domU, BIOS 4.2.amazon 08/24/2006
[  513.785097] Call Trace:
[  513.787920]  dump_stack_lvl+0x6a/0x9a
[  513.791223]  __lock_acquire.cold+0x14a/0x2ba
[  513.794918]  ? mark_held_locks+0x50/0x80
[  513.798453]  lock_acquire+0xd3/0x2f0
[  513.801819]  ? del_gendisk+0x53/0x210
[  513.805334]  ? kernfs_put.part.0+0xe8/0x1b0
[  513.808905]  ? del_gendisk+0x53/0x210
[  513.812230]  __mutex_lock+0x8d/0x8c0
[  513.815415]  ? del_gendisk+0x53/0x210
[  513.818931]  ? kernfs_put.part.0+0xe8/0x1b0
[  513.822594]  del_gendisk+0x53/0x210
[  513.825782]  xlvbd_release_gendisk+0x6f/0xb0 [xen_blkfront]
[  513.830186]  blkback_changed+0x20e/0xeb9 [xen_blkfront]
[  513.834458]  ? xenbus_read_driver_state+0x39/0x60
[  513.838540]  xenwatch_thread+0x94/0x190
[  513.841936]  ? do_wait_intr_irq+0xb0/0xb0
[  513.845451]  ? xenbus_dev_request_and_reply+0x90/0x90
[  513.849885]  kthread+0x149/0x170
[  513.853039]  ? set_kthread_struct+0x40/0x40
[  513.857027]  ret_from_fork+0x22/0x30

My suspicion is that the problem was introduced by:

commit c76f48eb5c084b1e15c931ae8cc1826cd771d70d
Author: Christoph Hellwig <hch@lst.de>
Date:   Tue Apr 6 08:22:56 2021 +0200

    block: take bd_mutex around delete_partitions in del_gendisk

blkfront_closing() takes '&bdev->bd_disk->open_mutex' around
xlvbd_release_gendisk() call which in its turn calls del_gendisk() which
after the above mentioned commit tries to take the same mutex. I may be
completely wrong though.

If I try to avoid taking the mutex from blkfront_closing(): 

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 8d49f8fa98bb..9af6831492d4 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -2145,8 +2145,6 @@ static void blkfront_closing(struct blkfront_info *info)
                return;
        }
 
-       mutex_lock(&bdev->bd_disk->open_mutex);
-
        if (bdev->bd_openers) {
                xenbus_dev_error(xbdev, -EBUSY,
                                 "Device in use; refusing to close");
@@ -2156,7 +2154,6 @@ static void blkfront_closing(struct blkfront_info *info)
                xenbus_frontend_closed(xbdev);
        }
 
-       mutex_unlock(&bdev->bd_disk->open_mutex);
        bdput(bdev);
 }
 
the situation becomes even worse:

[   74.371465] general protection fault, probably for non-canonical address 0xb0fa8ce8ee8a2234: 0000 [#1] SMP PTI
[   74.381294] CPU: 3 PID: 144 Comm: xenwatch Not tainted 5.14.0-rc1+ #370
[   74.386172] Hardware name: Xen HVM domU, BIOS 4.2.amazon 08/24/2006
[   74.390918] RIP: 0010:del_timer+0x1f/0x80
[   74.394282] Code: 71 af a3 00 eb c1 31 c0 c3 66 90 0f 1f 44 00 00 41 55 41 54 45 31 e4 55 48 83 ec 10 65 48 8b 04 25 28 00 00 00 48 89 44 24 08 <48> 8b 47 08 48 85 c0 74 2d 48 89 e6 48 89 fd e8 dd e8 ff ff 48 89
[   74.407591] RSP: 0018:ffffbab68423bcc8 EFLAGS: 00010082
[   74.411691] RAX: dd931e09aefb8f00 RBX: b0fa8ce8ee8a21dc RCX: 0000000000005e7f
[   74.417041] RDX: 0000000000005e80 RSI: 0000000000000001 RDI: b0fa8ce8ee8a222c
[   74.422425] RBP: ffffbab68423bd20 R08: 0000000000000001 R09: 0000000000000001
[   74.427595] R10: 0000000000000001 R11: 0000000000000002 R12: 0000000000000000
[   74.432886] R13: ffffa0484f3e4000 R14: 0000000000000000 R15: ffffa0484691c000
[   74.438784] FS:  0000000000000000(0000) GS:ffffa083c8e00000(0000) knlGS:0000000000000000
[   74.444592] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   74.448917] CR2: 00007ff618903ff8 CR3: 0000000111e16001 CR4: 00000000001706e0
[   74.454309] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   74.460128] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   74.465872] Call Trace:
[   74.468467]  try_to_grab_pending+0x13f/0x2e0
[   74.472202]  cancel_delayed_work+0x2e/0xd0
[   74.475980]  blk_mq_stop_hw_queues+0x2d/0x50
[   74.479732]  blkfront_remove+0x40/0x210 [xen_blkfront]
[   74.484154]  xenbus_dev_remove+0x6d/0xf0
[   74.487872]  __device_release_driver+0x180/0x240
[   74.491561]  device_release_driver+0x26/0x40
[   74.497134]  bus_remove_device+0xef/0x160
[   74.500180]  device_del+0x18c/0x3e0
[   74.503451]  ? xenbus_probe_devices+0x120/0x120
[   74.506975]  ? klist_iter_exit+0x14/0x20
[   74.511649]  device_unregister+0x13/0x60
[   74.515237]  xenbus_dev_changed+0x174/0x1e0
[   74.518923]  xenwatch_thread+0x94/0x190
[   74.522208]  ? do_wait_intr_irq+0xb0/0xb0
[   74.525690]  ? xenbus_dev_request_and_reply+0x90/0x90
[   74.529973]  kthread+0x149/0x170
[   74.533007]  ? set_kthread_struct+0x40/0x40
[   74.537023]  ret_from_fork+0x22/0x30
[   74.540411] Modules linked in: vfat fat i2c_piix4 xfs libcrc32c crct10dif_pclmul crc32_pclmul crc32c_intel xen_blkfront ghash_clmulni_intel ena
[   74.549144] ---[ end trace 296bd6f709c05e9e ]---

At this point I can only say that something is certainly
wrong. Apologies if this is an already known problem.

-- 
Vitaly


