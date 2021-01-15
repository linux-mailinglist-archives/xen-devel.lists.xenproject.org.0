Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FA72F77D9
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 12:43:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68001.121603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0NVP-0007gB-Av; Fri, 15 Jan 2021 11:43:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68001.121603; Fri, 15 Jan 2021 11:43:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0NVP-0007fm-7d; Fri, 15 Jan 2021 11:43:03 +0000
Received: by outflank-mailman (input) for mailman id 68001;
 Fri, 15 Jan 2021 11:43:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l0NVN-0007fh-8Y
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 11:43:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0NVK-0002To-4Z; Fri, 15 Jan 2021 11:42:58 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0NVJ-0001Zv-OY; Fri, 15 Jan 2021 11:42:58 +0000
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
	bh=vI+3blgvOHyY7ck6IbhK0URQ/1y48A6oVYlISKseZ7c=; b=PVuUWGbS0FJSNTXWFOWIs/RKSQ
	yBuK07B4/Jef3Ltr6YJ7o7WKdmPJf/jbSDB+nTbvrmM7U6WeCvcDP7uonJaEHUpze1usv3MD3Snd+
	JuRnbOndNbPyLNvHoM25qZr+sppWn7uTi1CF9EoZPKOajDcYmfO6y0IUc9gQiloBdWfE=;
Subject: Re: IRQ latency measurements in hypervisor
To: Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Dario Faggioli <dario.faggioli@suse.com>,
 Bertrand.Marquis@arm.com, andrew.cooper3@citrix.com
References: <87pn294szv.fsf@epam.com>
 <alpine.DEB.2.21.2101141515230.31265@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <f31c9cca-0275-eaef-5fcd-c8484d4b5da0@xen.org>
Date: Fri, 15 Jan 2021 11:42:55 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2101141515230.31265@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Volodymyr, Stefano,

On 14/01/2021 23:33, Stefano Stabellini wrote:
> + Bertrand, Andrew (see comment on alloc_heap_pages())

Long running hypercalls are usually considered security issues.

In this case, only the control domain can issue large memory allocation 
(2GB at a time). Guest, would only be able to allocate 2MB at the time, 
so from the numbers below, it would only take 1ms max.

So I think we are fine here. Next time, you find a large loop, please 
provide an explanation why they are not security issues (e.g. cannot be 
used by guests) or send an email to the Security Team in doubt.

>> ARMv8 platform. Namely Renesas Rcar H3 SoC on Salvator board.

Which core is it?

>> To accurately determine latency, I employed one of timer counter units
>> (TMUs) available on the SoC. This is 32-bit timer with auto-reload,
>> that can generate interrupt on underflow. I fed it with 33.275MHz
>> clock, which gave me resolution of about 30ns. I programmed the timer
>> to generate interrupt every 10ms. My ISR then read the current timer
>> value and determined how much time passed since last underrun. This
>> gave me time interval between IRQ generation and ISR invocation.
>> Those values were collected and every 10 seconds statistics was
>> calculated. There is an example of output from my Linux driver:
> 
> It looks like a solid approach to collect results, similar to the one we
> used for the cache coloring work. Just make sure to collect very many
> results.
> 
> A few of questions: did you use a single physical CPU? Are you using
> RTDS and schedule 2 vCPU on 1 pCPU? Is dom0 idle or busy? I take the
> results were measured in domU?
> 
> 
>> [   83.873162] rt_eval_tmu e6fc0000.tmu: Mean: 44 (1320 ns) stddev: 8 (240 ns)
>> [   94.136632] rt_eval_tmu e6fc0000.tmu: Mean: 44 (1320 ns) stddev: 8 (240 ns)
>> [  104.400098] rt_eval_tmu e6fc0000.tmu: Mean: 50 (1500 ns) stddev: 129 (3870 ns)
>> [  114.663828] rt_eval_tmu e6fc0000.tmu: Mean: 44 (1320 ns) stddev: 8 (240 ns)
>> [  124.927296] rt_eval_tmu e6fc0000.tmu: Mean: 56 (1680 ns) stddev: 183 (5490 ns)
>>
>> This is the baremetal Linux. And there is Dom0:
>>
>> [  237.431003] rt_eval_tmu e6fc0000.tmu: Mean: 306 (9180 ns) stddev: 25 (750 ns)
>> [  247.694506] rt_eval_tmu e6fc0000.tmu: Mean: 302 (9060 ns) stddev: 17 (510 ns)
>>
>> Driver outputs both the raw timer value (eg. 4) and the same value
>> scaled to nanoseconds (eg. 1320 ns). As you can see baremetal setup is
>> much faster. But experiments showed that Linux does not provide
>> consistent values, even when running in baremetal mode. You can see
>> sporadic spikes in "std dev" values.
> 
> So baremetal IRQ latency is 1320-1680ns and Linux IRQ latency is
> 9060-9180ns. I am not surprised that Linux results are inconsistent but
> I have a couple of observations:
> 
> - 9us is high for Linux
> If the system is idle, the latency should be lower, around 2-3us. I
> imagine you are actually running some sort of interference from dom0? Or
> using RTDS and descheduling vCPUs?
> 
> - the stddev of 3870ns is high for baremetal
> In the baremetal case the stddev should be minimal if the system is
> idle.
> 
> 
>> So my next step was to use proper RT OS to do the measurements. I
>> chose Zephyr. My PR that adds Xen support to Zephyr can be found at
>> [1]. Support for RCAR Gen3 is not upstreamed, but is present on my
>> GitHub([2]). At [3] you can find the source code for application that
>> does the latency measurements. It behaves exactly as my linux driver,
>> but provides a bit more information:
>>
>>   *** Booting Zephyr OS build zephyr-v2.4.0-2750-g0f2c858a39fc  ***
>> RT Eval app
>>
>> Counter freq is 33280000 Hz. Period is 30 ns
>> Set alarm in 0 sec (332800 ticks)
>> Mean: 600 (18000 ns) stddev: 3737 (112110 ns) above thr: 0% [265 (7950 ns) - 66955 (2008650 ns)] global [265 (7950 ns) 66955 (2008650 ns)]
>> Mean: 388 (11640 ns) stddev: 2059 (61770 ns) above thr: 0% [266 (7980 ns) - 58830 (1764900 ns)] global [265 (7950 ns) 66955 (2008650 ns)]
>> Mean: 358 (10740 ns) stddev: 1796 (53880 ns) above thr: 0% [265 (7950 ns) - 57780 (1733400 ns)] global [265 (7950 ns) 66955 (2008650 ns)]
>> ...
>>
>> So there you can see: mean time, standard deviation, % of interrupts
>> that was processed above 30us threshold, minimum and maximum latency
>> values for the current 10s run, global minimum and maximum.
>>
>> Zephyr running as baremetal showed very stable results (this is an
>> older build, so no extended statistics there):
>>
>> ## Starting application at 0x480803C0 ...
>>   *** Booting Zephyr OS build zephyr-v2.4.0-1137-g5803ee1e8183  ***
>> RT Eval app
>>
>> Counter freq is 33280000 Hz. Period is 30 ns
>> Mean: 31 (930 ns) stddev: 0 (0 ns)
>> Mean: 31 (930 ns) stddev: 0 (0 ns)
>> Mean: 31 (930 ns) stddev: 0 (0 ns)
>> Mean: 31 (930 ns) stddev: 0 (0 ns)
>> Mean: 31 (930 ns) stddev: 0 (0 ns)
>> Mean: 31 (930 ns) stddev: 0 (0 ns)
>> ...
>>
>> As Zephyr provided stable readouts with no jitter, I used it to do all
>> subsequent measurements.
> 
> I am a bit confused here. Looking at the numbers above the stddev is
> 112110 ns in the first instance. That is pretty high. Am I looking at
> the wrong numbers?
> 
> 
>   
>> IMPORTANT! All subsequent tests was conducted with only 1 CPU core
>> enabled. My goal was to ensure that system can timely react to an
>> external interrupt even under load.
> 
> All right. FYI I have no frame of reference for 2 vCPUs on 1 pCPUs, all
> my tests were done with 1vCPU <-> 1pCPU and the null scheduler.
> 
>   
>> Test results and latency sources
>>
>> As you can see, baremetal OS provides latency of ~0.9us without any
>> deviations. The same code running as DomU on idle system shows mean
>> latency of 12us and deviation of about 10us. Range of latencies in a
>> 10s batch can vary from 8us to 25us. This fits into required 30us
>> threshold, so no big issue there.
>>
>> But this worsens under certain conditions.
>>
>> 1. Serial console. RCAR serial driver (scif) works in synchronous
>>     mode, so any heavy serial console output leads to higher
>>     latency. Tests shows mean latency of 1000us and deviation of 1332
>>     us. 54% of interrupts are handled outside of 30us period. Real
>>     values may be even higher, because in some cases timer would do
>>     full cycle and instead of say 11ms ISR would read 11 % 10 = 1ms
>>     latency. I tried to enable asynchronous mode for the serial
>>     console. This made things better, but it lead to gaps in output, so
>>     I just turned the serial console off completely.
> 
> That's very interesting. I wonder if other serial drivers would cause
> similar issues, e.g. PL011.
> 
> 
>> 2. RTDS scheduler. With console disabled, things like "hexdump -v
>>     /dev/zero" didn't affected the latency so badly, but anyways,
>>     sometimes I got ~600us spikes. This is not a surprise, because of
>>     default RTDS configuration. I changed period for DomU from default
>>     10ms to 100us and things got better: with Dom0 burning CPU I am
>>     rarely getting max latency of about ~30us with mean latency of ~9us
>>     and deviation of ~0.5us. On other hand, when I tried to set period
>>     to 30us, max latency rose up to ~60us.
In a related topic, I am not entirely sure that all the hypercalls would 
be able to fit in the 100us slice. In particular, the one which are 
touching the P2M and do memory allocation.

> 
> This is very interestingi too. Did you get any spikes with the period
> set to 100us? It would be fantastic if there were none.
> 
> 
>> 3. Huge latency spike during domain creation. I conducted some
>>     additional tests, including use of PV drivers, but this didn't
>>     affected the latency in my "real time" domain. But attempt to
>>     create another domain with relatively large memory size of 2GB led
>>     to huge spike in latency. Debugging led to this call path:
>>
>>     XENMEM_populate_physmap -> populate_physmap() ->
>>     alloc_domheap_pages() -> alloc_heap_pages()-> huge
>>     "for ( i = 0; i < (1 << order); i++ )" loop.

There are two for loops in alloc_heap_pages() using this syntax. Which 
one are your referring to?

>>
>>     This loops handles struct page* for every one of 262144 pages that
>>     was allocated by calling populate_physmap().

Looking at the domain creation code, 2GB will be split in two extents of 
1GB. This means, there will be at least a preemption point between the 
allocation of the two extents.

That said, this would only half of the time. So there might be more 
optimization to do...

> This function is not
>>     preemptible and it takes about a second to complete on my
>>     setup. Needless to say that it completely screws any responsiveness
>>     of the hypervisor.
>>
>> I managed to overcome the issue #3 by commenting out all calls to
>> populate_one_size() except the populate_one_size(PFN_4K_SHIFT) in
>> xg_dom_arm.c. This lengthened domain construction, but my "RT" domain
>> didn't experienced so big latency issues. Apparently all other
>> hypercalls which are used during domain creation are either fast or
>> preemptible. No doubts that my hack lead to page tables inflation and
>> overall performance drop.
> 
> I think we need to follow this up and fix this. Maybe just by adding
> a hypercall continuation to the loop.

When I read "hypercall continuation", I read we will return to the guest 
context so it can process interrupts and potentially switch to another task.

This means that the guest could issue a second populate_physmap() from 
the vCPU. Therefore any restart information should be part of the 
hypercall parameters. So far, I don't see how this would be possible.

Even if we overcome that part, this can be easily abuse by a guest as 
the memory is not yet accounted to the domain. Imagine a guest that 
never request the continuation of the populate_physmap(). So we would 
need to block the vCPU until the allocation is finished.

I think the first step is we need to figure out which part of the 
allocation is slow (see my question above). From there, we can figure 
out if there is a way to reduce the impact.

Cheers,

-- 
Julien Grall

