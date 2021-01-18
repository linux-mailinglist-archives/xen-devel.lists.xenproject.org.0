Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9996A2FA9EF
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 20:18:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70029.125641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1a2D-0004d5-IL; Mon, 18 Jan 2021 19:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70029.125641; Mon, 18 Jan 2021 19:17:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1a2D-0004cg-Er; Mon, 18 Jan 2021 19:17:53 +0000
Received: by outflank-mailman (input) for mailman id 70029;
 Mon, 18 Jan 2021 19:17:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l1a2B-0004cb-OV
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 19:17:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l1a2A-0000IG-Hb; Mon, 18 Jan 2021 19:17:50 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l1a2A-0007Up-AL; Mon, 18 Jan 2021 19:17:50 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=XrC143X4k+wjyXMUWrGyLpCZ8IjCncZEe/GGxQ7F4BI=; b=rK+Yut8wVNbZevybzq/StbTfNQ
	x+acyNaG8FXb8KZDGDey2es2a8syeBeLKwbWgdPlfjQwGXhBX7P7ZFKp019yE0ipNaZiqdzifH+8F
	dTyJ0RKLfWM31kwuDwT1qWuhlIflI8uMe7Xc6QHyVWwoKF4416TBSzn7cxvkLo6Pp+78=;
Subject: Re: [PATCH V4 14/24] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-15-git-send-email-olekstysh@gmail.com>
 <355e613a-3c9d-7978-62cd-a35df057e5cd@xen.org>
 <d54a9ef4-b707-1887-a7f7-b33c6f0f97d9@gmail.com>
 <06704224-bb57-c55e-a2ee-23032095e8ea@xen.org>
 <e2dcc876-291f-1244-933c-179f97a84e07@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b79b07eb-02db-16bb-2d8b-a55b0c355dbb@xen.org>
Date: Mon, 18 Jan 2021 19:17:48 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <e2dcc876-291f-1244-933c-179f97a84e07@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Oleksandr,

On 17/01/2021 18:52, Oleksandr wrote:
> 
> On 17.01.21 20:07, Julien Grall wrote:
>>
>>
>> On 17/01/2021 17:11, Oleksandr wrote:
>>>
>>> On 15.01.21 22:26, Julien Grall wrote:
>>>
>>> Hi Julien
>>
>> Hi Oleksandr,
> 
> 
> Hi Julien
> 
> 
> 
>>
>>>>
>>>>> +
>>>>>       PROGRESS(xen):
>>>>>           ret = relinquish_memory(d, &d->xenpage_list);
>>>>>           if ( ret )
>>>>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>>>>> index ae7ef96..9814481 100644
>>>>> --- a/xen/arch/arm/io.c
>>>>> +++ b/xen/arch/arm/io.c
>>>>> @@ -16,6 +16,7 @@
>>>>>    * GNU General Public License for more details.
>>>>>    */
>>>>>   +#include <xen/ioreq.h>
>>>>>   #include <xen/lib.h>
>>>>>   #include <xen/spinlock.h>
>>>>>   #include <xen/sched.h>
>>>>> @@ -23,6 +24,7 @@
>>>>>   #include <asm/cpuerrata.h>
>>>>>   #include <asm/current.h>
>>>>>   #include <asm/mmio.h>
>>>>> +#include <asm/hvm/ioreq.h>
>>>>
>>>> Shouldn't this have been included by "xen/ioreq.h"?
>>> Well, for V1 asm/hvm/ioreq.h was included by xen/ioreq.h. But, it 
>>> turned out that there was nothing inside common header required arch 
>>> one to be included and
>>> I was asked to include arch header where it was indeed needed 
>>> (several *.c files).
>>
>> Fair enough.
>>
>> [...]
>>
>>>>
>>>> If you return IO_HANDLED here, then it means the we will take care 
>>>> of previous I/O but the current one is going to be ignored. 
>>> Which current one? As I understand, if try_fwd_ioserv() gets called 
>>> with vio->req.state == STATE_IORESP_READY then this is a second round 
>>> after emulator completes the emulation (the first round was when
>>> we returned IO_RETRY down the function and claimed that we would need 
>>> a completion), so we are still dealing with previous I/O.
>>> vcpu_ioreq_handle_completion() -> arch_ioreq_complete_mmio() -> 
>>> try_handle_mmio() -> try_fwd_ioserv() -> handle_ioserv()
>>> And after we return IO_HANDLED here, handle_ioserv() will be called 
>>> to complete the handling of this previous I/O emulation.
>>> Or I really missed something?
>>
>> Hmmm... I somehow thought try_fw_ioserv() would only be called the 
>> first time. Do you have a branch with your code applied? This would 
>> help to follow the different paths.
> Yes, I mentioned about it in cover letter.
> 
> Please see
> https://github.com/otyshchenko1/xen/commits/ioreq_4.14_ml5
> why 5 - because I started counting from the RFC)

Oh, I looked at the cover letter and didn't find it. Hence why I asked. 
I should have looked more carefully. Thanks!

I have looked closer at the question and I am not sure to understand why 
arch_ioreq_complete_mmio() is going to call try_handle_mmio().

This looks pretty innefficient to me because we already now the IO was 
handled by the IOREQ server.

I realize that x86 is calling handle_mmio() again. However, I don't 
think we need the same on Arm because the instruction for accessing 
device memory are a lot simpler (you can only read or store at most a 
64-bit value).

So I would like to keep our emulation simple and not rely on 
try_ioserv_fw() to always return true when call from completion (AFAICT 
it is not possible to return false then).

I will answer to the rest separately.

Cheers,

-- 
Julien Grall

