Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAED1577F96
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 12:25:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369517.600964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDNw0-00031j-KB; Mon, 18 Jul 2022 10:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369517.600964; Mon, 18 Jul 2022 10:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDNw0-0002zN-GD; Mon, 18 Jul 2022 10:25:04 +0000
Received: by outflank-mailman (input) for mailman id 369517;
 Mon, 18 Jul 2022 10:25:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oDNvz-0002zH-7e
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 10:25:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oDNvw-00040O-4G; Mon, 18 Jul 2022 10:25:00 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=[10.7.237.21])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oDNvv-00013F-Td; Mon, 18 Jul 2022 10:25:00 +0000
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
	bh=RfLkMiU8Rc3aS7KcPMgPRlsIWsww1erp3QPFr18f9WY=; b=gucXQqQC1e7viY65H94J1K7UDj
	xzDcTkEf+WJgpaZgk6XdvOy5gwXwhaSPfHs0TtbFSsIus5T0c3YizYKEEh/nWx2HPpEU64oz/c3HK
	RGAx+BfpzqPHGytabbJ7i+JYhPkgh4hNvduj199CYhzgb+TFpGAI2JX83r87P2H0u8UQ=;
Message-ID: <b8b84df4-4101-a78f-1cf1-1662500ee2c0@xen.org>
Date: Mon, 18 Jul 2022 11:24:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/3] xen/heap: pass order to free_heap_pages() in heap
 init
To: Jan Beulich <jbeulich@suse.com>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20220715170312.13931-1-julien@xen.org>
 <20220715170312.13931-4-julien@xen.org>
 <0242a659-fcf9-74cc-102c-df775123b7ac@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0242a659-fcf9-74cc-102c-df775123b7ac@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 18/07/2022 10:43, Jan Beulich wrote:
> On 15.07.2022 19:03, Julien Grall wrote:
>> @@ -1806,8 +1806,22 @@ static void _init_heap_pages(const struct page_info *pg,
>>   
>>       while ( s < e )
>>       {
>> -        free_heap_pages(mfn_to_page(_mfn(s)), 0, need_scrub);
>> -        s += 1UL;
>> +        /*
>> +         * For s == 0, we simply use the largest increment by checking the
>> +         * MSB of the region size. For s != 0, we also need to ensure that the
>> +         * chunk is properly sized to end at power-of-two alignment. We do this
>> +         * by checking the LSB of the start address and use its index as
>> +         * the increment. Both cases need to be guarded by MAX_ORDER.
> 
> s/guarded/bounded/ ?
> 
>> +         * Note that the value of ffsl() and flsl() starts from 1 so we need
>> +         * to decrement it by 1.
>> +         */
>> +        int inc_order = min(MAX_ORDER, flsl(e - s) - 1);
> 
> unsigned int, since ...

MAX_ORDER, flsl(), ffsl() are both returning signed value. So inc_order 
should be 'int' to avoid any compilation issue.

> 
>> +        if ( s )
>> +            inc_order = min(inc_order, ffsl(s) - 1);
>> +        free_heap_pages(mfn_to_page(_mfn(s)), inc_order, need_scrub);
> 
> ... that's what the function parameter says, and the value also can go
> negative?

AFAICT, none of the values are negative. But per above, if we use min() 
then the local variable should be 'int'. The two possible alternatives are:
   1) Use min_t()
   2) Update MAX_ORDER, flsl(), ffsl() to return an unsigned value

The ideal would be #2 but it will require at least an extra patch and 
effort. If we use #1, then they use may become stale if we implement #2.

So I would prefer to keep min(). That said, I would be open to use 
min_t() if you strongly prefer it.

> Preferably with these adjustments
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks!

Cheers,

-- 
Julien Grall

