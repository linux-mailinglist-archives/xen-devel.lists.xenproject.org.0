Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1412742935
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 17:15:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556903.869774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtM5-0007ed-So; Thu, 29 Jun 2023 15:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556903.869774; Thu, 29 Jun 2023 15:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtM5-0007d1-PR; Thu, 29 Jun 2023 15:14:45 +0000
Received: by outflank-mailman (input) for mailman id 556903;
 Thu, 29 Jun 2023 15:14:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qEtM4-0007cr-PS
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 15:14:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEtM2-0007Hg-Ls; Thu, 29 Jun 2023 15:14:42 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.2.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEtM2-0007Hl-DQ; Thu, 29 Jun 2023 15:14:42 +0000
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
	bh=fxSnEtfgvDLdV2Sq+17Ez9x2jTvWuWij7HjEITrypHg=; b=ggRIe7AqV+fkS7BKyzHAIRFLR3
	df1w6NvF7qKEzTXTzWiUAvIbHi3AZXSWIs8wMg4KIPMXu5gQxCs8SH9+YLADqCcq4JJhjAxu6rwX6
	P2l9x4/KxnaHgPfyNQkcIZkHRL+xmpE5kZAS8mpGewgd3jrn9g0CSTvyCivTSNLS5qfs=;
Message-ID: <9ae972a7-d229-4eb5-0f11-2a73f12d5ef8@xen.org>
Date: Thu, 29 Jun 2023 16:14:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 28/52] xen/mpu: plump virt/maddr conversion in MPU
 system
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Penny Zheng
 <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-29-Penny.Zheng@arm.com>
 <674011bb-b8df-d11e-a322-1827096c1b74@amd.com>
 <2c8387ab-547d-5bdf-5d62-e7a950e5c1de@citrix.com>
 <e86edf7f-b543-4e9d-746e-2caeec36db79@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e86edf7f-b543-4e9d-746e-2caeec36db79@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 29/06/2023 15:44, Ayan Kumar Halder wrote:
> 
> On 29/06/2023 15:23, Andrew Cooper wrote:
>> On 29/06/2023 3:20 pm, Ayan Kumar Halder wrote:
>>> On 26/06/2023 04:34, Penny Zheng wrote:
>>>> diff --git a/xen/arch/arm/include/asm/mm.h
>>>> b/xen/arch/arm/include/asm/mm.h
>>>> index eb520b49e3..ea4847c12b 100644
>>>> --- a/xen/arch/arm/include/asm/mm.h
>>>> +++ b/xen/arch/arm/include/asm/mm.h
>>>> @@ -292,6 +301,12 @@ static inline void *maddr_to_virt(paddr_t ma)
>>>>                         ((ma & ma_top_mask) >> pfn_pdx_hole_shift)));
>>>>    }
>>>>    #endif
>>>> +#else /* CONFIG_HAS_MPU */
>>>> +static inline void *maddr_to_virt(paddr_t ma)
>>>> +{
>>>> +    return (void *)(unsigned long)ma;
>>> Why do you need "(unsigned long)ma" ? Both "unsigned long" and
>>> "paddr_t" are u64.
>> For when paddr_t really isn't u64.
> 
> Sorry, I am missing something
> 
>  From 
> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/include/asm/types.h;h=fb6618ef247fe8e3abe472e50b4877e11cc8a96c;hb=refs/heads/staging
> 
> In CONFIG_ARM_64
> 
> typedef unsigned long u64;
> 
> typedef u64 paddr_t;
> 
> So, why do we need to typecast "paddr_t" to "unsigned long" as they are 
> the same ?
We may decide to restrict paddr_t to 32-bit in the future on Arm64.

Also, when CONFIG_PHYS_ADDR_T_32=n, paddr_t is 64-bit on 32-bit Xen. So 
casting directly to (void *) is not possible. Although, this is not a 
problem here because for the MPU on 32-bit, you would select 
CONFIG_PHYS_ADDR_T_32.

On a side note, I agree with Andrew that we should switch to _p().

Cheers,

-- 
Julien Grall

