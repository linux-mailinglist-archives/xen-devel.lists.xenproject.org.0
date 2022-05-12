Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0C85253E8
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 19:42:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327924.550801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npCom-0006xw-0h; Thu, 12 May 2022 17:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327924.550801; Thu, 12 May 2022 17:41:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npCol-0006vK-Tz; Thu, 12 May 2022 17:41:39 +0000
Received: by outflank-mailman (input) for mailman id 327924;
 Thu, 12 May 2022 17:41:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1npCok-0006vE-4j
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 17:41:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1npCog-0004hH-5n; Thu, 12 May 2022 17:41:34 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[10.7.236.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1npCof-0007Zq-Va; Thu, 12 May 2022 17:41:34 +0000
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
	bh=XIFvdu2ShjSqZQqQoq+rvHX8pfWb1z3O4ODBvXh646M=; b=kIjfvUGnGiPL4R0UvkAMtRtmPL
	n+LnKOJtC5lc3YyGsohWQZ5bz4Ij7U6nOAoHT1crV+gTMv3sDL/NBnmorG+tANGKoePvXw3mIderx
	Xi0W7CJq+l4uRaOD0xyYTAH3apineumkP1veVOp1eZ6Ts26YWE5C7edYPgyOcsXHXVKw=;
Message-ID: <cfc676c9-193a-a2a4-9358-6db46d5bbc74@xen.org>
Date: Thu, 12 May 2022 18:41:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v2 1/2] xen/arm: gnttab: use static inlines for
 gnttab_{release_}host_mapping*
To: Michal Orzel <michal.orzel@arm.com>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220506094225.181815-1-michal.orzel@arm.com>
 <20220506094225.181815-2-michal.orzel@arm.com>
 <c7366893-c4fc-dd53-3b20-828e67cc5b91@suse.com>
 <bdf5ed51-0ec4-ca3f-897a-40cfbabcc4c2@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <bdf5ed51-0ec4-ca3f-897a-40cfbabcc4c2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/05/2022 07:52, Michal Orzel wrote:
> On 06.05.2022 12:03, Jan Beulich wrote:
>> On 06.05.2022 11:42, Michal Orzel wrote:
>>> Function unmap_common_complete (common/grant_table.c) defines and sets
>>> a variable ld that is later on passed to a macro:
>>> gnttab_host_mapping_get_page_type().
>>> On Arm this macro does not make use of any arguments causing a compiler
>>> to warn about unused-but-set variable (when -Wunused-but-set-variable
>>> is enabled). Fix it by converting this macro to a static inline
>>> helper and using the boolean return type.
>>>
>>> While there, also convert macro gnttab_release_host_mappings.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

>>
>> This R-b applies only ...
>>
>>> --- a/xen/arch/arm/include/asm/grant_table.h
>>> +++ b/xen/arch/arm/include/asm/grant_table.h
>>> @@ -29,12 +29,22 @@ static inline void gnttab_mark_dirty(struct domain *d, mfn_t mfn)
>>>   #endif
>>>   }
>>>   
>>> +static inline bool gnttab_host_mapping_get_page_type(const bool ro,
>>
>> ... with this const dropped again. As said elsewhere, while not
>> technically wrong we don't normally do so elsewhere, and this ends
>> up inconsistent with ...
>>
>>> +                                                     const struct domain *ld,
>>> +                                                     const struct domain *rd)
>>
>> ... there being just a single const here.
>>
>> Jan
>>
> 
> Do you have any remarks related to the second patch in this series?

FYI, Jan is away this week.

> If yes, I will handle removal of const in the next version.
> If not, Julien said in v1 that this can be handled on commit.

I have committed this patch with the change discussed. I need a bit more 
time to review the second patch.

Cheers,

-- 
Julien Grall

