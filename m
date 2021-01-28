Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB31307801
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 15:29:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77082.139421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58IY-0005kH-2y; Thu, 28 Jan 2021 14:29:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77082.139421; Thu, 28 Jan 2021 14:29:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58IX-0005jr-V5; Thu, 28 Jan 2021 14:29:25 +0000
Received: by outflank-mailman (input) for mailman id 77082;
 Thu, 28 Jan 2021 14:29:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tEu6=G7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l58IW-0005jl-BS
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 14:29:24 +0000
Received: from mail-lj1-x22e.google.com (unknown [2a00:1450:4864:20::22e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f51559a6-5eca-45eb-93b3-c3423d804c3c;
 Thu, 28 Jan 2021 14:29:23 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id y11so6579724ljk.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 06:29:23 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b24sm1710966lff.204.2021.01.28.06.29.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 06:29:21 -0800 (PST)
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
X-Inumbo-ID: f51559a6-5eca-45eb-93b3-c3423d804c3c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=yjs6PedjRi1tEV5PcSbTaYSabtBnHYKNtVuQh7L6+TE=;
        b=G/8YN6WHa301YdSq/PZii+CWMdxCFLRwvfWVTJGfF/ZBVeTmCeyVrrL++mq/rRduyH
         BVMJyMZknBjitBrvSe0+onDLV/SYHYP2/wAlZwRjoF8t8AqNEDPd4s7oz9WyQfd0DcMU
         H+2xsknb2uYEt+8mLCowVQ5ubDhHU+2RwltSbSnJk7KMLEl3oYTi6AFpijFBXNcEuCVH
         UKHw/8UxZx/+ll35Je92DS2wW0k1P/X6gN/Rjof9lVUr0HoOtzyp8PvRtcWOCkHmfEK2
         EWIBsM82MC6PfVuStYDt71BJB6PuftYzKei0zNbOK1MXhfW2nJLsDThJrpkA9x8QPR3J
         17Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=yjs6PedjRi1tEV5PcSbTaYSabtBnHYKNtVuQh7L6+TE=;
        b=r+fMUE5rOtntKXSKadhTK5gYuJiKE9SxTzZEabjbvgYJKVwpKgD6k2vN2oSft4i3ha
         42GqKB3yucMzpRX6xh13f0FcBshQ4uaAI6teR7grd2Qxg9gDsvDsyCB+A4bp81QkM2ej
         nd9LrdNi7COBxtT1XCIdvY9OmBfP4d0VRklbTdBY4obbtBNUpgqXHvfN2VMwA5jy6AX4
         Zf5WGK5dEuxf2VurCu3PI3VVhvjZJ/xKTv7jayn6dfF2pLk0TnWqGQVgEw3D9r2CxLSp
         D/bS6KNLvHojOvB9Es1JVw/UxGivvoAFljVtMEghmmwKfL4KKiic4cDmzCtOPf/9prmK
         cTvA==
X-Gm-Message-State: AOAM5333dHjeFENW5oImw3+s7gFCKLL6ca50RYlCH+y5/PO2/856tN67
	ZUotZ65A1OUm/H55IfifUgU=
X-Google-Smtp-Source: ABdhPJzri9S9ipnHSxcG+b6xyZxEMGarOHBqNpLO06ORkp+2bLsP3XiTQps9KQn+6emFV0AArfUgGQ==
X-Received: by 2002:a2e:850c:: with SMTP id j12mr9158890lji.298.1611844162030;
        Thu, 28 Jan 2021 06:29:22 -0800 (PST)
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
 <d0ff4658-30c2-ffed-3a9d-3dadd6195a61@gmail.com>
Message-ID: <fef8ba7e-d434-5c72-779c-53fd323558de@gmail.com>
Date: Thu, 28 Jan 2021 16:29:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d0ff4658-30c2-ffed-3a9d-3dadd6195a61@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Hi Julien


On 28.01.21 15:39, Oleksandr wrote:
>
> On 28.01.21 13:33, Oleksandr wrote:
>
> Hi Julien
>
>>
>> On 28.01.21 11:40, Julien Grall wrote:
>>
>> Hi Julien
>>
>>> Hi Oleksandr,
>>>
>>> On 27/01/2021 19:20, Oleksandr wrote:
>>>  >  >>> So I think we may be able to drop the include from 
>>> asm/hvm/domain.h
>>>> (this would avoid to include it everywhere...).
>>>>
>>>> I have tried that, but other CUs use definitions from 
>>>> public/hvm/dm_op.h, for example:
>>>>
>>>> p2m-pt.c: In function 'p2m_type_to_flags':
>>>> p2m-pt.c:87:33: error: 'XEN_DMOP_IOREQ_MEM_ACCESS_WRITE' undeclared 
>>>> (first use in this function)
>>>>           if ( p2m->ioreq.flags & XEN_DMOP_IOREQ_MEM_ACCESS_WRITE )
>>>>                                   ^
>>>> So, I would prefer to leave it as is, please let me know if you 
>>>> think otherwise.
>>>
>>> AFAICT, there is only 2 places (p2m-pt.c and p2m-ept.c) that 
>>> requires <public/hvm/dm_op.h> but doesn't directly include it. 
>>> Folding the diff below in patch #4 should do the job:
>>
>> ok, will do
>
>
> Just to clarify, you mentioned about patch #4, but shouldn't we make 
> these changes in patch #9 which actually tries to sort dm related stuff?

or a least in patch #8 which moves the stuff from asm-x86/hvm/domain.h 
to xen/ioreq.h (including the user of XEN_DMOP_IO_RANGE_PCI),

what do you think?


As for proposed changes, can confirm they work.


>
>
>>
>>
>>>
>>> diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
>>> index 975ab403f235..23d411f01d2f 100644
>>> --- a/xen/arch/x86/mm/p2m-ept.c
>>> +++ b/xen/arch/x86/mm/p2m-ept.c
>>> @@ -17,6 +17,7 @@
>>>
>>>  #include <xen/domain_page.h>
>>>  #include <xen/sched.h>
>>> +#include <public/hvm/dm_op.h>
>>>  #include <asm/altp2m.h>
>>>  #include <asm/current.h>
>>>  #include <asm/paging.h>
>>> diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
>>> index c43d5d0413a1..f2afcf49a368 100644
>>> --- a/xen/arch/x86/mm/p2m-pt.c
>>> +++ b/xen/arch/x86/mm/p2m-pt.c
>>> @@ -27,6 +27,7 @@
>>>  #include <xen/vm_event.h>
>>>  #include <xen/event.h>
>>>  #include <xen/trace.h>
>>> +#include <public/hvm/dm_op.h>
>>>  #include <public/vm_event.h>
>>>  #include <asm/altp2m.h>
>>>  #include <asm/domain.h>
>>> diff --git a/xen/include/asm-x86/hvm/domain.h 
>>> b/xen/include/asm-x86/hvm/domain.h
>>> index 3b36c2f41fa1..f26c1a2e2d5f 100644
>>> --- a/xen/include/asm-x86/hvm/domain.h
>>> +++ b/xen/include/asm-x86/hvm/domain.h
>>> @@ -28,8 +28,6 @@
>>>  #include <asm/hvm/vmx/vmcs.h>
>>>  #include <asm/hvm/svm/vmcb.h>
>>>
>>> -#include <public/hvm/dm_op.h>
>>> -
>>>  #ifdef CONFIG_MEM_SHARING
>>>  struct mem_sharing_domain
>>>  {
>>>
>>> You would then need to move the include of <public/hvm/dm_op.h> in 
>>> <xen/dm.h> from this patch to patch #9.
>>
>> yes, sure
>>
>>
-- 
Regards,

Oleksandr Tyshchenko


