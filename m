Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 477C72972BE
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 17:46:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11123.29489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzGa-000381-86; Fri, 23 Oct 2020 15:46:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11123.29489; Fri, 23 Oct 2020 15:46:08 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzGa-00037e-4q; Fri, 23 Oct 2020 15:46:08 +0000
Received: by outflank-mailman (input) for mailman id 11123;
 Fri, 23 Oct 2020 15:46:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kVzGY-00037Z-NH
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:46:06 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7001696-143d-49f6-b10a-9c4fc0701a5f;
 Fri, 23 Oct 2020 15:46:04 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVzGS-0006x1-1x; Fri, 23 Oct 2020 15:46:00 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVzGR-0008Qn-S0; Fri, 23 Oct 2020 15:46:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kVzGY-00037Z-NH
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:46:06 +0000
X-Inumbo-ID: c7001696-143d-49f6-b10a-9c4fc0701a5f
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c7001696-143d-49f6-b10a-9c4fc0701a5f;
	Fri, 23 Oct 2020 15:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=GvqaUzrigzIbVtYNvyY97YRR3jek2DTCCG92ttcjFIA=; b=COOtbH5sd1SNbg+g6mTYtWtsem
	yMQxIrCDxSQ9nzrhyKeshIWNlOzyDUxOzXwvStetl99b2b8c7NRyB3AbjcDk0cdBo1vnhaGgquj7n
	yJPGQuOzscJLbqKNU5mtRKirAjCG9bSQVH3iYr1mZ2iy50ltxlH2+18xwRiRHFbM130g=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVzGS-0006x1-1x; Fri, 23 Oct 2020 15:46:00 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVzGR-0008Qn-S0; Fri, 23 Oct 2020 15:46:00 +0000
Subject: Re: [PATCH v4 2/4] xen: Introduce HAS_M2P config and use to protect
 mfn_to_gmfn call
From: Julien Grall <julien@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20200921180214.4842-1-julien@xen.org>
 <20200921180214.4842-3-julien@xen.org>
 <a2e1773d-cb01-fa02-334a-a642f9316b57@citrix.com>
 <d80519d8-6699-7beb-9192-0e87623b0b62@xen.org>
 <bc50c5cd-d239-60a4-0a66-790717de5815@citrix.com>
 <ff006b75-73d2-ae21-1811-fbd5c9c244c7@xen.org>
Message-ID: <32d4f762-a61d-bfdd-c4a8-38e5edef1aa8@xen.org>
Date: Fri, 23 Oct 2020 16:45:57 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <ff006b75-73d2-ae21-1811-fbd5c9c244c7@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi,

On 26/09/2020 14:00, Julien Grall wrote:
> Hi Andrew,
> 
> On 22/09/2020 19:56, Andrew Cooper wrote:
>> On 22/09/2020 19:20, Julien Grall wrote:
>>>>> +
>>>>>    #endif /* __ASM_DOMAIN_H__ */
>>>>>      /*
>>>>> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
>>>>> index 5c5e55ebcb76..7564df5e8374 100644
>>>>> --- a/xen/include/public/domctl.h
>>>>> +++ b/xen/include/public/domctl.h
>>>>> @@ -136,6 +136,12 @@ struct xen_domctl_getdomaininfo {
>>>>>        uint64_aligned_t outstanding_pages;
>>>>>        uint64_aligned_t shr_pages;
>>>>>        uint64_aligned_t paged_pages;
>>>>> +#define XEN_INVALID_SHARED_INFO_FRAME (~(uint64_t)0)
>>>>
>>>> We've already got INVALID_GFN as a constant used in the interface.  
>>>> Lets
>>>> not proliferate more.
>>>
>>> This was my original approach (see [1]) but this was reworked because:
>>>     1) INVALID_GFN is not technically defined in the ABI. So the
>>> toolstack has to hardcode the value in the check.
>>>     2) The value is different between 32-bit and 64-bit Arm as
>>> INVALID_GFN is defined as an unsigned long.
>>>
>>> So providing a new define is the right way to go.
>>
>> There is nothing special about this field.  It should not have a
>> dedicated constant, when a general one is the appropriate one to use.
>>
>> libxl already has LIBXL_INVALID_GFN, which is already used.
> 
> Right, but that's imply it cannot be used by libxc as this would be a 
> layer violation.
> 
>>
>> If this isn't good enough, them the right thing to do is put a proper
>> INVALID_GFN in the tools interface.
> 
> That would be nice but I can see some issue on x86 given that we don't 
> consistenly define a GFN in the interface as a 64-bit value.
> 
> So would you still be happy to consider introducing XEN_INVALID_GFN in 
> the interface with some caveats?

Gentle ping. @Andrew, are you happy with this approach?

Cheers,

-- 
Julien Grall

