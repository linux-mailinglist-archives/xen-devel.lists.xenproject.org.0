Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B8474266E
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 14:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556823.869624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEqlV-0007rr-NI; Thu, 29 Jun 2023 12:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556823.869624; Thu, 29 Jun 2023 12:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEqlV-0007ol-KF; Thu, 29 Jun 2023 12:28:49 +0000
Received: by outflank-mailman (input) for mailman id 556823;
 Thu, 29 Jun 2023 12:28:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qEqlU-0007of-HO
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 12:28:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEqlU-0003Q5-1F; Thu, 29 Jun 2023 12:28:48 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.2.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEqlT-0007aA-RR; Thu, 29 Jun 2023 12:28:47 +0000
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
	bh=St+CJo8MKwVqWAjm8033T97ctwOGtNlRq2HpuELe8lc=; b=hVXNJmIczj+GPxtcmMqRx6NNeH
	OXV1WHOERHc288eZIKudUBSTlBbUyGOclI4pvpPTbtSdaK+oR6ENDaphJ2q+wBp/0oJmh05KnTP1I
	C8NJIDo6SKMg76LsDZcM02XxpnZQvYUphftElfUZ4+ATn5F2NTQxvPNggCAwKwYkjBv4=;
Message-ID: <96de11c9-6e9c-83f6-9d1b-39df600b549d@xen.org>
Date: Thu, 29 Jun 2023 13:28:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 2/9] xen/arm64: head: Don't map too much in boot_third
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, Henry.Wang@arm.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-3-julien@xen.org>
 <38f33ede-0d55-bd47-412a-eccb3d4618f2@amd.com>
 <7877f5af-12e2-808c-b2a2-fa0e302a00c3@xen.org>
 <ad0e9f64-949f-018b-d9f1-4553859e02fb@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ad0e9f64-949f-018b-d9f1-4553859e02fb@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 29/06/2023 08:26, Michal Orzel wrote:
> On 28/06/2023 20:21, Julien Grall wrote:
>>
>>
>> Hi,
>>
>> On 26/06/2023 12:28, Michal Orzel wrote:
>>> On 25/06/2023 22:49, Julien Grall wrote:
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> At the moment, we are mapping the size of the reserved area for Xen
>>>> (i.e. 2MB) even if the binary is smaller. We don't exactly know what's
>>>> after Xen, so it is not a good idea to map more than necessary for a
>>>> couple of reasons:
>>>>       * We would need to use break-before-make if the extra PTE needs to
>>>>         be updated to point to another region
>>>>       * The extra area mapped may be mapped again by Xen with different
>>>>         memory attribute. This would result to attribue mismatch.
>>> s/attribue/attribute
>>>
>>>>
>>>> Therefore, rework the logic in create_page_tables() to map only what's
>>>> necessary. To simplify the logic, we also want to make sure _end
>>>> is page-aligned. So align the symbol in the linker and add an assert
>>>> to catch any change.
>>>>
>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>> ---
>>>>    xen/arch/arm/arm64/head.S | 15 ++++++++++++++-
>>>>    xen/arch/arm/xen.lds.S    |  3 +++
>>>>    2 files changed, 17 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>>>> index f37133cf7ccd..66bc85d4c39e 100644
>>>> --- a/xen/arch/arm/arm64/head.S
>>>> +++ b/xen/arch/arm/arm64/head.S
>>>> @@ -572,6 +572,19 @@ create_page_tables:
>>>>            create_table_entry boot_first, boot_second, x0, 1, x1, x2, x3
>>>>            create_table_entry boot_second, boot_third, x0, 2, x1, x2, x3
>>>>
>>>> +        /*
>>>> +         * Find the size of Xen in pages and multiply by the size of a
>>>> +         * PTE. This will then be compared in the mapping loop below.
>>>> +         *
>>>> +         * Note the multiplication is just to avoid using an extra
>>>> +         * register/instruction per iteration.
>>>> +         */
>>>> +        ldr   x0, =_start            /* x0 := vaddr(_start) */
>>> x0 is already set to vaddr of _start by the first instruction of create_page_tables
>>> and is preserved by create_table_entry. You could just reuse it instead of re-loading.
>>
>> I agree that the load is technically redundant. However, I find this
>> approach easier to read (you don't have to remember that _start equals
>> XEN_VIRT_START).
> Ok. As a side note not related to this patch, would it make sense to add an assert in linke > script to make sure _start equals XEN_VIRT_START, since we use them 
interchangeably?

Good point. I can add it in this patch.

Cheers,

-- 
Julien Grall

