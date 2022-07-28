Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD2158432D
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 17:37:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376930.609983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH5Zt-0000S8-0i; Thu, 28 Jul 2022 15:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376930.609983; Thu, 28 Jul 2022 15:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH5Zs-0000PA-Tt; Thu, 28 Jul 2022 15:37:32 +0000
Received: by outflank-mailman (input) for mailman id 376930;
 Thu, 28 Jul 2022 15:37:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oH5Zq-0000P2-T9
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 15:37:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oH5Zq-0003g4-Lt; Thu, 28 Jul 2022 15:37:30 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224] helo=[10.7.237.22])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oH5Zq-0003Hi-Ej; Thu, 28 Jul 2022 15:37:30 +0000
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
	bh=jCQPGZwJWOctcq94X5UREMIRtJipc6y5laeiAZXZ8mg=; b=Ly3nZyL/LWrNBLWHRlDQNXV7mE
	NxjuVmdvw+aKEtWZ99LCNCRCDQziHZOuybAXmRkrSpjt/c6WzoWmPpJ3cV5YkTynBlpW/VA1z5hb7
	40jpbrujSWOBtIWDPFZqD0c0Xv6Ruq8F+2S7Z4Y+0WvDczYL2rfaidtqUyWj7+g3DX7A=;
Message-ID: <f5b8b1fe-e77e-45da-2165-ae86be8a0fd4@xen.org>
Date: Thu, 28 Jul 2022 16:37:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.3
Subject: Re: [PATCH] xen/arm64: sysreg.h: Fix MISRA C 2012 Rule 20.7 violation
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220728134943.1185621-1-burzalodowa@gmail.com>
 <0a8ff178-280d-717f-dacb-4eb9f57a24eb@xen.org>
 <deec9152-3ca8-829e-23d0-2390f1981666@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <deec9152-3ca8-829e-23d0-2390f1981666@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 28/07/2022 16:15, Xenia Ragiadakou wrote:
> On 7/28/22 16:56, Julien Grall wrote:
>> Hi,
>>
>> On 28/07/2022 14:49, Xenia Ragiadakou wrote:
>>> The macro parameter 'v' is used as an expression and needs to be 
>>> enclosed in
>>> parentheses.
>>>
>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>> ---
>>>   xen/arch/arm/include/asm/arm64/sysregs.h | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h 
>>> b/xen/arch/arm/include/asm/arm64/sysregs.h
>>> index 54670084c3..f5a7269a27 100644
>>> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
>>> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
>>> @@ -461,7 +461,7 @@
>>>   /* Access to system registers */
>>>   #define WRITE_SYSREG64(v, name) do {                    \
>>> -    uint64_t _r = v;                                    \
>>> +    uint64_t _r = (v);                                              \
>>
>> I am failing to see why the parentheses are necessary here. Could you 
>> give an example where the lack of them would end up to different code?
> 
> Here v is supposed to be used as an expression. So maybe the rule wants 
> to enforce that in the macro we will pass an expression and not multiple 
> statements (?) ... not sure.

Do you mean something like below?

#include <stdio.h>
#include <inttypes.h>

#define foo(v)  do {       \
     uint64_t _r = v;    \
                         \
         printf("_r %lu\n", _r); \
     } while (0)

int main(void)
{
     foo(1; printf("Bar\n"));
}

If yes, then I agree that the compiler will still be happy. Or if you 
pass "1; 2", v would be set to 1 rather than 2. I am not sure why one 
would want to write such code. But I guess we want to prevent that.

Cheers,

-- 
Julien Grall

