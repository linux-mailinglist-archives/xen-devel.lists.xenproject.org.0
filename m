Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C9853AD88
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 21:54:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340771.565879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwUQD-0007A1-MJ; Wed, 01 Jun 2022 19:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340771.565879; Wed, 01 Jun 2022 19:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwUQD-00078G-IB; Wed, 01 Jun 2022 19:54:25 +0000
Received: by outflank-mailman (input) for mailman id 340771;
 Wed, 01 Jun 2022 19:54:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k3DM=WI=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nwUQB-000788-EA
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 19:54:23 +0000
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [2607:f8b0:4864:20::f2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1144b85-e1e4-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 21:54:22 +0200 (CEST)
Received: by mail-qv1-xf2e.google.com with SMTP id ea7so2194700qvb.12
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jun 2022 12:54:22 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:c14:2162:8bd0:d95])
 by smtp.gmail.com with ESMTPSA id
 x22-20020ae9e916000000b0069fc13ce205sm1706737qkf.54.2022.06.01.12.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 12:54:19 -0700 (PDT)
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
X-Inumbo-ID: a1144b85-e1e4-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=36+ek962W4ESiUtGpxVRYFAjd+VwVWl5kF1SkjDtZMw=;
        b=UgQWMNlwAFDSyhOYxlXAYkCIl2mc/sh4SXHL5oEpmTBjCaoAGPvuIVJY/EBVObhLpn
         Tz91Ti4l40qj4sNbS7uKLNC9gcnNRG5R+zImHy1Cp949Upag0/8ZrU1yI6qHOdzk3vmU
         SBeuB10CrxBpO3gRydMNeTXEZucGMbZc5K7F2E3UrLO8iOWDda/dE0Zo2p/9PLMv5/6z
         bzVRmmCN567UJ78Ejrskf3ZRMFAUDpCM/u7icHrzh0Z17zrP9xbdUmXisw6dKLBclYlu
         TX2X+ASp7cE/K5iM3qCQ/abc7GzGW8Qqm/ks1GR6NE3stV8bKbmnhKyh44hxwPl2+Hk7
         DpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=36+ek962W4ESiUtGpxVRYFAjd+VwVWl5kF1SkjDtZMw=;
        b=6IFT6cb7sK8777JgU2+Rs1CbrJBNDSipKkWcJi786o0ySnbRVyL8pzPdVEOb0JgS6d
         CzdwSEBaip0JfR1JFuwzSpsiV/9UzebkjQTaEU+0t2ayvN7Ms+zDxaS0Y+8U3yOGzny7
         DeCi6Nwc9cUIm2Lxip0mxntxa4lWGdooCZWsSAS7QI0za4wNhhKM2DgOle2+UGZuypvC
         4tnrgbnlFxwKhk4yVacZn+zXtAmfxwHrzdJ02At5F+76cuEThRSkRRchaYiQYZeZeVpk
         vaeEoz1D0gQoPPg17MktRSSMFx9qTRbf9RVq7jFrfFsnpBt3/d0ucLblKcXJF/xbRdKl
         IGag==
X-Gm-Message-State: AOAM531Nx6asBdAfvtZ3drG0YJNP97amD9zVmTZ/QrjdBJeIojU2TKgF
	ZsB43LsQua0/k2xXRVttnCA=
X-Google-Smtp-Source: ABdhPJxGZUdP2s4a2nDmTBCP5a2DzP2YjvJu5cPJlIPUmCxdTJANOqM8werYrhiWx0CWKbMBpK77Vw==
X-Received: by 2002:ad4:4ee5:0:b0:464:358b:4a00 with SMTP id dv5-20020ad44ee5000000b00464358b4a00mr21716379qvb.19.1654113260787;
        Wed, 01 Jun 2022 12:54:20 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Cc: Jason Andryuk <jandryuk@gmail.com>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] xen-blkfront: Handle NULL gendisk
Date: Wed,  1 Jun 2022 15:53:41 -0400
Message-Id: <20220601195341.28581-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When a VBD is not fully created and then closed, the kernel can have a
NULL pointer dereference:

The reproducer is trivial:

[user@dom0 ~]$ sudo xl block-attach work backend=sys-usb vdev=xvdi target=/dev/sdz
[user@dom0 ~]$ xl block-list work
Vdev  BE  handle state evt-ch ring-ref BE-path
51712 0   241    4     -1     -1       /local/domain/0/backend/vbd/241/51712
51728 0   241    4     -1     -1       /local/domain/0/backend/vbd/241/51728
51744 0   241    4     -1     -1       /local/domain/0/backend/vbd/241/51744
51760 0   241    4     -1     -1       /local/domain/0/backend/vbd/241/51760
51840 3   241    3     -1     -1       /local/domain/3/backend/vbd/241/51840
                 ^ note state, the /dev/sdz doesn't exist in the backend

[user@dom0 ~]$ sudo xl block-detach work xvdi
[user@dom0 ~]$ xl block-list work
Vdev  BE  handle state evt-ch ring-ref BE-path
work is an invalid domain identifier

And its console has:

BUG: kernel NULL pointer dereference, address: 0000000000000050
PGD 80000000edebb067 P4D 80000000edebb067 PUD edec2067 PMD 0
Oops: 0000 [#1] PREEMPT SMP PTI
CPU: 1 PID: 52 Comm: xenwatch Not tainted 5.16.18-2.43.fc32.qubes.x86_64 #1
RIP: 0010:blk_mq_stop_hw_queues+0x5/0x40
Code: 00 48 83 e0 fd 83 c3 01 48 89 85 a8 00 00 00 41 39 5c 24 50 77 c0 5b 5d 41 5c 41 5d c3 c3 0f 1f 80 00 00 00 00 0f 1f 44 00 00 <8b> 47 50 85 c0 74 32 41 54 49 89 fc 55 53 31 db 49 8b 44 24 48 48
RSP: 0018:ffffc90000bcfe98 EFLAGS: 00010293
RAX: ffffffffc0008370 RBX: 0000000000000005 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000005 RDI: 0000000000000000
RBP: ffff88800775f000 R08: 0000000000000001 R09: ffff888006e620b8
R10: ffff888006e620b0 R11: f000000000000000 R12: ffff8880bff39000
R13: ffff8880bff39000 R14: 0000000000000000 R15: ffff88800604be00
FS:  0000000000000000(0000) GS:ffff8880f3300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000050 CR3: 00000000e932e002 CR4: 00000000003706e0
Call Trace:
 <TASK>
 blkback_changed+0x95/0x137 [xen_blkfront]
 ? read_reply+0x160/0x160
 xenwatch_thread+0xc0/0x1a0
 ? do_wait_intr_irq+0xa0/0xa0
 kthread+0x16b/0x190
 ? set_kthread_struct+0x40/0x40
 ret_from_fork+0x22/0x30
 </TASK>
Modules linked in: snd_seq_dummy snd_hrtimer snd_seq snd_seq_device snd_timer snd soundcore ipt_REJECT nf_reject_ipv4 xt_state xt_conntrack nft_counter nft_chain_nat xt_MASQUERADE nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nft_compat nf_tables nfnetlink intel_rapl_msr intel_rapl_common crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel xen_netfront pcspkr xen_scsiback target_core_mod xen_netback xen_privcmd xen_gntdev xen_gntalloc xen_blkback xen_evtchn ipmi_devintf ipmi_msghandler fuse bpf_preload ip_tables overlay xen_blkfront
CR2: 0000000000000050
---[ end trace 7bc9597fd06ae89d ]---
RIP: 0010:blk_mq_stop_hw_queues+0x5/0x40
Code: 00 48 83 e0 fd 83 c3 01 48 89 85 a8 00 00 00 41 39 5c 24 50 77 c0 5b 5d 41 5c 41 5d c3 c3 0f 1f 80 00 00 00 00 0f 1f 44 00 00 <8b> 47 50 85 c0 74 32 41 54 49 89 fc 55 53 31 db 49 8b 44 24 48 48
RSP: 0018:ffffc90000bcfe98 EFLAGS: 00010293
RAX: ffffffffc0008370 RBX: 0000000000000005 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000005 RDI: 0000000000000000
RBP: ffff88800775f000 R08: 0000000000000001 R09: ffff888006e620b8
R10: ffff888006e620b0 R11: f000000000000000 R12: ffff8880bff39000
R13: ffff8880bff39000 R14: 0000000000000000 R15: ffff88800604be00
FS:  0000000000000000(0000) GS:ffff8880f3300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000050 CR3: 00000000e932e002 CR4: 00000000003706e0
Kernel panic - not syncing: Fatal exception
Kernel Offset: disabled

info->rq and info->gd are only set in blkfront_connect(), which is
called for state 4 (XenbusStateConnected).  Guard against using NULL
variables in blkfront_closing() to avoid the issue.

The rest of blkfront_closing looks okay.  If info->nr_rings is 0, then
for_each_rinfo won't do anything.

blkfront_remove also needs to check for non-NULL pointers before
cleaning up the gendisk and request queue.

Fixes: 05d69d950d9d "xen-blkfront: sanitize the removal state machine"
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 drivers/block/xen-blkfront.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 003056d4f7f5..966a6bf4c162 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -2137,9 +2137,11 @@ static void blkfront_closing(struct blkfront_info *info)
 		return;
 
 	/* No more blkif_request(). */
-	blk_mq_stop_hw_queues(info->rq);
-	blk_mark_disk_dead(info->gd);
-	set_capacity(info->gd, 0);
+	if (info->rq && info->gd) {
+		blk_mq_stop_hw_queues(info->rq);
+		blk_mark_disk_dead(info->gd);
+		set_capacity(info->gd, 0);
+	}
 
 	for_each_rinfo(info, rinfo, i) {
 		/* No more gnttab callback work. */
@@ -2480,16 +2482,19 @@ static int blkfront_remove(struct xenbus_device *xbdev)
 
 	dev_dbg(&xbdev->dev, "%s removed", xbdev->nodename);
 
-	del_gendisk(info->gd);
+	if (info->gd)
+		del_gendisk(info->gd);
 
 	mutex_lock(&blkfront_mutex);
 	list_del(&info->info_list);
 	mutex_unlock(&blkfront_mutex);
 
 	blkif_free(info, 0);
-	xlbd_release_minors(info->gd->first_minor, info->gd->minors);
-	blk_cleanup_disk(info->gd);
-	blk_mq_free_tag_set(&info->tag_set);
+	if (info->gd) {
+		xlbd_release_minors(info->gd->first_minor, info->gd->minors);
+		blk_cleanup_disk(info->gd);
+		blk_mq_free_tag_set(&info->tag_set);
+	}
 
 	kfree(info);
 	return 0;
-- 
2.36.1


