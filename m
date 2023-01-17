Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FBE66DB79
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 11:48:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479319.743097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHjVW-0008I5-6A; Tue, 17 Jan 2023 10:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479319.743097; Tue, 17 Jan 2023 10:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHjVW-0008FJ-2t; Tue, 17 Jan 2023 10:47:58 +0000
Received: by outflank-mailman (input) for mailman id 479319;
 Tue, 17 Jan 2023 10:47:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHjVU-0008FA-H0
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 10:47:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHjVU-0005Dl-8d; Tue, 17 Jan 2023 10:47:56 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.7.198]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHjVU-000829-1h; Tue, 17 Jan 2023 10:47:56 +0000
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
	bh=mT57WQjRpNN4uGBMl2CRl8pj7ZmgBOmNppM/nj3e4ZA=; b=d/EeKMetxegDnokVN5Zjk7Dkxo
	dg16ELCQa8u5WLFipWMrS9yXnpNniCtvaEhBmz/Me1Cc9OD22Xeka0TCio3u6dgaokRLxXG9Rcamf
	AjOjX4t1BMuqEpqxoaD7j2VoGSVgZuxMNTqJdIZDkbI86TtYSdDL9F3yONHG+lz5zqtM=;
Message-ID: <6adeccb8-1cd9-37f3-25d1-0c8ef275c374@xen.org>
Date: Tue, 17 Jan 2023 10:47:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] xen/arm: Harden setup_frametable_mappings
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230116144106.12544-1-michal.orzel@amd.com>
 <2a679d99-4ed4-4fe8-8aee-faee57b5007b@xen.org>
 <001fe638-1bd8-5624-499e-8f1690cb33c0@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <001fe638-1bd8-5624-499e-8f1690cb33c0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 17/01/2023 09:49, Michal Orzel wrote:
> Hi Julien,
> 
> On 17/01/2023 10:29, Julien Grall wrote:
>>
>>
>> Hi Michal,
>>
>> On 16/01/2023 14:41, Michal Orzel wrote:
>>> The amount of supported physical memory depends on the frametable size
>>> and the number of struct page_info entries that can fit into it. Define
>>> a macro PAGE_INFO_SIZE to store the current size of the struct page_info
>>> (i.e. 56B for arm64 and 32B for arm32) and add a sanity check in
>>> setup_frametable_mappings to be notified whenever the size of the
>>> structure changes. Also call a panic if the calculated frametable_size
>>> exceeds the limit defined by FRAMETABLE_SIZE macro.
>>>
>>> Update the comments regarding the frametable in asm/config.h and take
>>> the opportunity to remove unused macro FRAMETABLE_VIRT_END on arm32.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>>    xen/arch/arm/include/asm/config.h |  5 ++---
>>>    xen/arch/arm/include/asm/mm.h     | 11 +++++++++++
>>>    xen/arch/arm/mm.c                 |  5 +++++
>>>    3 files changed, 18 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
>>> index 16213c8b677f..d8f99776986f 100644
>>> --- a/xen/arch/arm/include/asm/config.h
>>> +++ b/xen/arch/arm/include/asm/config.h
>>> @@ -82,7 +82,7 @@
>>>     * ARM32 layout:
>>>     *   0  -  12M   <COMMON>
>>>     *
>>> - *  32M - 128M   Frametable: 24 bytes per page for 16GB of RAM
>>> + *  32M - 128M   Frametable: 32 bytes per page for 12GB of RAM
>>>     * 256M -   1G   VMAP: ioremap and early_ioremap use this virtual address
>>>     *                    space
>>>     *
>>> @@ -95,7 +95,7 @@
>>>     *
>>>     *   1G -   2G   VMAP: ioremap and early_ioremap
>>>     *
>>> - *  32G -  64G   Frametable: 24 bytes per page for 5.3TB of RAM
>>> + *  32G -  64G   Frametable: 56 bytes per page for 2TB of RAM
>>>     *
>>>     * 0x0000008000000000 - 0x00007fffffffffff (127.5TB, L0 slots [1..255])
>>>     *  Unused
>>> @@ -127,7 +127,6 @@
>>>    #define FRAMETABLE_VIRT_START  _AT(vaddr_t,0x02000000)
>>>    #define FRAMETABLE_SIZE        MB(128-32)
>>>    #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
>>> -#define FRAMETABLE_VIRT_END    (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE - 1)
>>
>> This is somewhat unrelated to the goal of the patch. We do clean-up in
>> the same patch, but they tend to be in the same of already modified hunk
>> (which is not the case here).
>>
>> So I would prefer if this is split. This would make this patch a
>> potential candidate for backport.
> Just for clarity. Do you mean to separate all the config.h changes or only
> the FRAMETABLE_VIRT_END removal? I guess the former.

The latter. The comment update makes sense here because this is what 
actually triggered this patch.

Cheers,

-- 
Julien Grall

