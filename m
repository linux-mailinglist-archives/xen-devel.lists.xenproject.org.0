Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB888089FB
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 15:15:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649911.1015018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBF9v-0003U7-Gb; Thu, 07 Dec 2023 14:15:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649911.1015018; Thu, 07 Dec 2023 14:15:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBF9v-0003Rh-Ch; Thu, 07 Dec 2023 14:15:23 +0000
Received: by outflank-mailman (input) for mailman id 649911;
 Thu, 07 Dec 2023 14:15:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBF9u-0003Ra-AX
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 14:15:22 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0dfd3f22-950b-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 15:15:20 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3332efd75c9so897042f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 06:15:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c4f4400b0040836519dd9sm1964747wmq.25.2023.12.07.06.15.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 06:15:20 -0800 (PST)
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
X-Inumbo-ID: 0dfd3f22-950b-11ee-98e7-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701958521; x=1702563321; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=89toJf156ywbFwnZY/y11Qh5a63V+be/YhxcYZHTd2U=;
        b=Hz1IU+qbY3ZbTMcbHMeITQni4hxizzpulcpZkjCvXDLQj9J0i6+dIB4u0K5QmpZCUc
         r/3lrFvwF6SytvqCq2TQEMQRkco6t49CXzASh/gBgu2Ok+eSZlpPSLcHKHFoolSUlgHr
         019v1GwH05DaGsWgjNslDL8wQlFlVC1XEEWo/ZFTOWekm8s3vjSy02wal10JzPLj3H4h
         ZW2aVSff7iWe7pz2itF0OyYnqQCrUZ3eglW8XceNXwo5oDONUBfkI/5dBYMqphYpotVx
         YFjg/3xM7AqkM88lnjQ+OZlrtt+wnnQpDnS/qce9wTBl7n2mZws15y5niBW0iTrUyLaL
         hFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701958521; x=1702563321;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=89toJf156ywbFwnZY/y11Qh5a63V+be/YhxcYZHTd2U=;
        b=FGhMDKo3tTwdnUHD4c5fJVxtIesFXyrOKui3dPEXkD73xMSRg9xLRlBvECr9vrzU53
         GwtOCN9oSwpG4XISJ+Kl1x+ErlZZfqrHAcXxGg9abc2MpI6SJmWnbVoGvu/rCF/Au8T/
         0qG7N3arM3X5xauXTtsfjIRPbt8ZUGRdgw1pkg/HvXs7AH60uiSrpixs3qyBYHgeaUI4
         tSWEj7dIuvxeLUM/8WvVdN03KgUvdUnMdWRrbsYE+ZiM6tvbaQz0BU6L5peMQnL75I/H
         8B8uFUy7cPSjr3Bi9zyviy0uiAVO0PMYJSgj82qP3FvvSQubR/vV/+dsuk7qpxjlgRaD
         enpA==
X-Gm-Message-State: AOJu0Yzdh2MjZXmF34vrafjmmhRWoRh85kuU0NIXKERGmyhL7iRTffBS
	hON/uqRWrV2J3+o+Ly3NKQl1
X-Google-Smtp-Source: AGHT+IGsf5+5UzBy6FHL++Dr2qBJL5S5wGMX1sYKjbuN67TMmoHl3KYaAjCbJYHf/k2L13nGKgJZqg==
X-Received: by 2002:a1c:770b:0:b0:40c:2aeb:c750 with SMTP id t11-20020a1c770b000000b0040c2aebc750mr282942wmi.166.1701958520790;
        Thu, 07 Dec 2023 06:15:20 -0800 (PST)
Message-ID: <b96f0697-146f-4230-986f-eb1b097e40fa@suse.com>
Date: Thu, 7 Dec 2023 15:15:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/x86: address violations of MISRA C:2012 Rule 14.4
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1701941924.git.maria.celeste.cesario@bugseng.com>
 <d494980216b8f0f870083fcfae7269f45e779780.1701941924.git.maria.celeste.cesario@bugseng.com>
 <30b48e9b-0630-4df9-ac6b-5ece418bf4b0@suse.com>
 <65db0ca1-9afa-4d9a-8bf2-7b1720ac1f60@bugseng.com>
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
In-Reply-To: <65db0ca1-9afa-4d9a-8bf2-7b1720ac1f60@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.12.2023 14:53, Simone Ballarin wrote:
> On 07/12/23 11:54, Jan Beulich wrote:
>> On 07.12.2023 10:48, Simone Ballarin wrote:
>>> --- a/xen/arch/x86/hpet.c
>>> +++ b/xen/arch/x86/hpet.c
>>> @@ -279,7 +279,7 @@ static int hpet_msi_write(struct hpet_event_channel *ch, struct msi_msg *msg)
>>>   {
>>>       ch->msi.msg = *msg;
>>>   
>>> -    if ( iommu_intremap )
>>> +    if ( iommu_intremap != iommu_intremap_off )
>>>       {
>>>           int rc = iommu_update_ire_from_msi(&ch->msi, msg);
>>>   
>>> @@ -353,7 +353,7 @@ static int __init hpet_setup_msi_irq(struct hpet_event_channel *ch)
>>>       u32 cfg = hpet_read32(HPET_Tn_CFG(ch->idx));
>>>       irq_desc_t *desc = irq_to_desc(ch->msi.irq);
>>>   
>>> -    if ( iommu_intremap )
>>> +    if ( iommu_intremap != iommu_intremap_off )
>>>       {
>>>           ch->msi.hpet_id = hpet_blockid;
>>>           ret = iommu_setup_hpet_msi(&ch->msi);
>>> @@ -372,7 +372,7 @@ static int __init hpet_setup_msi_irq(struct hpet_event_channel *ch)
>>>           ret = __hpet_setup_msi_irq(desc);
>>>       if ( ret < 0 )
>>>       {
>>> -        if ( iommu_intremap )
>>> +        if ( iommu_intremap != iommu_intremap_off )
>>>               iommu_update_ire_from_msi(&ch->msi, NULL);
>>>           return ret;
>>>       }
>>> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
>>> index 7f8e794254..72dce2e4ab 100644
>>> --- a/xen/arch/x86/msi.c
>>> +++ b/xen/arch/x86/msi.c
>>> @@ -189,7 +189,7 @@ static int write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
>>>   {
>>>       entry->msg = *msg;
>>>   
>>> -    if ( iommu_intremap )
>>> +    if ( iommu_intremap != iommu_intremap_off )
>>>       {
>>>           int rc;
>>>   
>>> @@ -555,7 +555,7 @@ int msi_free_irq(struct msi_desc *entry)
>>>               destroy_irq(entry[nr].irq);
>>>   
>>>           /* Free the unused IRTE if intr remap enabled */
>>> -        if ( iommu_intremap )
>>> +        if ( iommu_intremap != iommu_intremap_off )
>>>               iommu_update_ire_from_msi(entry + nr, NULL);
>>>       }
>>>   
>>
>> All of this would logically be part of patch 1. Is there a particular reason
>> why it wasn't done right there?
> 
> These changes and the ones in patch 1 are related, but still remain
> independent. Patch 1 can be accepted without patch 2 and vice versa.
> So we've decided to split the commits because patch 1 is in common
> code, while patch 2 is in x86-specific code.

Just to clarify: While not located under arch/x86/, what patch 1 touches
is still x86-specific code. It's subject prefix also wrongly says
AMD/IOMMU: when it also touches VT-d code. Especially with the changes
here folded in, x86/IOMMU: might be more appropriate.

Jan

