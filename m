Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA4C7F1D38
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 20:19:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637168.992952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r59nL-0005kS-Aj; Mon, 20 Nov 2023 19:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637168.992952; Mon, 20 Nov 2023 19:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r59nL-0005gP-7b; Mon, 20 Nov 2023 19:18:55 +0000
Received: by outflank-mailman (input) for mailman id 637168;
 Mon, 20 Nov 2023 19:18:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r59nK-0005g5-A1
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 19:18:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r59nK-0005pb-0L; Mon, 20 Nov 2023 19:18:54 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.18.184]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r59nJ-0001SP-Qv; Mon, 20 Nov 2023 19:18:53 +0000
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
	bh=h1lhQFhkZ3jbmRbO/pNPyxPhbd7mk5bTF98iJ2fI5YU=; b=ZgZpUcsAeLFcDU1tE+sxjiAaXk
	UHqrMwlafr/JT+5oCyBEzjEfE2Mg61v3UPOUbGm/Vdvtm0i7fv1crxjFs5fk7VqUexO8f1Bmo8BUe
	9TFoLfMFN/J0M+3n+4UxSUs5ti8TByXKrLLqCmyesBj++KxdUVfOYcAzlf5XsDgmQgSI=;
Message-ID: <a473a6b8-4fba-4fb6-b2f6-feb013baf20d@xen.org>
Date: Mon, 20 Nov 2023 19:18:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231114090356.875180-1-luca.fancellu@arm.com>
 <20231114090356.875180-4-luca.fancellu@arm.com>
 <98980da0-2940-43d2-a6c1-e064f4921e74@amd.com>
 <0c32e2eb-7ffe-486c-a11c-477c3cff5cba@xen.org>
 <a60d951b-7e23-4421-a7c6-68b99f33cba0@amd.com>
 <DB403D33-700B-41A4-94D5-233D26900708@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DB403D33-700B-41A4-94D5-233D26900708@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 20/11/2023 14:27, Luca Fancellu wrote:
> 
>>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>>>
>>>> with one remark...
>>>>
>>>>> ---
>>>>> Changes from v4:
>>>>>   - fixed name in inclusion macro __ASM_* instead of __ARM_*, fixed
>>>>>     emacs local variable 'end:', style fix (Michal)
>>>>> Changes from v3:
>>>>>   - remove header in dom0less-build.c (Michal)
>>>>> Changes from v2:
>>>>>   - move allocate_bank_memory back in domain_build.c, remove header
>>>>>     from dom0less-build.c.
>>>>> ---
>>>>>   xen/arch/arm/Makefile                     |    1 +
>>>>>   xen/arch/arm/dom0less-build.c             | 1018 +++++++++++++++++
>>>>>   xen/arch/arm/domain_build.c               | 1265 +++------------------
>>>>>   xen/arch/arm/include/asm/dom0less-build.h |   20 +
>>>>>   xen/arch/arm/include/asm/domain_build.h   |   60 +
>>>>>   xen/arch/arm/include/asm/setup.h          |    1 -
>>>>>   xen/arch/arm/setup.c                      |   33 +-
>>>>>   7 files changed, 1240 insertions(+), 1158 deletions(-)
>>>>>   create mode 100644 xen/arch/arm/dom0less-build.c
>>>>>   create mode 100644 xen/arch/arm/include/asm/dom0less-build.h
>>>>>
>>>>
>>>> [...]
>>>>> diff --git a/xen/arch/arm/include/asm/dom0less-build.h b/xen/arch/arm/include/asm/dom0less-build.h
>>>>> new file mode 100644
>>>>> index 000000000000..81446cbd8bf3
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/arm/include/asm/dom0less-build.h
>>>>> @@ -0,0 +1,20 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>> +
>>>>> +#ifndef __ASM_DOM0LESS_BUILD_H_
>>>>> +#define __ASM_DOM0LESS_BUILD_H_
>>>>> +
>>>>> +#include <asm/kernel.h>
>>>> No need for this include, especially if you are removing it in the subsequent patch.
>>>
>>> Are you suggesting that this patch builds without including asm/kernel.h?
>> Yes.
>>
>>>
>>>> This could be done on commit (+ there is a conflcit between your series and Henry's mmu/mpu split)
>>>
>>> While I am in general happy to handle some changes on commit, I don't
>>> want to solve conflict between series.
>>>
>>> One will have to rebase on top of the others. I suggest that this is
>>> just rebased on top of Henry, purely because I will likely commit it
>>> today or tomorrow.
>> Sounds ok.
> 
> Hi Julien, Michal,
> 
> I will rebase the serie on top of Henry’s patches when they will be merged and I will address the remaining
> comments.

They are now merged.

Cheers,

-- 
Julien Grall

