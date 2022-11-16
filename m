Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E27762BFCF
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 14:42:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444301.699359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovIfw-00079u-GR; Wed, 16 Nov 2022 13:42:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444301.699359; Wed, 16 Nov 2022 13:42:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovIfw-000774-Dd; Wed, 16 Nov 2022 13:42:00 +0000
Received: by outflank-mailman (input) for mailman id 444301;
 Wed, 16 Nov 2022 13:41:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ovIfu-00076y-RE
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 13:41:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ovIfu-0004QB-Fg; Wed, 16 Nov 2022 13:41:58 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=[10.95.151.56])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ovIfu-0007eO-8C; Wed, 16 Nov 2022 13:41:58 +0000
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
	bh=GRUEMJJFWuGr9j2bSk/cxM/+xlkZKeIimE9qKYdvMZU=; b=ck1dIaRMgvIKWr71WQZlNBiCrm
	IFAhUtqh+3VbJ/Fpn8vSPfymAC0T/VKr3QchgT3kcg6jAbnh4KuoJ6ze8xhOpr83Y1AjWNWDVtHoH
	qPuocm0Fv9GVFMQpK9YPRiHfg94xt26iDymX4PvNkKINGddOv6FUYAjJwa9AjGA16ZVQ=;
Message-ID: <653bdfb0-2926-531b-bb56-d0797fbf3877@xen.org>
Date: Wed, 16 Nov 2022 13:41:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH] xen/arm: debug-pl011.inc: Use macros instead of hardcoded
 values
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221024100536.12874-1-michal.orzel@amd.com>
 <fd7bd57d-b7a2-8be6-cead-2903a6115f40@xen.org>
 <d472516a-6ba4-167d-6eed-e9a4a43f65b2@amd.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <d472516a-6ba4-167d-6eed-e9a4a43f65b2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/11/2022 08:05, Michal Orzel wrote:
> On 16/11/2022 00:10, Julien Grall wrote:
>>
>>
>> Hi Michal,
>>
>> On 24/10/2022 11:05, Michal Orzel wrote:
>>> Make use of the macros defined in asm/pl011-uart.h instead of hardcoding
>>> the values. Also, take the opportunity to fix the file extension in a
>>> top-level comment.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>
>> With one comment below:
>>
>> Acked-by: Julien Grall <jgrall@amazon.com>
>>
>>> ---
>>>    xen/arch/arm/arm64/debug-pl011.inc | 20 +++++++++++---------
>>>    1 file changed, 11 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/arm64/debug-pl011.inc b/xen/arch/arm/arm64/debug-pl011.inc
>>> index 1928a2e3ffbb..d82f2f1de197 100644
>>> --- a/xen/arch/arm/arm64/debug-pl011.inc
>>> +++ b/xen/arch/arm/arm64/debug-pl011.inc
>>> @@ -1,5 +1,5 @@
>>>    /*
>>> - * xen/arch/arm/arm64/debug-pl011.S
>>> + * xen/arch/arm/arm64/debug-pl011.inc
>>>     *
>>>     * PL011 specific debug code
>>>     *
>>> @@ -16,6 +16,8 @@
>>>     * GNU General Public License for more details.
>>>     */
>>>
>>> + #include <asm/pl011-uart.h>
>>> +
>>>    /*
>>>     * PL011 UART initialization
>>>     * xb: register which containts the UART base address
>>> @@ -23,13 +25,13 @@
>>>     */
>>>    .macro early_uart_init xb, c
>>>            mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)
>>> -        strh  w\c, [\xb, #0x28]      /* -> UARTFBRD (Baud divisor fraction) */
>>> +        strh  w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor fraction) */
>>>            mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
>>> -        strh  w\c, [\xb, #0x24]      /* -> UARTIBRD (Baud divisor integer) */
>>> +        strh  w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud divisor integer) */
>>>            mov   x\c, #0x60             /* 8n1 */
>>
>> Can we introduce macro/define for 0x60?
> We could but I think this should not be part of this patch.
> The reason being, the arm32 code also uses hardcoded 0x60 so it should be changed as well.
> I can create a prerequisite patch introducing the macro and changing the arm32 code first unless you prefer to have everything in a single patch.

I am fine with either prerequisite or a follow-up to define a macro and 
use it in both arm32/arm64.

> 
> As for the macro itself, because 8n1 only requires setting bits for WLEN (1 stop bit and no parity are 0 by default), we can do
> the following in pl011-uart.h:
> #define WLEN_8 0x60

I think it would be clearer and easier to check the spec if the value is 
(_AC(0x3, U) << 5).

> and use it in the pl011-debug files (+ there is a question whether we should define WLEN_7-5 for completeness).

I would not define WLEN_7-5. That said, I wonder if we really need to 
set the baud rate & co here?

AFAICT the runtime driver never touch them. The reasoning is the 
firmware is responsible to configure the serial. Therefore, I would 
consider to drop the code (setting UARTCR might still be necessary).

Cheers,

-- 
Julien Grall

