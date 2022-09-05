Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C84445AD010
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 12:25:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398695.639610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV9He-0005kE-Mj; Mon, 05 Sep 2022 10:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398695.639610; Mon, 05 Sep 2022 10:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV9He-0005hK-JM; Mon, 05 Sep 2022 10:24:50 +0000
Received: by outflank-mailman (input) for mailman id 398695;
 Mon, 05 Sep 2022 10:24:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oV9Hd-0005hA-9H
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 10:24:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oV9Ha-0007Lb-7X; Mon, 05 Sep 2022 10:24:46 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.1.223]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oV9Ha-0007yx-0d; Mon, 05 Sep 2022 10:24:46 +0000
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
	bh=+buCVX/R7HsKg5J8hDkENMtQaIpdVJfRXnEceHXrBxo=; b=W9j8P/wty6t62v4FBj1YkJ6gCu
	XeBUE/GqhylfmQ/3M0gmUFzBWwRMq1aRhu+Uuv70s1QDu6R8qJo5fmT3E79XzOZ6lZSCKF30sAAbS
	UDDqC05XXOoQeTMwQjcj/cBHf90lCQt3Opsd5FQodvrSfwNzEJ4REjM4Roo39ZvMMu0g=;
Message-ID: <8ae636bb-9508-9477-af0e-d30440782dbf@xen.org>
Date: Mon, 5 Sep 2022 11:24:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v2 03/10] xen/arm: smmuv3: Ensure queue is read after
 updating prod pointer
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Zhou Wang <wangzhou1@hisilicon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Will Deacon <will@kernel.org>
References: <cover.1662123432.git.rahul.singh@arm.com>
 <59c24309e2d8494edf414904fe9725b4e7387098.1662123432.git.rahul.singh@arm.com>
 <alpine.DEB.2.22.394.2209021613440.3931@ubuntu-linux-20-04-desktop>
 <FB788985-2DE3-406D-9282-56B8C9E4B1C1@arm.com>
 <5f0bf815-3236-2262-62b4-cd3d99bb60ff@xen.org>
 <71FC45C0-2F78-4CB7-AAB7-5B2C357F2C74@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <71FC45C0-2F78-4CB7-AAB7-5B2C357F2C74@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bertrand,

On 05/09/2022 11:23, Bertrand Marquis wrote:
> Hi,
> 
>> On 5 Sep 2022, at 10:31, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 05/09/2022 10:18, Rahul Singh wrote:
>>>> On 3 Sep 2022, at 12:21 am, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>>
>>>> On Fri, 2 Sep 2022, Rahul Singh wrote:
>>>>> From: Zhou Wang <wangzhou1@hisilicon.com>
>>>>>
>>>>> Backport Linux commit a76a37777f2c. This is the clean backport without
>>>>> any changes.
>>>>>
>>>>> Reading the 'prod' MMIO register in order to determine whether or
>>>>> not there is valid data beyond 'cons' for a given queue does not
>>>>> provide sufficient dependency ordering, as the resulting access is
>>>>> address dependent only on 'cons' and can therefore be speculated
>>>>> ahead of time, potentially allowing stale data to be read by the
>>>>> CPU.
>>>>>
>>>>> Use readl() instead of readl_relaxed() when updating the shadow copy
>>>>> of the 'prod' pointer, so that all speculated memory reads from the
>>>>> corresponding queue can occur only from valid slots.
>>>>>
>>>>> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
>>>>> Link: https://lore.kernel.org/r/1601281922-117296-1-git-send-email-wangzhou1@hisilicon.com
>>>>> [will: Use readl() instead of explicit barrier. Update 'cons' side to match.]
>>>>> Signed-off-by: Will Deacon <will@kernel.org>
>>>>> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git a76a37777f2c
>>>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>>>> ---
>>>>> Changes in v2:
>>>>> - fix commit msg
>>>>> - add _iomb changes also from the origin patch
>>>>> ---
>>>>> xen/arch/arm/include/asm/system.h     |  1 +
>>>>> xen/drivers/passthrough/arm/smmu-v3.c | 11 +++++++++--
>>>>> 2 files changed, 10 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/arm/include/asm/system.h b/xen/arch/arm/include/asm/system.h
>>>>> index 65d5c8e423..fe27cf8c5e 100644
>>>>> --- a/xen/arch/arm/include/asm/system.h
>>>>> +++ b/xen/arch/arm/include/asm/system.h
>>>>> @@ -29,6 +29,7 @@
>>>>> #endif
>>>>>
>>>>> #define smp_wmb()       dmb(ishst)
>>>>> +#define __iomb()        dmb(osh)
>>>>
>>>> We don't have any other #define starting with __ in system.h.
>>>> I wonder if we should call this macro differently or simply iomb().
>>>   I think either iomb() or dma_mb() will be the right name.
>>> Please let me know your view on this.
>>
>> It is not 100% clear why Linux went with __iomb() rather than iomb(). But I would prefer to keep the __* version to match Linux.
>>
>> If the others really want to drop the __. Then I think it should be name iomb(). The rationale is while __iomb() is an alias to dma_mb(), the __iormb() behaves differently compare to dma_mb() (I haven't into details why).
>>
>> So if it was a read barrier, we would likely want to use the iormb() semantic. This will keep the terminology consistent with Linux (even if we remove the __).
> 
> We need the __iomb as “linux compatibility” in fact so I would suggest for now to only introduce it at the beginning of smmu-v3.c with other linux compatibility stuff to prevent adding this to Xen overall.

I would be fine with that.

Cheers,

-- 
Julien Grall

