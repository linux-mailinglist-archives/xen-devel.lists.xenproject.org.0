Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF2E21AC8A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2020 03:40:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jthzw-000787-PU; Fri, 10 Jul 2020 01:38:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8UDJ=AV=prgmr.com=srn@srs-us1.protection.inumbo.net>)
 id 1jthzv-000782-NZ
 for xen-devel@lists.xen.org; Fri, 10 Jul 2020 01:38:43 +0000
X-Inumbo-ID: 161f2742-c24e-11ea-b7bb-bc764e2007e4
Received: from mail.prgmr.com (unknown [2605:2700:0:5::4713:9506])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 161f2742-c24e-11ea-b7bb-bc764e2007e4;
 Fri, 10 Jul 2020 01:38:42 +0000 (UTC)
Received: from [192.168.2.47] (c-174-62-72-237.hsd1.ca.comcast.net
 [174.62.72.237]) (Authenticated sender: srn)
 by mail.prgmr.com (Postfix) with ESMTPSA id C2BEB720128
 for <xen-devel@lists.xen.org>; Thu,  9 Jul 2020 21:38:41 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.prgmr.com C2BEB720128
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prgmr.com;
 s=default; t=1594345121;
 bh=Zuofq26+UDaoVOyGqVyCpbefTyYVsjzLJ7mlHBwxUr4=;
 h=To:From:Subject:Date:From;
 b=SI/8kIqW51KVfwP4oi89MxiSVnyKVkm3200FVKzWF0ncXv3bnbGCqXrwaFrPEMxX6
 wO+MakTfHYnGovYcUyUsb2SD7dHZwBzr3rIxDlvS8LcYkO92Tq/BY7pslZR0llghkO
 9XSE5qZ2ZVPpeI27d7CIy4/33nsEUk2i5hV/FMlc=
To: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
From: Sarah Newman <srn@prgmr.com>
Subject: Linux 5.4.46: BUG: sleeping function called from invalid context at
 drivers/xen/preempt.c:37
Message-ID: <1a98b431-4112-3962-f7f4-7a335ef33cb6@prgmr.com>
Date: Thu, 9 Jul 2020 18:38:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

BUG: sleeping function called from invalid context at drivers/xen/preempt.c:37
in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 20775, name: xl
INFO: lockdep is turned off.
CPU: 1 PID: 20775 Comm: xl Tainted: G      D W         5.4.46-1_prgmr_debug.el7.x86_64 #1
Call Trace:
<IRQ>
dump_stack+0x8f/0xd0
___might_sleep.cold.76+0xb2/0x103
xen_maybe_preempt_hcall+0x48/0x70
xen_do_hypervisor_callback+0x37/0x40
RIP: e030:xen_hypercall_xen_version+0xa/0x20
Code: 51 41 53 b8 10 00 00 00 0f 05 41 5b 59 c3 cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc 51 41 53 b8 11 00 00 00 0f 05 <41> 5b 59 c3 cc 
cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc
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

