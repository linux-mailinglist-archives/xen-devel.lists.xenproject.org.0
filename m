Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 901CC3E1E34
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 23:57:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164594.300891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBlLX-0000z9-Vd; Thu, 05 Aug 2021 21:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164594.300891; Thu, 05 Aug 2021 21:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBlLX-0000wU-RY; Thu, 05 Aug 2021 21:56:11 +0000
Received: by outflank-mailman (input) for mailman id 164594;
 Thu, 05 Aug 2021 21:56:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NEHI=M4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mBlLW-0000wO-D0
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 21:56:10 +0000
Received: from mail-lj1-x234.google.com (unknown [2a00:1450:4864:20::234])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 95e11c37-fc84-4fed-b387-9c6cc4ea15c7;
 Thu, 05 Aug 2021 21:56:07 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id b21so9031386ljo.13
 for <xen-devel@lists.xenproject.org>; Thu, 05 Aug 2021 14:56:07 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b14sm514918lji.91.2021.08.05.14.56.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 14:56:06 -0700 (PDT)
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
X-Inumbo-ID: 95e11c37-fc84-4fed-b387-9c6cc4ea15c7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=0yMYBSSM7CnT0tSAdjnTTx3aY4/DoOlmJ2kAA80ZkIQ=;
        b=ufjdOQEZTCoFijCbAr80H337fFeIqChTIt3GQsguGa7eQBf04Js0CjInr2wAA4LfHW
         /urj1PNMxxLHXIZl1hzkKn4aDTkJ4EEuyeyNIFvkRQ3TLihrqMS7a+J5gh1qwpXLjiY8
         kXdjlOmYu08kVFW4hvbRX2UC9pSyVDyPfz1TzHsXyE9mo4UZ+D8NudYyxzpBSUFH6UpV
         Q2FvvIjazFL31gksvd4NEYjoD2j05+7DdhVlHYpFTgMF5DBsGlfmAQp/+jihsNCSkTf+
         Rr/u7Pm6+qBDP+Bof+meuO3re9m/5yLGqWZpTfCZDsO3UwBsthDE0CMDjzrr8W3pcNnz
         TdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=0yMYBSSM7CnT0tSAdjnTTx3aY4/DoOlmJ2kAA80ZkIQ=;
        b=dB9EFP0bdD+k8JNbLIPMsZSVUkiamxf3/TMh/HtixSFsGFExeHJ9TuovhRGlQy9JsY
         NwKpGdR4z7pdGDfycRyiXLZ5Y9SputRwwRtBTTX/jBhlJesDb+vTH4UoGG2xyaVGuNRF
         3fxwdXXLp1OKGPlSAGTa/p2HvUSw/miPI398PcTxU8UU4MtIa0ka6PI9g1YtlieSI20p
         Ax2KP9CXTYUTMRgi3agqk0fMTZGHW7oEAwP5AL9bIMK3xWZg3NKQZacaU9poRkU+bBSx
         GxU2RsRdm1+m2BQSla+xsA1MZbx1fw50qF1nhEt+I1sbVkf5zipn4EHNqF3Ziro4LaNk
         kipw==
X-Gm-Message-State: AOAM533OHy4h+uk/70nxhbOeJVo/YONOsWbdPO4mzFbXIlXSPN/YGqyJ
	s/FxfC2QtIbTd22a3Kb4NyM=
X-Google-Smtp-Source: ABdhPJzUfzI2knRV+3ZX4TqjWta1ux1AtStqFiMHX2nCVq65m+fZLtzh8IfCVdDRUU3ODvguX7hZcQ==
X-Received: by 2002:a2e:2d01:: with SMTP id t1mr4297765ljt.400.1628200566635;
        Thu, 05 Aug 2021 14:56:06 -0700 (PDT)
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
 <6e573489-ceb7-03f4-3511-e6c166b318a6@apertussolutions.com>
 <ee685f11-4f34-614d-e0ba-7cafeda08344@gmail.com>
 <ca936d82-cc31-a127-488c-e4e33ceb6fbb@apertussolutions.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <13cc6316-4d53-cc23-05d0-3a83a21195d6@gmail.com>
Date: Fri, 6 Aug 2021 00:56:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ca936d82-cc31-a127-488c-e4e33ceb6fbb@apertussolutions.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 05.08.21 19:37, Daniel P. Smith wrote:
> Hey Oleksandr!

Hi Daniel.


>
> On 8/5/21 11:59 AM, Oleksandr wrote:
>> On 05.08.21 18:03, Daniel P. Smith wrote:
>>
>> Hi Daniel.
>>
>>> On 7/28/21 12:18 PM, Oleksandr Tyshchenko wrote:
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> ...
>>>
>>>> diff --git a/xen/common/memory.c b/xen/common/memory.c
>>>> index e07bd9a..3f9b816 100644
>>>> --- a/xen/common/memory.c
>>>> +++ b/xen/common/memory.c
>>>> @@ -1811,6 +1811,62 @@ long do_memory_op(unsigned long cmd,
>>>> XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>                start_extent);
>>>>            break;
>>>>    +    case XENMEM_get_unallocated_space:
>>>> +    {
>>>> +        struct xen_get_unallocated_space xgus;
>>>> +        struct xen_unallocated_region *regions;
>>>> +
>>>> +        if ( unlikely(start_extent) )
>>>> +            return -EINVAL;
>>>> +
>>>> +        if ( copy_from_guest(&xgus, arg, 1) ||
>>>> +             !guest_handle_okay(xgus.buffer, xgus.nr_regions) )
>>>> +            return -EFAULT;
>>>> +
>>>> +        d = rcu_lock_domain_by_any_id(xgus.domid);
>>>> +        if ( d == NULL )
>>>> +            return -ESRCH;
>>>> +
>>>> +        rc = xsm_get_unallocated_space(XSM_HOOK, d);
>>> Not sure if you are aware but XSM_HOOK is a no-op check, meaning that
>>> you are allowing any domain to do this operation on any other domain. In
>>> most cases there is an XSM check at the beginning of the hypercall
>>> processing to do an initial clamp down but I am pretty sure there is no
>>> prior XSM check on this path. Based on my understanding of how this is
>>> intended, which may be incorrect, but I think you would actually want
>>> XSM_TARGET.the
>> Thank you for pointing this out.
>> I am aware what the XSM_HOOK is, but I was thinking what the default
>> action would be better suited for that hypercall, and failed to think of
>> a better alternative.
>> I was going to choose XSM_TARGET, but the description "/* Can perform on
>> self or your target domain */" confused me a bit, as there was no target
>> domain involved as I thought, XSM_PRIV
>> sounded too strictly to me, etc. So, I decided to leave a "hook" for the
>> RFC version. But, now I see that XSM_TARGET might be indeed better
>> choice across all possible variants.
> If you unravel the craftiness that is xsm_default_action, there is
> actually a bit of hierarchy there. If you set the default_action to
> XSM_TARGET, it will first check if calling domain(src) is the target,
> then falls into the XSM_DM_PRIV check which is if src->target == target,
> and then finally checks if is_control_domain(src). That will constrict
> the operation so that a domain can call it on itself, a device model
> domain (stubdom) can call it on the domain it is backing, and the
> control domain can make the call. I am not a 100% sure on this but I do
> not believe a hardware domain would be able to make the call with it set
> to XSM_TARGET and not employing Flask. Hope this helps.

This definitely helps. Thank you for the explanation.


>
>
>
-- 
Regards,

Oleksandr Tyshchenko


