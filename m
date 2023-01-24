Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E5E67A346
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 20:43:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483726.750070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKPCL-0000H2-I8; Tue, 24 Jan 2023 19:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483726.750070; Tue, 24 Jan 2023 19:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKPCL-0000Dx-FQ; Tue, 24 Jan 2023 19:43:13 +0000
Received: by outflank-mailman (input) for mailman id 483726;
 Tue, 24 Jan 2023 19:43:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pKPCK-0000Dr-BB
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 19:43:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKPCK-000366-1X; Tue, 24 Jan 2023 19:43:12 +0000
Received: from [54.239.6.189] (helo=[192.168.20.46])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKPCJ-0003YK-QC; Tue, 24 Jan 2023 19:43:11 +0000
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
	bh=cpybMUAdKrtWBFuwNoYQoaHCzxjprMe8QEaNvpWeyHs=; b=vHqk4TWPF3dDSVAHiSuE19sVfa
	udWGiieZ6Onnv27Yv3vL/PUBZV+pxxJmS7ymItLU5A56fUXW49y10RmNlpp77CZG4NAfIw91W3Hot
	6t6ANMzCX63k/ub2ZRbp2e02tsg8LV3Uxy7IpchICO7TLd3uo/8SPYnPEnMEPe6VVpMk=;
Message-ID: <5c18827c-ffc2-1c31-bd7c-812ca05c4bc3@xen.org>
Date: Tue, 24 Jan 2023 19:43:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 10/14] xen/arm32: head: Widen the use of the temporary
 mapping
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-11-julien@xen.org>
 <0271e540-d3b0-fb9b-0f66-015abb45231c@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0271e540-d3b0-fb9b-0f66-015abb45231c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/01/2023 08:20, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> 
> On 13/01/2023 11:11, Julien Grall wrote:
>>
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> At the moment, the temporary mapping is only used when the virtual
>> runtime region of Xen is clashing with the physical region.
>>
>> In follow-up patches, we will rework how secondary CPU bring-up works
>> and it will be convenient to use the fixmap area for accessing
>> the root page-table (it is per-cpu).
>>
>> Rework the code to use temporary mapping when the Xen physical address
>> is not overlapping with the temporary mapping.
>>
>> This also has the advantage to simplify the logic to identity map
>> Xen.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ----
>>
>> Even if this patch is rewriting part of the previous patch, I decided
>> to keep them separated to help the review.
>>
>> The "folow-up patches" are still in draft at the moment. I still haven't
>> find a way to split them nicely and not require too much more work
>> in the coloring side.
>>
>> I have provided some medium-term goal in the cover letter.
>>
>>      Changes in v3:
>>          - Resolve conflicts after switching from "ldr rX, <label>" to
>>            "mov_w rX, <label>" in a previous patch
>>
>>      Changes in v2:
>>          - Patch added
>> ---
>>   xen/arch/arm/arm32/head.S | 82 +++++++--------------------------------
>>   1 file changed, 15 insertions(+), 67 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
>> index 3800efb44169..ce858e9fc4da 100644
>> --- a/xen/arch/arm/arm32/head.S
>> +++ b/xen/arch/arm/arm32/head.S
>> @@ -459,7 +459,6 @@ ENDPROC(cpu_init)
>>   create_page_tables:
>>           /* Prepare the page-tables for mapping Xen */
>>           mov_w r0, XEN_VIRT_START
>> -        create_table_entry boot_pgtable, boot_second, r0, 1
>>           create_table_entry boot_second, boot_third, r0, 2
>>
>>           /* Setup boot_third: */
>> @@ -479,67 +478,37 @@ create_page_tables:
>>           cmp   r1, #(XEN_PT_LPAE_ENTRIES<<3) /* 512*8-byte entries per page */
>>           blo   1b
>>
>> -        /*
>> -         * If Xen is loaded at exactly XEN_VIRT_START then we don't
>> -         * need an additional 1:1 mapping, the virtual mapping will
>> -         * suffice.
>> -         */
>> -        cmp   r9, #XEN_VIRT_START
>> -        moveq pc, lr
>> -
>>           /*
>>            * Setup the 1:1 mapping so we can turn the MMU on. Note that
>>            * only the first page of Xen will be part of the 1:1 mapping.
>> -         *
>> -         * In all the cases, we will link boot_third_id. So create the
>> -         * mapping in advance.
>>            */
>> +        create_table_entry boot_pgtable, boot_second_id, r9, 1
>> +        create_table_entry boot_second_id, boot_third_id, r9, 2
>>           create_mapping_entry boot_third_id, r9, r9
>>
>>           /*
>> -         * Find the first slot used. If the slot is not XEN_FIRST_SLOT,
>> -         * then the 1:1 mapping will use its own set of page-tables from
>> -         * the second level.
>> +         * Find the first slot used. If the slot is not the same
>> +         * as XEN_TMP_FIRST_SLOT, then we will want to switch
> Do you mean TEMPORARY_AREA_FIRST_SLOT?

Yes. I have fixed it in my tree.

> 
>> +         * to the temporary mapping before jumping to the runtime
>> +         * virtual mapping.
>>            */
>>           get_table_slot r1, r9, 1     /* r1 := first slot */
>> -        cmp   r1, #XEN_FIRST_SLOT
>> -        beq   1f
>> -        create_table_entry boot_pgtable, boot_second_id, r9, 1
>> -        b     link_from_second_id
>> -
>> -1:
>> -        /*
>> -         * Find the second slot used. If the slot is XEN_SECOND_SLOT, then the
>> -         * 1:1 mapping will use its own set of page-tables from the
>> -         * third level.
>> -         */
>> -        get_table_slot r1, r9, 2     /* r1 := second slot */
>> -        cmp   r1, #XEN_SECOND_SLOT
>> -        beq   virtphys_clash
>> -        create_table_entry boot_second, boot_third_id, r9, 2
>> -        b     link_from_third_id
>> +        cmp   r1, #TEMPORARY_AREA_FIRST_SLOT
>> +        bne   use_temporary_mapping
>>
>> -link_from_second_id:
>> -        create_table_entry boot_second_id, boot_third_id, r9, 2
>> -link_from_third_id:
>> -        /* Good news, we are not clashing with Xen virtual mapping */
>> +        mov_w r0, XEN_VIRT_START
>> +        create_table_entry boot_pgtable, boot_second, r0, 1
>>           mov   r12, #0                /* r12 := temporary mapping not created */
>>           mov   pc, lr
>>
>> -virtphys_clash:
>> +use_temporary_mapping:
>>           /*
>> -         * The identity map clashes with boot_third. Link boot_first_id and
>> -         * map Xen to a temporary mapping. See switch_to_runtime_mapping
>> -         * for more details.
>> +         * The identity mapping is not using the first slot
>> +         * TEMPORARY_AREA_FIRST_SLOT. Create a temporary mapping.
>> +         * See switch_to_runtime_mapping for more details.
>>            */
>> -        PRINT("- Virt and Phys addresses clash  -\r\n")
>>           PRINT("- Create temporary mapping -\r\n")
>>
>> -        /*
>> -         * This will override the link to boot_second in XEN_FIRST_SLOT.
>> -         * The page-tables are not live yet. So no need to use
>> -         * break-before-make.
>> -         */
>>           create_table_entry boot_pgtable, boot_second_id, r9, 1
>>           create_table_entry boot_second_id, boot_third_id, r9, 2
> Do we need to duplicate this if we just did the same in create_page_tables before branching to
> use_temporary_mapping?

Hmmm... Possibly not. I will give a try and let you know.

Cheers,

-- 
Julien Grall

