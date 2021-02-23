Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC2B322764
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 10:03:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88637.166762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lETaO-0002p1-0X; Tue, 23 Feb 2021 09:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88637.166762; Tue, 23 Feb 2021 09:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lETaN-0002oc-TP; Tue, 23 Feb 2021 09:02:27 +0000
Received: by outflank-mailman (input) for mailman id 88637;
 Tue, 23 Feb 2021 09:02:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lETaM-0002oX-S8
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 09:02:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lETaI-0007Vh-6n; Tue, 23 Feb 2021 09:02:22 +0000
Received: from [54.239.6.190] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lETaH-0000hi-Pt; Tue, 23 Feb 2021 09:02:22 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=V+qic+6jyXXaqGoQ+mw274Kr/RppVX/x0MgjnLPN3Eo=; b=MS0ShGycXYLzbefrg0ftQIUVVT
	qDYmYcTNvix1Oxy2r0XhFM9x2Bu/zZcuohv0IMfkfpjjPiCLwDY0DQUbXhWA9zHBUFdiTQcDbkIXS
	EYLWQGlfnoh6Jhl0/csUMiYGfhJHsANbkWvKQkSibW6mKX0HzkvyOcc+GOeDAsJyiFks=;
Subject: Re: [RFC PATCH 00/10] Preemption in hypervisor (ARM only)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210223023428.757694-1-volodymyr_babchuk@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e6d8726c-4074-fe4c-dbbe-e879da2bb7f6@xen.org>
Date: Tue, 23 Feb 2021 09:02:19 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210223023428.757694-1-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 23/02/2021 02:34, Volodymyr Babchuk wrote:
> Hello community,

Hi Volodymyr,

Thank you for the proposal, I like the like of been able to preempt the 
vCPU thread. This would make easier to implement some of the device 
emulation in Xen (e.g. vGIC, SMMU).

> 
> Subject of this cover letter is quite self-explanatory. This patch
> series implements PoC for preemption in hypervisor mode.
> 
> This is the sort of follow-up to recent discussion about latency
> ([1]).
> 
> Motivation
> ==========
> 
> It is well known that Xen is not preemptable. On other words, it is
> impossible to switch vCPU contexts while running in hypervisor
> mode. Only one place where scheduling decision can be made and one
> vCPU can be replaced with another is the exit path from the hypervisor
> mode. The one exception are Idle vCPUs, which never leaves the
> hypervisor mode for obvious reasons.
> 
> This leads to a number of problems. This list is not comprehensive. It
> lists only things that I or my colleagues encountered personally.
> 
> Long-running hypercalls. Due to nature of some hypercalls they can
> execute for arbitrary long time. Mostly those are calls that deal with
> long list of similar actions, like memory pages processing. To deal
> with this issue Xen employs most horrific technique called "hypercall
> continuation". 

I agree the code is not nice. However, it does serve another purpose 
than ...

> When code that handles hypercall decides that it should
> be preempted, it basically updates the hypercall parameters, and moves
> guest PC one instruction back. This causes guest to re-execute the
> hypercall with altered parameters, which will allow hypervisor to
> continue hypercall execution later.

... just rescheduling the vCPU. It will also give the opportunity for 
the guest to handle interrupts.

If you don't return to the guest, then risk to get an RCU sched stall on 
that the vCPU (some hypercalls can take really really long).


> This approach itself have obvious
> problems: code that executes hypercall is responsible for preemption,
> preemption checks are infrequent (because they are costly by
> themselves), hypercall execution state is stored in guest-controlled
> area, we rely on guest's good will to continue the hypercall. 

Why is it a problem to rely on guest's good will? The hypercalls should 
be preempted at a boundary that is safe to continue.

> All this
> imposes restrictions on which hypercalls can be preempted, when they
> can be preempted and how to write hypercall handlers. Also, it
> requires very accurate coding and already led to at least one
> vulnerability - XSA-318. Some hypercalls can not be preempted at all,
> like the one mentioned in [1].
> 
> Absence of hypervisor threads/vCPUs. Hypervisor owns only idle vCPUs,
> which are supposed to run when the system is idle. If hypervisor needs
> to execute own tasks that are required to run right now, it have no
> other way than to execute them on current vCPU. But scheduler does not
> know that hypervisor executes hypervisor task and accounts spent time
> to a domain. This can lead to domain starvation.
> 
> Also, absence of hypervisor threads leads to absence of high-level
> synchronization primitives like mutexes, conditional variables,
> completions, etc. This leads to two problems: we need to use spinlocks
> everywhere and we have problems when porting device drivers from linux
> kernel.
> 
> Proposed solution
> =================
> 
> It is quite obvious that to fix problems above we need to allow
> preemption in hypervisor mode. I am not familiar with x86 side, but
> for the ARM it was surprisingly easy to implement. Basically, vCPU
> context in hypervisor mode is determined by its stack at general
> purpose registers. And __context_switch() function perfectly switches
> them when running in hypervisor mode. So there are no hard
> restrictions, why it should be called only in leave_hypervisor() path.
> 
> The obvious question is: when we should to try to preempt running
> vCPU?  And answer is: when there was an external event. This means
> that we should try to preempt only when there was an interrupt request
> where we are running in hypervisor mode. On ARM, in this case function
> do_trap_irq() is called. Problem is that IRQ handler can be called
> when vCPU is already in atomic state (holding spinlock, for
> example). In this case we should try to preempt right after leaving
> atomic state. This is basically all the idea behind this PoC.
> 
> Now, about the series composition.
> Patches
> 
>    sched: core: save IRQ state during locking
>    sched: rt: save IRQ state during locking
>    sched: credit2: save IRQ state during locking
>    preempt: use atomic_t to for preempt_count
>    arm: setup: disable preemption during startup
>    arm: context_switch: allow to run with IRQs already disabled
> 
> prepare the groundwork for the rest of PoC. It appears that not all
> code is ready to be executed in IRQ state, and schedule() now can be
> called at end of do_trap_irq(), which technically is considered IRQ
> handler state. Also, it is unwise to try preempt things when we are
> still booting, so ween to enable atomic context during the boot
> process.

I am really surprised that this is the only changes necessary in Xen. 
For a first approach, we may want to be conservative when the preemption 
is happening as I am not convinced that all the places are safe to preempt.

> 
> Patches
>    preempt: add try_preempt() function
>    sched: core: remove ASSERT_NOT_IN_ATOMIC and disable preemption[!]
>    arm: traps: try to preempt before leaving IRQ handler
> 
> are basically the core of this PoC. try_preempt() function tries to
> preempt vCPU when either called by IRQ handler and when leaving atomic
> state. Scheduler now enters atomic state to ensure that it will not
> preempt self. do_trap_irq() calls try_preempt() to initiate preemption.

AFAICT, try_preempt() will deal with the rescheduling. But how about 
softirqs? Don't we want to handle them in try_preempt() as well?

[...]

> Conclusion
> ==========
> 
> My main intention is to begin discussion of hypervisor preemption. As
> I showed, it is doable right away and provides some immediate
> benefits. I do understand that proper implementation requires much
> more efforts. But we are ready to do this work if community is
> interested in it.
> 
> Just to reiterate main benefits:
> 
> 1. More controllable latency. On embedded systems customers care about
> such things.

Is the plan to only offer preemptible Xen?

> 
> 2. We can get rid of hypercall continuations, which will results in
> simpler and more secure code.

I don't think you can get rid of it completely without risking the OS to 
receive RCU sched stall. So you would need to handle them hypercalls 
differently.

> 
> 3. We can implement proper hypervisor threads, mutexes, completions
> and so on. This will make scheduling more accurate, ease up linux
> drivers porting and implementation of more complex features in the
> hypervisor.
> 
> 
> 
> [1] https://marc.info/?l=xen-devel&m=161049529916656&w=2
> 
> Volodymyr Babchuk (10):
>    sched: core: save IRQ state during locking
>    sched: rt: save IRQ state during locking
>    sched: credit2: save IRQ state during locking
>    preempt: use atomic_t to for preempt_count
>    preempt: add try_preempt() function
>    arm: setup: disable preemption during startup
>    sched: core: remove ASSERT_NOT_IN_ATOMIC and disable preemption[!]
>    arm: context_switch: allow to run with IRQs already disabled
>    arm: traps: try to preempt before leaving IRQ handler
>    [HACK] alloc pages: enable preemption early
> 
>   xen/arch/arm/domain.c      | 18 ++++++++++-----
>   xen/arch/arm/setup.c       |  4 ++++
>   xen/arch/arm/traps.c       |  7 ++++++
>   xen/common/memory.c        |  4 ++--
>   xen/common/page_alloc.c    | 21 ++---------------
>   xen/common/preempt.c       | 36 ++++++++++++++++++++++++++---
>   xen/common/sched/core.c    | 46 +++++++++++++++++++++++---------------
>   xen/common/sched/credit2.c |  5 +++--
>   xen/common/sched/rt.c      | 10 +++++----
>   xen/include/xen/preempt.h  | 17 +++++++++-----
>   10 files changed, 109 insertions(+), 59 deletions(-)
> 

Cheers,

-- 
Julien Grall

