Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D05C2F8CB8
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jan 2021 10:49:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68948.123564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0iCD-0000lq-5t; Sat, 16 Jan 2021 09:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68948.123564; Sat, 16 Jan 2021 09:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0iCD-0000lR-2W; Sat, 16 Jan 2021 09:48:37 +0000
Received: by outflank-mailman (input) for mailman id 68948;
 Sat, 16 Jan 2021 09:48:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WXL7=GT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l0iCB-0000lM-D0
 for xen-devel@lists.xenproject.org; Sat, 16 Jan 2021 09:48:35 +0000
Received: from mail-lj1-x22a.google.com (unknown [2a00:1450:4864:20::22a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b31e630-42c3-4861-b742-e532f073c066;
 Sat, 16 Jan 2021 09:48:34 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id f11so13012231ljm.8
 for <xen-devel@lists.xenproject.org>; Sat, 16 Jan 2021 01:48:33 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z14sm1238902lfq.130.2021.01.16.01.48.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Jan 2021 01:48:32 -0800 (PST)
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
X-Inumbo-ID: 6b31e630-42c3-4861-b742-e532f073c066
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=8pm1zweVQPHj4vsRGXWgdWxaTp6lFWaM0ASv8X0dJYQ=;
        b=kcDx92sACcWDOFlvHArCcz/rdtwfa7ZhXjHabskgAL8P+tQr6/Tk8ScxWoSUjyBHpN
         zTT+TUB0MtCbbpC73KfaHicLvAOnz/if0M40OwE5iIu7zj5t43n64cDavsjN0jo6Dq83
         MUk0Yz/hTCqMHpe8mFaJe2co5u+ypOjXm8ukqA53wPHQ8tWNcRNPIUX+nV466gbW5yFA
         q1DZdqLWeUIlcWiehFPSCU8Rbjk+7up89jjDePen2IEXlU1nYAIDC2SR5xwdIw45iFG9
         6uKmuqzKyInXqO+GWHftclwnw3tZ9ckvAzTD2/as54vXGp+X5oEAudWAG82a4u3IFMsy
         rZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=8pm1zweVQPHj4vsRGXWgdWxaTp6lFWaM0ASv8X0dJYQ=;
        b=c224mloBNCvunF//4MlClJvmBsYk/SS4Y+9dQAmFemv1CF06cyVhroQTAnf4pYLZlY
         2pX08T4az4UHD8rgutaHvU0JNOYnxdyF8w2PLG00ta49Peq6f2uhDlqU0Ksro8HMbOx1
         Wm2RPVjjdX+qc8TnHOFUHpQhHUKDekivJNAq5GxvCVEpLp9LZx28jVQVTV4ijG7z8EHI
         eKDMTiPett74I+yQxE1lRNeeXuhHydT49xEs1nyxu8vg6cK8EOnAN+iEBcwyUmNq/RvW
         kovTgYUmbj6eNDrgMZORD7EVJ7q6ohxplC3EpYGac/qrPkgQQUlhubvsUzGKFVQ11WZC
         kRoA==
X-Gm-Message-State: AOAM5319CzG/tg2rKaHQoL1Z2BJzqbay97ZcTahvQFsUEGrMQLWH5A34
	OpspwC/1KPtOKfNynnzzPmvHf3Rm+V5Crw==
X-Google-Smtp-Source: ABdhPJxPcEvjyDnzuAue65cezaJYrpiMmxlayj/pL4SmOhFnz5qmiQ7Y6O1QpkXBetXZ/yzsix9PAw==
X-Received: by 2002:a2e:9a84:: with SMTP id p4mr6544405lji.160.1610790512626;
        Sat, 16 Jan 2021 01:48:32 -0800 (PST)
Subject: Re: [PATCH V4 01/24] x86/ioreq: Prepare IOREQ feature for making it
 common
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-2-git-send-email-olekstysh@gmail.com>
 <b37398f6-7242-49b5-bdba-a247af1f2351@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <e900fd0c-8216-d1de-9b5a-cd88674c25c5@gmail.com>
Date: Sat, 16 Jan 2021 11:48:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b37398f6-7242-49b5-bdba-a247af1f2351@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 15.01.21 18:41, Jan Beulich wrote:

Hi Jan

> On 12.01.2021 22:52, Oleksandr Tyshchenko wrote:
>> @@ -1080,6 +1104,27 @@ int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
>>       return rc;
>>   }
>>   
>> +/* Called with ioreq_server lock held */
>> +int arch_ioreq_server_map_mem_type(struct domain *d,
>> +                                   struct hvm_ioreq_server *s,
>> +                                   uint32_t flags)
>> +{
>> +    return p2m_set_ioreq_server(d, flags, s);
>> +}
>> +
>> +void arch_ioreq_server_map_mem_type_completed(struct domain *d,
>> +                                              struct hvm_ioreq_server *s,
>> +                                              uint32_t flags)
>> +{
>> +    if ( flags == 0 )
>> +    {
>> +        const struct p2m_domain *p2m = p2m_get_hostp2m(d);
>> +
>> +        if ( read_atomic(&p2m->ioreq.entry_count) )
>> +            p2m_change_entry_type_global(d, p2m_ioreq_server, p2m_ram_rw);
> If I was the maintainer of this code, I'd ask that such single
> use variables, unless needed to sensibly deal with line length
> restrictions, be removed.

ok, will remove. With that we could omit the braces and have a combined 
condition on a single line.


>
>> --- a/xen/include/asm-x86/hvm/ioreq.h
>> +++ b/xen/include/asm-x86/hvm/ioreq.h
>> @@ -19,6 +19,9 @@
>>   #ifndef __ASM_X86_HVM_IOREQ_H__
>>   #define __ASM_X86_HVM_IOREQ_H__
>>   
>> +#define HANDLE_BUFIOREQ(s) \
>> +    ((s)->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF)
>> +
>>   bool hvm_io_pending(struct vcpu *v);
>>   bool handle_hvm_io_completion(struct vcpu *v);
>>   bool is_ioreq_server_page(struct domain *d, const struct page_info *page);
>> @@ -55,6 +58,25 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered);
>>   
>>   void hvm_ioreq_init(struct domain *d);
>>   
>> +bool arch_vcpu_ioreq_completion(enum hvm_io_completion io_completion);
>> +int arch_ioreq_server_map_pages(struct hvm_ioreq_server *s);
>> +void arch_ioreq_server_unmap_pages(struct hvm_ioreq_server *s);
>> +void arch_ioreq_server_enable(struct hvm_ioreq_server *s);
>> +void arch_ioreq_server_disable(struct hvm_ioreq_server *s);
>> +void arch_ioreq_server_destroy(struct hvm_ioreq_server *s);
>> +int arch_ioreq_server_map_mem_type(struct domain *d,
>> +                                   struct hvm_ioreq_server *s,
>> +                                   uint32_t flags);
>> +void arch_ioreq_server_map_mem_type_completed(struct domain *d,
>> +                                              struct hvm_ioreq_server *s,
>> +                                              uint32_t flags);
>> +bool arch_ioreq_server_destroy_all(struct domain *d);
>> +bool arch_ioreq_server_get_type_addr(const struct domain *d,
>> +                                     const ioreq_t *p,
>> +                                     uint8_t *type,
>> +                                     uint64_t *addr);
>> +void arch_ioreq_domain_init(struct domain *d);
> As indicated before, I don't think these declarations should
> live here. Even if a later patch moves them I wouldn't see
> why they couldn't be put in their final resting place right
> away.

Well, will introduce common ioreq.h right away.


>
> Also where possible without violating line length restrictions
> please still try to put multiple parameters on a single line,
> as is done higher up in this file.

Got it.


>
> Jan

-- 
Regards,

Oleksandr Tyshchenko


