Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC09A47D020
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 11:38:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250748.431837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzz0d-0006ld-9x; Wed, 22 Dec 2021 10:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250748.431837; Wed, 22 Dec 2021 10:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzz0d-0006j2-61; Wed, 22 Dec 2021 10:38:11 +0000
Received: by outflank-mailman (input) for mailman id 250748;
 Wed, 22 Dec 2021 10:38:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/qRA=RH=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mzz0a-0006iw-Sm
 for xen-devel@lists.xenproject.org; Wed, 22 Dec 2021 10:38:09 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f724655-6313-11ec-9e60-abaf8a552007;
 Wed, 22 Dec 2021 11:38:07 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id i31so4358124lfv.10
 for <xen-devel@lists.xenproject.org>; Wed, 22 Dec 2021 02:38:06 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id s13sm175289lfg.126.2021.12.22.02.38.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 02:38:05 -0800 (PST)
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
X-Inumbo-ID: 3f724655-6313-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=2FO88ppBB6/Lz88Qe7FWYpHGln/JjY+e4uNmm/8qzrM=;
        b=NtYxVpFP4PWU7XGkkQjxu/znyUP83UiQjSRQPto3asOpfSVkuhsBxCLS20GJ2iNYLi
         MHVse1oFMeJqvNBHc+INqHgZ93gqY0UbIyBpoRF5cSoHUCi6w9aHPdqhzd8GSEwHERrC
         45fRwG273GI5KkgB7Gu8+9gSeGbvMYU107S8xhmLloBKIDg/KKHDzjuBfczLjF8VgcNw
         6JSbzTnRMjQvTz4t3eHt1hGwN7gEXxBN98hVGJYvte2E6NWxf3MyPTJO1Lk/Rr+1XoEy
         1NAFJrry8uf3Z+lzto7Wq9TyQqD23KeREkrDb8WHAObjDpGNLRthlb/r0pFlfQQ9/DzJ
         Lhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=2FO88ppBB6/Lz88Qe7FWYpHGln/JjY+e4uNmm/8qzrM=;
        b=PkEwGRtfw6iK0ICTC6WZqL3VFMRj50NZKzUqIwpDjEa+bGCdA6fRWaoEoCUclKOVcV
         syPyq0tdxbHJOm57rfGxhBS90epVNoOc+M3n2OxVmEE2tVLWujvYfEey2f+hJmnwrtvV
         txg25oPAM7RxVU6n/MrpFoVDPf4Dt+HX8Aw5nWmma/Ua0aPLbdKgq96diYIe1c6yNG7q
         tax265JYvOVvBhtZYpqAjWQ161wL+ouD4KdXdHKK038jZymGKh8v0jPcX7RKPXWeeoRc
         yoVSGb9VCaRNPCTGAlRlWaSBpSEHDebOMEZFm1fnJP7PVlwJasibSHpoX9tE+yU6JBOs
         Dfxg==
X-Gm-Message-State: AOAM5317R4z7CY5uyP9YLWVrzWdwbIZFjsXAOjkE7EXAvXYN0YJqg8fu
	jOg7xZ19Luzrkx3nxLD1vPW4b+qw+HM=
X-Google-Smtp-Source: ABdhPJwdWr8NtVo8hHL74m8jx+VuvL+3ofVAIX0ZGG3AjePGODmKemSqtU5nBUwfDgRhkWoJ0IbaNg==
X-Received: by 2002:a19:7012:: with SMTP id h18mr2037978lfc.152.1640169485583;
        Wed, 22 Dec 2021 02:38:05 -0800 (PST)
Subject: Re: [PATCH V4] xen/gnttab: Store frame GFN in struct page_info on Arm
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <1638563610-4419-1-git-send-email-olekstysh@gmail.com>
 <ebfaf88c-38a8-638c-298e-a92e5827baf1@suse.com>
 <6f4813ce-5d23-2192-fabc-e933241cf30e@gmail.com>
 <fbe522a6-297f-4e5e-5081-f7e7e277155b@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <bfb0e6f5-a85f-8613-5da2-60a17443f65a@gmail.com>
Date: Wed, 22 Dec 2021 12:38:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fbe522a6-297f-4e5e-5081-f7e7e277155b@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 22.12.21 11:49, Julien Grall wrote:
> Hi Oleksandr,

Hi Julien


>
> On 14/12/2021 17:26, Oleksandr wrote:
>>>> @@ -1487,7 +1489,23 @@ int xenmem_add_to_physmap_one(
>>>>       }
>>>>       /* Map at new location. */
>>>> -    rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
>>>> +    if ( !p2m_is_ram(t) || !is_xen_heap_mfn(mfn) )
>>>> +        rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
>>>> +    else
>>>> +    {
>>>> +        struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>>> +
>>>> +        p2m_write_lock(p2m);
>>>> +        if ( gfn_eq(page_get_xenheap_gfn(mfn_to_page(mfn)), 
>>>> INVALID_GFN) )
>>>> +        {
>>>> +            rc = p2m_set_entry(p2m, gfn, 1, mfn, t, 
>>>> p2m->default_access);
>>>> +            if ( !rc )
>>>> +                page_set_xenheap_gfn(mfn_to_page(mfn), gfn);
>>>> +        }
>>>> +        else
>>>> +            rc = -EBUSY;
>>> May I suggest to avoid failing here when 
>>> page_get_xenheap_gfn(mfn_to_page(mfn))
>>> matches the passed in GFN?
>>
>>
>> Good question...
>> There was an explicit request to fail here if page_get_xenheap_gfn() 
>> returns a valid GFN.
>>  From the other side, if old GFN matches new GFN we do not remove the 
>> mapping in gnttab_set_frame_gfn(),
>> so probably we could avoid failing here in that particular case. 
>> @Julien, what do you think?
>
> I will answer by a question :). Can this situation happen in normal 
> circumstances (e.g. there is no concurrent call)?

I think no, it can't. Otherwise I would notice it while testing in 
normal circumstances.


>
>
> The recent XSAs in the grant table code made me more cautious and I 
> would prefer if we fail more often than risking potentially 
> introducing yet another security issue. It is easy to relax afterwards 
> if there are legitimate use cases.

I got it, so your explicit request to fail here still stands. Thank you 
for the clarification.


>
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


