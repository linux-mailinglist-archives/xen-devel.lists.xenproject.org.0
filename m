Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA08281AF30
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 08:11:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658506.1027688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGDDL-0003iT-04; Thu, 21 Dec 2023 07:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658506.1027688; Thu, 21 Dec 2023 07:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGDDK-0003gD-Tg; Thu, 21 Dec 2023 07:11:26 +0000
Received: by outflank-mailman (input) for mailman id 658506;
 Thu, 21 Dec 2023 07:11:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vttA=IA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rGDDK-0003g7-Bk
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 07:11:26 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26f3166d-9fd0-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 08:11:25 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3368b1e056eso90071f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 23:11:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x4-20020a5d54c4000000b0033662c2820bsm1268407wrv.117.2023.12.20.23.11.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 23:11:24 -0800 (PST)
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
X-Inumbo-ID: 26f3166d-9fd0-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703142684; x=1703747484; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RPOsWaj+47t4H4801G/mQ9O7tkUE4RRPfORW0Ow1G/4=;
        b=QZo7z8l7b1Z4TpoxS1BT9nKmGLGf0fGM+dK1oEM7JNKHXJ04/JohujbmZpHcQ+MtzQ
         N7pm7JIcpFvYwdRKRYq0l/heGYvF2X6hivD1NxeF+Fjj/6ELh7O0JmJu2tH3V8NHY1Yu
         TW/bDyHU/+EfGxlyjVPVHdkOezlFubpHDUbdNmwy73oSLOBPSbXzzDdE50bhUk9d+xM8
         x4MZJsiYEZLhqAMGeWqkCvTOcTbm07rfEUL5nwouBW11o7Jdor0vyA2Rhj9fE8csjuP3
         UpRUpSJRbN1P188rT2Lci5RxthzWMKljloOdvHb7WwtPrMZJRQMq23UFSAawuVUuRiJ6
         LYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703142684; x=1703747484;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RPOsWaj+47t4H4801G/mQ9O7tkUE4RRPfORW0Ow1G/4=;
        b=TfoVigEx0JIfIZg7AeUbZHr9ZPwxthL/yJOT1knuZ3JxxeElesNcxpnv3LoprUghL+
         /CsMtSLO7GHxoKBlBn2zl0eLdrKg6v8yQ7//5ZHGtHaVd7XXxo7CyPWwJVFmZlLEqJr6
         MudXTH/ad/OuZpPJg5o1sUZ/ii+glnMSgYrrv2KFAb4XZ4ROwKNLwBhbWbjv5j2rRIXq
         jFsYxARmw2lxJsEfTU9qJe2Wd3BTDRqv4oa/DG1tlMYtERHvj4kootBmufdrcst+nEQQ
         hZPs3dnECJBQ+HUOzI69i4wlDGOefo7zdiMaVMiELPUbx/Bmm7jN1DCeHRXVu+fOzui+
         fBlA==
X-Gm-Message-State: AOJu0Yyk/ATAhLWwtxQxiFQh2P82qY8Si+lX+zX5mtmFJC1MHXDNQKPY
	BEb8+YIvCZx/vVNBhmkgzVo5
X-Google-Smtp-Source: AGHT+IFMe6SeNeGwRvvzOWOJd3lWUA+3AbszC0FRiKeuVQBKoEN7+p8crkP7gxvdEBwvPcy9/VA6wA==
X-Received: by 2002:a5d:6b51:0:b0:336:7f3c:5b08 with SMTP id x17-20020a5d6b51000000b003367f3c5b08mr399789wrw.50.1703142684685;
        Wed, 20 Dec 2023 23:11:24 -0800 (PST)
Message-ID: <95d03d68-23e3-4c22-8eae-44abe0e353e4@suse.com>
Date: Thu, 21 Dec 2023 08:11:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] xen/common: Move Arm's bootfdt to common
Content-Language: en-US
To: Julien Grall <julien@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
 <b26a07209b54cd036e42a8b00f036201821eb775.1702607884.git.sanastasio@raptorengineering.com>
 <3546ec55-3e0c-4fdc-9697-0105d20bacfd@suse.com>
 <5fc9ad7a-1281-46da-abff-0aa2d2beca14@xen.org>
 <69c5afde-3a24-4792-b4e5-3ce17cb1602d@suse.com>
 <cb2f543b-ef29-4174-8437-dc875c27daab@raptorengineering.com>
 <7a228bc8-7c2f-46fa-9ee6-5266f65e767b@xen.org>
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
In-Reply-To: <7a228bc8-7c2f-46fa-9ee6-5266f65e767b@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.12.2023 23:08, Julien Grall wrote:
> Hi,
> 
> On 20/12/2023 20:58, Shawn Anastasio wrote:
>> On 12/20/23 2:09 AM, Jan Beulich wrote:
>>> On 19.12.2023 19:29, Julien Grall wrote:
>>>> On 19/12/2023 17:03, Jan Beulich wrote:
>>>>> On 15.12.2023 03:43, Shawn Anastasio wrote:
>>>>>> --- a/xen/arch/arm/bootfdt.c
>>>>>> +++ b/xen/common/device-tree/bootfdt.c
>>>>>> @@ -431,12 +431,15 @@ static int __init early_scan_node(const void *fdt,
>>>>>>    {
>>>>>>        int rc = 0;
>>>>>>    
>>>>>> -    /*
>>>>>> -     * If Xen has been booted via UEFI, the memory banks are
>>>>>> -     * populated. So we should skip the parsing.
>>>>>> -     */
>>>>>> -    if ( !efi_enabled(EFI_BOOT) &&
>>>>>> -         device_tree_node_matches(fdt, node, "memory") )
>>>>>> +    if ( device_tree_node_matches(fdt, node, "memory") )
>>>>>> +#if defined(CONFIG_ARM_EFI)
>>>>>> +        /*
>>>>>> +         * If Xen has been booted via UEFI, the memory banks are
>>>>>> +         * populated. So we should skip the parsing.
>>>>>> +         */
>>>>>> +        if ( efi_enabled(EFI_BOOT) )
>>>>>> +            return rc;
>>>>>> +#endif
>>>>>
>>>>> I'm not a DT maintainer, but I don't like this kind of #ifdef, the more
>>>>> that maybe PPC and quite likely RISC-V are likely to also want to support
>>>>> EFI boot. But of course there may be something inherently Arm-specific
>>>>> here that I'm unaware of.
>>>>
>>>> Right now, I can't think how this is Arm specific. If you are using
>>>> UEFI, then you are expected to use the UEFI memory map rather than the
>>>> content of the device-tree.
>>>>
>>>> However, we don't have a CONFIG_EFI option. It would be nice to
>>>> introduce one but I am not sure I would introduce it just for this #ifdef.
>>>
>>> Right, hence why I also wasn't suggesting to go that route right away.
>>> efi/common-stub.c already has a stub for efi_enabled(). Using that file
>>> may be too involved to arrange for in PPC, but supplying such a stub
>>> elsewhere for the time being looks like it wouldn't too much effort
>>> (and would eliminate the need for any #ifdef here afaict). Shawn?
>>>
>>
>> To clarify, you're suggesting we add an efi_enabled stub somewhere in
>> arch/ppc? I'm not against that, though it does seem a little silly to
>> have to define EFI-specific functions on an architecture that will never
>> support EFI.
> 
> (This is not an argument for adding efi_enabled in arch/ppc)
> 
> I am curious to know why you think that. This is just software and 
> therefore doesn't seem to be technically impossible. I mean who 
> originally thought that ACPI would come to Arm? :) And yet we now have 
> HWs (mainly servers) which provides only ACPI + UEFI.
> 
> And before, I got asked where is the support in Xen. Yes, the work is 
> still on-going :).
> 
> Anyway, back to the original ask, one option would be to introduce 
> efi_enabled stub in an common header. Maybe xen/efi.h?

Right, and having a somewhat odd #ifdef there (covering for the lack of
CONFIG_EFI) would imo be preferable to having it in a random .c file.

Jan

