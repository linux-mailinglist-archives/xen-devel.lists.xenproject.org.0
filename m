Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFFF359ACE
	for <lists+xen-devel@lfdr.de>; Fri,  9 Apr 2021 12:05:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107726.205913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUo0W-0001eK-DO; Fri, 09 Apr 2021 10:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107726.205913; Fri, 09 Apr 2021 10:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUo0W-0001dy-9b; Fri, 09 Apr 2021 10:04:56 +0000
Received: by outflank-mailman (input) for mailman id 107726;
 Fri, 09 Apr 2021 10:04:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lUo0V-0001dn-DW
 for xen-devel@lists.xenproject.org; Fri, 09 Apr 2021 10:04:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lUo0R-0007Np-Nl; Fri, 09 Apr 2021 10:04:51 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lUo0R-0003Ad-CM; Fri, 09 Apr 2021 10:04:51 +0000
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
	bh=fW1oxndRadSLr9X6PXbATbPKfqsXjqZC8qWsJXFwMl8=; b=d3o83cxUSfvS3Q7A09Wm0VqSoD
	ccVSYEx4LUfY937Sv0qwc/KBypK/OgXcmbCe6lfah6LQ/I1OM167BxUrFWFCHA6XIIr0O5N0jBAxp
	rYlrBLtPAKo/FI/VuotrX4LQntBPGKXXpnaDu2d3AiHCdYQfJwQ+gnvwa77k9qciWXvo=;
Subject: Re: [PATCH v2 4/4] xen/arm: Prevent Dom0 to be loaded when using
 dom0less
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210408094818.8173-1-luca.fancellu@arm.com>
 <20210408094818.8173-5-luca.fancellu@arm.com>
 <ebd93270-c8c3-7fb9-9abe-e40fdce8680a@xen.org>
 <48EBE04B-F36C-441C-89A5-44E988A67F1C@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <db4908df-1766-3900-4793-998e666e784e@xen.org>
Date: Fri, 9 Apr 2021 11:04:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <48EBE04B-F36C-441C-89A5-44E988A67F1C@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 09/04/2021 10:56, Luca Fancellu wrote:
> 
> 
>> On 9 Apr 2021, at 10:12, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 08/04/2021 10:48, Luca Fancellu wrote:
>>> This patch prevents the dom0 to be loaded skipping its
>>> building and going forward to build domUs when the dom0
>>> kernel is not found and at least one domU is present.
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>>   docs/features/dom0less.pandoc |  7 +++---
>>>   xen/arch/arm/setup.c          | 42 ++++++++++++++++++++++++++++++++---
>>>   2 files changed, 43 insertions(+), 6 deletions(-)
>>> diff --git a/docs/features/dom0less.pandoc b/docs/features/dom0less.pandoc
>>> index d798596cdf..a5eb5bcda0 100644
>>> --- a/docs/features/dom0less.pandoc
>>> +++ b/docs/features/dom0less.pandoc
>>> @@ -16,9 +16,10 @@ Multiboot specification has been extended to allow for multiple domains
>>>   to be passed to Xen. See docs/misc/arm/device-tree/booting.txt for more
>>>   information about the Multiboot specification and how to use it.
>>>   -Currently, a control domain ("dom0") is still required, but in the
>>> -future it will become unnecessary when all domains are created
>>> -directly from Xen. Instead of waiting for the control domain to be fully
>>> +Currently, a control domain ("dom0") is still required to manage the DomU
>>> +domains, but the system can start also without dom0 if the hypervisor
>>
>> "hypervisor Device Tree" sounds a bit strange to me. I would either drop "hypervisor" or say "host Devicet Tree".
>>
>>> +Device Tree doesn't specify it and it declares one or more domUs.
>>
>> AFAICT, the first "it" refer to dom0 but it is not clear what exact property will used to do the decision.
>>
>> Also you have two 'it' in a row that refers to two different entities. I would name it to avoid confusion.
> 
> Yes I will rephrase it, what about:
> 
> Currently, a control domain ("dom0") is still required to manage the DomU
> domains, but the system can start also without dom0 if the Device Tree
> doesn't specify the dom0 kernel and it declares one or more domUs.

Sounds good to me.

> 
>>
>>> +Instead of waiting for the control domain (when declared) to be fully
>>>   booted and the Xen tools to become available, domains created by Xen
>>>   this way are started right away in parallel. Hence, their boot time is
>>>   typically much shorter.
>>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>>> index b405f58996..ecc4f0ae98 100644
>>> --- a/xen/arch/arm/setup.c
>>> +++ b/xen/arch/arm/setup.c
>>> @@ -793,6 +793,38 @@ static void __init setup_mm(void)
>>>   }
>>>   #endif
>>>   +static bool __init is_dom0less_mode(void)
>>> +{
>>> +    struct bootmodules *mods = &bootinfo.modules;
>>> +    struct bootmodule *mod;
>>> +    unsigned int i;
>>> +    bool dom0found = false;
>>> +    bool domUfound = false;
>>> +
>>> +    /* Look into the bootmodules */
>>> +    for ( i = 0 ; i < mods->nr_mods ; i++ )
>>> +    {
>>> +        mod = &mods->module[i];
>>> +        /* Find if dom0 and domU kernels are present */
>>> +        if ( mod->kind == BOOTMOD_KERNEL )
>>> +        {
>>> +            if ( mod->domU == false )
>>> +            {
>>> +                dom0found = true;
>>> +                break;
>>> +            }
>>
>> NIT: You can directly return false here because if you have dom0 the it can't be dom0less.
> 
> When I can I try to have just one exit point from a function, do you think here it can cause
> issues?

I don't think so. I was only asking that because:
   - It is clearer to me that when you find dom0 then it must not a 
dom0less configuration.
   - It removes dom0found and reduce the code

But this is a non-important things to me (hence the NIT). If you prefer 
your version, then I am happy with it :).

Cheers,

-- 
Julien Grall

