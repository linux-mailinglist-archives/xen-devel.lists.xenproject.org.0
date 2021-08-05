Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE4C3E18F9
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 17:59:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164469.300784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBfmW-0008PS-U4; Thu, 05 Aug 2021 15:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164469.300784; Thu, 05 Aug 2021 15:59:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBfmW-0008NY-R3; Thu, 05 Aug 2021 15:59:40 +0000
Received: by outflank-mailman (input) for mailman id 164469;
 Thu, 05 Aug 2021 15:59:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NEHI=M4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mBfmV-0008NI-8q
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 15:59:39 +0000
Received: from mail-lf1-x136.google.com (unknown [2a00:1450:4864:20::136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c5297b8-8747-4e25-a016-6323a2771d36;
 Thu, 05 Aug 2021 15:59:37 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id f42so12048856lfv.7
 for <xen-devel@lists.xenproject.org>; Thu, 05 Aug 2021 08:59:37 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v78sm504732lfa.26.2021.08.05.08.59.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 08:59:36 -0700 (PDT)
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
X-Inumbo-ID: 2c5297b8-8747-4e25-a016-6323a2771d36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Pf7m95v7Yon74RwyFSAFtG5t7tNm9MZFvRe4WgwewUI=;
        b=IRQrxcuFygkpdI92sJESXIpCqHuhSbpMZVttO7V9UV9wY80yrTVA5lEu17eiBS2JV9
         MQlMNBtO/+4BjDfKhLxw/VMh34wa8I+suaOE//ZeRXqwHl8K1y7Spj9XLKTviNmfjw1M
         hCWOJ6biuxbp8VTyNYPy2KzP+Nuddc3doZNMPulLte42EawqAAXr7lmkGVsP2H4gEarz
         hh2ZM3pY7rnjh6t7QGZRbbNLHYJjVuc6c4BQRBQ53cW0bfTpllVZV8sViDR3QtpXN4/v
         MKSi4SLpyFu8Vf1H/q5JTBO2wPAxf+rjzJSK3O72NRfM+GrV7Yz7GhOFo7fHYpbW9pXS
         Cyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Pf7m95v7Yon74RwyFSAFtG5t7tNm9MZFvRe4WgwewUI=;
        b=DAF87xKF02hNqqz1fkMdnHJk3Ji7oh8dA+1pAzwxfsl/GSLrNG1MzU/OWn8AZZXfAV
         7j+bCaDiPNXCPd5BFh+MGpQJCcAjmYoCoCiWHXvdR9pf2g8TktOJ4F+DlmlQL8Mx6Gr5
         k+s0auClHrOHIr6UY3E+fvFtgKHM0jk6ghwWEzhgf0QMzYlPdlLAJ8qWZ956lKJ5CUTt
         YjLf1fkSeHWPOKKnhAja+FZt8ipmQHREeJTTHhxopzg7PE1VAkjBHpaDp5YSL26G33iV
         KPCFGzkS+lAwdJv6HyJZp9fzWPbHUCHFtW0UsXt0tEasO85cMpwLq5ue/2SZC3mOU4tq
         KDDg==
X-Gm-Message-State: AOAM533eChavCYUTUVsqOf1ckrLkdanplu09jTmXvx0bwf+85DNbsMM1
	cDNqcgSrdfHSWp30TBw4Tu0=
X-Google-Smtp-Source: ABdhPJx+dmaL1N7mhAVWWvis0BVlYHOVTYquESH93L+hkjyzOVZPbK6crxj+5niZUr8m0acS5yRDCg==
X-Received: by 2002:ac2:4472:: with SMTP id y18mr4279354lfl.137.1628179176754;
        Thu, 05 Aug 2021 08:59:36 -0700 (PDT)
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
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <ee685f11-4f34-614d-e0ba-7cafeda08344@gmail.com>
Date: Thu, 5 Aug 2021 18:59:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6e573489-ceb7-03f4-3511-e6c166b318a6@apertussolutions.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 05.08.21 18:03, Daniel P. Smith wrote:

Hi Daniel.

> On 7/28/21 12:18 PM, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ...
>
>> diff --git a/xen/common/memory.c b/xen/common/memory.c
>> index e07bd9a..3f9b816 100644
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -1811,6 +1811,62 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>               start_extent);
>>           break;
>>   
>> +    case XENMEM_get_unallocated_space:
>> +    {
>> +        struct xen_get_unallocated_space xgus;
>> +        struct xen_unallocated_region *regions;
>> +
>> +        if ( unlikely(start_extent) )
>> +            return -EINVAL;
>> +
>> +        if ( copy_from_guest(&xgus, arg, 1) ||
>> +             !guest_handle_okay(xgus.buffer, xgus.nr_regions) )
>> +            return -EFAULT;
>> +
>> +        d = rcu_lock_domain_by_any_id(xgus.domid);
>> +        if ( d == NULL )
>> +            return -ESRCH;
>> +
>> +        rc = xsm_get_unallocated_space(XSM_HOOK, d);
> Not sure if you are aware but XSM_HOOK is a no-op check, meaning that
> you are allowing any domain to do this operation on any other domain. In
> most cases there is an XSM check at the beginning of the hypercall
> processing to do an initial clamp down but I am pretty sure there is no
> prior XSM check on this path. Based on my understanding of how this is
> intended, which may be incorrect, but I think you would actually want
> XSM_TARGET.the
Thank you for pointing this out.
I am aware what the XSM_HOOK is, but I was thinking what the default 
action would be better suited for that hypercall, and failed to think of 
a better alternative.
I was going to choose XSM_TARGET, but the description "/* Can perform on 
self or your target domain */" confused me a bit, as there was no target 
domain involved as I thought, XSM_PRIV
sounded too strictly to me, etc. So, I decided to leave a "hook" for the 
RFC version. But, now I see that XSM_TARGET might be indeed better 
choice across all possible variants.


>
>> +        if ( rc )
>> +        {
>> +            rcu_unlock_domain(d);
>> +            return rc;
>> +        }
>> +
>> +        if ( !xgus.nr_regions || xgus.nr_regions > XEN_MAX_UNALLOCATED_REGIONS )
>> +        {
>> +            rcu_unlock_domain(d);
>> +            return -EINVAL;
>> +        }
>> +
>> +        regions = xzalloc_array(struct xen_unallocated_region, xgus.nr_regions);
>> +        if ( !regions )
>> +        {
>> +            rcu_unlock_domain(d);
>> +            return -ENOMEM;
>> +        }
>> +
>> +        rc = arch_get_unallocated_space(d, regions, &xgus.nr_regions);
>> +        if ( rc )
>> +            goto unallocated_out;
>> +
>> +        if ( __copy_to_guest(xgus.buffer, regions, xgus.nr_regions) )
>> +        {
>> +            rc = -EFAULT;
>> +            goto unallocated_out;
>> +        }
>> +
>> +        if ( __copy_to_guest(arg, &xgus, 1) )
>> +            rc = -EFAULT;
>> +
>> +unallocated_out:
>> +        rcu_unlock_domain(d);
>> +        xfree(regions);
>> +
>> +        break;
>> +    }
>> +
>>       default:
>>           rc = arch_memory_op(cmd, arg);
>>           break;
> ...
>
>> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
>> index 363c6d7..2761fbd 100644
>> --- a/xen/include/xsm/dummy.h
>> +++ b/xen/include/xsm/dummy.h
>> @@ -772,3 +772,9 @@ static XSM_INLINE int xsm_domain_resource_map(XSM_DEFAULT_ARG struct domain *d)
>>       XSM_ASSERT_ACTION(XSM_DM_PRIV);
>>       return xsm_default_action(action, current->domain, d);
>>   }
>> +
>> +static XSM_INLINE int xsm_get_unallocated_space(XSM_DEFAULT_ARG struct domain *d)
>> +{
>> +    XSM_ASSERT_ACTION(XSM_HOOK);
> For completeness, if you switch to XSM_TARGET at the call site, you will
> want to change it here as well.

Yes.


>
>> +    return xsm_default_action(action, current->domain, d);
>> +}
> V/r,
> Daniel P. Smith

-- 
Regards,

Oleksandr Tyshchenko


