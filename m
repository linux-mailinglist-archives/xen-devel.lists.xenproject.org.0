Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 238292AF93D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 20:43:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25186.52781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcw1J-0000ze-FE; Wed, 11 Nov 2020 19:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25186.52781; Wed, 11 Nov 2020 19:43:05 +0000
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
	id 1kcw1J-0000zF-By; Wed, 11 Nov 2020 19:43:05 +0000
Received: by outflank-mailman (input) for mailman id 25186;
 Wed, 11 Nov 2020 19:43:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OH4G=ER=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kcw1I-0000zA-DP
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 19:43:04 +0000
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39b7e4b0-8fc1-4956-812d-093ce639c010;
 Wed, 11 Nov 2020 19:43:03 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id l2so4846974lfk.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 11:43:03 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k11sm311002lfd.3.2020.11.11.11.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 11:43:01 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=OH4G=ER=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kcw1I-0000zA-DP
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 19:43:04 +0000
X-Inumbo-ID: 39b7e4b0-8fc1-4956-812d-093ce639c010
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 39b7e4b0-8fc1-4956-812d-093ce639c010;
	Wed, 11 Nov 2020 19:43:03 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id l2so4846974lfk.0
        for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 11:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=vDP1cmeoiwTxokwoBpDIlL4fryW2mihfwGfG8UdiUHE=;
        b=lUOARjLtm2aeRDKxpoR+zdeH3oSDzzfJagaZsmhfQusKJgyD2nQ9TvtcN0gmoxwuMD
         /YbI6205pypbv9XyMD0CQnNOZJwtH6tN+bWep++mqXmqTjTvs9FNL1wcFvHmMzo7KWyB
         GlDxnm/04OYRrJe1MxpAaVaAHmsU2G1X/OF4ZUF8J8PNcTdxMQsE3MBBpukC65xKu7Jb
         JQr2Cu/klK7OgS36lU8JEOSjuVr2VhEiejNnaoGiuE3jAzUN3vJKJyqu3az9sSl0n2Wj
         s6QxyAwN+IfFosnkGeSKrg8rYTfHG1e8SAVj7Ol37fBND9azIWgl50NRD5ZlEm5xpENH
         A6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=vDP1cmeoiwTxokwoBpDIlL4fryW2mihfwGfG8UdiUHE=;
        b=bkqKrTp5KzAG7YsvvBeP1Mc1VPHGVV+9NYSlCepYQbJkixsVdjteEH5XhAu4R5Blhp
         zNIBd8tdsVl/EiUv/HxeUfTDTbh3/ilxxQF4SJinKvlvoG5LmIb9bu80GN5PdvNfOO/C
         +EVN/8loAmdx3oQhhURO+PIj9kHyNm6jn7d7J3HHsbG+Ivem6SPpPrDmiTRbEhFoPT+X
         YfnDUUUd+I7LK3cvSpU1H7g3pliEWBQ3R9U51GgD42jUs7S7AUWOViougdXTGyAMmHwq
         xNGrFWjqrAwaA0tOL+7reJ68MdZySzAZzm0VPRhNy3pVxQZyV30dKGO1YfK+vvQlgPco
         HOWA==
X-Gm-Message-State: AOAM532iQ/bi2zCLDsLRAX/tc0w/J094yqK8jru4FMNX5gqB/Nb2Vdm1
	go2lxUjWEcYHfhT5SUQyl3Q=
X-Google-Smtp-Source: ABdhPJxx1PmCCuzXxZ5EBPKvMp4Shjwf6RfBeAn9zC446i3FFVoijmnjJ5fe/PM2TvJSZXtDLLXQag==
X-Received: by 2002:ac2:598e:: with SMTP id w14mr6560281lfn.187.1605123782091;
        Wed, 11 Nov 2020 11:43:02 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id k11sm311002lfd.3.2020.11.11.11.43.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2020 11:43:01 -0800 (PST)
Subject: Re: [PATCH V2 21/23] xen/arm: Add mapcache invalidation handling
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-22-git-send-email-olekstysh@gmail.com>
 <cad29fdb-089a-541b-6c5b-538d96441714@suse.com>
 <b074eb70-a770-1f96-3d68-b06476b963ca@xen.org>
 <ecd5c3a5-e889-4fff-8145-3c129f619979@gmail.com>
 <2ff5e744-b48b-77b0-4e59-faa82951242b@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <c8234cc2-0fb6-3ad7-7149-de829d1b46af@gmail.com>
Date: Wed, 11 Nov 2020 21:42:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2ff5e744-b48b-77b0-4e59-faa82951242b@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 11.11.20 21:27, Julien Grall wrote:
> Hi Oleksandr,

Hi Julien.


>
> On 11/11/2020 00:03, Oleksandr wrote:
>>
>> On 16.10.20 11:41, Julien Grall wrote:
>>> On 16/10/2020 07:29, Jan Beulich wrote:
>>>> On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
>>>>> @@ -1067,7 +1068,14 @@ static int __p2m_set_entry(struct 
>>>>> p2m_domain *p2m,
>>>>>        */
>>>>>       if ( p2m_is_valid(orig_pte) &&
>>>>>            !mfn_eq(lpae_get_mfn(*entry), lpae_get_mfn(orig_pte)) )
>>>>> +    {
>>>>> +#ifdef CONFIG_IOREQ_SERVER
>>>>> +        if ( domain_has_ioreq_server(p2m->domain) &&
>>>>> +             (p2m->domain == current->domain) && 
>>>>> p2m_is_ram(orig_pte.p2m.type) )
>>>>> +            p2m->domain->qemu_mapcache_invalidate = true;
>>>>> +#endif
>>>>>           p2m_free_entry(p2m, orig_pte, level);
>>>>> +    }
>>>>
>>>> For all I have to say here, please bear in mind that I don't know
>>>> the internals of Arm memory management.
>>>>
>>>> The first odd thing here the merely MFN-based condition. It may
>>>> well be that's sufficient, if there's no way to get a "not present"
>>>> entry with an MFN matching any valid MFN. (This isn't just with
>>>> your addition, but even before.
>>> Invalid entries are always zeroed. So in theory the problem could 
>>> arise if MFN 0 used in the guest. It should not be possible on 
>>> staging, but I agree this should be fixed.
>>>
>>>>
>>>> Given how p2m_free_entry() works (or is supposed to work in the
>>>> long run), is the new code you add guaranteed to only alter leaf
>>>> entries?
>>>
>>> This path may also be called with tables. I think we want to move 
>>> the check in p2m_free_entry() so we can find the correct leaf type.
>>
>> Well, but inside p2m_free_entry() we don't have a new entry in order 
>> to check whether new MFN is actually different. An extra arg only 
>> comes to mind...
> Aside the recursive call, there are two users for p2m_free_entry():
>   - When we fail to shatter a superpage in OOM
>   - When the entry is replaced by an entry with a different base
>
> I wouldn't be too concerned to send spurious mapcache invalidation in 
> an error path. So I don't think you need to know the new entry.

Thank you for the clarification, sounds reasonable.


>
> What you need to know if the type of the leaf.

Yes, to check whether it is a RAM page.


-- 
Regards,

Oleksandr Tyshchenko


