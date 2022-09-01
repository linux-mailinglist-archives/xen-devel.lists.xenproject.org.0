Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA995A998F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 15:58:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396652.636880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTkiF-0001SP-Jt; Thu, 01 Sep 2022 13:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396652.636880; Thu, 01 Sep 2022 13:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTkiF-0001Pj-Gv; Thu, 01 Sep 2022 13:58:31 +0000
Received: by outflank-mailman (input) for mailman id 396652;
 Thu, 01 Sep 2022 13:58:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oTkiE-0001Pd-UK
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 13:58:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTkiE-0004vJ-JT; Thu, 01 Sep 2022 13:58:30 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.12.167]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTkiE-0004NQ-DC; Thu, 01 Sep 2022 13:58:30 +0000
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
	bh=Ykf3sbryLkFxHO/PnqXCNaoUDr3Li6kShYu7MCj51I0=; b=4cixfn14Qak0LdfC+M203swzqt
	loyt3kAGdvdg8ZyPWI/jkkZ1Hb0Jc2F35O2JDWDfKbbOtCiCKdSK1qGo+0My6B2j0t5r9MtVjCpDf
	gcu8MK7yoL1BDMlzvGCruRFpyBApXGkHLNTMKCA4UTPlo8Nh+2HgS+wvGgmGoueBf5Bg=;
Message-ID: <a261649f-7c8a-83ce-e3be-409de315133c@xen.org>
Date: Thu, 1 Sep 2022 14:58:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Henry Wang <Henry.Wang@arm.com>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-3-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2208291755450.1134492@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2208291755450.1134492@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/08/2022 02:04, Stefano Stabellini wrote:
>>   size_t estimate_efi_size(unsigned int mem_nr_banks);
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index 500307edc0..fe76cf6325 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -73,6 +73,8 @@ integer_param("xenheap_megabytes", opt_xenheap_megabytes);
>>   
>>   domid_t __read_mostly max_init_domid;
>>   
>> +bool __read_mostly reserved_heap;
>> +
>>   static __used void init_done(void)
>>   {
>>       /* Must be done past setting system_state. */
>> @@ -699,8 +701,10 @@ static void __init populate_boot_allocator(void)
>>   #ifdef CONFIG_ARM_32
>>   static void __init setup_mm(void)
>>   {
>> -    paddr_t ram_start, ram_end, ram_size, e;
>> -    unsigned long ram_pages;
>> +    paddr_t ram_start, ram_end, ram_size, e, bank_start, bank_end, bank_size;
>> +    paddr_t reserved_heap_start = ~0, reserved_heap_end = 0,
> 
> INVALID_PADDR or ~0ULL

I would strongly prefer the former. It is more difficult to understand 
what's the value means in the latter.

Cheers,

-- 
Julien Grall

