Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C88898C305F
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2024 11:34:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720267.1123369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5j6i-0006Pg-To; Sat, 11 May 2024 09:33:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720267.1123369; Sat, 11 May 2024 09:33:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5j6i-0006O9-QY; Sat, 11 May 2024 09:33:32 +0000
Received: by outflank-mailman (input) for mailman id 720267;
 Sat, 11 May 2024 09:33:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s5j6h-0006O3-Gj
 for xen-devel@lists.xenproject.org; Sat, 11 May 2024 09:33:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s5j6g-0004vM-TR; Sat, 11 May 2024 09:33:30 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s5j6g-00086J-L3; Sat, 11 May 2024 09:33:30 +0000
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
	bh=6hULbS/6eE4qhzO2a1XGxmjFpDfPiPHz9CqnqPs+1Lw=; b=mG9hbwje9rxKrj65nNUXBMeIQR
	nwNcJfYQQa+yyztjubkTHvH2yF0Wk7g0NBK4lJakJyZ8obIHaEhgAAYFllLJFDEaPXaCqyPkKi8nk
	SoKKk+m58Ed2+IpnJ0rZlk08vK8O1JAIn1/s0IZWsMAfSSooBm/siSmPmqn3O4VNoqXU=;
Message-ID: <b3a62eb5-d39c-4799-a3c7-707991fc8200@xen.org>
Date: Sat, 11 May 2024 10:33:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/arm: Alloc hypervisor reserved pages as magic
 pages for Dom0less DomUs
Content-Language: en-GB
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alec Kwapis <alec.kwapis@medtronic.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20240511005611.83125-1-xin.wang2@amd.com>
 <20240511005611.83125-2-xin.wang2@amd.com>
 <37ee9f1f-0d62-4d88-9507-2906c3149bba@xen.org>
 <448a31b5-db24-4dbb-a159-624676466536@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <448a31b5-db24-4dbb-a159-624676466536@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Henry,

On 11/05/2024 10:02, Henry Wang wrote:
>>> +
>>> +    rc = guest_physmap_add_pages(d, gfn, mfn, NR_MAGIC_PAGES);
>>> +    if ( rc )
>>> +    {
>>> +        free_domheap_pages(magic_pg, 
>>> get_order_from_pages(NR_MAGIC_PAGES));
>>> +        return rc;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   static int __init construct_domU(struct domain *d,
>>>                                    const struct dt_device_node *node)
>>>   {
>>> @@ -840,6 +868,10 @@ static int __init construct_domU(struct domain *d,
>>>           if ( rc < 0 )
>>>               return rc;
>>>           d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
>>> +
>>> +        rc = alloc_magic_pages(d);
>>> +        if ( rc < 0 )
>>> +            return rc;
>>
>> This will only be allocated xenstore is enabled. But I don't think 
>> some of the magic pages really require xenstore to work. In the future 
>> we may need some more fine graine choice (see my comment in patch #2 
>> as well).
> 
> Sorry, but it seems that by the time that I am writing this reply, I 
> didn't get the email for patch #2 comment. I will reply both together 
> when I see it.

That was expected, I knew what I wanted to mention about patch #2 but 
the e-mail was not fully written. You should have it in your inbox now.

> 
>>>       }
>>>         return rc;
>>> diff --git a/xen/include/public/arch-arm.h 
>>> b/xen/include/public/arch-arm.h
>>> index 289af81bd6..186520d01f 100644
>>> --- a/xen/include/public/arch-arm.h
>>> +++ b/xen/include/public/arch-arm.h
>>> @@ -476,6 +476,12 @@ typedef uint64_t xen_callback_t;
>>>   #define GUEST_MAGIC_BASE  xen_mk_ullong(0x39000000)
>>>   #define GUEST_MAGIC_SIZE  xen_mk_ullong(0x01000000)
>>>   +#define NR_MAGIC_PAGES 4
>> This name and the other below are far too generic to be part of the 
>> shared header. For NR_MAGIC_PAGES, can you explain why 
>> GUEST_MAGIC_SIZE cannot be used? Is it because it is "too" big?
> 
> Yes, I don't really want to allocate whole 16MB when we merely need 4 
> pages.
What about updating GUEST_MAGIC_SIZE to 0x4000? It doesn't make any 
sense to have two define which have pretty much the same meaning.

Then on the toolstack side, you can check that NR_MAGIC_PAGES is smaller 
or equal to GUEST_MAGIC_SIZE.

> 
>> For the rest below...
>>
>>> +#define CONSOLE_PFN_OFFSET 0
>>> +#define XENSTORE_PFN_OFFSET 1
>>> +#define MEMACCESS_PFN_OFFSET 2
>>> +#define VUART_PFN_OFFSET 3
>>
>> ... the order we allocate the magic pages is purely an internal 
>> decision of the toolstack. For the rest of the system, they need to 
>> access HVM_PARAM_*. So it doesn't feel like they should be part of the 
>> shared headers.
>>
>> If there is a strong reason to include them, then I think they all 
>> should be prefixed with GUEST_MAGIC_*.
> 
> One of the benefits as Michal pointed out in comments for v1 [1] would 
> be this would also allow init-dom0less.h not to re-define 
> XENSTORE_PFN_OFFSET.

At the moment, yes they have the same values. But with series, 
XENSTORE_PFN_OFFSET should technically be 0 in init-dom0less.

This is because Xen may only allocate one page (you don't need 4) for 
the reserved area. So...

> I will rename them as suggested if both of you are 
> ok with moving them to the arch header.


... I don't think they should be shared.

Cheers,

-- 
Julien Grall

