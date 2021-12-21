Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E19347BCAA
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 10:16:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250240.431020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzbFm-0005bm-1D; Tue, 21 Dec 2021 09:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250240.431020; Tue, 21 Dec 2021 09:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzbFl-0005Ze-Ta; Tue, 21 Dec 2021 09:16:13 +0000
Received: by outflank-mailman (input) for mailman id 250240;
 Tue, 21 Dec 2021 09:16:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mzbFk-0005ZY-RE
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 09:16:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mzbFi-0005Bm-BP; Tue, 21 Dec 2021 09:16:10 +0000
Received: from [54.239.6.184] (helo=[192.168.7.23])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mzbFi-0000T7-0y; Tue, 21 Dec 2021 09:16:10 +0000
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
	bh=xSs5i88a9h2mc4jGkw8ER0pLaLyTKl9RfZj60ujhmdY=; b=2mZvV6PtuYv2y5UdH3QOV5firm
	VIAM1ILN9ib/PCoYMLpCvXPS/jMJrHZFe9gNmKXnLmjQXw6uhsc3pLCZS0xBCF6Z1gufX2Cl8b2de
	osH84PemNMNiYsqrWNIwo5rTDYR6Bnih53pOZ4xPF2jmh8iNxzcff9zioaTwhEHpMgk4=;
Message-ID: <dcc6903c-f478-548e-9642-269eaf2291a0@xen.org>
Date: Tue, 21 Dec 2021 10:16:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v3 02/13] xen: harmonize return types of hypercall
 handlers
To: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>
References: <20211208155606.20029-1-jgross@suse.com>
 <20211208155606.20029-3-jgross@suse.com>
 <7dd419c1-9ad0-798e-317b-71c8e613ff3e@xen.org>
 <4e9947b6-08b4-4ac6-9cfe-538c3b34175e@suse.com>
 <alpine.DEB.2.22.394.2112151757410.3376@ubuntu-linux-20-04-desktop>
 <c650062f-948e-569d-d4fa-e5333867854e@suse.com>
 <alpine.DEB.2.22.394.2112161232310.3376@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2112161246180.3376@ubuntu-linux-20-04-desktop>
 <29c14fd7-4ae2-a277-2413-faa330afc49b@suse.com>
 <67d3c4da-9a20-24ca-543f-02ecf4676277@suse.com>
 <287c8fba-b22f-95ec-21d4-e440e7e7fb36@suse.com>
 <e41d26aa-9ef5-459a-c143-caf28e43c47c@xen.org>
 <a91217dc-8f97-2882-ce08-2a408654295e@suse.com>
 <alpine.DEB.2.22.394.2112171459490.1662642@ubuntu-linux-20-04-desktop>
 <df06a42a-89a2-625e-25a3-da0090cc7bc7@xen.org>
 <0d7f817a-d012-cbff-8179-6926dffa2352@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0d7f817a-d012-cbff-8179-6926dffa2352@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 21/12/2021 08:45, Juergen Gross wrote:
> On 20.12.21 18:14, Julien Grall wrote:
>> Hi,
>>
>> On 18/12/2021 00:00, Stefano Stabellini wrote:
>>> On Fri, 17 Dec 2021, Juergen Gross wrote:
>>>> On 17.12.21 11:41, Julien Grall wrote:
>>>>> Hi Juergen,
>>>>>
>>>>> On 17/12/2021 08:50, Juergen Gross wrote:
>>>>>> On 17.12.21 08:45, Jan Beulich wrote:
>>>>>>> On 17.12.2021 06:34, Juergen Gross wrote:
>>>>>>>> On 16.12.21 22:15, Stefano Stabellini wrote:
>>>>>>>>> On Thu, 16 Dec 2021, Stefano Stabellini wrote:
>>>>>>>>>> On Thu, 16 Dec 2021, Juergen Gross wrote:
>>>>>>>>>>> On 16.12.21 03:10, Stefano Stabellini wrote:
>>>>>>>>>>>> The case of XENMEM_maximum_ram_page is interesting but it is
>>>>>>>>>>>> not a
>>>>>>>>>>>> problem in reality because the max physical address size is
>>>>>>>>>>>> only 40-bit
>>>>>>>>>>>> for aarch32 guests, so 32-bit are always enough to return the
>>>>>>>>>>>> highest
>>>>>>>>>>>> page in memory for 32-bit guests.
>>>>>>>>>>>
>>>>>>>>>>> You are aware that this isn't the guest's max page, but the
>>>>>>>>>>> host's?
>>>>>>>>>
>>>>>>>>> I can see now that you meant to say that, no matter what is the 
>>>>>>>>> max
>>>>>>>>> pseudo-physical address supported by the VM, 
>>>>>>>>> XENMEM_maximum_ram_page
>>>>>>>>> is
>>>>>>>>> supposed to return the max memory page, which could go above the
>>>>>>>>> addressibility limit of the VM.
>>>>>>>>>
>>>>>>>>> So XENMEM_maximum_ram_page should potentially be able to return
>>>>>>>>> (1<<44)
>>>>>>>>> even when called by an aarch32 VM, with max IPA 40-bit.
>>>>>>>>>
>>>>>>>>> I would imagine it could be useful if dom0 is 32-bit but domUs are
>>>>>>>>> 64-bit on a 64-bit hypervisor (which I think it would be a very 
>>>>>>>>> rare
>>>>>>>>> configuration on ARM.)
>>>>>>>>>
>>>>>>>>> Then it looks like XENMEM_maximum_ram_page needs to be able to
>>>>>>>>> return a
>>>>>>>>> value > 32-bit when called by a 32-bit guest.
>>>>>>>>>
>>>>>>>>> The hypercall ABI follows the ARM C calling convention, so a 
>>>>>>>>> 64-bit
>>>>>>>>> value should be returned using r0 and r1. But looking at
>>>>>>>>> xen/arch/arm/traps.c:do_trap_hypercall, it doesn't seem it ever 
>>>>>>>>> sets
>>>>>>>>> r1
>>>>>>>>> today. Only r0 is set, so effectively we only support 32-bit 
>>>>>>>>> return
>>>>>>>>> values on aarch32 and for aarch32 guests.
>>>>>>>>>
>>>>>>>>> In other words, today all hypercalls on ARM return 64-bit to 
>>>>>>>>> 64-bit
>>>>>>>>> guests and 32-bit to 32-bit guests. Which in the case of memory_op
>>>>>>>>> is
>>>>>>>>> "technically" the correct thing to do because it matches the C
>>>>>>>>> declaration in xen/include/xen/hypercall.h:
>>>>>>>>>
>>>>>>>>> extern long
>>>>>>>>> do_memory_op(
>>>>>>>>>        unsigned long cmd,
>>>>>>>>>        XEN_GUEST_HANDLE_PARAM(void) arg);
>>>>>>>>>
>>>>>>>>> So...  I guess the conclusion is that on ARM do_memory_op should
>>>>>>>>> return
>>>>>>>>> "long" although it is not actually enough for a correct
>>>>>>>>> implementation
>>>>>>>>> of XENMEM_maximum_ram_page for aarch32 guests ?
>>>>>>>>>
>>>>>>>>
>>>>>>>> Hence my suggestion to check the return value of _all_ 
>>>>>>>> hypercalls to
>>>>>>>> be
>>>>>>>> proper sign extended int values for 32-bit guests. This would 
>>>>>>>> fix all
>>>>>>>> potential issues without silently returning truncated values.
>>>>>>>
>>>>>>> Are we absolutely certain we have no other paths left where a 
>>>>>>> possibly
>>>>>>> large unsigned values might be returned? In fact while
>>>>>>> compat_memory_op() does the necessary saturation, I've never been 
>>>>>>> fully
>>>>>>> convinced of this being the best way of dealing with things. The 
>>>>>>> range
>>>>>>> of error indicators is much smaller than [-INT_MIN,-1], so almost
>>>>>>> double the range of effectively unsigned values could be passed back
>>>>>>> fine. (Obviously we can't change existing interfaces, so this mem-op
>>>>>>> will need to remain as is.)
>>>>>>
>>>>>> In fact libxenctrl tries do deal with this fact by wrapping a 
>>>>>> memory_op
>>>>>> for a 32-bit environment into a multicall. This will work fine for a
>>>>>> 32-bit Arm guest, as xen_ulong_t is a uint64 there.
>>>>>>
>>>>>> So do_memory_op should return long on Arm, yes. OTOH doing so will
>>>>>> continue to be a problem in case a 32-bit guest doesn't use the
>>>>>> multicall technique for handling possible 64-bit return values.
>>>>>>
>>>>>> So I continue to argue that on Arm the return value of a hypercall
>>>>>> should be tested to fit into 32 bits.
>>>>>
>>>>> It would make sense. But what would you return if the value doesn't 
>>>>> fit?
>>>>
>>>> I guess some errno value would be appropriate, like -EDOM, -ERANGE or
>>>> -E2BIG.
>>>
>>> This seems to be better than the alternative below as it is a lot
>>> simpler.
>>
>> We would still need to special case XENMEM_maximum_reservation (or 
>> rework the implementation of the sub-op) because the value returned is 
>> an unsigned long. So technically, the unsigned value for -EDOM & co 
>> could be interpreted as the maximum host frame number.
> 
> I guess you meant XENMEM_maximum_ram_page.

Hmmmm yes.

> 
> What about setting -EDOM only if the high 32 bits are not all the same?
> This would mean to clamp the highest RAM page to -EDOM in case the
> caller is interpreting it as an unsigned value. This would still be
> better than silently dropping the high bits, which could lead to a
> rather low page number instead.

This feels like quite a hack. So I would prefer the low page number. I 
am interested to hear about the others.

> 
>> I also would like to see the hypercall returning 'int' when they are 
>> only meant to return 32-bit value. This will make easier to spot 
>> someone that decide to return a 64-bit value.
> 
> I guess this would need to include all hypercalls handled in common
> code?

Ideally yes.

> 
>>>>>> The only really clean alternative
>>>>>> would be to have separate hypercall function classes for Arm 32- and
>>>>>> 64-bit guests (which still could share most of the functions by 
>>>>>> letting
>>>>>> those return "int"). This would allow to use the 64-bit variant 
>>>>>> even for
>>>>>> 32-bit guests in multicall (fine as the return field is 64-bit wide),
>>>>>> and a probably saturating compat version for the 32-bit guest direct
>>>>>> hypercall.
>>>>>
>>>>> I am not entirely sure to understand this proposal. Can you clarify 
>>>>> it?
>>>>
>>>> 1. In patch 5 modify the hypercall table by adding another column, so
>>>>     instead of:
>>>>     +table:           pv32     pv64     hvm32    hvm64    arm
>>>>     use:
>>>>     +table:           pv32     pv64     hvm32    hvm64    arm32    
>>>> arm64
>>>>
>>>> 2. Let most of the hypercalls just return int instead of long:
>>>>     +rettype: do int
>>>>
>>>> 3. Have an explicit 64-bit variant of memory_op (the 32-bit one is the
>>>>     compat variant existing already):
>>>>     +rettype: do64 long
>>>>     +prefix: do64 PREFIX_hvm
>>>>     +memory_op(unsigned long cmd, void *arg)
>>>>
>>>> 4. Use the appropriate calls in each column:
>>>>     +memory_op         compat   do64     hvm      hvm      compat  do64
>>>>
>>>> 5. In the Arm hypercall trap handler do:
>>>>     if ( is_32bit_domain(current->domain) )
>>>>         call_handlers_arm32(...);
>>>>     else
>>>>         call_handlers_arm64(...);
>>>>
>>>> 6. In the multicall handler always do:
>>>>     call_handlers_arm64(...);
>> I am probably missing something. But why do we need to have separate 
>> call handlers for arm32/arm64?
> 
> How else could you have different functions called for 32- and 64-bit
> guests (other than doing the distinction in the called functions)?

At least for near future, I expect do_memory_op() to be the only one 
requiring special distinction. So my preference would be to handle the 
difference there rather than adding extra logic/indirection.

Cheers,

-- 
Julien Grall

