Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 844A651D508
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 11:56:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322833.544264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmuhO-0000Bm-6t; Fri, 06 May 2022 09:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322833.544264; Fri, 06 May 2022 09:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmuhO-000092-3m; Fri, 06 May 2022 09:56:34 +0000
Received: by outflank-mailman (input) for mailman id 322833;
 Fri, 06 May 2022 09:56:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nmuhM-00008w-7K
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 09:56:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmuhI-0003WT-Rt; Fri, 06 May 2022 09:56:28 +0000
Received: from [54.239.6.185] (helo=[192.168.5.13])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmuhI-00043m-Lp; Fri, 06 May 2022 09:56:28 +0000
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
	bh=LVAOA5nlxtkofU+oKgZhiLFbxapG32M4X+g1oatNMuU=; b=wqrUVGpnI0p+60lXf/A8kIhpRq
	q42bH766xlxaHsLI9J86FRY0GwgO6kaJAvTOM6Stjf07M2JqagwlOA7qw6gpUP1/Jl0gXFztMJ3LC
	KmfUAmHXs+f/wKYjyHEKHDdB9VthrqiaqAiERUTMmmTREL7T6PcZ5XzgHD5WQaj5yPs4=;
Message-ID: <310a44f4-84d8-f72b-6993-42dc3ca46b87@xen.org>
Date: Fri, 6 May 2022 10:56:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 1/2] xen/arm: gnttab: use static inlines for
 gnttab_{release_}host_mapping*
To: Michal Orzel <michal.orzel@arm.com>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220505103601.322110-1-michal.orzel@arm.com>
 <20220505103601.322110-2-michal.orzel@arm.com>
 <9e759dc2-42f7-01d4-3c3f-17ddfe85018d@suse.com>
 <1be8409a-d550-94d1-bf2e-d53ced5edd0c@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1be8409a-d550-94d1-bf2e-d53ced5edd0c@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/05/2022 08:27, Michal Orzel wrote:
> On 05.05.2022 13:13, Jan Beulich wrote:
>> On 05.05.2022 12:36, Michal Orzel wrote:
>>> --- a/xen/arch/arm/include/asm/grant_table.h
>>> +++ b/xen/arch/arm/include/asm/grant_table.h
>>> @@ -29,12 +29,21 @@ static inline void gnttab_mark_dirty(struct domain *d, mfn_t mfn)
>>>   #endif
>>>   }
>>>   
>>> +static inline bool gnttab_host_mapping_get_page_type(bool ro, struct domain *ld,
>>> +                                                     struct domain *rd)
>>> +{
>>> +    return false;
>>> +}
>>> +
>>> +static inline bool gnttab_release_host_mappings(struct domain *d)
>>> +{
>>> +    return true;
>>> +}
>>
>> Looking at x86 I think all three instances of struct domain * want to
>> be const struct domain *. Then
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> Jan
>>
> Thanks. I think we should mark all parameters as const meaning also const bool ro.

Hmmmm... ro is not a pointer and so the value can only be modified 
within the inline helper. So isn't it a bit pointless to set it to const?

If that's the only comment on the next version, this could be dealt on 
commit.

Cheers,

-- 
Julien Grall

