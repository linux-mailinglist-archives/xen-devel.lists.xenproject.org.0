Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 359A5192E88
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 17:44:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH96Z-0004Fj-VX; Wed, 25 Mar 2020 16:42:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pb40=5K=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jH96Y-0004Fe-FR
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 16:42:10 +0000
X-Inumbo-ID: 91d78cfc-6eb7-11ea-92cf-bc764e2007e4
Received: from mail-ed1-f67.google.com (unknown [209.85.208.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91d78cfc-6eb7-11ea-92cf-bc764e2007e4;
 Wed, 25 Mar 2020 16:42:09 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id b18so3264770edu.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2020 09:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U2FybUwkx/VhwOngKW7JXLj7ssz+YYvhxIDZnR7q//4=;
 b=DPobgl9JRMKk1kkl4wL6b/kRRUUKWGgIwrwq0gwKZaVlUemMR16dMCZ3KN6QS0FShO
 wkX68p+6GS2l7rtBcCWgcvMb0O4IjJBwT0CWbt4NHttl/RiptDnRw/zOFgF53EOzBnuB
 ZND3RDIP3/2ga8nV7kTto6s2WXbaxAusHV0iWyxOIQlKBGX7iQi5nB5F5lkqj3bGXFry
 29DO1qrjS6XnFLtgKenLOwugAPjKvOrxOxpiqIWthWYqCjySxSxFVY0AxoccEitSkWd+
 US+FFJwtaIBYCQOSxa9qk8AFFexLhuEgUtYQHnCgiqg351s/CqrGHhkxmLFPnu11VvBr
 bX7g==
X-Gm-Message-State: ANhLgQ0OE1AZy1JYqn7RFQGM3pzmZaOVrfX9GKlR9k9TuFdK/h5HI3nL
 rcZN4bNw98xIC6stmBOl6Ac=
X-Google-Smtp-Source: ADFU+vsz1fsAgArp14kX9W974tDjg4ap+pxaXscbv3mv8MIZb4Mt5W7VDCMxiS7FAf7E1kjjXmlE9g==
X-Received: by 2002:a50:b883:: with SMTP id l3mr3899724ede.331.1585154528888; 
 Wed, 25 Mar 2020 09:42:08 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id u6sm113316eje.74.2020.03.25.09.42.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2020 09:42:08 -0700 (PDT)
To: Tamas K Lengyel <tamas@tklengyel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1584981438.git.tamas.lengyel@intel.com>
 <a8cf8742054d04760f2f5060cfeef5bef1edbd6f.1584981438.git.tamas.lengyel@intel.com>
 <20200325154702.GD28601@Air-de-Roger>
 <CABfawhnQ_LTG8oses9EWatJ63bEZFctp7uARBjN==twV7c4xqw@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ce6b0e2b-b135-8ee6-fc0c-fe190685b237@xen.org>
Date: Wed, 25 Mar 2020 16:42:07 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CABfawhnQ_LTG8oses9EWatJ63bEZFctp7uARBjN==twV7c4xqw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH v12 1/3] xen/mem_sharing: VM forking
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 25/03/2020 16:34, Tamas K Lengyel wrote:
>>> diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
>>> index 9f51370327..1ed7d13084 100644
>>> --- a/xen/arch/x86/mm/p2m.c
>>> +++ b/xen/arch/x86/mm/p2m.c
>>> @@ -509,6 +509,12 @@ mfn_t __get_gfn_type_access(struct p2m_domain *p2m, unsigned long gfn_l,
>>>
>>>       mfn = p2m->get_entry(p2m, gfn, t, a, q, page_order, NULL);
>>>
>>> +    /* Check if we need to fork the page */
>>> +    if ( (q & P2M_ALLOC) && p2m_is_hole(*t) &&
>>> +         !mem_sharing_fork_page(p2m->domain, gfn, q & P2M_UNSHARE) )
>>> +        mfn = p2m->get_entry(p2m, gfn, t, a, q, page_order, NULL);
>>> +
>>> +    /* Check if we need to unshare the page */
>>>       if ( (q & P2M_UNSHARE) && p2m_is_shared(*t) )
>>>       {
>>>           ASSERT(p2m_is_hostp2m(p2m));
>>> @@ -588,7 +594,8 @@ struct page_info *p2m_get_page_from_gfn(
>>>               return page;
>>>
>>>           /* Error path: not a suitable GFN at all */
>>> -        if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(*t) )
>>> +        if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(*t) &&
>>> +             !mem_sharing_is_fork(p2m->domain) )
>>>               return NULL;
>>>       }
>>>
>>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>>> index b4eb476a9c..62aed53a16 100644
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -1270,6 +1270,9 @@ int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned offset)
>>>
>>>       v->vcpu_info = new_info;
>>>       v->vcpu_info_mfn = page_to_mfn(page);
>>> +#ifdef CONFIG_MEM_SHARING
>>> +    v->vcpu_info_offset = offset;
>>
>> There's no need to introduce this field, you can just use v->vcpu_info
>> & ~PAGE_MASK AFAICT.
> 
> Just doing what you suggest above results in:
> 
> mem_sharing.c:1603:55: error: invalid operands to binary & (have
> ‘vcpu_info_t * const’ {aka ‘union <anonymous> * const’} and ‘long
> int’)
>                                       d_vcpu->vcpu_info & ~PAGE_MASK);
> 
> I can of course cast the vcpu_info pointer to (long int), it's just a
> bit ugly. Thoughts?

FWIW, I will also need the offset for liveupdate. I have used (unsigned 
long)v->vcpu_info & ~PAGE_MASK so far but this is not really pretty.

So I am all for either a new field or a macro hiding this uglyness.

Cheers,

-- 
Julien Grall

