Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB86688C683
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 16:14:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698118.1089475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp8UW-0005Ci-Sg; Tue, 26 Mar 2024 15:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698118.1089475; Tue, 26 Mar 2024 15:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp8UW-0005AY-Px; Tue, 26 Mar 2024 15:13:32 +0000
Received: by outflank-mailman (input) for mailman id 698118;
 Tue, 26 Mar 2024 15:13:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NDFk=LA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rp8UV-0005AS-4e
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 15:13:31 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6663218b-eb83-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 16:13:28 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-56bf63af770so1547759a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 08:13:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c15-20020a0564021f8f00b0056bfca6f1c0sm3653022edc.15.2024.03.26.08.13.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 08:13:27 -0700 (PDT)
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
X-Inumbo-ID: 6663218b-eb83-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711466008; x=1712070808; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3PmQ0DJUU4ufZOF32ltaaX6qJTuFLYcOLujM5fW4QJ8=;
        b=gxn9TCFVi16wb5Fx9l4QYWkcUlol4nfiFWgkRsEbUIjfFKEM49BBdA92kkyPoPD+VN
         ZU2tgUAYykwlA2pK24rcCwOll5jI49I6SZjJRBOLZvc5xA/dgAn1uvr/aw17t0ezB6v2
         yk9qmsPr45xXDablO7GpHgASlEGoBbtVu6diNmx2+FeMj/5m/d7d6yTyQvU8mhdikYnz
         wmW+BTz9rZqVafqXNrv6G7wo5tX773p+/BNWFTlvtkRYSAFxbjlfmYPdxiUwPwTKmf8n
         /YKRNTvOlbVK7oDUaIH5bq83sqDwCsNxh0vk4MsU1gcQoRqZfXEKZncAYH1FCZSTGekE
         plPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711466008; x=1712070808;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3PmQ0DJUU4ufZOF32ltaaX6qJTuFLYcOLujM5fW4QJ8=;
        b=w15Rpd417mQrFPSop7wMJr5M4h8nkXl3EDCUbWmoKi5DoqJqQJ7I2pbT0dlZrwKeYS
         Pb6Wu8FyXS2AhtvHdM8GOw3AdH4QzakA/7k8Qoycc9rNn49ozMoTGRwpj3RMR/KwARAI
         xy0oyDg4QnyF+RIiPXg3GBmXva8eIwZRAC1vVMtLiPega78gEaJkiiDGEFzJ9ar+9DFI
         jX1ARDEmhZKAnTPPHhLGt6dB6z8x41fDEN+bMGSlfeOHgdamo3RNY8fP82iYJRUzqDea
         LrekJ+M3mm5v6Gjw/jCTMpN1c5bcgEfKVDBzKqP1WSqRgXeQR282VBrvGb+ZV8XR1bOy
         SUxw==
X-Forwarded-Encrypted: i=1; AJvYcCWKGz9pczHFPMwditvXGS6goCBvGE/MCN0+hP0IBYeuNvWoxn6fuE1dLHBXxHYUGLnlyEpdQevpV/02Z3JIBs5vnHN+1QTGiO9NuAHzYBU=
X-Gm-Message-State: AOJu0YwTmAxKQMJHI/7r6drmBOvhPenc1JIgmnSHFblJbSiiVNqw3+0k
	TYvb8P1sA9t1IGSlr6FG7rYeRbIMZ1XjEJ/PPDNiYeEa79GA+Wx2d3/62gm/9Q==
X-Google-Smtp-Source: AGHT+IE3ExsgPiOr8VzO6XpF5zPttfq8GeYBorVOip47Al9AQcVh2R9+3ieqKMXz9ajoyVmcdBLeiA==
X-Received: by 2002:a50:9510:0:b0:56b:d21f:2790 with SMTP id u16-20020a509510000000b0056bd21f2790mr87354eda.41.1711466008280;
        Tue, 26 Mar 2024 08:13:28 -0700 (PDT)
Message-ID: <465034fd-d2bc-4fe1-8c04-bdb1d60bfafc@suse.com>
Date: Tue, 26 Mar 2024 16:13:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 09/11] x86/msi: address violation of MISRA C Rule 20.7
 and coding style
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, xen-devel@lists.xenproject.org
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
 <c924aa0d5b3b6adbb24cc638f739173cbc41862c.1711118582.git.nicola.vetrini@bugseng.com>
 <f2d393e9-6b70-4998-9d85-e070d6bba556@suse.com>
 <e323ec0362a6b4b1811f2119a33b08f4@bugseng.com>
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
In-Reply-To: <e323ec0362a6b4b1811f2119a33b08f4@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2024 15:30, Nicola Vetrini wrote:
> On 2024-03-26 11:05, Jan Beulich wrote:
>> On 22.03.2024 17:01, Nicola Vetrini wrote:
>>> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
>>> of macro parameters shall be enclosed in parentheses". Therefore, some
>>> macro definitions should gain additional parentheses to ensure that 
>>> all
>>> current and future users will be safe with respect to expansions that
>>> can possibly alter the semantics of the passed-in macro parameter.
>>>
>>> While at it, the style of these macros has been somewhat uniformed.
>>
>> Hmm, yes, but they then still leave more to be desired. I guess I can 
>> see
>> though why you don't want to e.g. ...
>>
>>> --- a/xen/arch/x86/include/asm/msi.h
>>> +++ b/xen/arch/x86/include/asm/msi.h
>>> @@ -147,33 +147,34 @@ int msi_free_irq(struct msi_desc *entry);
>>>   */
>>>  #define NR_HP_RESERVED_VECTORS 	20
>>>
>>> -#define msi_control_reg(base)		(base + PCI_MSI_FLAGS)
>>> -#define msi_lower_address_reg(base)	(base + PCI_MSI_ADDRESS_LO)
>>> -#define msi_upper_address_reg(base)	(base + PCI_MSI_ADDRESS_HI)
>>> -#define msi_data_reg(base, is64bit)	\
>>> -	( (is64bit == 1) ? base+PCI_MSI_DATA_64 : base+PCI_MSI_DATA_32 )
>>> -#define msi_mask_bits_reg(base, is64bit) \
>>> -	( (is64bit == 1) ? base+PCI_MSI_MASK_BIT : base+PCI_MSI_MASK_BIT-4)
>>> +#define msi_control_reg(base)        ((base) + PCI_MSI_FLAGS)
>>> +#define msi_lower_address_reg(base)  ((base) + PCI_MSI_ADDRESS_LO)
>>> +#define msi_upper_address_reg(base)  ((base) + PCI_MSI_ADDRESS_HI)
>>> +#define msi_data_reg(base, is64bit) \
>>> +    (((is64bit) == 1) ? (base) + PCI_MSI_DATA_64 : (base) + 
>>> PCI_MSI_DATA_32)
>>> +#define msi_mask_bits_reg(base, is64bit)                \
>>> +    (((is64bit) == 1) ? (base) + PCI_MSI_MASK_BIT       \
>>> +                      : (base) + PCI_MSI_MASK_BIT - 4)
>>
>> ... drop the bogus == 1 in these two, making them similar to ...
>>
>>>  #define msi_pending_bits_reg(base, is64bit) \
>>> -	((base) + PCI_MSI_MASK_BIT + ((is64bit) ? 4 : 0))
>>> -#define msi_disable(control)		control &= ~PCI_MSI_FLAGS_ENABLE
>>> +    ((base) + PCI_MSI_MASK_BIT + ((is64bit) ? 4 : 0))
>>
>> ... this.
>>
>>> +#define msi_disable(control) (control) &= ~PCI_MSI_FLAGS_ENABLE
>>
>> Doesn't this need an outer pair of parentheses, too?
>>
> 
> Not necessarily.

And use of msi_disable() in another expression would then likely not do
what's expected?

> I'm in favour of a consistent style to be converted in. 
> This also applies below.

I'm all for consistency; I just don't know what you want to be consistent
with, here.

>>>  #define multi_msi_capable(control) \
>>> -	(1 << ((control & PCI_MSI_FLAGS_QMASK) >> 1))
>>> +    (1 << (((control) & PCI_MSI_FLAGS_QMASK) >> 1))
>>>  #define multi_msi_enable(control, num) \
>>> -	control |= (((fls(num) - 1) << 4) & PCI_MSI_FLAGS_QSIZE);
>>> -#define is_64bit_address(control)	(!!(control & PCI_MSI_FLAGS_64BIT))
>>> -#define is_mask_bit_support(control)	(!!(control & 
>>> PCI_MSI_FLAGS_MASKBIT))
>>> +    (control) |= (((fls(num) - 1) << 4) & PCI_MSI_FLAGS_QSIZE);
>>
>> And this, together with dropping the bogus semicolon?
>>
> 
> I'll drop the semicolon.
> 
>> There also look to be cases where MASK_EXTR() / MASK_INSR() would want 
>> using,
>> in favor of using open-coded numbers.
> 
> Yes, perhaps. However, the risk that I make some mistakes in doing so 
> are quite high, though.

Right, hence how I started my earlier reply. Question is - do we want to
go just half the way here, or would we better tidy things all in one go?
In the latter case I could see about getting to that (whether to take
your patch as basis or instead do it from scratch isn't quite clear to
me at this point).

Jan

