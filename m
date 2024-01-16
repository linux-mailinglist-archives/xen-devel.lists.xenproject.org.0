Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CE782F097
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 15:36:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667798.1039421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPkXY-0006Z9-VY; Tue, 16 Jan 2024 14:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667798.1039421; Tue, 16 Jan 2024 14:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPkXY-0006Xa-SP; Tue, 16 Jan 2024 14:35:44 +0000
Received: by outflank-mailman (input) for mailman id 667798;
 Tue, 16 Jan 2024 14:35:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rPkXX-0006XU-Jj
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 14:35:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rPkXW-0002tt-Su; Tue, 16 Jan 2024 14:35:42 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[10.95.149.176]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rPkXW-0000OY-Lj; Tue, 16 Jan 2024 14:35:42 +0000
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
	bh=f+ku8OatD4EEqeSeF/EEj15d86aozunV6ZNdv5iaSIk=; b=dx+RF8Ag1gLJUi37txLxaivRnV
	6wNEvyj2nLeFD0M9V35zSWt4Y/03YtaYLNEY19Dl4vVKnrQExPCWc4w0MEH272nz+kHXZOr6zLl3t
	bce21q7oklQFJltiFlj3xJojvzorFWZQuqaolnHf8xfecbX05w+0I8igQTFbIPBxQ29w=;
Message-ID: <a2365149-9557-43dd-8a55-5812e9f56642@xen.org>
Date: Tue, 16 Jan 2024 14:35:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] [DO NOT COMMIT] xen/arm: Create a trampoline for
 secondary boot CPUs
Content-Language: en-GB
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240116115509.77545-1-julien@xen.org>
 <20240116115509.77545-4-julien@xen.org>
 <CAG+AhRWrN=Y4ZT57GjYMoX=7LPe0_3Xg_xaSnA4DY6CDHWPK0Q@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAG+AhRWrN=Y4ZT57GjYMoX=7LPe0_3Xg_xaSnA4DY6CDHWPK0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 16/01/2024 14:24, Carlo Nonato wrote:
> Hi Julien,
> 
> On Tue, Jan 16, 2024 at 12:55 PM Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> In order to confirm the early boot code is self-contained, allocate a
>> separate trampoline region for secondary to boot from it.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ---
>>   xen/arch/arm/arm64/mmu/mm.c |  7 +++++++
>>   xen/arch/arm/mmu/smpboot.c  |  4 +++-
>>   xen/arch/arm/psci.c         |  5 ++++-
>>   xen/arch/arm/smpboot.c      | 15 ++++++++++++++-
>>   4 files changed, 28 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
>> index d2651c948698..3c4988dc75d1 100644
>> --- a/xen/arch/arm/arm64/mmu/mm.c
>> +++ b/xen/arch/arm/arm64/mmu/mm.c
>> @@ -110,11 +110,18 @@ void __init arch_setup_page_tables(void)
>>       prepare_runtime_identity_mapping();
>>   }
>>
>> +extern mfn_t trampoline_start;
>> +
>>   void update_identity_mapping(bool enable)
>>   {
>>       paddr_t id_addr = virt_to_maddr(_start);
>>       int rc;
>>
>> +    if ( !mfn_eq(trampoline_start, INVALID_MFN) )
>> +    {
>> +        id_addr = mfn_to_maddr(trampoline_start);
>> +    }
>> +
>>       if ( enable )
>>           rc = map_pages_to_xen(id_addr, maddr_to_mfn(id_addr), 1,
>>                                 PAGE_HYPERVISOR_RX);
>> diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
>> index f1cf9252710c..d768dfe065a5 100644
>> --- a/xen/arch/arm/mmu/smpboot.c
>> +++ b/xen/arch/arm/mmu/smpboot.c
>> @@ -72,13 +72,15 @@ static void clear_boot_pagetables(void)
>>       clear_table(boot_third);
>>   }
>>
>> +extern mfn_t trampoline_start;
>> +
>>   static void set_init_ttbr(lpae_t *root)
> 
> Isn't this function not present in the patch series?

Oh. It looks like I forgot to post one patch. Let me resend it.

Cheers,

-- 
Julien Grall

