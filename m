Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B25067C83A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 11:16:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484919.751804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKzIX-0007nI-5n; Thu, 26 Jan 2023 10:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484919.751804; Thu, 26 Jan 2023 10:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKzIX-0007kq-0z; Thu, 26 Jan 2023 10:16:01 +0000
Received: by outflank-mailman (input) for mailman id 484919;
 Thu, 26 Jan 2023 10:16:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pKzIW-0007kk-JP
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 10:16:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKzIS-0007H3-Lv; Thu, 26 Jan 2023 10:15:56 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.8.102]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKzIS-0008Ei-GK; Thu, 26 Jan 2023 10:15:56 +0000
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
	bh=dXlLCs/wiYB4UdmaSeytTDWjasDq+tpvf201Gl4qjyA=; b=bbAUDPgrPayN8toHLvFSMeutGv
	yOm0cdgFoMog3hbeYNMScDeT330aAGR5haUmzVpUWLddQpJWKB/+2Lilu9un3UcPL4zsRmGPqIrTs
	0aSpsMEPeht+8c1FymhNCwJvG5wtakRpUfp8rSK+qnQ/tifZqkfezwmYnhpoonXbsmq8=;
Message-ID: <2be0aa77-3381-8552-a6e3-917e9005cdc2@xen.org>
Date: Thu, 26 Jan 2023 10:15:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 01/11] xen/common: add cache coloring common code
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
 <20230123154735.74832-2-carlo.nonato@minervasys.tech>
 <a470be46-ab6e-3970-2b04-6f4035adf1cb@suse.com>
 <CAG+AhRX9DVW5EfXKQoDG9hmcE0FORydTZd0pNm-0uqwddaN9NQ@mail.gmail.com>
 <6c952571-6a8d-e4fc-36ec-b5b79dac40f6@suse.com>
 <CAG+AhRUOBgPsT9yU3EtqSPj5VX70H1DsUL_dOWguapC+u3iSvw@mail.gmail.com>
 <bececcba-7606-924d-aba1-f51134414fd0@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <bececcba-7606-924d-aba1-f51134414fd0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 26/01/2023 08:06, Jan Beulich wrote:
> On 25.01.2023 17:18, Carlo Nonato wrote:
>> On Wed, Jan 25, 2023 at 2:10 PM Jan Beulich <jbeulich@suse.com> wrote:
>>> On 25.01.2023 12:18, Carlo Nonato wrote:
>>>> On Tue, Jan 24, 2023 at 5:37 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 23.01.2023 16:47, Carlo Nonato wrote:
>>>>>> --- a/xen/include/xen/sched.h
>>>>>> +++ b/xen/include/xen/sched.h
>>>>>> @@ -602,6 +602,9 @@ struct domain
>>>>>>
>>>>>>       /* Holding CDF_* constant. Internal flags for domain creation. */
>>>>>>       unsigned int cdf;
>>>>>> +
>>>>>> +    unsigned int *llc_colors;
>>>>>> +    unsigned int num_llc_colors;
>>>>>>   };
>>>>>
>>>>> Why outside of any #ifdef, and why not in struct arch_domain?
>>>>
>>>> Moving this in sched.h seemed like the natural continuation of the common +
>>>> arch specific split. Notice that this split is also because Julien pointed
>>>> out (as you did in some earlier revision) that cache coloring can be used
>>>> by other arch in the future (even if x86 is excluded). Having two maintainers
>>>> saying the same thing sounded like a good reason to do that.
>>>
>>> If you mean this to be usable by other arch-es as well (which I would
>>> welcome, as I think I had expressed on an earlier version), then I think
>>> more pieces want to be in common code. But putting the fields here and all
>>> users of them in arch-specific code (which I think is the way I saw it)
>>> doesn't look very logical to me. IOW to me there exist only two possible
>>> approaches: As much as possible in common code, or common code being
>>> disturbed as little as possible.
>>
>> This means having a llc-coloring.c in common where to put the common
>> implementation, right?
> 
> Likely, yes.
> 
>> Anyway right now there is also another user of such fields in common:
>> page_alloc.c.
> 
> Yet hopefully all inside suitable #ifdef.
> 
>>>> The missing #ifdef comes from a discussion I had with Julien in v2 about
>>>> domctl interface where he suggested removing it
>>>> (https://marc.info/?l=xen-devel&m=166151802002263).
>>>
>>> I went about five levels deep in the replies, without finding any such reply
>>> from Julien. Can you please be more specific with the link, so readers don't
>>> need to endlessly dig?
>>
>> https://marc.info/?l=xen-devel&m=166669617917298
>>
>> quote (me and then Julien):
>>>> We can also think of moving the coloring fields from this
>>>> struct to the common one (xen_domctl_createdomain) protecting them with
>>>> the proper #ifdef (but we are targeting only arm64...).
>>
>>> Your code is targeting arm64 but fundamentally this is an arm64 specific
>>> feature. IOW, this could be used in the future on other arch. So I think
>>> it would make sense to define it in common without the #ifdef.
> 
> I'm inclined to read this as a dislike for "#ifdef CONFIG_ARM64", not for
> "#ifdef CONFIG_LLC_COLORING" (or whatever the name of the option was). But
> I guess only Julien can clarify this ...
Your interpretation is correct. I would prefer if the fields are 
protected with #ifdef CONFIG_LLC_COLORING.

Cheers,

-- 
Julien Grall

