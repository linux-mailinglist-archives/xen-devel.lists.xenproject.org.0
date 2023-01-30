Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA86681930
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 19:31:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487164.754690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMYvo-0006ex-LX; Mon, 30 Jan 2023 18:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487164.754690; Mon, 30 Jan 2023 18:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMYvo-0006cj-HF; Mon, 30 Jan 2023 18:31:04 +0000
Received: by outflank-mailman (input) for mailman id 487164;
 Mon, 30 Jan 2023 18:31:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMYvn-0006cd-JX
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 18:31:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMYvn-0000lg-Ai; Mon, 30 Jan 2023 18:31:03 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.10.117]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMYvn-0004Rf-5e; Mon, 30 Jan 2023 18:31:03 +0000
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
	bh=uOs7yU0ltVCxvR2JglsK9WgzzaL16tYx6DpVFE59/fU=; b=uq+Ab13HD7rvh7/pBSrQLK9rop
	VWQQpdf7SOEb/OgjPGO54+Yop9E+8sUoN+J3+APgipoQdpZu/YoPm/GPG5i+Z/tYBZZYvr1SdKFUk
	qRkujVkpcYr6bbZGr06zsycfCXwMS7bIdEHYMawOvyvxY49osOq1+veBWCPuCYeL2jE8=;
Message-ID: <ca9eb6e5-a4dd-f27d-09e1-fba7c407e014@xen.org>
Date: Mon, 30 Jan 2023 18:31:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v5 1/5] xen/arm32: head: Widen the use of the temporary
 mapping
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230127195508.2786-1-julien@xen.org>
 <20230127195508.2786-2-julien@xen.org>
 <3872442b-b9d0-4594-0869-d505aefa5aa5@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3872442b-b9d0-4594-0869-d505aefa5aa5@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/01/2023 08:58, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> 
> On 27/01/2023 20:55, Julien Grall wrote:
>>
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> At the moment, the temporary mapping is only used when the virtual
>> runtime region of Xen is clashing with the physical region.
>>
>> In follow-up patches, we will rework how secondary CPU bring-up works
>> and it will be convenient to use the fixmap area for accessing
>> the root page-table (it is per-cpu).
>>
>> Rework the code to use temporary mapping when the Xen physical address
>> is not overlapping with the temporary mapping.
>>
>> This also has the advantage to simplify the logic to identity map
>> Xen.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>
>> Even if this patch is rewriting part of the previous patch, I decided
>> to keep them separated to help the review.
>>
>> The "follow-up patches" are still in draft at the moment. I still haven't
>> find a way to split them nicely and not require too much more work
>> in the coloring side.
>>
>> I have provided some medium-term goal in the cover letter.
>>
>>      Changes in v5:
>>          - Fix typo in a comment
>>          - No need to link boot_{second, third}_id again if we need to
>>            create a temporary area.
>>
>>      Changes in v3:
>>          - Resolve conflicts after switching from "ldr rX, <label>" to
>>            "mov_w rX, <label>" in a previous patch
>>
>>      Changes in v2:
>>          - Patch added
>> ---
>>   xen/arch/arm/arm32/head.S | 85 +++++++--------------------------------
>>   1 file changed, 15 insertions(+), 70 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
>> index df51550baa8a..93b0af114b0c 100644
>> --- a/xen/arch/arm/arm32/head.S
>> +++ b/xen/arch/arm/arm32/head.S
> ...
>> @@ -675,33 +641,12 @@ remove_identity_mapping:
>>           /* r2:r3 := invalid page-table entry */
>>           mov   r2, #0x0
>>           mov   r3, #0x0
>> -        /*
>> -         * Find the first slot used. Remove the entry for the first
>> -         * table if the slot is not XEN_FIRST_SLOT.
>> -         */
> Could you please add an empty line here to improve readability?

Sure. I will do that on commit.

> 
>> +        /* Find the first slot used and remove it */
> 
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks!

Cheers,

-- 
Julien Grall

