Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FA82D2FFB
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 17:43:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47597.84240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmg3z-0000k6-NM; Tue, 08 Dec 2020 16:42:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47597.84240; Tue, 08 Dec 2020 16:42:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmg3z-0000jh-K8; Tue, 08 Dec 2020 16:42:07 +0000
Received: by outflank-mailman (input) for mailman id 47597;
 Tue, 08 Dec 2020 16:42:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KXXm=FM=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kmg3y-0000jc-8E
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 16:42:06 +0000
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70c061bf-f533-49cd-b338-2897a66bf768;
 Tue, 08 Dec 2020 16:42:04 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 23so11520772lfg.10
 for <xen-devel@lists.xenproject.org>; Tue, 08 Dec 2020 08:42:04 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id p7sm3247086lfc.222.2020.12.08.08.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 08:42:02 -0800 (PST)
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
X-Inumbo-ID: 70c061bf-f533-49cd-b338-2897a66bf768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=nO71H+lpySIUCevPMYEFO+2WdKIK4v2yLo3yenusKsI=;
        b=u9g1memofRM4rP0x8qj+jkgGHT98+CW6/6fBYFXVrZL3ZyrLAZTdtDnQ+MPUSQdwlL
         E79lrh41F16XqZlO0g7d9HxMJfHMlaK0dPN7tlk0WszgB6IVn1IC3HQ2tVko8Qj6bxuA
         26gyRB0cGyG9ttfU41gT0Pahvgu1YAObjNK9moS88v34oWIB3qS/6guAVGq1fugqksrQ
         ThO4gJJ3YZusE61l0xLSVTkbkuI1geOe6tQ9Tv10CSz3xjlASyfCw3q4NG/ZLaVjxteT
         u4C5ckktZ5MJHxkpSS3Mi2u4/G1ze0R77SxWTc5u2rQqvLsr2AZJTqPxH8dcdePS83Qw
         0pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=nO71H+lpySIUCevPMYEFO+2WdKIK4v2yLo3yenusKsI=;
        b=JxVYuTUX5Ii0SwveykXGFv7ahx2xsXMJouOhUzaxZSC1CvQBY/VhmP3Zjfb7HmEI2b
         dlelI1PQEQ/f0FOw6t7s4gaK/+LA0fYXtxbw+Dl953qh5dKwmWH0dlWpr5m7p1xdJ6nv
         gSW7cRksc3ZsZTK9PQDY9VOBPt6a3xm86n2c+V/DcziIU4facnSZc+qqsvnXk6UX0Zm4
         M72wEtBtshcASQ6cm03t3no+clciUnKE7/7p3CGgZq9ga4AkXt5P7q4QpHs5YwEPkuJW
         aefSFh4SiwbssbWZsFz6nT7mwFlackgnvGrMzpZb8OJUZFBRLY2sbPWUB3NaoDqNEaV8
         Zrzw==
X-Gm-Message-State: AOAM531+fReCS8+s47ABl4l8S5i2oG8x8pZuV1Xfap5cOexa5vBZAI5Z
	EfJI7by2pYj6EnbiTodveoEJTPaaIs7Y7A==
X-Google-Smtp-Source: ABdhPJw5GJO50ncmK487CxnIrSV2Ad38z4Vka40SPmGgWSo9SALdAfAtX6HVl7zMQaFQcmx55wuELg==
X-Received: by 2002:ac2:5a49:: with SMTP id r9mr10512099lfn.381.1607445723569;
        Tue, 08 Dec 2020 08:42:03 -0800 (PST)
Subject: Re: [PATCH V3 16/23] xen/mm: Handle properly reference in
 set_foreign_p2m_entry() on Arm
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-17-git-send-email-olekstysh@gmail.com>
 <5f1a2914-f894-0046-2911-9cccb5d94dbf@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <e9973974-8240-8c28-90cd-2916f3cae25f@gmail.com>
Date: Tue, 8 Dec 2020 18:41:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5f1a2914-f894-0046-2911-9cccb5d94dbf@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 08.12.20 16:24, Jan Beulich wrote:

Hi Jan

> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -1134,12 +1134,8 @@ static int acquire_resource(
>>       xen_pfn_t mfn_list[32];
>>       int rc;
>>   
>> -    /*
>> -     * FIXME: Until foreign pages inserted into the P2M are properly
>> -     *        reference counted, it is unsafe to allow mapping of
>> -     *        resource pages unless the caller is the hardware domain.
>> -     */
>> -    if ( paging_mode_translate(currd) && !is_hardware_domain(currd) )
>> +    if ( paging_mode_translate(currd) && !is_hardware_domain(currd) &&
>> +         !arch_acquire_resource_check() )
>>           return -EACCES;
> Looks like I didn't express myself clearly enough when replying
> to v2, by saying "as both prior parts of the condition should be
> needed only on the x86 side, and there (for PV) there's no p2m
> involved in the refcounting". While one may debate whether the
> hwdom check may remain here, the "translated" one definitely
> should move into the x86 hook. This (I think) will the also make
> apparent that ...
>
>> --- a/xen/include/asm-x86/p2m.h
>> +++ b/xen/include/asm-x86/p2m.h
>> @@ -382,6 +382,19 @@ struct p2m_domain {
>>   #endif
>>   #include <xen/p2m-common.h>
>>   
>> +static inline bool arch_acquire_resource_check(void)
>> +{
>> +    /*
>> +     * The reference counting of foreign entries in set_foreign_p2m_entry()
>> +     * is not supported on x86.
>> +     *
>> +     * FIXME: Until foreign pages inserted into the P2M are properly
>> +     * reference counted, it is unsafe to allow mapping of
>> +     * resource pages unless the caller is the hardware domain.
>> +     */
>> +    return false;
>> +}
> ... the initial part of the comment is true only for translated
> domains. The reference to hwdom in the latter part of the comment
> (which merely gets moved here) is a good indication that the
> hwdom check also wants moving here. In turn the check at the top
> of p2m_add_foreign() should imo then also use this new function,
> instead of effectively open-coding it (with a similar comment).
> And x86's set_foreign_p2m_entry() may want to gain
>
>      ASSERT(arch_acquire_resource_check(d));
>
> perhaps alongside the same ASSERT() you add to the Arm variant.

Well, will do. I was about to mention, that new function wanted to gain 
domain as parameter, but noticed you had given a hint in the ASSERT 
example.


-- 
Regards,

Oleksandr Tyshchenko


