Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3553B7419CC
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 22:39:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556579.869220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEbwo-0001Wz-HV; Wed, 28 Jun 2023 20:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556579.869220; Wed, 28 Jun 2023 20:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEbwo-0001VE-DT; Wed, 28 Jun 2023 20:39:30 +0000
Received: by outflank-mailman (input) for mailman id 556579;
 Wed, 28 Jun 2023 20:39:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qEbwn-0001V7-Ma
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 20:39:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEbwn-0005Ta-Bj; Wed, 28 Jun 2023 20:39:29 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.5.86])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEbwn-0007kM-5o; Wed, 28 Jun 2023 20:39:29 +0000
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
	bh=RrqkAOx4LkYD6BhbuQ+sR1xGXRky6FwwKXDWIOmrGbM=; b=dJJYY7OWJ+ZLS05+5s/SESDc47
	7tVhJTWOGRu34WpnihyjnitNibLI4tVdvQLHHG3b1H0Zj6Mp4kcdF3RHVLUmHbmo6l3yxyGpHEzLG
	bmY4nOHcH7i45pW/uQ88s87ZY/XjaIuMf+We5iQBp1nPwIVOTF2BxrsKW55sq2sd72n0=;
Message-ID: <bedaa6de-5232-d497-a886-d3626f8efb0d@xen.org>
Date: Wed, 28 Jun 2023 21:39:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 8/9] xen/arm: Allow the user to build Xen with USBAN
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, Henry.Wang@arm.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-9-julien@xen.org>
 <804682ce-ad88-34dc-1501-c9ff6347fb8b@amd.com>
 <f9afb315-34f8-0e1d-de67-5024fe7f616f@xen.org>
 <bfa85ebc-74a7-e693-6392-cee24302c19e@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <bfa85ebc-74a7-e693-6392-cee24302c19e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/06/2023 09:09, Michal Orzel wrote:
> Hi Julien,
> 
> On 26/06/2023 14:56, Julien Grall wrote:
>>
>>
>> Hi,
>>
>> On 26/06/2023 12:56, Michal Orzel wrote:
>>>
>>>
>>> On 25/06/2023 22:49, Julien Grall wrote:
>>>>
>>>>
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> UBSAN has been enabled a few years ago on x86 but was never
>>>> enabled on Arm because the final binary is bigger than 2MB (
>>>> the maximum we can currently handled).
>>>>
>>>> With the recent rework, it is now possible to grow Xen over 2MB.
>>>> So there is no more roadblock to enable Xen other than increasing
>>>> the reserved area.
>>>>
>>>> On my setup, for arm32, the final binaray was very close to 4MB.
>>>> Furthermore, one may want to enable USBAN and GCOV which would put
>>>> the binary well-over 4MB (both features require for some space).
>>>> Therefore, increase the size to 8MB which should us some margin.
>>>>
>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>>
>>>> ----
>>>>
>>>> The drawback with this approach is that we are adding 6 new
>>>> page-table (3 for boot and 3 for runtime) that are statically
>>>> allocated. So the final Xen binary will be 24KB bigger when
>>>> neither UBSAN nor GCOV.
>>>>
>>>> If this is not considered acceptable, then we could make the
>>>> size of configurable in the Kconfig and decide it based on the
>>>> features enabled.
>>> Both of these features are enabled only in a debug build of Xen, so
>>> another option would be to increase Xen size only for a debug build.
>>
>> At least UBSAN can be selected without DEBUG. For that you need to add
>> EXPERT.
>>
>> Anyway, from your comment, it is not clear to me whether you dislike the
>> existing approach (and why) or you are OK with the increase.
> Sorry, I was traveling and did not have time to complete review.
> I cannot see why increasing the size would be problematic so it is ok. That said, it could be
> a good idea to write some comment above XEN_VIRT_SIZE, that this value is somewhat exaggerated,
> so that we are on the safe side at the time of activating features like UBSAN/GCOV.

Sure. I will add a comment in this patch. For ...

> 
> Also, it would be nice to update comments in head.S of both arm32 and arm64 above
> GLOBAL(start) that were left stating:
> "All of text+data+bss must fit in 2MB, or the initial pagetable code below will need adjustment."

... this one, I am thinking to drop the comments in patch #5. They don't 
make sense anymore as we can now in theory deal with Xen up to the size 
of a L2 mapping (1GB for 4KB).

> 
> Other than that:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks.

Cheers,

-- 
Julien Grall

