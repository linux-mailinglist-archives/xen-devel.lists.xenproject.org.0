Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C91819A27
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 09:10:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657412.1026212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFreP-0000dH-4p; Wed, 20 Dec 2023 08:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657412.1026212; Wed, 20 Dec 2023 08:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFreP-0000aS-1B; Wed, 20 Dec 2023 08:09:57 +0000
Received: by outflank-mailman (input) for mailman id 657412;
 Wed, 20 Dec 2023 08:09:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFreN-0000aC-KS
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 08:09:55 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2760900f-9f0f-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 09:09:53 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3367601a301so1189006f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 00:09:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g18-20020a05600c311200b0040d2524270asm6212348wmo.8.2023.12.20.00.09.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 00:09:52 -0800 (PST)
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
X-Inumbo-ID: 2760900f-9f0f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703059792; x=1703664592; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h7167CD9+DlpsTqr3/feLcbfa2I53LXhs+HmHgFcvLA=;
        b=XTfqkqoaG+ZT+QmUfq6eK4CxY1Ah6/02l27VKIdfy6/u2JnCA44ASber1+0ydVwuPq
         r0mmWZYPccnrA/dbU8YPWg35sOccWhw0jMXWw7nyQAvV/GOSebQLecuCX7OVNvdYTa8I
         Hg+0fo5nZXvNchDdGLtI/sXUsNTKhezLJ75laomy58Qoiu4iCn/Ba95/zyIMM3uXnzN9
         wscQRAu2GM7S1blHIybJxF6ibDHzDG1KCqsuVT9szJ99lObMW3v+s72Aihh328E5Jqwg
         HyWnvLtUM5HPCS3YYDQu3dncccDxw4vv1//QKPG7nvGmrg82hWb/tm47q5SybGbNKU87
         g5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703059792; x=1703664592;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h7167CD9+DlpsTqr3/feLcbfa2I53LXhs+HmHgFcvLA=;
        b=UcS/vcOTg2NyBUrw2zwv3vPD7m0urmbLI86uWzBHJvEiG8aqYWCokq1DeYOpPalYFs
         /fSfVtezD8IeyT7Lc8fiPg1z+wT/LjacnPFBKs/XyBTSAo5XAiDjfvEhc7XUipMw2jXy
         pRChRHW8TQA0wJNYXY/1vFoQWQ7UZ/eyyQ40b+UmP/my84d8Ll+BZpgL9uXqyB+5+z6S
         1W+rFEdmn5EyE89EKpdTGkRK/ZagLZ9GrH6Xcyv5aLazUDYoGcRQ6U0g5A05SgD8WyO0
         mD8cvZAXOihRxP8/28QMfLcH1gs2/buMvaj5fZuM2t2j3RbJrXrYejwmHcOm9Pf1TsBB
         l8sA==
X-Gm-Message-State: AOJu0Yy3g3vbCMbVhX2wTkUAGFV5ect8CTDX3a1mngE8Gd8Ft2PUtP+R
	RXbTsNIlsm+ophH/XQQElN1J
X-Google-Smtp-Source: AGHT+IEKOx65rDuDmGPN078pq/z+vtriuEGrj9STsNrVgsz9iElfuYnhHh1p3C4UlniU7URgO7vyOQ==
X-Received: by 2002:a05:600c:520d:b0:40d:3376:d87c with SMTP id fb13-20020a05600c520d00b0040d3376d87cmr257682wmb.119.1703059792412;
        Wed, 20 Dec 2023 00:09:52 -0800 (PST)
Message-ID: <69c5afde-3a24-4792-b4e5-3ce17cb1602d@suse.com>
Date: Wed, 20 Dec 2023 09:09:51 +0100
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
In-Reply-To: <5fc9ad7a-1281-46da-abff-0aa2d2beca14@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.12.2023 19:29, Julien Grall wrote:
> On 19/12/2023 17:03, Jan Beulich wrote:
>> On 15.12.2023 03:43, Shawn Anastasio wrote:
>>> --- a/xen/arch/arm/bootfdt.c
>>> +++ b/xen/common/device-tree/bootfdt.c
>>> @@ -431,12 +431,15 @@ static int __init early_scan_node(const void *fdt,
>>>   {
>>>       int rc = 0;
>>>   
>>> -    /*
>>> -     * If Xen has been booted via UEFI, the memory banks are
>>> -     * populated. So we should skip the parsing.
>>> -     */
>>> -    if ( !efi_enabled(EFI_BOOT) &&
>>> -         device_tree_node_matches(fdt, node, "memory") )
>>> +    if ( device_tree_node_matches(fdt, node, "memory") )
>>> +#if defined(CONFIG_ARM_EFI)
>>> +        /*
>>> +         * If Xen has been booted via UEFI, the memory banks are
>>> +         * populated. So we should skip the parsing.
>>> +         */
>>> +        if ( efi_enabled(EFI_BOOT) )
>>> +            return rc;
>>> +#endif
>>
>> I'm not a DT maintainer, but I don't like this kind of #ifdef, the more
>> that maybe PPC and quite likely RISC-V are likely to also want to support
>> EFI boot. But of course there may be something inherently Arm-specific
>> here that I'm unaware of.
> 
> Right now, I can't think how this is Arm specific. If you are using 
> UEFI, then you are expected to use the UEFI memory map rather than the 
> content of the device-tree.
> 
> However, we don't have a CONFIG_EFI option. It would be nice to 
> introduce one but I am not sure I would introduce it just for this #ifdef.

Right, hence why I also wasn't suggesting to go that route right away.
efi/common-stub.c already has a stub for efi_enabled(). Using that file
may be too involved to arrange for in PPC, but supplying such a stub
elsewhere for the time being looks like it wouldn't too much effort
(and would eliminate the need for any #ifdef here afaict). Shawn?

Jan

