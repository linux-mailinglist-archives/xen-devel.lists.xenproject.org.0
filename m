Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AED6323220
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 21:30:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89084.167552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEeJN-0007K3-3g; Tue, 23 Feb 2021 20:29:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89084.167552; Tue, 23 Feb 2021 20:29:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEeJN-0007Jg-06; Tue, 23 Feb 2021 20:29:37 +0000
Received: by outflank-mailman (input) for mailman id 89084;
 Tue, 23 Feb 2021 20:29:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjLX=HZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lEeJK-0007JV-W4
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 20:29:35 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0146f00-5eaf-492d-b3e2-6100393b9360;
 Tue, 23 Feb 2021 20:29:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3499C64E6B;
 Tue, 23 Feb 2021 20:29:33 +0000 (UTC)
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
X-Inumbo-ID: e0146f00-5eaf-492d-b3e2-6100393b9360
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614112173;
	bh=Msc8Jyit6uwbkwcqci0Of2uto8QfqsbsB2hqrjLdtX4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kylLrgZMEdOyJJ3VD9w2xM07vz4USwSKC59m8raSn7YnNnk8YynuF8qZkJ7MLz0x/
	 XiThQj4+RnW5fbHf3Fm2xE7ofVWfx69giSPNo2y3n8K8kRqpdm9ggCus62Oe1oxpgN
	 By6gRw2voDNihJmF6Kpis17yZVmmS3934XZiQ3L4z4r9uNBzfE/1Q+EB/e3x2YhrZF
	 apQudMAReTLct8JAtllpxlfo8Tj+soKJzRuY7JOs/tbRBtacnO8GFmjM9g/E2aGgQY
	 2cVAUNBlVOSyGH4gUR59w3PP3xcUPKv1qOiCtAxrpSTky2q0jKXce0G9v57OokH1SI
	 GNudjw0Ob3VLA==
Date: Tue, 23 Feb 2021 12:29:32 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com
cc: famzheng@amazon.com, sstabellini@kernel.org, cardoe@cardoe.com, wl@xen.org, 
    Bertrand.Marquis@arm.com, julien@xen.org, andrew.cooper3@citrix.com
Subject: Re: [RFC PATCH 00/10] Preemption in hypervisor (ARM only)
In-Reply-To: <161405394665.5977.17427402181939884734@c667a6b167f6>
Message-ID: <alpine.DEB.2.21.2102231228060.3234@sstabellini-ThinkPad-T480s>
References: <161405394665.5977.17427402181939884734@c667a6b167f6>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Volodymyr,

This looks like a genuine failure:

https://gitlab.com/xen-project/patchew/xen/-/jobs/1048475444


(XEN) Data Abort Trap. Syndrome=0x1930046
(XEN) Walking Hypervisor VA 0xf0008 on CPU0 via TTBR 0x0000000040545000
(XEN) 0TH[0x0] = 0x0000000040544f7f
(XEN) 1ST[0x0] = 0x0000000040541f7f
(XEN) 2ND[0x0] = 0x0000000000000000
(XEN) CPU0: Unexpected Trap: Data Abort
(XEN) ----[ Xen-4.15-unstable  arm64  debug=y  Tainted: U     ]----
(XEN) CPU:    0
(XEN) PC:     00000000002273b8 timer.c#remove_from_heap+0x2c/0x114
(XEN) LR:     0000000000227530
(XEN) SP:     000080003ff7f9a0
(XEN) CPSR:   800002c9 MODE:64-bit EL2h (Hypervisor, handler)
(XEN)      X0: 000080000234e6a0  X1: 0000000000000001  X2: 0000000000000000
(XEN)      X3: 00000000000f0000  X4: 0000000000000000  X5: 00000000014d014d
(XEN)      X6: 0000000000000080  X7: fefefefefefeff09  X8: 7f7f7f7f7f7f7f7f
(XEN)      X9: 717164616f726051 X10: 7f7f7f7f7f7f7f7f X11: 0101010101010101
(XEN)     X12: 0000000000000008 X13: 0000000000000001 X14: 000080003ff7fa78
(XEN)     X15: 0000000000000020 X16: 000000000028e558 X17: 0000000000000000
(XEN)     X18: 00000000fffffffe X19: 0000000000000001 X20: 0000000000310180
(XEN)     X21: 00000000000002c0 X22: 0000000000000000 X23: 0000000000346008
(XEN)     X24: 0000000000310180 X25: 0000000000000000 X26: 00008000044e91b8
(XEN)     X27: 000000000000ffff X28: 0000000041570018  FP: 000080003ff7f9a0
(XEN) 
(XEN)   VTCR_EL2: 80043594
(XEN)  VTTBR_EL2: 000200007ffe3000
(XEN) 
(XEN)  SCTLR_EL2: 30cd183d
(XEN)    HCR_EL2: 00000000807c663f
(XEN)  TTBR0_EL2: 0000000040545000
(XEN) 
(XEN)    ESR_EL2: 97930046
(XEN)  HPFAR_EL2: 0000000000030010
(XEN)    FAR_EL2: 00000000000f0008
(XEN) 
(XEN) Xen stack trace from sp=000080003ff7f9a0:
(XEN)    000080003ff7f9c0 0000000000227530 00008000044e9190 00000000002280dc
(XEN)    000080003ff7f9e0 0000000000228234 00008000044e9190 000000000024dd04
(XEN)    000080003ff7fa40 000000000024a414 0000000000311390 000080000234e430
(XEN)    0000800002345000 0000000000000000 0000000000346008 00008000044e9150
(XEN)    0000000000000001 0000000000000000 0000000000000240 0000000000270474
(XEN)    000080003ff7faa0 000000000024b91c 0000000000000001 0000000000310238
(XEN)    000080003ff7fbf8 0000000080000249 0000000093860047 00000000002a1de0
(XEN)    000080003ff7fc88 00000000002a1de0 00000000000002c0 00008000044e9470
(XEN)    000080003ff7fab0 00000000002217b4 000080003ff7fad0 000000000027a8c0
(XEN)    0000000000311324 00000000002a1de0 000080003ff7fc00 0000000000265310
(XEN)    0000000000000000 00000000002263d8 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000020
(XEN)    0000000000000080 fefefefefefeff09 7f7f7f7f7f7f7f7f 717164616f726051
(XEN)    7f7f7f7f7f7f7f7f 0101010101010101 0000000000000008 0000000000000001
(XEN)    000080003ff7fa78 0000000000000020 000000000028e558 0000000000000000
(XEN)    00000000fffffffe 0000000000000000 0000000000310238 000000000000000a
(XEN)    0000000000310238 00000000002a64b0 00000000002a1de0 000080003ff7fc88
(XEN)    0000000000000000 0000000000000240 0000000041570018 000080003ff7fc00
(XEN)    000000000024c8c0 000080003ff7fc00 000000000024c8c4 9386004780000249
(XEN)    000080003ff7fc90 000000000024c974 0000000000000384 0000000000000002
(XEN)    0000800002345000 00000000ffffffff 0000000000000006 000080003ff7fe20
(XEN)    0000000000000001 000080003ff7fe00 000080003ffe4a60 000080000234e430
(XEN)    000080003ff7fd20 000080003ff7fd20 000080003ff7fce0 00000000ffffffc8
(XEN)    000080003ff7fce0 000000000031a147 000080003ff7fd20 000000000027f7b8
(XEN)    000080003ff7fd20 000080003ff7fd20 000080003ff7fce0 00000000ffffffc8
(XEN)    000080003ff7fd20 000080003ff7fd20 000080003ff7fce0 00000000ffffffc8
(XEN)    0000000000000240 0000800002345000 00000000ffffffff 0000000000000004
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000022
(XEN)    000080003ff7fda0 000000000026ff2c 000000000027f608 0000000000000000
(XEN)    0000000000000093 0000800002345000 0000000000000000 000080003ffe4a60
(XEN)    0000000000000001 000080003ff7fe00 000080003ffe4a60 0000000041570018
(XEN)    000080003ff7fda0 000000000026fee0 000080003ff7fda0 000000000026ff18
(XEN)    000080003ff7fe30 0000000000279b2c 0000000093860047 0000000000000090
(XEN)    0000000003001384 000080003ff7feb0 ffff800011dc1384 ffff8000104b06a0
(XEN)    ffff8000104b0240 ffff00000df806e8 0000000000000000 ffff800011b0ca88
(XEN)    0000000003001384 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000093860047 0000000003001384 000080003ff7fe70 000000000027a180
(XEN)    000080003ff7feb0 0000000093860047 0000000093860047 0000000060000085
(XEN)    0000000093860047 ffff800011b0ca88 ffff800011b03d90 0000000000265458
(XEN)    0000000000000000 ffff800011b0ca88 000080003ff7ffb8 000000000026545c
(XEN) Xen call trace:
(XEN)    [<00000000002273b8>] timer.c#remove_from_heap+0x2c/0x114 (PC)
(XEN)    [<0000000000227530>] timer.c#remove_entry+0x90/0xa0 (LR)
(XEN)    [<0000000000227530>] timer.c#remove_entry+0x90/0xa0
(XEN)    [<0000000000228234>] stop_timer+0x1fc/0x254
(XEN)    [<000000000024a414>] core.c#schedule+0xf4/0x380
(XEN)    [<000000000024b91c>] wait+0xc/0x14
(XEN)    [<00000000002217b4>] try_preempt+0x88/0xbc
(XEN)    [<000000000027a8c0>] do_trap_irq+0x5c/0x60
(XEN)    [<0000000000265310>] entry.o#hyp_irq+0x7c/0x80
(XEN)    [<000000000024c974>] printk+0x68/0x70
(XEN)    [<000000000027f7b8>] vgic-v2.c#vgic_v2_distr_mmio_write+0x1b0/0x7ac
(XEN)    [<000000000026ff2c>] try_handle_mmio+0x1ac/0x27c
(XEN)    [<0000000000279b2c>] traps.c#do_trap_stage2_abort_guest+0x18c/0x2d8
(XEN)    [<000000000027a180>] do_trap_guest_sync+0x10c/0x63c
(XEN)    [<0000000000265458>] entry.o#guest_sync_slowpath+0xa4/0xd4
(XEN) 
(XEN) 
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) CPU0: Unexpected Trap: Data Abort
(XEN) ****************************************


On Mon, 22 Feb 2021, no-reply@patchew.org wrote:
> Hi,
> 
> Patchew automatically ran gitlab-ci pipeline with this patch (series) applied, but the job failed. Maybe there's a bug in the patches?
> 
> You can find the link to the pipeline near the end of the report below:
> 
> Type: series
> Message-id: 20210223023428.757694-1-volodymyr_babchuk@epam.com
> Subject: [RFC PATCH 00/10] Preemption in hypervisor (ARM only)
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> sleep 10
> patchew gitlab-pipeline-check -p xen-project/patchew/xen
> === TEST SCRIPT END ===
> 
> warning: redirecting to https://gitlab.com/xen-project/patchew/xen.git/
> warning: redirecting to https://gitlab.com/xen-project/patchew/xen.git/
> From https://gitlab.com/xen-project/patchew/xen
>  * [new tag]               patchew/20210223023428.757694-1-volodymyr_babchuk@epam.com -> patchew/20210223023428.757694-1-volodymyr_babchuk@epam.com
> Switched to a new branch 'test'
> a569959cc0 alloc pages: enable preemption early
> c943c35519 arm: traps: try to preempt before leaving IRQ handler
> 4b634d1924 arm: context_switch: allow to run with IRQs already disabled
> 7d78d6e861 sched: core: remove ASSERT_NOT_IN_ATOMIC and disable preemption[!]
> d56302eb03 arm: setup: disable preemption during startup
> 18a52ab80a preempt: add try_preempt() function
> 9c4a07d0fa preempt: use atomic_t to for preempt_count
> 904e59f28e sched: credit2: save IRQ state during locking
> 3e3726692c sched: rt: save IRQ state during locking
> c552842efc sched: core: save IRQ state during locking
> 
> === OUTPUT BEGIN ===
> [2021-02-23 02:38:00] Looking up pipeline...
> [2021-02-23 02:38:01] Found pipeline 260183774:
> 
> https://gitlab.com/xen-project/patchew/xen/-/pipelines/260183774
> 
> [2021-02-23 02:38:01] Waiting for pipeline to finish...
> [2021-02-23 02:53:10] Still waiting...
> [2021-02-23 03:08:19] Still waiting...
> [2021-02-23 03:23:29] Still waiting...
> [2021-02-23 03:38:38] Still waiting...
> [2021-02-23 03:53:48] Still waiting...
> [2021-02-23 04:08:57] Still waiting...
> [2021-02-23 04:19:05] Pipeline failed
> [2021-02-23 04:19:06] Job 'qemu-smoke-x86-64-clang-pvh' in stage 'test' is failed
> [2021-02-23 04:19:06] Job 'qemu-smoke-x86-64-gcc-pvh' in stage 'test' is failed
> [2021-02-23 04:19:06] Job 'qemu-smoke-x86-64-clang' in stage 'test' is failed
> [2021-02-23 04:19:06] Job 'qemu-smoke-x86-64-gcc' in stage 'test' is failed
> [2021-02-23 04:19:06] Job 'qemu-smoke-arm64-gcc' in stage 'test' is failed
> [2021-02-23 04:19:06] Job 'qemu-alpine-arm64-gcc' in stage 'test' is failed
> [2021-02-23 04:19:06] Job 'alpine-3.12-clang-debug' in stage 'build' is failed
> [2021-02-23 04:19:06] Job 'alpine-3.12-clang' in stage 'build' is failed
> [2021-02-23 04:19:06] Job 'alpine-3.12-gcc-debug' in stage 'build' is failed
> [2021-02-23 04:19:06] Job 'alpine-3.12-gcc' in stage 'build' is failed
> === OUTPUT END ===
> 
> Test command exited with code: 1

