Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54998748234
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 12:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559039.873709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGznO-0004zy-GR; Wed, 05 Jul 2023 10:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559039.873709; Wed, 05 Jul 2023 10:31:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGznO-0004xH-CJ; Wed, 05 Jul 2023 10:31:38 +0000
Received: by outflank-mailman (input) for mailman id 559039;
 Wed, 05 Jul 2023 10:31:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGznM-0004xB-Vo
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 10:31:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGznM-0004jw-JW; Wed, 05 Jul 2023 10:31:36 +0000
Received: from [15.248.3.5] (helo=[10.24.67.21])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGznM-0000OG-Ei; Wed, 05 Jul 2023 10:31:36 +0000
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
	bh=2OG0gEQin0vUyf4v3tDzrqVWK+tqFLxSry0EtGtmz6c=; b=681JF8G13zjVWaCfh20XKixDUq
	xUnJpOKpMFeKS27uqcjGqdb+VdDVYFRhX0HcveuVVplN91OXIaMv1LMy1bLn2Y+/NK+Aa9EwG1s7e
	hoAELhMxYlwgUrZrj8Bj23RfMZZv8ts2lFQveBtmYTUFpNChtDMmL4f9l6w834Mrwh8E=;
Message-ID: <059b1018-58b9-5daf-7bf3-f9b84c0625ff@xen.org>
Date: Wed, 5 Jul 2023 11:31:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 11/52] xen/arm: mmu: fold FIXMAP into MMU system
Content-Language: en-US
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-12-Penny.Zheng@arm.com>
 <1be18c29-511e-27eb-0970-adaa1c74ce82@xen.org>
 <06760592-ab87-c6c8-83df-e9204fdedadf@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <06760592-ab87-c6c8-83df-e9204fdedadf@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Penny,

On 05/07/2023 09:19, Penny Zheng wrote:
> On 2023/7/5 06:12, Julien Grall wrote:
>> On 26/06/2023 04:34, Penny Zheng wrote:
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index fb77392b82..22b28b8ba2 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -15,7 +15,6 @@ config ARM
>>>       select HAS_DEVICE_TREE
>>>       select HAS_PASSTHROUGH
>>>       select HAS_PDX
>>> -    select HAS_PMAP
>>>       select IOMMU_FORCE_PT_SHARE
>>>   config ARCH_DEFCONFIG
>>> @@ -63,11 +62,17 @@ source "arch/Kconfig"
>>>   config HAS_MMU
>>>       bool "Memory Management Unit support in a VMSA system"
>>>       default y
>>> +    select HAS_PMAP
>>>       help
>>>         In a VMSA system, a Memory Management Unit (MMU) provides 
>>> fine-grained control of
>>>         a memory system through a set of virtual to physical address 
>>> mappings and associated memory
>>>         properties held in memory-mapped tables known as translation 
>>> tables.
>>> +config HAS_FIXMAP
>>> +    bool "Provide special-purpose 4K mapping slots in a VMSA"
>>
>>
>> Regardless what I wrote above, I don't think a developer should be 
>> able to disable HAS_FIXMAP when the HAS_MMU is used. So the 3 lines 
>> should be replaced with:
>>
>> def_bool HAS_MMU
> 
> Understood, will fix

Do you still need HAS_FIXMAP if this patch is dropped?

Cheers,

-- 
Julien Grall

