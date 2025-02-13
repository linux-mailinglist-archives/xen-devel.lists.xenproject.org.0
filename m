Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7617A34260
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 15:36:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887735.1297191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiaJc-0002ze-5L; Thu, 13 Feb 2025 14:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887735.1297191; Thu, 13 Feb 2025 14:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiaJc-0002xy-2I; Thu, 13 Feb 2025 14:35:44 +0000
Received: by outflank-mailman (input) for mailman id 887735;
 Thu, 13 Feb 2025 14:35:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tiaJa-0002xs-4e
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 14:35:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tiaJZ-00GtmZ-31;
 Thu, 13 Feb 2025 14:35:41 +0000
Received: from [15.248.3.95] (helo=[10.24.66.127])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tiaJZ-00CC7M-1T;
 Thu, 13 Feb 2025 14:35:41 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=B7sur9Ph6Upl41HJr1Qh1gP19ZOFXXO42akP0cEwMgY=; b=PvvZM1SjIhTlI+pAsRoDXsfbIw
	R6SyuZqifBhn0glZOWiDcK5i+dMTpyUJK9myOPFCscF4ul2EWHLGW28dSLELEe1ZXcMKhOBZbOn2i
	3QHH7Ki/xpEtoy0QcH3R68em7hh7ZrL1Fdr3+u/pIDqIzbpykjGwCGgoV+JpVoDs4lSA=;
Message-ID: <b44214cd-5cb4-4737-97e6-6990572d059d@xen.org>
Date: Thu, 13 Feb 2025 14:35:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] xen: arm: enable stack protector feature
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20250114042553.1624831-1-volodymyr_babchuk@epam.com>
 <20250114042553.1624831-4-volodymyr_babchuk@epam.com>
 <1253fea9-5d91-4b65-a739-f85ae73de509@xen.org>
In-Reply-To: <1253fea9-5d91-4b65-a739-f85ae73de509@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 13/02/2025 14:20, Julien Grall wrote:
> Hi,
> 
> On 14/01/2025 04:25, Volodymyr Babchuk wrote:
>> Enable previously added CONFIG_STACK_PROTECTOR feature for ARM
>> platform. We initialize stack protector very early, in head.S using
>> boot_stack_chk_guard_setup. This ensures that all C code from the very
>> beginning can use stack protector.
>>
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>
>> ---
>> In v4:
>>   - setup.c does not call boot_stack_chk_guard_setup() anymore, because
>>     the original implementation was removed and
>>     boot_stack_chk_guard_setup_early was renamed to 
>> boot_stack_chk_guard_setup
>> In v3:
>>   - Call boot_stack_chk_guard_setup_early from head.S to ensure
>>     that stack is protected from early boot stages
>>   - Call boot_stack_chk_guard_setup() later, when time subsystem is
>>     sufficiently initialized to provide values for the random number
>>     generator.
>> In v2:
>>   - Reordered Kconfig entry
>> ---
>>   xen/arch/arm/Kconfig      | 1 +
>>   xen/arch/arm/arm64/head.S | 3 +++
>>   2 files changed, 4 insertions(+)
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index a26d3e1182..8f1a3c7d74 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -16,6 +16,7 @@ config ARM
>>       select GENERIC_UART_INIT
>>       select HAS_ALTERNATIVE if HAS_VMAP
>>       select HAS_DEVICE_TREE
>> +    select HAS_STACK_PROTECTOR
> 
> This is select stack protection for both 32-bit and 64-bit. Yet...
> 
>>       select HAS_UBSAN
>>   config ARCH_DEFCONFIG
>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> 
> ... you only modify arm64. Why?
> 
>> index 72c7b24498..5cbd62af86 100644
>> --- a/xen/arch/arm/arm64/head.S
>> +++ b/xen/arch/arm/arm64/head.S
>> @@ -250,6 +250,9 @@ real_start_efi:
>>   #endif
>>           PRINT("- Boot CPU booting -\r\n")
>> +#ifdef CONFIG_STACK_PROTECTOR
>> +        bl    boot_stack_chk_guard_setup
>> +#endif
> 
> I don't think you can call a C function this early:
>    * The stack is not set  (it is not clear why would the function not 
> use it)
>    * The MMU is not turned on

Just to expand, this is a problem because Xen may not be loaded with VA 
== PA. So depending on how the GCC generated boot_stack_chk_guard_setup, 
the global variable may be accessed with an absolution address (this 
would be the VA).

This means we could overwrite "random" memory.

>    * We don't follow the AAPCS
> 
> If you want to call from assembly, then I think it just needs to be 
> called before launch.

Actually we only setup the stack in launch. So I guess some re-ordering 
is needed to setup the stack earlier.

Cheers,

-- 
Julien Grall


