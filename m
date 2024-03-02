Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9230F86F10D
	for <lists+xen-devel@lfdr.de>; Sat,  2 Mar 2024 17:05:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687938.1071735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rgRqN-0003j1-Gs; Sat, 02 Mar 2024 16:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687938.1071735; Sat, 02 Mar 2024 16:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rgRqN-0003gd-DU; Sat, 02 Mar 2024 16:04:11 +0000
Received: by outflank-mailman (input) for mailman id 687938;
 Sat, 02 Mar 2024 16:04:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wWdj=KI=amazon.com=prvs=7849e407c=apanyaki@srs-se1.protection.inumbo.net>)
 id 1rgRqM-0003gX-2H
 for xen-devel@lists.xenproject.org; Sat, 02 Mar 2024 16:04:10 +0000
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f7911cc-d8ae-11ee-afd9-a90da7624cb6;
 Sat, 02 Mar 2024 17:04:08 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.6])
 by smtp-border-fw-6002.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 16:04:06 +0000
Received: from EX19MTAEUA001.ant.amazon.com [10.0.17.79:9101]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.23.38:2525]
 with esmtp (Farcaster)
 id 85a662c0-eb29-49e0-86cf-fb7cf493641c; Sat, 2 Mar 2024 16:04:04 +0000 (UTC)
Received: from EX19D026EUB004.ant.amazon.com (10.252.61.64) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sat, 2 Mar 2024 16:04:03 +0000
Received: from uc3ecf78c6baf56.ant.amazon.com (10.187.170.62) by
 EX19D026EUB004.ant.amazon.com (10.252.61.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sat, 2 Mar 2024 16:04:00 +0000
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
X-Inumbo-ID: 7f7911cc-d8ae-11ee-afd9-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1709395448; x=1740931448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mKU44kf1szj1NAugNFe0lwWcoXGVyPwTuTIS+BKG33o=;
  b=LAI2ESLhMMbWJLwGg3HWDgUm1iFnEgBd9D+18YkhEF7tUuQ7SCXvo86h
   LrAalFFxhDk9vyn65CKiHCkb34nuAobd35fxVJL8+MlmWT9UV/0LrG0v2
   4d8U++ZTjL/MPuJODiFldj/7eGxwzXuSRQJX6fA4DTN3IWk/lzGFJHtxP
   A=;
X-IronPort-AV: E=Sophos;i="6.06,199,1705363200"; 
   d="scan'208";a="390492001"
X-Farcaster-Flow-ID: 85a662c0-eb29-49e0-86cf-fb7cf493641c
Date: Sat, 2 Mar 2024 08:03:57 -0800
From: Andrew Panyakin <apanyaki@amazon.com>
To: <stable@vger.kernel.org>
CC: <apanyaki@amazon.com>, <boris.ostrovsky@oracle.com>, <jgross@suse.com>,
	<sstabellini@kernel.org>, <gregkh@linuxfoundation.org>,
	<oleksandr_tyshchenko@epam.com>, <jgrall@amazon.com>, <sashal@kernel.org>,
	<jeremy.fitzhardinge@citrix.com>, <konrad.wilk@oracle.com>,
	<xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>,
	<benh@amazon.com>, <mheyne@amazon.de>
Subject: [PATCH 5.10] xen/events: close evtchn after mapping cleanup
Message-ID: <20240302160357.GA2232656@uc3ecf78c6baf56.ant.amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-Originating-IP: [10.187.170.62]
X-ClientProxiedBy: EX19D045UWA003.ant.amazon.com (10.13.139.46) To
 EX19D026EUB004.ant.amazon.com (10.252.61.64)

From: Maximilian Heyne <mheyne@amazon.de>

Commit fa765c4b4aed2d64266b694520ecb025c862c5a9 upstream

shutdown_pirq and startup_pirq are not taking the
irq_mapping_update_lock because they can't due to lock inversion. Both
are called with the irq_desc->lock being taking. The lock order,
however, is first irq_mapping_update_lock and then irq_desc->lock.

This opens multiple races:
- shutdown_pirq can be interrupted by a function that allocates an event
  channel:

  CPU0                        CPU1
  shutdown_pirq {
    xen_evtchn_close(e)
                              __startup_pirq {
                                EVTCHNOP_bind_pirq
                                  -> returns just freed evtchn e
                                set_evtchn_to_irq(e, irq)
                              }
    xen_irq_info_cleanup() {
      set_evtchn_to_irq(e, -1)
    }
  }

  Assume here event channel e refers here to the same event channel
  number.
  After this race the evtchn_to_irq mapping for e is invalid (-1).

- __startup_pirq races with __unbind_from_irq in a similar way. Because
  __startup_pirq doesn't take irq_mapping_update_lock it can grab the
  evtchn that __unbind_from_irq is currently freeing and cleaning up. In
  this case even though the event channel is allocated, its mapping can
  be unset in evtchn_to_irq.

The fix is to first cleanup the mappings and then close the event
channel. In this way, when an event channel gets allocated it's
potential previous evtchn_to_irq mappings are guaranteed to be unset already.
This is also the reverse order of the allocation where first the event
channel is allocated and then the mappings are setup.

On a 5.10 kernel prior to commit 3fcdaf3d7634 ("xen/events: modify internal
[un]bind interfaces"), we hit a BUG like the following during probing of NVMe
devices. The issue is that during nvme_setup_io_queues, pci_free_irq
is called for every device which results in a call to shutdown_pirq.
With many nvme devices it's therefore likely to hit this race during
boot because there will be multiple calls to shutdown_pirq and
startup_pirq are running potentially in parallel.

  ------------[ cut here ]------------
  blkfront: xvda: barrier or flush: disabled; persistent grants: enabled; indirect descriptors: enabled; bounce buffer: enabled
  kernel BUG at drivers/xen/events/events_base.c:499!
  invalid opcode: 0000 [#1] SMP PTI
  CPU: 44 PID: 375 Comm: kworker/u257:23 Not tainted 5.10.201-191.748.amzn2.x86_64 #1
  Hardware name: Xen HVM domU, BIOS 4.11.amazon 08/24/2006
  Workqueue: nvme-reset-wq nvme_reset_work
  RIP: 0010:bind_evtchn_to_cpu+0xdf/0xf0
  Code: 5d 41 5e c3 cc cc cc cc 44 89 f7 e8 2b 55 ad ff 49 89 c5 48 85 c0 0f 84 64 ff ff ff 4c 8b 68 30 41 83 fe ff 0f 85 60 ff ff ff <0f> 0b 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 0f 1f 44 00 00
  RSP: 0000:ffffc9000d533b08 EFLAGS: 00010046
  RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000006
  RDX: 0000000000000028 RSI: 00000000ffffffff RDI: 00000000ffffffff
  RBP: ffff888107419680 R08: 0000000000000000 R09: ffffffff82d72b00
  R10: 0000000000000000 R11: 0000000000000000 R12: 00000000000001ed
  R13: 0000000000000000 R14: 00000000ffffffff R15: 0000000000000002
  FS:  0000000000000000(0000) GS:ffff88bc8b500000(0000) knlGS:0000000000000000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: 0000000000000000 CR3: 0000000002610001 CR4: 00000000001706e0
  DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
  DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
  Call Trace:
   ? show_trace_log_lvl+0x1c1/0x2d9
   ? show_trace_log_lvl+0x1c1/0x2d9
   ? set_affinity_irq+0xdc/0x1c0
   ? __die_body.cold+0x8/0xd
   ? die+0x2b/0x50
   ? do_trap+0x90/0x110
   ? bind_evtchn_to_cpu+0xdf/0xf0
   ? do_error_trap+0x65/0x80
   ? bind_evtchn_to_cpu+0xdf/0xf0
   ? exc_invalid_op+0x4e/0x70
   ? bind_evtchn_to_cpu+0xdf/0xf0
   ? asm_exc_invalid_op+0x12/0x20
   ? bind_evtchn_to_cpu+0xdf/0xf0
   ? bind_evtchn_to_cpu+0xc5/0xf0
   set_affinity_irq+0xdc/0x1c0
   irq_do_set_affinity+0x1d7/0x1f0
   irq_setup_affinity+0xd6/0x1a0
   irq_startup+0x8a/0xf0
   __setup_irq+0x639/0x6d0
   ? nvme_suspend+0x150/0x150
   request_threaded_irq+0x10c/0x180
   ? nvme_suspend+0x150/0x150
   pci_request_irq+0xa8/0xf0
   ? __blk_mq_free_request+0x74/0xa0
   queue_request_irq+0x6f/0x80
   nvme_create_queue+0x1af/0x200
   nvme_create_io_queues+0xbd/0xf0
   nvme_setup_io_queues+0x246/0x320
   ? nvme_irq_check+0x30/0x30
   nvme_reset_work+0x1c8/0x400
   process_one_work+0x1b0/0x350
   worker_thread+0x49/0x310
   ? process_one_work+0x350/0x350
   kthread+0x11b/0x140
   ? __kthread_bind_mask+0x60/0x60
   ret_from_fork+0x22/0x30
  Modules linked in:
  ---[ end trace a11715de1eee1873 ]---

Fixes: d46a78b05c0e ("xen: implement pirq type event channels")
Cc: stable@vger.kernel.org
Co-debugged-by: Andrew Panyakin <apanyaki@amazon.com>
Signed-off-by: Maximilian Heyne <mheyne@amazon.de>
[apanyaki: backport to v5.10-stable]
Signed-off-by: Andrew Paniakin <apanyaki@amazon.com>
---
Compare to upstream patch this one does not have close_evtchn flag
because there is no need to handle static event channels.
This feature was added only in 58f6259b7a08f ("xen/evtchn: Introduce new
IOCTL to bind static evtchn")

 drivers/xen/events/events_base.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index 24e39984914f..f608663bdfd5 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -885,8 +885,8 @@ static void shutdown_pirq(struct irq_data *data)
 		return;
 
 	do_mask(info, EVT_MASK_REASON_EXPLICIT);
-	xen_evtchn_close(evtchn);
 	xen_irq_info_cleanup(info);
+	xen_evtchn_close(evtchn);
 }
 
 static void enable_pirq(struct irq_data *data)
@@ -929,8 +929,6 @@ static void __unbind_from_irq(unsigned int irq)
 	if (VALID_EVTCHN(evtchn)) {
 		unsigned int cpu = cpu_from_irq(irq);
 
-		xen_evtchn_close(evtchn);
-
 		switch (type_from_irq(irq)) {
 		case IRQT_VIRQ:
 			per_cpu(virq_to_irq, cpu)[virq_from_irq(irq)] = -1;
@@ -943,6 +941,7 @@ static void __unbind_from_irq(unsigned int irq)
 		}
 
 		xen_irq_info_cleanup(info);
+		xen_evtchn_close(evtchn);
 	}
 
 	xen_free_irq(irq);
-- 
2.40.1

