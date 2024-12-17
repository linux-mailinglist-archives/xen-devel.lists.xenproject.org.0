Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6D49F4996
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 12:08:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858760.1270997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNVQr-0001La-Va; Tue, 17 Dec 2024 11:08:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858760.1270997; Tue, 17 Dec 2024 11:08:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNVQr-0001Jg-Sf; Tue, 17 Dec 2024 11:08:05 +0000
Received: by outflank-mailman (input) for mailman id 858760;
 Tue, 17 Dec 2024 11:08:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNVQq-0001Ja-Qq
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 11:08:04 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f911a67-bc67-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 12:08:03 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43635796b48so19994085e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 03:08:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4364a3766dcsm13976725e9.0.2024.12.17.03.08.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 03:08:02 -0800 (PST)
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
X-Inumbo-ID: 2f911a67-bc67-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734433683; x=1735038483; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aT837i9CTDsu4vXWGQ+YP+stEq6MU1gGGCS+6o36ZJY=;
        b=IXFqC3/ZG6fqAPqwgu86WB34KvhgQQhKSyHQIkKLzSsqGtofEY6yCAhTkxhGXCqVin
         jhvosEISD/N7YprUGk14Xwjw1oLdBTsquddQmIpXaAiKjssKZ6XairsBVIYC6jH5qX7/
         hf9YJd7NITY18TXpzY5SYgZlufi1nuxkFfqMd2uRMFTwCIXD0qMEWZ6IRy9RAoUbe98T
         DrUQs4C7QeAwlqD6mqa5yCRzZhhUZVY3GF87y6ciPSiZQPZ6T7Iyvz+ydVCmOvOONVnh
         CjG+F7or9aelZRz4+DSQhanIdESoVrAk3G8ehv2doWlUbWmw1hjZ3nObEmz9x48BOjsx
         B9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734433683; x=1735038483;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aT837i9CTDsu4vXWGQ+YP+stEq6MU1gGGCS+6o36ZJY=;
        b=BNhiU57BmF7+eeTPEGsNC7VnewrVwZPsCboo46sYTuPlPDtBzQJnD6o63dbcoVz6cG
         n9Y/YPLVcGe7HbOYj3uR6J7Tz6h9XIs/M+1jbgZRh7fk32tljf10mXm40xB1CXjgW5Sz
         2TFuc7YKsprYW/+Haflp3Dt2pGJU0hIwwnQb26z7PCQy0enNp5z0a5cnomYGN7+qu6pp
         xeqtT2Md7Iy7t6k+FoCRdZb4gL3Q5zHFjiFECMWSv1rodkyDUbkK64gW1gjWuGcbtJ34
         34eoTxFyEyP8Ovy3t7SuPqp6cQTnBf9LNH+T6WsPByU9i9m/9VXcE3WvT6Zz5x0VqyGf
         ifKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRHRDwB2lQYDr+ljcGqXeejOyJYENUSza4mfeyxUHClD0wFoDgBSoL7dCNRgo6vYCN5Jw4C/TIr6Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmjpUgDOXfSPhQ5shaoOXZzCp9mv7rD39B+9ZVv2OBKV+zLS1x
	ILSZ182Tv9JRMPUtR6DZ1d886x9JS8zp3YxUB2bmkWZ3Z6E7Nf3NjfBBBuN/Pg==
X-Gm-Gg: ASbGncuKKSSOETY/bFviT+XLXGsdoi68KTpQxVDaWqxsrYBej3POegtoAz/mXisqA6b
	v97jmUE8x4x/XUt53q2BhgnQF61EhCQ11OD0IcVY2fowESGvpTgY5p5/CUvSKqLTJC8mPe7sEeU
	vFDOxW19p5BlU/FDVykBBFxcce3NTomHF69cotDDXcQQuvtqm9sAh4fXvaREEQmtVvmiDikzlbD
	8Ojpabf5cTNhSan2wEaxlimKHlRI67f4OlJZSBWNoDV2g979GPLfW1/l4vFOkY6iQc+Og+dNu6f
	ASId5gKGgO6hVsmVgX8pxmsAhEqzpHXoBLms8eKI1g==
X-Google-Smtp-Source: AGHT+IE7jmbJSsP9W2pZUzn8o5fWJjEBViOWYKn1w2CJfy9QBTBLEdfuB8jWrAMfncHwF5Px/0NaBQ==
X-Received: by 2002:a05:600c:4709:b0:435:1a2:262a with SMTP id 5b1f17b1804b1-43648131464mr25587625e9.3.1734433683199;
        Tue, 17 Dec 2024 03:08:03 -0800 (PST)
Message-ID: <542d963e-3fb6-45de-904c-4c1e17cc0f3d@suse.com>
Date: Tue, 17 Dec 2024 12:08:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] xen/riscv: implement data and instruction cache
 operations
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1733937787.git.oleksii.kurochko@gmail.com>
 <bb6191b21bd387f265e0e25322a30f4ade6e8b3b.1733937787.git.oleksii.kurochko@gmail.com>
 <19c9ef65-a5bd-4d81-89dc-c780d3ead8b8@suse.com>
 <1c8c888e-bf59-4b4d-a3a5-cd2c0c7b6565@gmail.com>
 <3579b3ca-3634-4537-8981-fd68c60d5c6a@suse.com>
 <a3046737-2414-4862-a75b-ed0e2080df22@gmail.com>
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
In-Reply-To: <a3046737-2414-4862-a75b-ed0e2080df22@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.12.2024 11:37, Oleksii Kurochko wrote:
> 
> On 12/17/24 9:32 AM, Jan Beulich wrote:
>> On 16.12.2024 18:40, Oleksii Kurochko wrote:
>>> On 12/16/24 3:23 PM, Jan Beulich wrote:
>>>> On 11.12.2024 18:27, Oleksii Kurochko wrote:
>>>>> --- a/xen/arch/riscv/include/asm/page.h
>>>>> +++ b/xen/arch/riscv/include/asm/page.h
>>>>> @@ -7,6 +7,7 @@
>>>>>    
>>>>>    #include <xen/bug.h>
>>>>>    #include <xen/const.h>
>>>>> +#include <xen/errno.h>
>>>>>    #include <xen/types.h>
>>>>>    
>>>>>    #include <asm/atomic.h>
>>>>> @@ -148,9 +149,27 @@ static inline bool pte_is_mapping(pte_t p)
>>>>>        return (p.pte & PTE_VALID) && (p.pte & PTE_ACCESS_MASK);
>>>>>    }
>>>>>    
>>>>> +static inline int clean_and_invalidate_dcache_va_range(const void *p, unsigned long size)
>>>>> +{
>>>>> +#ifdef CONFIG_QEMU
>>>>> +    return 0;
>>>>> +#else
>>>>> +    return -EOPNOTSUPP;
>>>>> +#endif
>>>>> +}
>>>>> +
>>>>> +static inline int clean_dcache_va_range(const void *p, unsigned long size)
>>>>> +{
>>>>> +#ifdef CONFIG_QEMU
>>>>> +    return 0;
>>>>> +#else
>>>>> +    return -EOPNOTSUPP;
>>>>> +#endif
>>>>> +}
>>>> So testing on real hardware will then effectively become impossible, until
>>>> someone goes and implements these?
>>> Yes...
>>>
>>> I am not sure what better we can do. It seems like it will be the best one to check if CMO
>>> extensions is supported and use instructions for this extensions to implement these functions as they
>>> are in the specification and not expected to be changed.
>> Yes, using CMO when available is certainly the route to go. The main
>> question there is what the behavior ought to be when CMO is unavailable.
> 
> If CMO ( or SoC specific extension for cache operation ) isn't available then IMO it means that memory is
> coherent and nothing specific should be done in the mentioned above functions what means returning 0 should
> be fine.

Hmm, imo that would be a pretty bold assumption.

Jan

