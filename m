Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6905FB37B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 15:34:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420281.665037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiFO6-0004Sv-El; Tue, 11 Oct 2022 13:33:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420281.665037; Tue, 11 Oct 2022 13:33:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiFO6-0004RA-Ae; Tue, 11 Oct 2022 13:33:38 +0000
Received: by outflank-mailman (input) for mailman id 420281;
 Tue, 11 Oct 2022 13:33:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oiFO4-0004R4-Vx
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 13:33:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oiFO0-0002l8-JG; Tue, 11 Oct 2022 13:33:32 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.14.212]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oiFO0-0002aI-CA; Tue, 11 Oct 2022 13:33:32 +0000
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
	bh=WFc6xpKXMAEIOWCleSu0UUdBGcfxJX5Ix2+BZR3CeWE=; b=ZHIuApTcci4X7s8wo2WC2tyqjv
	ts2wsHfyWJyWHe4P/BitwPc50RLSfDPSs330VzythlPALczN5sqdmKcEbJlXPpCMdg2H0kk2zTvLw
	Rz1PqpvBrkixeLqkE9IldddGYyHAwSdVXE3qceFgG8/f4uevmapgZqNSPW63e6EbkCn8=;
Message-ID: <d297735d-771e-22f2-1b46-9c390ebb5afd@xen.org>
Date: Tue, 11 Oct 2022 14:33:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.1
Subject: Re: [PATCH V7 2/2] xen/gnttab: Store frame GFN in struct page_info on
 Arm
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org,
 Henry Wang <Henry.Wang@arm.com>
References: <20220716145658.4175730-1-olekstysh@gmail.com>
 <20220716145658.4175730-2-olekstysh@gmail.com>
 <df56f268-59d8-4b9a-52a6-40bfd0b91414@suse.com>
 <acedd354-9050-5340-ffd8-259aeb95b101@xen.org>
 <77349d2b-de72-3e68-362a-493f350eeec4@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <77349d2b-de72-3e68-362a-493f350eeec4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 11/10/2022 14:28, Jan Beulich wrote:
> On 11.10.2022 15:01, Julien Grall wrote:
>> Hi Jan,
>>
>> On 11/10/2022 12:59, Jan Beulich wrote:
>>> On 16.07.2022 16:56, Oleksandr Tyshchenko wrote:
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>
>>>> Rework Arm implementation to store grant table frame GFN
>>>> in struct page_info directly instead of keeping it in
>>>> standalone status/shared arrays. This patch is based on
>>>> the assumption that a grant table page is a xenheap page.
>>>>
>>>> To cover 64-bit/40-bit IPA on Arm64/Arm32 we need the space
>>>> to hold 52-bit/28-bit + extra bit value respectively. In order
>>>> to not grow the size of struct page_info borrow the required
>>>> amount of bits from type_info's count portion which current
>>>> context won't suffer (currently only 1 bit is used on Arm).
>>>
>>> I'm afraid this isn't true: There's no requirement for a guest to pass
>>> all different GFNs to VCPUOP_register_vcpu_info, yet map_vcpu_info()
>>> tries to obtain a reference for every vCPU.
>>
>> AFAIU, this would be a reference of the **count_info** not **type_info**
>> (which BTW will never be incremented on Arm because we have no type
>> support).
> 
> I should have said "obtain a writable type reference".

Thanks for the clarification.

> 
>> The commit message is only referring to the 'type_info's count'. So...
>>
>>> With my adding of GFN
>>> (really gaddr) based registration of the runstate area (already
>>> looking towards 4.18) the maximum possible count is to further grow.
>>
>> ... I am not sure which problem you are referring too.
> 
> Wow - a mere stub (but not inline) function to make the build happy.
> Then why is the description talking about one bit that's needed on
> Arm?

Because share_xen_page_with_guest() will always set the type info's 
count to 1.

TBH I don't exactly know why we set it. I always assumed this was a 
requirement for the common code but never checked.

Cheers,


-- 
Julien Grall

