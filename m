Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0876D748E59
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 21:52:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559501.874517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH8Wz-0004eI-OJ; Wed, 05 Jul 2023 19:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559501.874517; Wed, 05 Jul 2023 19:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH8Wz-0004cA-L5; Wed, 05 Jul 2023 19:51:17 +0000
Received: by outflank-mailman (input) for mailman id 559501;
 Wed, 05 Jul 2023 19:51:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qH8Wx-0004c4-No
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 19:51:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qH8Wx-0001RR-7O; Wed, 05 Jul 2023 19:51:15 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.19.213]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qH8Ww-0007Nc-W3; Wed, 05 Jul 2023 19:51:15 +0000
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
	bh=KbCa1+EZ3DdEju2DRt6wgavw4F1Rbogq9N2Xe8uoGhA=; b=4QMPFiH3OGLAIn2JxHiADhP6V5
	AVvpeJ4j9aXAe/05VFMdmC2y9wQE79gXo2u8Qd96ORknvouXnwTwQibxaVJQIGZm2HNQkcQuKVy6b
	f8/K5hVYTb20whFiiaF62Tr7DI/3ZQaksR83AuQn6EMVUXsCT7ZoxKhg/8KjGouvs7mI=;
Message-ID: <89814361-c9ff-0ab1-2b44-508ff2fb20f4@xen.org>
Date: Wed, 5 Jul 2023 20:51:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 52/52] xen/arm: add Kconfig option CONFIG_HAS_MPU to
 enable MPU system support
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, Penny Zheng <Penny.Zheng@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-53-Penny.Zheng@arm.com>
 <e88e1685-0ba1-8c2a-9a9a-d9fad631018d@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e88e1685-0ba1-8c2a-9a9a-d9fad631018d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 05/07/2023 18:20, Ayan Kumar Halder wrote:
> 
> On 26/06/2023 04:34, Penny Zheng wrote:
>> CAUTION: This message has originated from an External Source. Please 
>> use proper judgment and caution when opening attachments, clicking 
>> links, or responding to this email.
>>
>>
>> Introduce a Kconfig option CONFIG_HAS_MPU to enable MPU architecture
>> support. STATIC_MEMORY, ARCH_MAP_DOMAIN_PAGE and ARM_SECURE_STATE will
>> be selected by MPU system by default. Also, features like, ARM_EFI, are
>> not supported right now.
>>
>> Current MPU system design is only for ARM 64-bit platform.
>>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> ---
>> v3:
>> - select ARCH_MAP_DOMAIN_PAGE and ARM_SECURE_STATE
>> - remove platform-specific config: CONFIG_ARM_V8R
>> ---
>>   xen/arch/arm/Kconfig | 14 +++++++++++++-
>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 3f67aacbbf..2acdf39ec8 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -62,6 +62,7 @@ source "arch/Kconfig"
>>   config HAS_MMU
>>          bool "Memory Management Unit support in a VMSA system"
>>          default y
>> +       depends on !HAS_MPU
>>          select HAS_PAGING_MEMPOOL
>>          select HAS_PMAP
>>          select HAS_VMAP
>> @@ -70,6 +71,17 @@ config HAS_MMU
>>            a memory system through a set of virtual to physical 
>> address mappings and associated memory
>>            properties held in memory-mapped tables known as 
>> translation tables.
>>
>> +config HAS_MPU
>> +       bool "Memory Protection Unit support in a PMSA system"
>> +       default n
>> +       depends on ARM_64
> This will not be true as R52 will support MPU

But the code will not compile until you work is added, correct? If so, I 
think it make sense to depend on ARM_64 for now.

>> +       select ARCH_MAP_DOMAIN_PAGE
>> +       select ARM_SECURE_STATE
> Also, R52 does not support secure state.
>> +       select STATIC_MEMORY
>> +       help
>> +         The PMSA is based on a Memory Protection Unit (MPU), which 
>> provides a much simpler
>> +         memory protection scheme than the MMU based VMSA.
>> +
> 
> Instead, I will suggest something like this :-
> 
> config ARM_V8R
>      bool "ARMv8-R AArch64 architecture support (UNSUPPORTED)" if 
> UNSUPPORTED
>      default n
>      select HAS_MPU
>      select ARM_SECURE_STATE
>      select STATIC_MEMORY
>      depends on ARM_64
>      help
>        This option enables Armv8-R profile for Arm64. Enabling this option
>        results in selecting MPU.
> 
> 
> So, that later on we can add :-
> 
> config AARCH32_V8R
>      bool "AArch32 Arm V8R Support (UNSUPPORTED)" if UNSUPPORTED
>      default n
>      select HAS_MPU
>      select STATIC_MEMORY
>      depends on ARM_32
>      help
>        This option enables Armv8-R profile for Arm32.

I believe the the duplication can be avoided if you write:

config ARM_MPU
       bool "..." if  UNSUPPORTED
       default n
       select ARM_SECURE_STATE if ARM_64
       select STATIC_MEMORY
       help
         ...

Not that I didn't use your proposed name because in the future there 
might be an ArmVx-R and we don't want to rename everything. So a more 
generic name is better.

Cheers,

-- 
Julien Grall

