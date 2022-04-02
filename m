Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3864F050C
	for <lists+xen-devel@lfdr.de>; Sat,  2 Apr 2022 18:47:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297831.507365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naguL-0001KE-A6; Sat, 02 Apr 2022 16:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297831.507365; Sat, 02 Apr 2022 16:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naguL-0001HM-6a; Sat, 02 Apr 2022 16:47:25 +0000
Received: by outflank-mailman (input) for mailman id 297831;
 Sat, 02 Apr 2022 16:47:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1naguK-0001HG-0F
 for xen-devel@lists.xenproject.org; Sat, 02 Apr 2022 16:47:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naguJ-0005z9-OY; Sat, 02 Apr 2022 16:47:23 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naguJ-0002CE-Ik; Sat, 02 Apr 2022 16:47:23 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=kmuwigA4T1G3RXa0Hs6iPY+1hOUBVBNRW/sgHnZDlbs=; b=mzer7mBKWGz34qzWaSuRxf/67x
	Om9qA5eyOKz+PBdmKW80rGpdhssjGD+oK/MZ6Sau7fjck2a86AY8zCnMBKwCbjjpkEKf6IBE8R4UM
	upzNlF0F/y2kvqXX9DlZTHYsRVnjZrEx1OExsWxe6REj6hF9iQw38c/YcrMMI2ZGdwK0=;
Message-ID: <b62e61bd-ea54-e41e-17de-a07dbfe477b7@xen.org>
Date: Sat, 2 Apr 2022 17:47:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-8-julien@xen.org>
 <alpine.DEB.2.22.394.2204011700520.2910984@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 07/19] xen/arm: mm: Don't open-code Xen PT update in
 remove_early_mappings()
In-Reply-To: <alpine.DEB.2.22.394.2204011700520.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 02/04/2022 01:04, Stefano Stabellini wrote:
> On Mon, 21 Feb 2022, Julien Grall wrote:
>> From: Julien Grall <julien.grall@arm.com>
>>
>> Now that xen_pt_update_entry() is able to deal with different mapping
>> size, we can replace the open-coding of the page-tables update by a call
>> to modify_xen_mappings().
>>
>> As the function is not meant to fail, a BUG_ON() is added to check the
>> return.
>>
>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Nice!
> 
> 
>> ---
>>      Changes in v2:
>>          - Stay consistent with how function name are used in the commit
>>          message
>>          - Add my AWS signed-off-by
>> ---
>>   xen/arch/arm/mm.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index 7b4b9de8693e..f088a4b2de96 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -599,11 +599,11 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>>   
>>   void __init remove_early_mappings(void)
>>   {
>> -    lpae_t pte = {0};
>> -    write_pte(xen_second + second_table_offset(BOOT_FDT_VIRT_START), pte);
>> -    write_pte(xen_second + second_table_offset(BOOT_FDT_VIRT_START + SZ_2M),
>> -              pte);
>> -    flush_xen_tlb_range_va(BOOT_FDT_VIRT_START, BOOT_FDT_SLOT_SIZE);
>> +    int rc;
>> +
>> +    rc = modify_xen_mappings(BOOT_FDT_VIRT_START, BOOT_FDT_VIRT_END,
>> +                             _PAGE_BLOCK);
>> +    BUG_ON(rc);
> 
> Am I right that we are actually destroying the mapping, which usually is
> done by calling destroy_xen_mappings, but we cannot call
> destroy_xen_mappings in this case because it doesn't take a flags
> parameter?

You are right.

> 
> If so, then I would add a flags parameter to destroy_xen_mappings
> instead of calling modify_xen_mappings just to pass _PAGE_BLOCK.
> But I don't feel strongly about it so if you don't feel like making the
> change to destroy_xen_mappings, you can add my acked-by here anyway.

destroy_xen_mappings() is a function used by common code. This is the 
only place so far where I need to pass _PAGE_BLOCK and I don't expect it 
to be used by the common code any time soon.

So I am not in favor to add an extra parameter for destroy_xen_mappings().

Would you prefer if I open-code the call to xen_pt_update?

Cheers,

-- 
Julien Grall

