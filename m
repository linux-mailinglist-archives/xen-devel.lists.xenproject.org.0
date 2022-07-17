Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C057357764E
	for <lists+xen-devel@lfdr.de>; Sun, 17 Jul 2022 15:07:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369066.600431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oD3yc-0007xa-Ec; Sun, 17 Jul 2022 13:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369066.600431; Sun, 17 Jul 2022 13:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oD3yc-0007vm-Bo; Sun, 17 Jul 2022 13:06:26 +0000
Received: by outflank-mailman (input) for mailman id 369066;
 Sun, 17 Jul 2022 13:06:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oD3yb-0007vg-9r
 for xen-devel@lists.xenproject.org; Sun, 17 Jul 2022 13:06:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oD3ya-0005oS-L9; Sun, 17 Jul 2022 13:06:24 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oD3ya-0000CM-EI; Sun, 17 Jul 2022 13:06:24 +0000
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
	bh=uUAYx4VSAOCD5C1ACoAywJWE3QEcUX/3ndNnyoI3T98=; b=gIfRbY27E9u20RclCP/lUBnI1D
	/1t1f1PyG+KeIFZ02yNVvimMbc+zRuGTXb/2TOr8MeLqUv2uQZac1W2XbRFK/7AA/duI41wZFVhLm
	b2uuBxat+dGPSx4FTSkKMt3zwLgYr8seyxeXNwJMQpaAQlrfUl1u3rAJ9UsENJXsfq5Q=;
Message-ID: <2b8cac30-f696-8414-944c-aeb1bcaf58a5@xen.org>
Date: Sun, 17 Jul 2022 14:06:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 7/7] xen/arm: mm: Reduce the area that xen_second covers
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220624091146.35716-1-julien@xen.org>
 <20220624091146.35716-8-julien@xen.org>
 <f311e86b-7d37-53f1-d2d5-e31d10654c87@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f311e86b-7d37-53f1-d2d5-e31d10654c87@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 27/06/2022 08:51, Michal Orzel wrote:
> On 24.06.2022 11:11, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> At the moment, xen_second is used to cover the first 2GB of the
>> virtual address space. With the recent rework of the page-tables,
>> only the first 1GB region (where Xen resides) is effectively used.
>>
>> In addition to that, I would like to reshuffle the memory layout.
>> So Xen mappings may not be anymore in the first 2GB of the virtual
>> address space.
>>
>> Therefore, rework xen_second so it only covers the 1GB region where
>> Xen will reside.
>>
>> With this change, xen_second doesn't cover anymore the xenheap area
>> on arm32. So, we first need to add memory to the boot allocator before
>> setting up the xenheap mappings.
>>
>> Take the opportunity to update the comments on top of xen_fixmap and
>> xen_xenmap.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ---
>>   xen/arch/arm/mm.c    | 32 +++++++++++---------------------
>>   xen/arch/arm/setup.c | 13 +++++++++++--
>>   2 files changed, 22 insertions(+), 23 deletions(-)
>>
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index 74666b2e720a..f87a7c32d07d 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -116,17 +116,14 @@ static DEFINE_PAGE_TABLE(cpu0_pgtable);
>>   #endif
>>   
>>   /* Common pagetable leaves */
>> -/* Second level page tables.
>> - *
>> - * The second-level table is 2 contiguous pages long, and covers all
>> - * addresses from 0 to 0x7fffffff. Offsets into it are calculated
>> - * with second_linear_offset(), not second_table_offset().
>> - */
>> -static DEFINE_PAGE_TABLES(xen_second, 2);
>> -/* First level page table used for fixmap */
>> +/* Second level page table used to cover Xen virtual address space */
>> +static DEFINE_PAGE_TABLE(xen_second);
>> +/* Third level page table used for fixmap */
>>   DEFINE_BOOT_PAGE_TABLE(xen_fixmap);
>> -/* First level page table used to map Xen itself with the XN bit set
>> - * as appropriate. */
>> +/*
>> + * Third level page table used to map Xen itself with the XN bit set
>> + * as appropriate.
>> + */
>>   static DEFINE_PAGE_TABLE(xen_xenmap);
>>   
>>   /* Non-boot CPUs use this to find the correct pagetables. */
>> @@ -168,7 +165,6 @@ static void __init __maybe_unused build_assertions(void)
>>       BUILD_BUG_ON(zeroeth_table_offset(XEN_VIRT_START));
>>   #endif
>>       BUILD_BUG_ON(first_table_offset(XEN_VIRT_START));
>> -    BUILD_BUG_ON(second_linear_offset(XEN_VIRT_START) >= XEN_PT_LPAE_ENTRIES);
> Instead of removing this completely, shouldn't you change it to:
> BUILD_BUG_ON(second_table_offset(XEN_VIRT_START)); ?
This would be wrong because the 2nd table offset is 1 today (Xen starts 
at 2MB).

Furthermore, setup_pagetables() doesn't make any assumption regarding 
the 2nd table offset. So I don't think we should have a BUILD_BUG_ON().

Cheers,

-- 
Julien Grall

