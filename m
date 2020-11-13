Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F07012B1B4D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 13:45:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26489.54889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdYSA-0008Us-0q; Fri, 13 Nov 2020 12:45:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26489.54889; Fri, 13 Nov 2020 12:45:21 +0000
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
	id 1kdYS9-0008UT-TH; Fri, 13 Nov 2020 12:45:21 +0000
Received: by outflank-mailman (input) for mailman id 26489;
 Fri, 13 Nov 2020 12:45:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVgh=ET=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kdYS8-0008UO-Da
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 12:45:20 +0000
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec49f380-ac12-4d95-ac20-278e2498d20a;
 Fri, 13 Nov 2020 12:45:19 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id y16so10535011ljk.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2020 04:45:19 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id l13sm1664007lje.45.2020.11.13.04.45.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 04:45:17 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HVgh=ET=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kdYS8-0008UO-Da
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 12:45:20 +0000
X-Inumbo-ID: ec49f380-ac12-4d95-ac20-278e2498d20a
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ec49f380-ac12-4d95-ac20-278e2498d20a;
	Fri, 13 Nov 2020 12:45:19 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id y16so10535011ljk.1
        for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2020 04:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=9A77taBXDZYnMNe3tVPQpKU4WTI8Ayb7eOJw2ygMD/c=;
        b=Ba74xT4oARdd0hV7UgyZDF/aaPzWhYdwwwhz4CNwx57xjKT1hoMPmymZHVzrzu6R6v
         5GyNG7l92FUlWj8sgvVj5W2kyxXmhduxscPgotEF3g6FKWMMetGJ93gRjKXUsMv7/5nR
         lIQe5i7WyWkWFBXNbbijTbwNJ1knaRmyVQwvXAJVUBZSG1gb2Y++sb8ieUeAUQi65CMV
         IDSJBTklthHRH9rNHgNmP7B/aNDZhxe7sL4gQcOy3bxlg89pQZ+683iCthrNIh5d3oLo
         Gouvq+fAboHLVK343SlSdwOMshX1Aezcoel73NldGz5rDCza9QrVu8oEIQrHbEU/q4RT
         DH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=9A77taBXDZYnMNe3tVPQpKU4WTI8Ayb7eOJw2ygMD/c=;
        b=OIZc2jTUkcpEYRWYXN1fWYc4UoSRgGpqWq6rX0pE78spbgb0Ns7149MgvRsL7aSNaA
         qOGES5nADyFn1DrKg0wl01nZtHIbUEMM39NXobRYQMc4Hoz5dnDKMk2+5gr2LulbSciQ
         se3exbiU8hm1Ll0CnEBLTEdAgjbwrWn2mMd4G4wpa+guMvjHymzTUdb69/nY0qRcmD5Q
         Fi5SpoltdyGz6hzHFc3O08P7cOtgnT5sSFWx9BJA7oecdoy+Kbil3D+Mn4htwzesJqrI
         Hv6v+mevcwW9+0O3860lQdmMLRYDvFE8fGmicG5os58CD4rEwU7uzaH8+KEFtyTWGbqz
         C3Pg==
X-Gm-Message-State: AOAM531w6EwDYYWNfvYuiywXQuWLUo/GQ7+VXSXGdPPeBWgLs2yRMQy9
	tmo6rcfZI88jXG4tuMx+YqBNoRMJtbCRhw==
X-Google-Smtp-Source: ABdhPJyGmfL/0ZSn8C09d+30hH5rvIXoTBjeDCMiKPS125Ah7XNhtV910eEjpHB0x1arYnrhXjVeqw==
X-Received: by 2002:a2e:8ec4:: with SMTP id e4mr979318ljl.135.1605271517975;
        Fri, 13 Nov 2020 04:45:17 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id l13sm1664007lje.45.2020.11.13.04.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2020 04:45:17 -0800 (PST)
Subject: Re: [PATCH V2 01/23] x86/ioreq: Prepare IOREQ feature for making it
 common
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-2-git-send-email-olekstysh@gmail.com>
 <61ea02e0-bdd4-5a0a-dd6f-b22e806e6d1e@suse.com>
 <cd16e1f2-849d-ec12-3325-382b8f6689ff@gmail.com>
 <e08459d9-dd0a-7875-5d12-d374c69fe775@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <9162290b-94c5-295e-3133-71284cd617e1@gmail.com>
Date: Fri, 13 Nov 2020 14:45:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e08459d9-dd0a-7875-5d12-d374c69fe775@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 13.11.20 13:20, Jan Beulich wrote:

Hi Jan.

> On 13.11.2020 12:09, Oleksandr wrote:
>> On 12.11.20 12:58, Jan Beulich wrote:
>>> On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
>>>> @@ -855,7 +841,7 @@ int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
>>>>    
>>>>        domain_pause(d);
>>>>    
>>>> -    p2m_set_ioreq_server(d, 0, s);
>>>> +    arch_hvm_destroy_ioreq_server(s);
>>> Iirc there are plans to rename hvm_destroy_ioreq_server() in the
>>> course of the generalization. If so, this arch hook would imo
>>> better be named following the new scheme right away.
>> Could you please clarify, are you speaking about the plans discussed there
>>
>> "[PATCH V2 12/23] xen/ioreq: Remove "hvm" prefixes from involved
>> function names"?
>>
>> Copy text for the convenience:
>> AT least some of the functions touched here would be nice to be
>> moved to a more consistent new naming scheme right away, to
>> avoid having to touch all the same places again. I guess ioreq
>> server functions would be nice to all start with ioreq_server_
>> and ioreq functions to all start with ioreq_. E.g. ioreq_send()
>> and ioreq_server_select().
>>
>> or some other plans I am not aware of?
>>
>>
>> What I really want to avoid with IOREQ enabling work is the round-trips
>> related to naming things, this patch series
>> became quite big (and consumes som time to rebase and test it) and I
>> expect it to become bigger.
>>
>> So the arch_hvm_destroy_ioreq_server() should be
>> arch_ioreq_server_destroy()?
> I think so, yes. If you want to avoid doing full patches, how
> about you simply list the functions / variables you plan to
> rename alongside the intended new names? Would likely be easier
> for all involved parties.
I think it is a good idea. I will prepare a list once I analyze all new 
comments to this series.
As I understand that only global IOREQ functions need renaming according 
to the new scheme,
local ones can be left as is but without "hvm" prefixes of course?



>
>>>> @@ -1215,7 +1153,7 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
>>>>        struct hvm_ioreq_server *s;
>>>>        unsigned int id;
>>>>    
>>>> -    if ( !relocate_portio_handler(d, 0xcf8, 0xcf8, 4) )
>>>> +    if ( !arch_hvm_ioreq_destroy(d) )
>>> There's no ioreq being destroyed here, so I think this wants
>>> renaming (and again ideally right away following the planned
>>> new scheme).
>> Agree that no ioreq being destroyed here. Probably
>> ioreq_server_check_for_destroy()?
>> I couldn't think of a better name.
> "check" implies no change (and d ought to then be const struct
> domain *). With the containing function likely becoming
> ioreq_server_destroy_all(), arch_ioreq_server_destroy_all()
> would come to mind, or arch_ioreq_server_prepare_destroy_all().

ok, agree


>
>>>> +static inline int hvm_map_mem_type_to_ioreq_server(struct domain *d,
>>>> +                                                   ioservid_t id,
>>>> +                                                   uint32_t type,
>>>> +                                                   uint32_t flags)
>>>> +{
>>>> +    struct hvm_ioreq_server *s;
>>>> +    int rc;
>>>> +
>>>> +    if ( type != HVMMEM_ioreq_server )
>>>> +        return -EINVAL;
>>>> +
>>>> +    if ( flags & ~XEN_DMOP_IOREQ_MEM_ACCESS_WRITE )
>>>> +        return -EINVAL;
>>>> +
>>>> +    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
>>>> +
>>>> +    s = get_ioreq_server(d, id);
>>>> +
>>>> +    rc = -ENOENT;
>>>> +    if ( !s )
>>>> +        goto out;
>>>> +
>>>> +    rc = -EPERM;
>>>> +    if ( s->emulator != current->domain )
>>>> +        goto out;
>>>> +
>>>> +    rc = p2m_set_ioreq_server(d, flags, s);
>>>> +
>>>> + out:
>>>> +    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
>>>> +
>>>> +    if ( rc == 0 && flags == 0 )
>>>> +    {
>>>> +        struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>> I realize I may be asking too much, but would it be possible if,
>>> while moving code, you made simple and likely uncontroversial
>>> adjustments like adding const here? (Such adjustments would be
>>> less desirable to make if they increased the size of the patch,
>>> e.g. if you were touching only nearby code.)
>> This function as well as one located below won't be moved to this header
>> for the next version of patch.
>>
>> ok, will add const.
> Well, if you don't move the code, then better keep the diff small
> and leave things as they are.

ok, in case I will have to move that code for any reason, I will take 
suggestions into the account.

-- 
Regards,

Oleksandr Tyshchenko


