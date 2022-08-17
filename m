Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CBC596BE7
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 11:15:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388773.625522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOF8k-0006yg-JI; Wed, 17 Aug 2022 09:15:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388773.625522; Wed, 17 Aug 2022 09:15:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOF8k-0006wg-GH; Wed, 17 Aug 2022 09:15:06 +0000
Received: by outflank-mailman (input) for mailman id 388773;
 Wed, 17 Aug 2022 09:15:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oOF8j-0006wa-7U
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 09:15:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oOF8e-0002n5-8W; Wed, 17 Aug 2022 09:15:00 +0000
Received: from [54.239.6.187] (helo=[10.7.237.25])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oOF8e-0008Fc-2J; Wed, 17 Aug 2022 09:15:00 +0000
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
	bh=0juTsaRrghihW+N6xhpiokCRY9dq6/5RTon/Hb7/MA4=; b=OTC9BGMQyr+vqlgFYGPSom/4le
	xulZksg7UEbySQ6m7uNYDgzGiucU56G2vlWz30jz17ePhJhY01HgwPKrIzp4TnkqzVITwZH9On40s
	ZsSitswAfNb4ZRT+Ubg+oTn+HPKhkimH/M9JXPLfKpdeDINhjPqyAzN1oevDZqk76dQk=;
Message-ID: <10fb8b11-1cb2-9394-f9fc-2eb6dd84543f@xen.org>
Date: Wed, 17 Aug 2022 10:14:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH for-4.17] xen/arm: Support properly __ro_after_init on Arm
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220816185954.31945-1-julien@xen.org>
 <da0126fb-d357-bde3-f362-32c7d3b51ee4@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <da0126fb-d357-bde3-f362-32c7d3b51ee4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 17/08/2022 09:37, Jan Beulich wrote:
> On 16.08.2022 20:59, Julien Grall wrote:
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -75,10 +75,24 @@ domid_t __read_mostly max_init_domid;
>>   
>>   static __used void init_done(void)
>>   {
>> +    int rc;
>> +
>>       /* Must be done past setting system_state. */
>>       unregister_init_virtual_region();
>>   
>>       free_init_memory();
>> +
>> +    /*
>> +     * We have finished to boot. Mark the section .data.ro_after_init
>> +     * read-only.
>> +     */
>> +    rc = modify_xen_mappings((unsigned long)&__ro_after_init_start,
>> +                             (unsigned long)&__ro_after_init_end,
>> +                             PAGE_HYPERVISOR_RO);
>> +    if ( rc )
>> +        panic("Unable to mark the .data.ro_after_init section read-only (rc = %d)\n",
>> +              rc);
> 
> Just wondering - is this really worth panic()ing?

The function should never fails and it sounds wrong to me to continue in 
the unlikely case it will fail.

> 
>> --- a/xen/arch/arm/xen.lds.S
>> +++ b/xen/arch/arm/xen.lds.S
>> @@ -83,6 +83,13 @@ SECTIONS
>>     _erodata = .;                /* End of read-only data */
>>   
>>     . = ALIGN(PAGE_SIZE);
>> +  .data.ro_after_init : {
>> +      __ro_after_init_start = .;
>> +      *(.data.ro_after_init)
>> +      . = ALIGN(PAGE_SIZE);
>> +      __ro_after_init_end = .;
>> +  } : text
> 
> Again just wondering: Wouldn't it be an option to avoid the initial
> page size alignment (and the resulting padding) here, simply making
> .data.ro_after_init part of .rodata and do the earlier write-protection
> only up to (but excluding) the page containing __ro_after_init_start?

So both this question and the previous one will impair the security of 
Xen on Arm (even though the later is only at boot time).

This is not something I will support just because we are going to save < 
PAGE_SIZE. If we are concern of the size wasted, then there are other 
way to mitigate it (i.e. moving more variables to __ro_after_init).

Cheers,

-- 
Julien Grall

