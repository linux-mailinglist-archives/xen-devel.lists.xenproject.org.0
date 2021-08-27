Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAC53F984F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 12:55:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173596.316712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJZW1-0003sP-4h; Fri, 27 Aug 2021 10:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173596.316712; Fri, 27 Aug 2021 10:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJZW1-0003pf-1W; Fri, 27 Aug 2021 10:55:17 +0000
Received: by outflank-mailman (input) for mailman id 173596;
 Fri, 27 Aug 2021 10:55:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mJZVz-0003pZ-IG
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 10:55:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJZVz-0003Sv-Ex; Fri, 27 Aug 2021 10:55:15 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJZVz-00049h-8x; Fri, 27 Aug 2021 10:55:15 +0000
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
	bh=/6mNQFThN8qkN/4ukXCGNlJn7SIkBUUxkcpVQmLfH8A=; b=Xxm+BsR6OZfLRa3kcOGeO2VwLs
	0de50S+h1Tpg0FB1ERhx8yccaHeIdeqzbxNNWeNq6CiLcDu74enpDFf7yYDA1FJ+xBn9zfh/RCy+2
	6ZpyiF+YYPTPaeW8hhN13xNEPFJLJg5Iy+cmoK6861CznLwHhOltO34Mc4CL4whna86E=;
Subject: Re: HVM guest only bring up a single vCPU
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <a1724918-94bf-748f-5c4b-5a3ec176368f@xen.org>
 <781aeba6-5e77-9995-cf58-9dc6fd443ad8@citrix.com>
 <3b2e6fce-98a2-c18f-7068-9ca990b0b95e@suse.com>
 <62ca5392-3d85-0883-8020-287072358cef@xen.org>
 <e72b385e-238a-5ae9-332e-2d21b59ac09c@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <eae6e3c6-64fc-3468-e4b4-f35c31dbd8e3@xen.org>
Date: Fri, 27 Aug 2021 11:55:13 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e72b385e-238a-5ae9-332e-2d21b59ac09c@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Jan,

On 27/08/2021 11:52, Jan Beulich wrote:
> On 27.08.2021 12:35, Julien Grall wrote:
>> Hi Jan,
>>
>> On 27/08/2021 07:28, Jan Beulich wrote:
>>> On 27.08.2021 01:42, Andrew Cooper wrote:
>>>> On 26/08/2021 22:00, Julien Grall wrote:
>>>>> Hi Andrew,
>>>>>
>>>>> While doing more testing today, I noticed that only one vCPU would be
>>>>> brought up with HVM guest with Xen 4.16 on my setup (QEMU):
>>>>>
>>>>> [    1.122180]
>>>>> ================================================================================
>>>>> [    1.122180] UBSAN: shift-out-of-bounds in
>>>>> oss/linux/arch/x86/kernel/apic/apic.c:2362:13
>>>>> [    1.122180] shift exponent -1 is negative
>>>>> [    1.122180] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-rc7+ #304
>>>>> [    1.122180] Hardware name: Xen HVM domU, BIOS 4.16-unstable 06/07/2021
>>>>> [    1.122180] Call Trace:
>>>>> [    1.122180]  dump_stack_lvl+0x56/0x6c
>>>>> [    1.122180]  ubsan_epilogue+0x5/0x50
>>>>> [    1.122180]  __ubsan_handle_shift_out_of_bounds+0xfa/0x140
>>>>> [    1.122180]  ? cgroup_kill_write+0x4d/0x150
>>>>> [    1.122180]  ? cpu_up+0x6e/0x100
>>>>> [    1.122180]  ? _raw_spin_unlock_irqrestore+0x30/0x50
>>>>> [    1.122180]  ? rcu_read_lock_held_common+0xe/0x40
>>>>> [    1.122180]  ? irq_shutdown_and_deactivate+0x11/0x30
>>>>> [    1.122180]  ? lock_release+0xc7/0x2a0
>>>>> [    1.122180]  ? apic_id_is_primary_thread+0x56/0x60
>>>>> [    1.122180]  apic_id_is_primary_thread+0x56/0x60
>>>>> [    1.122180]  cpu_up+0xbd/0x100
>>>>> [    1.122180]  bringup_nonboot_cpus+0x4f/0x60
>>>>> [    1.122180]  smp_init+0x26/0x74
>>>>> [    1.122180]  kernel_init_freeable+0x183/0x32d
>>>>> [    1.122180]  ? _raw_spin_unlock_irq+0x24/0x40
>>>>> [    1.122180]  ? rest_init+0x330/0x330
>>>>> [    1.122180]  kernel_init+0x17/0x140
>>>>> [    1.122180]  ? rest_init+0x330/0x330
>>>>> [    1.122180]  ret_from_fork+0x22/0x30
>>>>> [    1.122244]
>>>>> ================================================================================
>>>>> [    1.123176] installing Xen timer for CPU 1
>>>>> [    1.123369] x86: Booting SMP configuration:
>>>>> [    1.123409] .... node  #0, CPUs:      #1
>>>>> [    1.154400] Callback from call_rcu_tasks_trace() invoked.
>>>>> [    1.154491] smp: Brought up 1 node, 1 CPU
>>>>> [    1.154526] smpboot: Max logical packages: 2
>>>>> [    1.154570] smpboot: Total of 1 processors activated (5999.99
>>>>> BogoMIPS)
>>>>>
>>>>> I have tried a PV guest (same setup) and the kernel could bring up all
>>>>> the vCPUs.
>>>>>
>>>>> Digging down, Linux will set smp_num_siblings to 0 (via
>>>>> detect_ht_early()) and as a result will skip all the CPUs. The value
>>>>> is retrieve from a CPUID leaf. So it sounds like we don't set the
>>>>> leaft correctly.
>>>>>
>>>>> FWIW, I have also tried on Xen 4.11 and could spot the same issue.
>>>>> Does this ring any bell to you?
>>>>
>>>> The CPUID data we give to guests is generally nonsense when it comes to
>>>> topology.  By any chance does the hardware you're booting this on not
>>>> have hyperthreading enabled/active to begin with?
>>>
>>> Well, I'd put the question slightly differently: What CPUID data does
>>> qemu supply to Xen here? I could easily see us making an assumption
>>> somewhere that is met by all hardware but is theoretically wrong to
>>> make and not met by qemu, which then leads to further issues with what
>>> we expose to our guest.
>> I have pasted the output from cpuid on a baremetal Linux here:
> 
> "baremetal" still meaning it was running on qemu, not itself baremetal?

Correct.

> 
>> https://pastebin.com/WvaXiXuL
> 
>     miscellaneous (1/ebx):
>        process local APIC physical ID = 0x0 (0)
>        maximum IDs for CPUs in pkg    = 0x0 (0)
>        CLFLUSH line size              = 0x8 (8)
>        brand index                    = 0x0 (0)
> 
> As suspected the field is zero, and hence will remain zero after
> multiplying by 2. I suppose the patch sent earlier should then get you
> further.

I am about to try your patch. I will let you know the results.

Cheers,

-- 
Julien Grall

