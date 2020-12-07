Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4582D1B9B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 22:07:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47031.83268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmNiY-0007QT-UG; Mon, 07 Dec 2020 21:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47031.83268; Mon, 07 Dec 2020 21:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmNiY-0007Q8-R8; Mon, 07 Dec 2020 21:06:46 +0000
Received: by outflank-mailman (input) for mailman id 47031;
 Mon, 07 Dec 2020 21:06:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=exIY=FL=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kmNiX-0007Q3-1S
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 21:06:45 +0000
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 928be4e6-ef8b-419a-9634-78f08e2146e8;
 Mon, 07 Dec 2020 21:06:44 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id a1so15270569ljq.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 13:06:44 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id p8sm2972818lfk.109.2020.12.07.13.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 13:06:41 -0800 (PST)
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
X-Inumbo-ID: 928be4e6-ef8b-419a-9634-78f08e2146e8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=KxM8MOM4A2fB4/dU/u5BsCDi/uBpr79q7L1Yi7hk8Ls=;
        b=qfPh2rBjzmDia+1DAgan33i+ywUAzQwSNAkvAafXnXjimGrO9VHR97kcqQ1SgSAP04
         0MvCA0GK+7zbY6UqaRnjSw+Uy0s9LKj629ZUYHkg8uyzQZtRG9oszj320kz/C35Ue+56
         AwwEXvnrnLeXTwUBtV6IRNxtNERrQYPMDaHd1XWNdlbpoomIEuNy9sL0WU3nLXeHKn6b
         flPZg1DN0zH+arkGc9Gyn9e3kcrlMa6/NOZ+Zu4nrCgDM2MTWC5Kxj7L7izhMG81xtg8
         EXN4GujQ48siXiFLimcIGwQa2IlmcfBTIty2lcmJDUh5jY1XcYayy2wg55Ya5pJlRpy3
         5F2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=KxM8MOM4A2fB4/dU/u5BsCDi/uBpr79q7L1Yi7hk8Ls=;
        b=EUBRGLzAaIr5s3oFLiwkcx0NwzNQBddaJYnWe1T1boN/20JAIF8pby7fM5tFMVgwbh
         7bJNcGFdl+gNryJ37yUrm8GNwc2I16MIaXYc567m2OqlTzpUbj6RBHsQF8r6JEKEv4JO
         PAYwS06bldOXQz358Q4RuXDh6B4DUVA0asfMszGnR+8SH9xe/K5l0YMhH1E0mZaoKkOA
         oX6WQ0NbWEWyHlwg2FUHP7DXMudKuzqUiIaQYc5ljliZj59uQFNSCSXD0whrVBLHQqmF
         dWYcs1sGMiiPp20WAlXanXQxuIkKOG51M3kp8aF/4IxpTNVvhCrLnqSRu8cVkUijIPYn
         JvIw==
X-Gm-Message-State: AOAM530k+vnw4kjE52K/Bz4IVc/LLta9Vq4U0uaPsjL7LfMDay096+Mm
	Fz2mh9JWaHCWDG0LzoDnTlrgV3R5WbzBCA==
X-Google-Smtp-Source: ABdhPJxmIIrI5WSLW8xVtTJIpCNZa3Qjq1yAURvQ3lIAwKCRYYB8y3pqTBWCiFmDGWQUM9jQGJ0FoQ==
X-Received: by 2002:a2e:8eda:: with SMTP id e26mr5201138ljl.272.1607375202906;
        Mon, 07 Dec 2020 13:06:42 -0800 (PST)
Subject: Re: [PATCH V3 10/23] xen/mm: Make x86's XENMEM_resource_ioreq_server
 handling common
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien.grall@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-11-git-send-email-olekstysh@gmail.com>
 <4f9a68ad-c663-d7a1-9194-4ad28958b077@suse.com>
 <39ee3665-48f2-334d-e7a0-2e1a17bccd23@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <a83ec541-53ad-491d-372d-3c3b182637a3@gmail.com>
Date: Mon, 7 Dec 2020 23:06:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <39ee3665-48f2-334d-e7a0-2e1a17bccd23@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 07.12.20 14:11, Jan Beulich wrote:

Hi Jan

> On 07.12.2020 12:35, Jan Beulich wrote:
>> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -4699,50 +4699,6 @@ int xenmem_add_to_physmap_one(
>>>       return rc;
>>>   }
>>>   
>>> -int arch_acquire_resource(struct domain *d, unsigned int type,
>>> -                          unsigned int id, unsigned long frame,
>>> -                          unsigned int nr_frames, xen_pfn_t mfn_list[])
>>> -{
>>> -    int rc;
>>> -
>>> -    switch ( type )
>>> -    {
>>> -#ifdef CONFIG_HVM
>>> -    case XENMEM_resource_ioreq_server:
>>> -    {
>>> -        ioservid_t ioservid = id;
>>> -        unsigned int i;
>>> -
>>> -        rc = -EINVAL;
>>> -        if ( !is_hvm_domain(d) )
>>> -            break;
>>> -
>>> -        if ( id != (unsigned int)ioservid )
>>> -            break;
>>> -
>>> -        rc = 0;
>>> -        for ( i = 0; i < nr_frames; i++ )
>>> -        {
>>> -            mfn_t mfn;
>>> -
>>> -            rc = hvm_get_ioreq_server_frame(d, id, frame + i, &mfn);
>>> -            if ( rc )
>>> -                break;
>>> -
>>> -            mfn_list[i] = mfn_x(mfn);
>>> -        }
>>> -        break;
>>> -    }
>>> -#endif
>>> -
>>> -    default:
>>> -        rc = -EOPNOTSUPP;
>>> -        break;
>>> -    }
>>> -
>>> -    return rc;
>>> -}
>> Can't this be accompanied by removal of the xen/ioreq.h inclusion?
>> (I'm only looking at patch 4 right now, but the renaming there made
>> the soon to be unnecessary #include quite apparent.)
> And then, now that I've looked at this patch as a whole,
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Great, thank you.

-- 
Regards,

Oleksandr Tyshchenko


