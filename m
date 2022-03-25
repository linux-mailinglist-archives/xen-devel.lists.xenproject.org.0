Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBDB4E753F
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 15:43:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294809.501467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXl9P-0008Al-7j; Fri, 25 Mar 2022 14:42:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294809.501467; Fri, 25 Mar 2022 14:42:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXl9P-00087o-4e; Fri, 25 Mar 2022 14:42:51 +0000
Received: by outflank-mailman (input) for mailman id 294809;
 Fri, 25 Mar 2022 14:42:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nXl9N-00087i-0q
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 14:42:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nXl9M-0004KT-M8; Fri, 25 Mar 2022 14:42:48 +0000
Received: from [54.239.6.185] (helo=[192.168.14.36])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nXl9M-00083x-Fa; Fri, 25 Mar 2022 14:42:48 +0000
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
	bh=ozA0/rwKzYE3SvgEUoHF1QlHX1c7NYNyyUnLKY/gcGI=; b=kjOoDbysp91ePWL7bTHybR8KAW
	4CtEtjy28IPwWpViKoqIrZlxXgfPrOQcLRWfpnJXAV7Wc8iWPlBLVZE0yfBpP8I3/4gqjlZJBqqCJ
	BPbO9osV+cBksWCh8+VK+2W5aCFwlnCtr+CCxYo8S+GCShL2ofzcZOkhI2vp6gYPg31w=;
Message-ID: <284b300e-d400-4bd7-0b0e-aa53983d6ee8@xen.org>
Date: Fri, 25 Mar 2022 14:42:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH early-RFC 4/5] xen/arm: mm: Rework switch_ttbr()
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "marco.solieri@minervasys.tech" <marco.solieri@minervasys.tech>,
 "lucmiccio@gmail.com" <lucmiccio@gmail.com>, Julien Grall
 <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220309112048.17377-1-julien@xen.org>
 <20220309112048.17377-5-julien@xen.org>
 <140E78FF-8281-48BA-BE13-C4B3E12F34A5@arm.com>
 <9673f201-080b-8800-65a2-144d21b030fd@xen.org>
 <7069C935-A275-4D1A-80EF-C20DE1D3103C@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7069C935-A275-4D1A-80EF-C20DE1D3103C@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bertrand,

On 25/03/2022 14:35, Bertrand Marquis wrote:
>> On 25 Mar 2022, at 15:24, Julien Grall <julien@xen.org> wrote:
>> On 25/03/2022 13:47, Bertrand Marquis wrote:
>>> Hi Julien,
>>
>> Hi Bertrand,
>>
>>>> On 9 Mar 2022, at 12:20, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> At the moment, switch_ttbr() is switching the TTBR whilst the MMU is
>>>> still on.
>>>>
>>>> Switching TTBR is like replacing existing mappings with new ones. So
>>>> we need to follow the break-before-make sequence.
>>>>
>>>> In this case, it means the MMU needs to be switched off while the
>>>> TTBR is updated. In order to disable the MMU, we need to first
>>>> jump to an identity mapping.
>>>>
>>>> Rename switch_ttbr() to switch_ttbr_id() and create an helper on
>>>> top to temporary map the identity mapping and call switch_ttbr()
>>>> via the identity address.
>>>>
>>>> switch_ttbr_id() is now reworked to temporarily turn off the MMU
>>>> before updating the TTBR.
>>>>
>>>> We also need to make sure the helper switch_ttbr() is part of the
>>>> identity mapping. So move _end_boot past it.
>>>>
>>>> Take the opportunity to instruction cache flush as the operation is
>>>> only necessary when the memory is updated.
>>> Your code is actually remove the instruction cache invalidation so
>>> this sentence is a bit misleading.
>>
>> I forgot to add the word "remove" in the sentence.
> 
> Ok (my sentence was also wrong by the way)
> 
>>
>>> Also an open question: shouldn’t we flush the data cache ?
>> Do you mean clean/invalidate to PoC/PoU? Something else?
> 
> Yes, probably to PoU.
> 
>>
>>> As we switch from one TTBR to an other, there might be some data
>>> in the cache dependent that could be flushed while the MMU is off
>>
>> I am a bit confused. Those flush could also happen with the MMU on. So how turning off the MMU would result to a problem? Note that the data cache is still enabled during the switch.
> 
> If the first level of cache is VIPT and we turn off the MMU, I am wondering if this could not create troubles and could require the cache to be flushed before turning the MMU off.
My reading of the Arm Arm (D5.11.1 "Data and unified caches" ARM DDI 
0487F.c) suggests the data cache is always PIPT.

> I have no idea if this is a problem or not, just raising the question.
> I can try to dig on that at Arm when I am back in 10 days.

Enjoy it!

Cheers,

-- 
Julien Grall

