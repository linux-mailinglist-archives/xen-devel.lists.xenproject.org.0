Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB64307744
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 14:41:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77043.139331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l57Wn-0000j3-MU; Thu, 28 Jan 2021 13:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77043.139331; Thu, 28 Jan 2021 13:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l57Wn-0000i7-IL; Thu, 28 Jan 2021 13:40:05 +0000
Received: by outflank-mailman (input) for mailman id 77043;
 Thu, 28 Jan 2021 13:40:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tEu6=G7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l57Wm-0000WC-9F
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 13:40:04 +0000
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 385f7d50-513c-42a0-a8e7-ddc566b3c206;
 Thu, 28 Jan 2021 13:40:03 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id a12so7647892lfb.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 05:40:02 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id s8sm1219360ljm.71.2021.01.28.05.39.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 05:40:00 -0800 (PST)
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
X-Inumbo-ID: 385f7d50-513c-42a0-a8e7-ddc566b3c206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=jO2oa2sDtprHbBpa5+OiVzTimwGNWKLjoIoVGs9sSDw=;
        b=C0iABKUHQ1x+wJJqZ+rcczgNozCIQsU30fRTRxCNf8Pt802ukPWtdm3Gbof8OeT0nT
         OlIqoP1zDV8MOmFmSSE3vxBV+ttyxfw5M74488Lwq33wJKlKHrEZM4Ys9Ji6Lc6GMlkG
         4/b4VrX0XOXG9JNqM/mnOs3ofB6vNIFXQskXq2pgWHtqvxGqkyrDC/d+LabkMGPUfQB7
         UPKiIfThrZ/KByy6+EGn5ZAav9rzgJfcyQhPwIuvxH1uNPqZ5FOCBOQd7i0C9/lJ35+2
         MgC9JzdZmKhrYlpGc4erjNtD0eOcUlHSqaAL0KlC1jlDu16owH4doJ8wbnf8bgUXKfxy
         ZlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=jO2oa2sDtprHbBpa5+OiVzTimwGNWKLjoIoVGs9sSDw=;
        b=AH9nV2AF4ValUU7ylBc/B8Q+JsIpywyVHhtB6HQFnQMYfhoX/2dIe2pscbcsBrjGEb
         5x9+AKgaGEZTlLX6iXvf+n7VcHgqTAAy3U1L8DjljIzBHDBMHG0DFKT8D6HVQEaAmj/Y
         I66Et4K5vyvDnpXW/9OQzzdPRr4eDn88zKhK2XI9aE3jUfek0GqT5+AZnRDYtd8nNXO5
         5MktspJwtT9NBCY5EGYh9DhkiqRAphdTY5QMu6IEoUyzpKd/8DBiofqlezbGTAXO1JUU
         c370ItfUxm8CiBjEd/pLMDey01nZ2XxAUJQ3HgvPc+TzFR1ZKhhYQ1p97rGbyKjQb3ZX
         9RIw==
X-Gm-Message-State: AOAM530x+uFgzq7JHjOoSHBjT5j20XkNKPAa1jaZTvJOITSKcVGXWWwX
	qurpemc09leUKrm2vZk9O74=
X-Google-Smtp-Source: ABdhPJz+6wCoL/e5dwxB5VihtSAjFVSzLeZOVC/+twhF32FhQDSA3X3iU4m0h5O4bHEkc1EqawqXVg==
X-Received: by 2002:ac2:5582:: with SMTP id v2mr2715741lfg.564.1611841201753;
        Thu, 28 Jan 2021 05:40:01 -0800 (PST)
Subject: Re: [PATCH V5 14/22] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
From: Oleksandr <olekstysh@gmail.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-15-git-send-email-olekstysh@gmail.com>
 <67136393-8454-9d28-628a-bfb380fd8fc9@xen.org>
 <aa19b356-aa5b-2427-ab8d-2c1ade84ad1c@gmail.com>
 <a5fd81ac-3ed4-40e7-66d7-a8daf3be4987@xen.org>
 <078a6aa6-2f72-d816-9e14-8132648d3370@gmail.com>
Message-ID: <d0ff4658-30c2-ffed-3a9d-3dadd6195a61@gmail.com>
Date: Thu, 28 Jan 2021 15:39:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <078a6aa6-2f72-d816-9e14-8132648d3370@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 28.01.21 13:33, Oleksandr wrote:

Hi Julien

>
> On 28.01.21 11:40, Julien Grall wrote:
>
> Hi Julien
>
>> Hi Oleksandr,
>>
>> On 27/01/2021 19:20, Oleksandr wrote:
>>  >  >>> So I think we may be able to drop the include from 
>> asm/hvm/domain.h
>>> (this would avoid to include it everywhere...).
>>>
>>> I have tried that, but other CUs use definitions from 
>>> public/hvm/dm_op.h, for example:
>>>
>>> p2m-pt.c: In function 'p2m_type_to_flags':
>>> p2m-pt.c:87:33: error: 'XEN_DMOP_IOREQ_MEM_ACCESS_WRITE' undeclared 
>>> (first use in this function)
>>>           if ( p2m->ioreq.flags & XEN_DMOP_IOREQ_MEM_ACCESS_WRITE )
>>>                                   ^
>>> So, I would prefer to leave it as is, please let me know if you 
>>> think otherwise.
>>
>> AFAICT, there is only 2 places (p2m-pt.c and p2m-ept.c) that requires 
>> <public/hvm/dm_op.h> but doesn't directly include it. Folding the 
>> diff below in patch #4 should do the job:
>
> ok, will do


Just to clarify, you mentioned about patch #4, but shouldn't we make 
these changes in patch #9 which actually tries to sort dm related stuff?


>
>
>>
>> diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
>> index 975ab403f235..23d411f01d2f 100644
>> --- a/xen/arch/x86/mm/p2m-ept.c
>> +++ b/xen/arch/x86/mm/p2m-ept.c
>> @@ -17,6 +17,7 @@
>>
>>  #include <xen/domain_page.h>
>>  #include <xen/sched.h>
>> +#include <public/hvm/dm_op.h>
>>  #include <asm/altp2m.h>
>>  #include <asm/current.h>
>>  #include <asm/paging.h>
>> diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
>> index c43d5d0413a1..f2afcf49a368 100644
>> --- a/xen/arch/x86/mm/p2m-pt.c
>> +++ b/xen/arch/x86/mm/p2m-pt.c
>> @@ -27,6 +27,7 @@
>>  #include <xen/vm_event.h>
>>  #include <xen/event.h>
>>  #include <xen/trace.h>
>> +#include <public/hvm/dm_op.h>
>>  #include <public/vm_event.h>
>>  #include <asm/altp2m.h>
>>  #include <asm/domain.h>
>> diff --git a/xen/include/asm-x86/hvm/domain.h 
>> b/xen/include/asm-x86/hvm/domain.h
>> index 3b36c2f41fa1..f26c1a2e2d5f 100644
>> --- a/xen/include/asm-x86/hvm/domain.h
>> +++ b/xen/include/asm-x86/hvm/domain.h
>> @@ -28,8 +28,6 @@
>>  #include <asm/hvm/vmx/vmcs.h>
>>  #include <asm/hvm/svm/vmcb.h>
>>
>> -#include <public/hvm/dm_op.h>
>> -
>>  #ifdef CONFIG_MEM_SHARING
>>  struct mem_sharing_domain
>>  {
>>
>> You would then need to move the include of <public/hvm/dm_op.h> in 
>> <xen/dm.h> from this patch to patch #9.
>
> yes, sure
>
>
-- 
Regards,

Oleksandr Tyshchenko


