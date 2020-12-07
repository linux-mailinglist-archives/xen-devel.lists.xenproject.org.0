Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA0D2D149F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 16:28:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46714.82810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIQk-0002OW-9K; Mon, 07 Dec 2020 15:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46714.82810; Mon, 07 Dec 2020 15:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIQk-0002O7-6H; Mon, 07 Dec 2020 15:28:02 +0000
Received: by outflank-mailman (input) for mailman id 46714;
 Mon, 07 Dec 2020 15:28:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=exIY=FL=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kmIQi-0002O2-7R
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 15:28:00 +0000
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34d11b94-77f7-4928-bfeb-5ed64f8d9eaf;
 Mon, 07 Dec 2020 15:27:58 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id z21so18633570lfe.12
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 07:27:58 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id g6sm2842794lfb.291.2020.12.07.07.27.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 07:27:56 -0800 (PST)
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
X-Inumbo-ID: 34d11b94-77f7-4928-bfeb-5ed64f8d9eaf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=VuZVxmAH9LGv61YV1IiPgab8KuYu84A8RgRMWmUMgpE=;
        b=Xpm7u3McNUiOO0/B78RfoNPIUR6LHeyv/KlTK6C4GpikJCo1Rh0Muyz6e8KEuKE4hw
         lp336CZK8fJqwKDAWae+Ts2AWXZlK6dm3IQmLvrt/BTuMO9Z8RUkINWZufw8hSccRVT0
         LBUhR0bJ6cSiz6K7ErNP53PtvLscYBF6UarwlRgFAzWAQlAnFUbeQveUYp8Mwq7ZD/kc
         3Ru8enh04av/ZmUo4zrGtXrQYigE84yszYFsqJ68joZ9Tocbg0XtQbOkHpeVCSNfP7j4
         nTrOXoSqrT6GJ0BU2GGf/OZ9VcdQ0gfCtJl63EYbW7vlbr4WXYHzs5siRktJsmeYryAb
         wHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=VuZVxmAH9LGv61YV1IiPgab8KuYu84A8RgRMWmUMgpE=;
        b=bkqDYAjbPBE92spiwiTkmPtsMho7WMCAjCWPEcNsXlenFkjiT+jdDpta21yPQBUlXE
         3UHgXv0cdxVJMuye8UKehNz73GNd649FSv5DpvTP5y7L6pT6fIgoyzinWsOQ5/qyB2ZT
         LaYczsF/TBb3/pcN92x5yjxfGrQgiBsI3vKf3VMgoz3nrTJ6XaeBrVmUgBKLhq5fDjPB
         L7RBj64x1jLTcr5ZjnL2DdXjdGQNFgLPiRMgAMpUdpfOgNTsU/ngF+RCuv14ziQ4RmGv
         F4lMPN06h5EGzf1RpLXOHAHFpqiwRpbRgolY6Tk32SWD/RzW11ljTu1ggWTbHrGDOdPy
         nTvw==
X-Gm-Message-State: AOAM531+37tcXKPbFgSwpwVqAMF5p0XFgUFAAJXyhDQ6xH0VJkEu+Gfd
	CBAL92sPqgivTkA2PRKvF0u0nNv9Zn2PdA==
X-Google-Smtp-Source: ABdhPJzv4QWMcyfgnwFRy1d1sTHxRRF5l+Qn/xXT0m+v8BNcAKUamC1hoa7/5b8p1cXi4h9t88dRNQ==
X-Received: by 2002:a19:4a10:: with SMTP id x16mr2776301lfa.150.1607354877396;
        Mon, 07 Dec 2020 07:27:57 -0800 (PST)
Subject: Re: [PATCH V3 01/23] x86/ioreq: Prepare IOREQ feature for making it
 common
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-2-git-send-email-olekstysh@gmail.com>
 <51a5c06f-e6ce-c651-2fd2-352aaa591fb1@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <029c3dcc-fac2-5b65-703e-5d821335f2a0@gmail.com>
Date: Mon, 7 Dec 2020 17:27:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <51a5c06f-e6ce-c651-2fd2-352aaa591fb1@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 07.12.20 13:13, Jan Beulich wrote:

Hi Jan

> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
>> --- a/xen/arch/x86/hvm/ioreq.c
>> +++ b/xen/arch/x86/hvm/ioreq.c
>> @@ -17,15 +17,15 @@
>>    */
>>   
>>   #include <xen/ctype.h>
>> +#include <xen/domain.h>
>> +#include <xen/event.h>
>>   #include <xen/init.h>
>> +#include <xen/irq.h>
>>   #include <xen/lib.h>
>> -#include <xen/trace.h>
>> +#include <xen/paging.h>
>>   #include <xen/sched.h>
>> -#include <xen/irq.h>
>>   #include <xen/softirq.h>
>> -#include <xen/domain.h>
>> -#include <xen/event.h>
>> -#include <xen/paging.h>
>> +#include <xen/trace.h>
>>   #include <xen/vpci.h>
> Seeing this consolidation (thanks!), have you been able to figure
> out what xen/ctype.h is needed for here? It looks to me as if it
> could be dropped at the same time.

Not yet, but will re-check.


>
>> @@ -601,7 +610,7 @@ static int hvm_ioreq_server_map_pages(struct hvm_ioreq_server *s)
>>       return rc;
>>   }
>>   
>> -static void hvm_ioreq_server_unmap_pages(struct hvm_ioreq_server *s)
>> +void arch_ioreq_server_unmap_pages(struct hvm_ioreq_server *s)
>>   {
>>       hvm_unmap_ioreq_gfn(s, true);
>>       hvm_unmap_ioreq_gfn(s, false);
> How is this now different from ...
>
>> @@ -674,6 +683,12 @@ static int hvm_ioreq_server_alloc_rangesets(struct hvm_ioreq_server *s,
>>       return rc;
>>   }
>>   
>> +void arch_ioreq_server_enable(struct hvm_ioreq_server *s)
>> +{
>> +    hvm_remove_ioreq_gfn(s, false);
>> +    hvm_remove_ioreq_gfn(s, true);
>> +}
> ... this? Imo if at all possible there should be no such duplication
> (i.e. at least have this one simply call the earlier one).

I am afraid, I don't see any duplication between mentioned functions. 
Would you mind explaining?


>
>> @@ -1080,6 +1105,24 @@ int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
>>       return rc;
>>   }
>>   
>> +/* Called with ioreq_server lock held */
>> +int arch_ioreq_server_map_mem_type(struct domain *d,
>> +                                   struct hvm_ioreq_server *s,
>> +                                   uint32_t flags)
>> +{
>> +    int rc = p2m_set_ioreq_server(d, flags, s);
>> +
>> +    if ( rc == 0 && flags == 0 )
>> +    {
>> +        const struct p2m_domain *p2m = p2m_get_hostp2m(d);
>> +
>> +        if ( read_atomic(&p2m->ioreq.entry_count) )
>> +            p2m_change_entry_type_global(d, p2m_ioreq_server, p2m_ram_rw);
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>>   /*
>>    * Map or unmap an ioreq server to specific memory type. For now, only
>>    * HVMMEM_ioreq_server is supported, and in the future new types can be
>> @@ -1112,19 +1155,11 @@ int hvm_map_mem_type_to_ioreq_server(struct domain *d, ioservid_t id,
>>       if ( s->emulator != current->domain )
>>           goto out;
>>   
>> -    rc = p2m_set_ioreq_server(d, flags, s);
>> +    rc = arch_ioreq_server_map_mem_type(d, s, flags);
>>   
>>    out:
>>       spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
>>   
>> -    if ( rc == 0 && flags == 0 )
>> -    {
>> -        struct p2m_domain *p2m = p2m_get_hostp2m(d);
>> -
>> -        if ( read_atomic(&p2m->ioreq.entry_count) )
>> -            p2m_change_entry_type_global(d, p2m_ioreq_server, p2m_ram_rw);
>> -    }
>> -
>>       return rc;
>>   }
> While you mention this change in the description, I'm still
> missing justification as to why the change is safe to make. I
> continue to think p2m_change_entry_type_global() would better
> not be called inside the locked region, if at all possible.
Well. I am afraid, I don't have a 100% justification why the change is 
safe to make as well
as I don't see an obvious reason why it is not safe to make (at least I 
didn't find a possible deadlock scenario while investigating the code).
I raised a question earlier whether I can fold this check in, which 
implied calling p2m_change_entry_type_global() with ioreq_server lock held.


If there is a concern with calling this inside the locked region 
(unfortunately still unclear for me at the moment), I will try to find 
another way how to split hvm_map_mem_type_to_ioreq_server() without
potentially unsafe change here *and* exposing 
p2m_change_entry_type_global() to the common code. Right now, I don't 
have any ideas how this could be split other than
introducing one more hook here to deal with p2m_change_entry_type_global 
(probably arch_ioreq_server_map_mem_type_complete?), but I don't expect 
it to be accepted.
I appreciate any ideas on that.
>
>> @@ -1239,33 +1279,28 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
>>       spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
>>   }
>>   
>> -struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
>> -                                                 ioreq_t *p)
>> +int arch_ioreq_server_get_type_addr(const struct domain *d,
>> +                                    const ioreq_t *p,
>> +                                    uint8_t *type,
>> +                                    uint64_t *addr)
>>   {
>> -    struct hvm_ioreq_server *s;
>> -    uint32_t cf8;
>> -    uint8_t type;
>> -    uint64_t addr;
>> -    unsigned int id;
>> +    unsigned int cf8 = d->arch.hvm.pci_cf8;
>>   
>>       if ( p->type != IOREQ_TYPE_COPY && p->type != IOREQ_TYPE_PIO )
>> -        return NULL;
>> -
>> -    cf8 = d->arch.hvm.pci_cf8;
>> +        return -EINVAL;
> The caller cares about only a boolean. Either make the function
> return bool, or (imo better, but others may like this less) have
> it return "type" instead of using indirection, using e.g.
> negative values to identify errors (which then could still be
> errno ones if you wish).

Makes sense. I will probably make the function return bool. Even if 
return "type" we will still have an indirection for "addr".


>
>> --- a/xen/include/asm-x86/hvm/ioreq.h
>> +++ b/xen/include/asm-x86/hvm/ioreq.h
>> @@ -19,6 +19,25 @@
>>   #ifndef __ASM_X86_HVM_IOREQ_H__
>>   #define __ASM_X86_HVM_IOREQ_H__
>>   
>> +#define HANDLE_BUFIOREQ(s) \
>> +    ((s)->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF)
>> +
>> +bool arch_vcpu_ioreq_completion(enum hvm_io_completion io_completion);
>> +int arch_ioreq_server_map_pages(struct hvm_ioreq_server *s);
>> +void arch_ioreq_server_unmap_pages(struct hvm_ioreq_server *s);
>> +void arch_ioreq_server_enable(struct hvm_ioreq_server *s);
>> +void arch_ioreq_server_disable(struct hvm_ioreq_server *s);
>> +void arch_ioreq_server_destroy(struct hvm_ioreq_server *s);
>> +int arch_ioreq_server_map_mem_type(struct domain *d,
>> +                                   struct hvm_ioreq_server *s,
>> +                                   uint32_t flags);
>> +bool arch_ioreq_server_destroy_all(struct domain *d);
>> +int arch_ioreq_server_get_type_addr(const struct domain *d,
>> +                                    const ioreq_t *p,
>> +                                    uint8_t *type,
>> +                                    uint64_t *addr);
>> +void arch_ioreq_domain_init(struct domain *d);
>> +
>>   bool hvm_io_pending(struct vcpu *v);
>>   bool handle_hvm_io_completion(struct vcpu *v);
>>   bool is_ioreq_server_page(struct domain *d, const struct page_info *page);
> What's the plan here? Introduce them into the x86 header just
> to later move the entire block into the common one? Wouldn't
> it make sense to introduce the common header here right away?
> Or do you expect to convert some of the simpler ones to inline
> functions later on?
The former. The subsequent patch is moving the the entire block(s) from 
here and from x86/hvm/ioreq.c to the common code in one go.
I thought it was a little bit odd to expose a header before exposing an 
implementation to the common code. Another reason is to minimize places 
that need touching by current patch.
After all, this is done within single series and without breakage in 
between. But, if introducing the common header right away will make 
patch more cleaner and correct I am absolutely OK and happy to update a 
patch. Shall I?


-- 
Regards,

Oleksandr Tyshchenko


