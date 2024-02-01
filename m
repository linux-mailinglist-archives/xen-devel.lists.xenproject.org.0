Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A1D84527E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 09:16:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674240.1049058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVSDv-0008RX-9K; Thu, 01 Feb 2024 08:15:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674240.1049058; Thu, 01 Feb 2024 08:15:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVSDv-0008Ou-6C; Thu, 01 Feb 2024 08:15:03 +0000
Received: by outflank-mailman (input) for mailman id 674240;
 Thu, 01 Feb 2024 08:15:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFwQ=JK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rVSDt-0008Oo-EI
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 08:15:01 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa7cb8c8-c0d9-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 09:14:54 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40ef64d8955so5840325e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 00:14:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bj26-20020a0560001e1a00b0033ae6530969sm12754030wrb.85.2024.02.01.00.14.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 00:14:54 -0800 (PST)
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
X-Inumbo-ID: fa7cb8c8-c0d9-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706775294; x=1707380094; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uXX6851uCjtiZLhZz0jMQytjWVPIVDPo0oUudLzGlF4=;
        b=HGFbnaYFM2/SoDxApgOSazElODc2mdLTO6gu/W8FGrRvkrF9UqywRI3rqxHNkpb7e7
         bpa+u8o/ct+nTOdMXi5Huyn8Ix1Dax+9pWGIcnKL5tZtXN7qSRDBLLvGeltFsWemGgIw
         C9yaTSeuLihcBZW+XsNxVdMcBEe34o9pVd93Yt5ieJfRQqiygaplHk6wZSDdKzsWJxgR
         9i2l8aoPz4IeQyBsCnOCaOTITypkrjhFQz1BaF7oGyW8mVcuTBRPYRcFdb6m9T/tT6DO
         1uBSBwAR8M7yAhJ0M1DZ7WOaaDTNpWtHcAmkMh4yLhRFbZKfp8mLrXptrtO/F4kPj1Sg
         r8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706775294; x=1707380094;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uXX6851uCjtiZLhZz0jMQytjWVPIVDPo0oUudLzGlF4=;
        b=dONfjgOhxjArdyKd323HNa8mZR4RuncVvdmfOH1V4gObiK03IUwrLvF3Lm73GMYreH
         C0gtEyAcrdyAn6/c1CCstwsGGJg96mtarTcrPwbuqFNE/fCBIJ7q5IINtTkFqJHHtmN3
         pENBOmXTlLqQW5dq54wWf6vv7hcvI3JSgyzrDf52aEUycjL889FLcQLth+wVlrNSEIrk
         MshujEFNrBGtO0FagieT9d9KhHSZDj9Au5nHIhqLWm0KEwDwfCGJFap6oRInhebfNlQh
         EjtPSBMeK0gEn7TtKevcx/BAbRaTBT8S/NtfQHn3vBvln5Yi0K6suO48zc1m/ZMy3X5n
         RxbA==
X-Gm-Message-State: AOJu0Yyc97C21UXRfYoESoTDliRnnCedT2ruL98gRwW6BeRmGuWxo1x8
	oCyiP6TnlxUgM2S1aEWi+5956l547tAb8ashvjDclB+/fLZY1j+4mqpUfLgFew==
X-Google-Smtp-Source: AGHT+IEkjzxS2zne3m7X6CWeM1TzwLvKuAUxIIpsXH4W91koqNYL/oKEce9niECpnSm7Ha9IyULh2w==
X-Received: by 2002:a05:600c:2943:b0:40f:b456:6877 with SMTP id n3-20020a05600c294300b0040fb4566877mr3106061wmd.18.1706775294283;
        Thu, 01 Feb 2024 00:14:54 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUNg7/nooxIE2+n8r7M2gx0v35/gSb2/6HKOA2x+aPjot/a+czV56G/YcuDy3Y1R5MhjEsIgncVkuM0SseNv73Mo4YtxLX4AtChf+x8fbhBuY8YJg35bbojzmWs2KaCPiXYwjVbLo1SkVnITW9LQru8P5fNII4c1Eq2bYckZwXyZ9Wuds1Vb34AINRE1ORoKcA/dHXtVxz81ddWNN68KDaOwGysrodv7d2nPkP/m9UXy+Gxgu3eU/oN1APyW9p2KHQ6QIIKnPefhYvYzboQ+PxXnnis/6b+6a3evNPMOpgEBAGSPWjD95l7xQ==
Message-ID: <86b25777-788c-4b9a-8166-a6f8174bedc9@suse.com>
Date: Thu, 1 Feb 2024 09:14:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 10/15] vpci/header: emulate PCI_COMMAND register for
 guests
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-11-stewart.hildebrand@amd.com>
 <50e79338-b2fd-40e9-b754-4e725e27ceb3@suse.com>
 <48a16cb3-9cb9-4b7d-a950-f190a9a64bc2@amd.com>
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
In-Reply-To: <48a16cb3-9cb9-4b7d-a950-f190a9a64bc2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.02.2024 05:50, Stewart Hildebrand wrote:
> On 1/25/24 10:43, Jan Beulich wrote:
>> On 09.01.2024 22:51, Stewart Hildebrand wrote:
>>> --- a/xen/drivers/vpci/header.c
>>> +++ b/xen/drivers/vpci/header.c
>>> @@ -168,6 +168,9 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>>>      if ( !rom_only )
>>>      {
>>>          pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
>>> +        /* Show DomU that we updated P2M */
>>> +        header->guest_cmd &= ~PCI_COMMAND_MEMORY;
>>> +        header->guest_cmd |= cmd & PCI_COMMAND_MEMORY;
>>>          header->bars_mapped = map;
>>>      }
>>
>> I don't follow what the comment means to say. The bit in question has no
>> real connection to the P2M, and the guest also may have no notion of the
>> underlying hypervisor's internals. Likely connected to ...
> 
> Indeed. If the comment survives to v13, I'll update it to:
> 
>         /* Now that we updated P2M, show DomU change to PCI_COMMAND_MEMORY */
> 
>>
>>> @@ -524,9 +527,26 @@ static void cf_check cmd_write(
>>>  {
>>>      struct vpci_header *header = data;
>>>  
>>> +    if ( !is_hardware_domain(pdev->domain) )
>>> +    {
>>> +        const struct vpci *vpci = pdev->vpci;
>>> +
>>> +        if ( (vpci->msi && vpci->msi->enabled) ||
>>> +             (vpci->msix && vpci->msix->enabled) )
>>> +            cmd |= PCI_COMMAND_INTX_DISABLE;
>>> +
>>> +        /*
>>> +         * Do not show change to PCI_COMMAND_MEMORY bit until we finish
>>> +         * modifying P2M mappings.
>>> +         */
>>> +        header->guest_cmd = (cmd & ~PCI_COMMAND_MEMORY) |
>>> +                            (header->guest_cmd & PCI_COMMAND_MEMORY);
>>> +    }
>>
>> ... the comment here, but then shouldn't it be that the guest can't even
>> issue a 2nd cfg space access until the present write has been carried out?
>> Otherwise I'd be inclined to claim that such a partial update is unlikely
>> to be spec-conformant.
> 
> Due to the raise_softirq() call added in
> 
>   3e568fa9e19c ("vpci: fix deferral of long operations")
> 
> my current understanding is: when the guest toggles memory decoding, the guest vcpu doesn't resume execution until vpci_process_pending() and modify_decoding() have finished. So I think the guest should see a consistent state of the register, unless it was trying to read from a different vcpu than the one doing the writing.
> 
> Regardless, if the guest did have an opportunity to successfully read the partially updated state of the register, I'm not really spotting what part of the spec that would be a violation of. PCIe 6.1 has this description regarding the bit: "When this bit is Set" and "When this bit is Clear" the device will decode (or not) memory accesses. The spec doesn't seem to distinguish whether the host or the device itself is the one to set/clear the bit. One might even try to argue the opposite: allowing the bit to be toggled before the device reflects the change would be a violation of spec. Since the spec is ambiguous in this regard, I don't think either argument is particularly strong.
> 
> Chesterton's fence: the logic for deferring the update of PCI_COMMAND_MEMORY in guest_cmd was added between v10 and v11 of this series. I went back to look at the review comments on v10 [1], but the rationale is still not entirely clear to me.

Indeed. The only sentence possibly hinting in such a direction would imo
have been "I'm kind of unsure whether we want to fake the guest view by
returning what the guest writes." It's unclear to me whether it really
was meant that way.

> At the end of the day, with the information I have at hand, I suspect it would be fine either way (whether updating guest_cmd is deferred or not). If no other info comes to light, I'm leaning toward not deferring because it would be simpler to update the bit right away in cmd_write().

I'm not sure it would be fine either way. Config space writes aren't
posted writes, so they complete synchronously. IOW whatever internal
state updates are needed in the device, they ought to have finished by
the time the write completes.

> [1] https://lore.kernel.org/xen-devel/ZVy73iJ3E8nJHvgf@macbook.local/
> 
>>[...]
>>> --- a/xen/drivers/vpci/msix.c
>>> +++ b/xen/drivers/vpci/msix.c
>>> @@ -135,6 +135,13 @@ static void cf_check control_write(
>>>          }
>>>      }
>>>  
>>> +    /* Make sure domU doesn't enable INTx while enabling MSI-X. */
>>> +    if ( new_enabled && !msix->enabled && !is_hardware_domain(pdev->domain) )
>>> +    {
>>> +        pci_intx(pdev, false);
>>> +        pdev->vpci->header.guest_cmd |= PCI_COMMAND_INTX_DISABLE;
>>> +    }
>>
>> ... the similar code here has it.
>>
>> In both cases, is it really appropriate to set the bit in guest view?
> 
> I added this based on Roger's comment at [2]. Roger, what do you think? I don't believe QEMU updates the guest view in this manner.
> 
> [2] https://lore.kernel.org/xen-devel/ZLqI65gmNj1XDBm4@MacBook-Air-de-Roger.local/

Leaving this for Roger to answer.

Jan

