Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBB566B976
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 09:56:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478459.741667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHLHS-00059P-OW; Mon, 16 Jan 2023 08:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478459.741667; Mon, 16 Jan 2023 08:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHLHS-00056d-Lr; Mon, 16 Jan 2023 08:55:50 +0000
Received: by outflank-mailman (input) for mailman id 478459;
 Mon, 16 Jan 2023 08:55:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHLHR-00056X-5V
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 08:55:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHLHQ-0000fa-Py; Mon, 16 Jan 2023 08:55:48 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.9.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHLHQ-0002sD-Jj; Mon, 16 Jan 2023 08:55:48 +0000
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
	bh=tnjZKwQ+Z9i0XREuukCBT0bJLNsB8i4nTwlMiBb8FJ0=; b=NReLxl/1+ewURp8ZYnSL7dBFQ0
	qB6LeBtDbaULbBKFWyEbAc5U59K3xziJX3/tH/qpNsnl6QsvOKHv1fLMfyN9eRKzJmuwNC+JYVvMX
	Dn1VrAbbU6CC6OyUbLjrx382DlDPj57g7F0f1dIo7giGrw8+449Vz5Adq6dzIJBQ4vO0=;
Message-ID: <cb8a09fd-6174-f747-1fc1-1ab472eecdfd@xen.org>
Date: Mon, 16 Jan 2023 08:55:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 09/14] xen/arm32: head: Remove restriction where to
 load Xen
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-10-julien@xen.org>
 <36a8cb2d-0bea-cdc3-5311-c743f60763d5@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <36a8cb2d-0bea-cdc3-5311-c743f60763d5@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/01/2023 08:14, Michal Orzel wrote:
> Hi Julien,

Hi Luca,

> On 13/01/2023 11:11, Julien Grall wrote:
>> +/*
>> + * Remove the temporary mapping of Xen starting at TEMPORARY_XEN_VIRT_START.
>> + *
>> + * Clobbers r0 - r1
>> + */
>> +remove_temporary_mapping:
>> +        /* r2:r3 := invalid page-table entry */
>> +        mov   r2, #0
>> +        mov   r3, #0
>> +
>> +        adr_l r0, boot_pgtable
>> +        mov_w r1, TEMPORARY_XEN_VIRT_START
>> +        get_table_slot r1, r1, 1     /* r1 := first slot */
> Can't we just use TEMPORARY_AREA_FIRST_SLOT?

IMHO, it would make the code a bit more difficult to read because the 
connection between TEMPORARY_XEN_VIRT_START and 
TEMPORARY_AREA_FIRST_SLOT is not totally obvious.

So I would rather prefer if this stays like that.

> 
>> +        lsl   r1, r1, #3             /* r1 := first slot offset */
>> +        strd  r2, r3, [r0, r1]
>> +
>> +        flush_xen_tlb_local r0
>> +
>> +        mov  pc, lr
>> +ENDPROC(remove_temporary_mapping)
>> +
>>   /*
>>    * Map the UART in the fixmap (when earlyprintk is used) and hook the
>>    * fixmap table in the page tables.
>> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
>> index 87851e677701..6c1b762e976d 100644
>> --- a/xen/arch/arm/include/asm/config.h
>> +++ b/xen/arch/arm/include/asm/config.h
>> @@ -148,6 +148,20 @@
>>   /* Number of domheap pagetable pages required at the second level (2MB mappings) */
>>   #define DOMHEAP_SECOND_PAGES (DOMHEAP_VIRT_SIZE >> FIRST_SHIFT)
>>
>> +/*
>> + * The temporary area is overlapping with the domheap area. This may
>> + * be used to create an alias of the first slot containing Xen mappings
>> + * when turning on/off the MMU.
>> + */
>> +#define TEMPORARY_AREA_FIRST_SLOT    (first_table_offset(DOMHEAP_VIRT_START))
>> +
>> +/* Calculate the address in the temporary area */
>> +#define TEMPORARY_AREA_ADDR(addr)                           \
>> +     (((addr) & ~XEN_PT_LEVEL_MASK(1)) |                    \
>> +      (TEMPORARY_AREA_FIRST_SLOT << XEN_PT_LEVEL_SHIFT(1)))
> XEN_PT_LEVEL_{MASK/SHIFT} should be used when we do not know the level upfront.
> Otherwise, no need for opencoding and you should use FIRST_MASK and FIRST_SHIFT.

We discussed in the past to phase out the use of FIRST_MASK, FIRST_SHIFT 
because the name is too generic. So for new code, we should use 
XEN_PT_LEVEL_{MASK/SHIFT}.

Cheers,

-- 
Julien Grall

