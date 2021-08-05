Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0470F3E1D90
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 22:49:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164586.300878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBkIX-000384-Un; Thu, 05 Aug 2021 20:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164586.300878; Thu, 05 Aug 2021 20:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBkIX-00035K-Rd; Thu, 05 Aug 2021 20:49:01 +0000
Received: by outflank-mailman (input) for mailman id 164586;
 Thu, 05 Aug 2021 20:49:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NEHI=M4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mBkIV-00035E-V3
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 20:49:00 +0000
Received: from mail-lf1-x12e.google.com (unknown [2a00:1450:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59be7848-5179-4eb9-bd59-ef3482ab0389;
 Thu, 05 Aug 2021 20:48:55 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id g13so13591486lfj.12
 for <xen-devel@lists.xenproject.org>; Thu, 05 Aug 2021 13:48:55 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id w16sm619485lfq.257.2021.08.05.13.48.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 13:48:52 -0700 (PDT)
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
X-Inumbo-ID: 59be7848-5179-4eb9-bd59-ef3482ab0389
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=XfTpA3B2yYCf5uWgmwpWB79UPwcJ0TZiJ6prwy994vg=;
        b=W45hbX4jVP9pdAViCi+xWKK2eGFFgbgZ5cXL0/RWLDJxxNzd98yZtOQzVyE4iaRA8k
         1BlA14pf/CHyrC2TQlVkXuE9eQ49d649FREDXEK0nUtm7gt6UOZSxuedHTVEM/iLkwI5
         FfWAFo7BzWRWP7fdjkaaTvkX6a5+UfDKnC3mjgmvCKbsu80Oz9sCUuLn45iLiZsCBV2Q
         I4HoZ/pSkFCLF3Zjjua1bEgjrpSKZiLhQpiFccS9NDNOFUtul7TtKUi/TuKOjPWHasz6
         WW1N5R4ItzweBZJf53FwF1t8ge/U9jBL0ZyG/BTxZwQfWXHBCAvEc2JfvZeJJGM+FC1D
         1KIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=XfTpA3B2yYCf5uWgmwpWB79UPwcJ0TZiJ6prwy994vg=;
        b=axta9jGBbeimP7JPVKnFXcxX3JUGbk+v0wm8aiqqf0qMfNhtGWOYb1usgkQccJMyok
         Cl0M7BO2eLe0E/OZb4XLL0ztGAac3uoA/uqISgAdbMzH56acGXaEvSHPycwsNRhICqm3
         ilcr1PBjQ3MUteECAFwT6DjfdAOkIH7L+A0qwdoYi4iHRgc2z8jeDGiHEP58eVjif/an
         Xe58smbuQKud6cVmfkl5kId/LWzU4cux4BBl2Az8FMOc48QBp1/da0s50kun93zQYPOp
         tBm5s3aX5mcySI40O82+kCCfH0tONPrs2YFs4sOBGeu/UEWz6+zyCYp2BL7aMLdd2AnV
         OoLg==
X-Gm-Message-State: AOAM532PsaufVWWXe4TqNDkSeCigaKwchnhv4yGG0NIgGqaNrvknLJG3
	5bwCsJtEAZiZp+3QAGflCt0=
X-Google-Smtp-Source: ABdhPJxno1PBq25O6PSVxErNOwR7m6PnazZyv6Wsp1e/xgi7hEMAAYOlRpmFoU1MWins7IDJGYtxgw==
X-Received: by 2002:a19:8c07:: with SMTP id o7mr5017120lfd.637.1628196532975;
        Thu, 05 Aug 2021 13:48:52 -0700 (PDT)
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
 <80fafc01-f063-d6e5-1c08-7ad64550310c@citrix.com>
 <e8db3021-78a5-e040-a70b-62ca5b500149@xen.org>
 <4de5ed21-379e-b618-44c8-924d88b1a519@citrix.com>
 <bbc7f597-5249-20a0-cac9-13f594268299@xen.org>
 <6a633f4e-13e0-4a2b-cf6e-35ef90ae977c@gmail.com>
 <alpine.DEB.2.21.2107301630510.10122@sstabellini-ThinkPad-T480s>
 <f6b2e6c6-bf58-960f-4a09-f05ebcf1f566@gmail.com>
 <5643d414-0b76-74a4-2c37-c7a99338d547@gmail.com>
 <c83378af-4d3b-9256-0e0d-f88c43c6de2f@xen.org>
 <775a2c0b-fbcc-db6d-c2a1-4ad350448c92@gmail.com>
 <cb1c8fd4-a4c5-c18e-c8db-f8e317d95526@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <4e7c7229-82d7-2de2-aafe-d9f6a172c169@gmail.com>
Date: Thu, 5 Aug 2021 23:48:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cb1c8fd4-a4c5-c18e-c8db-f8e317d95526@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 05.08.21 20:25, Julien Grall wrote:
> Hi Oleksandr,

Hi Julien


>
> On 05/08/2021 15:52, Oleksandr wrote:
>>
>> On 05.08.21 01:00, Julien Grall wrote:
>>>
>>>
>>> On 04/08/2021 21:56, Oleksandr wrote:
>>>>
>>>> Hi Julien, Stefano.
>>>
>>> Hi Oleksandr,
>>
>>
>> Hi, Julien
>>
>>
>> Thank you for the prompt reply and explanations.
>>
>>
>>>
>>>>
>>>> On 02.08.21 22:12, Oleksandr wrote:
>>>> I have done some experiments with Xen and toolstack according to 
>>>> the discussion above. So, I re-used DTB to pass a safe range to the 
>>>> domain. For the range I borrowed some space from the second RAM bank.
>>>>
>>>> -#define GUEST_RAM1_BASE   xen_mk_ullong(0x0200000000) /* 1016GB of 
>>>> RAM @ 8GB */
>>>> -#define GUEST_RAM1_SIZE   xen_mk_ullong(0xfe00000000)
>>>> +#define GUEST_RAM1_BASE   xen_mk_ullong(0x0200000000) /* 888GB of 
>>>> RAM @ 8GB */
>>>> +#define GUEST_RAM1_SIZE   xen_mk_ullong(0xDE00000000)
>>>> +
>>>
>>> I am a bit split with reducing the amount of RAM. On one hand large 
>>> guest is not unheard on the server side (at least in the x86 world). 
>>> On the other hand, I am not aware of anyone using Xen on Arm in such 
>>> setup.
>>>
>>> So technically this will be a regression, but it may be OK.
>>
>> I got it.
>>
>>
>>>
>>>
>>> Regarding the range, this will be a problem as Xen configure the 
>>> number of the IPA bits based on the PA bits. The lowest possible 
>>> address space ize on 64-bit is 4GB.
>>>
>>> From my understanding, this is because the number of IPA bits 
>>> supported is contrained by the PA bits. So the position and the size 
>>> of the region
>>> would need to depend on the P2M configuration.
>>
>> Indeed, I missed these bits that IPA bits on Arm64 might be < 40 bit, 
>> I remember, we select p2m_ipa_bits in setup_virt_paging() depending 
>> on pabits, moreover the p2m_ipa_bits might be even restricted by some 
>> external entity (IOMMU, if P2M is shared).
>>
>>
>>>
>>> For simplicity, this could be the last few X bytes of the supported 
>>> address space.
>> ok, agree. To summarize, so it sounds like we can't use the fixed 
>> safe range as in my example, it must be variable. Well, I hope, we 
>> will be able to achieve this without reducing the total amount of 
>> domain RAM in front (GUEST_RAM1_SIZE). After all, we know the IPA 
>> size and the domain RAM in advance, so we certainly can choose the 
>> start and size of the range. In case, we won't be able to find a 
>> suitable large chunk (for example, when IPA bits = 32, and domain has 
>> a lot of RAM assigned and as the result - almost all address space 
>> below 4GB is in use), we won't expose a safe range to a domain at 
>> all, and domain will just fall back to use real pages instead 
>> (actually, how it currently behaves on Arm).
>
> I think it would be fine for a first approach. We can refine it in the 
> future. What matters is that we correctly define the binding/hypercall.

ok


>
>>
>> A side note: we would likely need the toolstack (that generates 
>> device-tree for guests) to query IPA size, or similar.
>
> I think we can use XEN_SYSCTL_* (or possibly hypfs) for that.

probably yes, need to investigate


>
>
>>>
>>>
>>> For 32-bit domain, we also need to make sure the address is usable 
>>> for domain short page tables (not too long ago Debian was shipping 
>>> the kernel with them rather than LPAE). I haven't yet checked what's 
>>> the limit here.
>>
>> Hmm, I didn't take this use-case into the account. So, I assume we 
>> need the safe range to be located below 4GB if is_32bit_domain() 
>> returns true.
>
> Yes. Or we can say that if you are using a 32-bit domain then we don't 
> (yet) support a safe range for range.

yes, as a variant


>
>>> So we would need some heuristic to decide whether to stole some RAM 
>>> or use the safe space.
>>> Another possibility would be to add a new compatible in the DT that 
>>> indicates the region is "big" enough.
>> I like the last idea, did you perhaps mean new property (optional) 
>> rather than new compatible? Let's say "xen, safe-range" or "xen, 
>> extended-regions"  ...
>
> I actually meant adding an extra compatible because this is 
> technically a change of the binding (even though it is backward 
> compatible).
>
> Although, I would be OK with the property. You may first want to ask 
> the Device-Tree folks how they expect a binding to be extended in a 
> backward compatible way.

makes sense, will clarify these bits


>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


