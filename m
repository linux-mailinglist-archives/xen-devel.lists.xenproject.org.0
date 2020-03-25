Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1EB19304A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 19:24:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHAf6-0004Uw-Fh; Wed, 25 Mar 2020 18:21:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pb40=5K=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jHAf4-0004Ur-Uk
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 18:21:54 +0000
X-Inumbo-ID: 80624012-6ec5-11ea-868c-12813bfff9fa
Received: from mail-ed1-f67.google.com (unknown [209.85.208.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80624012-6ec5-11ea-868c-12813bfff9fa;
 Wed, 25 Mar 2020 18:21:53 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id a20so3811906edj.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2020 11:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eRP8mQfcGUTV/lt/50s+KOPM0ydiIhI67+dA6r5e/3A=;
 b=hC/pv01PGdr3rWKnH4znFvWj/t5/IIFqg3iSZdeg9Ywh6i4lxAnT/g5plh5BgIUL6A
 2MFXXLB6BArNroro9HD1DGOPS0JnrLOvfqMhWuTPmyw7uxHSrxrLByGhTa0v/LkHuYhZ
 mW48rcV9+BN/srAGJKn3+aWW0LVoziCNVGXUWDGNUwrUfo4/EKTBdIPVBAUf1zvPRS0F
 m7fkKLnzPA/2iJ8+lo0EcYd0eT4ZkJYlJ1C3f8HYGDQ+rsu5VL1RKYCmPLmGXB3Oh+l8
 A3C+Yi96dnIken0jlJpODqGFW7agl6ujui2syun1ka7n+HsQEbzJ5cVEIIqiXJHJya+6
 Zutw==
X-Gm-Message-State: ANhLgQ18uZcRHlfdvW9ITVCMvcnFX+aUK0p4BnRVBrPrdBvfOEPruisT
 rPuYSDPeU/wWNudNJM2xZOs=
X-Google-Smtp-Source: ADFU+vuD8dILeMkfDl+on4/DHGHYqDeavs62lejDxWgPVlNSpRejpe7qtJ5sQJ7jj5OJsKRFO3JWQw==
X-Received: by 2002:a05:6402:4c7:: with SMTP id
 n7mr4218968edw.182.1585160512667; 
 Wed, 25 Mar 2020 11:21:52 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id e13sm1145714ejc.51.2020.03.25.11.21.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2020 11:21:51 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>
References: <20200322161418.31606-1-julien@xen.org>
 <20200322161418.31606-5-julien@xen.org>
 <ae87e95c-b897-4057-0400-944764734875@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <fe0e2e69-0e27-e4c9-a5c0-17dddcdee6e5@xen.org>
Date: Wed, 25 Mar 2020 18:21:50 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <ae87e95c-b897-4057-0400-944764734875@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH 04/17] xen: Convert virt_to_mfn() and
 mfn_to_virt() to use typesafe MFN
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 25/03/2020 15:27, Jan Beulich wrote:
> On 22.03.2020 17:14, julien@xen.org wrote:
>> @@ -785,21 +781,21 @@ bool is_iomem_page(mfn_t mfn)
>>       return (page_get_owner(page) == dom_io);
>>   }
>>   
>> -static int update_xen_mappings(unsigned long mfn, unsigned int cacheattr)
>> +static int update_xen_mappings(mfn_t mfn, unsigned int cacheattr)
>>   {
>>       int err = 0;
>> -    bool alias = mfn >= PFN_DOWN(xen_phys_start) &&
>> -         mfn < PFN_UP(xen_phys_start + xen_virt_end - XEN_VIRT_START);
>> +    bool alias = mfn_x(mfn) >= PFN_DOWN(xen_phys_start) &&
>> +         mfn_x(mfn) < PFN_UP(xen_phys_start + xen_virt_end - XEN_VIRT_START);
>>       unsigned long xen_va =
>> -        XEN_VIRT_START + ((mfn - PFN_DOWN(xen_phys_start)) << PAGE_SHIFT);
>> +        XEN_VIRT_START + mfn_to_maddr(mfn_add(mfn, -PFN_DOWN(xen_phys_start)));
> 
> Depending on the types involved (e.g. in PFN_DOWN()) this may
> or may not be safe, so I consider such a transformation at
> least fragile. I think we either want to gain mfn_sub() or
> keep this as a "real" subtraction.
I want to avoid mfn_x() as much as possible when everything can be done 
using typesafe operation. But i am not sure how mfn_sub() would solve 
the problem. Do you mind providing more information?

> 
>> @@ -584,21 +584,21 @@ static unsigned long init_node_heap(int node, unsigned long mfn,
>>           needed = 0;
>>       }
>>       else if ( *use_tail && nr >= needed &&
>> -              arch_mfn_in_directmap(mfn + nr) &&
>> +              arch_mfn_in_directmap(mfn_x(mfn_add(mfn, nr))) &&
>>                 (!xenheap_bits ||
>> -               !((mfn + nr - 1) >> (xenheap_bits - PAGE_SHIFT))) )
>> +               !((mfn_x(mfn) + nr - 1) >> (xenheap_bits - PAGE_SHIFT))) )
> 
> May I suggest consistency here: This one uses +, while ...
> 
>>       {
>> -        _heap[node] = mfn_to_virt(mfn + nr - needed);
>> -        avail[node] = mfn_to_virt(mfn + nr - 1) +
>> +        _heap[node] = mfn_to_virt(mfn_add(mfn, nr - needed));
>> +        avail[node] = mfn_to_virt(mfn_add(mfn, nr - 1)) +
>>                         PAGE_SIZE - sizeof(**avail) * NR_ZONES;
>>       }
>>       else if ( nr >= needed &&
>> -              arch_mfn_in_directmap(mfn + needed) &&
>> +              arch_mfn_in_directmap(mfn_x(mfn_add(mfn, needed))) &&
> 
> ... this one uses mfn_add() despite the mfn_x() around it, and ...

So the reason I used mfn_x(mfn_add(mfn, needed)) here is I plan to 
convert arch_mfn_in_directmap() to use typesafe soon. In the two others 
cases...

>>                 (!xenheap_bits ||
>> -               !((mfn + needed - 1) >> (xenheap_bits - PAGE_SHIFT))) )
>> +               !((mfn_x(mfn) + needed - 1) >> (xenheap_bits - PAGE_SHIFT))) )
> 
> ... here you use + again. My personal preference would be to avoid
> constructs like mfn_x(mfn_add()).

... I am still unsure how to avoid mfn_x(). Do you have any ideas?
> 
>> @@ -269,10 +270,10 @@ out_dealloc:
>>               continue;
>>           for ( i = 0; i < pages; i++ )
>>           {
>> -            uint32_t mfn = t_info_mfn_list[offset + i];
>> -            if ( !mfn )
>> +            mfn_t mfn = _mfn(t_info_mfn_list[offset + i]);
>> +            if ( mfn_eq(mfn, _mfn(0)) )
> 
> Please could you take the opportunity and add the missing blank line
> between these two?

Sure.

> 
>> --- a/xen/include/asm-x86/mm.h
>> +++ b/xen/include/asm-x86/mm.h
>> @@ -667,7 +667,7 @@ static inline bool arch_mfn_in_directmap(unsigned long mfn)
>>   {
>>       unsigned long eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);
>>   
>> -    return mfn <= (virt_to_mfn(eva - 1) + 1);
>> +    return mfn <= mfn_x(mfn_add(virt_to_mfn(eva - 1),  1));
> 
> Even if you wanted to stick to using mfn_add() here, there's one
> blank too many after the comma.

I will remove the extra blank. Regarding the construction, I have been 
wondering for a couple of years now whether we should introduce mfn_{lt, 
gt}. What do you think?


> 
> With these taken care of
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
Thank you for the review.

Cheers,

-- 
Julien Grall

