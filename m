Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 719EA9ACFD6
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 18:13:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824822.1239020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3dzD-0004Ea-TH; Wed, 23 Oct 2024 16:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824822.1239020; Wed, 23 Oct 2024 16:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3dzD-0004C0-QO; Wed, 23 Oct 2024 16:13:27 +0000
Received: by outflank-mailman (input) for mailman id 824822;
 Wed, 23 Oct 2024 16:13:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t3dzC-0004Bu-Le
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 16:13:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1t3dzC-000Bng-1A;
 Wed, 23 Oct 2024 16:13:26 +0000
Received: from [15.248.2.28] (helo=[10.24.67.32])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t3dzC-0007kQ-4J; Wed, 23 Oct 2024 16:13:26 +0000
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
	bh=392S0T7EPErckx6hjW1vTsK1PEBPvip1kCYreU6cWtg=; b=cZz+p2WNaMOgRlikjMtgLhC3rw
	1ngCRBTZcRzQ92KqppJU9JehOHnoSG42t1vHYucnHcUGpcOV3flR9FzXCGhZk0q+OPbS5a5JP3i//
	3Bm1ERKEFREKMcGZvgbm4t3de5mjEY7xC0Z3ElCtJcZGGH/8sTT69xOthLecKbndH6rc=;
Message-ID: <251fb5a2-a8d7-451b-9714-5cc984645354@xen.org>
Date: Wed, 23 Oct 2024 17:13:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] xen/arm: mpu: Enable MPU
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-6-ayan.kumar.halder@amd.com>
 <a6a66bd1-45dc-46d2-9e45-8fef8b45e003@xen.org>
 <23b86010-d467-42fd-bba0-65b58e05beaf@amd.com>
 <DEE00B97-ADA5-4229-9B41-571C38F7A6C5@arm.com>
 <f444f549-6f4e-494b-af85-aeec127722c4@xen.org>
 <A302D615-E25E-46DE-A4CA-4FF911293D83@arm.com>
 <d1e8decf-3c63-41fe-a6e3-f880b984dda4@xen.org>
 <61C13F4F-24D2-4B6D-9216-813EDEED4865@arm.com>
 <5b8d5c3e-3c52-4b3b-b63f-c89a58f40f10@xen.org>
 <4E7C8350-D6DE-43D3-B269-185FFEE62B96@arm.com>
 <8991e9da-5abd-4fd7-919b-fbe87d747838@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8991e9da-5abd-4fd7-919b-fbe87d747838@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 23/10/2024 17:06, Ayan Kumar Halder wrote:
> Hi Luca/Julien,
> 
> On 22/10/2024 17:31, Luca Fancellu wrote:
>> Hi Julien,
>>
>>> On 22 Oct 2024, at 14:13, Julien Grall <julien@xen.org> wrote:
>>>
>>>
>>>
>>> On 22/10/2024 10:56, Luca Fancellu wrote:
>>>>> On 22 Oct 2024, at 10:47, Julien Grall <julien@xen.org> wrote:
>>>>>
>>>>> Hi Luca,
>>>>>
>>>>> On 22/10/2024 10:41, Luca Fancellu wrote:
>>>>>>> On 21 Oct 2024, at 17:27, Julien Grall <julien@xen.org> wrote:
>>>>>> 2) dsb+isb barrier after enabling the MPU, since we are enabling 
>>>>>> the MPU but also because we are disabling the background region
>>>>> TBH, I don't understand this one. Why would disabling the 
>>>>> background region requires a dsb + isb? Do you have any pointer in 
>>>>> the Armv8-R specification?
>>>> I’m afraid this is only my deduction, Section C1.4 of the Arm® 
>>>> Architecture Reference Manual Supplement Armv8, for R-profile 
>>>> AArch64 architecture,
>>>> (DDI 0600B.a) explains what is the background region, it says it 
>>>> implements physical address range(s), so when we disable it, we 
>>>> would like any data
>>>> access to complete before changing this implementation defined range 
>>>> with the ranges defined by us tweaking PRBAR/PRLAR, am I right?
>>> My mental model for the ordering is similar to a TLB flush which is:
>>>    1/ dsb nsh
>>>    2/ tlbi
>>>    3/ dsb nsh
>>>    4/ isb
>>>
>>> Enabling the MPU is effectively 2. AFAIK, 1 is only necessary to 
>>> ensure the update to the page-tables. But it is not a requirement to 
>>> ensure any data access are completed (otherwise, we would have needed 
>>> a dsb sy because we don't know how far the access are going...).
>> Uhm… I’m not sure we are on the same page, probably I explained that 
>> wrongly, so my point is that:
>>
>> FUNC_LOCAL(enable_mpu)
>>      mrs   x0, SCTLR_EL2
>>      bic   x0, x0, #SCTLR_ELx_BR       /* Disable Background region */
>>      orr   x0, x0, #SCTLR_Axx_ELx_M    /* Enable MPU */
>>      orr   x0, x0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
>>      orr   x0, x0, #SCTLR_Axx_ELx_WXN  /* Enable WXN */
>>      dsb   sy
>>      ^— This data barrier is needed in order to complete any data 
>> access, which guarantees that all explicit memory accesses before
>>             this instruction complete, so we can safely turn ON the 
>> MPU and disable the background region.

I think

> 
> I think Julien agreed to this in a previous email as long as we have an 
> appropriate comment. So we will keep this as it is.

Sorry I didn't manage to answer yet. But yes, I am ok with the barrier 
for now, but I am not agree on the reasoning used.

Cheers,

-- 
Julien Grall


