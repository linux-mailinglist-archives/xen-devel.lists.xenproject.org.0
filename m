Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97799346DA7
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 00:00:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100819.192310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOpzN-0006xK-Ih; Tue, 23 Mar 2021 22:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100819.192310; Tue, 23 Mar 2021 22:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOpzN-0006wv-FF; Tue, 23 Mar 2021 22:59:05 +0000
Received: by outflank-mailman (input) for mailman id 100819;
 Tue, 23 Mar 2021 22:59:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lOpzM-0006wq-3y
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 22:59:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lOpzL-0000Re-Qc; Tue, 23 Mar 2021 22:59:03 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lOpzL-00071P-FW; Tue, 23 Mar 2021 22:59:03 +0000
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
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=qAPA2uDorCOhySKwhXsz4x9l7n7eyOgSsluk/bi7Zp0=; b=nkodAGU3ox4I71FKXXT5LADD9D
	c2ucq6S9Bo42ObzLBCWVwcGurvXGxq9Z+/41+07QNkbviiWqeq4WK1F9BmXoaF7/lDEvFdVOTLWhQ
	vKfoRg1JFwKRYOBx762GAk5EAGpBaNJdVl85mBy8qYQujIkEs2CkkLyGwvDYsuy/wmk0=;
Subject: Re: xen/evtchn: Dom0 boot hangs using preempt_rt kernel 5.10
From: Julien Grall <julien@xen.org>
To: Luca Fancellu <luca.fancellu@arm.com>, Jason Andryuk <jandryuk@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <VI1PR08MB3629824170C1707255465D8BE46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>
 <VI1PR08MB36292202FAA817F9FFDCAD81E46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>
 <cb4badc8-a932-2d4e-956e-4d474a137b0b@suse.com>
 <EC3489FE-8151-4EE7-B177-22CC2F92131C@arm.com>
 <1FAD6C91-2B3A-48F0-88D7-CFCFC8B53BA9@arm.com>
 <c2e9268d-daec-95d8-cbb9-a2d2ecf233ec@suse.com>
 <2BC82A95-DFB9-4F90-8CC6-AE39405157ED@arm.com>
 <CAKf6xptBm8G-T8UCfht22nfeS_4XOj2sN9fBvJhOVA1QKbfnhA@mail.gmail.com>
 <565C6475-4693-4A7C-8316-9613146300C2@arm.com>
 <2A09774F-ADDF-41B0-8E72-DC0FA0A6B1F3@arm.com>
 <d5551ce9-6934-6228-e9da-e1ecc87ec015@xen.org>
Message-ID: <508ec534-418d-4f82-6f53-e99e4b8dabaa@xen.org>
Date: Tue, 23 Mar 2021 22:59:01 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d5551ce9-6934-6228-e9da-e1ecc87ec015@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 23/03/2021 19:26, Julien Grall wrote:
> 
> 
> On 23/03/2021 17:06, Luca Fancellu wrote:
>> Hi all,
> 
> Hi,
> 
> Please avoid top posting when answering to a comment. This makes more 
> difficult to follow.
> 
>> I have an update, changing the lock introduced by the serie from 
>> spinlock_t to raw_spinlock_t, changing the lock/unlock function to use 
>> the raw_* version and keeping the BUG_ON(…) (now we can because raw_* 
>> implementation disable interrupts on preempt_rt) the kernel is booting 
>> correctly.
>> So seems that the BUG_ON(…) is needed and the unmask function should 
>> run with interrupt disabled, anyone knows why this change worked?
> 
> Do you mean why no-one spotted the issue before? If so, AFAIK, on 
> vanilla Linux, spin_lock is still just a wrapper to raw_spinlock. IOW 
> there is no option to replace it with a RT spinlock.
> 
> So if you don't apply the RT patches, you would not be able to trigger 
> the issue.
> 
> As to the fix itself, I think using raw_spinlock_t is the correct thing 
> to do because the lock is also used in interrupt context (even with RT 
> enabled).
> 
> Would you be able to send a patch?
> 
>>
>>> On 23 Mar 2021, at 15:39, Luca Fancellu <luca.fancellu@arm.com> wrote:
>>>
>>> Hi Jason,
>>>
>>> Thanks for your hints, unfortunately seems not an init problem 
>>> because in the same init configuration I tried the 5.10.23 
>>> (preempt_rt) without the Juergen patch but with the BUG_ON removed 
>>> and it boots without problem. So seems that applying the serie does 
>>> something (on a preempt_rt kernel) and we are trying to figure out what.
>>>
>>>
>>>> On 23 Mar 2021, at 12:36, Jason Andryuk <jandryuk@gmail.com> wrote:
>>>>
>>>> On Mon, Mar 22, 2021 at 3:09 PM Luca Fancellu 
>>>> <luca.fancellu@arm.com> wrote:
>>>>>
>>>>> Hi Juergen,
>>>>>
>>>>> Yes you are right it was my mistake, as you said to remove the 
>>>>> BUG_ON(…) this serie 
>>>>> (https://patchwork.kernel.org/project/xen-devel/cover/20210306161833.4552-1-jgross@suse.com/) 
>>>>> is needed, since I’m using yocto I’m able to build a preempt_rt 
>>>>> kernel up to the 5.10.23 and for this reason I’m applying that 
>>>>> serie on top of this version, then I’m removing the BUG_ON(…).
>>>>>
>>>>> A thing that was not expected is that now the Dom0 kernel is stuck 
>>>>> on “Setting domain 0 name, domid and JSON config…” step and the 
>>>>> system seems unresponsive. Seems like a deadlock issue but looking 
>>>>> into the serie we can’t spot anything and that serie was also 
>>>>> tested by others from the community.
> 
> The deadlock is expected. When you enable RT spinlock, the interrupts 
> will not disabled even when you call spin_lock_irqsave().
> 
> As the lock is also used in interrupt context (e.g. with interrupt 
> masked), this will lead to a deadlock because the lock can be held with 
> interrupt unmasked.
> 
> This is quite a common error as developpers are not yet used to test RT. 
> I remember finding a few other instances like that when I worked on RT a 
> couple of years ago.
> 
> For future reference, I think CONFIG_PROVE_LOCKING=y could help you to 
> detect (potential) deadlock.

Actually, Linux has a config that detect misuse of spinlock. If I enable 
CONFIG_PROVE_RAW_LOCK_NESTING, I will get the following:

[    1.286028] =============================
[    1.286781] [ BUG: Invalid wait context ]
[    1.287539] 5.12.0-rc4+ #222 Not tainted
[    1.288277] -----------------------------
[    1.289033] swapper/0/0 is trying to lock:
[    1.289799] ffff8881001b8358 (&info->lock){....}-{3:3}, at: 
do_unmask+0x1c/0x50
[    1.291132] other info that might help us debug this:
[    1.292066] context-{5:5}
[    1.292594] 2 locks held by swapper/0/0:
[    1.293339]  #0: ffff8881001bfae8 (&desc->request_mutex){+.+.}-{4:4}, 
at: __setup_irq+0xb9/0x8c0
[    1.294909]  #1: ffff8881001bf930 (&irq_desc_lock_class){....}-{2:2}, 
at: __setup_irq+0xea/0x8c0
[    1.296478] stack backtrace:
[    1.297062] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.12.0-rc4+ #222
[    1.298304] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 
rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
[    1.300326] Call Trace:
[    1.300837]  dump_stack+0x7f/0xa1
[    1.301514]  __lock_acquire+0x86e/0x1e20
[    1.302281]  ? add_lock_to_list.constprop.58+0xac/0x1d0
[    1.303270]  lock_acquire+0x26d/0x400
[    1.303987]  ? do_unmask+0x1c/0x50
[    1.304670]  _raw_spin_lock_irqsave+0x48/0x60
[    1.305525]  ? do_unmask+0x1c/0x50
[    1.306208]  do_unmask+0x1c/0x50
[    1.306863]  unmask_irq.part.41+0x25/0x40
[    1.307655]  __irq_startup+0x68/0x70
[    1.308361]  irq_startup+0x59/0xf0
[    1.309046]  __setup_irq+0x7ea/0x8c0
[    1.309750]  request_threaded_irq+0xfb/0x160
[    1.310581]  ? xen_timerop_shutdown+0x10/0x10
[    1.311434]  bind_virq_to_irqhandler+0x47/0x80
[    1.312293]  xen_setup_timer+0x7f/0x190
[    1.313045]  xen_time_init+0x1bf/0x214
[    1.313780]  x86_late_time_init+0x17/0x30
[    1.314553]  start_kernel+0x851/0x90a
[    1.315276]  ? default_get_nmi_reason+0x10/0x10
[    1.316149]  xen_start_kernel+0x575/0x57f
[    1.316932]  startup_xen+0x3e/0x3e

This is on an x86 (either PV or HVM). Interestingly on Arm, I get a 
different one:

[    0.112598] =============================
[    0.112745] [ BUG: Invalid wait context ]
[    0.112953] 5.12.0-rc4+ #98 Not tainted
[    0.113156] -----------------------------
[    0.113301] swapper/0/1 is trying to lock:
[    0.113461] ffffa10084d2f788 (evtchn_rwlock){....}-{3:3}, at: 
__xen_evtchn_do_upcall+0x64/0xf0
[    0.114041] other info that might help us debug this:
[    0.114229] context-{2:2}
[    0.114351] 2 locks held by swapper/0/1:
[    0.114608]  #0: ffffa10084ab1e78 (cpu_hotplug_lock){.+.+}-{0:0}, at: 
xen_guest_init+0x33c/0x380
[    0.115076]  #1: ffffa10084ab1c70 (cpuhp_state_mutex){+.+.}-{4:4}, 
at: __cpuhp_setup_state_cpuslocked+0x64/0x308
[    0.115530] stack backtrace:
[    0.115880] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.12.0-rc4+ #98
[    0.116371] Call trace:
[    0.116488]  dump_backtrace+0x0/0x1e0
[    0.116650]  show_stack+0x2c/0x48
[    0.116791]  dump_stack+0xf0/0x138
[    0.116933]  __lock_acquire+0x5ac/0x1a38
[    0.117085]  lock_acquire+0x3cc/0x4e0
[    0.117225]  _raw_read_lock+0x80/0x188
[    0.117370]  __xen_evtchn_do_upcall+0x64/0xf0
[    0.117536]  xen_hvm_evtchn_do_upcall+0x14/0x20
[    0.117706]  xen_arm_callback+0x14/0x20
[    0.117855]  handle_percpu_devid_irq+0xc8/0x428
[    0.118027]  generic_handle_irq+0x3c/0x58
[    0.118174]  __handle_domain_irq+0x68/0xc0
[    0.118323]  gic_handle_irq+0x64/0x160
[    0.118463]  el1_irq+0xb0/0x140
[    0.118593]  _raw_spin_unlock_irqrestore+0x6c/0xe8
[    0.118769]  __irq_put_desc_unlock+0x30/0x60
[    0.118935]  enable_percpu_irq+0x94/0xf0
[    0.119079]  xen_starting_cpu+0x70/0x1b8
[    0.119228]  cpuhp_invoke_callback+0xfc/0xf20
[    0.119395]  cpuhp_issue_call+0x220/0x250
[    0.119542]  __cpuhp_setup_state_cpuslocked+0x150/0x308
[    0.119725]  __cpuhp_setup_state+0x138/0x3b0
[    0.119891]  xen_guest_init+0x33c/0x380
[    0.120033]  do_one_initcall+0x90/0x470
[    0.120176]  kernel_init_freeable+0x250/0x440
[    0.120345]  kernel_init+0x1c/0x138
[    0.120480]  ret_from_fork+0x10/0x18

I am not sure why I don't get a splat for info->lock on Arm.

Anyway, I am quite confused at the second splat. It seems to suggest it 
would not be valid to call read_lock() while a cpu_hotplug_lock() is 
held. Does it ring any bell?

Cheers,

-- 
Julien Grall

