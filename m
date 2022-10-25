Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F51160D53C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 22:08:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430210.681630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onQDJ-0003bK-S6; Tue, 25 Oct 2022 20:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430210.681630; Tue, 25 Oct 2022 20:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onQDJ-0003Yt-PS; Tue, 25 Oct 2022 20:07:53 +0000
Received: by outflank-mailman (input) for mailman id 430210;
 Tue, 25 Oct 2022 20:07:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1onQDI-0003Yn-Ux
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 20:07:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1onQDI-0002mo-D8; Tue, 25 Oct 2022 20:07:52 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[10.95.108.38])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1onQDI-0006U1-7D; Tue, 25 Oct 2022 20:07:52 +0000
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
	bh=0ijPOy6X/gbE/lY+84pSyQFSNRQqZbof40ouXZYDmQc=; b=47M3qoYFlkxddit/SQvGi3mpGM
	3BuPIwdPKV6azm1ZtT8LB8lnMYrF4vchBUdeh9IFBla+ZomugeJMcZ6/KsJ5YOq6rIeBjecjw4yYK
	Je2AjvoziceOP1eHT2MjA2UkCLnN0+V6VpfDypXD/HLMFQESHh0rWFp4uFq5FbpIjrQg=;
Message-ID: <567ef77a-58ed-c63b-11f4-f1eed0c7fb5e@xen.org>
Date: Tue, 25 Oct 2022 21:07:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [RFC v2 01/12] xen/arm: Clean-up the memory layout
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: marco.solieri@minervasys.tech, lucmiccio@gmail.com,
 carlo.nonato@minervasys.tech, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221022150422.17707-1-julien@xen.org>
 <20221022150422.17707-2-julien@xen.org>
 <c5767718-bb00-da6b-8623-1bcb6c832f85@amd.com>
 <dffca6a6-3a7c-a8ea-b61e-a37011a7afb8@xen.org>
 <906f4f04-4c06-8e93-1c4f-90be7d508f44@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <906f4f04-4c06-8e93-1c4f-90be7d508f44@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/10/2022 11:36, Michal Orzel wrote:
> Hi,
> 
> On 25/10/2022 12:31, Julien Grall wrote:
>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>
>>
>> On 25/10/2022 10:21, Michal Orzel wrote:
>>> Hi Julien,
>>
>> Hi Michal,
>>
>>
>>> On 22/10/2022 17:04, Julien Grall wrote:
>>>>
>>>>
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> In a follow-up patch, the base address for the common mappings will
>>>> vary between arm32 and arm64. To avoid any duplication, define
>>>> every mapping in the common region from the previous one.
>>> Maybe the following title would be better suited if you only want to touch the common mappings?
>>> "xen/arm: Clean-up the common memory layout"
>>
>> Ok.
>>
>>>
>>>>
>>>> Take the opportunity to add missing *_SIZE for FIXMAP_VIRT_* and
>>>> XEN_VIRT_*.
>>>>
>>>> Take the opportunity to add missing *_SIZE for some mappings.
>>> I think this sentence can be removed as the previous one already covers it.
>>
>> Yes. I will remove it.
>>
>>>
>>> Apart from that, wouldn't it be useful to do the cleanup for the arm32 macros
>>> as you are here (FRAMETABLE, VMAP, {XEN/DOM}HEAP) ?
>>
>> Can you clarify? I looked at the macros and they look clean to me.
>>
> As you choose to make use of MB() macro, I think it would be beneficial
> just from the consistency perspective to modify other places that use directly hex values.
> We already do that for arm64 specific mappings, you are modifying the common ones
> to adhere to this way, so as a natural consequence I would see the arm32 ones to be modified as well.

You have a point. I will look to do it in this patch.

Cheers,

-- 
Julien Grall

