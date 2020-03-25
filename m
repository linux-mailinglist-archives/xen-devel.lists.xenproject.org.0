Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25422192EB7
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 17:54:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH9G6-0005CQ-8m; Wed, 25 Mar 2020 16:52:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pb40=5K=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jH9G4-0005CL-IO
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 16:52:00 +0000
X-Inumbo-ID: f15de76a-6eb8-11ea-8669-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f15de76a-6eb8-11ea-8669-12813bfff9fa;
 Wed, 25 Mar 2020 16:51:59 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id h9so4031454wrc.8
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2020 09:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hjhzVxmg9eS/YL+KKmPvocMgAOtd9e/OW36J5kzn+OU=;
 b=a5tqUtRxEfLN4CBjlMpQUEBq3EVcASGLP52FGhQvsSI0qiqmb7PSF5ibh1CY/kqhym
 7Fjtt8V3Cgv9TBY8ZrDKh/NBj42kwaRMPxGr4R8eZgTFjqyFLSvXc2ZllJwELntqArZs
 AQ/jz+yCfgePXDzj4iscai1MN0idAWQKFBioDyMLGSehhPSUuKcXYcDNChKb+10Vpvdq
 aE0YKhJ2RkpYFG06OSkCqPwxx2GKyk6CrC1pWiDY7khpByjy8rA6kE7FyCYrvj4zDVI6
 +3XTgs1g2Jhca6pDifAQCQC41BMxX53wX55TNl2HD+3w1awP63hDWUyu8b4NUxX2YKQr
 kSyg==
X-Gm-Message-State: ANhLgQ3Bo0KHpHDKvqEmLnzFUSqN1zB8DVQ8xEklEHq+EDW1ioqgdsbz
 6l9ySoSQWOC7HYxx1HY6Khg=
X-Google-Smtp-Source: ADFU+vsP7h8r1Yjc4YCSdqCGKwYOs2rXGbp5h/0vTJ1bgvwpWHIsrv4OPgq4yYWyk68QFGaFyVH3Yg==
X-Received: by 2002:adf:a3db:: with SMTP id m27mr4528808wrb.350.1585155118685; 
 Wed, 25 Mar 2020 09:51:58 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id s2sm16234175wru.68.2020.03.25.09.51.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2020 09:51:57 -0700 (PDT)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <cover.1584981438.git.tamas.lengyel@intel.com>
 <a8cf8742054d04760f2f5060cfeef5bef1edbd6f.1584981438.git.tamas.lengyel@intel.com>
 <20200325154702.GD28601@Air-de-Roger>
 <CABfawhnQ_LTG8oses9EWatJ63bEZFctp7uARBjN==twV7c4xqw@mail.gmail.com>
 <ce6b0e2b-b135-8ee6-fc0c-fe190685b237@xen.org>
 <CABfawhkieTA-480tKbQKdYrEs0QSaSmreC2xD3cngGExG=nj6Q@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <95a7c1bf-9b2f-f0e8-1463-3cf8afb74041@xen.org>
Date: Wed, 25 Mar 2020 16:51:55 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CABfawhkieTA-480tKbQKdYrEs0QSaSmreC2xD3cngGExG=nj6Q@mail.gmail.com>
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
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 25/03/2020 16:47, Tamas K Lengyel wrote:
> On Wed, Mar 25, 2020 at 10:42 AM Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 25/03/2020 16:34, Tamas K Lengyel wrote:
>>>>> diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
>>>>> index 9f51370327..1ed7d13084 100644
>>>>> --- a/xen/arch/x86/mm/p2m.c
>>>>> +++ b/xen/arch/x86/mm/p2m.c
>>>>> @@ -509,6 +509,12 @@ mfn_t __get_gfn_type_access(struct p2m_domain *p2m, unsigned long gfn_l,
>>>>>
>>>>>        mfn = p2m->get_entry(p2m, gfn, t, a, q, page_order, NULL);
>>>>>
>>>>> +    /* Check if we need to fork the page */
>>>>> +    if ( (q & P2M_ALLOC) && p2m_is_hole(*t) &&
>>>>> +         !mem_sharing_fork_page(p2m->domain, gfn, q & P2M_UNSHARE) )
>>>>> +        mfn = p2m->get_entry(p2m, gfn, t, a, q, page_order, NULL);
>>>>> +
>>>>> +    /* Check if we need to unshare the page */
>>>>>        if ( (q & P2M_UNSHARE) && p2m_is_shared(*t) )
>>>>>        {
>>>>>            ASSERT(p2m_is_hostp2m(p2m));
>>>>> @@ -588,7 +594,8 @@ struct page_info *p2m_get_page_from_gfn(
>>>>>                return page;
>>>>>
>>>>>            /* Error path: not a suitable GFN at all */
>>>>> -        if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(*t) )
>>>>> +        if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(*t) &&
>>>>> +             !mem_sharing_is_fork(p2m->domain) )
>>>>>                return NULL;
>>>>>        }
>>>>>
>>>>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>>>>> index b4eb476a9c..62aed53a16 100644
>>>>> --- a/xen/common/domain.c
>>>>> +++ b/xen/common/domain.c
>>>>> @@ -1270,6 +1270,9 @@ int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned offset)
>>>>>
>>>>>        v->vcpu_info = new_info;
>>>>>        v->vcpu_info_mfn = page_to_mfn(page);
>>>>> +#ifdef CONFIG_MEM_SHARING
>>>>> +    v->vcpu_info_offset = offset;
>>>>
>>>> There's no need to introduce this field, you can just use v->vcpu_info
>>>> & ~PAGE_MASK AFAICT.
>>>
>>> Just doing what you suggest above results in:
>>>
>>> mem_sharing.c:1603:55: error: invalid operands to binary & (have
>>> ‘vcpu_info_t * const’ {aka ‘union <anonymous> * const’} and ‘long
>>> int’)
>>>                                        d_vcpu->vcpu_info & ~PAGE_MASK);
>>>
>>> I can of course cast the vcpu_info pointer to (long int), it's just a
>>> bit ugly. Thoughts?
>>
>> FWIW, I will also need the offset for liveupdate. I have used (unsigned
>> long)v->vcpu_info & ~PAGE_MASK so far but this is not really pretty.
>>
>> So I am all for either a new field or a macro hiding this uglyness.
> 
> A macro sounds like a good way to go, no need for an extra field if we
> can calculate it based on the currently existing one. How about
> 
> #define VCPU_INFO_OFFSET(v) (((unsigned long)v->vcpu_info) & ~PAGE_MASK)

I was more thinking a generic macro to find the offset in a page.

PAGE_OFFSET(ptr) ((unsigned long)(ptr) & ~PAGE_MASK)

Anyway, I am happy either way.

Cheers,

-- 
Julien Grall

