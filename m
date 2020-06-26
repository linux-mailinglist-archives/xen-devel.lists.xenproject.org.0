Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA05620B1F3
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 15:01:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jony9-0000Zj-5x; Fri, 26 Jun 2020 13:00:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J8X4=AH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jony7-0000Ze-8Y
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 13:00:35 +0000
X-Inumbo-ID: 058afb5a-b7ad-11ea-82ba-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 058afb5a-b7ad-11ea-82ba-12813bfff9fa;
 Fri, 26 Jun 2020 13:00:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3C0EFAAC3;
 Fri, 26 Jun 2020 13:00:33 +0000 (UTC)
Subject: Re: [PATCH for-4.14] x86/livepatch: Make livepatching compatible with
 CET Shadow Stacks
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200608200259.17681-1-andrew.cooper3@citrix.com>
 <620e5f66-2802-24e7-bb6e-285e99f12975@suse.com>
 <6e353c85-b957-bdbe-6428-737b5bc8e801@citrix.com>
 <d503e23a-f7ca-3a21-940d-9c57aa5d440a@suse.com>
 <ac1aca68-5402-746b-8a17-3354e530eafd@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8c4159dc-45c8-51c2-4e30-5a17bfca87bb@suse.com>
Date: Fri, 26 Jun 2020 15:00:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <ac1aca68-5402-746b-8a17-3354e530eafd@citrix.com>
Content-Type: text/plain; charset=utf-8
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
Cc: Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Paul Durrant <paul@xen.org>,
 Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.06.2020 13:56, Andrew Cooper wrote:
> On 15/06/2020 16:16, Jan Beulich wrote:
>>>>> @@ -58,6 +59,10 @@ int arch_livepatch_safety_check(void)
>>>>>  
>>>>>  int arch_livepatch_quiesce(void)
>>>>>  {
>>>>> +    /* If Shadow Stacks are in use, disable CR4.CET so we can modify CR0.WP. */
>>>>> +    if ( cpu_has_xen_shstk )
>>>>> +        write_cr4(read_cr4() & ~X86_CR4_CET);
>>>>> +
>>>>>      /* Disable WP to allow changes to read-only pages. */
>>>>>      write_cr0(read_cr0() & ~X86_CR0_WP);
>>>>>  
>>>>> @@ -68,6 +73,29 @@ void arch_livepatch_revive(void)
>>>>>  {
>>>>>      /* Reinstate WP. */
>>>>>      write_cr0(read_cr0() | X86_CR0_WP);
>>>>> +
>>>>> +    /* Clobber dirty bits and reinstate CET, if applicable. */
>>>>> +    if ( IS_ENABLED(CONFIG_XEN_SHSTK) && cpu_has_xen_shstk )
>>>>> +    {
>>>>> +        unsigned long tmp;
>>>>> +
>>>>> +        reset_virtual_region_perms();
>>>>> +
>>>>> +        write_cr4(read_cr4() | X86_CR4_CET);
>>>>> +
>>>>> +        /*
>>>>> +         * Fix up the return address on the shadow stack, which currently
>>>>> +         * points at arch_livepatch_quiesce()'s caller.
>>>>> +         *
>>>>> +         * Note: this is somewhat fragile, and depends on both
>>>>> +         * arch_livepatch_{quiesce,revive}() being called from the same
>>>>> +         * function, which is currently the case.
>>>>> +         */
>>>>> +        asm volatile ("rdsspq %[ssp];"
>>>>> +                      "wrssq %[addr], (%[ssp]);"
>>>>> +                      : [ssp] "=&r" (tmp)
>>>>> +                      : [addr] "r" (__builtin_return_address(0)));
>>>>> +    }
>>>> To be safe against LTO I think this wants accompanying with making
>>>> both functions noinline.
>>> Hmm true.
>>>
>>>> As to the fragility - how about arch_livepatch_quiesce() returning
>>>> __builtin_return_address(0) to its caller, for passing into here
>>>> for verification? This would also make more noticeable that the
>>>> two should be be called from the same function (or else the "token"
>>>> would need passing further around).
>>> This I'm less certain about, as its fairly invasive to common code, just
>>> to bodge around something I don't expect to last very long into the 4.15
>>> timeframe.
>> I don't see it  being invasive - there's a new local variable needed
>> in both of apply_payload() and revert_payload(), and of course the
>> call sites would need adjustment.
> 
> Exactly - the call site adjustment is what makes it invasive in common
> code, and all other architectures.
> 
> Any getting this wrong will die with #CP[near ret] anyway.
> 
> The only thing passing that value around would do is let you tweak the
> error message slightly before we crash out.

Well, okay - I'm not a maintainer of that part of the code anyway.

Jan

