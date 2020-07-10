Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B2F21AECF
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2020 07:38:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtliO-000255-9C; Fri, 10 Jul 2020 05:36:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AY6w=AV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jtliM-000250-JO
 for xen-devel@lists.xen.org; Fri, 10 Jul 2020 05:36:50 +0000
X-Inumbo-ID: 59c58c04-c26f-11ea-8f5d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59c58c04-c26f-11ea-8f5d-12813bfff9fa;
 Fri, 10 Jul 2020 05:36:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C656CAEC6;
 Fri, 10 Jul 2020 05:36:48 +0000 (UTC)
Subject: Re: Linux 5.4.46: BUG: sleeping function called from invalid context
 at drivers/xen/preempt.c:37
To: Sarah Newman <srn@prgmr.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
References: <1a98b431-4112-3962-f7f4-7a335ef33cb6@prgmr.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <922baa3b-5201-fa5f-e46a-e33b0b4f2ce0@suse.com>
Date: Fri, 10 Jul 2020 07:36:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1a98b431-4112-3962-f7f4-7a335ef33cb6@prgmr.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 10.07.20 03:38, Sarah Newman wrote:
> BUG: sleeping function called from invalid context at 
> drivers/xen/preempt.c:37
> in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 20775, name: xl
> INFO: lockdep is turned off.
> CPU: 1 PID: 20775 Comm: xl Tainted: G      D W         
> 5.4.46-1_prgmr_debug.el7.x86_64 #1
> Call Trace:
> <IRQ>
> dump_stack+0x8f/0xd0
> ___might_sleep.cold.76+0xb2/0x103
> xen_maybe_preempt_hcall+0x48/0x70
> xen_do_hypervisor_callback+0x37/0x40
> RIP: e030:xen_hypercall_xen_version+0xa/0x20
> Code: 51 41 53 b8 10 00 00 00 0f 05 41 5b 59 c3 cc cc cc cc cc cc cc cc 
> cc cc cc cc cc cc cc cc cc cc 51 41 53 b8 11 00 00 00 0f 05 <41> 5b 59 
> c3 cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc
> RSP: e02b:ffffc900400dcc30 EFLAGS: 00000246
> RAX: 000000000004000d RBX: 0000000000000200 RCX: ffffffff8100122a
> RDX: ffff88812e788000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: ffffffff83ee3ad0 R08: 0000000000000001 R09: 0000000000000001
> R10: 0000000000000000 R11: 0000000000000246 R12: ffff8881824aa0b0
> R13: 0000000865496000 R14: 0000000865496000 R15: ffff88815d040000
> ? xen_hypercall_xen_version+0xa/0x20
> ? xen_force_evtchn_callback+0x9/0x10
> ? check_events+0x12/0x20
> ? xen_restore_fl_direct+0x1f/0x20
> ? _raw_spin_unlock_irqrestore+0x53/0x60
> ? debug_dma_sync_single_for_cpu+0x91/0xc0
> ? _raw_spin_unlock_irqrestore+0x53/0x60
> ? xen_swiotlb_sync_single_for_cpu+0x3d/0x140
> ? mlx4_en_process_rx_cq+0x6b6/0x1110 [mlx4_en]
> ? mlx4_en_poll_rx_cq+0x64/0x100 [mlx4_en]
> ? net_rx_action+0x151/0x4a0
> ? __do_softirq+0xed/0x55b
> ? irq_exit+0xea/0x100
> ? xen_evtchn_do_upcall+0x2c/0x40
> ? xen_do_hypervisor_callback+0x29/0x40
> </IRQ>
> ? xen_hypercall_domctl+0xa/0x20
> ? xen_hypercall_domctl+0x8/0x20
> ? privcmd_ioctl+0x221/0x990 [xen_privcmd]
> ? do_vfs_ioctl+0xa5/0x6f0
> ? ksys_ioctl+0x60/0x90
> ? trace_hardirqs_off_thunk+0x1a/0x20
> ? __x64_sys_ioctl+0x16/0x20
> ? do_syscall_64+0x62/0x250
> ? entry_SYSCALL_64_after_hwframe+0x49/0xbe
> 

Sarah, thank you very much for this bug report! I think with your help
I finally found a bug I've been searching for a very long time.

The problem will happen when a preemptible hypercall is interrupted and
a softirq action is triggered issuing further hypercalls and one of
those is preempted, too.

In Linux 5.8 this problem will no longer occur due to the entry code
rework done by Thomas Gleixner. For kernels up to 5.7 I'll write a patch
hopefully repairing this hard to reproduce problem, which IMO more often
will show up with a WARN() splat only in xen_mc_flush().


Juergen

