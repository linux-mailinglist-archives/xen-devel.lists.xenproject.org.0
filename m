Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A25B3F2B59
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 13:38:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169449.309538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH2q4-0003Jn-5q; Fri, 20 Aug 2021 11:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169449.309538; Fri, 20 Aug 2021 11:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH2q4-0003HK-2u; Fri, 20 Aug 2021 11:37:32 +0000
Received: by outflank-mailman (input) for mailman id 169449;
 Fri, 20 Aug 2021 11:37:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mH2q2-0003HE-JC
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 11:37:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mH2q1-0000o7-IO; Fri, 20 Aug 2021 11:37:29 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mH2q1-0008F5-Cj; Fri, 20 Aug 2021 11:37:29 +0000
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
	bh=YHiAFsyL75OWyuvIvgYr5cJmSnEUh/HX4HxdDz8iA2A=; b=cgagBSZ8Gq+VtkQTUlCRjLA/fQ
	FwFhreClSWCJuzV8+Bl6g+ISKMji7ueRLe0yBesor0JG/EqaKIz4ODbGr7iHgNR6xjIb+e0tmz8Jg
	39VVgK5yzd+gvB5xRWYPB9fP7lw/fOy1f0iVki/vkAzZX4n5YU46FLYly8dcCIKXdg6I=;
Subject: Re: [PATCH v1 02/14] xen/pci: solve compilation error on ARM with
 HAS_PCI enabled
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <c6009c327eaed66206fa093732ab6672530acd27.1629366665.git.rahul.singh@arm.com>
 <a0d06e37-ec02-9968-01d7-907176c7c9b3@xen.org>
 <7F8FC9A8-5580-4517-BF8C-640BCE778D02@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1abfb3cb-993d-3389-c627-6b8cf40457a4@xen.org>
Date: Fri, 20 Aug 2021 12:37:27 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <7F8FC9A8-5580-4517-BF8C-640BCE778D02@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 20/08/2021 11:30, Rahul Singh wrote:
>> Please add a comment explaining why this just returns 0.
> 
> Here is the comment that I will add in next version.
> /*
>   * Return 0 as on ARM there is no pci physical irqs that required cleanup.
>   */

In this context, PIRQ means an interrupts that was routed to the guest 
and could be mapped to an event channel. We have no such concept on Arm 
(see allocate_pirq_struct()).

So I would write "PIRQ event channels are not supported on Arm, so 
nothing to do".

> 
>>
>>> +
>>> +/*
>>> + * Local variables:
>>> + * mode: C
>>> + * c-file-style: "BSD"
>>> + * c-basic-offset: 4
>>> + * tab-width: 4
>>> + * indent-tabs-mode: nil
>>> + * End:
>>> + */
>>> diff --git a/xen/drivers/passthrough/arm/iommu.c b/xen/drivers/passthrough/arm/iommu.c
>>> index db3b07a571..fdec1c5547 100644
>>> --- a/xen/drivers/passthrough/arm/iommu.c
>>> +++ b/xen/drivers/passthrough/arm/iommu.c
>>> @@ -135,3 +135,8 @@ void arch_iommu_domain_destroy(struct domain *d)
>>>   void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>>>   {
>>>   }
>>> +
>>> +bool arch_iommu_use_permitted(const struct domain *d)
>>> +{
>>> +    return true;
>>> +}
>>
>> Please add a comment explaining why returning true is always fine.
> 
> Here is the comment that I will add in next version:
> 
> /*
>   * Return true as iommu use is always permitted if mem-sharing,
>   * mem-paging, or log-dirty functionality is not enabled.
>   */
How about writing "Unlike x86, Arm doesn't support mem-sharing, 
mem-paging and log-dirty (yet). So there is no restriction to use the 
IOMMU".

This would make clear why you are mentioning mem-sharing, mem-paging & co.

Cheers,

-- 
Julien Grall

