Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5609823CBC5
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 17:41:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3LXY-0002Zc-HP; Wed, 05 Aug 2020 15:41:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w8Yv=BP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k3LXW-0002ZT-Kx
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 15:41:14 +0000
X-Inumbo-ID: 5b68ace9-94fd-4f5a-9074-e3664a2af17e
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b68ace9-94fd-4f5a-9074-e3664a2af17e;
 Wed, 05 Aug 2020 15:41:13 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id s16so32988304ljc.8
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2020 08:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=XjzRB/do2UEi9u9BQ+A+eoj+qY0lKQjnu1Lpd4TAtLQ=;
 b=rIooioNCkecGI8MhRxR/LiQX0GqQjlO/pr8eJLRlaSTZ3WxTrLp6XGjOOODCdqnrfU
 vn/MSOGaCnJeogmzcVVyuRuOsfQSteYOdfRxaNJgRz5HYeaYfW8LyJBLFKcrFpFFU5is
 nvVBvkjRSh3LUUEJq+sD+hpljDbIbP0R1MyksJlwYe6zlZaRrDwSQZ6Euuz/8tQKIFMB
 eKlhPwxAZuY/EgZ/BGEOUuZ/zC23c7fISzjmT6sUuZwn7EgK56rfnZ9PPa68uh39DU65
 B6BO08gFpbmZ5kzP+SbyyJOWl613oewQlfHVImge5mwhlsY1m0J/nLWMsPdEojkh87LL
 znag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=XjzRB/do2UEi9u9BQ+A+eoj+qY0lKQjnu1Lpd4TAtLQ=;
 b=YuIhl5QKCoRGnQ7B//X1QVDKP8Os61iKfjpJgBfqrfyYbw7g1beLeNXwSKMkij2W0n
 Nph7+HqPNpzKC2TPfquA/5xV2gLgr/uQMbJU2CEe667NPHCMlJmMte33Ir44eKnDBEmv
 8/tEm2hk25kIc4gJ5VEeOscCdumteQop+gkaRqRdaD4tD4IMoiMML1MGU0Mb3pk9HOpb
 MdkIRyXiyMtJAosRvWQTWHTjfpg3TtwovLuupXahaO44YgqtrGHRpX4W3vMej2HT3Dnu
 ILWxPYF83RzeJs+wOlhDBqxylppo06RSrrLJ0JoWXEV6C9vwLUxDDWzAtRGUFbmWDLdK
 AkYg==
X-Gm-Message-State: AOAM5338OlQpXKJ55H3bq53STu2wqX8GlOhfmdXvKr7czsEZDdMIFn/o
 +PJE2zHnxMKIraleHQxK2aA=
X-Google-Smtp-Source: ABdhPJz6/lwZ56GLWgUNz4X/JDi1QcJE3dHZKsnXw1/FU2MYgICWZYKZQMvknvi/FAD5i6paFJJg4w==
X-Received: by 2002:a2e:844f:: with SMTP id u15mr1899611ljh.200.1596642072501; 
 Wed, 05 Aug 2020 08:41:12 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id l20sm1019453ljb.28.2020.08.05.08.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2020 08:41:11 -0700 (PDT)
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
To: Julien Grall <julien@xen.org>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2008041327110.5748@sstabellini-ThinkPad-T480s>
 <8e8a394c-bd2a-4444-9f4b-e022c59e0f81@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <ba4069dd-cc87-921b-6b52-dc51ff7bb13d@gmail.com>
Date: Wed, 5 Aug 2020 18:41:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8e8a394c-bd2a-4444-9f4b-e022c59e0f81@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 05.08.20 12:32, Julien Grall wrote:

Hi Julien.

> Hi Stefano,
>
> On 05/08/2020 00:22, Stefano Stabellini wrote:
>> On Mon, 3 Aug 2020, Oleksandr Tyshchenko wrote:
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> This patch makes possible to forward Guest MMIO accesses
>>> to a device emulator on Arm and enables that support for
>>> Arm64.
>>>
>>> Also update XSM code a bit to let DM op be used on Arm.
>>> New arch DM op will be introduced in the follow-up patch.
>>>
>>> Please note, at the moment build on Arm32 is broken
>>> (see cmpxchg usage in hvm_send_buffered_ioreq()) if someone
>>
>> Speaking of buffered_ioreq, if I recall correctly, they were only used
>> for VGA-related things on x86. It looks like it is still true.
>>
>> If so, do we need it on ARM? Note that I don't think we can get rid of
>> it from the interface as it is baked into ioreq, but it might be
>> possible to have a dummy implementation on ARM. Or maybe not: looking at
>> xen/common/hvm/ioreq.c it looks like it would be difficult to
>> disentangle bufioreq stuff from the rest of the code.
>
> We possibly don't need it right now. However, this could possibly be 
> used in the future (e.g. virtio notification doorbell).
>
>>> @@ -2275,6 +2282,16 @@ static void check_for_vcpu_work(void)
>>>    */
>>>   void leave_hypervisor_to_guest(void)
>>>   {
>>> +#ifdef CONFIG_IOREQ_SERVER
>>> +    /*
>>> +     * XXX: Check the return. Shall we call that in
>>> +     * continue_running and context_switch instead?
>>> +     * The benefits would be to avoid calling
>>> +     * handle_hvm_io_completion on every return.
>>> +     */
>>
>> Yeah, that could be a simple and good optimization
>
> Well, it is not simple as it is sounds :). handle_hvm_io_completion() 
> is the function in charge to mark the vCPU as waiting for I/O. So we 
> would at least need to split the function.
>
> I wrote this TODO because I wasn't sure about the complexity of 
> handle_hvm_io_completion(current). Looking at it again, the main 
> complexity is the looping over the IOREQ servers.
>
> I think it would be better to optimize handle_hvm_io_completion() 
> rather than trying to hack the context_switch() or continue_running().
>
> [...]
>
>>> diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
>>> index 5fdb6e8..5823f11 100644
>>> --- a/xen/include/asm-arm/p2m.h
>>> +++ b/xen/include/asm-arm/p2m.h
>>> @@ -385,10 +385,11 @@ static inline int set_foreign_p2m_entry(struct 
>>> domain *d, unsigned long gfn,
>>>                                           mfn_t mfn)
>>>   {
>>>       /*
>>> -     * NOTE: If this is implemented then proper reference counting of
>>> -     *       foreign entries will need to be implemented.
>>> +     * XXX: handle properly reference. It looks like the page may 
>>> not always
>>> +     * belong to d.
>>
>> Just as a reference, and without taking away anything from the comment,
>> I think that QEMU is doing its own internal reference counting for these
>> mappings.
>
> I am not sure how this matters here? We can't really trust the DM to 
> do the right thing if it is not running in dom0.
>
> But, IIRC, the problem is some of the pages doesn't belong to do a 
> domain, so it is not possible to treat them as foreign mapping (e.g. 
> you wouldn't be able to grab a reference). This investigation was done 
> a couple of years ago, so this may have changed in recent Xen.
>
> As a side note, I am a bit surprised to see most of my original TODOs 
> present in the code. What is the plan to solve them?
The plan is to solve most critical TODOs in current series, and rest in 
follow-up series if no objections of course. Any pointers how to solve 
them properly would be much appreciated. Unfortunately, now I have a 
weak understanding how they should be fixed. I see at least 3 major TODO 
here:

1. handle properly reference in set_foreign_p2m_entry()
2. optimize handle_hvm_io_completion()
3. hande properly IO_RETRY in try_fwd_ioserv()


-- 
Regards,

Oleksandr Tyshchenko


