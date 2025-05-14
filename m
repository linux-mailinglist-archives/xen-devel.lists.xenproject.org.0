Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64203AB6862
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 12:06:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984160.1370342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF90Z-0002jS-CR; Wed, 14 May 2025 10:06:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984160.1370342; Wed, 14 May 2025 10:06:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF90Z-0002i2-92; Wed, 14 May 2025 10:06:39 +0000
Received: by outflank-mailman (input) for mailman id 984160;
 Wed, 14 May 2025 10:06:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uF90X-0002ht-Jr
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 10:06:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uF90W-008JsH-35;
 Wed, 14 May 2025 10:06:36 +0000
Received: from [15.248.2.24] (helo=[10.24.67.208])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uF90W-004cNH-0D;
 Wed, 14 May 2025 10:06:36 +0000
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
	bh=TYcgA3hc1azkRLtk2iA1LVAAHk7xja4a9yhWvKCOSw4=; b=q3mgjbK7dhy68Z8fvGcOxAp2X7
	LGeX6+66a3CMaHI60oRUm3I6Z92aT0ijltNwjZyv2umA6S6iRVeaJCKLSjjT1AF5Wa4FuPkyl1fKy
	iy6Rvxu6M14b5+DTHLe0kYyDXsK0hvJIi9MDGYgnSKUcBui/nyMHRVzEyKBGIQo+JrWE=;
Message-ID: <44143db1-1766-4851-9a0c-7428dce9087d@xen.org>
Date: Wed, 14 May 2025 11:06:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/dom0less: refactor architecture-specific DomU
 construction
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1747145897.git.oleksii.kurochko@gmail.com>
 <a13b414ba19c8928dc7b0e70cece6c26a77d514f.1747145897.git.oleksii.kurochko@gmail.com>
 <0acae8dd-d4d6-4d65-909d-637c4a283ea7@xen.org>
 <6ec7c286-a6c4-491b-8733-42037ba3b91a@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6ec7c286-a6c4-491b-8733-42037ba3b91a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 14/05/2025 10:57, Oleksii Kurochko wrote:
> 
> On 5/14/25 9:25 AM, Julien Grall wrote:
>> Hi Oleksii,
>>
>> On 13/05/2025 15:29, Oleksii Kurochko wrote:
>>> Refactor construct_domU() to improve architecture separation and reduce
>>> reliance on ARM-specific logic in common code:
>>> - Drop set_domain_type() from generic code. This function is specific
>>>    to ARM and serves no purpose on other architectures like RISC-V,
>>>    which lack the arch.type field in kernel_info.
>>
>> So you will only ever boot one type of domain on RISC-V? IOW, no 32-bit
>> or else?
> 
> The bitness of the guest and host should match. So, an RV32 host should run
> RV32 guests, and an RV64 host should run RV64 guests and so on.
> (I'm not really sure that on RISC-V it is possible to run with RV64 host
> an RV32 guest, but need to double-check)
> 
> Therefore, my plan for RISC-V is to have the following:
>    #ifdef CONFIG_RISCV_64
>    #define is_32bit_domain(d) (0)
>    #define is_64bit_domain(d) (1)
>    #else
>    #define is_32bit_domain(d) (1)
>    #define is_64bit_domain(d) (0)
>    #endif
> 
> With this definition, there's no need to use|(d)->arch.type| for RISC-V.
> 
>>
>>> - Introduce arch_construct_domU() to encapsulate architecture-specific
>>>    DomU construction steps.
>>> - Implement arch_construct_domU() for ARM. This includes:
>>>    - Setting the domain type for CONFIG_ARM64.
>>>    - Handling static memory allocation if xen,static-mem is present in
>>>      the device tree.
>>>    - Processing static shared memory.
>>> - Move call of make_resv_memory_node() to Arm's make_arch_nodes() as
>>>    this call is specific to CONFIG_STATIC_SHM which is ARM specific,
>>>    at least, now.
>>
>> This looks shortsighted. If there is a plan to use CONFIG_STATIC_SHM 
>> on RISC-V (I don't see why not today), then
>> I think the code should stick in common/ even if it is not fully usable
>> yet (that's the whole point of have CONFIG_* options).
> 
> We don't use this feature in the downstream repo, but I can imagine some 
> cases where it could be useful. So, for now, its
> use is purely theoretical and it is a reason why I agreed with Michal 
> and returned back these changes to Arm.

I strongly disagree with this statement. If a feature is not 
architecture specific (like static shared memory), then the code ought 
to be in common code so it can be re-used by others.

Also, AFAIK, the bulk of the static shared memory code is in common. So 
it would be rather easy to add support for RISC-V if we wanted to.

Given the code is already in common, it is rather silly to move the code 
back to Arm for then moving back to common potentially in a few weeks time.

So:

Nacked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


