Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A4F65E9AD
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 12:20:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471830.731846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDOHd-0001lu-04; Thu, 05 Jan 2023 11:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471830.731846; Thu, 05 Jan 2023 11:19:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDOHc-0001jV-TP; Thu, 05 Jan 2023 11:19:40 +0000
Received: by outflank-mailman (input) for mailman id 471830;
 Thu, 05 Jan 2023 11:19:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pDOHb-0001jP-Hi
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 11:19:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pDOHb-0008PS-D9; Thu, 05 Jan 2023 11:19:39 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[192.168.4.62])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pDOHb-0003qE-5I; Thu, 05 Jan 2023 11:19:39 +0000
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
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=oeDOelHc6GbkzzkkG0rlTlPgpKRaqk6cNmUOAcKglGk=; b=fHJKWoOV3BY2w4ouLf4l9dWsaX
	UUTWg8ajpy6rWd4TaImZpjnM0hbEnMI82VG0i1n8SBXwLzuzr4R71AzVH4bekXwWKXyChDovQnVlL
	/1f6XmQdXHjGZrGs6SSnAFKuvXRW64fckW9n8/BBiKuGVY0oz6mhQu7tSklkFl3dILSc=;
Message-ID: <c80f90d7-d3b5-1b13-d809-9506ff5414e4@xen.org>
Date: Thu, 5 Jan 2023 11:19:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2] xen/arm: Add 0x prefix when printing memory size in
 construct_domU
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
References: <20230103102519.26224-1-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2301041546230.4079@ubuntu-linux-20-04-desktop>
 <1264e5cc-1960-95d3-5ecb-d6f23d194aa4@xen.org>
 <29460d07-cd43-7415-7125-6ed01f3c2920@amd.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <29460d07-cd43-7415-7125-6ed01f3c2920@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/01/2023 09:59, Ayan Kumar Halder wrote:
> Hi Julien,

Hi,

> I have a clarification.
> 
> On 05/01/2023 09:26, Julien Grall wrote:
>> CAUTION: This message has originated from an External Source. Please 
>> use proper judgment and caution when opening attachments, clicking 
>> links, or responding to this email.
>>
>>
>> Hi Stefano,
>>
>> On 04/01/2023 23:47, Stefano Stabellini wrote:
>>> On Tue, 3 Jan 2023, Michal Orzel wrote:
>>>> Printing memory size in hex without 0x prefix can be misleading, so
>>>> add it. Also, take the opportunity to adhere to 80 chars line length
>>>> limit by moving the printk arguments to the next line.
>>>>
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>> ---
>>>> Changes in v2:
>>>>   - was: "Print memory size in decimal in construct_domU"
>>>>   - stick to hex but add a 0x prefix
>>>>   - adhere to 80 chars line length limit
>>>
>>> Honestly I prefer decimal but also hex is fine.
>>
>> decimal is perfect for very small values, but as we print the amount in
>> KB it will become a big mess. Here some examples (decimal first, then
>> hexadecimal):
>>
>>   512MB: 524288 vs 0x80000
>>   555MB: 568320 vs 0x8ac00
>>   1GB: 1048576 vs 0x100000
>>   512GB: 536870912 vs 0x20000000
>>   1TB: 1073741824 vs 0x40000000
>>
>> For power of two values, you might be able to find your way with
>> decimal. It is more difficult for non power of two unless you have a
>> calculator in hand.
>>
>> The other option I suggested in v1 is to print the amount in KB/GB/MB.
>> Would that be better?
>>
>> That said, to be honest, I am not entirely sure why we are actually
>> printing in KB. It would seems strange that someone would create a guest
>> with memory not aligned to 1MB.
> 
> For RTOS (Zephyr and FreeRTOS), it should be possible for guests to have 
> memory less than 1 MB, isn't it ?

Yes. So does XTF. But most of the users are likely going allocate at 
least 1MB (or even 2MB to reduce the TLB pressure).

So it would be better to print the value in a way that is more 
meaningful for the majority of the users.

>> So I would consider to check the size is 1MB-aligned and then print the

I will retract my suggestion to check the size. There are technically no 
restriction to run a guest with a size not aligned to 1MB. Although, it 
would still seem strange.

Cheers,

-- 
Julien Grall

