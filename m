Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3160B3FAE66
	for <lists+xen-devel@lfdr.de>; Sun, 29 Aug 2021 22:29:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174801.318648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKRQ7-0005Lb-K5; Sun, 29 Aug 2021 20:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174801.318648; Sun, 29 Aug 2021 20:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKRQ7-0005Jn-Fh; Sun, 29 Aug 2021 20:28:47 +0000
Received: by outflank-mailman (input) for mailman id 174801;
 Sun, 29 Aug 2021 20:28:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K/AL=NU=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mKRQ5-0005Jh-Pn
 for xen-devel@lists.xenproject.org; Sun, 29 Aug 2021 20:28:45 +0000
Received: from mail-lf1-x12e.google.com (unknown [2a00:1450:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e031e5c-bfc6-417d-a325-acb49ea9a2fc;
 Sun, 29 Aug 2021 20:28:44 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id p38so27090327lfa.0
 for <xen-devel@lists.xenproject.org>; Sun, 29 Aug 2021 13:28:44 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z7sm1199020lft.302.2021.08.29.13.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Aug 2021 13:28:43 -0700 (PDT)
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
X-Inumbo-ID: 6e031e5c-bfc6-417d-a325-acb49ea9a2fc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=TiKbtZCv4v4SvEda4pOsu0rPlUdNNxg+UWnLpLhaMM4=;
        b=RIPXMygp0YEPellSN06PjVPxgLZ/1BqXPO5T0DDt4vLi4GuSgJLxdhaYKCGmaJda8N
         jJ92jKczXZ2Wedhmbt4U8SgIyZshIeE2iiNGEwP6KP6JlgsGiXDQPQsU8viCuDlA3kOa
         eWn0wvTuhs2UPN4bG9JjPtNF/FPUQDTDTTiq9y/M4hpMhFYXpFb5RMVaB5Mee2cIe7+S
         sW7c5VznprntJRUKT5cR2U2uoHqDFYCberhO8wlDCJ9MtvQ0GPWwMP7iasXPLDAezEKj
         hHtjtms3V+JxiuNG1sPifA3i1Utu+8u/arjz02C6++wW9D8CzgPL6EsDSLbek63MEUzx
         PSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=TiKbtZCv4v4SvEda4pOsu0rPlUdNNxg+UWnLpLhaMM4=;
        b=bm7OssqIjy8PqJq/3v37cCzsllAbH9DZ24eskZEMv6BH48rv/x+GWnurY9Yl6hr8ir
         ddTswMgERY6EtTqVLw2v7SzcMQP4ZQc5fh25VjKky2SwE2c2HnsPpJAoBpIF7p2Jz2lf
         AzSMnVdxcitw1sUJKYSNdBAQr95G+6nhjPVsvnCNlW14wbeGf8bU/jep9lNiTBIeIQcn
         gYfLftvx15a+5voUQwyOl7s+mNaSIna1iqt84lzsX4uhaDY7rFYU6EaTO2rUCn+cq08J
         8yJsjhZw8zioRFylwSQSGYS7i756A9CdBCjrrgTiM4Fey/3KcB5R/PdcwZIuXta+vFqW
         azFw==
X-Gm-Message-State: AOAM530xvjllgC/DAkiBAsndy2nuTR2jPwft0hsY69Md43rcvjtRqH/W
	AjXphqHuUUtXcJyaA6e3kXaeOvfZNas=
X-Google-Smtp-Source: ABdhPJz81DRk4JAEMeTX8fZU2j8tg8uRKTWvuoz2rlbFIHq8YNLCEF6t/1YggrMcCz7QV5YhyNSCgg==
X-Received: by 2002:a05:6512:10cc:: with SMTP id k12mr14287337lfg.410.1630268923530;
        Sun, 29 Aug 2021 13:28:43 -0700 (PDT)
Subject: Re: [RFC PATCH] xen: Introduce arch specific field to
 XEN_SYSCTL_physinfo
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <1628897304-20793-1-git-send-email-olekstysh@gmail.com>
 <908e2d59-41f0-3bad-6030-b2889d9c5cc2@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <8c622f4f-1931-3e2c-4f6e-9b832e8e435e@gmail.com>
Date: Sun, 29 Aug 2021 23:28:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <908e2d59-41f0-3bad-6030-b2889d9c5cc2@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 16.08.21 10:33, Jan Beulich wrote:

Hi Jan

Sorry for the late response.

> On 14.08.2021 01:28, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> We need to pass info about maximum supported address space size
>> to the toolstack on Arm in order to properly calculate the base
>> and size of the safe range for the guest. Use p2m_ipa_bits variable
>> which purpose is to hold the bit size of IPAs in P2M tables.
> What is "the safe range"?

It is unallocated (unused) address space which could be safely used by 
domain for foreign/grant mappings on Arm, I will update description.


>
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -332,6 +332,11 @@ struct xen_arch_domainconfig {
>>        */
>>       uint32_t clock_frequency;
>>   };
>> +
>> +struct arch_physinfo {
>> +    /* Holds the bit size of IPAs in p2m tables. */
>> +    uint32_t p2m_ipa_bits;
>> +};
>>   #endif /* __XEN__ || __XEN_TOOLS__ */
>>   
>>   struct arch_vcpu_info {
>> --- a/xen/include/public/arch-x86/xen.h
>> +++ b/xen/include/public/arch-x86/xen.h
>> @@ -346,6 +346,8 @@ typedef struct xen_msr_entry {
>>   } xen_msr_entry_t;
>>   DEFINE_XEN_GUEST_HANDLE(xen_msr_entry_t);
>>   
>> +struct arch_physinfo {
>> +};
>>   #endif /* !__ASSEMBLY__ */
> While the term "p2m_ipa_bits" surely isn't arch-agnostic, I wonder
> whether the expressed information is (the x86 equivalent being
> hap_paddr_bits, at a guess), and hence whether this really ought
> to live in an arch-specific sub-struct.

Well, on Arm we calculate the number of the IPA bits based on the number 
of PA bits when setting Stage 2 address translation.
I might mistake, but what we currently have on Arm is "ipa_bits == 
pa_bits". So, this means that information we need at the toolstack side 
isn't really arch-specific and
we could probably avoid introducing arch-specific sub-struct by suitable 
renaming the field (pa_bits, paddr_bits, whatever).

We could even name the field as hap_paddr_bits. Although, I don't know 
whether the hap_* is purely x86-ism, but I see there are several 
mentions in the common code (hap_pt_share, use_hap_pt, etc). Any 
suggestions?


> If indeed so, please name
> the struct in a name space clean way, i.e. add xen_ as prefix.

ok


>
> Also please retain a blank line before the #endif. I wonder whether
> on Arm you wouldn't want to add one at this occasion.

ok


>
> Jan
>
-- 
Regards,

Oleksandr Tyshchenko


