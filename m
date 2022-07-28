Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E049584169
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 16:34:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376853.609898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH4au-0006Aq-OS; Thu, 28 Jul 2022 14:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376853.609898; Thu, 28 Jul 2022 14:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH4au-00067P-L4; Thu, 28 Jul 2022 14:34:32 +0000
Received: by outflank-mailman (input) for mailman id 376853;
 Thu, 28 Jul 2022 14:34:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oH4as-00067J-Ty
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 14:34:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oH4ak-0002Wp-Mj; Thu, 28 Jul 2022 14:34:22 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224] helo=[10.7.237.22])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oH4ak-0008Up-F1; Thu, 28 Jul 2022 14:34:22 +0000
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
	bh=IN111wzHiPhKwSsDm1uKbjSprr5/4s/E0rreu7qtzd8=; b=ZQ9hBlX4UjHfjU3QYluyvx9SvN
	y6wDNfdnpOGQUUNarJIlIYJRy0doSlQRGd6YGbwOwH2GaHbc5MdABt98jJzwD6CbH+miZarDDZERP
	lSjxMybE6yUAlDv3i9B7dwnFca4xQ6Ggk4ruXcdiIsi7hGGrehtDpSNBqLnHLngGwovM=;
Message-ID: <c71c9522-2df5-35a3-d39c-706d5c9d5263@xen.org>
Date: Thu, 28 Jul 2022 15:34:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.3
Subject: Re: [PATCH] xen/arm64: sysreg.h: Fix MISRA C 2012 Rule 20.7 violation
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
References: <20220728134943.1185621-1-burzalodowa@gmail.com>
 <0a8ff178-280d-717f-dacb-4eb9f57a24eb@xen.org>
 <83c17bf6-b9b2-a297-6f7f-dd08231d0f90@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <83c17bf6-b9b2-a297-6f7f-dd08231d0f90@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28/07/2022 15:20, Jan Beulich wrote:
> On 28.07.2022 15:56, Julien Grall wrote:
>> On 28/07/2022 14:49, Xenia Ragiadakou wrote:
>>> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
>>> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
>>> @@ -461,7 +461,7 @@
>>>    /* Access to system registers */
>>>    
>>>    #define WRITE_SYSREG64(v, name) do {                    \
>>> -    uint64_t _r = v;                                    \
>>> +    uint64_t _r = (v);                                              \
>>
>> I am failing to see why the parentheses are necessary here. Could you
>> give an example where the lack of them would end up to different code?
> 
> I think it is merely good practice to parenthesize the right sides of =.
> Indeed with assignment operators having second to lowest precedence, and
> with comma (the lowest precedence one) requiring parenthesization at the
> macro invocation site, there should be no real need for parentheses here.

I am not really happy with adding those parentheses because they are 
pointless. But if there are a consensus to use it, then the commit 
message should be updated to clarify this is just here to please MISRA 
(to me "need" implies it would be bug).

Cheers,

-- 
Julien Grall

