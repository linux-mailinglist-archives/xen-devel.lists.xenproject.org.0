Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9F5211EF2
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 10:34:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqufw-0004Kv-Aj; Thu, 02 Jul 2020 08:34:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jqufu-0004Kq-Po
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 08:34:30 +0000
X-Inumbo-ID: d8a2368a-bc3e-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8a2368a-bc3e-11ea-b7bb-bc764e2007e4;
 Thu, 02 Jul 2020 08:34:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4C4C3B1DB;
 Thu,  2 Jul 2020 08:34:29 +0000 (UTC)
Subject: Re: [PATCH v4 02/10] x86/vmx: add IPT cpu feature
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <7302dbfcd07dfaad9e50bb772673e588fcc4de67.1593519420.git.michal.leszczynski@cert.pl>
 <f935f7f0-30e4-4ba2-588f-a8368a7b93b1@citrix.com>
 <20200702081020.GW735@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5bb2fb6a-c4f4-7d88-9e07-7922d4235338@suse.com>
Date: Thu, 2 Jul 2020 10:34:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200702081020.GW735@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
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
Cc: Julien Grall <julien@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, tamas.lengyel@intel.com,
 Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei.kang@intel.com,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.07.2020 10:10, Roger Pau Monné wrote:
> On Wed, Jul 01, 2020 at 10:42:55PM +0100, Andrew Cooper wrote:
>> On 30/06/2020 13:33, Michał Leszczyński wrote:
>>> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
>>> index ca94c2bedc..b73d824357 100644
>>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>>> @@ -291,6 +291,12 @@ static int vmx_init_vmcs_config(void)
>>>          _vmx_cpu_based_exec_control &=
>>>              ~(CPU_BASED_CR8_LOAD_EXITING | CPU_BASED_CR8_STORE_EXITING);
>>>  
>>> +    rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
>>> +
>>> +    /* Check whether IPT is supported in VMX operation. */
>>> +    vmtrace_supported = cpu_has_ipt &&
>>> +                        (_vmx_misc_cap & VMX_MISC_PT_SUPPORTED);
>>
>> There is a subtle corner case here.  vmx_init_vmcs_config() is called on
>> all CPUs, and is supposed to level things down safely if we find any
>> asymmetry.
>>
>> If instead you go with something like this:
>>
>> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
>> index b73d824357..6960109183 100644
>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>> @@ -294,8 +294,8 @@ static int vmx_init_vmcs_config(void)
>>      rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
>>  
>>      /* Check whether IPT is supported in VMX operation. */
>> -    vmtrace_supported = cpu_has_ipt &&
>> -                        (_vmx_misc_cap & VMX_MISC_PT_SUPPORTED);
>> +    if ( !(_vmx_misc_cap & VMX_MISC_PT_SUPPORTED) )
>> +        vmtrace_supported = false;
> 
> This is also used during hotplug, so I'm not sure it's safe to turn
> vmtrace_supported off during runtime, where VMs might be already using
> it. IMO it would be easier to just set it on the BSP, and then refuse
> to bring up any AP that doesn't have the feature.

+1

IOW I also don't think that "vmx_init_vmcs_config() ... is supposed to
level things down safely". Instead I think the expectation is for
CPU onlining to fail if a CPU lacks features compared to the BSP. As
can be implied from what Roger says, doing like what you suggest may
be fine during boot, but past that only at times where we know there's
no user of a certain feature, and where discarding the feature flag
won't lead to other inconsistencies (which may very well mean "never").

Jan

