Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 477412CAB16
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 19:54:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42287.76016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkAm6-00056P-2a; Tue, 01 Dec 2020 18:53:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42287.76016; Tue, 01 Dec 2020 18:53:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkAm5-000560-VI; Tue, 01 Dec 2020 18:53:17 +0000
Received: by outflank-mailman (input) for mailman id 42287;
 Tue, 01 Dec 2020 18:53:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lvrb=FF=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kkAm4-00055v-Jr
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 18:53:16 +0000
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e03f970b-01d7-4e20-b29b-614d5403cdf2;
 Tue, 01 Dec 2020 18:53:15 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k14so4337453wrn.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Dec 2020 10:53:15 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id n4sm1049687wmc.30.2020.12.01.10.53.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 10:53:14 -0800 (PST)
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
X-Inumbo-ID: e03f970b-01d7-4e20-b29b-614d5403cdf2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=j4ldwK3OA/QH4qbINrvM8NZOooiQJgxxFypacLUiVqc=;
        b=Y5NHW2ZcZkuVLi6t5TbbaLuIQsqB5J9fHLp7B4ueojSreNE/f4hrMB8T7jQ/Femqzl
         vvITaEH5mdSNrXhMHmlofC5B7kRgcLeUEs4RpcpWiYPhYjOfP+Ycl31sA7ie7wA5Zwwc
         fpTgw6bpbI87wIbmmqOEzMP6i85D4sNU42gUAKrRqqpueCIaVPlDZmrpDrlldhnU7glf
         CtsJm6la9hS5243s7jLzng8Y0sxN+Jol1i8LBwfNiRKNKxm5+25hfcnFL8PKjAWbD8Bp
         x12pnFhQCfqYeed+O/FsGnMY0h77CfF3JO8FLnRYlJ/rjLJ1zI3fCc0soxVGjmICpsqR
         bTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=j4ldwK3OA/QH4qbINrvM8NZOooiQJgxxFypacLUiVqc=;
        b=MEX0XlE4onQLJwjejbtHw4/ExS6zDxRmVFEb4bH5lFz9JcjdUU1C5kTuXN8abWnA2K
         0ZDac/1Odt1K4WWtlhlpTb1FeolK9Fc9i8vI7ytikqknehGfOHXdAzynp8CN+P77Kd8k
         0v2Y0cRYMinr8aHAkX8MjOaNuLAR4AzroTOslzQnNi3isbSdLUuUtYE1I/7q+V8NyMGE
         pfPOV2XbHObybH2lGWYuasvXo4x9uRkdGP1hDL7stYdRUICMgkfds2QQjSK3orztZzEU
         l+1eBX+6RuSj3pJRJH9TCfOTrkIg4SogMjWYOmufRNCLoC8oxkvNSbccfuZ+G5/cPIXi
         EKbQ==
X-Gm-Message-State: AOAM530Gvt12oC+PU63NI1ewfKUIdcCtq65dtrPit4xT1FWCmvzrMhzo
	XJ73fg3Z9HmV2ej/3jZweG9SOVQvIJkvSA==
X-Google-Smtp-Source: ABdhPJy57cIS+Ur+LvNK2SJRThcmB7ubIYdAGEVkXPhUbo3C5hs+A+tmUXI8b8KVGoOgHVMmwbvZFQ==
X-Received: by 2002:adf:9d49:: with SMTP id o9mr5804255wre.413.1606848794557;
        Tue, 01 Dec 2020 10:53:14 -0800 (PST)
Subject: Re: [PATCH V3 01/23] x86/ioreq: Prepare IOREQ feature for making it
 common
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-2-git-send-email-olekstysh@gmail.com>
 <87eek9u6tj.fsf@linaro.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <cd2e064e-896b-3a28-5d37-93ddaba1c13e@gmail.com>
Date: Tue, 1 Dec 2020 20:53:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87eek9u6tj.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 01.12.20 13:03, Alex Bennée wrote:

Hi Alex

> Oleksandr Tyshchenko <olekstysh@gmail.com> writes:
>
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> As a lot of x86 code can be re-used on Arm later on, this
>> patch makes some preparation to x86/hvm/ioreq.c before moving
>> to the common code. This way we will get a verbatim copy
> <snip>
>> It worth mentioning that a code which checks the return value of
>> p2m_set_ioreq_server() in hvm_map_mem_type_to_ioreq_server() was
>> folded into arch_ioreq_server_map_mem_type() for the clear split.
>> So the p2m_change_entry_type_global() is called with ioreq_server
>> lock held.
> <snip>
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
> It should be noted that p2m holds it's own lock but I'm unfamiliar with
> Xen's locking architecture. Is there anything that prevents another vCPU
> accessing a page that is also being used my ioreq on the first vCPU?
I am not sure that I would be able to provide reasonable explanations here.
All what I understand is that p2m_change_entry_type_global() x86 
specific (we don't have p2m_ioreq_server concept on Arm) and should 
remain as such (not exposed to the common code).
IIRC, I raised a question during V2 review whether we could have ioreq 
server lock around the call to p2m_change_entry_type_global() and didn't 
get objections. I may mistake, but looks like the lock being used
in p2m_change_entry_type_global() is yet another lock for protecting 
page table operations, so unlikely we could get into the trouble calling 
this function with the ioreq server lock held.


>
> Assuming that deadlock isn't a possibility to my relatively untrained
> eye this looks good to me:
>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Thank you.


-- 
Regards,

Oleksandr Tyshchenko


