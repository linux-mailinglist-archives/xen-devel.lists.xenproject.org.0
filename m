Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2370467C868
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 11:21:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484924.751813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKzNQ-0000o8-Mz; Thu, 26 Jan 2023 10:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484924.751813; Thu, 26 Jan 2023 10:21:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKzNQ-0000mB-K1; Thu, 26 Jan 2023 10:21:04 +0000
Received: by outflank-mailman (input) for mailman id 484924;
 Thu, 26 Jan 2023 10:21:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pKzNP-0000m5-Pd
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 10:21:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKzNK-0007Vt-SO; Thu, 26 Jan 2023 10:20:58 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.8.102]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKzNK-0008Jy-Kt; Thu, 26 Jan 2023 10:20:58 +0000
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
	bh=WBQlvO9xVxVW5S63BCblukKsAP/S14u07uD/HmlDkr4=; b=mdu0VHFTLzK/2O+RN8aygI81QP
	tYRl3XTnsdv8j8fwEsSNAfi05utn8BlN9WhgzKh3vyXUPU9d+HuOiGIH7FFR/NYOrAOcxWYUrki/z
	uzpimIhmYKAK3NaYf2FEWgccLT2LT/MxuPuoN4Q301Xw5FM449yG/fMwTt+sJ1Smsp8s=;
Message-ID: <0ec4c364-1e18-4176-ac24-ece84eb72859@xen.org>
Date: Thu, 26 Jan 2023 10:20:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 04/11] xen: extend domctl interface for cache coloring
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
 <20230123154735.74832-5-carlo.nonato@minervasys.tech>
 <9bfee6d9-9cb2-262e-5a46-91b0bf35d60b@suse.com>
 <CAG+AhRW+45gt7ZyOYSjaQZbfLORNsJVeADk_Tb7j9CEyTcY6QQ@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAG+AhRW+45gt7ZyOYSjaQZbfLORNsJVeADk_Tb7j9CEyTcY6QQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/01/2023 16:27, Carlo Nonato wrote:
> On Tue, Jan 24, 2023 at 5:29 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 23.01.2023 16:47, Carlo Nonato wrote:
>>> @@ -275,6 +276,19 @@ unsigned int *dom0_llc_colors(unsigned int *num_colors)
>>>       return colors;
>>>   }
>>>
>>> +unsigned int *llc_colors_from_guest(struct xen_domctl_createdomain *config)
>>
>> const struct ...?
>>
>>> +{
>>> +    unsigned int *colors;
>>> +
>>> +    if ( !config->num_llc_colors )
>>> +        return NULL;
>>> +
>>> +    colors = alloc_colors(config->num_llc_colors);
>>
>> Error handling needs to occur here; the panic() in alloc_colors() needs
>> to go away.
>>
>>> @@ -434,7 +436,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>>               rover = dom;
>>>           }
>>>
>>> -        d = domain_create(dom, &op->u.createdomain, false);
>>> +        if ( llc_coloring_enabled )
>>> +        {
>>> +            llc_colors = llc_colors_from_guest(&op->u.createdomain);
>>> +            num_llc_colors = op->u.createdomain.num_llc_colors;
>>
>> I think you would better avoid setting num_llc_colors to non-zero if
>> you got back NULL from the function. It's at best confusing.
>>
>>> @@ -92,6 +92,10 @@ struct xen_domctl_createdomain {
>>>       /* CPU pool to use; specify 0 or a specific existing pool */
>>>       uint32_t cpupool_id;
>>>
>>> +    /* IN LLC coloring parameters */
>>> +    uint32_t num_llc_colors;
>>> +    XEN_GUEST_HANDLE(uint32) llc_colors;
>>
>> Despite your earlier replies I continue to be unconvinced that this
>> is information which needs to be available right at domain_create.
>> Without that you'd also get away without the sufficiently odd
>> domain_create_llc_colored(). (Odd because: Think of two or three
>> more extended features appearing, all of which want a special cased
>> domain_create().)
> 
> Yes, I definitely see your point. Still there is the p2m table allocation
> problem that you and Julien have discussed previously. I'm not sure I
> understood what the approach is.

Henry has sent a series [1] to remove the requirement to allocate the 
P2M in domain_create().

With that series applied, there requirements to pass the colors at 
domain creation should be lifted.

Cheers,

[1] 
https://lore.kernel.org/xen-devel/20230116015820.1269387-1-Henry.Wang@arm.com/

> 
>> Jan

-- 
Julien Grall

