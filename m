Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 513AC9A6F63
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 18:27:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823841.1237917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2vFx-00082l-J5; Mon, 21 Oct 2024 16:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823841.1237917; Mon, 21 Oct 2024 16:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2vFx-000819-GT; Mon, 21 Oct 2024 16:27:45 +0000
Received: by outflank-mailman (input) for mailman id 823841;
 Mon, 21 Oct 2024 16:27:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t2vFv-000813-UJ
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 16:27:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t2vFv-0004dZ-LE; Mon, 21 Oct 2024 16:27:43 +0000
Received: from [2a02:8012:3a1:0:827:16ef:abff:1cc1]
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t2vFv-0007E3-Co; Mon, 21 Oct 2024 16:27:43 +0000
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
	bh=e5A8t1WHFzn5iZrUW/XRx6D6YZ7PghDyICb5Fvg3BYc=; b=CgvWofl1qMtQTNfesJ22Czvpks
	0zhBd/I+MACRqFdv1WUQu0lQov5qtFCEOeyHnMfFyczpmorgo+8RiWmY/5HNAdi1JFraZpHXrNsgU
	tMTsfGv312xjgx3r9uf9lJO0sxCF474TbbHwV20DTl0yAaEiZ04poCA1Q3SeQ4CWQtp0=;
Message-ID: <f444f549-6f4e-494b-af85-aeec127722c4@xen.org>
Date: Mon, 21 Oct 2024 17:27:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] xen/arm: mpu: Enable MPU
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Ayan Kumar Halder <ayankuma@amd.com>
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <DEE00B97-ADA5-4229-9B41-571C38F7A6C5@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/10/2024 17:24, Luca Fancellu wrote:
> Hi Ayan,
> 
>>>> + */
>>>> +FUNC_LOCAL(enable_mpu)
>>>> +    mrs   x0, SCTLR_EL2
>>>> +    bic   x0, x0, #SCTLR_ELx_BR       /* Disable Background region */
>>>> +    orr   x0, x0, #SCTLR_Axx_ELx_M    /* Enable MPU */
>>>> +    orr   x0, x0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
>>>> +    orr   x0, x0, #SCTLR_Axx_ELx_WXN  /* Enable WXN */
>>>
>>> NIT: Can't we have a single "orr" instruction to set all the flags?
>> Yes, I will change this.
>>>
>>>> +    dsb   sy
>>>
>>> I still question this use of "dsb sy"...
>>
>> Actually I kept this to ensure that all outstanding memory access are completed before MPU is enabled.
>>
>> However, prepare_xen_region() is invoked before this and it has a 'dsb sy' at the end.
>>
>> So we can drop this barrier.
> 
> I suggest to keep the barrier here and drop the one in prepare_xen_region instead,

I think the barriers in prepare_xen_region() should be kept because we 
may want to use the helper *after* the MPU is turned on.

> have a look in my branch: https://gitlab.com/xen-project/xen/-/merge_requests/7/diffs?commit_id=f42a2816f9bd95f2f6957887be910cb9acd140b5
> 
> During my testing I was having trouble without this barrier.

Was it before or after removing the barriers in prepare_xen_region()? If 
the latter, then I am a bit puzzled why you need it. Did you investigate 
a bit more?

Cheers,

-- 
Julien Grall


