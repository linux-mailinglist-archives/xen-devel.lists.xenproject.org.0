Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A265ACEC78
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 10:58:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006409.1385590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN6Qs-0000e0-Vl; Thu, 05 Jun 2025 08:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006409.1385590; Thu, 05 Jun 2025 08:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN6Qs-0000cH-S2; Thu, 05 Jun 2025 08:58:42 +0000
Received: by outflank-mailman (input) for mailman id 1006409;
 Thu, 05 Jun 2025 08:58:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uN6Qq-0000aF-Kh
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 08:58:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uN6Qq-003VTO-05;
 Thu, 05 Jun 2025 08:58:40 +0000
Received: from [217.65.134.11] (helo=[192.168.101.22])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uN6Qq-00DZdR-03;
 Thu, 05 Jun 2025 08:58:39 +0000
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
	bh=FJQ5NkyhdWLa/O5URtZuwxoIIJqC7lGerPvtwz/vxz4=; b=0jdT8PljFvm4uc4xiLYFj2Mh9j
	m57vAi0YlNetSyLyzNtNwwOKG3SDtabtboywTTWEv4IeLEZASZ7Jv6Ev4JI9n4ANNNnx5fNF9wo12
	ClOVSzH3lLcummMMOM64h4YsrmWVF80GKrzMJawlrByRxs7BNj+U0DJmCYSzYLv3rcSY=;
Message-ID: <0f5a4c32-3631-4a4c-9dd5-ae5385fc984a@xen.org>
Date: Thu, 5 Jun 2025 09:58:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] arm/mpu: Provide and populate MPU C data
 structures
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250604174311.754899-1-ayan.kumar.halder@amd.com>
 <20250604174311.754899-3-ayan.kumar.halder@amd.com>
 <50c8e74e-95f6-4cea-b979-8b81d7575a21@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <50c8e74e-95f6-4cea-b979-8b81d7575a21@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 05/06/2025 08:44, Orzel, Michal wrote:
> 
> 
> On 04/06/2025 19:43, Ayan Kumar Halder wrote:
>> Do the arm32 equivalent initialization for commit id ca5df936c4.
> This is not a good commit msg.
> Also, we somewhat require passing 12 char long IDs.

We are following the same convention as Linux. IIRC this was updated 
because there was some collision with 10 characters in Linux (not sure 
if we have seen it in Xen yet).

[...]

>> diff --git a/xen/arch/arm/include/asm/mpu/regions.inc b/xen/arch/arm/include/asm/mpu/regions.inc
>> index 6b8c233e6c..943bcda346 100644
>> --- a/xen/arch/arm/include/asm/mpu/regions.inc
>> +++ b/xen/arch/arm/include/asm/mpu/regions.inc
>> @@ -24,7 +24,13 @@
>>   #define XEN_MPUMAP_ENTRY_SHIFT  0x3     /* 8 byte structure */
>>   
>>   .macro store_pair reg1, reg2, dst
>> -    .word 0xe7f000f0                    /* unimplemented */
>> +    str \reg1, [\dst]
>> +    add \dst, \dst, #4
>> +    str \reg2, [\dst]
> AFAIR there is STM instruction to do the same

AFAICT, one issue with stm is the ordering is forced by the instruction 
rather than the user. So \reg1 could be stored first.

I think it would be better to use "strd". It still has restriction
(the two registers need to have contiguous index). But I think that 
would be better if we want to reduce the number of instructions.

Cheers,

> 
>> +.endm
>> +
>> +.macro invalidate_dcache_one reg
>> +    mcr CP32(\reg, DCIMVAC)
> Why? You don't seem to use this macro
> 
>>   .endm
>>   
>>   #endif
> 
> ~Michal
> 

-- 
Julien Grall


