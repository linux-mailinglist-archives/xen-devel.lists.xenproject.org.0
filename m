Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A232C94E873
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 10:23:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775393.1185610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdQJc-0000DI-TO; Mon, 12 Aug 2024 08:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775393.1185610; Mon, 12 Aug 2024 08:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdQJc-0000B3-QT; Mon, 12 Aug 2024 08:22:08 +0000
Received: by outflank-mailman (input) for mailman id 775393;
 Mon, 12 Aug 2024 08:22:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PyEi=PL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sdQJc-0000Ax-8q
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 08:22:08 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5f4dbc1-5883-11ef-bc05-fd08da9f4363;
 Mon, 12 Aug 2024 10:22:06 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a7a975fb47eso454253866b.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Aug 2024 01:22:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80bb11a56dsm209069966b.93.2024.08.12.01.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 01:22:05 -0700 (PDT)
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
X-Inumbo-ID: f5f4dbc1-5883-11ef-bc05-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723450926; x=1724055726; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V12cU1I7zzztQOzO3TirffQGIbp8+sEvf3rquR7zulM=;
        b=R/jmUEx7wfxHw2zFG/hmWaOUot0Cje0dLyUlB1GzYM663FjmZ6CII7jFhgiu9Ve0fD
         AD7jmMxKMZJ9mw4hpT8hiA7O1Vhk4r24GGN1wosE0rgT/RVY4BW5C1LJNbr83EcyJH+F
         SluyjIdqfCG0kYjnHeUGpRCIuyDcpY1s6CiiEVAcpHKt3ztTRJDMa69dXaNKtZ6b10sR
         CjQ3cFCstAvIzWr8ua841uabOc6jE8XaE/Wm2PB0YogJSi2rmKKn0yGPC7+szVfYgGpI
         vOD6+YmIdf2xpcakP4bhKWK21MrGDcWsN7eki6nwOjAQp8gUTEl5hzVreoIwQaCcaW6R
         1azw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723450926; x=1724055726;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V12cU1I7zzztQOzO3TirffQGIbp8+sEvf3rquR7zulM=;
        b=IRm6Z54VX8O+IdleZ0R5R8qVK7oR2Qcl/16wKXNlSuq89xmQJs3Gqry0yCUoQho1/B
         zm8F9bGiauh01oox3s1+bBPeeCxNIVsXtQ6mW89CSHMZ8EsMvb1FuQ1nG3if9wiJjtqv
         YL49c9WBum5fpZnrswrqwq4q1AzHXZTYNuEfez01piF1qAtyiE+UU3I2t2GRIWcP23Tg
         FR3VmIKg5DN8R0aTwAOwKJ328dNOOn+y1VXOCdK89n1PglE2AdRLNl8Vpd8xZnaMmDXQ
         Iof8FjZF7j47yCqWXpSB8RNnr8ug/EU0bB5EQzfwZ+MqoyFHwQObv9mEP17upXcr0mLg
         pQew==
X-Forwarded-Encrypted: i=1; AJvYcCXuYXbOvsr7rEHbeyWt6/ckYfC8y3ZcsDIVX/fdWrUEFew7Ah4rR6LYr5nRmizB4Aw27gZvamh7nzBJjfJFGvSKQPO3/NgU7WBoCFmixm4=
X-Gm-Message-State: AOJu0Yw/SxlbEm/T/dVVnzizGgVNNWHUASmhA657L+VUXwpiJisW3qeu
	00HjKJ+lq+fuA2JYVOaLp1+iNxPiQmkHYYYBoWM7G6aMES++XPQUPC1Ciepdwg==
X-Google-Smtp-Source: AGHT+IGYf4QnxrWOGmpE/BL7LY5pi34ZU+d1R5GzvMs0n/MF1vT1/qrxkY5x6cMHYhXLkt1mRgyrRw==
X-Received: by 2002:a17:907:f14a:b0:a77:c9cc:f96f with SMTP id a640c23a62f3a-a80aa556817mr605905566b.7.1723450925546;
        Mon, 12 Aug 2024 01:22:05 -0700 (PDT)
Message-ID: <26c5f44a-4083-4cbc-a3e8-13895a13df01@suse.com>
Date: Mon, 12 Aug 2024 10:22:07 +0200
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
 <85a9263b-24cf-47ba-ba83-c2c988dee5c2@suse.com>
 <7c28c7b2-0af0-4f9f-a171-5d8272254f9b@amd.com>
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
In-Reply-To: <7c28c7b2-0af0-4f9f-a171-5d8272254f9b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.08.2024 17:02, Stewart Hildebrand wrote:
> On 8/9/24 09:05, Jan Beulich wrote:
>> On 09.08.2024 06:09, Stewart Hildebrand wrote:
>>> On 8/7/24 11:21, Jan Beulich wrote:
>>>> On 07.08.2024 07:20, Stewart Hildebrand wrote:
>>>>> --- a/xen/arch/x86/msi.c
>>>>> +++ b/xen/arch/x86/msi.c
>>>>> @@ -662,7 +662,8 @@ static int msi_capability_init(struct pci_dev *dev,
>>>>>      return 0;
>>>>>  }
>>>>>  
>>>>> -static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
>>>>> +static u64 read_pci_mem_bar(struct pci_dev *pdev, u16 seg, u8 bus, u8 slot,
>>>>> +                            u8 func, u8 bir, int vf)
>>>>>  {
>>>>
>>>> First I thought this was a leftover from the earlier version. But you need
>>>> it for accessing the vf_rlen[] field. Yet that's properly misleading,
>>>> especially when considering that the fix also wants backporting. What pdev
>>>> represents here changes. I think you want to pass in just vf_rlen (if we
>>>> really want to go this route; I'm a little wary of this repurposing of the
>>>> field, albeit I see no real technical issue).
>>>
>>> I like your idea below of using a struct, so I'll pass a pointer to the
>>> new struct.
>>>
>>>> Of course there's a BUILD_BUG_ON() which we need to get creative with, in
>>>> order to now outright drop it (see also below).
>>>
>>> I suppose this BUILD_BUG_ON() is redundant with the one in
>>> pci_add_device()...
>>
>> "Redundant" can be positive or negative. Your response sounds as if you
>> thought one could be dropped, yet I think we want them in both places.
>>
>>>>> --- a/xen/drivers/passthrough/pci.c
>>>>> +++ b/xen/drivers/passthrough/pci.c
>>>>> @@ -654,6 +654,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>>>      const char *type;
>>>>>      int ret;
>>>>>      bool pf_is_extfn = false;
>>>>> +    uint64_t vf_rlen[6] = { 0 };
>>>>
>>>> The type of this variable needs to be tied to that of the struct field
>>>> you copy to/from. Otherwise, if the struct field changes type ...
>>>>
>>>>> @@ -664,7 +665,10 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>>>                              PCI_SBDF(seg, info->physfn.bus,
>>>>>                                       info->physfn.devfn));
>>>>>          if ( pdev )
>>>>> +        {
>>>>>              pf_is_extfn = pdev->info.is_extfn;
>>>>> +            memcpy(vf_rlen, pdev->vf_rlen, sizeof(pdev->vf_rlen));
>>>>
>>>> ... there'll be nothing for the compiler to tell us. Taken together with
>>>> the BUILD_BUG_ON() related remark further up, I think you want to
>>>> introduce a typedef and/or struct here to make things properly typesafe
>>>> (as then you can avoid the use of memcpy()).
>>>
>>> Here's what I'm thinking:
>>>
>>> struct vf_info {
>>>     uint64_t vf_rlen[PCI_SRIOV_NUM_BARS];
>>>     unsigned int refcnt;
>>> };
>>>
>>> struct pci_dev {
>>>     ...
>>>     struct vf_info *vf_info;
>>>     ...
>>> };
>>
>> I don't (yet) see the need for refcnt, and I also don't see why it wouldn't
>> continue to be embedded in struct pci_dev. Specifically ...
>>
>>>> An alternative approach might be to add a link from VF to PF, while
>>>> making sure that the PF struct won't be de-allocated until all its VFs
>>>> have gone away. That would then also allow to eliminate the problematic
>>>> pci_get_pdev().
>>>
>>> I think I can add a link to a new reference-counted struct with just the
>>> info needed (see the proposed struct above).
>>
>> ... I think having a link from VF to its PF may turn out helpful in the
>> future for other purposes, too.
> 
> Continue to embed in struct pci_dev: okay.
> 
> Link from VF to PF: assuming you mean a link to the PF's
> struct pci_dev *, okay.
> 
> Ensuring the PF's struct pci_dev * won't be de-allocated until the VFs
> are gone: I don't think we want to impose any sort of ordering on
> whether the toolstack removes VFs or PFs first. So, if not reference
> counting (i.e. how many VFs are referring back to the PF), how else
> would we make sure that the PF struct won't be de-allocated until all
> its VFs have gone away?

Have the PF have a linked list of its VFs, and de-allocate the PF struct
only when that list is empty. (When putting in a VF->PF link, I was
taking it as obvious that then we also want a link the other way around,
i.e. a linked list attached to the PF's struct.) For non-PF devices that
list (if we need to instantiate it in all cases in the first place) will
always be empty.

Jan

