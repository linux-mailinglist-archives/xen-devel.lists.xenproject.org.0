Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3E3644BB9
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 19:29:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455475.712961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2cgl-0000kV-Ia; Tue, 06 Dec 2022 18:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455475.712961; Tue, 06 Dec 2022 18:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2cgl-0000ik-Fe; Tue, 06 Dec 2022 18:29:07 +0000
Received: by outflank-mailman (input) for mailman id 455475;
 Tue, 06 Dec 2022 18:29:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2cgk-0000ie-Ud
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 18:29:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2cgk-0007AV-Tp
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 18:29:06 +0000
Received: from [54.239.6.185] (helo=[192.168.22.87])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2cgk-0003pc-Nb; Tue, 06 Dec 2022 18:29:06 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=xZ/c85VhZG4I31RWWo3ctKQDGsUcpXuZjLnFRhNg5HA=; b=4KZRBnOrOmEclrqou2/FxlE/Tb
	w2uBbNUEaGaOqbbe0z0MEY5fTOReSVEY5s1On1seYAu5w9n31hcR4QZYeY9u8oPgMLFWXttblTOc5
	/e/a53EtJ2oGucymm5+o3/DoXK0SIauqQ0hFIAF4QjDgx1x23PLW+uiFvvwtN7KbV0XA=;
Message-ID: <9987952b-2256-a9f6-8ca7-49c24cf16fe2@xen.org>
Date: Tue, 6 Dec 2022 18:29:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC v2 04/12] xen/arm32: head: Remove restriction where to load
 Xen
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "marco.solieri@minervasys.tech" <marco.solieri@minervasys.tech>,
 "lucmiccio@gmail.com" <lucmiccio@gmail.com>,
 "carlo.nonato@minervasys.tech" <carlo.nonato@minervasys.tech>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221022150422.17707-1-julien@xen.org>
 <20221022150422.17707-5-julien@xen.org>
 <F7ED0618-C95F-45FE-932C-A27D75DC8206@arm.com>
 <8624949e-6198-1aa3-152f-4294534d6d86@xen.org>
 <62EDCEBA-B8B6-4869-99A3-3A430BF9D637@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <62EDCEBA-B8B6-4869-99A3-3A430BF9D637@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 25/11/2022 15:50, Luca Fancellu wrote:
> 
> 
>> On 17 Nov 2022, at 20:18, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 25/10/2022 12:56, Luca Fancellu wrote:
>>>> On 22 Oct 2022, at 16:04, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> At the moment, bootloaders can load Xen anywhere in memory but the
>>>> region 2MB - 4MB. While I am not aware of any issue, we have no way
>>>> to tell the bootloader to avoid that region.
>>>>
>>>> In addition to that, in the future, Xen may grow over 2MB if we
>>>> enable feature like UBSAN or GCOV. To avoid widening the restriction
>>>> on the load address, it would be better to get rid of it.
>>>>
>>>> When the identity mapping is clashing with the Xen runtime mapping,
>>>> we need an extra indirection to be able to replace the identity
>>>> mapping with the Xen runtime mapping.
>>>>
>>>> Reserve a new memory region that will be used to temporarily map Xen.
>>>> For convenience, the new area is re-using the same first slot as the
>>>> domheap which is used for per-cpu temporary mapping after a CPU has
>>>> booted.
>>>>
>>>> Furthermore, directly map boot_second (which cover Xen and more)
>>>> to the temporary area. This will avoid to allocate an extra page-table
>>>> for the second-level and will helpful for follow-up patches (we will
>>>> want to use the fixmap whilst in the temporary mapping).
>>>>
>>>> Lastly, some part of the code now needs to know whether the temporary
>>>> mapping was created. So reserve r12 to store this information.
>>>>
>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>> ----
>>>>
>>>>     Changes in v2:
>>>>         - Patch added
>>>> ---
>>> Hi Julien,
>>> I’m hitting an assert with this one, tested on qemu and fvp:
>>
>> Thanks for testing the series!
>>
>>> Xen 4.17-rc
>>> (XEN) Xen version 4.17-rc (user@hostname) (arm-poky-linux-gnueabi-gcc (GCC) 11.3.0) debug=y Tue Oct 25 10:51:06 UTC 2022
>>> (XEN) Latest ChangeSet:
>>> (XEN) build-id: ab143b13f4394ced5331d6ff1cedebdb2ffadc07
>>> (XEN) Processor: 412fc0f1: "ARM Limited", variant: 0x2, part 0xc0f,rev 0x1
>>> (XEN) 32-bit Execution:
>>> (XEN)   Processor Features: 00001131:00011001
>>> (XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 ThumbEE Jazelle
>>> (XEN)     Extensions: GenericTimer
>>> (XEN)   Debug Features: 02010555
>>> (XEN)   Auxiliary Features: 00000000
>>> (XEN)   Memory Model Features: 10201105 20000000
>>> (XEN)                          01240000 02102211
>>> (XEN)   ISA Features: 02101110 13112111 21232041
>>> (XEN)                 11112131 10011142 00000000
>>> (XEN) Using SMC Calling Convention v1.0
>>> (XEN) Using PSCI v0.2
>>> (XEN) SMP: Allowing 4 CPUs
>>> (XEN) Generic Timer IRQ: phys=30 hyp=26 virt=27 Freq: 62500 KHz
>>> (XEN) GICv2m extension register frame:
>>> (XEN)         gic_v2m_addr=0000000008020000
>>> (XEN)         gic_v2m_size=0000000000001000
>>> (XEN)         gic_v2m_spi_base=80
>>> (XEN)         gic_v2m_num_spis=64
>>> (XEN) GICv2 initialization:
>>> (XEN)         gic_dist_addr=0000000008000000
>>> (XEN)         gic_cpu_addr=0000000008010000
>>> (XEN)         gic_hyp_addr=0000000008030000
>>> (XEN)         gic_vcpu_addr=0000000008040000
>>> (XEN)         gic_maintenance_irq=25
>>> (XEN) GICv2: 288 lines, 4 cpus (IID 00000000).
>>> (XEN) XSM Framework v1.0.1 initialized
>>> (XEN) Initialising XSM SILO mode
>>> (XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
>>> (XEN) Initializing Credit2 scheduler
>>> (XEN)  load_precision_shift: 18
>>> (XEN)  load_window_shift: 30
>>> (XEN)  underload_balance_tolerance: 0
>>> (XEN)  overload_balance_tolerance: -3
>>> (XEN)  runqueues arrangement: socket
>>> (XEN)  cap enforcement granularity: 10ms
>>> (XEN) load tracking window length 1073741824 ns
>>> (XEN) Allocated console ring of 32 KiB.
>>> (XEN) VFP implementer 0x41 architecture 4 part 0x30 variant 0xf rev 0x0
>>> (XEN) CPU0: Guest atomics will try 1 times before pausing the domain
>>> (XEN) Bringing up CPU1
>>> (XEN) Assertion '!lpae_is_valid(*entry)' failed at arch/arm/domain_page.c:69
>>
>> So this is asserting because, so far, for secondary CPUs, we are copying the content of the CPU0 root table to the secondary CPU root table and then update the entry.
>>
>> So the entry would logical be valid. This is fine to be valid because the root able is not yet live.
>>
>> I have follow-up patches (not yet sent) where the root table for secondary CPUs would also be live. I probably mistakenly tested with those patches.
>>
>> Anyway, the ASSERT() here doesn't make sense in the context of this patch because we are still switching the CPU0 root table. So I will drop the ASSERT() for now.
>>
>> I will re-introduce it in a follow-up series.
>>
>> Before I send a new version, do you have any comments for the rest of the patches?
> 
> Hi Julien,
> 
> Yes as you pointed out, the assert was not right in that context and it can be removed without issues, I’ve had a look on the serie and the changes looks ok to me, I’ve also tested
> that it works on arm64 and arm32 using FVP.

Thanks! I will aim to respin the series this week.

Cheers,

-- 
Julien Grall

