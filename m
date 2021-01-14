Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94ACC2F64A6
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:32:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67188.119688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04bM-00029Q-MZ; Thu, 14 Jan 2021 15:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67188.119688; Thu, 14 Jan 2021 15:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04bM-000293-JD; Thu, 14 Jan 2021 15:31:56 +0000
Received: by outflank-mailman (input) for mailman id 67188;
 Thu, 14 Jan 2021 15:31:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0pGa=GR=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l04bK-00028s-Is
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:31:54 +0000
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59da138c-ac48-4cda-96c2-2165bc619a26;
 Thu, 14 Jan 2021 15:31:52 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id k10so4890131wmi.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Jan 2021 07:31:52 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u6sm11858222wrm.90.2021.01.14.07.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 07:31:50 -0800 (PST)
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
X-Inumbo-ID: 59da138c-ac48-4cda-96c2-2165bc619a26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=l6orc9WlmC/X97KV3CNr/WZrr6fWzZskJ6OCz/ZKcn8=;
        b=ki8ClBddIwoAH0MeTYb1fWz0Gf6cJdlXfLPFFA14GYg2WctwFUMyBTKaXjpN63qVq8
         kwEYdbfqMs6DTu/Pq22aXHpWUbcTZtpjcWq411Oo36HiLlife4FHSEwTgIWxzyA7BCt0
         fFd3pUWQv1F40Zf0lwwPxZuwnv79JIocTHDakAyR3VS4baLR1ulmV5/LOtFmXc/lVruL
         4hdUC9D0eq075UIW05pYU8mjKYxpcPvKQhBkAcUcqyFCco7ADMZzowEG1bZ7EMtEN2iy
         9uZrTF3JrEvBj70Kp+b/yrCYDYD9GOjT/KIFXGGZGBZBcX78As1/LuSB6q3sdlRspeUo
         A2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=l6orc9WlmC/X97KV3CNr/WZrr6fWzZskJ6OCz/ZKcn8=;
        b=ikM7hIjdzawRH2fnJWfdnkHZ//IPx5BCugtk5cfQqcuUh92jy4UG/5ZajM/Le5YQIJ
         x/719GGklPxhET/64EzAkfJ6WKLB647C/B9a7+Aue2PQ95nkuQa6EnVt0Om2ABfnyHHA
         nS2Of51AL9Ckc0uAvPDzcIbPOOIfSJznbAlxVs/p5MjtpAOp3Rermc+1H0MChoITXcDy
         5r4DJgcTrfwV3g0yGttV0IGGoakfMMlkNvv6J1PrIjNFE5c3PW/aujLTmKSrhEUDJ49R
         rkC+sbyB/TgMpqux8Fm3mgs+AVRE6hVRw9jGpmDGGW2BRUFMT12yNf79yBfqluf2G3dn
         RLtg==
X-Gm-Message-State: AOAM533Br7rvlxnWqNHNDMJWi+DeG1PhryGPOISQt51PPVhVBhLf+/sY
	5+PYQ5eCV57CqTqErvJVupw=
X-Google-Smtp-Source: ABdhPJydA3r56FTNyLdUpw1Dj2cuk8iFEOKTUiz+yWBkT+Y5iBb3qReIM4UX6tDCrADxxUEL0saijQ==
X-Received: by 2002:a1c:398a:: with SMTP id g132mr2223279wma.38.1610638311306;
        Thu, 14 Jan 2021 07:31:51 -0800 (PST)
Subject: Re: [PATCH V4 11/24] xen/mm: Make x86's XENMEM_resource_ioreq_server
 handling common
To: Wei Chen <Wei.Chen@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <Julien.Grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-12-git-send-email-olekstysh@gmail.com>
 <AM0PR08MB3747ECA6E3CB200C0D606F809EA80@AM0PR08MB3747.eurprd08.prod.outlook.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <5f050e2c-d5c3-668a-8163-7829a6794a12@gmail.com>
Date: Thu, 14 Jan 2021 17:31:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AM0PR08MB3747ECA6E3CB200C0D606F809EA80@AM0PR08MB3747.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 14.01.21 05:58, Wei Chen wrote:
> Hi Oleksandr,

Hi Wei


>
>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
>> Oleksandr Tyshchenko
>> Sent: 2021年1月13日 5:52
>> To: xen-devel@lists.xenproject.org
>> Cc: Julien Grall <Julien.Grall@arm.com>; Jan Beulich <jbeulich@suse.com>;
>> Andrew Cooper <andrew.cooper3@citrix.com>; Roger Pau Monné
>> <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; George Dunlap
>> <george.dunlap@citrix.com>; Ian Jackson <iwj@xenproject.org>; Julien Grall
>> <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Volodymyr
>> Babchuk <Volodymyr_Babchuk@epam.com>; Oleksandr Tyshchenko
>> <oleksandr_tyshchenko@epam.com>
>> Subject: [PATCH V4 11/24] xen/mm: Make x86's
>> XENMEM_resource_ioreq_server handling common
>>
>> From: Julien Grall <julien.grall@arm.com>
>>
>> As x86 implementation of XENMEM_resource_ioreq_server can be
>> re-used on Arm later on, this patch makes it common and removes
>> arch_acquire_resource as unneeded.
>>
>> Also re-order #include-s alphabetically.
>>
>> This support is going to be used on Arm to be able run device
>> emulator outside of Xen hypervisor.
>>
>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> [On Arm only]
>> Tested-by: Wei Chen <Wei.Chen@arm.com>
>>
>> ---
>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>> "Add support for Guest IO forwarding to a device emulator"
>>
>> Changes RFC -> V1:
>>     - no changes
>>
>> Changes V1 -> V2:
>>     - update the author of a patch
>>
>> Changes V2 -> V3:
>>     - don't wrap #include <xen/ioreq.h>
>>     - limit the number of #ifdef-s
>>     - re-order #include-s alphabetically
>>
>> Changes V3 -> V4:
>>     - rebase
>>     - Add Jan's R-b
>> ---
>>   xen/arch/x86/mm.c        | 44 ---------------------------------
>>   xen/common/memory.c      | 63
>> +++++++++++++++++++++++++++++++++++++++---------
>>   xen/include/asm-arm/mm.h |  8 ------
>>   xen/include/asm-x86/mm.h |  4 ---
>>   4 files changed, 51 insertions(+), 68 deletions(-)
>>
>> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
>> index f6e128e..54ac398 100644
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -4587,50 +4587,6 @@ static int handle_iomem_range(unsigned long s,
>> unsigned long e, void *p)
>>       return err || s > e ? err : _handle_iomem_range(s, e, p);
>>   }
>>
>> -int arch_acquire_resource(struct domain *d, unsigned int type,
>> -                          unsigned int id, unsigned long frame,
>> -                          unsigned int nr_frames, xen_pfn_t mfn_list[])
>> -{
>> -    int rc;
>> -
>> -    switch ( type )
>> -    {
>> -#ifdef CONFIG_HVM
>> -    case XENMEM_resource_ioreq_server:
>> -    {
>> -        ioservid_t ioservid = id;
>> -        unsigned int i;
>> -
>> -        rc = -EINVAL;
>> -        if ( !is_hvm_domain(d) )
>> -            break;
>> -
>> -        if ( id != (unsigned int)ioservid )
>> -            break;
>> -
>> -        rc = 0;
>> -        for ( i = 0; i < nr_frames; i++ )
>> -        {
>> -            mfn_t mfn;
>> -
>> -            rc = hvm_get_ioreq_server_frame(d, id, frame + i, &mfn);
>> -            if ( rc )
>> -                break;
>> -
>> -            mfn_list[i] = mfn_x(mfn);
>> -        }
>> -        break;
>> -    }
>> -#endif
>> -
>> -    default:
>> -        rc = -EOPNOTSUPP;
>> -        break;
>> -    }
>> -
>> -    return rc;
>> -}
>> -
>>   long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void)
>> arg)
>>   {
>>       int rc;
>> diff --git a/xen/common/memory.c b/xen/common/memory.c
>> index b21b6c4..7e560b5 100644
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -8,22 +8,23 @@
>>    */
>>
>>   #include <xen/domain_page.h>
>> -#include <xen/types.h>
>> +#include <xen/errno.h>
>> +#include <xen/event.h>
>> +#include <xen/grant_table.h>
>> +#include <xen/guest_access.h>
>> +#include <xen/hypercall.h>
>> +#include <xen/iocap.h>
>> +#include <xen/ioreq.h>
>>   #include <xen/lib.h>
>> +#include <xen/mem_access.h>
>>   #include <xen/mm.h>
>> +#include <xen/numa.h>
>> +#include <xen/paging.h>
>>   #include <xen/param.h>
>>   #include <xen/perfc.h>
>>   #include <xen/sched.h>
>> -#include <xen/event.h>
>> -#include <xen/paging.h>
>> -#include <xen/iocap.h>
>> -#include <xen/guest_access.h>
>> -#include <xen/hypercall.h>
>> -#include <xen/errno.h>
>> -#include <xen/numa.h>
>> -#include <xen/mem_access.h>
>>   #include <xen/trace.h>
>> -#include <xen/grant_table.h>
>> +#include <xen/types.h>
>>   #include <asm/current.h>
>>   #include <asm/hardirq.h>
>>   #include <asm/p2m.h>
>> @@ -1090,6 +1091,40 @@ static int acquire_grant_table(struct domain *d,
>> unsigned int id,
>>       return 0;
>>   }
>>
>> +static int acquire_ioreq_server(struct domain *d,
>> +                                unsigned int id,
>> +                                unsigned long frame,
>> +                                unsigned int nr_frames,
>> +                                xen_pfn_t mfn_list[])
>> +{
>> +#ifdef CONFIG_IOREQ_SERVER
>> +    ioservid_t ioservid = id;
>> +    unsigned int i;
>> +    int rc;
>> +
>> +    if ( !is_hvm_domain(d) )
>> +        return -EINVAL;
>> +
>> +    if ( id != (unsigned int)ioservid )
>> +        return -EINVAL;
>> +
>> +    for ( i = 0; i < nr_frames; i++ )
>> +    {
>> +        mfn_t mfn;
>> +
>> +        rc = hvm_get_ioreq_server_frame(d, id, frame + i, &mfn);
>> +        if ( rc )
>> +            return rc;
>> +
>> +        mfn_list[i] = mfn_x(mfn);
>> +    }
>> +
>> +    return 0;
>> +#else
>> +    return -EOPNOTSUPP;
>> +#endif
>> +}
>> +
>>   static int acquire_resource(
>>       XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg)
>>   {
>> @@ -1148,9 +1183,13 @@ static int acquire_resource(
>>                                    mfn_list);
>>           break;
>>
>> +    case XENMEM_resource_ioreq_server:
>> +        rc = acquire_ioreq_server(d, xmar.id, xmar.frame, xmar.nr_frames,
>> +                                  mfn_list);
>> +        break;
>> +
>>       default:
>> -        rc = arch_acquire_resource(d, xmar.type, xmar.id, xmar.frame,
>> -                                   xmar.nr_frames, mfn_list);
>> +        rc = -EOPNOTSUPP;
>>           break;
>>       }
>>
>> diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
>> index f8ba49b..0b7de31 100644
>> --- a/xen/include/asm-arm/mm.h
>> +++ b/xen/include/asm-arm/mm.h
>> @@ -358,14 +358,6 @@ static inline void put_page_and_type(struct page_info
>> *page)
>>
>>   void clear_and_clean_page(struct page_info *page);
>>
>> -static inline
>> -int arch_acquire_resource(struct domain *d, unsigned int type, unsigned int id,
>> -                          unsigned long frame, unsigned int nr_frames,
>> -                          xen_pfn_t mfn_list[])
>> -{
>> -    return -EOPNOTSUPP;
>> -}
>> -
>>   unsigned int arch_get_dma_bitsize(void);
>>
> This change could not be applied to the latest staging branch.

Yes, thank you noticing that.  The code around was changed a bit (patch 
series is based on 10-days old staging), I will update for the next version.


>
>>   #endif /*  __ARCH_ARM_MM__ */
>> diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
>> index deeba75..859214e 100644
>> --- a/xen/include/asm-x86/mm.h
>> +++ b/xen/include/asm-x86/mm.h
>> @@ -639,8 +639,4 @@ static inline bool arch_mfn_in_directmap(unsigned long
>> mfn)
>>       return mfn <= (virt_to_mfn(eva - 1) + 1);
>>   }
>>
>> -int arch_acquire_resource(struct domain *d, unsigned int type,
>> -                          unsigned int id, unsigned long frame,
>> -                          unsigned int nr_frames, xen_pfn_t mfn_list[]);
>> -
>>   #endif /* __ASM_X86_MM_H__ */
>> --
>> 2.7.4
>>
-- 
Regards,

Oleksandr Tyshchenko


