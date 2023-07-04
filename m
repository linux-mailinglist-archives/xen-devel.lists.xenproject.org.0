Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8B574701D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 13:45:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558279.872217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGeSm-00064J-K3; Tue, 04 Jul 2023 11:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558279.872217; Tue, 04 Jul 2023 11:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGeSm-00061e-Ft; Tue, 04 Jul 2023 11:44:56 +0000
Received: by outflank-mailman (input) for mailman id 558279;
 Tue, 04 Jul 2023 11:44:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGeSl-00061U-9m
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 11:44:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGeSk-0006Pi-Gj; Tue, 04 Jul 2023 11:44:54 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGeSk-00018m-A2; Tue, 04 Jul 2023 11:44:54 +0000
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
	bh=FNRxPPITnRQS+7Jl7qtJ4CP52HqUX7u+GL8GLOzKqwQ=; b=6C0d+H+roX0CS+5MFV2gJnRkeM
	TCj6d9BWLKFqvh7XDl+QT6pZcs5WTpRJEnHjwpG7BpmmIE91BnHq8DXEStXb7t7ELrTh3m0Qyx6zd
	lI3cdQloEOG03Por3+J6rl93EkeA/iKeO1eQy9gwmk0bk53AH8h4UUWKcH2WB3n3o86k=;
Message-ID: <1cbf44ae-2500-1428-5dd2-893e846faf1e@xen.org>
Date: Tue, 4 Jul 2023 12:44:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 06/52] xen/arm: introduce CONFIG_HAS_MMU
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, Penny Zheng <Penny.Zheng@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-7-Penny.Zheng@arm.com>
 <4303bf0e-a987-1ee4-9524-c83756789322@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4303bf0e-a987-1ee4-9524-c83756789322@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 04/07/2023 12:14, Ayan Kumar Halder wrote:
> On 26/06/2023 04:33, Penny Zheng wrote:
>> CAUTION: This message has originated from an External Source. Please 
>> use proper judgment and caution when opening attachments, clicking 
>> links, or responding to this email.
>>
>>
>> This commit wants to introduce a new Kconfig CONFIG_HAS_MMU to guard
>> MMU-related codes, to tell two different memory management architecture:
>> VMAS and PMSA.
>>
>> In a VMSA system, a Memory Management Unit (MMU) provides fine-grained
>> control of a memory system through a set of virtual to physical address
>> mappings and associated memory properties held in memory-mapped tables
>> known as translation tables.
>>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> ---
>> v3:
>> - new patch
>> ---
>>   xen/arch/arm/Kconfig | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index ff17345cdb..fb77392b82 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -60,6 +60,14 @@ config PADDR_BITS
>>
>>   source "arch/Kconfig"
>>
>> +config HAS_MMU
>> +       bool "Memory Management Unit support in a VMSA system"
>> +       default y

I don't think you can disable HAS_MMU right now. So you want to drop the 
description to prevent a user to select it. This could then be combined to

"def_bool y".

>> +       help
>> +         In a VMSA system, a Memory Management Unit (MMU) provides 
>> fine-grained control of
>> +         a memory system through a set of virtual to physical address 
>> mappings and associated memory
>> +         properties held in memory-mapped tables known as translation 
>> tables.
>> +
>>   config ACPI
>>          bool "ACPI (Advanced Configuration and Power Interface) 
>> Support (UNSUPPORTED)" if UNSUPPORTED
>>          depends on ARM_64
> 
> I don't think you need this option.

I think we want to introduce a 'choice' where the user can select either 
the MPU or MMU. But not both.

This would be similar to how we select the Physical address space size.

Cheers,

-- 
Julien Grall

