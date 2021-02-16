Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4EE31D19F
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 21:34:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86045.161126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC73W-0001sW-T7; Tue, 16 Feb 2021 20:34:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86045.161126; Tue, 16 Feb 2021 20:34:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC73W-0001s7-QA; Tue, 16 Feb 2021 20:34:46 +0000
Received: by outflank-mailman (input) for mailman id 86045;
 Tue, 16 Feb 2021 20:34:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QcaE=HS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lC73W-0001s1-2o
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 20:34:46 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81bf7c56-8467-40c8-a8ed-72d5ad0433c9;
 Tue, 16 Feb 2021 20:34:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9DD3464EBD;
 Tue, 16 Feb 2021 20:34:44 +0000 (UTC)
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
X-Inumbo-ID: 81bf7c56-8467-40c8-a8ed-72d5ad0433c9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613507684;
	bh=nmjR6xz7JkrX1qcxgA69YTQHoKWl2Gx1LS3y140JtE8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CYsQiWe6uj8Q0mXeezJZYj3fEbl4/UsslbpKDx0L79GjjPUllmkKdPTrRwWX7HwN+
	 WoGRXaDG+OItKvPdXhUFijWvtaA7y7DH4LchV4HKka2od4UVQf0ZasqPHLgsk8k2G5
	 9cyEMricyk4dm6sXzJx5mr6szBdD/8czvbKcq4EN5wD2VwbLuPKpy/xD0ULPs3PDtd
	 sr2Ur4tZM775nFniPWDgLY77Pzp0uay13zxPrbDYUrcmqJnUMd6+/kTl6mp4xVhvTa
	 EwHbCjvPGSlE2qjCB6OanT6Zc9JbQn9F6eY1RqFQs+F0sJdvJwqXhQY/lPfsSBLpUk
	 EEMbd53nxtx3g==
Date: Tue, 16 Feb 2021 12:34:43 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Roman Shaposhnik <roman@zededa.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, jbeulich@suse.com, 
    andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org, 
    george.dunlap@citrix.com, sstabellini@kernel.org
Subject: Re: Linux DomU freezes and dies under heavy memory shuffling
In-Reply-To: <CAMmSBy-_UOK6DTrwGNOw8Y59Muv8H8wxmsc4-BXcv3N_u5USBA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2102161232310.3234@sstabellini-ThinkPad-T480s>
References: <CAMmSBy-_UOK6DTrwGNOw8Y59Muv8H8wxmsc4-BXcv3N_u5USBA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+ x86 maintainers

It looks like the tlbflush is getting stuck?


On Sat, 6 Feb 2021, Roman Shaposhnik wrote:
> Hi!
> 
> all of a sudden (but only after a few days of running normally), on a stock
> Ubuntu 18.04 (Bionic with 4.15.0 kernel) DomU I'm seeing Microsoft's .net
> runtime go into a heave GC cycle and then freeze and die like what is
> shown below. This is under stock Xen 4.14.0 on a pretty unremarkable
> x86_64 box made by Supermicro.
> 
> I would really appreciate any thoughts on the subject or at least directions
> in which I should go to investigate this. At this point -- this part
> of Xen is a
> bit of a mystery to me -- but I'm very much willing to learn ;-)
> 
> >From my completely uneducated guess it feels like some kind of an issue
> between DomU shuffling memory much more than normal and Xen somehow
> getting unhappy about that:
> 
> [376900.874560] watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [dotnet:3518]
> [376900.874764] Kernel panic - not syncing: softlockup: hung tasks
> [376900.874793] CPU: 0 PID: 3518 Comm: dotnet Tainted: G L
> 4.15.0-112-generic #113-Ubuntu
> [376900.874824] Hardware name: Xen HVM domU, BIOS 4.14.0 12/15/2020
> [376900.874847] Call Trace:
> [376900.874860] <IRQ>
> [376900.874874] dump_stack+0x6d/0x8e
> [376900.874892] panic+0xe4/0x254
> [376900.874911] watchdog_timer_fn+0x21e/0x230
> [376900.874928] ? watchdog+0x30/0x30
> [376900.874947] __hrtimer_run_queues+0xdf/0x230
> [376900.874970] hrtimer_interrupt+0xa0/0x1d0
> [376900.874989] xen_timer_interrupt+0x20/0x30
> [376900.875008] __handle_irq_event_percpu+0x44/0x1a0
> [376900.875031] handle_irq_event_percpu+0x32/0x80
> [376900.875053] handle_percpu_irq+0x3d/0x60
> [376900.875071] generic_handle_irq+0x28/0x40
> [376900.875090] __evtchn_fifo_handle_events+0x172/0x190
> [376900.875112] evtchn_fifo_handle_events+0x10/0x20
> [376900.875133] __xen_evtchn_do_upcall+0x49/0x80
> [376900.875156] xen_evtchn_do_upcall+0x2b/0x50
> [376900.875177] xen_hvm_callback_vector+0x90/0xa0
> [376900.875197] </IRQ>
> [376900.875211] RIP: 0010:smp_call_function_single+0xdc/0x100
> [376900.875230] RSP: 0018:ffffaaa3c1807c20 EFLAGS: 00000202 ORIG_RAX:
> ffffffffffffff0c
> [376900.875261] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
> 0000000000000000
> [376900.875288] RDX: 0000000000000001 RSI: 0000000000000003 RDI:
> 0000000000000003
> [376900.875314] RBP: ffffaaa3c1807c70 R08: fffffffffffffffc R09:
> 0000000000000002
> [376900.875341] R10: 0000000000000040 R11: 0000000000000000 R12:
> ffff8e0ab2c1de70
> [376900.875368] R13: 0000000000000000 R14: ffffffff95a7ecd0 R15:
> ffffaaa3c1807d08
> [376900.875396] ? flush_tlb_func_common.constprop.10+0x230/0x230
> [376900.875424] ? flush_tlb_func_common.constprop.10+0x230/0x230
> [376900.875449] ? unmap_page_range+0xbbc/0xd00
> [376900.875470] smp_call_function_many+0x1cc/0x250
> [376900.875491] ? smp_call_function_many+0x1cc/0x250
> [376900.875513] native_flush_tlb_others+0x3c/0xf0
> [376900.875534] flush_tlb_mm_range+0xae/0x110
> [376900.875552] tlb_flush_mmu_tlbonly+0x5f/0xc0
> [376900.875574] arch_tlb_finish_mmu+0x3f/0x80
> [376900.875592] tlb_finish_mmu+0x23/0x30
> [376900.875610] unmap_region+0xf7/0x130
> [376900.875629] do_munmap+0x276/0x450
> [376900.875647] vm_munmap+0x69/0xb0
> [376900.875664] SyS_munmap+0x22/0x30
> [376900.875682] do_syscall_64+0x73/0x130
> [376900.875701] entry_SYSCALL_64_after_hwframe+0x41/0xa6
> [376900.875721] RIP: 0033:0x7f05ad52dd59
> [376900.875737] RSP: 002b:00007f05a8037150 EFLAGS: 00000246 ORIG_RAX:
> 000000000000000b
> [376900.875765] RAX: ffffffffffffffda RBX: 000056517e2a08c0 RCX:
> 00007f05ad52dd59
> [376900.875791] RDX: 0000000000000000 RSI: 0000000000006a00 RDI:
> 00007f05aad8f000
> [376900.875818] RBP: 0000000000006a00 R08: 0000000000020b18 R09:
> 0000000000000000
> [376900.875844] R10: 0000000000020ad0 R11: 0000000000000246 R12:
> 0000000000000001
> [376900.875870] R13: 0000000000000000 R14: 000056517eb02300 R15:
> 00007f05aad8f000
> 
> Thanks,
> Roman.
> 

