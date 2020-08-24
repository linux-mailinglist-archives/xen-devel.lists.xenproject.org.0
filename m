Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8774C24F3DE
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 10:22:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kA7kh-0006eI-Vv; Mon, 24 Aug 2020 08:22:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HY0O=CC=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1kA7kf-0006du-W7
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 08:22:50 +0000
X-Inumbo-ID: 648aca34-9af7-43d9-b82c-bf227505e674
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 648aca34-9af7-43d9-b82c-bf227505e674;
 Mon, 24 Aug 2020 08:22:49 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4143B2074D;
 Mon, 24 Aug 2020 08:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598257368;
 bh=jx7+9laUMnnGvjrX6K6tgeWuhIkf9M8zxUc2K80BkOU=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=1z3h1i5Z+LSHGt89bO0be7pO/ETNijvp83Kt+5pPZGBuQmugpUCMyOaXfJMGvDVYs
 9KVYpNaQMxwIFIDohL+IRIFUUenmQk0RbtsrDAcJYdYCjTt7dfSa3L5Kb280M6W4GW
 Pr73SmwhbXkaG+t1HDXvaJrROKw9w3NEJz0USZyU=
Subject: Patch "xen: don't reschedule in preemption off sections" has been
 added to the 4.19-stable tree
To: boris.ostrovsky@oracle.com, cmb@prgmr.com, gregkh@linuxfoundation.org,
 jgross@suse.com, srn@prgmr.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 24 Aug 2020 10:23:00 +0200
In-Reply-To: <20200820065908.20592-1-jgross@suse.com>
Message-ID: <1598257380204219@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


This is a note to let you know that I've just added the patch titled

    xen: don't reschedule in preemption off sections

to the 4.19-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     xen-don-t-reschedule-in-preemption-off-sections.patch
and it can be found in the queue-4.19 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From jgross@suse.com  Mon Aug 24 10:12:00 2020
From: Juergen Gross <jgross@suse.com>
Date: Thu, 20 Aug 2020 08:59:08 +0200
Subject: xen: don't reschedule in preemption off sections
To: stable@vger.kernel.org
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Sarah Newman <srn@prgmr.com>, Chris Brannon <cmb@prgmr.com>
Message-ID: <20200820065908.20592-1-jgross@suse.com>

From: Juergen Gross <jgross@suse.com>

For support of long running hypercalls xen_maybe_preempt_hcall() is
calling cond_resched() in case a hypercall marked as preemptible has
been interrupted.

Normally this is no problem, as only hypercalls done via some ioctl()s
are marked to be preemptible. In rare cases when during such a
preemptible hypercall an interrupt occurs and any softirq action is
started from irq_exit(), a further hypercall issued by the softirq
handler will be regarded to be preemptible, too. This might lead to
rescheduling in spite of the softirq handler potentially having set
preempt_disable(), leading to splats like:

BUG: sleeping function called from invalid context at drivers/xen/preempt.c:37
in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 20775, name: xl
INFO: lockdep is turned off.
CPU: 1 PID: 20775 Comm: xl Tainted: G D W 5.4.46-1_prgmr_debug.el7.x86_64 #1
Call Trace:
<IRQ>
dump_stack+0x8f/0xd0
___might_sleep.cold.76+0xb2/0x103
xen_maybe_preempt_hcall+0x48/0x70
xen_do_hypervisor_callback+0x37/0x40
RIP: e030:xen_hypercall_xen_version+0xa/0x20
Code: ...
RSP: e02b:ffffc900400dcc30 EFLAGS: 00000246
RAX: 000000000004000d RBX: 0000000000000200 RCX: ffffffff8100122a
RDX: ffff88812e788000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffffff83ee3ad0 R08: 0000000000000001 R09: 0000000000000001
R10: 0000000000000000 R11: 0000000000000246 R12: ffff8881824aa0b0
R13: 0000000865496000 R14: 0000000865496000 R15: ffff88815d040000
? xen_hypercall_xen_version+0xa/0x20
? xen_force_evtchn_callback+0x9/0x10
? check_events+0x12/0x20
? xen_restore_fl_direct+0x1f/0x20
? _raw_spin_unlock_irqrestore+0x53/0x60
? debug_dma_sync_single_for_cpu+0x91/0xc0
? _raw_spin_unlock_irqrestore+0x53/0x60
? xen_swiotlb_sync_single_for_cpu+0x3d/0x140
? mlx4_en_process_rx_cq+0x6b6/0x1110 [mlx4_en]
? mlx4_en_poll_rx_cq+0x64/0x100 [mlx4_en]
? net_rx_action+0x151/0x4a0
? __do_softirq+0xed/0x55b
? irq_exit+0xea/0x100
? xen_evtchn_do_upcall+0x2c/0x40
? xen_do_hypervisor_callback+0x29/0x40
</IRQ>
? xen_hypercall_domctl+0xa/0x20
? xen_hypercall_domctl+0x8/0x20
? privcmd_ioctl+0x221/0x990 [xen_privcmd]
? do_vfs_ioctl+0xa5/0x6f0
? ksys_ioctl+0x60/0x90
? trace_hardirqs_off_thunk+0x1a/0x20
? __x64_sys_ioctl+0x16/0x20
? do_syscall_64+0x62/0x250
? entry_SYSCALL_64_after_hwframe+0x49/0xbe

Fix that by testing preempt_count() before calling cond_resched().

In kernel 5.8 this can't happen any more due to the entry code rework
(more than 100 patches, so not a candidate for backporting).

The issue was introduced in kernel 4.3, so this patch should go into
all stable kernels in [4.3 ... 5.7].

Reported-by: Sarah Newman <srn@prgmr.com>
Fixes: 0fa2f5cb2b0ecd8 ("sched/preempt, xen: Use need_resched() instead of should_resched()")
Cc: Sarah Newman <srn@prgmr.com>
Cc: stable@vger.kernel.org
Signed-off-by: Juergen Gross <jgross@suse.com>
Tested-by: Chris Brannon <cmb@prgmr.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/xen/preempt.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/xen/preempt.c
+++ b/drivers/xen/preempt.c
@@ -31,7 +31,7 @@ EXPORT_SYMBOL_GPL(xen_in_preemptible_hca
 asmlinkage __visible void xen_maybe_preempt_hcall(void)
 {
 	if (unlikely(__this_cpu_read(xen_in_preemptible_hcall)
-		     && need_resched())) {
+		     && need_resched() && !preempt_count())) {
 		/*
 		 * Clear flag as we may be rescheduled on a different
 		 * cpu.


Patches currently in stable-queue which might be from jgross@suse.com are

queue-4.19/fix-build-error-when-config_acpi-is-not-set-enabled.patch
queue-4.19/xen-don-t-reschedule-in-preemption-off-sections.patch
queue-4.19/efi-avoid-error-message-when-booting-under-xen.patch

