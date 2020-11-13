Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5AD2B2139
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 18:00:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26787.55275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdcQv-0001FR-5l; Fri, 13 Nov 2020 17:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26787.55275; Fri, 13 Nov 2020 17:00:21 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdcQv-0001F2-2W; Fri, 13 Nov 2020 17:00:21 +0000
Received: by outflank-mailman (input) for mailman id 26787;
 Fri, 13 Nov 2020 17:00:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVgh=ET=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kdcQu-0001Ex-0w
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 17:00:20 +0000
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1054ae8b-716b-4a01-9f5c-8003bb67be30;
 Fri, 13 Nov 2020 17:00:19 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id w15so6279923lji.10
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2020 09:00:19 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id e27sm1605200lfc.155.2020.11.13.09.00.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 09:00:12 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HVgh=ET=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kdcQu-0001Ex-0w
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 17:00:20 +0000
X-Inumbo-ID: 1054ae8b-716b-4a01-9f5c-8003bb67be30
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1054ae8b-716b-4a01-9f5c-8003bb67be30;
	Fri, 13 Nov 2020 17:00:19 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id w15so6279923lji.10
        for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2020 09:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=vJbK1TVhyTD3XFkaQuXFgl8xu+wADAolh3cSTqf+Rvk=;
        b=M9B0Yalic02bJoHd3J9ibEWKP6G4F/2mIeVKhAhmOJKo2i3gbsTgj0wxWkafUUSgX+
         fS1OqT+HFVQ7D3OTjjjjDHdDdsUJOPo2W25c+5XT86eyq6xzXOtyYc/ny3BBvf9qPh9w
         wy5Dufrercrz9k3vMgk1Mk2i5E2hupF9CbFtTpyks/Z7cS3ju6v8g7qZnZeH2elkE//B
         eaD89bFCXlqNXEGTveedxse0FzzfRFH6wLEHMkevZHEwtBN8rm64En9n2Iwl6NuJPZCk
         cCnXyAeZ2RSDDzOd8lAcuOh4Gu/iFqBRGvPn6XwmrARCSxfQoR0mfop1QOb6wWCTG8jK
         /jOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=vJbK1TVhyTD3XFkaQuXFgl8xu+wADAolh3cSTqf+Rvk=;
        b=qS+ILy9xAQwo4CHLjabzTYrWT8mnTv2vdJ2kIiouZ2YUqMrIEa8MtLhFRVGO/0MFjd
         udklcKfidvxvW1e5kmGT9ijh8J0Cg+iTQ5piEh8anFH6as5NKHuLXQzE1TMbKqtm4CF0
         8kqBJhlIiUcBi4Hb6GmVcdbfYYZBkBWV5FprygHvwuQdB/LWg/n5jb9CT39p6ZUKxvlY
         uld7ocRm7gAAZaF9tIH72zKMKEsm8n6HQs3Wt26zab3dfAXrixceEHt2nd5Al2REfsRC
         D9aRjEy5P0BWgc/WW7JaVAXzPoKH3Sdm/VqJNf11B7SMoKju/dpsWCz2WYTeTrUt0nzF
         Qusg==
X-Gm-Message-State: AOAM530x9wWGY9PSecXxmo+Ej8XZiIeE5RNywtfV1gg9A9TrkqBsaD83
	w4ST17iVquvf2WRkA97eN3FrpbKOE12NQw==
X-Google-Smtp-Source: ABdhPJwF6HwMTD7iCWV8/jUrAz7vQ7sdiN76H8+z01njAl4/BimhS7EQtP9VsqsDJZTMTlHOVDKzlg==
X-Received: by 2002:a2e:2201:: with SMTP id i1mr1476450lji.257.1605286813457;
        Fri, 13 Nov 2020 09:00:13 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id e27sm1605200lfc.155.2020.11.13.09.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2020 09:00:12 -0800 (PST)
Subject: Re: [PATCH V2 16/23] xen/mm: Handle properly reference in
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
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-17-git-send-email-olekstysh@gmail.com>
 <e4c04492-3e99-4578-8f00-e7b35aeb26c5@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <7ad093a1-cc52-a0ec-df35-a56a54c50425@gmail.com>
Date: Fri, 13 Nov 2020 19:00:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e4c04492-3e99-4578-8f00-e7b35aeb26c5@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 12.11.20 14:18, Jan Beulich wrote:

Hi Jan

> On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
>> --- a/xen/arch/arm/p2m.c
>> +++ b/xen/arch/arm/p2m.c
>> @@ -1380,6 +1380,27 @@ int guest_physmap_remove_page(struct domain *d, gfn_t gfn, mfn_t mfn,
>>       return p2m_remove_mapping(d, gfn, (1 << page_order), mfn);
>>   }
>>   
>> +int set_foreign_p2m_entry(struct domain *d, const struct domain *fd,
>> +                          unsigned long gfn, mfn_t mfn)
>> +{
>> +    struct page_info *page = mfn_to_page(mfn);
>> +    int rc;
>> +
>> +    if ( !get_page(page, fd) )
>> +        return -EINVAL;
>> +
>> +    /*
>> +     * It is valid to always use p2m_map_foreign_rw here as if this gets
>> +     * called that d != fd. A case when d == fd would be rejected by
>> +     * rcu_lock_remote_domain_by_id() earlier.
>> +     */
> Are you describing things here on the assumption that no new
> callers may surface later on? To catch such, I'd recommend
> adding at least a respective ASSERT().

Agree, will add.


>
>> +    rc = guest_physmap_add_entry(d, _gfn(gfn), mfn, 0, p2m_map_foreign_rw);
>> +    if ( rc )
>> +        put_page(page);
>> +
>> +    return 0;
> I can't imagine it's correct to not signal the error to the
> caller(s).

It is not correct, I have just missed to place return rc. Thank you for 
the catch.


>
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -1099,7 +1099,8 @@ static int acquire_resource(
>>        *        reference counted, it is unsafe to allow mapping of
>>        *        resource pages unless the caller is the hardware domain.
>>        */
>> -    if ( paging_mode_translate(currd) && !is_hardware_domain(currd) )
>> +    if ( paging_mode_translate(currd) && !is_hardware_domain(currd) &&
>> +         !arch_refcounts_p2m() )
>>           return -EACCES;
> I guess the hook may want naming differently, as both prior parts of
> the condition should be needed only on the x86 side, and there (for
> PV) there's no p2m involved in the refcounting. Maybe
> arch_acquire_resource_check()? And then the comment wants moving into
> the x86 hook as well. You may want to consider leaving a more generic
> one here...

ok, again, I am fine with the name). Will follow everything suggested 
above.

-- 
Regards,

Oleksandr Tyshchenko


