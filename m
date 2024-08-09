Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DB194D0CD
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 15:05:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774752.1185182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scPJ3-0001CB-7v; Fri, 09 Aug 2024 13:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774752.1185182; Fri, 09 Aug 2024 13:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scPJ3-0001AZ-4z; Fri, 09 Aug 2024 13:05:21 +0000
Received: by outflank-mailman (input) for mailman id 774752;
 Fri, 09 Aug 2024 13:05:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TQMG=PI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1scPJ1-00013P-V8
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 13:05:19 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0732c9bd-5650-11ef-bc04-fd08da9f4363;
 Fri, 09 Aug 2024 15:05:19 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-58ef19aa69dso2069448a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Aug 2024 06:05:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bbb2bf96f5sm1518564a12.14.2024.08.09.06.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Aug 2024 06:05:18 -0700 (PDT)
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
X-Inumbo-ID: 0732c9bd-5650-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723208718; x=1723813518; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BEqg5SLuQGxr6NW9TobcbXN7WqjttX+TdB+5hbj6Sy8=;
        b=GGzfe4WdXgPmbqQzyN8mqjGaXWGIgaZez08K0PYwqo30n8oqH81pfrfxpje39CBZzU
         XI5B6sqSLyqYqGNdaHnaLucT9/3+tNuS4WjJrkfQanCdHWmt6VCtYyo7Pwjbz5neW73X
         zuL09zossnh7issH9fvXbebk65I6DW6wvz3zgW5e4v4taX/WGoKcP5Ten4p/nJG4fYAO
         DcQmgs3gcTRurGcTL2s+47PwyYf85TQm2M+TpwT+efO5WY1qS6OCk3tApb9RO+Uh0ec2
         5NFEixccWm05Z/31C3/Aep3DXMiB37UnIyLheYs3b8r8gxy6gUpGCn9Hrm+rSStZ74xu
         EegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723208718; x=1723813518;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BEqg5SLuQGxr6NW9TobcbXN7WqjttX+TdB+5hbj6Sy8=;
        b=OPKZNlxWU1+2n3M66mHHkoW1FrXwZTLoEMBLPQVlvOkQUQpW0d4RIx+EHPjz1tsdeT
         RjN2hb9pRBRWfNpBgMfkGncOu1AGvO8tOmczrd3Qi9ogdCRn9tcEa+f9jh+yQTMH76Nm
         cF4pznrstY4ELNOcODKe5etYQjoxYoHKcJSmKH33V10R+bybhJI6c4Ksh9rGkeExsA2z
         cjafYuhBJqHJAFfSz61y8UDPGgRkfHiei5s5lHz6sIyLgHLufYmjYfSQzyQ+QSdcCzIV
         aDio10Kf/BHxZDCkap2eq+goRfNS4thzfmsSwXWl84/U4j98CtF04cpWHp45H7pewyvS
         +++w==
X-Forwarded-Encrypted: i=1; AJvYcCUOrkFBo2PlSlHKLKKC9SprbBAecqR554cR0KzHiahak97PLVhEjnbjuiN+TmZH4cfOrDlkmByU+rU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLszsQrRL2Ul8s9LTPuyJEe7Ggrbzzln96mc+VEpr7IWF3x6Hj
	+ZsST7s0EIQcwfnB1SiLZVk2h4gyOX0BWcXg2ja/31wGpoc7u14BFALMIxAIbq6wrGNqaGBh60U
	=
X-Google-Smtp-Source: AGHT+IFA3dmlp2kKsleNkpSo5ltZZUCAwn/Q4IKIMoyS4bGXioxVKcUNAwf8tLM622zrmi7WwWj50g==
X-Received: by 2002:a05:6402:40d2:b0:5ba:cb82:a776 with SMTP id 4fb4d7f45d1cf-5bd0a535cefmr1137750a12.9.1723208718268;
        Fri, 09 Aug 2024 06:05:18 -0700 (PDT)
Message-ID: <85a9263b-24cf-47ba-ba83-c2c988dee5c2@suse.com>
Date: Fri, 9 Aug 2024 15:05:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/msi: fix locking for SR-IOV devices
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20240807052011.582099-1-stewart.hildebrand@amd.com>
 <1b0475fe-4371-4bf7-a469-aa580648f210@suse.com>
 <62523c87-9c93-4b71-a71b-e852fce3136d@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <62523c87-9c93-4b71-a71b-e852fce3136d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.08.2024 06:09, Stewart Hildebrand wrote:
> On 8/7/24 11:21, Jan Beulich wrote:
>> On 07.08.2024 07:20, Stewart Hildebrand wrote:
>>> --- a/xen/arch/x86/msi.c
>>> +++ b/xen/arch/x86/msi.c
>>> @@ -662,7 +662,8 @@ static int msi_capability_init(struct pci_dev *dev,
>>>      return 0;
>>>  }
>>>  
>>> -static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
>>> +static u64 read_pci_mem_bar(struct pci_dev *pdev, u16 seg, u8 bus, u8 slot,
>>> +                            u8 func, u8 bir, int vf)
>>>  {
>>
>> First I thought this was a leftover from the earlier version. But you need
>> it for accessing the vf_rlen[] field. Yet that's properly misleading,
>> especially when considering that the fix also wants backporting. What pdev
>> represents here changes. I think you want to pass in just vf_rlen (if we
>> really want to go this route; I'm a little wary of this repurposing of the
>> field, albeit I see no real technical issue).
> 
> I like your idea below of using a struct, so I'll pass a pointer to the
> new struct.
> 
>> Of course there's a BUILD_BUG_ON() which we need to get creative with, in
>> order to now outright drop it (see also below).
> 
> I suppose this BUILD_BUG_ON() is redundant with the one in
> pci_add_device()...

"Redundant" can be positive or negative. Your response sounds as if you
thought one could be dropped, yet I think we want them in both places.

>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -654,6 +654,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>      const char *type;
>>>      int ret;
>>>      bool pf_is_extfn = false;
>>> +    uint64_t vf_rlen[6] = { 0 };
>>
>> The type of this variable needs to be tied to that of the struct field
>> you copy to/from. Otherwise, if the struct field changes type ...
>>
>>> @@ -664,7 +665,10 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>                              PCI_SBDF(seg, info->physfn.bus,
>>>                                       info->physfn.devfn));
>>>          if ( pdev )
>>> +        {
>>>              pf_is_extfn = pdev->info.is_extfn;
>>> +            memcpy(vf_rlen, pdev->vf_rlen, sizeof(pdev->vf_rlen));
>>
>> ... there'll be nothing for the compiler to tell us. Taken together with
>> the BUILD_BUG_ON() related remark further up, I think you want to
>> introduce a typedef and/or struct here to make things properly typesafe
>> (as then you can avoid the use of memcpy()).
> 
> Here's what I'm thinking:
> 
> struct vf_info {
>     uint64_t vf_rlen[PCI_SRIOV_NUM_BARS];
>     unsigned int refcnt;
> };
> 
> struct pci_dev {
>     ...
>     struct vf_info *vf_info;
>     ...
> };

I don't (yet) see the need for refcnt, and I also don't see why it wouldn't
continue to be embedded in struct pci_dev. Specifically ...

>> An alternative approach might be to add a link from VF to PF, while
>> making sure that the PF struct won't be de-allocated until all its VFs
>> have gone away. That would then also allow to eliminate the problematic
>> pci_get_pdev().
> 
> I think I can add a link to a new reference-counted struct with just the
> info needed (see the proposed struct above).

... I think having a link from VF to its PF may turn out helpful in the
future for other purposes, too.

Jan

